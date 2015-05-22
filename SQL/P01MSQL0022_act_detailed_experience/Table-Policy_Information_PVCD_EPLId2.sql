IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Policy_Information_PVCD_EPLId2]') AND type in (N'U'))
DROP TABLE [dbo].[Policy_Information_PVCD_EPLId2]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Policy_Information_PVCD_EPLId2]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Policy_Information_PVCD_EPLId2](
	[policynumber] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[EPL] [int] NULL,
	[DO] [int] NULL
) ON [PRIMARY]
END
GO
