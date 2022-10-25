USE Kontragent
go
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
									,@Country_Pers nvarchar (20)
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





EXEC ADD_Organization_Pers
 @Country = N'Беларусь'
,@Name_Section = N'Лесопродукции'
,@UNP_Org = N'0r5es1ч42711'
,@Full_Name_Org = N'ХЕР' 
,@Short_Name_Org = N'Скоты'
,@Create_date_Org = '2009.07.08'
,@Description_Org = N'Регистрируется в качестве клиента брокера ЧП "БелВнешБрок" с целью реализации широкого круга товаров. Опыта работы не имеет. Сведения о деловой репутации отсутсвуют. Брокер не уверен в клиенте.' 
--,@Depozit = N'С предоставлением задатка по биржевым сделкам'
,@Ownership_Org			= 0 
,@Tax_Debt				= 0
,@Debts_Enforcement_Documents = 0
,@False_Business		= 0
,@Special_Risc			= 0 
,@Execute_Proc			= 0  
,@Bankruptcy_Proc		= 0
,@Liquidation_Proc		= 0 
,@Resident				= 1
,@Broker_Client			= 1-- клиент
,@Prev_Broker_Client	= 0
,@Trading_experience	= 1 -- опыт торгов
,@Trader				= 0
,@Manufacturer			= 0 -- производитель
,@First_Accred			= 0
,@Second_Accred			= 0
,@Exchenge_Trading_Disorders = 0 -- задолженности по исполнительным документам
,@Negativ_Data			= 0
,@Reputation			= 1 
,@Forced_Deposite		= 0
,@Broker_Opinion = N'Брокер не уверен в клиенте' 
,@Section_Head_Opinion = N'Не выяснялось'
,@Auditor_Opinion = N'Предприятие сырое, сайта нет, опыта работы нет. ТОчного намерения что хотят не имеют'  
,@Country_Pers = N'Беларусь'
,@Owner_Name = N'Решетка Тихон Владимирович, Решетко Евгений ВладимироыичРешетка Тихон Владимирович, Решетко Евгений ВладимироыичРешетка Тихон Владимирович, Решетко Евгений ВладимироыичРешетка Тихон Владимирович, Решетко Евгений Владимироыич'
,@Head_Name = N'Решетка Тихон ВладимировичРешетка Тихон Владимирович, Решетко Евгений ВладимироыичРешетка Тихон Владимирович, Решетко Евгений ВладимироыичРешетка Тихон Владимирович, Решетко Евгений Владимироыич'
,@Prev_Liquidated = 0
,@Prev_Bankruptcy = 0
,@Prev_State_Debt = 0
,@Prev_Tax_Debt = 0
,@Prev_Execute_Proc = 0
,@Description_Pers = 0
,@Negativ_Data_Pers = 1
,@Login_User = 'Карякин'
go





--SELECT * from [View_Risc_Level]

Select * from Persone
--Select * from Organization


