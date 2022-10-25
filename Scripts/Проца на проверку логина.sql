use Test
go

drop proc if exists check_login
go


Create PROC check_login (@Login_User nvarchar(50)) as
SELECT COUNT(*)
from Users
Where Login_User = @Login_User