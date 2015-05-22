IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[NPDO_ALL_Lines_View_1_State_CA_2]'))
DROP VIEW [dbo].[NPDO_ALL_Lines_View_1_State_CA_2]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[NPDO_ALL_Lines_View_1_State_CA_2]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW dbo.NPDO_ALL_Lines_View_1_State_CA_2
AS
SELECT     dbo.ALL_POLICIES_12_premium_summary_March.statecode, dbo.ALL_POLICIES_12_premium_summary_March.Coverage_Reporting_group, 
                      dbo.ALL_POLICIES_12_premium_summary_March.productcode, dbo.ALL_POLICIES_12_premium_summary_March.Fiscal_AY_Year, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_March.currentwrittenpremium) AS currentwrittenpremium, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_March.currentearnedpremium) AS currentearnedpremium, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_March.Policy_count_Reporting_Coverage) AS Policy_count_Reporting_Coverage, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_March.Incurred_Loss_ALAE_with_SS_NonCat) AS Incurred_Loss_ALAE_with_SS_NonCat, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_March.Capped_Incurred_Loss_ALAE_with_SS_wo_cat) 
                      AS Capped_Incurred_Loss_ALAE_with_SS_wo_cat, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_March.Ult_LDF_Incurred_Loss_ALAE_with_SS_NonCat) 
                      AS Ult_LDF_Incurred_Loss_ALAE_with_SS_NonCat, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_March.Ult_LDF_Capped_Incurred_Loss_ALAE_with_SS_wo_cat) 
                      AS Ult_LDF_Capped_Incurred_Loss_ALAE_with_SS_wo_cat, SUM(dbo.ALL_POLICIES_12_premium_summary_March.Reported_Claims) 
                      AS Reported_Claims, SUM(dbo.ALL_POLICIES_12_premium_summary_March.Incurred_Claims) AS Incurred_Claims, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_March.Commission_dollars) AS Commission_dollars, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_March.Commission_Premiums) AS Commission_Premiums, 
                      dbo.Policy_Information_ALL_POLICIES_March.New_Renew_Tail, dbo.Policy_Information_ALL_POLICIES_March.Renew_New_Auto, 
                      dbo.Policy_Information_ALL_POLICIES_March.Branch_Region, dbo.Policy_Information_ALL_POLICIES_March.program, 
                      dbo.Policy_Information_ALL_POLICIES_March.Written_Premium_Range, dbo.ALL_POLICIES_12_premium_summary_March.Coverage_Group, 
                      dbo.Policy_Information_ALL_POLICIES_March.product_group, dbo.Policy_Information_ALL_POLICIES_March.Primary_Umbrella, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_March.Earned_Buildings) AS Earned_Buildings, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_March.Earned_Locations) AS Earned_Locations, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_March.Earned_TIV) AS Earned_TIV, 
                      dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_March.GL_Dom_Terr_Description, 
                      dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_March.GL_Dom_Region_in_State, 
                      dbo.Policy_Information_ALL_POLICIES_March.Primary_Producer, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_March.Policy_count_All_Cov_Combined) AS Policy_count_All_Cov_Combined, 
                      dbo.Policy_Information_ALL_POLICIES_March.Account_UltLoss_Ratio_Working_Cover_Range, 
                      dbo.Policy_Information_ALL_POLICIES_March.Account_RepLoss_Ratio_Working_Cover_Range, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_March.Policy_count_Coverage_Group) AS Policy_count_Coverage_Group, 
                      dbo.Policy_Information_ALL_POLICIES_March.accountnumber, dbo.Policy_Information_ALL_POLICIES_March.Primary_Producer_type, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_March.Incurred_Loss_ALAE_with_SS) AS Incurred_Loss_ALAE_with_SS, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_March.Capped_Incurred_Loss_ALAE_with_SS) AS Capped_Incurred_Loss_ALAE_with_SS, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_March.Ult_LDF_Incurred_Loss_ALAE_with_SS) AS Ult_LDF_Incurred_Loss_ALAE_with_SS, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_March.Ult_LDF_Capped_Inc_Loss_ALAE_with_SS) AS Ult_LDF_Capped_Inc_Loss_ALAE_with_SS, 
                      dbo.ALL_POLICIES_12_premium_summary_March.policynumber, dbo.ALL_POLICIES_12_premium_summary_March.Coverage_Form, 
                      dbo.Policy_Information_ALL_POLICIES_March.Endorsement_Elite_YN, dbo.Policy_Information_ALL_POLICIES_March.Account_Name, 
                      dbo.Policy_Information_ALL_POLICIES_March.County_Pop_Density_Range, dbo.Policy_Information_ALL_POLICIES_March.Branch_Office, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_March.COL_Breach_of_Contract_Loss) AS COL_Breach_of_Contract_Loss, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_March.COL_Discrimination_Loss) AS COL_Discrimination_Loss, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_March.COL_Wrongful_Termination_Loss) AS COL_Wrongful_Termination_Loss, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_March.COL_Harrassment_Loss) AS COL_Harrassment_Loss, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_March.COL_SLD_All_Other_Loss) AS COL_SLD_All_Other_Loss, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_March.COL_SLD_All_Other_Count) AS COL_SLD_All_Other_Count, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_March.COL_Harrassment_Count) AS COL_Harassment_Count, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_March.COL_Wrongful_Termination_Count) AS COL_WrongfulTermination_Count, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_March.COL_Discrimination_Count) AS COL_Discrimination_Count, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_March.COL_Breach_of_Contract_Count) AS COL_Breach_of_Contract_Count, 
                      dbo.Policy_Information_ALL_POLICIES_March.First_Policy_Year, 
                      dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_March.Price_Monitor_Standard_Cov_Grp_Monitored_range, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_March.COL_DO_Other_Count) AS COL_DO_Other_Count, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_March.COL_DO_Other_Loss) AS COL_DO_Other_Loss, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_March.COL_EPL_Other_Count) AS COL_EPL_Other_Count, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_March.COL_EPL_Other_Loss) AS COL_EPL_Other_Loss, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_March.COL_Fiduciary_Other_Count) AS COL_Fiduciary_Other_Count, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_March.COL_Fiduciary_Other_Loss) AS COL_Fiduciary_Other_Loss, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_March.COL_Worplace_Violence_Other_Count) AS COL_Worplace_Violence_Other_Count, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_March.COL_Worplace_Violence_Other_Loss) AS COL_Worplace_Violence_Other_Loss, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_March.COL_Internet_Other_Count) AS COL_Internet_Other_Count, 
                      SUM(dbo.ALL_POLICIES_12_premium_summary_March.COL_Internet_Other_Loss) AS COL_Internet_Other_Loss, 
                      dbo.Policy_Information_FF_March.FF_DO_Limit, dbo.Policy_Information_FF_March.FF_EPL_Limit, 
                      dbo.Policy_Information_FF_March.FF_DO_Alt_Retention, dbo.Policy_Information_FF_March.FF_EPL_Num_of_Employees_Range, 
                      dbo.Policy_Information_FF_March.TrimBusiness_Type, dbo.Policy_Information_FF_March.FF_DO_RatingClass, 
                      dbo.Policy_Information_FF_March.FF_EPL_RatingClass, dbo.Policy_Information_Underwriting_Check_List_March.Financials_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_March.Supplemental_Claim_Form_Loss_Run_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_March.Bylaws_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_March.Employment_Handbook_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_March.Form_5500_YN, dbo.Policy_Information_FF_March.FF_EPL_Alt_Retention, 
                      dbo.Policy_Information_Underwriting_Check_List_March.Number_of_Years_in_Operation, 
                      dbo.Policy_Information_Underwriting_Check_List_March.Plan_Assets, dbo.Policy_Information_Underwriting_Check_List_March.Turnover_Rate, 
                      dbo.Policy_Information_Underwriting_Check_List_March.Plan_Assets_Range, 
                      dbo.Policy_Information_Underwriting_Check_List_March.Turnover_Rate_Range, 
                      dbo.Policy_Information_Underwriting_Check_List_March.Subsidiaries_Affiliates_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_March.No_Loss_Letter_Received_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_March.No_Prior_Coverage_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_March.Clean_Warranty_Letter_Received_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_March.Supp_Claim_Form_Received_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_March.Website_Transactional_E_Commerce_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_March.Website_Information_Only_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_March.Transaction_E_Commerce_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_March.Tax_Exempt_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_March.Standard_Setting_or_Member_Certification_Services_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_March.Security_Precautions_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_March.Magazines_Periodicals_or_Newsletters_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_March.Proper_Employment_Procedures_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_March.Product_Research_or_Development_Testing_Certif_Services_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_March.Positive_Fund_Balance_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_March.Peer_Review_or_Disciplinary_Action_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_March.Merger_Acquisition_or_Consolidation_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_March.List_of_D_and_Os_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_March.Information_Only_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_March.Employment_Application_Handbook_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_March.Employment_Application_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_March.Disciplinary_Action_from_Peer_Review_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_March.Disciplinary_Administrative_or_Criminal_Actions_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_March.Insurance_Programs_For_Members_YN, 
                      dbo.ALL_POLICIES_12_premium_summary_March.Last_Reporting_Year, dbo.ALL_POLICIES_12_premium_summary_March.Last_Reporting_Month, 
                      dbo.ALL_POLICIES_12_premium_summary_March.Fiscal_AY_Month_Ending, dbo.Policy_Information_ALL_POLICIES_March.ProductType, 
                      dbo.Policy_Information_ALL_POLICIES_March.DivisionName, dbo.Policy_Information_ALL_POLICIES_March.BusinessClassDesc, 
                      dbo.Policy_Information_ALL_POLICIES_March.Source_Detail_Name, dbo.Policy_Information_ALL_POLICIES_March.PIC_Producer, 
                      dbo.Policy_Information_ALL_POLICIES_March.underwriter, CONVERT(int, dbo.Policy_Information_FF_March.FF_EPL_Limit) AS EPL_Limit_int, 
                      dbo.Policy_Information_FF_March.FF_DO_Alt_Retention_int, dbo.Policy_Information_FF_March.FF_EPL_Alt_Retention_int, 
                      dbo.Policy_Information_FF_March.FF_EPL_Limit_int, dbo.Policy_Information_ALL_POLICIES_March.Written_Premium_Range_for_Product, 
                      dbo.Policy_Information_ALL_POLICIES_March.policyEffectivedate, dbo.Policy_Information_ALL_POLICIES_March.policyexpirationdate, 
                      dbo.Policy_Information_ALL_POLICIES_March.Latest_PY, dbo.Policy_Information_ALL_POLICIES_March.policy_effective_month, 
                      dbo.Policy_Information_ALL_POLICIES_March.policy_effective_year, dbo.Policy_PATHID_Information.Insd_County AS County, 
                      LEFT(dbo.Policy_PATHID_Information.Insd_Zip, 5) AS Zip, LEFT(dbo.Policy_PATHID_Information.Insd_Zip, 3) AS Zip3, 
                      dbo.ALL_POLICIES_12_premium_summary_March.acctngyear
