USE [Kontragent1]--!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
--!!!!!!!!!!!!!!!!!!!!!!!!
go
-----------------------------------------------------------------------------------------
/*
ALTER TABLE Organization
DROP CONSTRAINT if exists FK_ID_Country

ALTER TABLE Organization
DROP CONSTRAINT if exists FK_ID_Section 

ALTER TABLE Organization
DROP CONSTRAINT if exists FK_ID_User


ALTER TABLE Organization
DROP CONSTRAINT if exists FK_ID_Risk

ALTER TABLE Persone
DROP CONSTRAINT if exists FK_UNP_Org 

ALTER TABLE Persone
DROP CONSTRAINT if exists FK_ID_Country_Pers 
---------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------
delete from Country
delete from Users
delete from Section
delete from Organization
delete from Persone
delete from Risk
---------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------
DROP TABLE if exists Country 
DROP TABLE if exists Section
DROP TABLE if exists Organization
DROP TABLE if exists Persone
DROP TABLE if exists Risk 
DROP TABLE if exists Users 
*/
--------------------------------------------------------------------------------------
	--�������� ������
-----------------------------------------------------------------------------------------
	CREATE TABLE Risk(
			 ID_Risk INT IDENTITY(1,1) NOT NULL CONSTRAINT PK_ID_Risk Primary key
			,Age_Org_Risk INT NOT NULL
			,Ownership_Org INT NOT NULL
			,Broker_Client bit NULL
			,Trading_experience bit NULL -- ���� ������
			,Manufacturer INT NOT NULL -- �������������
			,Tax_Debt INT NOT NULL
			,Debts_Enforcement_Documents INT NOT NULL
			,False_Business INT NOT NULL 
			,Special_Risc INT NOT NULL
			,Execute_Proc INT NOT NULL
			,Bankruptcy_Proc INT NOT NULL
			,Liquidation_Proc INT NOT NULL
			,Resident INT NOT NULL 
			,Exchenge_Trading_Disorders INT NOT NULL -- ��������� �������� ��������
			,Negativ_Data INT NOT NULL
			,Reputation INT NOT NULL
			,Prev_Liquidated INT NOT NULL
			,Prev_Bankruptcy INT NOT NULL
			,Prev_State_Debt INT NULL
			,Prev_Tax_Debt INT NOT NULL
			,Prev_Execute_Proc INT NOT NULL		
			,Risk_St_Date DATETIME NOT NULL DEFAULT GETDATE() 
			,Risk_End_Date DATETIME NULL 
	)
go
-----------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------
	CREATE TABLE Country(
			 ID_Country INT IDENTITY(1,1) NOT NULL CONSTRAINT PK_ID_Country Primary key
			,Country_Code INT NULL 
			,Name_Country nvarchar(1000) NOT NULL
			,Risk_Country Int NOT NULL
			,Risk_St_Date DATETIME NULL
			,Risk_End_Date DATETIME NULL
	)
go	
-----------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------
CREATE TABLE Section( 
			 ID_Section INT IDENTITY(1,1) NOT NULL CONSTRAINT PK_ID_Section Primary key
			,Name_Section nvarchar(50) NOT NULL
			,Risk_Section INT NOT NULL
			,Risk_St_Date_Section DATETIME NULL
			,Risk_End_Date_Section DATETIME NULL
	)
go
-----------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------
	CREATE TABLE Organization	(
			 UNP_Org nvarchar(100) NOT NULL Constraint PK_Org_UNP Primary Key 
			,Full_Name_Org nvarchar(500) NOT NULL INDEX Ix_Full_Name_Org
			,Short_Name_Org nvarchar(500) NOT NULL INDEX Ix_Short_Name_Org
			,Create_date_Org DATE NOT NULL
			,Age_Org as DATEDIFF(MONTH, Create_date_Org, Check_Date_Org )
			,Description_Org nvarchar(max) NOT NULL	
			,Ownership_Org bit NOT NULL
			,Tax_Debt bit NOT NULL
			,Debts_Enforcement_Documents bit NOT NULL -- ������������� �� �������������� ����������
			,False_Business bit NOT NULL 
			,Special_Risc bit NOT NULL
			,Execute_Proc bit NOT NULL
			,Bankruptcy_Proc bit NOT NULL
			,Liquidation_Proc bit NOT NULL
			,Resident bit NOT NULL
			,Broker_Client bit NOT NULL
			,Prev_Broker_Client bit NOT NULL
			,Trading_experience bit NOT NULL-- ���� �������� ������
			,Trader bit NOT NULL
			,Manufacturer bit NOT NULL -- �������������
			,First_Accred bit NOT NULL
			,Second_Accred bit NOT NULL
			,Exchenge_Trading_Disorders bit NOT NULL -- ��������� �������� ������
			,Negativ_Data bit NOT NULL
			,Reputation bit NOT NULL 
			,Forced_Deposite bit NOT NULL
			,Broker_Opinion nvarchar(max) NULL 
			,Section_Head_Opinion nvarchar(max) NULL
			,Auditor_Opinion nvarchar(max) NULL
			,ID_Country INT NOT NULL 
			,ID_Section INT NOT NULL
			,ID_Risk INT NOT NULL
			,Check_Date_Org DATETIME CONSTRAINT Get_Date DEFAULT FORMAT(GETDATE(), 'dd/MMM/yyyy HH:mm:ss' , 'en-us') -- ('hh:mm:ss' in Capital letters)--hh:mm
			,ID_User INT  NULL
			,Update_Date_Org DATETIME 
			,ID_User_Update INT  NULL
	)
go
-----------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------
	CREATE TABLE Persone(
			 UNP_Org nvarchar(100) NOT NULL CONSTRAINT PK_UNP_Org Primary key 
			,Owner_Name nvarchar(1000) NOT NULL
			,Head_Name nvarchar(1000) NOT NULL
			,Prev_Liquidated bit NOT NULL
			,Prev_Bankruptcy bit NOT NULL
			,Prev_State_Debt bit NOT NULL
			,Prev_Tax_Debt bit NOT NULL
			,Prev_Execute_Proc bit NOT NULL
			,Negativ_Data_Pers bit NOT NULL
			,Description_Pers nvarchar(max) NULL
			,ID_Country_Pers INT NOT NULL
	)
go
-----------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------
CREATE TABLE Users(
			 ID_User INT IDENTITY(1,1) NOT NULL CONSTRAINT PK_ID_User Primary key
			,Login_User nvarchar(500) NOT NULL UNIQUE
			,Password_User varbinary(512) NOT NULL
			,Department nvarchar(1000) NOT NULL--�������������
			,Hint nvarchar(1000) NULL--���������
			,Date_Creation_User DATETIME CONSTRAINT Date_Creation_User DEFAULT GETDATE()
	)
