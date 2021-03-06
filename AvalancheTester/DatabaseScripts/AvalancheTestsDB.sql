USE [master]
GO
/****** Object:  Database [AvalancheTestsDB]    Script Date: 17.10.2015 г. 21:46:34 ******/
CREATE DATABASE [AvalancheTestsDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'AvalancheTestsDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\AvalancheTestsDB.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'AvalancheTestsDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\AvalancheTestsDB_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [AvalancheTestsDB] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AvalancheTestsDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [AvalancheTestsDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [AvalancheTestsDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [AvalancheTestsDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [AvalancheTestsDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [AvalancheTestsDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [AvalancheTestsDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [AvalancheTestsDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [AvalancheTestsDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [AvalancheTestsDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [AvalancheTestsDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [AvalancheTestsDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [AvalancheTestsDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [AvalancheTestsDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [AvalancheTestsDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [AvalancheTestsDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [AvalancheTestsDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [AvalancheTestsDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [AvalancheTestsDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [AvalancheTestsDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [AvalancheTestsDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [AvalancheTestsDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [AvalancheTestsDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [AvalancheTestsDB] SET RECOVERY FULL 
GO
ALTER DATABASE [AvalancheTestsDB] SET  MULTI_USER 
GO
ALTER DATABASE [AvalancheTestsDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [AvalancheTestsDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [AvalancheTestsDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [AvalancheTestsDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [AvalancheTestsDB] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'AvalancheTestsDB', N'ON'
GO
USE [AvalancheTestsDB]
GO
/****** Object:  Table [dbo].[Organizations]    Script Date: 17.10.2015 г. 21:46:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Organizations](
	[OrganizationId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_Organizations_1] PRIMARY KEY CLUSTERED 
(
	[OrganizationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Place]    Script Date: 17.10.2015 г. 21:46:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Place](
	[PlaceId] [int] NOT NULL,
	[Name] [nvarchar](15) NOT NULL,
	[Area] [geometry] NULL,
 CONSTRAINT [PK_Place] PRIMARY KEY CLUSTERED 
(
	[PlaceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Tests]    Script Date: 17.10.2015 г. 21:46:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tests](
	[TestId] [int] IDENTITY(1,1) NOT NULL,
	[TestResults] [nvarchar](250) NOT NULL,
	[DangerLevel] [int] NOT NULL,
	[Position] [geography] NULL,
	[PlaceId] [int] NOT NULL,
	[Date] [date] NOT NULL,
	[Slope] [int] NULL,
	[UserId] [int] NOT NULL,
 CONSTRAINT [PK_Tests] PRIMARY KEY CLUSTERED 
(
	[TestId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Tests Organizations]    Script Date: 17.10.2015 г. 21:46:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tests Organizations](
	[TestId] [int] NOT NULL,
	[OrganizationId] [int] NOT NULL,
 CONSTRAINT [PK_Tests Organizations] PRIMARY KEY CLUSTERED 
(
	[TestId] ASC,
	[OrganizationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Users]    Script Date: 17.10.2015 г. 21:46:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Users Organizations]    Script Date: 17.10.2015 г. 21:46:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users Organizations](
	[UserId] [int] NOT NULL,
	[OrganizationId] [int] NOT NULL,
 CONSTRAINT [PK_Users Organizations] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[OrganizationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Tests]  WITH CHECK ADD  CONSTRAINT [FK_Tests_Place] FOREIGN KEY([PlaceId])
REFERENCES [dbo].[Place] ([PlaceId])
GO
ALTER TABLE [dbo].[Tests] CHECK CONSTRAINT [FK_Tests_Place]
GO
ALTER TABLE [dbo].[Tests]  WITH CHECK ADD  CONSTRAINT [FK_Tests_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[Tests] CHECK CONSTRAINT [FK_Tests_Users]
GO
ALTER TABLE [dbo].[Tests Organizations]  WITH CHECK ADD  CONSTRAINT [FK_Tests Organizations_Organizations] FOREIGN KEY([OrganizationId])
REFERENCES [dbo].[Organizations] ([OrganizationId])
GO
ALTER TABLE [dbo].[Tests Organizations] CHECK CONSTRAINT [FK_Tests Organizations_Organizations]
GO
ALTER TABLE [dbo].[Tests Organizations]  WITH CHECK ADD  CONSTRAINT [FK_Tests Organizations_Tests] FOREIGN KEY([TestId])
REFERENCES [dbo].[Tests] ([TestId])
GO
ALTER TABLE [dbo].[Tests Organizations] CHECK CONSTRAINT [FK_Tests Organizations_Tests]
GO
ALTER TABLE [dbo].[Users Organizations]  WITH CHECK ADD  CONSTRAINT [FK_Users Organizations_Organizations] FOREIGN KEY([OrganizationId])
REFERENCES [dbo].[Organizations] ([OrganizationId])
GO
ALTER TABLE [dbo].[Users Organizations] CHECK CONSTRAINT [FK_Users Organizations_Organizations]
GO
ALTER TABLE [dbo].[Users Organizations]  WITH CHECK ADD  CONSTRAINT [FK_Users Organizations_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[Users Organizations] CHECK CONSTRAINT [FK_Users Organizations_Users]
GO
USE [master]
GO
ALTER DATABASE [AvalancheTestsDB] SET  READ_WRITE 
GO