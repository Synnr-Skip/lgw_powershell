IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sb_PolicySnap_SN]') AND type in (N'U'))
DROP TABLE [dbo].[sb_PolicySnap_SN]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sb_PolicySnap_SN]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[sb_PolicySnap_SN](
	[policynumber] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[createdDatetime] [datetime] NOT NULL,
	[Source_Name] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
END
GO