go
-----------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------

ALTER TABLE Organization
ADD CONSTRAINT FK_ID_Country FOREIGN KEY(ID_Country)
REFERENCES Country(ID_Country) ON DELETE CASCADE ON UPDATE CASCADE

ALTER TABLE Persone
ADD CONSTRAINT FK_UNP_Org FOREIGN KEY(UNP_Org)
REFERENCES Organization(UNP_Org) ON DELETE CASCADE ON UPDATE CASCADE

ALTER TABLE Persone
ADD CONSTRAINT FK_ID_Country_Pers FOREIGN KEY(ID_Country_Pers)
REFERENCES Country(ID_Country) 

ALTER TABLE Organization
ADD CONSTRAINT FK_ID_Section FOREIGN KEY(ID_Section) 
REFERENCES Section(ID_Section) ON DELETE CASCADE ON UPDATE CASCADE

ALTER TABLE Organization
ADD CONSTRAINT FK_ID_Risk FOREIGN KEY(ID_Risk)
REFERENCES Risk(ID_Risk) ON DELETE CASCADE ON UPDATE CASCADE

ALTER TABLE Organization
ADD CONSTRAINT FK_ID_User FOREIGN KEY(ID_User)
REFERENCES Users(ID_User) ON DELETE CASCADE ON UPDATE CASCADE
-----------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------
INSERT INTO Risk	(Age_Org_Risk, Ownership_Org, Broker_Client, Trading_experience, Manufacturer, Tax_Debt, Debts_Enforcement_Documents, False_Business, Special_Risc, Execute_Proc, Bankruptcy_Proc, Liquidation_Proc, Resident,   Exchenge_Trading_Disorders, Negativ_Data, Reputation, Prev_Liquidated, Prev_Bankruptcy, Prev_State_Debt, Prev_Tax_Debt, Prev_Execute_Proc, Risk_St_Date)
VALUES				(	3,				3,				3,				2,					4,			3,				5,						5,			3,				2,				5,				5,				0,				2,						3,				4,				1,				5,				2,				3,				2,			'2019-06-01')
go
-----------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------
CREATE TRIGGER Risk_End_Date ON  Risk FOR INSERT AS 
BEGIN
 SET NOCOUNT ON;
 UPDATE Risk
    SET Risk_End_Date = getdate()
	where ID_Risk is NULL
END

go
-----------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------

