USE [master]
GO
/****** Object:  Database [Kontragent]    Script Date: 9/24/19 9:45:45 PM ******/
CREATE DATABASE [Kontragent]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Kontragent', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Kontragent.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Kontragent_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Kontragent_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Kontragent] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Kontragent].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Kontragent] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Kontragent] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Kontragent] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Kontragent] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Kontragent] SET ARITHABORT OFF 
GO
ALTER DATABASE [Kontragent] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Kontragent] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Kontragent] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Kontragent] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Kontragent] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Kontragent] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Kontragent] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Kontragent] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Kontragent] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Kontragent] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Kontragent] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Kontragent] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Kontragent] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Kontragent] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Kontragent] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Kontragent] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Kontragent] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Kontragent] SET RECOVERY FULL 
GO
ALTER DATABASE [Kontragent] SET  MULTI_USER 
GO
ALTER DATABASE [Kontragent] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Kontragent] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Kontragent] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Kontragent] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Kontragent] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Kontragent', N'ON'
GO
ALTER DATABASE [Kontragent] SET QUERY_STORE = OFF
GO
USE [Kontragent]
GO
/****** Object:  Table [dbo].[Risk]    Script Date: 9/24/19 9:45:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Risk](
	[ID_Risk] [int] IDENTITY(1,1) NOT NULL,
	[Age_Org_Risk] [int] NOT NULL,
	[Ownership_Org] [int] NOT NULL,
	[Broker_Client] [bit] NULL,
	[Trading_experience] [bit] NULL,
	[Manufacturer] [int] NOT NULL,
	[Tax_Debt] [int] NOT NULL,
	[Debts_Enforcement_Documents] [int] NOT NULL,
	[False_Business] [int] NOT NULL,
	[Special_Risc] [int] NOT NULL,
	[Execute_Proc] [int] NOT NULL,
	[Bankruptcy_Proc] [int] NOT NULL,
	[Liquidation_Proc] [int] NOT NULL,
	[Resident] [int] NOT NULL,
	[Exchenge_Trading_Disorders] [int] NOT NULL,
	[Negativ_Data] [int] NOT NULL,
	[Reputation] [int] NOT NULL,
	[Prev_Liquidated] [int] NOT NULL,
	[Prev_Bankruptcy] [int] NOT NULL,
	[Prev_State_Debt] [int] NULL,
	[Prev_Tax_Debt] [int] NOT NULL,
	[Prev_Execute_Proc] [int] NOT NULL,
	[Risk_St_Date] [datetime] NOT NULL,
	[Risk_End_Date] [datetime] NULL,
 CONSTRAINT [PK_ID_Risk] PRIMARY KEY CLUSTERED 
(
	[ID_Risk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Country]    Script Date: 9/24/19 9:45:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Country](
	[ID_Country] [int] IDENTITY(1,1) NOT NULL,
	[Country_Code] [int] NULL,
	[Name_Country] [nvarchar](1000) NOT NULL,
	[Risk_Country] [int] NOT NULL,
	[Risk_St_Date] [datetime] NULL,
	[Risk_End_Date] [datetime] NULL,
 CONSTRAINT [PK_ID_Country] PRIMARY KEY CLUSTERED 
(
	[ID_Country] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Section]    Script Date: 9/24/19 9:45:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Section](
	[ID_Section] [int] IDENTITY(1,1) NOT NULL,
	[Name_Section] [nvarchar](50) NOT NULL,
	[Risk_Section] [int] NOT NULL,
	[Risk_St_Date_Section] [datetime] NULL,
	[Risk_End_Date_Section] [datetime] NULL,
 CONSTRAINT [PK_ID_Section] PRIMARY KEY CLUSTERED 
(
	[ID_Section] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Organization]    Script Date: 9/24/19 9:45:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Organization](
	[UNP_Org] [nvarchar](100) NOT NULL,
	[Full_Name_Org] [nvarchar](500) NOT NULL,
	[Short_Name_Org] [nvarchar](500) NOT NULL,
	[Create_date_Org] [date] NOT NULL,
	[Age_Org]  AS (datediff(month,[Create_date_Org],[Check_Date_Org])),
	[Description_Org] [nvarchar](max) NOT NULL,
	[Ownership_Org] [bit] NOT NULL,
	[Tax_Debt] [bit] NOT NULL,
	[Debts_Enforcement_Documents] [bit] NOT NULL,
	[False_Business] [bit] NOT NULL,
	[Special_Risc] [bit] NOT NULL,
	[Execute_Proc] [bit] NOT NULL,
	[Bankruptcy_Proc] [bit] NOT NULL,
	[Liquidation_Proc] [bit] NOT NULL,
	[Resident] [bit] NOT NULL,
	[Broker_Client] [bit] NOT NULL,
	[Prev_Broker_Client] [bit] NOT NULL,
	[Trading_experience] [bit] NOT NULL,
	[Trader] [bit] NOT NULL,
	[Manufacturer] [bit] NOT NULL,
	[First_Accred] [bit] NOT NULL,
	[Second_Accred] [bit] NOT NULL,
	[Exchenge_Trading_Disorders] [bit] NOT NULL,
	[Negativ_Data] [bit] NOT NULL,
	[Reputation] [bit] NOT NULL,
	[Forced_Deposite] [bit] NOT NULL,
	[Broker_Opinion] [nvarchar](max) NULL,
	[Section_Head_Opinion] [nvarchar](max) NULL,
	[Auditor_Opinion] [nvarchar](max) NULL,
	[ID_Country] [int] NOT NULL,
	[ID_Section] [int] NOT NULL,
	[ID_Risk] [int] NOT NULL,
	[Check_Date_Org] [datetime] NULL,
	[ID_User] [int] NULL,
	[Update_Date_Org] [datetime] NULL,
	[ID_User_Update] [int] NULL,
 CONSTRAINT [PK_Org_UNP] PRIMARY KEY CLUSTERED 
(
	[UNP_Org] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Persone]    Script Date: 9/24/19 9:45:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Persone](
	[UNP_Org] [nvarchar](100) NOT NULL,
	[Owner_Name] [nvarchar](1000) NOT NULL,
	[Head_Name] [nvarchar](1000) NOT NULL,
	[Prev_Liquidated] [bit] NOT NULL,
	[Prev_Bankruptcy] [bit] NOT NULL,
	[Prev_State_Debt] [bit] NOT NULL,
	[Prev_Tax_Debt] [bit] NOT NULL,
	[Prev_Execute_Proc] [bit] NOT NULL,
	[Negativ_Data_Pers] [bit] NOT NULL,
	[Description_Pers] [nvarchar](max) NULL,
	[ID_Country_Pers] [int] NOT NULL,
 CONSTRAINT [PK_UNP_Org] PRIMARY KEY CLUSTERED 
(
	[UNP_Org] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[View_Risc_Level]    Script Date: 9/24/19 9:45:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[View_Risc_Level]
AS


select *,  case when [?????????????? ??????????] <= 10 then N'?????????????? ???? ?????????????????? ??????????'Else N'?????????????? ???? ???????????????? ??????????????'  end as [?????????????????????????? ?????? ??????????????]
		  ,case when [?????????????? ??????????] <= 10 and Forced_Deposite = 0 then N'?????????????? ???? ?????????????????? ??????????'  when [?????????????? ??????????] <= 10 AND Forced_Deposite is NULL then N'?????????????? ???? ?????????????????? ??????????' when [?????????????? ??????????] <= 10 and Forced_Deposite = 1 then N'?????????????? ???? ???????????????? ??????????????'   
				when [?????????????? ??????????] >= 10 and Forced_Deposite = 0 then N'?????????????? ???? ???????????????? ??????????????' when [?????????????? ??????????] >= 10 AND Forced_Deposite is NULL then N'?????????????? ???? ???????????????? ??????????????'  when [?????????????? ??????????] >= 10 and Forced_Deposite = 1 then N'?????????????? ???? ?????????????????? ??????????'
		  end    as [?????? ??????????????]  
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
         as [?????????????? ??????????]
		,Organization.Forced_Deposite

from Organization 
				JOIN Risk	 on Organization.ID_Risk = Risk.ID_Risk
				JOIN Persone on Organization.UNP_Org = Persone.UNP_Org
				JOIN Country on Organization.ID_Country = Country.ID_Country
				JOIN Section on Organization.ID_Section = Section.ID_Section
				Join Country as CountryPerson on Persone.ID_Country_Pers = CountryPerson.ID_Country				
) as ?????????????????????????????? 
GO
/****** Object:  View [dbo].[View_Section]    Script Date: 9/24/19 9:45:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[View_Section]
AS
SELECT TOP 10000 * 
FROM Section
WHERE Risk_End_Date_Section IS NULL
ORDER BY Section.Name_Section
GO
/****** Object:  View [dbo].[View_Country]    Script Date: 9/24/19 9:45:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[View_Country]
AS 
			SELECT TOP 10000 ID_Country ,Country_Code ,Name_Country ,Risk_Country,Risk_St_Date ,Risk_End_Date 
			FROM Country
			WHERE Risk_End_Date is NULL
			ORDER BY Name_Country 
GO
/****** Object:  Table [dbo].[Users]    Script Date: 9/24/19 9:45:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[ID_User] [int] IDENTITY(1,1) NOT NULL,
	[Login_User] [nvarchar](500) NOT NULL,
	[Password_User] [varbinary](512) NOT NULL,
	[Department] [nvarchar](1000) NOT NULL,
	[Hint] [nvarchar](1000) NULL,
	[Date_Creation_User] [datetime] NULL,
 CONSTRAINT [PK_ID_User] PRIMARY KEY CLUSTERED 
(
	[ID_User] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Country] ON 
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (1, 0, N'(???? ??????????????)', 0, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (2, 895, N'??????????????', 2, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (3, 36, N'??????????????????', 2, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (4, 40, N'??????????????', 2, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (5, 31, N'??????????????????????', 2, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (6, 8, N'??????????????', 2, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (7, 12, N'??????????', 5, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (8, 16, N'???????????????????????? ??????????', 7, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (9, 660, N'??????????????', 5, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (10, 24, N'????????????', 5, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (11, 20, N'??????????????', 5, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (12, 10, N'????????????????????', 5, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (13, 28, N'?????????????? ?? ??????????????', 5, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (14, 32, N'??????????????????', 5, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (15, 51, N'??????????????', 2, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (16, 533, N'??????????', 5, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (17, 4, N'????????????????????', 7, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (18, 44, N'????????????', 7, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (19, 50, N'??????????????????', 5, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (20, 52, N'????????????????', 5, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (21, 48, N'??????????????', 5, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (22, 112, N'????????????????', 0, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (23, 84, N'??????????', 5, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (24, 56, N'??????????????', 2, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (25, 204, N'??????????', 5, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (26, 60, N'??????????????', 5, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (27, 100, N'????????????????', 2, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (28, 68, N'??????????????', 5, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (29, 535, N'????????????', 5, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (30, 70, N'???????????? ?? ??????????????????????', 2, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (31, 72, N'????????????????', 7, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (32, 76, N'????????????????', 5, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (33, 86, N'???????????????????? ???????????????????? ?? ?????????????????? ????????????', 5, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (34, 96, N'????????????-????????????????????', 5, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (35, 854, N'??????????????-????????', 2, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (36, 108, N'??????????????', 5, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (37, 64, N'??????????', 5, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (38, 548, N'??????????????', 5, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (39, 348, N'??????????????', 2, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (40, 862, N'??????????????????', 5, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (41, 92, N'???????????????????? ??????????????(????????????????????)', 5, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (42, 850, N'???????????????????? ??????????????(??????)', 5, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (43, 704, N'??????????????', 5, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (44, 266, N'??????????', 5, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (45, 328, N'????????????', 5, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (46, 332, N'??????????', 5, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (47, 270, N'????????????', 5, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (48, 288, N'????????', 7, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (49, 312, N'??????????????????', 5, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (50, 320, N'??????????????????', 5, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (51, 324, N'????????????', 5, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (52, 624, N'????????????-??????????', 2, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (53, 276, N'????????????????', 2, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (54, 831, N'????????????', 2, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (55, 292, N'??????????????????', 5, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (56, 340, N'????????????????', 5, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (57, 344, N'??????????????', 2, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (58, 308, N'??????????????', 5, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (59, 304, N'????????????????????', 2, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (60, 300, N'????????????', 2, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (61, 268, N'????????????', 2, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (62, 316, N'????????', 7, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (63, 208, N'??????????', 2, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (64, 832, N'????????????', 2, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (65, 262, N'??????????????', 5, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (66, 212, N'????????????????', 5, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (67, 214, N'?????????????????????????? ????????????????????', 5, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (68, 818, N'????????????', 2, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (69, 894, N'????????????', 5, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (70, 732, N'???????????????? ????????????', 5, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (71, 716, N'????????????????', 5, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (72, 887, N'??????????', 7, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (73, 376, N'??????????????', 2, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (74, 356, N'??????????', 5, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (75, 360, N'??????????????????', 2, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (76, 400, N'????????????????', 5, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (77, 368, N'????????', 7, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (78, 364, N'????????', 7, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (79, 372, N'????????????????', 2, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (80, 352, N'????????????????', 2, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (81, 724, N'??????????????', 2, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (82, 380, N'????????????', 2, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (83, 132, N'????????-??????????', 5, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (84, 398, N'??????????????????', 2, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (85, 116, N'????????????????', 2, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (86, 120, N'??????????????', 5, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (87, 124, N'????????????', 2, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (88, 634, N'??????????', 5, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (89, 404, N'??????????', 5, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (90, 196, N'????????', 2, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (91, 417, N'????????????????', 2, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (92, 296, N'????????????????', 5, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (93, 156, N'??????????', 2, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (94, 166, N'?????????????????? ??????????????', 5, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (95, 170, N'????????????????', 5, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (96, 174, N'????????????', 5, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (97, 178, N'??????????', 5, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (98, 180, N'??????????', 5, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (99, 408, N'??????????', 7, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (100, 410, N'??????????', 7, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (101, 188, N'??????????-????????', 5, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (102, 384, N'?????? ????????????', 2, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (103, 192, N'????????', 5, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (104, 414, N'????????????', 5, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (105, 531, N'??????????????', 5, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (106, 418, N'???????????????? ??????????????-?????????????????????????????? ????????????????????', 5, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (107, 428, N'????????????', 2, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (108, 426, N'????????????', 5, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (109, 430, N'??????????????', 5, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (110, 422, N'??????????', 5, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (111, 434, N'??????????', 7, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (112, 440, N'??????????', 2, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (113, 438, N'??????????????????????', 5, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (114, 442, N'????????????????????', 2, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (115, 480, N'????????????????', 5, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (116, 478, N'????????????????????', 5, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (117, 450, N'????????????????????', 5, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (118, 175, N'??????????????', 5, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (119, 446, N'??????????', 5, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (120, 454, N'????????????', 5, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (121, 458, N'????????????????', 5, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (122, 466, N'????????', 5, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (123, 581, N'?????????? ?????????????????????????? ???????????????????? ?????????????? ?????????????????????? ????????????', 2, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (124, 462, N'????????????????', 5, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (125, 470, N'????????????', 2, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (126, 504, N'??????????????', 5, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (127, 474, N'??????????????????', 5, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (128, 584, N'???????????????????? ??????????????', 5, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (129, 484, N'??????????????', 5, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (130, 583, N'????????????????????', 5, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (131, 508, N'????????????????', 5, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (132, 498, N'??????????????', 2, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (133, 492, N'????????????', 5, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (134, 496, N'????????????????', 5, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (135, 500, N'????????????????????', 5, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (136, 104, N'????????????', 5, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (137, 516, N'??????????????', 5, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (138, 520, N'??????????', 5, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (139, 524, N'??????????', 2, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (140, 562, N'??????????', 7, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (141, 566, N'??????????????', 5, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (142, 528, N'????????????????????', 2, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (143, 558, N'??????????????????', 5, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (144, 570, N'????????', 5, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (145, 554, N'?????????? ????????????????', 2, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (146, 540, N'?????????? ??????????????????', 5, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (147, 578, N'????????????????', 2, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (148, 784, N'???????????????????????? ???????????????? ??????????????', 2, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (149, 512, N'????????', 5, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (150, 74, N'???????????? ????????', 2, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (151, 833, N'???????????? ??????', 2, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (152, 574, N'???????????? ??????????????', 5, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (153, 162, N'???????????? ??????????????????', 2, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (154, 334, N'???????????? ???????? ?? ?????????????? ????????????????????', 2, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (155, 136, N'?????????????? ????????????', 5, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (156, 184, N'?????????????? ????????', 5, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (157, 796, N'?????????????? ?????????? ?? ????????????', 5, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (158, 586, N'????????????????', 7, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (159, 585, N'??????????', 2, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (160, 275, N'??????????????????', 5, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (161, 591, N'????????????', 7, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (162, 336, N'?????????????? ?????????????? (?????????????????????? - ?????????? ??????????????)', 2, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (163, 598, N'??????????-?????????? ????????????', 5, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (164, 600, N'????????????????', 5, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (165, 604, N'????????', 5, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (166, 612, N'??????????????', 5, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (167, 616, N'????????????', 2, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (168, 620, N'????????????????????', 2, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (169, 630, N'????????????-????????', 7, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (170, 807, N'???????????????????? ??????????????????', 2, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (171, 638, N'??????????????', 5, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (172, 643, N'????????????', 2, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (173, 646, N'????????????', 5, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (174, 642, N'??????????????', 2, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (175, 882, N'??????????', 7, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (176, 674, N'??????-????????????', 5, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (177, 678, N'??????-???????? ?? ????????????????', 5, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (178, 682, N'???????????????????? ????????????', 7, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (179, 748, N'??????????????????', 5, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (180, 654, N'???????????? ??????????, ???????????? ????????????????????, ??????????????-????-??????????', 2, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (181, 580, N'???????????????? ???????????????????? ??????????????', 5, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (182, 690, N'??????????????', 5, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (183, 652, N'??????-??????????????????', 2, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (184, 686, N'??????????????', 5, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (185, 663, N'??????-????????????', 5, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (186, 534, N'??????-???????????? (?????????????????????????? ??????????)', 2, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (187, 666, N'??????-???????? ?? ??????????????', 5, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (188, 670, N'????????-?????????????? ?? ??????????????????', 5, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (189, 659, N'????????-???????? ?? ??????????', 5, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (190, 662, N'????????-??????????', 5, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (191, 688, N'????????????', 2, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (192, 702, N'????????????????', 2, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (193, 760, N'?????????????????? ???????????????? ????????????????????', 7, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (194, 703, N'????????????????', 2, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (195, 705, N'????????????????', 2, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (196, 826, N'?????????????????????? ??????????????????????', 2, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (197, 840, N'?????????????????????? ??????????', 5, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (198, 90, N'???????????????????? ??????????????', 5, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (199, 706, N'????????????', 5, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (200, 729, N'??????????', 5, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (201, 740, N'??????????????', 5, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (202, 694, N'????????????-??????????', 5, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (203, 762, N'??????????????????????', 2, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (204, 158, N'?????????????? (??????????)', 5, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (205, 764, N'??????????????', 5, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (206, 834, N'????????????????(???????????????????????? ????????????????????)', 2, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (207, 626, N'??????????-??????????', 2, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (208, 768, N'????????', 2, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (209, 772, N'??????????????', 5, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (210, 776, N'??????????', 5, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (211, 780, N'???????????????? ?? ????????????', 7, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (212, 798, N'????????????', 5, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (213, 788, N'??????????', 7, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (214, 795, N'??????????????????', 2, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (215, 792, N'????????????', 2, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (216, 800, N'????????????', 5, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (217, 860, N'????????????????????', 2, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (218, 804, N'??????????????', 5, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (219, 876, N'???????????? ?? ????????????', 5, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (220, 858, N'??????????????', 5, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (221, 234, N'?????????????????? ??????????????', 2, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (222, 242, N'??????????', 5, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (223, 608, N'??????????????????', 5, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (224, 246, N'??????????????????', 5, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (225, 238, N'???????????????????????? ?????????????? (??????????????????????)', 5, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (226, 250, N'??????????????', 2, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (227, 254, N'?????????????????????? ????????????', 2, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (228, 258, N'?????????????????????? ??????????????????', 5, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (229, 260, N'?????????????????????? ?????????? ????????????????????', 2, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (230, 191, N'????????????????', 2, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (231, 140, N'????????????????????-?????????????????????? ????????????????????', 5, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (232, 148, N'??????', 5, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (233, 499, N'????????????????????', 5, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (234, 203, N'?????????????? ????????????????????', 2, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (235, 152, N'????????', 5, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (236, 756, N'??????????????????', 2, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (237, 752, N'????????????', 2, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (238, 744, N'???????????????????? ?? ???? ??????????', 2, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (239, 144, N'??????-??????????', 7, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (240, 218, N'??????????????', 5, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (241, 226, N'???????????????????????????? ????????????', 5, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (242, 248, N'?????????????????? ??????????????', 2, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (243, 222, N'??????-??????????????????', 5, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (244, 232, N'??????????????', 5, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (245, 233, N'??????????????', 2, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (246, 231, N'??????????????', 7, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (247, 710, N'?????????? ????????????', 5, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (248, 239, N'?????????? ???????????????? ?? ?????????? ???????????????????? ??????????????', 5, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (249, 896, N'?????????? ????????????', 2, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (250, 728, N'?????????? ??????????', 2, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (251, 388, N'????????????', 5, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Country] ([ID_Country], [Country_Code], [Name_Country], [Risk_Country], [Risk_St_Date], [Risk_End_Date]) VALUES (252, 392, N'????????????', 2, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
SET IDENTITY_INSERT [dbo].[Country] OFF
GO
INSERT [dbo].[Organization] ([UNP_Org], [Full_Name_Org], [Short_Name_Org], [Create_date_Org], [Description_Org], [Ownership_Org], [Tax_Debt], [Debts_Enforcement_Documents], [False_Business], [Special_Risc], [Execute_Proc], [Bankruptcy_Proc], [Liquidation_Proc], [Resident], [Broker_Client], [Prev_Broker_Client], [Trading_experience], [Trader], [Manufacturer], [First_Accred], [Second_Accred], [Exchenge_Trading_Disorders], [Negativ_Data], [Reputation], [Forced_Deposite], [Broker_Opinion], [Section_Head_Opinion], [Auditor_Opinion], [ID_Country], [ID_Section], [ID_Risk], [Check_Date_Org], [ID_User], [Update_Date_Org], [ID_User_Update]) VALUES (N'2', N'2', N'2', CAST(N'2012-12-12' AS Date), N'2', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, N'??????', N'??????', N'??????', 6, 2, 1, CAST(N'2019-09-24T20:18:39.000' AS DateTime), 1, NULL, NULL)
GO
INSERT [dbo].[Organization] ([UNP_Org], [Full_Name_Org], [Short_Name_Org], [Create_date_Org], [Description_Org], [Ownership_Org], [Tax_Debt], [Debts_Enforcement_Documents], [False_Business], [Special_Risc], [Execute_Proc], [Bankruptcy_Proc], [Liquidation_Proc], [Resident], [Broker_Client], [Prev_Broker_Client], [Trading_experience], [Trader], [Manufacturer], [First_Accred], [Second_Accred], [Exchenge_Trading_Disorders], [Negativ_Data], [Reputation], [Forced_Deposite], [Broker_Opinion], [Section_Head_Opinion], [Auditor_Opinion], [ID_Country], [ID_Section], [ID_Risk], [Check_Date_Org], [ID_User], [Update_Date_Org], [ID_User_Update]) VALUES (N'222', N'222', N'222', CAST(N'2012-12-12' AS Date), N'dfgfds', 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 0, N'??????', N'qwsd', N'wsedfg', 7, 2, 1, CAST(N'2019-09-24T19:53:54.000' AS DateTime), 1, NULL, NULL)
GO
INSERT [dbo].[Organization] ([UNP_Org], [Full_Name_Org], [Short_Name_Org], [Create_date_Org], [Description_Org], [Ownership_Org], [Tax_Debt], [Debts_Enforcement_Documents], [False_Business], [Special_Risc], [Execute_Proc], [Bankruptcy_Proc], [Liquidation_Proc], [Resident], [Broker_Client], [Prev_Broker_Client], [Trading_experience], [Trader], [Manufacturer], [First_Accred], [Second_Accred], [Exchenge_Trading_Disorders], [Negativ_Data], [Reputation], [Forced_Deposite], [Broker_Opinion], [Section_Head_Opinion], [Auditor_Opinion], [ID_Country], [ID_Section], [ID_Risk], [Check_Date_Org], [ID_User], [Update_Date_Org], [ID_User_Update]) VALUES (N'3', N'312', N'3', CAST(N'2012-12-12' AS Date), N'2', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 1, N'??????', N'??????', N'??????', 6, 2, 1, CAST(N'2019-09-24T20:20:42.000' AS DateTime), 1, NULL, NULL)
GO
INSERT [dbo].[Organization] ([UNP_Org], [Full_Name_Org], [Short_Name_Org], [Create_date_Org], [Description_Org], [Ownership_Org], [Tax_Debt], [Debts_Enforcement_Documents], [False_Business], [Special_Risc], [Execute_Proc], [Bankruptcy_Proc], [Liquidation_Proc], [Resident], [Broker_Client], [Prev_Broker_Client], [Trading_experience], [Trader], [Manufacturer], [First_Accred], [Second_Accred], [Exchenge_Trading_Disorders], [Negativ_Data], [Reputation], [Forced_Deposite], [Broker_Opinion], [Section_Head_Opinion], [Auditor_Opinion], [ID_Country], [ID_Section], [ID_Risk], [Check_Date_Org], [ID_User], [Update_Date_Org], [ID_User_Update]) VALUES (N'??????', N'????????????', N'??????????????', CAST(N'2012-12-12' AS Date), N'1', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, N'??????', N'??????', N'??????', 5, 2, 1, CAST(N'2019-09-24T19:32:45.000' AS DateTime), 1, NULL, NULL)
GO
INSERT [dbo].[Persone] ([UNP_Org], [Owner_Name], [Head_Name], [Prev_Liquidated], [Prev_Bankruptcy], [Prev_State_Debt], [Prev_Tax_Debt], [Prev_Execute_Proc], [Negativ_Data_Pers], [Description_Pers], [ID_Country_Pers]) VALUES (N'2', N'2', N'2', 0, 0, 0, 0, 0, 0, N'2', 7)
GO
INSERT [dbo].[Persone] ([UNP_Org], [Owner_Name], [Head_Name], [Prev_Liquidated], [Prev_Bankruptcy], [Prev_State_Debt], [Prev_Tax_Debt], [Prev_Execute_Proc], [Negativ_Data_Pers], [Description_Pers], [ID_Country_Pers]) VALUES (N'222', N'asd', N'dfgf', 1, 0, 0, 0, 1, 1, N'dsa', 8)
GO
INSERT [dbo].[Persone] ([UNP_Org], [Owner_Name], [Head_Name], [Prev_Liquidated], [Prev_Bankruptcy], [Prev_State_Debt], [Prev_Tax_Debt], [Prev_Execute_Proc], [Negativ_Data_Pers], [Description_Pers], [ID_Country_Pers]) VALUES (N'3', N'2', N'2', 0, 0, 0, 0, 0, 0, N'2', 5)
GO
INSERT [dbo].[Persone] ([UNP_Org], [Owner_Name], [Head_Name], [Prev_Liquidated], [Prev_Bankruptcy], [Prev_State_Debt], [Prev_Tax_Debt], [Prev_Execute_Proc], [Negativ_Data_Pers], [Description_Pers], [ID_Country_Pers]) VALUES (N'??????', N'1', N'1', 0, 0, 0, 0, 0, 0, N'1', 10)
GO
SET IDENTITY_INSERT [dbo].[Risk] ON 
GO
INSERT [dbo].[Risk] ([ID_Risk], [Age_Org_Risk], [Ownership_Org], [Broker_Client], [Trading_experience], [Manufacturer], [Tax_Debt], [Debts_Enforcement_Documents], [False_Business], [Special_Risc], [Execute_Proc], [Bankruptcy_Proc], [Liquidation_Proc], [Resident], [Exchenge_Trading_Disorders], [Negativ_Data], [Reputation], [Prev_Liquidated], [Prev_Bankruptcy], [Prev_State_Debt], [Prev_Tax_Debt], [Prev_Execute_Proc], [Risk_St_Date], [Risk_End_Date]) VALUES (1, 3, 3, 1, 1, 2, 3, 5, 5, 3, 2, 5, 5, 3, 2, 3, 4, 1, 5, 2, 2, 2, CAST(N'2019-06-01T00:00:00.000' AS DateTime), NULL)
GO
SET IDENTITY_INSERT [dbo].[Risk] OFF
GO
SET IDENTITY_INSERT [dbo].[Section] ON 
GO
INSERT [dbo].[Section] ([ID_Section], [Name_Section], [Risk_Section], [Risk_St_Date_Section], [Risk_End_Date_Section]) VALUES (1, N'(???? ??????????????)', 0, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Section] ([ID_Section], [Name_Section], [Risk_Section], [Risk_St_Date_Section], [Risk_End_Date_Section]) VALUES (2, N'????????????????????????????????', 2, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Section] ([ID_Section], [Name_Section], [Risk_Section], [Risk_St_Date_Section], [Risk_End_Date_Section]) VALUES (3, N'??????????????????????????', 0, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Section] ([ID_Section], [Name_Section], [Risk_Section], [Risk_St_Date_Section], [Risk_End_Date_Section]) VALUES (4, N'????????????????????????????????', 0, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Section] ([ID_Section], [Name_Section], [Risk_Section], [Risk_St_Date_Section], [Risk_End_Date_Section]) VALUES (5, N'??????', 4, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Section] ([ID_Section], [Name_Section], [Risk_Section], [Risk_St_Date_Section], [Risk_End_Date_Section]) VALUES (6, N'????', 0, CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL)
GO
SET IDENTITY_INSERT [dbo].[Section] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 
GO
INSERT [dbo].[Users] ([ID_User], [Login_User], [Password_User], [Department], [Hint], [Date_Creation_User]) VALUES (1, N'1', 0x06D49632C9DC9BCB62AEAEF99612BA6B, N'1', N'', CAST(N'2019-09-24T19:31:45.713' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [Ix_Full_Name_Org]    Script Date: 9/24/19 9:45:45 PM ******/
CREATE NONCLUSTERED INDEX [Ix_Full_Name_Org] ON [dbo].[Organization]
(
	[Full_Name_Org] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [Ix_Short_Name_Org]    Script Date: 9/24/19 9:45:45 PM ******/
CREATE NONCLUSTERED INDEX [Ix_Short_Name_Org] ON [dbo].[Organization]
(
	[Short_Name_Org] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Users__5B6755ADE76CE3C2]    Script Date: 9/24/19 9:45:45 PM ******/
ALTER TABLE [dbo].[Users] ADD UNIQUE NONCLUSTERED 
(
	[Login_User] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Organization] ADD  CONSTRAINT [Get_Date]  DEFAULT (format(getdate(),'dd/MMM/yyyy HH:mm:ss','en-us')) FOR [Check_Date_Org]
GO
ALTER TABLE [dbo].[Risk] ADD  DEFAULT (getdate()) FOR [Risk_St_Date]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [Date_Creation_User]  DEFAULT (getdate()) FOR [Date_Creation_User]
GO
ALTER TABLE [dbo].[Organization]  WITH CHECK ADD  CONSTRAINT [FK_ID_Country] FOREIGN KEY([ID_Country])
REFERENCES [dbo].[Country] ([ID_Country])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Organization] CHECK CONSTRAINT [FK_ID_Country]
GO
ALTER TABLE [dbo].[Organization]  WITH CHECK ADD  CONSTRAINT [FK_ID_Risk] FOREIGN KEY([ID_Risk])
REFERENCES [dbo].[Risk] ([ID_Risk])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Organization] CHECK CONSTRAINT [FK_ID_Risk]
GO
ALTER TABLE [dbo].[Organization]  WITH CHECK ADD  CONSTRAINT [FK_ID_Section] FOREIGN KEY([ID_Section])
REFERENCES [dbo].[Section] ([ID_Section])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Organization] CHECK CONSTRAINT [FK_ID_Section]
GO
ALTER TABLE [dbo].[Organization]  WITH CHECK ADD  CONSTRAINT [FK_ID_User] FOREIGN KEY([ID_User])
REFERENCES [dbo].[Users] ([ID_User])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Organization] CHECK CONSTRAINT [FK_ID_User]
GO
ALTER TABLE [dbo].[Persone]  WITH CHECK ADD  CONSTRAINT [FK_ID_Country_Pers] FOREIGN KEY([ID_Country_Pers])
REFERENCES [dbo].[Country] ([ID_Country])
GO
ALTER TABLE [dbo].[Persone] CHECK CONSTRAINT [FK_ID_Country_Pers]
GO
ALTER TABLE [dbo].[Persone]  WITH CHECK ADD  CONSTRAINT [FK_UNP_Org] FOREIGN KEY([UNP_Org])
REFERENCES [dbo].[Organization] ([UNP_Org])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Persone] CHECK CONSTRAINT [FK_UNP_Org]
GO
/****** Object:  StoredProcedure [dbo].[ADD_Country]    Script Date: 9/24/19 9:45:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[ADD_Country] (@Name_Country nvarchar(100) = NULL
						,@Risk_Country INT = NULL
						) 
AS
DECLARE @ID_Country INT
INSERT INTO Country ( Country_Code, Country.Name_Country, Country.Risk_Country,  Country.Risk_St_Date, Country.Risk_End_Date)
SELECT			      Country_Code, Country.Name_Country, Country.Risk_Country,  Country.Risk_St_Date, Country.Risk_End_Date
FROM Country
WHERE Name_Country = @Name_Country AND Risk_End_Date is NULL
SET @ID_Country = SCOPE_IDENTITY()

update Country
set Risk_End_Date = getdate()
where Risk_End_Date is null AND Name_Country = @Name_Country
and ID_Country <> @ID_Country -- ???? ??????????

update Country
set 
		Country.Risk_Country = ISNULL( @Risk_Country, Risk_Country)
	   ,Country.Risk_St_Date =  GETDATE()
where	Country.Risk_End_Date is null AND Name_Country = @Name_Country

GO
/****** Object:  StoredProcedure [dbo].[ADD_Organization]    Script Date: 9/24/19 9:45:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[ADD_Organization](
									 @UNP_Org nvarchar(20) 
									,@Full_Name_Org nvarchar(200) 
									,@Short_Name_Org nvarchar(200) 
									,@Create_date_Org Date NULL 
									,@Country nvarchar (30)
									,@Name_Section nvarchar (20)
								)
AS
DECLARE @ID_Country INT
select @ID_Country = Country.ID_Country from Country where Country.Name_Country = @Country
DECLARE @ID_Section INT
select  @ID_Section = Section.ID_Section from Section where Section.Name_Section like @Name_Section 
INSERT INTO 
			Organization([UNP_Org],		[Full_Name_Org], [Short_Name_Org],   [Create_date_Org],	[ID_Country], [ID_Section])
VALUES					(@UNP_Org,		@Full_Name_Org,	 @Short_Name_Org, 	 @Create_date_Org,	@ID_Country, @ID_Section)


GO
/****** Object:  StoredProcedure [dbo].[ADD_Organization_Pers]    Script Date: 9/24/19 9:45:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ADD_Organization_Pers](
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

GO
/****** Object:  StoredProcedure [dbo].[ADD_Organization_Pers1]    Script Date: 9/24/19 9:45:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ADD_Organization_Pers1](
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
									,@Broker_Opinion nvarchar(1000) 
									,@Section_Head_Opinion nvarchar(1000) 
									,@Auditor_Opinion nvarchar(1000) 
									,@Country nvarchar (30)
									,@Name_Section nvarchar (20)
									,@Owner_Name nvarchar(50)
									,@Head_Name nvarchar(50)
									,@Prev_Liquidated bit
									,@Prev_Bankruptcy bit
									,@Prev_State_Debt bit
									,@Prev_Tax_Debt bit
									,@Prev_Execute_Proc bit
									,@Description_Pers nvarchar(1000)
									,@Country_Pers nvarchar (20)
									,@Login_User nvarchar (50)
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
			Organization([UNP_Org],		[Full_Name_Org], [Short_Name_Org],   [Create_date_Org],	[Description_Org],  [Ownership_Org],	[Tax_Debt], [Debts_Enforcement_Documents],[False_Business], [Special_Risc], [Execute_Proc], [Bankruptcy_Proc], [Liquidation_Proc], [Resident], [Broker_Client], [Prev_Broker_Client], [Trading_experience], [Trader], [Manufacturer], [First_Accred], [Second_Accred], [Exchenge_Trading_Disorders], [Negativ_Data], [Reputation], [Broker_Opinion], [Section_Head_Opinion], [Auditor_Opinion], [ID_Country], [ID_Section],  [ID_Risk], [ID_User])
VALUES					(@UNP_Org,		@Full_Name_Org,	 @Short_Name_Org, 	 @Create_date_Org,	@Description_Org,	 @Ownership_Org,	@Tax_Debt,	@Debts_Enforcement_Documents,  @False_Business,   @Special_Risc, @Execute_Proc,   @Bankruptcy_Proc, @Liquidation_Proc,	 @Resident,	 @Broker_Client,  @Prev_Broker_Client,	 @Trading_experience, @Trader,  @Manufacturer,   @First_Accred,	@Second_Accred,	@Exchenge_Trading_Disorders,  @Negativ_Data,  @Reputation,	@Broker_Opinion,  @Section_Head_Opinion,  @Auditor_Opinion,	 @ID_Country, @ID_Section,	@ID_Risk, @ID_User)

INSERT INTO Persone (	[UNP_Org],  [Owner_Name], [Head_Name],	[Prev_Liquidated],	[Prev_Bankruptcy],	[Prev_State_Debt],	[Prev_Tax_Debt], [Prev_Execute_Proc],	[Description_Pers],	[ID_Country_Pers] )
VALUES				(	@UNP_Org,	@Owner_Name,  @Head_Name,	@Prev_Liquidated,	@Prev_Bankruptcy,	@Prev_State_Debt,	@Prev_Tax_Debt,	 @Prev_Execute_Proc,	@Description_Pers,	@ID_Country_Pers )
	

GO
/****** Object:  StoredProcedure [dbo].[ADD_Risk]    Script Date: 9/24/19 9:45:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ADD_Risk](

			 @Age_Org_Risk INT = NULL
			,@Ownership_Org INT =  NULL
			,@Broker_Client bit = NULL
			,@Trading_experience bit = NULL
			,@Manufacturer INT = NULL 
			,@Tax_Debt INT = NULL
			,@Debts_Enforcement_Documents INT = NULL
			,@False_Business INT = NULL 
			,@Special_Risc INT = NULL
			,@Execute_Proc INT = NULL
			,@Bankruptcy_Proc INT = NULL
			,@Liquidation_Proc INT = NULL
			,@Resident INT = NULL 
			,@Exchenge_Trading_Disorders INT = NULL
			,@Negativ_Data INT = NULL
			,@Reputation INT = NULL
			,@Prev_Liquidated INT = NULL
			,@Prev_Bankruptcy INT = NULL
			,@Prev_State_Debt INT = NULL
			,@Prev_Tax_Debt INT = NULL
			,@Prev_Execute_Proc INT = NULL		
		)
AS 

insert into Risk (
				 Age_Org_Risk, 
				 Ownership_Org, Broker_Client ,Trading_experience ,Manufacturer ,Tax_Debt ,Debts_Enforcement_Documents ,False_Business ,Special_Risc ,Execute_Proc ,Bankruptcy_Proc 
				,Liquidation_Proc ,Resident ,Exchenge_Trading_Disorders ,Negativ_Data ,Reputation ,Prev_Liquidated ,Prev_Bankruptcy ,Prev_State_Debt ,Prev_Tax_Debt ,Prev_Execute_Proc
				)

select Age_Org_Risk, 
				Ownership_Org, Broker_Client ,Trading_experience ,Manufacturer ,Tax_Debt ,Debts_Enforcement_Documents ,False_Business ,Special_Risc ,Execute_Proc ,Bankruptcy_Proc 
				,Liquidation_Proc ,Resident ,Exchenge_Trading_Disorders ,Negativ_Data ,Reputation ,Prev_Liquidated ,Prev_Bankruptcy ,Prev_State_Debt ,Prev_Tax_Debt ,Prev_Execute_Proc
from Risk
where Risk_End_Date is null 

declare @newID int = SCOPE_IDENTITY()

update Risk
set Risk_End_Date = getdate()
where Risk_End_Date is null
and ID_Risk <> @newID -- ???? ?????????? 


update Risk
set 
			 Age_Org_Risk =			ISNULL(@Age_Org_Risk,Age_Org_Risk)
			,Ownership_Org =		ISNULL(@Ownership_Org,Ownership_Org)
			,Broker_Client =		ISNULL(@Broker_Client,Broker_Client) 
			,Trading_experience =	ISNULL(@Trading_experience,Trading_experience)
			,Manufacturer =			ISNULL(@Manufacturer,Manufacturer)
			,Tax_Debt =				ISNULL(@Tax_Debt,Tax_Debt)
			,Debts_Enforcement_Documents = ISNULL(@Debts_Enforcement_Documents,Debts_Enforcement_Documents)
			,False_Business =		ISNULL(@False_Business,False_Business)
			,Special_Risc =			ISNULL(@Special_Risc,Special_Risc)
			,Execute_Proc =			ISNULL(@Execute_Proc,Execute_Proc)
			,Bankruptcy_Proc =		ISNULL(@Bankruptcy_Proc,Bankruptcy_Proc)
			,Liquidation_Proc =		ISNULL(@Liquidation_Proc,Liquidation_Proc)
			,Resident =				ISNULL(@Resident, Resident)
			,Exchenge_Trading_Disorders = ISNULL(@Exchenge_Trading_Disorders,Exchenge_Trading_Disorders)
			,Negativ_Data =			ISNULL(@Negativ_Data,Negativ_Data)
			,Reputation =			ISNULL(@Reputation,Reputation)
			,Prev_Liquidated =		ISNULL(@Prev_Liquidated,Prev_Liquidated)
			,Prev_Bankruptcy =		ISNULL(@Prev_Bankruptcy,Prev_Bankruptcy)
			,Prev_State_Debt =		ISNULL(@Prev_State_Debt,Prev_State_Debt)
			,Prev_Tax_Debt =		ISNULL(@Prev_Tax_Debt,Prev_Tax_Debt)
			,Prev_Execute_Proc =	ISNULL(@Prev_Execute_Proc,Prev_Execute_Proc)
 where Risk_End_Date is null
GO
/****** Object:  StoredProcedure [dbo].[ADD_Section]    Script Date: 9/24/19 9:45:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[ADD_Section] (@Name_Section nvarchar(20) = NULL
						, @Risk_Section INT = NULL
						) 
AS
INSERT INTO Section ( Section.Name_Section, Section.Risk_Section,  Section.Risk_St_Date_Section, Section.Risk_End_Date_Section)
SELECT			      Section.Name_Section, Section.Risk_Section,  Section.Risk_St_Date_Section, Section.Risk_End_Date_Section
FROM Section
WHERE Name_Section = @Name_Section AND Risk_End_Date_Section is NULL
declare @newID int = SCOPE_IDENTITY()

update Section
set Risk_End_Date_Section = getdate()
where Risk_End_Date_Section is null AND Name_Section = @Name_Section
and ID_Section <> @newID -- ???? ??????????

update Section
set 
		Section.Risk_Section = ISNULL( @Risk_Section, Risk_Section)
	   ,Risk_St_Date_Section =  GETDATE()
where	Risk_End_Date_Section is null AND Name_Section = @Name_Section

GO
/****** Object:  StoredProcedure [dbo].[ADD_User]    Script Date: 9/24/19 9:45:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROC [dbo].[ADD_User](
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
GO
/****** Object:  StoredProcedure [dbo].[All_Check_Risk]    Script Date: 9/24/19 9:45:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[All_Check_Risk]
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
from Risk
GO
/****** Object:  StoredProcedure [dbo].[Check_Full_Name_Org]    Script Date: 9/24/19 9:45:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROC [dbo].[Check_Full_Name_Org] (@Full_Name_Org nvarchar(200)) as 
SELECT COUNT(*)
from Organization
Where Full_Name_Org = @Full_Name_Org
GO
/****** Object:  StoredProcedure [dbo].[check_log_pass]    Script Date: 9/24/19 9:45:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[check_log_pass] (@Login_User nvarchar(50), @Password_User nvarchar(50)) as
SELECT COUNT(*) 
FROM Users
WHERE Login_User = @Login_User and Password_User = HASHBYTES('MD5', @Password_User)


GO
/****** Object:  StoredProcedure [dbo].[check_login]    Script Date: 9/24/19 9:45:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROC [dbo].[check_login] (@Login_User nvarchar(50)) as -- ?????????? ???? ???????????????? ????????????
SELECT COUNT(*)
from Users
Where Login_User = @Login_User
GO
/****** Object:  StoredProcedure [dbo].[Check_Short_Name_Org]    Script Date: 9/24/19 9:45:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROC [dbo].[Check_Short_Name_Org] (@Short_Name_Org nvarchar(100)) as 
SELECT COUNT(*)
from Organization
Where Short_Name_Org = @Short_Name_Org
GO
/****** Object:  StoredProcedure [dbo].[Check_UNP]    Script Date: 9/24/19 9:45:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROC [dbo].[Check_UNP] (@UNP_Org nvarchar(40)) as 
SELECT COUNT(*)
from Organization
Where UNP_Org = @UNP_Org
GO
/****** Object:  StoredProcedure [dbo].[Delete_ORG_Cascade]    Script Date: 9/24/19 9:45:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Delete_ORG_Cascade] ( @UNP_Org nvarchar(20) = NULL
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
/****** Object:  StoredProcedure [dbo].[General_SELECT]    Script Date: 9/24/19 9:45:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[General_SELECT]  ( @UNP_Org nvarchar(20) = NULL
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
									,@Risc_Level_Less int = NULL
									)
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
	  ,(select Login_User FROM Users   WHERE ID_User  = Organization.ID_User) as [??????????????????????]
	  ,(select Login_User FROM Users   WHERE ID_User  = Organization.ID_User_Update) as [?????????? ??????????????????]
	  
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
			(@Risc_Level_Less is null or [?????????????? ??????????] <= @Risc_Level_Less )
		AND 
			(@Risc_Level_More is null or [?????????????? ??????????] >= @Risc_Level_More )	

			AND
			(@Forced_Deposite is null or @Forced_Deposite = Organization.Forced_Deposite)
		


GO
/****** Object:  StoredProcedure [dbo].[Risk_Country_ORG]    Script Date: 9/24/19 9:45:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Risk_Country_ORG]( @Name_Country nvarchar(100) = NULL) -- ?????????? ?????? ?????????????? ?????????????? ?????????? ???? ???????????? ?????? ComboBox
as
select Country.Risk_Country
from Country
WHERE	
		(@Name_Country is null or Country.Name_Country = @Name_Country)
	AND 
		Risk_End_Date is NULL
GO
/****** Object:  StoredProcedure [dbo].[Risk_Level]    Script Date: 9/24/19 9:45:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Risk_Level](@UNP_Org nvarchar(20) = NULL, @Full_Name_Org nvarchar(200) = NULL, @Short_Name_Org nvarchar(100) = NULL,
							  @Name_Country nvarchar(100) = NULL, @Name_Section nvarchar(20) = NULL, @Risk INT = NULL, @Less INT = NULL, @More INT = NULL
							 ,@Risk_Section INT = NULL
							 ) 
as
select *,  case when  [?????????????? ??????????] <= 10 then 
	   N'?????????????? ???? ?????????????????? ??????????'
     Else 
	   N'?????????????? ???? ???????????????? ??????????????'
    end as [?????????????????????????? ?????? ??????????????]

from (

select Risk.ID_Risk, Organization.UNP_Org, Full_Name_Org as ????????????????????????,  Country.Name_Country as ????????????, CountryPerson.Name_Country as [???????????? ??????????????], Owner_Name as ????????????????????, Head_Name ????????????????, Description_Org as ????????????????, Risk.Risk_St_Date, Risk.Risk_End_Date, Name_Section as ????????????, Section.Risk_Section as [???????? ????????????]
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

         as [?????????????? ??????????]

from Organization 
				JOIN Risk	 on Organization.ID_Risk = Risk.ID_Risk
				JOIN Persone on Organization.UNP_Org = Persone.UNP_Org
				JOIN Country on Organization.ID_Country = Country.ID_Country
				JOIN Section on Organization.ID_Section = Section.ID_Section
				Join Country as CountryPerson on Persone.ID_Country_Pers = CountryPerson.ID_Country
					
WHERE	(@UNP_Org is null or Organization.UNP_ORG = @UNP_Org)
AND
		(@Full_Name_Org is null or Organization.Full_Name_Org = @Full_Name_Org)
AND
		(@Short_Name_Org is null or Organization.Short_Name_Org = @Short_Name_Org)
AND 
		(@Name_Country is null or Country.Name_Country = @Name_Country)
AND
		(@Name_Section is null or Section.Name_Section = @Name_Section)) as ?????????????????????????????? 
WHERE
		(@Risk is null or [?????????????? ??????????] = @Risk)
AND 
		(@Less is null or [?????????????? ??????????] <= @Less )
AND 
		(@More is null or [?????????????? ??????????] >= @More )	
GO
/****** Object:  StoredProcedure [dbo].[Risk_Section_ORG]    Script Date: 9/24/19 9:45:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Risk_Section_ORG]( @Name_Section nvarchar(50) = NULL) -- ?????????? ?????? ?????????????? ?????????????? ?????????? ???? ???????????? ?????? ComboBox
as
select Section.Risk_Section
from Section
WHERE	
		(@Name_Section is null or Section.Name_Section = @Name_Section)
	AND 
		Risk_End_Date_Section is NULL

GO
/****** Object:  StoredProcedure [dbo].[Select_For_Apdate]    Script Date: 9/24/19 9:45:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Procedure [dbo].[Select_For_Apdate] ( @UNP_Org nvarchar(20) = NULL
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
/****** Object:  StoredProcedure [dbo].[Update_Cascade]    Script Date: 9/24/19 9:45:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Update_Cascade] (	 @UNP_Org nvarchar(20) = null
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
GO
/****** Object:  StoredProcedure [dbo].[????????????????????????]    Script Date: 9/24/19 9:45:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[????????????????????????](@UNP_Org nvarchar(20) = NULL, @Full_Name_Org nvarchar(200) = NULL, @Short_Name_Org nvarchar(100) = NULL,
							  @Name_Country nvarchar(100) = NULL, @Name_Section nvarchar(20) = NULL, @Risk INT = NULL, @Less INT = NULL, @More INT = NULL
							 ,@Risk_Section INT = NULL
							 ) 
as
select *
from (

select  Full_Name_Org as ????????????????????????,  Country.Name_Country as ????????????, Name_Section as ????????????, Description_Org as ????????????????
		,case when Organization.Ownership_Org				= 0 THEN Risk.Ownership_Org					else 1 end 
		--+case when Organization.Broker_Client				= 1 THEN Risk.Broker_Client					else 1 end 
		+case when Organization.Broker_Client				= 0 THEN Risk.Broker_Client					else 1 end ---
		+case when Organization.Trading_experience			= 0 THEN Risk.Trading_experience			else 1 end 
		+case when Organization.Manufacturer				= 0 THEN Risk.Manufacturer					else 1 end 
		+case when Organization.Tax_Debt					= 1 THEN Risk.Tax_Debt						else 0 end
		+case when Organization.Debts_Enforcement_Documents	= 1 THEN Risk.Debts_Enforcement_Documents	else 0 end
		+case when Organization.False_Business				= 1 THEN Risk.False_Business				else 0 end
		+case when Organization.Special_Risc				= 1 THEN Risk.Special_Risc					else 0 end
		+case when Organization.Execute_Proc				= 1 THEN Risk.Execute_Proc					else 0 end
		+case when Organization.Bankruptcy_Proc				= 1 THEN Risk.Bankruptcy_Proc				else 0 end
		+case when Organization.Liquidation_Proc			= 1 THEN Risk.Liquidation_Proc				else 0 end
		+case when Organization.Resident					= 0 THEN Risk.Resident						else 1 end
		+case when Organization.Exchenge_Trading_Disorders	= 1 THEN Risk.Exchenge_Trading_Disorders	else 0 end
		+case when Organization.Negativ_Data				= 1 THEN Risk.Negativ_Data					else 0 end
		+case when Organization.Reputation					= 0 THEN Risk.Reputation					else 1 end 
		+case when Persone.Prev_Liquidated					= 1 THEN Risk.Prev_Liquidated				else 0 end
		+case when Persone.Prev_Bankruptcy					= 1 THEN Risk.Prev_Bankruptcy				else 0 end
		+case when Persone.Prev_State_Debt					= 1 THEN Risk.Prev_State_Debt				else 0 end
		+case when Persone.Prev_Tax_Debt					= 1 THEN Risk.Prev_Tax_Debt					else 0 end
		+case when Persone.Prev_Execute_Proc				= 1 THEN Risk.Prev_Execute_Proc				else 0 end
		+case when Organization.Age_Org						< 12 then Risk.Age_Org_Risk					else 0 end
		+Country.Risk_Country
		+Section.Risk_Section 
		+CountryPerson.Risk_Country

         as [?????????????? ??????????]

from Organization 
				JOIN Risk	 on Organization.ID_Risk = Risk.ID_Risk
				JOIN Persone on Organization.UNP_Org = Persone.UNP_Org
				JOIN Country on Organization.ID_Country = Country.ID_Country
				JOIN Section on Organization.ID_Section = Section.ID_Section
				Join Country as CountryPerson on Persone.ID_Country_Pers = CountryPerson.ID_Country
					
WHERE	(@UNP_Org is null or Organization.UNP_ORG = @UNP_Org)
AND
		(@Full_Name_Org is null or Organization.Full_Name_Org = @Full_Name_Org)
AND
		(@Short_Name_Org is null or Organization.Short_Name_Org = @Short_Name_Org)
AND 
		(@Name_Country is null or Country.Name_Country = @Name_Country)
AND
		(@Name_Section is null or Section.Name_Section = @Name_Section)) as ?????????????????????????????? 
WHERE
		(@Risk is null or [?????????????? ??????????] = @Risk)
AND 
		(@Less is null or [?????????????? ??????????] <= @Less )
AND 
		(@More is null or [?????????????? ??????????] >= @More )	
GO
USE [master]
GO
ALTER DATABASE [Kontragent] SET  READ_WRITE 
GO
