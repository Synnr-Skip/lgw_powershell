IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Policy_Information_ALL_POLICIES_FireAllied_December]') AND type in (N'U'))
DROP TABLE [dbo].[Policy_Information_ALL_POLICIES_FireAllied_December]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Policy_Information_ALL_POLICIES_FireAllied_December]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Policy_Information_ALL_POLICIES_FireAllied_December](
	[policynumber] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FA_Number_of_Locations] [int] NULL,
	[FA_Number_of_Buildings] [int] NULL,
	[FA_Building_Exposure] [float] NULL,
	[FA_Contents_Exposure] [float] NULL,
	[FA_Business_Interuption_Exposure] [float] NULL,
	[FA_Extra_Expense_Exposure] [float] NULL,
	[TIV] [float] NULL,
	[FA_Building_Prem] [float] NULL,
	[FA_Contents_Prem] [float] NULL,
	[FA_Deductible] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[constr_Code_1_Exposure] [float] NULL,
	[constr_Code_2_Exposure] [float] NULL,
	[constr_Code_3_Exposure] [float] NULL,
	[constr_Code_4_Exposure] [float] NULL,
	[constr_Code_5_Exposure] [float] NULL,
	[constr_Code_6_Exposure] [float] NULL,
	[constr_Code_7_Exposure] [float] NULL,
	[constr_Code_8_Exposure] [float] NULL,
	[constr_Code_9_Exposure] [float] NULL,
	[constr_Code_10_Exposure] [float] NULL,
	[protect_class_1_Exposure] [float] NULL,
	[protect_class_2_Exposure] [float] NULL,
	[protect_class_3_Exposure] [float] NULL,
	[protect_class_4_Exposure] [float] NULL,
	[protect_class_5_Exposure] [float] NULL,
	[protect_class_6_Exposure] [float] NULL,
	[protect_class_7_Exposure] [float] NULL,
	[protect_class_8_Exposure] [float] NULL,
	[protect_class_9_Exposure] [float] NULL,
	[protect_class_10_Exposure] [float] NULL,
	[Population_Density_Zone_Metro_Exposure] [float] NULL,
	[Population_Density_Zone_Urban_Exposure] [float] NULL,
	[Population_Density_Zone_Suburban_Exposure] [float] NULL,
	[Population_Density_Zone_SemiSuburban_Exposure] [float] NULL,
	[Population_Density_Zone_Rural_Exposure] [float] NULL,
	[Hail_A_Exposure] [float] NULL,
	[Hail_B_Exposure] [float] NULL,
	[Hail_C_Exposure] [float] NULL,
	[Hail_D_Exposure] [float] NULL,
	[Hail_E_Exposure] [float] NULL,
	[Hail_F_Exposure] [float] NULL,
	[Hail_G_Exposure] [float] NULL,
	[Hail_H_Exposure] [float] NULL,
	[TIV_Range] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FA_Avg_TIV_per_BLD] [float] NULL,
	[FA_Avg_Bld_Rate] [float] NULL,
	[FA_Avg_Cts_Rate] [float] NULL,
	[FA_Deductible_to_TIV] [float] NULL,
	[term_factor] [float] NULL,
	[FA_Deductible_to_TIV_Range] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FA_Avg_Bld_Rate_rd2] [float] NULL,
	[FA_Avg_Bld_Rate_Range] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FA_Avg_Cts_Rate_Range] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FA_Avg_TIV_per_BLD_Range] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FA_Constr_code_Tot_Exposure] [float] NULL,
	[FA_Constr_Code_Max_Exposure] [float] NULL,
	[FA_Constr_Code_Dominant] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FA_Constr_Code_Dominant_Percent] [float] NULL,
	[FA_Constr_Code_Dominant_NAME] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Property_Coverage_Form] [varchar](2550) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FA_protect_class_Tot_Exposure] [float] NULL,
	[FA_protect_class_Max_Exposure] [float] NULL,
	[FA_protect_class_Dominant] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FA_protect_class_Dominant_Percent] [float] NULL,
	[ZIP_Pop_Density_Tot_Exposure] [float] NULL,
	[ZIP_Pop_Density_Max_Exposure] [float] NULL,
	[ZIP_Pop_Density_Dominant] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ZIP_Pop_Density_Dominant_Percent] [float] NULL,
	[FA_Hail_Tot_Exposure] [float] NULL,
	[FA_Hail_Max_Exposure] [float] NULL,
	[FA_Hail_Dominant] [varchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FA_Hail_Dominant_Percent] [float] NULL
) ON [PRIMARY]
END
GO