INSERT INTO Country ([Country_Code]    ,[Name_Country]							,[Risk_Country])
VALUES						( 0000,			N'(�� �������)',							0 ),
 							( 0000,			N'(�� �������)',							0 ),
							( 895,			N'�������',									2 ),
							( 036,			N'���������',								2 ),
							( 040,			N'�������',									2 ),
							( 031,			N'�����������',								2 ),
							( 008,			N'�������',									2 ),
							( 012,			N'�����',									5 ),
							( 016,			N'������������ �����',						7 ),
							( 660,			N'�������',									5 ),
							( 024,			N'������',									5 ),
							( 020,			N'�������',									5 ),
							( 010,			N'����������',								5 ),
							( 028,			N'������� � �������',						5 ),
							( 032,			N'���������',								5 ),
							( 051,			N'�������',									2 ),
							( 533,			N'�����',									5 ),
							( 004,			N'����������',								7 ),
							( 044,			N'������',									7 ),
							( 050,			N'���������',								5 ),
							( 052,			N'��������',								5 ),
							( 048,			N'�������',									5 ),
							( 112,			N'��������',								0 ),
							( 084,			N'�����',									5 ),
							( 056,			N'�������',									2 ),
							( 204,			N'�����',									5 ),
							( 060,			N'�������',									5 ),
							( 100,			N'��������',								2 ),
							( 068,			N'�������',									5 ),
							( 535,			N'������',									5 ),
							( 070,			N'������ � �����������',					2 ),
							( 072,			N'��������',								7 ),
							( 076,			N'��������',								5 ),
							( 086,			N'���������� ���������� � ��������� ������',5 ),
							( 096,			N'������-����������',						5 ),
							( 854,			N'�������-����',							2 ),
							( 108,			N'�������',									5 ),
							( 064,			N'�����',									5 ),
							( 548,			N'�������',									5 ),
							( 348,			N'�������',									2 ),
							( 862,			N'���������',								5 ),
							( 092,			N'���������� �������(����������)',			5 ),
							( 850,			N'���������� �������(���)',					5 ),
							( 704,			N'�������',									5 ),
							( 266,			N'�����',									5 ),	
							( 328,			N'������',									5 ),
							( 332,			N'�����',									5 ),
							( 270,			N'������',									5 ),
							( 288,			N'����',									7 ),
							( 312,			N'���������',								5 ),
							( 320,			N'���������',								5 ),
							( 324,			N'������',									5 ),
							( 624,			N'������-�����',							2 ),
							( 276,			N'��������',								2 ),
							( 831,			N'������',									2 ),
							( 292,			N'���������',								5 ),
							( 340,			N'��������',								5 ),
							( 344,			N'�������',									2 ),
							( 308,			N'�������',									5 ),
							( 304,			N'����������',								2 ),
							( 300,			N'������',									2 ),
							( 268,			N'������',									2 ),
							( 316,			N'����',									7 ),
							( 208,			N'�����',									2 ),
							( 832,			N'������',									2 ),
							( 262,			N'�������',									5 ),
							( 212,			N'��������',								5 ),
							( 214,			N'������������� ����������',				5 ),
							( 818,			N'������',									2 ),
							( 894,			N'������',									5 ),
							( 732,			N'�������� ������',							5 ),
							( 716,			N'��������',								5 ),
							( 887,			N'�����',									7 ),
							( 376,			N'�������',									2 ),
							( 356,			N'�����',									5 ),
							( 360,			N'���������',								2 ),
							( 400,			N'��������',								5 ),
							( 368,			N'����',									7 ),
							( 364,			N'����',									7 ),
							( 372,			N'��������',								2 ),
							( 352,			N'��������',								2 ),
							( 724,			N'�������',									2 ),
							( 380,			N'������',									2 ),
							( 132,			N'����-�����',								5 ),
							( 398,			N'���������',								2 ),
							( 116,			N'��������',								2 ),
							( 120,			N'�������',									5 ),
							( 124,			N'������',									2 ),
							( 634,			N'�����',									5 ),
							( 404,			N'�����',									5 ),
							( 196,			N'����',									2 ),
							( 417,			N'��������',								2 ),
							( 296,			N'��������',								5 ),
							( 156,			N'�����',									2 ),
							( 166,			N'��������� �������',						5 ),
							( 170,			N'��������',								5 ),
							( 174,			N'������',									5 ),
							( 178,			N'�����',									5 ),
							( 180,			N'�����',									5 ),
							( 408,			N'�����',									7 ),
							( 410,			N'�����',									7 ),
							( 188,			N'�����-����',								5 ),
							( 384,			N'��� ������',								2 ),
							( 192,			N'����',									5 ),
							( 414,			N'������',									5 ),
							( 531,			N'�������',									5 ),
							( 418,			N'�������� �������-��������������� ����������', 5 ),
							( 428,			N'������',									2 ),
							( 426,			N'������',									5 ),
							( 430,			N'�������',									5 ),
							( 422,			N'�����',									5 ),
							( 434,			N'�����',									7 ),
							( 440,			N'�����',									2 ),
							( 438,			N'�����������',								5 ),
							( 442,			N'����������',								2 ),
							( 480,			N'��������',								5 ),
							( 478,			N'����������',								5 ),
							( 450,			N'����������',								5 ),
							( 175,			N'�������',									5 ),
							( 446,			N'�����',									5 ),
							( 454,			N'������',									5 ),
							( 458,			N'��������',								5 ),
							( 466,			N'����',									5 ),
							( 581,			N'����� ������������� ���������� ������� ����������� ������', 2 ),
							( 462,			N'��������',								5 ),
							( 470,			N'������',									2 ),
							( 504,			N'�������',									5 ),
							( 474,			N'���������',								5 ),
							( 584,			N'���������� �������',						5 ),
							( 484,			N'�������',									5 ),
							( 583,			N'����������',								5 ),
							( 508,			N'��������',								5 ),
							( 498,			N'�������',									2 ),
							( 492,			N'������',									5 ),
							( 496,			N'��������',								5 ),
							( 500,			N'����������',								5 ),
							( 104,			N'������',									5 ),
							( 516,			N'�������',									5 ),
							( 520,			N'�����',									5 ),
							( 524,			N'�����',									2 ),
							( 562,			N'�����',									7 ),
							( 566,			N'�������',									5 ),
							( 528,			N'����������',								2 ),
							( 558,			N'���������',								5 ),
							( 570,			N'����',									5 ),
							( 554,			N'����� ��������',							2 ),
							( 540,			N'����� ���������',							5 ),
							( 578,			N'��������',								2 ),
							( 784,			N'������������ �������� �������',			2 ),
							( 512,			N'����',									5 ),
							( 074,			N'������ ����',								2 ),
							( 833,			N'������ ���',								2 ),
							( 574,			N'������ �������',							5 ),
							( 162,			N'������ ���������',						2 ),
							( 334,			N'������ ���� � ������� ����������',		2 ),
							( 136,			N'������� ������',							5 ),
							( 184,			N'������� ����',							5 ),
							( 796,			N'������� ����� � ������',					5 ),
							( 586,			N'��������',								7 ),
							( 585,			N'�����',									2 ),
							( 275,			N'���������',								5 ),
							( 591,			N'������',									7 ),
							( 336,			N'������� ������� (����������� - ����� �������)', 2 ),
							( 598,			N'�����-����� ������',						5 ),
							( 600,			N'��������',								5 ),
							( 604,			N'����',									5 ),
							( 612,			N'�������',									5 ),
							( 616,			N'������',									2 ),
							( 620,			N'����������',								2 ),
							( 630,			N'������-����',								7 ),
							( 807,			N'���������� ���������',					2 ),
							( 638,			N'�������',									5 ),
							( 643,			N'������',									2 ),
							( 646,			N'������',									5 ),
							( 642,			N'�������',									2 ),
							( 882,			N'�����',									7 ),
							( 674,			N'���-������',								5 ),
							( 678,			N'���-���� � ��������',						5 ),
							( 682,			N'���������� ������',						7 ),
							( 748,			N'���������',								5 ),
							( 654,			N'������ �����, ������ ����������, �������-��-�����', 2 ),
							( 580,			N'�������� ���������� �������',				5 ),
							( 690,			N'�������',									5 ),
							( 652,			N'���-���������',							2 ),
							( 686,			N'�������',									5 ),
							( 663,			N'���-������',								5 ),
							( 534,			N'���-������ (������������� �����)',		2 ),
							( 666,			N'���-���� � �������',						5 ),
							( 670,			N'����-������� � ���������',				5 ),
							( 659,			N'����-���� � �����',						5 ),
							( 662,			N'����-�����',								5 ),
							( 688,			N'������',									2 ),
							( 702,			N'��������',								2 ),
							( 760,			N'��������� �������� ����������',			7 ),
							( 703,			N'��������',								2 ),
							( 705,			N'��������',								2 ),
							( 826,			N'����������� �����������',					2 ),
							( 840,			N'����������� �����',						5 ),
							( 090,			N'���������� �������',						5 ),
							( 706,			N'������',									5 ),
							( 729,			N'�����',									5 ),
							( 740,			N'�������',									5 ),
							( 694,			N'������-�����',							5 ),
							( 762,			N'�����������',								2 ),
							( 158,			N'������� (�����)',							5 ),
							( 764,			N'�������',									5 ),
							( 834,			N'��������(������������ ����������)',		2 ),
							( 626,			N'�����-�����',								2 ),
							( 768,			N'����',									2 ),
							( 772,			N'�������',									5 ),
							( 776,			N'�����',									5 ),
							( 780,			N'�������� � ������',						7 ),
							( 798,			N'������',									5 ),
							( 788,			N'�����',									7 ),
							( 795,			N'���������',								2 ),
							( 792,			N'������',									2 ),
							( 800,			N'������',									5 ),
							( 860,			N'����������',								2 ),
							( 804,			N'�������',									5 ),
							( 876,			N'������ � ������',							5 ),
							( 858,			N'�������',									5 ),
							( 234,			N'��������� �������',						2 ),
							( 242,			N'�����',									5 ),
							( 608,			N'���������',								5 ),
							( 246,			N'���������',								5 ),
							( 238,			N'������������ ������� (�����������)',		5 ),
							( 250,			N'�������',									2 ),
							( 254,			N'����������� ������',						2 ),
							( 258,			N'����������� ���������',					5 ),
							( 260,			N'����������� ����� ����������',			2 ),
							( 191,			N'��������',								2 ),
							( 140,			N'����������-����������� ����������',		5 ),
							( 148,			N'���',										5 ),
							( 499,			N'����������',								5 ),
							( 203,			N'������� ����������',						2 ),
							( 152,			N'����',									5 ),
							( 756,			N'���������',								2 ),
							( 752,			N'������',									2 ),
							( 744,			N'���������� � �� �����',					2 ),
							( 144,			N'���-�����',								7 ),
							( 218,			N'�������',									5 ),
							( 226,			N'�������������� ������',					5 ),
							( 248,			N'��������� �������',						2 ),
							( 222,			N'���-���������',							5 ),
							( 232,			N'�������',									5 ),
							( 233,			N'�������',									2 ),
							( 231,			N'�������',									7 ),
							( 710,			N'����� ������',							5 ),
							( 239,			N'����� �������� � ����� ���������� �������', 5 ),
							( 896,			N'����� ������',							2 ),
							( 728,			N'����� �����',								2 ),
							( 388,			N'������',									5 ),
							( 392,			N'������',									2 )
							
