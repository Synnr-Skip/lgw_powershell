IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[POLGEN_Field_Rules]') AND type in (N'U'))
DROP TABLE [dbo].[POLGEN_Field_Rules]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[POLGEN_Field_Rules]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[POLGEN_Field_Rules](
	[Field_Rule_ID] [int] IDENTITY(1,1) NOT NULL,
	[Field_Rule_Text] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Field_Rule_Desc] [char](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Field_Rule_Return_Type] [char](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK_Field_Rules] PRIMARY KEY CLUSTERED 
(
	[Field_Rule_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY],
 CONSTRAINT [IX_Field_Rules] UNIQUE NONCLUSTERED 
(
	[Field_Rule_Text] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
END
GO
