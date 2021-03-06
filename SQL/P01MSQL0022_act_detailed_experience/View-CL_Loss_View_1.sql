IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[CL_Loss_View_1]'))
DROP VIEW [dbo].[CL_Loss_View_1]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[CL_Loss_View_1]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW dbo.CL_Loss_View_1
AS
SELECT     dbo.Latest_All_Lines_Losses_View_1.accountnumber, dbo.Latest_All_Lines_Losses_View_1.policynumber, dbo.Latest_All_Lines_Losses_View_1.Claim_Number, 
                      dbo.Latest_All_Lines_Losses_View_1.productcode, dbo.Latest_All_Lines_Losses_View_1.Coverage_Reporting_group, 
                      dbo.Latest_All_Lines_Losses_View_1.Coverage_Form, dbo.Latest_All_Lines_Losses_View_1.Accident_Year, dbo.Latest_All_Lines_Losses_View_1.Fiscal_AY_Year, 
                      dbo.Latest_All_Lines_Losses_View_1.Type_of_Loss_Desc, dbo.Latest_All_Lines_Losses_View_1.Claim_Desc, dbo.Latest_All_Lines_Losses_View_1.Case_Loss, 
                      dbo.Latest_All_Lines_Losses_View_1.Case_ALAE, dbo.Latest_All_Lines_Losses_View_1.Paid_Loss, dbo.Latest_All_Lines_Losses_View_1.Paid_ALAE, 
                      dbo.Latest_All_Lines_Losses_View_1.Sal_Subro, dbo.Latest_All_Lines_Losses_View_1.Incurred_Loss_ALAE_with_SS, 
                      dbo.Latest_All_Lines_Losses_View_1.Incurred_Loss_ALAE_with_SS_NonCat, dbo.Latest_All_Lines_Losses_View_1.Incurred_Loss_ALAE_with_SS_CatOnly, 
                      dbo.Latest_All_Lines_Losses_View_1.Reported_Claims, dbo.Latest_All_Lines_Losses_View_1.Open_Claims, 
                      dbo.Latest_All_Lines_Losses_View_1.Closed_With_Pay_Claims, dbo.Latest_All_Lines_Losses_View_1.Closed_Without_Pay_Claims, 
                      dbo.Latest_All_Lines_Losses_View_1.Incurred_Claims, dbo.Latest_All_Lines_Losses_View_1.Coverage_Group, dbo.Latest_All_Lines_Losses_View_1.report_year, 
                      dbo.Latest_All_Lines_Losses_View_1.report_month, dbo.Latest_All_Lines_Losses_View_1.policy_year, dbo.Latest_All_Lines_Losses_View_1.policy_month, 
                      dbo.Latest_All_Lines_Losses_View_1.Type_of_Loss, dbo.Latest_All_Lines_Losses_View_1.Written_Premium_Range, 
                      dbo.Latest_All_Lines_Losses_View_1.Accident_State, dbo.Latest_All_Lines_Losses_View_1.PrimaryProducerNumber, 
                      dbo.Latest_All_Lines_Losses_View_1.PrimaryProducer, dbo.Latest_All_Lines_Losses_View_1.statecode, dbo.Latest_All_Lines_Losses_View_1.Premium_State, 
                      dbo.Policy_Information_ALL_POLICIES_April.Business_Desc
FROM         dbo.Latest_All_Lines_Losses_View_1 LEFT OUTER JOIN
                      dbo.Policy_Information_ALL_POLICIES_April ON 
                      dbo.Latest_All_Lines_Losses_View_1.policynumber = dbo.Policy_Information_ALL_POLICIES_April.policynumber
WHERE     (dbo.Latest_All_Lines_Losses_View_1.Fiscal_AY_Year > 2008) AND (dbo.Latest_All_Lines_Losses_View_1.productcode = ''cl'')
' 
GO
