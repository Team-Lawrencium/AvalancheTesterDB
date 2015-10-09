USE [master]
GO

/****** Object:  Database [AvalauncheTestsDB]    Script Date: 9.10.2015 г. 16:53:47 ******/
CREATE DATABASE [AvalauncheTestsDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'AvalauncheTestsDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\AvalauncheTestsDB.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'AvalauncheTestsDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\AvalauncheTestsDB_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO

ALTER DATABASE [AvalauncheTestsDB] SET COMPATIBILITY_LEVEL = 120
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AvalauncheTestsDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE [AvalauncheTestsDB] SET ANSI_NULL_DEFAULT OFF 
GO

ALTER DATABASE [AvalauncheTestsDB] SET ANSI_NULLS OFF 
GO

ALTER DATABASE [AvalauncheTestsDB] SET ANSI_PADDING OFF 
GO

ALTER DATABASE [AvalauncheTestsDB] SET ANSI_WARNINGS OFF 
GO

ALTER DATABASE [AvalauncheTestsDB] SET ARITHABORT OFF 
GO

ALTER DATABASE [AvalauncheTestsDB] SET AUTO_CLOSE OFF 
GO

ALTER DATABASE [AvalauncheTestsDB] SET AUTO_SHRINK OFF 
GO

ALTER DATABASE [AvalauncheTestsDB] SET AUTO_UPDATE_STATISTICS ON 
GO

ALTER DATABASE [AvalauncheTestsDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO

ALTER DATABASE [AvalauncheTestsDB] SET CURSOR_DEFAULT  GLOBAL 
GO

ALTER DATABASE [AvalauncheTestsDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO

ALTER DATABASE [AvalauncheTestsDB] SET NUMERIC_ROUNDABORT OFF 
GO

ALTER DATABASE [AvalauncheTestsDB] SET QUOTED_IDENTIFIER OFF 
GO

ALTER DATABASE [AvalauncheTestsDB] SET RECURSIVE_TRIGGERS OFF 
GO

ALTER DATABASE [AvalauncheTestsDB] SET  DISABLE_BROKER 
GO

ALTER DATABASE [AvalauncheTestsDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO

ALTER DATABASE [AvalauncheTestsDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO

ALTER DATABASE [AvalauncheTestsDB] SET TRUSTWORTHY OFF 
GO

ALTER DATABASE [AvalauncheTestsDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO

ALTER DATABASE [AvalauncheTestsDB] SET PARAMETERIZATION SIMPLE 
GO

ALTER DATABASE [AvalauncheTestsDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO

ALTER DATABASE [AvalauncheTestsDB] SET HONOR_BROKER_PRIORITY OFF 
GO

ALTER DATABASE [AvalauncheTestsDB] SET RECOVERY FULL 
GO

ALTER DATABASE [AvalauncheTestsDB] SET  MULTI_USER 
GO

ALTER DATABASE [AvalauncheTestsDB] SET PAGE_VERIFY CHECKSUM  
GO

ALTER DATABASE [AvalauncheTestsDB] SET DB_CHAINING OFF 
GO

ALTER DATABASE [AvalauncheTestsDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO

ALTER DATABASE [AvalauncheTestsDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO

ALTER DATABASE [AvalauncheTestsDB] SET DELAYED_DURABILITY = DISABLED 
GO

ALTER DATABASE [AvalauncheTestsDB] SET  READ_WRITE 
GO

