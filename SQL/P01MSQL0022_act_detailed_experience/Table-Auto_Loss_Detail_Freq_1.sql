IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Auto_Loss_Detail_Freq_1]') AND type in (N'U'))
DROP TABLE [dbo].[Auto_Loss_Detail_Freq_1]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Auto_Loss_Detail_Freq_1]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Auto_Loss_Detail_Freq_1](
	[company] [varchar](2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Accountnumber] [int] NULL,
	[Policy_Number] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Claim_Number] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Exp_product] [varchar](5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Product] [varchar](2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Premium_State] [varchar](2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Territory] [varchar](3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Coverage_id] [varchar](6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Coverage_Group] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Coverage_Reporting_group] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Coverage_Form] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Accident_Year] [int] NULL,
	[Accident_Month] [int] NULL,
	[report_year] [int] NULL,
	[report_month] [int] NULL,
	[policy_year] [int] NULL,
	[policy_month] [int] NULL,
	[Loss_Evaluation_Month] [int] NULL,
	[Loss_Evaluation_Year] [int] NULL,
	[Type_of_Loss] [varchar](6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Type_of_Loss_Desc] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Claim_Desc] [varchar](1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[COL_Breach_of_Contract_Count] [decimal](15, 2) NULL,
	[COL_Breach_of_Contract_Loss] [decimal](15, 2) NULL,
	[COL_Discrimination_Count] [decimal](15, 2) NULL,
	[COL_Discrimination_Loss] [decimal](15, 2) NULL,
	[COL_Wrongful_Termination_Count] [decimal](15, 2) NULL,
	[COL_Wrongful_Termination_Loss] [decimal](15, 2) NULL,
	[COL_Harrassment_Count] [decimal](15, 2) NULL,
	[COL_Harrassment_Loss] [decimal](15, 2) NULL,
	[COL_DO_Other_Count] [decimal](15, 2) NULL,
	[COL_DO_Other_Loss] [decimal](15, 2) NULL,
	[COL_EPL_Other_Count] [decimal](15, 2) NULL,
	[COL_EPL_Other_Loss] [decimal](15, 2) NULL,
	[COL_Fiduciary_Other_Count] [decimal](15, 2) NULL,
	[COL_Fiduciary_Other_Loss] [decimal](15, 2) NULL,
	[COL_Worplace_Violence_Other_Count] [decimal](15, 2) NULL,
	[COL_Worplace_Violence_Other_Loss] [decimal](15, 2) NULL,
	[COL_Internet_Other_Count] [decimal](15, 2) NULL,
	[COL_Internet_Other_Loss] [decimal](15, 2) NULL,
	[COL_SLD_All_Other_Count] [decimal](15, 2) NULL,
	[COL_SLD_All_Other_Loss] [decimal](15, 2) NULL,
	[Case_Loss] [decimal](15, 2) NULL,
	[Case_ALAE] [decimal](15, 2) NULL,
	[Paid_Loss] [decimal](15, 2) NULL,
	[Paid_ALAE] [decimal](15, 2) NULL,
	[Sal_Subro] [decimal](15, 2) NULL,
	[Incurred_Loss_ALAE_with_SS] [decimal](15, 2) NULL,
	[Paid_Loss_and_ALAE] [decimal](15, 2) NULL,
	[Incurred_Loss_ALAE_without_SS] [decimal](15, 2) NULL,
	[Incurred_Loss_ALAE_with_SS_NonCat] [decimal](15, 2) NULL,
	[Incurred_Loss_ALAE_without_SS_NonCat] [decimal](15, 2) NULL,
	[Loss_ALAE_Cap] [decimal](15, 2) NULL,
	[Incurred_Loss_ALAE_with_SS_CatOnly] [decimal](15, 2) NULL,
	[Incurred_Loss_ALAE_without_SS_CatOnly] [decimal](15, 2) NULL,
	[Capping_Factor] [decimal](15, 2) NULL,
	[Capping_Factor_2] [decimal](15, 2) NULL,
	[Capping_Factor_3] [decimal](15, 2) NULL,
	[Capped_Incurred_Loss_ALAE_with_SS] [decimal](15, 2) NULL,
	[Capped_Paid_Loss_and_ALAE] [decimal](15, 2) NULL,
	[Capped_Paid_Loss] [decimal](15, 2) NULL,
	[Capped_Incurred_Loss_ALAE_with_SS_wo_cat] [decimal](15, 2) NULL,
	[LDF] [decimal](15, 3) NULL,
	[Capped_LDF] [decimal](15, 3) NULL,
	[Ult_LDF_Incurred_Loss_ALAE_with_SS] [decimal](15, 2) NULL,
	[Ult_LDF_Incurred_Loss_ALAE_with_SS_CatOnly] [decimal](15, 2) NULL,
	[Ult_LDF_Incurred_Loss_ALAE_with_SS_NonCat] [decimal](15, 2) NULL,
	[Ult_LDF_Incurred_Loss_ALAE_without_SS] [decimal](15, 2) NULL,
	[Ult_LDF_Incurred_Loss_ALAE_without_SS_CatOnly] [decimal](15, 2) NULL,
	[Ult_LDF_Incurred_Loss_ALAE_without_SS_NonCat] [decimal](15, 2) NULL,
	[Ult_LDF_Capped_Inc_Loss_ALAE_with_SS] [decimal](15, 2) NULL,
	[Ult_LDF_Capped_Incurred_Loss_ALAE_with_SS_wo_cat] [decimal](15, 2) NULL,
	[Reported_Claims] [decimal](15, 2) NULL,
	[Open_Claims] [decimal](15, 2) NULL,
	[Closed_With_Pay_Claims] [decimal](15, 2) NULL,
	[CWP_Claims_ex_ALAE_only] [decimal](15, 2) NULL,
	[Closed_Without_Pay_Claims] [decimal](15, 2) NULL
) ON [PRIMARY]
END
GO
