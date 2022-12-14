USE [master]
GO
/****** Object:  Database [applicationDevCW]    Script Date: 30/04/2020 20:47:15 ******/
CREATE DATABASE [applicationDevCW]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'applicationDevCW_Data', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\applicationDevCW.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'applicationDevCW_Log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\applicationDevCW.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [applicationDevCW] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [applicationDevCW].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [applicationDevCW] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [applicationDevCW] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [applicationDevCW] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [applicationDevCW] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [applicationDevCW] SET ARITHABORT OFF 
GO
ALTER DATABASE [applicationDevCW] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [applicationDevCW] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [applicationDevCW] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [applicationDevCW] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [applicationDevCW] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [applicationDevCW] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [applicationDevCW] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [applicationDevCW] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [applicationDevCW] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [applicationDevCW] SET  DISABLE_BROKER 
GO
ALTER DATABASE [applicationDevCW] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [applicationDevCW] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [applicationDevCW] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [applicationDevCW] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [applicationDevCW] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [applicationDevCW] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [applicationDevCW] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [applicationDevCW] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [applicationDevCW] SET  MULTI_USER 
GO
ALTER DATABASE [applicationDevCW] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [applicationDevCW] SET DB_CHAINING OFF 
GO
ALTER DATABASE [applicationDevCW] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [applicationDevCW] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [applicationDevCW] SET DELAYED_DURABILITY = DISABLED 
GO
USE [applicationDevCW]
GO
/****** Object:  Table [dbo].[admin]    Script Date: 30/04/2020 20:47:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[admin](
	[username] [varchar](50) NOT NULL,
	[password] [varchar](50) NOT NULL,
	[full_name] [varchar](50) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Cast]    Script Date: 30/04/2020 20:47:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Cast](
	[cast_id] [int] NOT NULL,
	[first_name] [varchar](50) NOT NULL,
	[last_name] [varchar](50) NOT NULL,
	[dvd_id] [int] NOT NULL,
 CONSTRAINT [PK_Cast] PRIMARY KEY CLUSTERED 
(
	[cast_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[dvdCastDetails]    Script Date: 30/04/2020 20:47:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dvdCastDetails](
	[dvdCastDetails_id] [int] NOT NULL,
	[cast_id] [int] NOT NULL,
	[dvd_id] [int] NOT NULL,
 CONSTRAINT [PK_dvdCastDetails] PRIMARY KEY CLUSTERED 
(
	[dvdCastDetails_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DvdCopies]    Script Date: 30/04/2020 20:47:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DvdCopies](
	[copy_id] [int] IDENTITY(1008,1) NOT NULL,
	[copy_name] [varchar](100) NULL,
	[dvd_id] [int] NOT NULL,
	[isonloan] [int] NULL,
	[shelf] [varchar](50) NULL,
 CONSTRAINT [PK_DVDCopies] PRIMARY KEY CLUSTERED 
(
	[copy_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DvdDetails]    Script Date: 30/04/2020 20:47:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DvdDetails](
	[dvd_id] [int] IDENTITY(108,1) NOT NULL,
	[title] [varchar](50) NOT NULL,
	[studio] [varchar](50) NOT NULL,
	[producer] [varchar](50) NOT NULL,
	[dateReleased] [varchar](50) NULL,
	[category] [varchar](50) NOT NULL,
	[ageRestricted] [int] NULL,
 CONSTRAINT [PK_DvdDetails] PRIMARY KEY CLUSTERED 
(
	[dvd_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Loan]    Script Date: 30/04/2020 20:47:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Loan](
	[loan_id] [int] IDENTITY(1,1) NOT NULL,
	[loan_date] [date] NOT NULL,
	[due_date] [date] NOT NULL,
	[return_date] [date] NULL,
	[mem_id] [int] NOT NULL,
	[copy_id] [int] NOT NULL,
	[type_id] [int] NOT NULL,
 CONSTRAINT [PK_Loan_1] PRIMARY KEY CLUSTERED 
(
	[loan_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LoanType]    Script Date: 30/04/2020 20:47:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LoanType](
	[type_id] [int] NOT NULL,
	[name] [varchar](50) NOT NULL,
	[duration] [int] NULL,
	[chargePerDay] [int] NULL,
	[penalty] [varchar](50) NULL,
 CONSTRAINT [PK_LoanType_1] PRIMARY KEY CLUSTERED 
(
	[type_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MemberCategory]    Script Date: 30/04/2020 20:47:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MemberCategory](
	[mem_category_id] [varchar](50) NOT NULL,
	[mem_category_name] [varchar](50) NULL,
	[totalLoan] [int] NULL,
 CONSTRAINT [PK_MemberCategory] PRIMARY KEY CLUSTERED 
(
	[mem_category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Members]    Script Date: 30/04/2020 20:47:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Members](
	[mem_id] [int] IDENTITY(17031900,1) NOT NULL,
	[mem_firstname] [varchar](50) NOT NULL,
	[mem_lastname] [varchar](50) NOT NULL,
	[mem_age] [int] NOT NULL,
	[mem_phone] [varchar](50) NULL,
	[mem_address] [varchar](50) NULL,
	[mem_category_id] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Members_1] PRIMARY KEY CLUSTERED 
(
	[mem_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Producer]    Script Date: 30/04/2020 20:47:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Producer](
	[producer_id] [varchar](50) NOT NULL,
	[producer] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Producer] PRIMARY KEY CLUSTERED 
(
	[producer_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Studios]    Script Date: 30/04/2020 20:47:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Studios](
	[studio_id] [varchar](50) NOT NULL,
	[studio] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Studios_1] PRIMARY KEY CLUSTERED 
(
	[studio_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[User]    Script Date: 30/04/2020 20:47:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[User](
	[FullName] [varchar](50) NOT NULL,
	[Designation] [varchar](50) NULL,
	[UserID] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
 CONSTRAINT [PK_User_1] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[admin] ([username], [password], [full_name]) VALUES (N'admin', N'123', N'Cmant')
INSERT [dbo].[Cast] ([cast_id], [first_name], [last_name], [dvd_id]) VALUES (1111, N'Henry', N'Golding', 101)
INSERT [dbo].[Cast] ([cast_id], [first_name], [last_name], [dvd_id]) VALUES (1112, N'Emilia', N'Clarke', 101)
INSERT [dbo].[Cast] ([cast_id], [first_name], [last_name], [dvd_id]) VALUES (1113, N'Alexandra', N'Daddario', 102)
INSERT [dbo].[Cast] ([cast_id], [first_name], [last_name], [dvd_id]) VALUES (1114, N'Scarlett', N'Johansson', 103)
INSERT [dbo].[Cast] ([cast_id], [first_name], [last_name], [dvd_id]) VALUES (1115, N'Emma', N'Thompson', 104)
INSERT [dbo].[Cast] ([cast_id], [first_name], [last_name], [dvd_id]) VALUES (1116, N'Joaquin', N'Phoenix', 105)
INSERT [dbo].[Cast] ([cast_id], [first_name], [last_name], [dvd_id]) VALUES (1117, N'Patrick', N'Wilson', 106)
INSERT [dbo].[Cast] ([cast_id], [first_name], [last_name], [dvd_id]) VALUES (1118, N'Vera', N'Farmiga', 106)
INSERT [dbo].[Cast] ([cast_id], [first_name], [last_name], [dvd_id]) VALUES (1119, N'Brie', N'Larson', 107)
INSERT [dbo].[Cast] ([cast_id], [first_name], [last_name], [dvd_id]) VALUES (1120, N'Robert', N'Downey Jr.', 108)
INSERT [dbo].[Cast] ([cast_id], [first_name], [last_name], [dvd_id]) VALUES (1121, N'Chris ', N'Evans', 108)
INSERT [dbo].[Cast] ([cast_id], [first_name], [last_name], [dvd_id]) VALUES (1122, N'Chris', N'Hemsworth', 108)
INSERT [dbo].[Cast] ([cast_id], [first_name], [last_name], [dvd_id]) VALUES (1123, N'Donald', N'Glover', 110)
INSERT [dbo].[dvdCastDetails] ([dvdCastDetails_id], [cast_id], [dvd_id]) VALUES (1, 1112, 107)
INSERT [dbo].[dvdCastDetails] ([dvdCastDetails_id], [cast_id], [dvd_id]) VALUES (2, 1112, 108)
SET IDENTITY_INSERT [dbo].[DvdCopies] ON 

INSERT [dbo].[DvdCopies] ([copy_id], [copy_name], [dvd_id], [isonloan], [shelf]) VALUES (1001, N'Last Christmas Copy 1', 101, 0, N'Shelf 1')
INSERT [dbo].[DvdCopies] ([copy_id], [copy_name], [dvd_id], [isonloan], [shelf]) VALUES (1002, N'Last Christmas Copy 2', 101, 0, N'Shelf 1')
INSERT [dbo].[DvdCopies] ([copy_id], [copy_name], [dvd_id], [isonloan], [shelf]) VALUES (1003, N'Can You Keep a Secret? Copy 1', 102, 0, N'Shelf 2')
INSERT [dbo].[DvdCopies] ([copy_id], [copy_name], [dvd_id], [isonloan], [shelf]) VALUES (1004, N'Can You Keep a Secret? Copy 2', 102, 0, N'Shelf 2')
INSERT [dbo].[DvdCopies] ([copy_id], [copy_name], [dvd_id], [isonloan], [shelf]) VALUES (1005, N'Jojo Rabbit Copy 1', 103, 0, N'Shelf 2')
INSERT [dbo].[DvdCopies] ([copy_id], [copy_name], [dvd_id], [isonloan], [shelf]) VALUES (1006, N'Jojo Rabbit Copy 2', 103, 0, N'Shelf 2')
INSERT [dbo].[DvdCopies] ([copy_id], [copy_name], [dvd_id], [isonloan], [shelf]) VALUES (1007, N'Joker Copy 1', 105, 1, N'Shelf 3')
INSERT [dbo].[DvdCopies] ([copy_id], [copy_name], [dvd_id], [isonloan], [shelf]) VALUES (1008, N'Captain Marvel Copy 1', 107, 1, N'Shelf 3')
INSERT [dbo].[DvdCopies] ([copy_id], [copy_name], [dvd_id], [isonloan], [shelf]) VALUES (1009, N'Annabelle Comes Home Copy1', 106, 0, N'Shelf 4')
INSERT [dbo].[DvdCopies] ([copy_id], [copy_name], [dvd_id], [isonloan], [shelf]) VALUES (1010, N'Late Night Copy 1', 104, 1, N'Shelf 4')
INSERT [dbo].[DvdCopies] ([copy_id], [copy_name], [dvd_id], [isonloan], [shelf]) VALUES (1011, N'Avengers: Endgame Copy 1', 108, 0, N'Shelf 5')
INSERT [dbo].[DvdCopies] ([copy_id], [copy_name], [dvd_id], [isonloan], [shelf]) VALUES (1012, N'Avengers: Endgame Copy 2', 108, 0, N'Shelf 5')
INSERT [dbo].[DvdCopies] ([copy_id], [copy_name], [dvd_id], [isonloan], [shelf]) VALUES (1013, N'Avengers: Endgame Copy 3', 108, 1, N'Shelf 5')
INSERT [dbo].[DvdCopies] ([copy_id], [copy_name], [dvd_id], [isonloan], [shelf]) VALUES (1014, N'The Lion King Copy 1', 110, 0, N'Shelf 5')
SET IDENTITY_INSERT [dbo].[DvdCopies] OFF
SET IDENTITY_INSERT [dbo].[DvdDetails] ON 

INSERT [dbo].[DvdDetails] ([dvd_id], [title], [studio], [producer], [dateReleased], [category], [ageRestricted]) VALUES (101, N'Last Christmas', N'Universal Studios', N'Paul Feig', N'08/11/2019 00:00:00', N'Romance', 0)
INSERT [dbo].[DvdDetails] ([dvd_id], [title], [studio], [producer], [dateReleased], [category], [ageRestricted]) VALUES (102, N'Can You Keep a Secret?', N'Vertical Entertainment', N'Brice Dal Farra', N'13/09/2019 00:00:00', N'Romance', 1)
INSERT [dbo].[DvdDetails] ([dvd_id], [title], [studio], [producer], [dateReleased], [category], [ageRestricted]) VALUES (103, N'Jojo Rabbit', N'Fox Searchlight Pictures', N'Carthew Neal', N'08/11/2019 00:00:00', N'Comedy', 0)
INSERT [dbo].[DvdDetails] ([dvd_id], [title], [studio], [producer], [dateReleased], [category], [ageRestricted]) VALUES (104, N'Late Night', N'Amazon Studios', N'Ben Browning', N'07/06/2019 00:00:00', N'Comedy', 1)
INSERT [dbo].[DvdDetails] ([dvd_id], [title], [studio], [producer], [dateReleased], [category], [ageRestricted]) VALUES (105, N'Joker', N'Warner Bros. Pictures', N'Todd Phillips', N'04/10/2019 00:00:00', N'Thriller', 0)
INSERT [dbo].[DvdDetails] ([dvd_id], [title], [studio], [producer], [dateReleased], [category], [ageRestricted]) VALUES (106, N'Annabelle Comes Home', N'Warner Bros. Pictures', N'James Wan', N'21/06/2019 00:00:00', N'Thriller', 0)
INSERT [dbo].[DvdDetails] ([dvd_id], [title], [studio], [producer], [dateReleased], [category], [ageRestricted]) VALUES (107, N'Captain Marvel', N'Marvel Studios', N'Kevin Feige', N'08/03/2019 00:00:00', N'Action', 0)
INSERT [dbo].[DvdDetails] ([dvd_id], [title], [studio], [producer], [dateReleased], [category], [ageRestricted]) VALUES (108, N'Avengers: Endgame', N'Marvel Studios', N'Kevin Feige', N'26/04/2019 00:00:00', N'Action', 0)
INSERT [dbo].[DvdDetails] ([dvd_id], [title], [studio], [producer], [dateReleased], [category], [ageRestricted]) VALUES (110, N'The Lion King', N'Walt Disney Pictures', N'Jon Favreau', N'19/07/2019 00:00:00', N'Romance', 0)
SET IDENTITY_INSERT [dbo].[DvdDetails] OFF
SET IDENTITY_INSERT [dbo].[Loan] ON 

INSERT [dbo].[Loan] ([loan_id], [loan_date], [due_date], [return_date], [mem_id], [copy_id], [type_id]) VALUES (1, CAST(N'2020-04-01' AS Date), CAST(N'2020-04-02' AS Date), CAST(N'2020-04-03' AS Date), 17031900, 1001, 11)
INSERT [dbo].[Loan] ([loan_id], [loan_date], [due_date], [return_date], [mem_id], [copy_id], [type_id]) VALUES (2, CAST(N'2020-03-05' AS Date), CAST(N'2020-03-12' AS Date), NULL, 17031901, 1007, 12)
INSERT [dbo].[Loan] ([loan_id], [loan_date], [due_date], [return_date], [mem_id], [copy_id], [type_id]) VALUES (3, CAST(N'2020-01-10' AS Date), CAST(N'2020-02-09' AS Date), CAST(N'2020-02-09' AS Date), 17031902, 1005, 13)
INSERT [dbo].[Loan] ([loan_id], [loan_date], [due_date], [return_date], [mem_id], [copy_id], [type_id]) VALUES (5, CAST(N'2020-04-02' AS Date), CAST(N'2020-04-03' AS Date), NULL, 17031902, 1008, 11)
INSERT [dbo].[Loan] ([loan_id], [loan_date], [due_date], [return_date], [mem_id], [copy_id], [type_id]) VALUES (6, CAST(N'2020-03-10' AS Date), CAST(N'2020-03-17' AS Date), NULL, 17031902, 1010, 12)
INSERT [dbo].[Loan] ([loan_id], [loan_date], [due_date], [return_date], [mem_id], [copy_id], [type_id]) VALUES (7, CAST(N'2020-02-12' AS Date), CAST(N'2020-03-13' AS Date), NULL, 17031908, 1013, 13)
INSERT [dbo].[Loan] ([loan_id], [loan_date], [due_date], [return_date], [mem_id], [copy_id], [type_id]) VALUES (8, CAST(N'2020-03-30' AS Date), CAST(N'2020-04-29' AS Date), CAST(N'2020-04-29' AS Date), 17031909, 1006, 13)
INSERT [dbo].[Loan] ([loan_id], [loan_date], [due_date], [return_date], [mem_id], [copy_id], [type_id]) VALUES (9, CAST(N'2020-04-09' AS Date), CAST(N'2020-04-16' AS Date), CAST(N'2020-04-16' AS Date), 17031900, 1014, 12)
INSERT [dbo].[Loan] ([loan_id], [loan_date], [due_date], [return_date], [mem_id], [copy_id], [type_id]) VALUES (10, CAST(N'2020-03-12' AS Date), CAST(N'2020-04-11' AS Date), CAST(N'2020-04-29' AS Date), 17031910, 1014, 13)
INSERT [dbo].[Loan] ([loan_id], [loan_date], [due_date], [return_date], [mem_id], [copy_id], [type_id]) VALUES (12, CAST(N'2020-03-30' AS Date), CAST(N'2020-04-29' AS Date), CAST(N'0001-01-01' AS Date), 17031909, 1006, 13)
SET IDENTITY_INSERT [dbo].[Loan] OFF
INSERT [dbo].[LoanType] ([type_id], [name], [duration], [chargePerDay], [penalty]) VALUES (11, N'Day', 1, 5, N'2.5')
INSERT [dbo].[LoanType] ([type_id], [name], [duration], [chargePerDay], [penalty]) VALUES (12, N'Week', 7, 5, N'17.5')
INSERT [dbo].[LoanType] ([type_id], [name], [duration], [chargePerDay], [penalty]) VALUES (13, N'Month', 30, 5, N'75')
INSERT [dbo].[MemberCategory] ([mem_category_id], [mem_category_name], [totalLoan]) VALUES (N'MemCat1', N'Standard', 5)
INSERT [dbo].[MemberCategory] ([mem_category_id], [mem_category_name], [totalLoan]) VALUES (N'MemCat2', N'Silver', 10)
INSERT [dbo].[MemberCategory] ([mem_category_id], [mem_category_name], [totalLoan]) VALUES (N'MemCat3', N'Gold', 15)
SET IDENTITY_INSERT [dbo].[Members] ON 

INSERT [dbo].[Members] ([mem_id], [mem_firstname], [mem_lastname], [mem_age], [mem_phone], [mem_address], [mem_category_id]) VALUES (17031900, N'Anup', N'Tamang', 25, N'9815150923', N'Pokhara', N'MemCat1')
INSERT [dbo].[Members] ([mem_id], [mem_firstname], [mem_lastname], [mem_age], [mem_phone], [mem_address], [mem_category_id]) VALUES (17031901, N'Sonam', N'Gurung', 20, N'9806573288', N'Pokhara', N'MemCat2')
INSERT [dbo].[Members] ([mem_id], [mem_firstname], [mem_lastname], [mem_age], [mem_phone], [mem_address], [mem_category_id]) VALUES (17031902, N'Manoj', N'Thapa', 16, N'9816645012', N'Kathmandu', N'MemCat3')
INSERT [dbo].[Members] ([mem_id], [mem_firstname], [mem_lastname], [mem_age], [mem_phone], [mem_address], [mem_category_id]) VALUES (17031906, N'Dikshant', N'Rana', 40, N'9806656723', N'Lamjung', N'MemCat1')
INSERT [dbo].[Members] ([mem_id], [mem_firstname], [mem_lastname], [mem_age], [mem_phone], [mem_address], [mem_category_id]) VALUES (17031908, N'Anil', N'Poudel', 17, N'9814104598', N'Janakpur', N'MemCat3')
INSERT [dbo].[Members] ([mem_id], [mem_firstname], [mem_lastname], [mem_age], [mem_phone], [mem_address], [mem_category_id]) VALUES (17031909, N'Sudip', N'Sharma', 32, N'9856012093', N'Butwal', N'MemCat2')
INSERT [dbo].[Members] ([mem_id], [mem_firstname], [mem_lastname], [mem_age], [mem_phone], [mem_address], [mem_category_id]) VALUES (17031910, N'Surya', N'Rai', 37, N'9856090341', N'Palpa', N'MemCat2')
SET IDENTITY_INSERT [dbo].[Members] OFF
INSERT [dbo].[Producer] ([producer_id], [producer]) VALUES (N'P1', N'Paul Feig')
INSERT [dbo].[Producer] ([producer_id], [producer]) VALUES (N'P2', N'Brice Dal Farra')
INSERT [dbo].[Producer] ([producer_id], [producer]) VALUES (N'P3', N'Carthew Neal')
INSERT [dbo].[Producer] ([producer_id], [producer]) VALUES (N'P4', N'	Ben Browning')
INSERT [dbo].[Producer] ([producer_id], [producer]) VALUES (N'P5', N'Todd Phillips')
INSERT [dbo].[Producer] ([producer_id], [producer]) VALUES (N'P6', N'James Wan')
INSERT [dbo].[Producer] ([producer_id], [producer]) VALUES (N'P7', N'Kevin Feige')
INSERT [dbo].[Producer] ([producer_id], [producer]) VALUES (N'P8', N'Jon Favreau')
INSERT [dbo].[Studios] ([studio_id], [studio]) VALUES (N'S1', N'Universal Studios')
INSERT [dbo].[Studios] ([studio_id], [studio]) VALUES (N'S2', N'Vertical Entertainment')
INSERT [dbo].[Studios] ([studio_id], [studio]) VALUES (N'S3', N'	Fox Searchlight Pictures')
INSERT [dbo].[Studios] ([studio_id], [studio]) VALUES (N'S4', N'Amazon Studios')
INSERT [dbo].[Studios] ([studio_id], [studio]) VALUES (N'S5', N'Warner Bros. Pictures')
INSERT [dbo].[Studios] ([studio_id], [studio]) VALUES (N'S6', N'	Marvel Studios')
INSERT [dbo].[Studios] ([studio_id], [studio]) VALUES (N'S7', N'Walt Disney Pictures')
INSERT [dbo].[User] ([FullName], [Designation], [UserID], [Password]) VALUES (N'Bimochan Thapa Magar', N'Assistant', N'Bimochan02', N'456')
INSERT [dbo].[User] ([FullName], [Designation], [UserID], [Password]) VALUES (N'Simant Gurung', N'Assistant', N'Simant01', N'abc')
ALTER TABLE [dbo].[Cast]  WITH CHECK ADD  CONSTRAINT [FK_Cast_DvdDetails] FOREIGN KEY([dvd_id])
REFERENCES [dbo].[DvdDetails] ([dvd_id])
GO
ALTER TABLE [dbo].[Cast] CHECK CONSTRAINT [FK_Cast_DvdDetails]
GO
ALTER TABLE [dbo].[dvdCastDetails]  WITH CHECK ADD  CONSTRAINT [FK_dvdCastDetails_Cast] FOREIGN KEY([cast_id])
REFERENCES [dbo].[Cast] ([cast_id])
GO
ALTER TABLE [dbo].[dvdCastDetails] CHECK CONSTRAINT [FK_dvdCastDetails_Cast]
GO
ALTER TABLE [dbo].[dvdCastDetails]  WITH CHECK ADD  CONSTRAINT [FK_dvdCastDetails_DvdDetails] FOREIGN KEY([dvd_id])
REFERENCES [dbo].[DvdDetails] ([dvd_id])
GO
ALTER TABLE [dbo].[dvdCastDetails] CHECK CONSTRAINT [FK_dvdCastDetails_DvdDetails]
GO
ALTER TABLE [dbo].[DvdCopies]  WITH CHECK ADD  CONSTRAINT [FK_DVDCopies_DvdDetails] FOREIGN KEY([dvd_id])
REFERENCES [dbo].[DvdDetails] ([dvd_id])
GO
ALTER TABLE [dbo].[DvdCopies] CHECK CONSTRAINT [FK_DVDCopies_DvdDetails]
GO
ALTER TABLE [dbo].[DvdDetails]  WITH CHECK ADD  CONSTRAINT [FK_DvdDetails_DvdDetails] FOREIGN KEY([dvd_id])
REFERENCES [dbo].[DvdDetails] ([dvd_id])
GO
ALTER TABLE [dbo].[DvdDetails] CHECK CONSTRAINT [FK_DvdDetails_DvdDetails]
GO
ALTER TABLE [dbo].[DvdDetails]  WITH CHECK ADD  CONSTRAINT [FK_DvdDetails_DvdDetails1] FOREIGN KEY([dvd_id])
REFERENCES [dbo].[DvdDetails] ([dvd_id])
GO
ALTER TABLE [dbo].[DvdDetails] CHECK CONSTRAINT [FK_DvdDetails_DvdDetails1]
GO
ALTER TABLE [dbo].[DvdDetails]  WITH CHECK ADD  CONSTRAINT [FK_DvdDetails_DvdDetails2] FOREIGN KEY([dvd_id])
REFERENCES [dbo].[DvdDetails] ([dvd_id])
GO
ALTER TABLE [dbo].[DvdDetails] CHECK CONSTRAINT [FK_DvdDetails_DvdDetails2]
GO
ALTER TABLE [dbo].[Loan]  WITH CHECK ADD  CONSTRAINT [FK_Loan_DvdCopies] FOREIGN KEY([copy_id])
REFERENCES [dbo].[DvdCopies] ([copy_id])
GO
ALTER TABLE [dbo].[Loan] CHECK CONSTRAINT [FK_Loan_DvdCopies]
GO
ALTER TABLE [dbo].[Loan]  WITH CHECK ADD  CONSTRAINT [FK_Loan_LoanType] FOREIGN KEY([type_id])
REFERENCES [dbo].[LoanType] ([type_id])
GO
ALTER TABLE [dbo].[Loan] CHECK CONSTRAINT [FK_Loan_LoanType]
GO
ALTER TABLE [dbo].[Loan]  WITH CHECK ADD  CONSTRAINT [FK_Loan_Members] FOREIGN KEY([mem_id])
REFERENCES [dbo].[Members] ([mem_id])
GO
ALTER TABLE [dbo].[Loan] CHECK CONSTRAINT [FK_Loan_Members]
GO
ALTER TABLE [dbo].[Members]  WITH CHECK ADD  CONSTRAINT [FK_Members_MemberCategory] FOREIGN KEY([mem_category_id])
REFERENCES [dbo].[MemberCategory] ([mem_category_id])
GO
ALTER TABLE [dbo].[Members] CHECK CONSTRAINT [FK_Members_MemberCategory]
GO
USE [master]
GO
ALTER DATABASE [applicationDevCW] SET  READ_WRITE 
GO