update Country
set Risk_St_Date = '2019-07-01'      
update Country
set Name_Country = upper(left(Name_Country,1)) + lower(substring(Name_Country,2,999))
go

INSERT INTO Section ([Name_Section],	[Risk_Section],	 [Risk_St_Date_Section])
VALUES				(N'(�� �������)',			0,			'2019-07-01'),
					(N'(�� �������)',			0,			'2019-07-01'),
					(N'����������������',		2,			'2019-07-01'),
					(N'�������������',			0,			'2019-07-01'),
					(N'����������������',		0,			'2019-07-01'),
					(N'���',					4,			'2019-07-01'),
					(N'��',						0,			'2019-07-01')
					
go
-----------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------
drop proc if exists ADD_Organization_Pers
go
CREATE PROCEDURE ADD_Organization_Pers(
									 @UNP_Org nvarchar(20) 
									,@Full_Name_Org nvarchar(200) 
									,@Short_Name_Org nvarchar(200) 
									,@Create_date_Org DateTIME NULL 
									,@Description_Org nvarchar(1000) 
									--,@Depozit nvarchar(50) 
									,@Ownership_Org bit 
									,@Tax_Debt bit 
									,@Debts_Enforcement_Documents bit
									,@False_Business bit
									,@Special_Risc bit 
									,@Execute_Proc bit 
									,@Bankruptcy_Proc bit 
									,@Liquidation_Proc bit 
									,@Resident bit 
									,@Broker_Client bit 
									,@Prev_Broker_Client bit
									,@Trading_experience bit
									,@Trader bit
									,@Manufacturer bit
									,@First_Accred bit 
									,@Second_Accred bit 
									,@Exchenge_Trading_Disorders bit 
									,@Negativ_Data bit 
									,@Reputation bit 
									,@Forced_Deposite bit
									,@Broker_Opinion nvarchar(1000) 
									,@Section_Head_Opinion nvarchar(1000) 
									,@Auditor_Opinion nvarchar(1000) 
									,@Country nvarchar (30)
									,@Name_Section nvarchar (20)
									,@Owner_Name nvarchar(1000)
									,@Head_Name nvarchar(1000)
									,@Prev_Liquidated bit
									,@Prev_Bankruptcy bit
									,@Prev_State_Debt bit
									,@Prev_Tax_Debt bit
									,@Prev_Execute_Proc bit
									,@Negativ_Data_Pers bit
									,@Description_Pers nvarchar(1000)
									,@Country_Pers nvarchar (100)
									,@Login_User nvarchar (100)
								)
AS
DECLARE @ID_Country INT
select @ID_Country = Country.ID_Country from Country where Country.Name_Country like @Country
DECLARE @ID_Risk INT
select  @ID_Risk = Risk.ID_Risk from Risk where Risk.Risk_End_Date is NULL
DECLARE @ID_Section INT
select  @ID_Section = Section.ID_Section from Section where Section.Name_Section like @Name_Section 
DECLARE @ID_Country_Pers INT 
select  @ID_Country_Pers = Country.ID_Country from Country where Country.Name_Country like @Country_Pers

DECLARE @ID_User INT 
select  @ID_User = Users.ID_User from Users where Users.Login_User like @Login_User



INSERT INTO 
			Organization([UNP_Org],	[Full_Name_Org], [Short_Name_Org],   [Create_date_Org],	[Description_Org],  [Ownership_Org],	[Tax_Debt], [Debts_Enforcement_Documents],[False_Business], [Special_Risc], [Execute_Proc], [Bankruptcy_Proc],  [Liquidation_Proc],  [Resident], [Broker_Client], [Prev_Broker_Client], [Trading_experience], [Trader], [Manufacturer], [First_Accred], [Second_Accred], [Exchenge_Trading_Disorders], [Negativ_Data], [Reputation], [Forced_Deposite],	 [Broker_Opinion], 	[Section_Head_Opinion], [Auditor_Opinion], [ID_Country], [ID_Section],  [ID_Risk], [ID_User])
VALUES					(@UNP_Org,	@Full_Name_Org,	 @Short_Name_Org, 	 @Create_date_Org,	@Description_Org,	 @Ownership_Org,	@Tax_Debt,	@Debts_Enforcement_Documents,  @False_Business,   @Special_Risc, @Execute_Proc,   @Bankruptcy_Proc, @Liquidation_Proc,	 @Resident,	 @Broker_Client,  @Prev_Broker_Client,	 @Trading_experience, @Trader,  @Manufacturer,   @First_Accred,	@Second_Accred,	@Exchenge_Trading_Disorders,  @Negativ_Data,  @Reputation, @Forced_Deposite,	@Broker_Opinion,  		@Section_Head_Opinion,  @Auditor_Opinion,	 @ID_Country, @ID_Section,	@ID_Risk, @ID_User)

INSERT INTO Persone (	[UNP_Org],  [Owner_Name], [Head_Name],	[Prev_Liquidated],	[Prev_Bankruptcy],	[Prev_State_Debt],	[Prev_Tax_Debt], [Prev_Execute_Proc],	[Negativ_Data_Pers], [Description_Pers],	[ID_Country_Pers] )
VALUES				(	@UNP_Org,	@Owner_Name,  @Head_Name,	@Prev_Liquidated,	@Prev_Bankruptcy,	@Prev_State_Debt,	@Prev_Tax_Debt,	 @Prev_Execute_Proc,	@Negativ_Data_Pers,  @Description_Pers,		@ID_Country_Pers )

go
-----------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------
drop proc if exists check_login 
go
Create PROC check_login (@Login_User nvarchar(50)) as -- ����� �� �������� ������
SELECT COUNT(*)
from Users
Where Login_User = @Login_User
go
-----------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------
drop proc if exists check_log_pass --�������� �� ����������� ������ ���������� ������
go
Create PROCEDURE check_log_pass (@Login_User nvarchar(50), @Password_User nvarchar(50)) as
SELECT COUNT(*) 
FROM Users
WHERE Login_User = @Login_User and Password_User = HASHBYTES('MD5', @Password_User)


