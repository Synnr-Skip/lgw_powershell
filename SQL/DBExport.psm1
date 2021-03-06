﻿Trap {
	$err = $_.Exception
	write-error $err.Message
	while ( $err.InnerException) 
	{
		$err = $err.InnerException
		Write-Error $err.Message
	}
	break;
}

Set-PSDebug -Strict
$ErrorActionPreference = "stop"

$fullPathIncFileName = $MyInvocation.MyCommand.Definition
$currentScriptName = $MyInvocation.MyCommand.Name
$currentExecutingPath = $fullPathIncFileName.Replace($currentScriptName, "")

$MS = "Microsoft.SQLServer"
@('.SMO','.SmoExtended','.ConnectionInfo') | 
ForEach-Object {
	if ([System.Reflection.Assembly]::LoadWithPartialName("$MS$_") -eq $null)
	{
		Throw "missing SMO component $MS$_"
	}
}

$SMO = "$MS.Management.Smo"
$BadChars = '[\\\/\:\.]'

# Scripting Options #
$SO = New-Object ("$SMO.ScriptingOptions")  -Property @{
	DriAllConstraints = $true
	DriAllKeys = $true
	DriClustered = $true
	DriDefaults = $true
	DriIndexes = $true
	DriNonClustered = $true
	DriPrimaryKey = $true
	DriUniqueKeys = $true
	
	AnsiFile = $true
	ClusteredIndexes = $true
	IncludeHeaders = $false
	Indexes = $true
	IncludeIfNotExists = $true
	IncludeDatabaseRoleMemberships = $true
	SchemaQualify = $true
	ScriptBatchTerminator = $true
	Triggers = $true
	ToFileOnly = $true
	XmlIndexes = $true
}

function DBExport
{
	<#
	.SYNOPSIS
	Use this command to create T-SQL scripts for MSSQL databases
	
	.PARAMETER Individual
	Specifies that you will be running a query on only one database
	
	The default input parameter if none is chosen.
	
	.PARAMETER CSV
	Specifies that you will be importing a list of databases from a CSV file
	
	.PARAMETER CSVfile
	A CSV file that contains data in the following format:
	
	ServerName,Database,Login,Password
	SN1,DB1,,
	
	The header names are mandatory.
	
	.PARAMETER Login
	May be blank if you are using Windows Authentication
	
	.PARAMETER Password
	May be blank if you are using Windows Authentication
	
	.PARAMETER OutputDir
	Location of where .sql files should be placed.  
	
	Default is a subdirectory of current working directory.

	.EXAMPLE
	DBExport -Individual -ServerName DBServer -Database DBName
	
	This exports the database DBName from DBServer to a folder in the current working directory using Windows Authentication
	
	.EXAMPLE
	DBExport -Individual -ServerName DBServer -Database DBName -OutputDir c:\temp

	This exports the database DBName from DBServer to a folder under c:\temp using Windows Authentication

	.EXAMPLE
	DBExport -Individual -ServerName DBServer -Database DBName -Login username -Password p@55w0rd
	
	This exports the database DBName from DBServer to a folder in the current working directory using a specified username/password

	.EXAMPLE
	DBExport -CSV -CSVFile dbs.csv
	
	This exports database info from a list of databases/servers in the file dbs.csv, which contains data in the following format:
	
	ServerName,Database,Login,Password
	SN1,DB1,,
	
	The header names are mandatory.
	#>
	[cmdletbinding(DefaultParameterSetName="Individual")]
	Param
	(
		[Parameter(ParameterSetName="CSV", Position=0, Mandatory=$true)]
			[switch]$CSV,
		[Parameter(ParameterSetName="CSV", Position=1, Mandatory=$true, ValueFromPipeline=$True,ValueFromPipelineByPropertyName=$True)]
			[ValidateScript({ Test-Path -Path $_ -PathType Leaf})]
			[String]$CSVfile,
		
		[Parameter(ParameterSetName="Individual", Position=0)]
			[switch]$Individual,
		[Parameter(ParameterSetName="Individual", Position=1, Mandatory=$true, ValueFromPipeline=$True,ValueFromPipelineByPropertyName=$True)]
			[String]$ServerName,
		[Parameter(ParameterSetName="Individual", Position=2, Mandatory=$true, ValueFromPipeline=$True,ValueFromPipelineByPropertyName=$True)]
			[String]$Database,
		[Parameter(ParameterSetName="Individual", Position=3, ValueFromPipeline=$True,ValueFromPipelineByPropertyName=$True)]
			[String]$Login='',
		[Parameter(ParameterSetName="Individual", Position=4, ValueFromPipeline=$True,ValueFromPipelineByPropertyName=$True)]
			[String]$Password='',

		[Parameter(Mandatory=$false)]
			[ValidateScript({ Test-Path -Path $_ -PathType Container})]
			[String]$OutputDir=$currentExecutingPath

	)
	
	switch ($PSCmdlet.ParameterSetName)
	{
		"CSV"
		{
			Import-Csv $CSVfile | foreach {
				DumpInfo -ServerName $_.ServerName -Database $_.Database -Login $_.Login -Password $_.Password -OutputDir $OutputDir
			}
		}
		"Individual"
		{
			DumpInfo -ServerName $ServerName -Database $Database -Login $Login -Password $Password -OutputDir $OutputDir
		}
	}
}

