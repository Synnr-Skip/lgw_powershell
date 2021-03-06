IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[State_MI_Mapping_View_1]'))
DROP VIEW [dbo].[State_MI_Mapping_View_1]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[State_MI_Mapping_View_1]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW dbo.State_MI_Mapping_View_1
AS
SELECT     dbo.Policy_Information_ALL_POLICIES_November.Account_UltLoss_Ratio_Working_Cover_Range, 
                      dbo.Policy_Information_ALL_POLICIES_November.Account_UltLoss_Ratio_NonCat_Working_Cover_Range, 
                      Act_Exposure_Mgt.dbo.Property_General_2010_11_30.Evaluation, Act_Exposure_Mgt.dbo.Property_General_2010_11_30.Entry_Month, 
                      Act_Exposure_Mgt.dbo.Property_General_2010_11_30.Region_Description, Act_Exposure_Mgt.dbo.Property_General_2010_11_30.Underwriter, 
                      Act_Exposure_Mgt.dbo.Property_General_2010_11_30.Primary_Producer, Act_Exposure_Mgt.dbo.Property_General_2010_11_30.Account_Number, 
                      Act_Exposure_Mgt.dbo.Property_General_2010_11_30.Account_Name, Act_Exposure_Mgt.dbo.Property_General_2010_11_30.Policy_Number, 
                      Act_Exposure_Mgt.dbo.Property_General_2010_11_30.PolicyID, Act_Exposure_Mgt.dbo.Property_General_2010_11_30.Effective_Date, 
                      Act_Exposure_Mgt.dbo.Property_General_2010_11_30.Expiration_Date, Act_Exposure_Mgt.dbo.Property_General_2010_11_30.Status, 
                      Act_Exposure_Mgt.dbo.Property_General_2010_11_30.Cancel_Date, Act_Exposure_Mgt.dbo.Property_General_2010_11_30.Product_Definition, 
                      Act_Exposure_Mgt.dbo.Property_General_2010_11_30.Program_Description, Act_Exposure_Mgt.dbo.Property_General_2010_11_30.Renew_Auto, 
                      Act_Exposure_Mgt.dbo.Property_General_2010_11_30.Address, Act_Exposure_Mgt.dbo.Property_General_2010_11_30.Address_for_Geocoding, 
                      Act_Exposure_Mgt.dbo.Property_General_2010_11_30.Address2, Act_Exposure_Mgt.dbo.Property_General_2010_11_30.State, 
                      Act_Exposure_Mgt.dbo.Property_General_2010_11_30.County, Act_Exposure_Mgt.dbo.Property_General_2010_11_30.City, 
                      Act_Exposure_Mgt.dbo.Property_General_2010_11_30.ZIP, Act_Exposure_Mgt.dbo.Property_General_2010_11_30.Tier, 
                      Act_Exposure_Mgt.dbo.Property_General_2010_11_30.Territory, Act_Exposure_Mgt.dbo.Property_General_2010_11_30.Location, 
                      Act_Exposure_Mgt.dbo.Property_General_2010_11_30.Building, Act_Exposure_Mgt.dbo.Property_General_2010_11_30.Longitude, 
                      Act_Exposure_Mgt.dbo.Property_General_2010_11_30.Latitude, Act_Exposure_Mgt.dbo.Property_General_2010_11_30.GeoResult, 
                      Act_Exposure_Mgt.dbo.Property_General_2010_11_30.Class_Code, Act_Exposure_Mgt.dbo.Property_General_2010_11_30.Protection_Class, 
                      Act_Exposure_Mgt.dbo.Property_General_2010_11_30.UC, Act_Exposure_Mgt.dbo.Property_General_2010_11_30.Construction, 
                      Act_Exposure_Mgt.dbo.Property_General_2010_11_30.Stories, Act_Exposure_Mgt.dbo.Property_General_2010_11_30.Construction_Year, 
                      Act_Exposure_Mgt.dbo.Property_General_2010_11_30.ZIP_Population_Density, Act_Exposure_Mgt.dbo.Property_General_2010_11_30.TIV, 
                      Act_Exposure_Mgt.dbo.Property_General_2010_11_30.TIV_Range, Act_Exposure_Mgt.dbo.Property_General_2010_11_30.TIV_State, 
                      Act_Exposure_Mgt.dbo.Property_General_2010_11_30.TIV_Policy, Act_Exposure_Mgt.dbo.Property_General_2010_11_30.Wind, 
                      Act_Exposure_Mgt.dbo.Property_General_2010_11_30.Wind_Deductible, Act_Exposure_Mgt.dbo.Property_General_2010_11_30.Hurricane_Deductible,
                       Act_Exposure_Mgt.dbo.Property_General_2010_11_30.Applicable_Hurricane_Deductible, 
                      Act_Exposure_Mgt.dbo.Property_General_2010_11_30.Flood_Deductible, Act_Exposure_Mgt.dbo.Property_General_2010_11_30.Flood_Premium, 
                      Act_Exposure_Mgt.dbo.Property_General_2010_11_30.Property_Elite_Form, 
                      Act_Exposure_Mgt.dbo.Property_General_2010_11_30.Property_Elite_Flood_Exposure_Type, 
                      Act_Exposure_Mgt.dbo.Property_General_2010_11_30.Property_Elite_Flood_Exposure_Limit, 
                      Act_Exposure_Mgt.dbo.Property_General_2010_11_30.Flood_Zone, Act_Exposure_Mgt.dbo.Property_General_2010_11_30.Terrorism, 
                      Act_Exposure_Mgt.dbo.Property_General_2010_11_30.Terrorism_Premium, 
                      Act_Exposure_Mgt.dbo.Property_General_2010_11_30.Fire_Allied_Deductible, Act_Exposure_Mgt.dbo.Property_General_2010_11_30.Premium, 
                      Act_Exposure_Mgt.dbo.Property_General_2010_11_30.Implied_Rate, Act_Exposure_Mgt.dbo.Property_General_2010_11_30.Commission, 
                      Act_Exposure_Mgt.dbo.Property_General_2010_11_30.EQ_Tier, Act_Exposure_Mgt.dbo.Property_General_2010_11_30.Sprinkler, 
                      Act_Exposure_Mgt.dbo.Property_General_2010_11_30.Sprinkler_Leakage_Only, 
                      Act_Exposure_Mgt.dbo.Property_General_2010_11_30.EQ_Allocated_Sublimit, 
                      Act_Exposure_Mgt.dbo.Property_General_2010_11_30.EQ_Percent_Deductible, 
                      Act_Exposure_Mgt.dbo.Property_General_2010_11_30.EQ_Policy_Deductible, Act_Exposure_Mgt.dbo.Property_General_2010_11_30.EQ_Deductible, 
                      Act_Exposure_Mgt.dbo.Property_General_2010_11_30.EQ_Bld_Deductible, Act_Exposure_Mgt.dbo.Property_General_2010_11_30.EQ_Premium, 
                      Act_Exposure_Mgt.dbo.Property_General_2010_11_30.MMI, Act_Exposure_Mgt.dbo.Property_General_2010_11_30.Distance_to_Shore, 
                      Act_Exposure_Mgt.dbo.Property_General_2010_11_30.Hurricane_Map_Legend, 
                      Act_Exposure_Mgt.dbo.Property_General_2010_11_30.Wind_Map_Legend, 
                      Act_Exposure_Mgt.dbo.Property_General_2010_11_30.Hail_Storm_Frequency_Range, 
                      Act_Exposure_Mgt.dbo.Property_General_2010_11_30.TWH_Tier_Min, Act_Exposure_Mgt.dbo.Property_General_2010_11_30.TIV_in_5_Mile_Buffer, 
                      Act_Exposure_Mgt.dbo.Property_General_2010_11_30.TIV_5_Mile_Concentration_Range, 
                      Act_Exposure_Mgt.dbo.Property_General_2010_11_30.Terrorism_Tier, Act_Exposure_Mgt.dbo.Property_General_2010_11_30.Closest_Terr_Target, 
                      Act_Exposure_Mgt.dbo.Property_General_2010_11_30.Closest_Terr_Target_Dist, 
                      Act_Exposure_Mgt.dbo.Property_General_2010_11_30.Highest_Risk_Target, Act_Exposure_Mgt.dbo.Property_General_2010_11_30.Wildfire_Tier, 
                      Act_Exposure_Mgt.dbo.Property_General_2010_11_30.Account_Stratification_Description, 
                      Act_Exposure_Mgt.dbo.Property_General_2010_11_30.Inception_Account_Stratification, 
                      Act_Exposure_Mgt.dbo.Property_General_2010_11_30.Highest_Risk_Target_Dist
FROM         dbo.Policy_Information_ALL_POLICIES_November RIGHT OUTER JOIN
                      Act_Exposure_Mgt.dbo.Property_General_2010_11_30 ON 
                      dbo.Policy_Information_ALL_POLICIES_November.policynumber = Act_Exposure_Mgt.dbo.Property_General_2010_11_30.Policy_Number
WHERE     (Act_Exposure_Mgt.dbo.Property_General_2010_11_30.State = ''MI'')
' 
GO