go
-----------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------
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
-----------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------
drop proc if exists Check_UNP-- �������� �� ������������ ���
go 
Create PROC Check_UNP (@UNP_Org nvarchar(40)) as 
SELECT COUNT(*)
from Organization
Where UNP_Org = @UNP_Org
go
-----------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------
drop proc if exists Check_Short_Name_Org -- �������� �� ������������ �������� �����
go 
Create PROC Check_Short_Name_Org (@Short_Name_Org nvarchar(100)) as 
SELECT COUNT(*)
from Organization
Where Short_Name_Org = @Short_Name_Org
go
-----------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------
drop proc if exists Check_Full_Name_Org -- �������� �� ������������ ������� ����� �����������
go 
Create PROC Check_Full_Name_Org (@Full_Name_Org nvarchar(200)) as 
SELECT COUNT(*)
from Organization
Where Full_Name_Org = @Full_Name_Org
go
-----------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------
DROP PROC if exists Risk_Country_ORG
go
CREATE PROCEDURE [Risk_Country_ORG]( @Name_Country nvarchar(100) = NULL) -- ����� ��� ������� ������� ����� �� ������ ��� ComboBox
as
select Country.Risk_Country
from Country
WHERE	
		(@Name_Country is null or Country.Name_Country = @Name_Country)
	AND 
		Risk_End_Date is NULL
go

/*
ALTER PROCEDURE Risk_Country_ORG
( @Name_Country nvarchar(100) = NULL) -- ����� ��� ������� ������� ����� �� ������ ��� ComboBox
as
select Country.Risk_Country
from Country
WHERE	
		(@Name_Country is null or Country.Name_Country = @Name_Country)
	AND 
		Risk_End_Date is NULL

go

*/
-----------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------
DROP PROC if exists Risk_Section_ORG
go
CREATE PROCEDURE [Risk_Section_ORG]( @Name_Section nvarchar(50) = NULL) -- ����� ��� ������� ������� ����� �� ������ ��� ComboBox
as
select Section.Risk_Section
from Section
WHERE	
		(@Name_Section is null or Section.Name_Section = @Name_Section)
	AND 
		Risk_End_Date_Section is NULL

go

/*
ALTER PROCEDURE Risk_Section_ORG
( @Name_Section nvarchar(50) = NULL) -- ����� ��� ������� ������� ����� �� ������ ��� ComboBox
as
select Section.Risk_Section
from Section
WHERE	
		(@Name_Section is null or Section.Name_Section = @Name_Section)
	AND 
		Risk_End_Date_Section is NULL

go
*/
-----------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------
DROP PROC if exists All_Check_Risk
go
CREATE PROCEDURE All_Check_Risk
AS 
SELECT 		 Ownership_Org  
			,Tax_Debt  
			,Debts_Enforcement_Documents
			,False_Business 
			,Special_Risc  
			,Execute_Proc  
			,Bankruptcy_Proc  
			,Liquidation_Proc  
			,Resident  
			,Broker_Client  
			,Trading_experience 
			,Manufacturer 
			,Exchenge_Trading_Disorders  
			,Negativ_Data  
			,Reputation  
			,Prev_Liquidated 
			,Prev_Bankruptcy 
			,Prev_State_Debt 
			,Prev_Tax_Debt 
			,Prev_Execute_Proc 
			,Age_Org_Risk
from Risk
go
-----------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------
DROP VIEW if exists [View_Risc_Level]
go

CREATE VIEW View_Risc_Level
AS


select *,  case when [������� �����] <= 10 then N'������� �� ��������� �����'Else N'������� �� �������� �������'  end as [������������� ��� �������]
		  ,case when [������� �����] <= 10 and Forced_Deposite = 0 then N'������� �� ��������� �����'  when [������� �����] <= 10 AND Forced_Deposite is NULL then N'������� �� ��������� �����' when [������� �����] <= 10 and Forced_Deposite = 1 then N'������� �� �������� �������'   
				when [������� �����] >= 10 and Forced_Deposite = 0 then N'������� �� �������� �������' when [������� �����] >= 10 AND Forced_Deposite is NULL then N'������� �� �������� �������'  when [������� �����] >= 10 and Forced_Deposite = 1 then N'������� �� ��������� �����'
		  end    as [��� �������]  
from (
select Organization.UNP_Org
		,case when Organization.Ownership_Org				= 0 THEN Risk.Ownership_Org					else 0 end-- 
		+case when Organization.Broker_Client				= 0 THEN Risk.Broker_Client					else 0 end-- 
		+case when Organization.Trading_experience			= 0 THEN Risk.Trading_experience			else 0 end-- 
		+case when Organization.Manufacturer				= 0 THEN Risk.Manufacturer					else 0 end-- 
		+case when Organization.Tax_Debt					= 1 THEN Risk.Tax_Debt						else 0 end
		+case when Organization.Debts_Enforcement_Documents	= 1 THEN Risk.Debts_Enforcement_Documents	else 0 end
		+case when Organization.False_Business				= 1 THEN Risk.False_Business				else 0 end
		+case when Organization.Special_Risc				= 1 THEN Risk.Special_Risc					else 0 end
		+case when Organization.Execute_Proc				= 1 THEN Risk.Execute_Proc					else 0 end
		+case when Organization.Bankruptcy_Proc				= 1 THEN Risk.Bankruptcy_Proc				else 0 end
		+case when Organization.Liquidation_Proc			= 1 THEN Risk.Liquidation_Proc				else 0 end
		+case when Organization.Resident					= 0 THEN Risk.Resident						else 0 end--
		+case when Organization.Exchenge_Trading_Disorders	= 1 THEN Risk.Exchenge_Trading_Disorders	else 0 end
		+case when Organization.Negativ_Data				= 1 THEN Risk.Negativ_Data					else 0 end
		+case when Organization.Reputation					= 0 THEN Risk.Reputation					else 0 end-- 
		+case when Persone.Prev_Liquidated					= 1 THEN Risk.Prev_Liquidated				else 0 end
		+case when Persone.Prev_Bankruptcy					= 1 THEN Risk.Prev_Bankruptcy				else 0 end
		+case when Persone.Prev_State_Debt					= 1 THEN Risk.Prev_State_Debt				else 0 end
		+case when Persone.Prev_Tax_Debt					= 1 THEN Risk.Prev_Tax_Debt					else 0 end
		+case when Persone.Prev_Execute_Proc				= 1 THEN Risk.Prev_Execute_Proc				else 0 end
		+case when Persone.Negativ_Data_Pers				= 1 THEN Risk.Negativ_Data					else 0 end
		+case when Organization.Age_Org						< 12 then Risk.Age_Org_Risk					else 0 end
		+Country.Risk_Country
		+Section.Risk_Section 
		+CountryPerson.Risk_Country
         as [������� �����]
		,Organization.Forced_Deposite

from Organization 
				JOIN Risk	 on Organization.ID_Risk = Risk.ID_Risk
				JOIN Persone on Organization.UNP_Org = Persone.UNP_Org
				JOIN Country on Organization.ID_Country = Country.ID_Country
				JOIN Section on Organization.ID_Section = Section.ID_Section
				Join Country as CountryPerson on Persone.ID_Country_Pers = CountryPerson.ID_Country				
) as ��������������� 
GO
-----------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------
DROP PROC if exists [Select_For_Apdate]
go

