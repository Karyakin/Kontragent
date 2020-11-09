USE [Kontragent1]
GO
drop proc if exists [ADD_Organization_Pers1]
go
GO
Create PROCEDURE [dbo].[ADD_Organization_Pers1](
									@Description_Pers nvarchar(1000) 
									,@Owner_Name nvarchar(1000)
									,@Head_Name nvarchar(1000)
								)
AS
INSERT INTO Persone (	[Owner_Name], [Head_Name],	 [Description_Pers])
VALUES				(	@Owner_Name,  @Owner_Name,	@Description_Pers)
go


drop TABLE if exists Persone
go

CREATE TABLE Persone(
		
			Owner_Name nvarchar(1000) 
			,Head_Name nvarchar(1000) 
			,Description_Pers nvarchar(max) 
			
	)
go

EXEC ADD_Organization_Pers1
@Owner_Name = N'Иванов'
,@Head_Name = N'Иван'
,@Description_Pers = N'Гондон'
go

SELECT* FROM Persone



USE [Kontragent1]
GO
/****** Object:  StoredProcedure [dbo].[ADD_Organization_Pers1]    Script Date: 14.02.2020 18:54:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[ADD_Organization_Pers1](
									@Description_Pers nvarchar(1000) 
									,@Owner_Name nvarchar(1000)
									,@Head_Name nvarchar(1000)
								)
AS
INSERT INTO Persone (	[Owner_Name], [Head_Name],	 [Description_Pers])
VALUES				(	@Owner_Name,  @Head_Name,	@Description_Pers)
