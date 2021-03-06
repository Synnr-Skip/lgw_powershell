IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_Step_14_Endorsement_VS]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_Step_14_Endorsement_VS]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_Step_14_Endorsement_VS]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'












CREATE procedure [dbo].[usp_Step_14_Endorsement_VS] as

update Detailed_Experience_Run_Log set Start_Time=GETDATE()
where Step_Name=OBJECT_NAME(@@Procid)
and Run_Month=(select Last_Reporting_Month from Detailed_Experience_Parameters)
and Run_Year=(select Last_Reporting_Year from Detailed_Experience_Parameters)

update Act_Detailed_Experience.dbo.Policy_Information_ALL_POLICIES_work
set 
Endorsement_VS_001 = case when (ISNULL( 
		-- V3 
		(select top 1 bd.bdtnumber
		from PI_AQS_POLICY_PROD.[dbo].polattachmentmfl as l join
		PI_AQS_DOCUMENT_PROD.[dbo].docBaseDocument BD on l.dat_bdtid = bd.bdtid
		WHERE l.nexpnum = 0 
			and l.PolicyID = PS.PolicyID
			and l.dat_bdtid IN (
				SELECT   BD2.bdtid
				FROM    PI_AQS_DOCUMENT_PROD.[dbo].docBaseDocument BD2
				where BD2.bdtNumber LIKE ''PI%VS%001%'')
		),
		-- V2 
		((select top 1 forms.lfrmnum
		from PICPFN01.aqs.MSSNM1POLFMB as forms
	        where forms.KSTOKEY = PS.PolicyID
		       and forms.NEXPNUM = 0
		       and forms.LFRMNUM LIKE ''PI%VS%001%'')
	))) like ''PI%VS%001%'' then ''PI-VS-001''
	else ''None''
	end 
from Act_Detailed_Experience.dbo.Policy_Information_ALL_POLICIES_work PS


update Detailed_Experience_Run_Log set End_Time=GETDATE()
where Step_Name=OBJECT_NAME(@@Procid)
and Run_Month=(select Last_Reporting_Month from Detailed_Experience_Parameters)
and Run_Year=(select Last_Reporting_Year from Detailed_Experience_Parameters)


' 
END
GO