Create Procedure [Select_For_Apdate] ( @UNP_Org nvarchar(20) = NULL
									  ,@Full_Name_Org nvarchar(200) = NULL 
									  ,@Short_Name_Org nvarchar(200) = NULL)
as
SELECT Organization.*
	  ,View_Risc_Level.*
	  ,Users.*
      ,Persone.*
	  ,Risk.*
	  ,Section.*
	  ,Country.*
      ,CountryPerson.Name_Country  as Country_Pers
	  
FROM Organization	
JOIN Risk	 on Organization.ID_Risk = Risk.ID_Risk
JOIN Persone on Organization.UNP_Org = Persone.UNP_Org
JOIN Country on Organization.ID_Country = Country.ID_Country
JOIN Section on Organization.ID_Section = Section.ID_Section
Join Country as CountryPerson on Persone.ID_Country_Pers = CountryPerson.ID_Country
Join Users on Organization.ID_User = Users.ID_User
Join View_Risc_Level on Organization.UNP_Org = View_Risc_Level.UNP_Org

WHERE
			(@UNP_Org is null or Organization.UNP_Org = @UNP_Org)
		AND
			(@Full_Name_Org is null or Organization.Full_Name_Org like '%' + @Full_Name_Org + '%' )
		AND
			(@Short_Name_Org is null or Organization.Short_Name_Org like '%' + @Short_Name_Org + '%')
		 
GO
-----------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------
DROP proc IF Exists [General_SELECT]
go

CREATE PROCEDURE [General_SELECT]  ( @UNP_Org nvarchar(20) = NULL
									,@Full_Name_Org nvarchar(200) = NULL 
									,@Short_Name_Org nvarchar(200) = NULL
									,@Create_date_Org_FINAL DateTIME = NULL 
									,@Create_date_Org_START DateTIME = NULL 
									,@Description_Org nvarchar(1000) = NULL
									,@Ownership_Org bit = NULL
									,@Tax_Debt bit = NULL
									,@Debts_Enforcement_Documents bit = NULL
									,@False_Business bit = NULL
									,@Special_Risc bit = NULL
									,@Execute_Proc bit = NULL
									,@Bankruptcy_Proc bit = NULL
									,@Liquidation_Proc bit = NULL
									,@Resident bit = NULL
									,@Broker_Client bit = NULL
									,@Prev_Broker_Client bit = NULL
									,@Trading_experience bit = NULL
									,@Trader bit = NULL
									,@Manufacturer bit = NULL
									,@First_Accred bit = NULL
									,@Second_Accred bit = NULL
									,@Exchenge_Trading_Disorders bit = NULL
									,@Negativ_Data bit = NULL
									,@Reputation bit = NULL
									,@Forced_Deposite INT = NULL
									,@Broker_Opinion nvarchar(1000) = NULL
									,@Section_Head_Opinion nvarchar(1000) = NULL
									,@Auditor_Opinion nvarchar(1000) = NULL
									,@Name_Country nvarchar (30) = NULL
									,@Name_Section nvarchar (20) = NULL
									,@Owner_Name nvarchar(50) = NULL
									,@Head_Name nvarchar(50) = NULL
									,@Prev_Liquidated bit = NULL
									,@Prev_Bankruptcy bit = NULL
									,@Prev_State_Debt bit = NULL
									,@Prev_Tax_Debt bit = NULL
									,@Prev_Execute_Proc bit = NULL
									,@Negativ_Data_Pers bit = NULL
									,@Description_Pers nvarchar(1000) = NULL
									,@Country_Pers nvarchar (20) = NULL
									,@Login_User nvarchar (50) = NULL
									,@Check_Date_Org_START DateTIME = NULL
									,@Check_Date_Org_FINAL DateTIME = NULL 
									,@Risc_Level_More INT = NULL
									,@Risc_Level_Less int = NULL)
as
SELECT 
		Organization.*
	  ,View_Risc_Level.*
	  ,Users.*
      ,Persone.*
	  ,Risk.*
	  ,Section.*
	  ,Country.*
      ,CountryPerson.Name_Country  as Country_Pers
	  ,(select Login_User FROM Users   WHERE ID_User  = Organization.ID_User) as [�����������]
	  ,(select Login_User FROM Users   WHERE ID_User  = Organization.ID_User_Update) as [����� ���������]
	  
FROM Organization	
JOIN Risk	 on Organization.ID_Risk = Risk.ID_Risk
JOIN Persone on Organization.UNP_Org = Persone.UNP_Org
JOIN Country on Organization.ID_Country = Country.ID_Country
JOIN Section on Organization.ID_Section = Section.ID_Section
Join Country as CountryPerson on Persone.ID_Country_Pers = CountryPerson.ID_Country
Join Users on Organization.ID_User = Users.ID_User
Join View_Risc_Level on Organization.UNP_Org = View_Risc_Level.UNP_Org

