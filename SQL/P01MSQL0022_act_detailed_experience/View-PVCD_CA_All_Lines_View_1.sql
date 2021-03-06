IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[PVCD_CA_All_Lines_View_1]'))
DROP VIEW [dbo].[PVCD_CA_All_Lines_View_1]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[PVCD_CA_All_Lines_View_1]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW dbo.PVCD_CA_All_Lines_View_1
AS
SELECT     dbo.PVCD_All_Lines_View_1.statecode, dbo.PVCD_All_Lines_View_1.Coverage_Reporting_group, dbo.PVCD_All_Lines_View_1.productcode, 
                      dbo.PVCD_All_Lines_View_1.Fiscal_AY_Year, dbo.PVCD_All_Lines_View_1.currentwrittenpremium, 
                      dbo.PVCD_All_Lines_View_1.currentearnedpremium, dbo.PVCD_All_Lines_View_1.Policy_count_Reporting_Coverage, 
                      dbo.PVCD_All_Lines_View_1.Incurred_Loss_ALAE_with_SS_NonCat, dbo.PVCD_All_Lines_View_1.Capped_Incurred_Loss_ALAE_with_SS_wo_cat, 
                      dbo.PVCD_All_Lines_View_1.Ult_LDF_Incurred_Loss_ALAE_with_SS_NonCat, 
                      dbo.PVCD_All_Lines_View_1.Ult_LDF_Capped_Incurred_Loss_ALAE_with_SS_wo_cat, dbo.PVCD_All_Lines_View_1.Reported_Claims, 
                      dbo.PVCD_All_Lines_View_1.Incurred_Claims, dbo.PVCD_All_Lines_View_1.Commission_dollars, 
                      dbo.PVCD_All_Lines_View_1.Commission_Premiums, dbo.PVCD_All_Lines_View_1.New_Renew_Tail, dbo.PVCD_All_Lines_View_1.Renew_New_Auto, 
                      dbo.PVCD_All_Lines_View_1.Branch_Region, dbo.PVCD_All_Lines_View_1.program, dbo.PVCD_All_Lines_View_1.Written_Premium_Range, 
                      dbo.PVCD_All_Lines_View_1.Coverage_Group, dbo.PVCD_All_Lines_View_1.product_group, dbo.PVCD_All_Lines_View_1.Primary_Umbrella, 
                      dbo.PVCD_All_Lines_View_1.Earned_Buildings, dbo.PVCD_All_Lines_View_1.Earned_Locations, dbo.PVCD_All_Lines_View_1.Earned_TIV, 
                      dbo.PVCD_All_Lines_View_1.GL_Dom_Terr_Description, dbo.PVCD_All_Lines_View_1.GL_Dom_Region_in_State, 
                      dbo.PVCD_All_Lines_View_1.Primary_Producer, dbo.PVCD_All_Lines_View_1.Policy_count_All_Cov_Combined, 
                      dbo.PVCD_All_Lines_View_1.Account_UltLoss_Ratio_Working_Cover_Range, 
                      dbo.PVCD_All_Lines_View_1.Account_RepLoss_Ratio_Working_Cover_Range, dbo.PVCD_All_Lines_View_1.Policy_count_Coverage_Group, 
                      dbo.PVCD_All_Lines_View_1.accountnumber, dbo.PVCD_All_Lines_View_1.Primary_Producer_type, 
                      dbo.PVCD_All_Lines_View_1.Incurred_Loss_ALAE_with_SS, dbo.PVCD_All_Lines_View_1.Capped_Incurred_Loss_ALAE_with_SS, 
                      dbo.PVCD_All_Lines_View_1.Ult_LDF_Incurred_Loss_ALAE_with_SS, dbo.PVCD_All_Lines_View_1.Ult_LDF_Capped_Inc_Loss_ALAE_with_SS, 
                      dbo.PVCD_All_Lines_View_1.policynumber, dbo.PVCD_All_Lines_View_1.Coverage_Form, dbo.PVCD_All_Lines_View_1.Endorsement_Elite_YN, 
                      dbo.PVCD_All_Lines_View_1.Account_Name, dbo.PVCD_All_Lines_View_1.Incurred_Loss_ALAE_with_SS_CatOnly, 
                      dbo.PVCD_All_Lines_View_1.Employment_Handbook_YN, dbo.PVCD_All_Lines_View_1.Form_5500_YN, 
                      dbo.PVCD_All_Lines_View_1.Retro_Date_Applies_YN, dbo.PVCD_All_Lines_View_1.EEO1_Report_Received_YN, 
                      dbo.PVCD_All_Lines_View_1.Subsidiaries_Affiliates_YN, dbo.PVCD_All_Lines_View_1.Board_Experience_YN, 
                      dbo.PVCD_All_Lines_View_1.Employment_Policies_YN, dbo.PVCD_All_Lines_View_1.Claims_Past_5yrs_Range, 
                      dbo.PVCD_All_Lines_View_1.Number_of_Full_Time_Employees_Range, dbo.PVCD_All_Lines_View_1.Number_of_Part_Time_Employees_Range, 
                      dbo.PVCD_All_Lines_View_1.Number_of_Temporary_Employees_Range, dbo.PVCD_All_Lines_View_1.Number_of_Total_Employees_Range, 
                      dbo.PVCD_All_Lines_View_1.Insider_Shareholder_Percent_Range, dbo.PVCD_All_Lines_View_1.Employee_Salary_GT100k_Range, 
                      dbo.PVCD_All_Lines_View_1.Salary_100K_to_Total_Employees_Range, 
                      dbo.PVCD_All_Lines_View_1.Percent_of_Part_Time_and_Temp_Employees_Range, dbo.PVCD_All_Lines_View_1.Plan_Assets_Range, 
                      dbo.PVCD_All_Lines_View_1.Total_Participants_Range, dbo.PVCD_All_Lines_View_1.Total_Claims_Range, 
                      dbo.PVCD_All_Lines_View_1.PVCD_PVDO_Limit, dbo.PVCD_All_Lines_View_1.PVCD_PVEPL_Limit, 
                      dbo.PVCD_All_Lines_View_1.PVCD_PVDO_Alt_Retention, dbo.PVCD_All_Lines_View_1.PVCD_PVEPL_Alt_Retention, 
                      dbo.PVCD_All_Lines_View_1.PVCD_PVDO_RatingClass, dbo.PVCD_All_Lines_View_1.PVCD_PVEPL_RatingClass, 
                      dbo.PVCD_All_Lines_View_1.PVCD_PVEPL_Num_of_Employees_Range, dbo.PVCD_All_Lines_View_1.PVCD_Amendment_End_Y_N, 
                      dbo.PVCD_All_Lines_View_1.PVCD_Partnership_End_Y_N, dbo.PVCD_All_Lines_View_1.PVCD_ProPak_Elite72_End_Y_N, 
                      dbo.PVCD_All_Lines_View_1.PVCD_ProPak_Elite73_End_Y_N, dbo.PVCD_All_Lines_View_1.PVCD_Circumstance_Exclusion_End_Y_N, 
                      dbo.PVCD_All_Lines_View_1.PVCD_Professional_Services_End_Y_N, dbo.PVCD_All_Lines_View_1.PVCD_Sexual_Abuse_Exclusion_End_Y_N, 
                      dbo.PVCD_All_Lines_View_1.PVCD_BullsEye_ProPak_End_Y_N, 
                      dbo.PVCD_All_Lines_View_1.PVCD_Amended_Def_of_Employee_Incl_Ind_Contractors_End_Y_N, 
                      dbo.PVCD_All_Lines_View_1.PVCD_Amend_of_ExclusionK_End_Y_N, 
                      dbo.PVCD_All_Lines_View_1.PVCD_Amend_of_Severability_Provision_End_Y_N, 
                      dbo.PVCD_All_Lines_View_1.PVCD_Third_Party_Exclusion_End_Y_N, dbo.PVCD_All_Lines_View_1.PVCD_Punitive_Exclusion_End_Y_N, 
                      dbo.PVCD_All_Lines_View_1.PVCD_Medical_Malpractice_Exclusion_End_Y_N, 
                      dbo.PVCD_All_Lines_View_1.PVCD_Insurance_EO_Exclusion_End_Y_N, dbo.PVCD_All_Lines_View_1.PVCD_Full_Securities_Exclusion_End_Y_N, 
                      dbo.PVCD_All_Lines_View_1.PVCD_FAILURE_TO_MAINT_INSUR_EXCLUSION_End_Y_N, 
                      dbo.PVCD_All_Lines_View_1.PVCD_Bankruptcy_Exclusion_End_Y_N, dbo.PVCD_All_Lines_View_1.PVCD_Shareholder_End_Y_N, 
                      dbo.PVCD_All_Lines_View_1.PVCD_Past_Acts_End_Y_N, dbo.PVCD_All_Lines_View_1.PVCD_No_Liab_Retent_Waiver_End_Y_N, 
                      dbo.PVCD_All_Lines_View_1.PVCD_Delete_Consent_End_Y_N, dbo.PVCD_All_Lines_View_1.PVCD_Election_ERP_End_Y_N, 
                      dbo.PVCD_All_Lines_View_1.PVCD_Damages_Only_Retention_End_Y_N, dbo.PVCD_All_Lines_View_1.County_Pop_Density_Range, 
                      dbo.PVCD_All_Lines_View_1.Branch_Office, dbo.PVCD_All_Lines_View_1.PVCD_Business_Type, 
                      dbo.PVCD_All_Lines_View_1.COL_Breach_of_Contract_Loss, dbo.PVCD_All_Lines_View_1.COL_Discrimination_Loss, 
                      dbo.PVCD_All_Lines_View_1.COL_Wrongful_Termination_Loss, dbo.PVCD_All_Lines_View_1.COL_Harrassment_Loss, 
                      dbo.PVCD_All_Lines_View_1.COL_SLD_All_Other_Loss, dbo.PVCD_All_Lines_View_1.COL_SLD_All_Other_Count, 
                      dbo.PVCD_All_Lines_View_1.COL_Harassment_Count, dbo.PVCD_All_Lines_View_1.COL_WrongfulTermination_Count, 
                      dbo.PVCD_All_Lines_View_1.COL_Discrimination_Count, dbo.PVCD_All_Lines_View_1.COL_Breach_of_Contract_Count, 
                      dbo.PVCD_All_Lines_View_1.First_Policy_Year, dbo.PVCD_All_Lines_View_1.Clean_Warranty_Letter_Received_YN, 
                      dbo.PVCD_All_Lines_View_1.Price_Monitor_Standard_Cov_Grp_Monitored_range, dbo.PVCD_All_Lines_View_1.COL_DO_Other_Count, 
                      dbo.PVCD_All_Lines_View_1.COL_DO_Other_Loss, dbo.PVCD_All_Lines_View_1.COL_EPL_Other_Count, 
                      dbo.PVCD_All_Lines_View_1.COL_EPL_Other_Loss, dbo.PVCD_All_Lines_View_1.COL_Fiduciary_Other_Count, 
                      dbo.PVCD_All_Lines_View_1.COL_Fiduciary_Other_Loss, dbo.PVCD_All_Lines_View_1.COL_Worplace_Violence_Other_Count, 
                      dbo.PVCD_All_Lines_View_1.COL_Worplace_Violence_Other_Loss, dbo.PVCD_All_Lines_View_1.COL_Internet_Other_Count, 
                      dbo.PVCD_All_Lines_View_1.COL_Internet_Other_Loss, dbo.PVCD_All_Lines_View_1.PVCD_PVDO_ZoneMod, 
                      dbo.PVCD_All_Lines_View_1.PVCD_PVEPL_ZoneMod, dbo.PVCD_All_Lines_View_1.PVCD_PVEPL_Num_of_Employees, 
                      dbo.PVCD_All_Lines_View_1.Fiscal_AY_Month_Ending, dbo.PVCD_All_Lines_View_1.Last_Reporting_Year, 
                      dbo.PVCD_All_Lines_View_1.Last_Reporting_Month, dbo.PVCD_All_Lines_View_1.underwriter, dbo.PVCD_All_Lines_View_1.PIC_Producer, 
                      dbo.PVCD_All_Lines_View_1.Source_Detail_Name, dbo.PVCD_All_Lines_View_1.BusinessClassDesc, dbo.PVCD_All_Lines_View_1.ProductType, 
                      dbo.PVCD_All_Lines_View_1.DivisionName, dbo.PVCD_All_Lines_View_1.Written_Premium_Range_for_Product, 
                      dbo.PVCD_All_Lines_View_1.PVCD_ZoneNum_DO, dbo.PVCD_All_Lines_View_1.PVCD_ZoneNum_EPL, dbo.PVCD_All_Lines_View_1.PV_Cov_ALL, 
                      dbo.PVCD_All_Lines_View_1.Insd_County, dbo.PVCD_All_Lines_View_1.Insd_Zip, dbo.PVCD_All_Lines_View_1.Zip3, 
                      dbo.PVCD_All_Lines_View_1.PICProducer, dbo.PVCD_All_Lines_View_1.programdesc, dbo.PVCD_All_Lines_View_1.acctngyear, 
                      ISNULL(Act_Pricing.dbo.PVCD_CA_EPL_RatingTerritories_20120112.Territory, ''3'') AS Territory_EPL, 
                      ISNULL(Act_Pricing.dbo.PVCD_CA_DO_RatingTerritories_20120112.Territory, ''3'') AS Territory_DO
FROM         dbo.PVCD_All_Lines_View_1 LEFT OUTER JOIN
                      Act_Pricing.dbo.PVCD_CA_EPL_RatingTerritories_20120112 ON CONVERT(float, LEFT(dbo.PVCD_All_Lines_View_1.Insd_Zip, 3)) 
                      = Act_Pricing.dbo.PVCD_CA_EPL_RatingTerritories_20120112.[3 Digit ZIP Code] LEFT OUTER JOIN
                      Act_Pricing.dbo.PVCD_CA_DO_RatingTerritories_20120112 ON CONVERT(float, LEFT(dbo.PVCD_All_Lines_View_1.Insd_Zip, 3)) 
                      = Act_Pricing.dbo.PVCD_CA_DO_RatingTerritories_20120112.[3 Digit ZIP Code]
WHERE     (dbo.PVCD_All_Lines_View_1.statecode = ''CA'') AND (dbo.PVCD_All_Lines_View_1.Fiscal_AY_Year > ''2007'') AND 
                      (dbo.PVCD_All_Lines_View_1.productcode = ''PV'')
' 
GO
