CREATE LOGIN [rails] WITH PASSWORD = '', CHECK_POLICY = OFF, DEFAULT_DATABASE = [activerecord_unittest];
USE [activerecord_unittest];
CREATE USER [rails] FOR LOGIN [rails];
EXEC sp_addrolemember N'db_owner', N'rails';
EXEC master..sp_addsrvrolemember @loginame = N'rails', @rolename = N'sysadmin'