WHERE
			(@UNP_Org is null or Organization.UNP_Org = @UNP_Org)
		AND
			(@Full_Name_Org is null or Organization.Full_Name_Org like '%' + @Full_Name_Org + '%' )
		AND
			(@Short_Name_Org is null or Organization.Short_Name_Org like '%' + @Short_Name_Org + '%')
		AND 
			(@Name_Country is null or Country.Name_Country =  @Name_Country )
		AND
			(@Name_Section is null or Section.Name_Section = @Name_Section)
		AND
			(Create_date_Org is null or Organization.Create_date_Org Between @Create_date_Org_START and @Create_date_Org_FINAL)
		AND 
			(@Country_Pers is null or CountryPerson.Name_Country =  @Country_Pers )
		AND 
			(@Owner_Name is null or Persone.Owner_Name like '%' + @Owner_Name + '%' )
		AND 
			(@Head_Name is null or Persone.Head_Name like '%' + @Head_Name + '%' )
		AND
			(@Ownership_Org is null or @Ownership_Org = Organization.Ownership_Org)
		AND
			(@Tax_Debt is null or @Tax_Debt = Organization.Tax_Debt)
		AND
			(@Debts_Enforcement_Documents is null or @Debts_Enforcement_Documents = Organization.Debts_Enforcement_Documents)
		AND
			(@False_Business is null or @False_Business = Organization.False_Business)
		AND
			(@Special_Risc is null or @Special_Risc = Organization.Special_Risc)
		AND
			(@Execute_Proc is null or @Execute_Proc = Organization.Execute_Proc)
		AND
			(@Bankruptcy_Proc is null or @Bankruptcy_Proc = Organization.Bankruptcy_Proc)
		AND
			(@Liquidation_Proc is null or @Liquidation_Proc = Organization.Liquidation_Proc)
		AND
			(@Resident is null or @Resident = Organization.Resident)
		AND
			(@Broker_Client is null or @Broker_Client = Organization.Broker_Client)
		AND
			(@Prev_Broker_Client is null or @Prev_Broker_Client = Organization.Prev_Broker_Client)
		AND
			(@Trading_experience is null or @Trading_experience = Organization.Trading_experience)
		AND
			(@Trader is null or @Trader = Organization.Trader)
		AND
			(@Manufacturer is null or @Manufacturer = Organization.Manufacturer)
		AND
			(@First_Accred is null or @First_Accred = Organization.First_Accred)
		AND
			(@Second_Accred is null or @Second_Accred = Organization.Second_Accred)
		AND
			(@Exchenge_Trading_Disorders is null or @Exchenge_Trading_Disorders = Organization.Exchenge_Trading_Disorders)
		AND
			(@Negativ_Data is null or @Negativ_Data = Organization.Negativ_Data)
		AND
			(@Reputation is null or @Reputation = Organization.Reputation)
		AND
			(@Check_Date_Org_START is null or Organization.Check_Date_Org Between @Check_Date_Org_START and @Check_Date_Org_FINAL)
		AND
			(@Check_Date_Org_FINAL is null or Organization.Check_Date_Org Between @Check_Date_Org_START and @Check_Date_Org_FINAL)
		AND
			(@Prev_Tax_Debt is null or @Prev_Tax_Debt = Persone.Prev_Tax_Debt)
		AND
			(@Prev_State_Debt is null or @Prev_State_Debt = Persone.Prev_State_Debt)
		AND
			(@Prev_Liquidated is null or @Prev_Liquidated = Persone.Prev_Liquidated)
		AND
			(@Prev_Bankruptcy is null or @Prev_Bankruptcy = Persone.Prev_Bankruptcy)
		AND
			(@Prev_Execute_Proc is null or @Prev_Execute_Proc = Persone.Prev_Execute_Proc)
		AND
			(@Negativ_Data_Pers is null or @Negativ_Data_Pers = Persone.Negativ_Data_Pers)
		AND
			(@Prev_State_Debt is null or @Prev_State_Debt = Persone.Prev_State_Debt)
		AND 
			(@Risc_Level_Less is null or [������� �����] <= @Risc_Level_Less )
		AND 
			(@Risc_Level_More is null or [������� �����] >= @Risc_Level_More )	
		AND
			(@Forced_Deposite is null or @Forced_Deposite = Organization.Forced_Deposite)
go
-----------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------
DROP proc IF Exists Delete_ORG_Cascade
go

CREATE PROCEDURE Delete_ORG_Cascade ( @UNP_Org nvarchar(20) = NULL
							 ,@Full_Name_Org nvarchar(200) = NULL 
							 ,@Short_Name_Org nvarchar(200) = NULL)
as
Delete Organization	 
	  	  
FROM Organization	
JOIN Risk	 on Organization.ID_Risk = Risk.ID_Risk
JOIN Persone on Organization.UNP_Org = Persone.UNP_Org
JOIN Country on Organization.ID_Country = Country.ID_Country
JOIN Section on Organization.ID_Section = Section.ID_Section
Join Country as CountryPerson on Persone.ID_Country_Pers = CountryPerson.ID_Country
Join Users on Organization.ID_User = Users.ID_User
Join View_Risc_Level on Organization.UNP_Org = View_Risc_Level.UNP_Org
WHERE
			(@UNP_Org is null or Organization.UNP_Org = @UNP_Org)
		AND
			(@Full_Name_Org is null or Organization.Full_Name_Org like '%' + @Full_Name_Org + '%' )
		AND
			(@Short_Name_Org is null or Organization.Short_Name_Org like '%' + @Short_Name_Org + '%')		 
GO		
-----------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------
DROP PROC if exists [Select_For_Apdate]
go

Create Procedure [Select_For_Apdate] ( @UNP_Org nvarchar(20) = NULL
									  ,@Full_Name_Org nvarchar(200) = NULL 
									  ,@Short_Name_Org nvarchar(200) = NULL)
as
SELECT Organization.*
	  ,View_Risc_Level.*
	  ,Users.*
      ,Persone.*
	  ,Risk.*
	  ,Section.*
	  ,Country.*
      ,CountryPerson.Name_Country  as Country_Pers
	  
FROM Organization	
JOIN Risk	 on Organization.ID_Risk = Risk.ID_Risk
JOIN Persone on Organization.UNP_Org = Persone.UNP_Org
JOIN Country on Organization.ID_Country = Country.ID_Country
JOIN Section on Organization.ID_Section = Section.ID_Section
Join Country as CountryPerson on Persone.ID_Country_Pers = CountryPerson.ID_Country
Join Users on Organization.ID_User = Users.ID_User
Join View_Risc_Level on Organization.UNP_Org = View_Risc_Level.UNP_Org

WHERE
			(@UNP_Org is null or Organization.UNP_Org = @UNP_Org)
		AND
			(@Full_Name_Org is null or Organization.Full_Name_Org = @Full_Name_Org )
		AND
			(@Short_Name_Org is null or Organization.Short_Name_Org = @Short_Name_Org)
GO
-----------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------
Drop proc if exists Update_Cascade
go

CREATE PROCEDURE Update_Cascade (	 @UNP_Org nvarchar(20) = null
									,@Full_Name_Org nvarchar(200) = null 
									,@Short_Name_Org nvarchar(200) = null
									------------------
									,@UNP_Org_New nvarchar(20) = null
									,@Full_Name_Org_New nvarchar(200) = null 
									,@Short_Name_Org_New nvarchar(200)= null
									------------------
									,@Create_date_Org DateTIME NULL 
									,@Description_Org nvarchar(1000) 
									,@Ownership_Org bit 
									,@Tax_Debt bit 
									,@Debts_Enforcement_Documents bit
									,@False_Business bit
									,@Special_Risc bit 
									,@Execute_Proc bit 
									,@Bankruptcy_Proc bit 
									,@Liquidation_Proc bit 
									,@Resident bit 
									,@Broker_Client bit 
									,@Prev_Broker_Client bit
									,@Trading_experience bit
									,@Trader bit
									,@Manufacturer bit
									,@First_Accred bit 
									,@Second_Accred bit 
									,@Exchenge_Trading_Disorders bit 
									,@Negativ_Data bit 
									,@Reputation bit 
									,@Forced_Deposite bit
									,@Broker_Opinion nvarchar(1000) 
									,@Section_Head_Opinion nvarchar(1000) 
									,@Auditor_Opinion nvarchar(1000) 
									,@Country nvarchar (30)
									,@Name_Section nvarchar (20)
									--,@Update_Date_Org datetime
									------------------
									,@Owner_Name nvarchar(50)
									,@Head_Name nvarchar(50)
									,@Prev_Liquidated bit
									,@Prev_Bankruptcy bit
									,@Prev_State_Debt bit
									,@Prev_Tax_Debt bit
									,@Prev_Execute_Proc bit
									,@Negativ_Data_Pers bit
									,@Description_Pers nvarchar(1000)
									,@Country_Pers nvarchar (20)
									,@Login_User nvarchar (50) )
									