function DumpInfo
{
	param
	(
		[Parameter(Mandatory=$true)]
			[String]$ServerName,
		[Parameter(Mandatory=$true)]
			[String]$Database,
			[String]$Login,
			[String]$Password,
		[Parameter(Mandatory=$true)]
			[String]$OutputDir
			
	)
	
	if ($Login -ne '')
	{
		if ($Password -ne '')
		{
			$secPWD = New-Object -TypeName System.Security.SecureString
			$Password.ToCharArray() | ForEach-Object { $secPWD.AppendChar($_) }
			$Credentials = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $Login,$secPWD
		}
		else
		{
			Throw "Password required for DB: $Database on server: $ServerName with username: $Login"
		}
		$srvConn = New-Object ("$MS.Management.Common.ServerConnection")
			$srvConn.ServerInstance = $ServerName
			$srvConn.LoginSecure = $false
			$srvConn.Login = $Credentials.UserName
			$srvConn.set_SecurePassword($Credentials.Password)
			

		$sqlConn = New-Object ("$SMO.Server") $srvConn
	}
	else
	{
		$sqlConn = New-Object ("$SMO.Server") $ServerName
	}
	
	if ($sqlConn.Version -eq $null)
	{
		Throw "Can't find the instance $ServerName.  Please check the login/password info and all spelling"
	}
	
	$db = $sqlConn.Databases[$Database]
	if ($db.Version -eq $null)
	{
		Throw "Can't find the database $db on $ServerName"
	}

	$SD = "$($OutputDir)\$($sqlConn.DomainInstanceName -replace $BadChars,'-')_$($db.Name)"
	if (![System.IO.Directory]::Exists($SD))
	{
		$null = [System.IO.Directory]::CreateDirectory($SD)
	}
	$SO.FileName = "$SD\Agent.sql"
	
	Try{ $sqlConn.JobServer.Script($SO) }
	Catch {}
	
	@('Tables', 'UserDefinedFunctions', 'Views', 'Users', 'Schemas', 'Roles', 'StoredProcedures', 'ExtendedStoredProcedures') |
		ForEach { $db."$_" } |
			Where-Object {$_.IsSystemObject -eq $false } |
			ForEach { 
				$SO.FileName = "$SD`\$($_.urn.Type)-$($_.Name -replace $BadChars,'-').sql"
				
				$SO.ScriptDrops = $true
				$SO.AppendToFile = $false;
				try { $_.Script($SO) }
				catch { "$_" }
				
				$SO.ScriptDrops = $false
				$SO.AppendToFile = $true;
				try { $_.Script($SO) }
				catch { "$_" }
			}
}

Export-ModuleMember -Function DBExport