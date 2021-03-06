IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[POLGEN_Delete_Field_Name_Info]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[POLGEN_Delete_Field_Name_Info]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[POLGEN_Delete_Field_Name_Info]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'


CREATE      PROCEDURE dbo.POLGEN_Delete_Field_Name_Info

      @Document_ID int,
      @Field_Name_Text varchar(255)

AS

    Delete from 
      dbo.POLGEN_Field_Name_Info
      where Document_ID = @Document_ID
            and 
            Field_Name_Text = @Field_Name_Text

IF  @@error != 0
  BEGIN
    raiserror(''Failed in procedure POLGEN_Delete_Field_Name_Info'',16,1)
  END



' 
END
GO