AS

DECLARE @ID_Country INT
select @ID_Country = Country.ID_Country from Country where Country.Name_Country like @Country
DECLARE @ID_Section INT
select  @ID_Section = Section.ID_Section from Section where Section.Name_Section like @Name_Section 
DECLARE @ID_Country_Pers INT 
select  @ID_Country_Pers = Country.ID_Country from Country where Country.Name_Country like @Country_Pers

DECLARE @ID_User_Update INT 
select  @ID_User_Update = Users.ID_User from Users where Users.Login_User like @Login_User
-----------

declare 
	 @UNP nvarchar(20) 
	,@Full_Name nvarchar(200) 
	,@Short_Name nvarchar(200) 

SELECT  
				 @UNP = UNP_Org
				,@Full_Name = Full_Name_Org
				,@Short_Name = Short_Name_Org
from Organization 
WHERE	
				(Organization.UNP_Org is NULL or Organization.UNP_Org = @UNP_Org)
				or
				(Organization.Full_Name_Org is NULL or Organization.Full_Name_Org = @Full_Name_Org)
				or
				(Organization.Short_Name_Org is NULL or Organization.Short_Name_Org = @Short_Name_Org)

if 	 @UNP is null
begin
	raiserror('Not found',16, 1)
	return
end
-----------


UPDATE Persone 
SET
						 Persone.Owner_Name  = @Owner_Name 
						,Persone.Head_Name = @Head_Name 
						,Persone.Prev_Liquidated = @Prev_Liquidated 
						,Persone.Prev_Bankruptcy = @Prev_Bankruptcy 
						,Persone.Prev_State_Debt = @Prev_State_Debt 
						,Persone.Prev_Tax_Debt = @Prev_Tax_Debt 
						,Persone.Prev_Execute_Proc = @Prev_Execute_Proc 
						,Persone.Negativ_Data_Pers = @Negativ_Data_Pers 
						,Persone.Description_Pers = @Description_Pers 
						,Persone.ID_Country_Pers = @ID_Country_Pers 	
where UNP_Org = @UNP

UPDATE Organization 
SET  
						-- Organization.UNP_Org = @UNP_Org_New
						--,Organization.Full_Name_Org = @Full_Name_Org_New
						--,Organization.Short_Name_Org = @Short_Name_Org_New
						 Organization.Create_date_Org = @Create_date_Org 
						,Organization.Description_Org = @Description_Org
						,Organization.Ownership_Org = @Ownership_Org  
						,Organization.Tax_Debt = @Tax_Debt  
						,Organization.Debts_Enforcement_Documents = @Debts_Enforcement_Documents 
						,Organization.False_Business  = @False_Business 
						,Organization.Special_Risc = @Special_Risc  
						,Organization.Execute_Proc = @Execute_Proc  
						,Organization.Bankruptcy_Proc = @Bankruptcy_Proc  
						,Organization.Liquidation_Proc = @Liquidation_Proc  
						,Organization.Resident = @Resident  
						,Organization.Broker_Client = @Broker_Client  
						,Organization.Prev_Broker_Client = @Prev_Broker_Client 
						,Organization.Trading_experience = @Trading_experience 
						,Organization.Trader = @Trader 
						,Organization.Manufacturer = @Manufacturer 
						,Organization.First_Accred  = @First_Accred  
						,Organization.Second_Accred = @Second_Accred  
						,Organization.Exchenge_Trading_Disorders = @Exchenge_Trading_Disorders  
						,Organization.Negativ_Data = @Negativ_Data  
						,Organization.Reputation = @Reputation  
						,Organization.Forced_Deposite = @Forced_Deposite 
						,Organization.Broker_Opinion = @Broker_Opinion  
						,Organization.Section_Head_Opinion = @Section_Head_Opinion 
						,Organization.Auditor_Opinion = @Auditor_Opinion
						,Organization.ID_Country = @ID_Country 
						,Organization.ID_Section = @ID_Section 
						,Update_Date_Org =    FORMAT(GETDATE(), 'dd/MMM/yyyy HH:mm:ss' , 'en-us')--hh:mm
						,ID_User_Update = @ID_User_Update
where UNP_Org = @UNP


if		(@UNP_Org_New <> @Unp)
	 or (@Full_Name_Org_New <> @Full_Name)
	 or (@Short_Name_Org_New <> @Short_Name)
begin 

UPDATE Organization 
	SET  
						 Organization.UNP_Org = isnull(@UNP_Org_New, UNP_Org)
						,Organization.Full_Name_Org = isnull(@Full_Name_Org_New,  Full_Name_Org)
						,Organization.Short_Name_Org = isnull (@Short_Name_Org_New, Short_Name_Org)
where UNP_Org = @UNP

END
go
-----------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------
DROP VIEW if exists [View_Section]
go

CREATE VIEW View_Section
AS
SELECT TOP 10000 * 
FROM Section
WHERE Risk_End_Date_Section IS NULL
ORDER BY Section.Name_Section
GO
-----------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------
DROP VIEW if exists [View_Country]
go

CREATE VIEW View_Country
AS 
			SELECT TOP 10000 ID_Country ,Country_Code ,Name_Country ,Risk_Country,Risk_St_Date ,Risk_End_Date 
			FROM Country
			WHERE Risk_End_Date is NULL
			ORDER BY Name_Country 
GO
-----------------------------------------------------------------------------------------


--SElect * from Organization
--SElect * from View_Risc_Level
--SElect * from Users
--SElect * from Persone
--SElect * from Risk
--SElect * from Section
--SElect * from Country
 

 -----------------------------------------------------------------------------------------------------
 --�������������� ��������� ������ �� �������� ���� � �������

--SELECT * from [View_Risc_Level]

/*
SELECT * from Organization
where Broker_Client = 0

SELECT * FROM View_Risc_Level
WHERE UNP_Org = '591473254'
*/ 