FROM         dbo.ALL_POLICIES_12_premium_summary_March LEFT OUTER JOIN
                      dbo.FLEXI_Policies_for_Proposal_11 ON 
                      dbo.ALL_POLICIES_12_premium_summary_March.policynumber = dbo.FLEXI_Policies_for_Proposal_11.Policy LEFT OUTER JOIN
                      dbo.Policy_Information_ALL_POLICIES_March ON 
                      dbo.ALL_POLICIES_12_premium_summary_March.policynumber = dbo.Policy_Information_ALL_POLICIES_March.policynumber LEFT OUTER JOIN
                      dbo.Policy_PATHID_Information ON 
                      dbo.ALL_POLICIES_12_premium_summary_March.policynumber = dbo.Policy_PATHID_Information.policynumber LEFT OUTER JOIN
                      dbo.Policy_Information_FF_March ON 
                      dbo.ALL_POLICIES_12_premium_summary_March.policynumber = dbo.Policy_Information_FF_March.policynumber LEFT OUTER JOIN
                      dbo.Policy_Information_Underwriting_Check_List_March ON 
                      dbo.ALL_POLICIES_12_premium_summary_March.policynumber = dbo.Policy_Information_Underwriting_Check_List_March.policynumber LEFT OUTER
                       JOIN
                      dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_March ON 
                      dbo.ALL_POLICIES_12_premium_summary_March.policynumber = dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_March.policynumber AND
                       dbo.ALL_POLICIES_12_premium_summary_March.productcode = dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_March.Productcode AND 
                      dbo.ALL_POLICIES_12_premium_summary_March.statecode = dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_March.statecode AND 
                      dbo.ALL_POLICIES_12_premium_summary_March.Coverage_Group = dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_March.coverage_group
