# Copyright 2012 Aaron Jensen
# 
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# 
#     http://www.apache.org/licenses/LICENSE-2.0
# 
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

#Requires -Version 3

$CarbonBinDir = Join-Path -Path $PSScriptRoot -ChildPath 'bin' -Resolve

# Active Directory

# COM
$ComRegKeyPath = 'hklm:\software\microsoft\ole'

# Cryptography
Add-Type -AssemblyName 'System.Security'

# FileSystem
Add-Type -Path (Join-Path -Path $PSScriptRoot -ChildPath 'bin\Ionic.Zip.dll' -Resolve)


# IIS
Add-Type -AssemblyName "System.Web"
$microsoftWebAdministrationPath = Join-Path -Path $env:SystemRoot -ChildPath 'system32\inetsrv\Microsoft.Web.Administration.dll'
if( (Test-Path -Path $microsoftWebAdministrationPath -PathType Leaf) )
{
    Add-Type -Path $microsoftWebAdministrationPath
    Add-Type -Path (Join-Path -Path $CarbonBinDir -ChildPath 'Carbon.Iis.dll' -Resolve)
}

# MSMQ
Add-Type -AssemblyName 'System.ServiceProcess'
Add-Type -AssemblyName 'System.Messaging'

#PowerShell
$TrustedHostsPath = 'WSMan:\localhost\Client\TrustedHosts'

# Services
Add-Type -AssemblyName 'System.ServiceProcess'

# Users and Groups
Add-Type -AssemblyName 'System.DirectoryServices.AccountManagement'

# Windows Features
$useServerManager = (Get-Command -Name 'servermanagercmd.exe' -ErrorAction Ignore) -ne $null
$useWmi = $false
$useOCSetup = $false
if( -not $useServerManager )
{
    $useWmi = (Get-WmiObject -Class 'Win32_OptionalFeature' -ErrorAction Ignore) -ne $null
    $useOCSetup = (Get-Command -Name 'ocsetup.exe' -ErrorAction Ignore ) -ne $null
}

$windowsFeaturesNotSupported = (-not ($useServerManager -or ($useWmi -and $useOCSetup) ))
$supportNotFoundErrorMessage = 'Unable to find support for managing Windows features.  Couldn''t find servermanagercmd.exe, ocsetup.exe, or WMI support.'

$privateMembers = @{
                        'Add-IisServerManagerMember' = $true;
                        'Assert-WindowsFeatureFunctionsSupported' = $true;
                        'ConvertTo-ProviderAccessControlRights' = $true;
                        'Get-IdentityPrincipalContext' = $true;
                        'Invoke-ConsoleCommand' = $true;
                        'Resolve-WindowsFeatureName' = $true;
                        'Set-CryptoKeySecurity' = $true;
                   }

$functionNames = Get-Item (Join-Path -Path $PSScriptRoot -ChildPath '*\*.ps1') | 
                    Where-Object { $_.Directory.Name -ne 'bin' -and $_.Directory.Name -ne 'DscResources' } |
                    ForEach-Object {
                        Write-Verbose ("Importing sub-module {0}." -f $_.FullName)
                        . $_.FullName | Out-Null
                        $functionName = Split-Path -Leaf -Path $_.FullName
                        [IO.Path]::GetFileNameWithoutExtension( $functionName )
                    } |
                    Where-Object { -not $privateMembers.ContainsKey( $_ ) }

Export-ModuleMember -Function $functionNames -Cmdlet '*' -Alias '*'
