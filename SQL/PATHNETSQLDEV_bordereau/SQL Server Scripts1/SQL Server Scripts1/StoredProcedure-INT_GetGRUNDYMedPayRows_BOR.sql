IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[INT_GetGRUNDYMedPayRows_BOR]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[INT_GetGRUNDYMedPayRows_BOR]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[INT_GetGRUNDYMedPayRows_BOR]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
/****** Object:  Stored Procedure dbo.INT_GetGRUNDYMedPayRows_BOR    Script Date: 7/5/2006 8:53:53 AM ******/












CREATE       proc dbo.INT_GetGRUNDYMedPayRows_BOR 
  @State char(2)
as

SET NOCOUNT ON


SELECT Grundymedpayid,subline,coveragecode, medpaylimit from GRUNDY_MedPay where state = @State
' 
END
GO