GROUP BY dbo.ALL_POLICIES_12_premium_summary_March.statecode, dbo.ALL_POLICIES_12_premium_summary_March.policynumber, 
                      dbo.ALL_POLICIES_12_premium_summary_March.Coverage_Reporting_group, dbo.ALL_POLICIES_12_premium_summary_March.Coverage_Form, 
                      dbo.ALL_POLICIES_12_premium_summary_March.productcode, dbo.ALL_POLICIES_12_premium_summary_March.Fiscal_AY_Year, 
                      dbo.Policy_Information_ALL_POLICIES_March.New_Renew_Tail, dbo.Policy_Information_ALL_POLICIES_March.Renew_New_Auto, 
                      dbo.Policy_Information_ALL_POLICIES_March.Branch_Region, dbo.Policy_Information_ALL_POLICIES_March.program, 
                      dbo.Policy_Information_ALL_POLICIES_March.Written_Premium_Range, dbo.ALL_POLICIES_12_premium_summary_March.Coverage_Group, 
                      dbo.Policy_Information_ALL_POLICIES_March.product_group, dbo.Policy_Information_ALL_POLICIES_March.Primary_Umbrella, 
                      dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_March.GL_Dom_Terr_Description, 
                      dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_March.GL_Dom_Region_in_State, 
                      dbo.Policy_Information_ALL_POLICIES_March.Primary_Producer, 
                      dbo.Policy_Information_ALL_POLICIES_March.Account_UltLoss_Ratio_Working_Cover_Range, 
                      dbo.Policy_Information_ALL_POLICIES_March.Account_RepLoss_Ratio_Working_Cover_Range, 
                      dbo.Policy_Information_ALL_POLICIES_March.accountnumber, dbo.Policy_Information_ALL_POLICIES_March.Primary_Producer_type, 
                      dbo.Policy_Information_ALL_POLICIES_March.Endorsement_Elite_YN, dbo.Policy_Information_ALL_POLICIES_March.Account_Name, 
                      dbo.Policy_Information_ALL_POLICIES_March.County_Pop_Density_Range, dbo.Policy_Information_ALL_POLICIES_March.Branch_Office, 
                      dbo.ALL_POLICIES_12_premium_summary_March.Incurred_Loss_ALAE_with_SS_NonCat, 
                      dbo.Policy_Information_ALL_POLICIES_March.First_Policy_Year, 
                      dbo.ALL_POLICIES_12_premium_summary_March.Capped_Incurred_Loss_ALAE_with_SS, 
                      dbo.ALL_POLICIES_12_premium_summary_March.Ult_LDF_Incurred_Loss_ALAE_with_SS, 
                      dbo.ALL_POLICIES_12_premium_summary_March.Ult_LDF_Capped_Inc_Loss_ALAE_with_SS, 
                      dbo.ALL_POLICIES_12_premium_summary_March.Incurred_Claims, 
                      dbo.Policy_Product_State_Coverage_Data_ALL_POLICIES_March.Price_Monitor_Standard_Cov_Grp_Monitored_range, 
                      dbo.Policy_Information_FF_March.FF_DO_Limit, dbo.Policy_Information_FF_March.FF_EPL_Limit, 
                      dbo.Policy_Information_FF_March.FF_DO_Alt_Retention, dbo.Policy_Information_FF_March.FF_EPL_Num_of_Employees_Range, 
                      dbo.Policy_Information_FF_March.TrimBusiness_Type, dbo.Policy_Information_FF_March.FF_DO_RatingClass, 
                      dbo.Policy_Information_FF_March.FF_EPL_RatingClass, dbo.Policy_Information_Underwriting_Check_List_March.Financials_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_March.Supplemental_Claim_Form_Loss_Run_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_March.Bylaws_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_March.Employment_Handbook_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_March.Form_5500_YN, dbo.Policy_Information_FF_March.FF_EPL_Alt_Retention, 
                      dbo.Policy_Information_Underwriting_Check_List_March.Number_of_Years_in_Operation, 
                      dbo.Policy_Information_Underwriting_Check_List_March.Plan_Assets, dbo.Policy_Information_Underwriting_Check_List_March.Turnover_Rate, 
                      dbo.Policy_Information_Underwriting_Check_List_March.Plan_Assets_Range, 
                      dbo.Policy_Information_Underwriting_Check_List_March.Turnover_Rate_Range, 
                      dbo.Policy_Information_Underwriting_Check_List_March.Subsidiaries_Affiliates_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_March.No_Loss_Letter_Received_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_March.No_Prior_Coverage_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_March.Clean_Warranty_Letter_Received_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_March.Supp_Claim_Form_Received_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_March.Website_Transactional_E_Commerce_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_March.Website_Information_Only_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_March.Transaction_E_Commerce_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_March.Tax_Exempt_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_March.Standard_Setting_or_Member_Certification_Services_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_March.Security_Precautions_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_March.Magazines_Periodicals_or_Newsletters_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_March.Proper_Employment_Procedures_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_March.Product_Research_or_Development_Testing_Certif_Services_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_March.Positive_Fund_Balance_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_March.Peer_Review_or_Disciplinary_Action_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_March.Merger_Acquisition_or_Consolidation_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_March.List_of_D_and_Os_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_March.Information_Only_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_March.Employment_Application_Handbook_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_March.Employment_Application_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_March.Disciplinary_Action_from_Peer_Review_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_March.Disciplinary_Administrative_or_Criminal_Actions_YN, 
                      dbo.Policy_Information_Underwriting_Check_List_March.Insurance_Programs_For_Members_YN, 
                      dbo.ALL_POLICIES_12_premium_summary_March.Last_Reporting_Year, dbo.ALL_POLICIES_12_premium_summary_March.Last_Reporting_Month, 
                      dbo.ALL_POLICIES_12_premium_summary_March.Fiscal_AY_Month_Ending, dbo.Policy_Information_ALL_POLICIES_March.ProductType, 
                      dbo.Policy_Information_ALL_POLICIES_March.DivisionName, dbo.Policy_Information_ALL_POLICIES_March.BusinessClassDesc, 
                      dbo.Policy_Information_ALL_POLICIES_March.Source_Detail_Name, dbo.Policy_Information_ALL_POLICIES_March.PIC_Producer, 
                      dbo.Policy_Information_ALL_POLICIES_March.underwriter, dbo.Policy_Information_FF_March.FF_DO_Alt_Retention_int, 
                      dbo.Policy_Information_FF_March.FF_EPL_Alt_Retention_int, dbo.Policy_Information_FF_March.FF_EPL_Limit_int, 
                      dbo.Policy_Information_ALL_POLICIES_March.Written_Premium_Range_for_Product, 
                      dbo.Policy_Information_ALL_POLICIES_March.policyEffectivedate, dbo.Policy_Information_ALL_POLICIES_March.policyexpirationdate, 
                      dbo.Policy_Information_ALL_POLICIES_March.Latest_PY, dbo.Policy_Information_ALL_POLICIES_March.policy_effective_month, 
                      dbo.Policy_Information_ALL_POLICIES_March.policy_effective_year, dbo.Policy_PATHID_Information.Insd_County, 
                      LEFT(dbo.Policy_PATHID_Information.Insd_Zip, 3), LEFT(dbo.Policy_PATHID_Information.Insd_Zip, 5), 
                      dbo.ALL_POLICIES_12_premium_summary_March.acctngyear
HAVING      (dbo.Policy_Information_ALL_POLICIES_March.Primary_Umbrella = ''Primary'') AND 
                      (dbo.ALL_POLICIES_12_premium_summary_March.productcode = ''FF'') AND 
                      (dbo.ALL_POLICIES_12_premium_summary_March.Fiscal_AY_Year > 2005) AND (dbo.ALL_POLICIES_12_premium_summary_March.statecode = ''CA'')
' 
GO