Use Kontragent
go
drop proc if exists ADD_User 
go
Create PROC ADD_User(
						 @Login_User nvarchar(100) 
						,@Password_User nvarchar (512) 
						,@Department nvarchar(100)
						,@Hint nvarchar(100) 
					)
					AS
INSERT INTO [Users] 
					(Login_User, Department, Password_User, Hint) 
			SELECT 
					@Login_User, @Department, HASHBYTES('MD5',@Password_User), @Hint
         
		 
go

exec ADD_User 
 @Login_User = '22'
,@Password_User = '123'
,@Department = 'сха'
,@Hint = '1'

select * FROM Users