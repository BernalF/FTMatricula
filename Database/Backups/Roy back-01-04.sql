USE [master]
GO
/****** Object:  Database [matrifunDB]    Script Date: 04/01/2013 10:27:46 ******/
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = N'matrifunDB')
BEGIN
CREATE DATABASE [matrifunDB] ON  PRIMARY 
( NAME = N'matrifunDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\matrifunDB.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'matrifunDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\matrifunDB_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
END
GO
ALTER DATABASE [matrifunDB] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [matrifunDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [matrifunDB] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [matrifunDB] SET ANSI_NULLS OFF
GO
ALTER DATABASE [matrifunDB] SET ANSI_PADDING OFF
GO
ALTER DATABASE [matrifunDB] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [matrifunDB] SET ARITHABORT OFF
GO
ALTER DATABASE [matrifunDB] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [matrifunDB] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [matrifunDB] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [matrifunDB] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [matrifunDB] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [matrifunDB] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [matrifunDB] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [matrifunDB] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [matrifunDB] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [matrifunDB] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [matrifunDB] SET  DISABLE_BROKER
GO
ALTER DATABASE [matrifunDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [matrifunDB] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [matrifunDB] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [matrifunDB] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [matrifunDB] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [matrifunDB] SET READ_COMMITTED_SNAPSHOT OFF
GO
--ALTER DATABASE [matrifunDB] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [matrifunDB] SET  READ_WRITE
GO
ALTER DATABASE [matrifunDB] SET RECOVERY FULL
GO
ALTER DATABASE [matrifunDB] SET  MULTI_USER
GO
ALTER DATABASE [matrifunDB] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [matrifunDB] SET DB_CHAINING OFF
GO
EXEC sys.sp_db_vardecimal_storage_format N'matrifunDB', N'ON'
GO
USE [matrifunDB]
GO
/****** Object:  ForeignKey [UserApplication]    Script Date: 04/01/2013 10:27:49 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[UserApplication]') AND parent_object_id = OBJECT_ID(N'[dbo].[Users]'))
ALTER TABLE [dbo].[Users] DROP CONSTRAINT [UserApplication]
GO
/****** Object:  ForeignKey [FK_Scheme_Modality]    Script Date: 04/01/2013 10:27:49 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Scheme_Modality]') AND parent_object_id = OBJECT_ID(N'[dbo].[Scheme]'))
ALTER TABLE [dbo].[Scheme] DROP CONSTRAINT [FK_Scheme_Modality]
GO
/****** Object:  ForeignKey [RoleApplication]    Script Date: 04/01/2013 10:27:50 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[RoleApplication]') AND parent_object_id = OBJECT_ID(N'[dbo].[Roles]'))
ALTER TABLE [dbo].[Roles] DROP CONSTRAINT [RoleApplication]
GO
/****** Object:  ForeignKey [FK_Score_Course]    Script Date: 04/01/2013 10:27:50 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Score_Course]') AND parent_object_id = OBJECT_ID(N'[dbo].[Score]'))
ALTER TABLE [dbo].[Score] DROP CONSTRAINT [FK_Score_Course]
GO
/****** Object:  ForeignKey [FK_Enrollment_Location]    Script Date: 04/01/2013 10:27:50 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Enrollment_Location]') AND parent_object_id = OBJECT_ID(N'[dbo].[Enrollment]'))
ALTER TABLE [dbo].[Enrollment] DROP CONSTRAINT [FK_Enrollment_Location]
GO
/****** Object:  ForeignKey [FK_Enrollment_Plan]    Script Date: 04/01/2013 10:27:50 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Enrollment_Plan]') AND parent_object_id = OBJECT_ID(N'[dbo].[Enrollment]'))
ALTER TABLE [dbo].[Enrollment] DROP CONSTRAINT [FK_Enrollment_Plan]
GO
/****** Object:  ForeignKey [FK_Course-Requirement_Course]    Script Date: 04/01/2013 10:27:50 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Course-Requirement_Course]') AND parent_object_id = OBJECT_ID(N'[dbo].[Course-Requirement]'))
ALTER TABLE [dbo].[Course-Requirement] DROP CONSTRAINT [FK_Course-Requirement_Course]
GO
/****** Object:  ForeignKey [FK_Course-Requirement_Requirement]    Script Date: 04/01/2013 10:27:50 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Course-Requirement_Requirement]') AND parent_object_id = OBJECT_ID(N'[dbo].[Course-Requirement]'))
ALTER TABLE [dbo].[Course-Requirement] DROP CONSTRAINT [FK_Course-Requirement_Requirement]
GO
/****** Object:  ForeignKey [FK_Plan-Course_Course]    Script Date: 04/01/2013 10:27:50 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Plan-Course_Course]') AND parent_object_id = OBJECT_ID(N'[dbo].[Plan-Course]'))
ALTER TABLE [dbo].[Plan-Course] DROP CONSTRAINT [FK_Plan-Course_Course]
GO
/****** Object:  ForeignKey [FK_Plan-Course_Plan]    Script Date: 04/01/2013 10:27:50 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Plan-Course_Plan]') AND parent_object_id = OBJECT_ID(N'[dbo].[Plan-Course]'))
ALTER TABLE [dbo].[Plan-Course] DROP CONSTRAINT [FK_Plan-Course_Plan]
GO
/****** Object:  ForeignKey [UsersInRoleRole]    Script Date: 04/01/2013 10:27:52 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[UsersInRoleRole]') AND parent_object_id = OBJECT_ID(N'[dbo].[UsersInRoles]'))
ALTER TABLE [dbo].[UsersInRoles] DROP CONSTRAINT [UsersInRoleRole]
GO
/****** Object:  ForeignKey [UsersInRoleUser]    Script Date: 04/01/2013 10:27:52 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[UsersInRoleUser]') AND parent_object_id = OBJECT_ID(N'[dbo].[UsersInRoles]'))
ALTER TABLE [dbo].[UsersInRoles] DROP CONSTRAINT [UsersInRoleUser]
GO
/****** Object:  ForeignKey [FK_Student_Country]    Script Date: 04/01/2013 10:27:53 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Student_Country]') AND parent_object_id = OBJECT_ID(N'[dbo].[Student]'))
ALTER TABLE [dbo].[Student] DROP CONSTRAINT [FK_Student_Country]
GO
/****** Object:  ForeignKey [FK_Student_Type]    Script Date: 04/01/2013 10:27:53 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Student_Type]') AND parent_object_id = OBJECT_ID(N'[dbo].[Student]'))
ALTER TABLE [dbo].[Student] DROP CONSTRAINT [FK_Student_Type]
GO
/****** Object:  ForeignKey [FK_Student_Type_MaritalStatus]    Script Date: 04/01/2013 10:27:53 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Student_Type_MaritalStatus]') AND parent_object_id = OBJECT_ID(N'[dbo].[Student]'))
ALTER TABLE [dbo].[Student] DROP CONSTRAINT [FK_Student_Type_MaritalStatus]
GO
/****** Object:  ForeignKey [FK_Student_Users]    Script Date: 04/01/2013 10:27:53 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Student_Users]') AND parent_object_id = OBJECT_ID(N'[dbo].[Student]'))
ALTER TABLE [dbo].[Student] DROP CONSTRAINT [FK_Student_Users]
GO
/****** Object:  ForeignKey [MembershipApplication]    Script Date: 04/01/2013 10:27:53 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[MembershipApplication]') AND parent_object_id = OBJECT_ID(N'[dbo].[Memberships]'))
ALTER TABLE [dbo].[Memberships] DROP CONSTRAINT [MembershipApplication]
GO
/****** Object:  ForeignKey [MembershipUser]    Script Date: 04/01/2013 10:27:53 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[MembershipUser]') AND parent_object_id = OBJECT_ID(N'[dbo].[Memberships]'))
ALTER TABLE [dbo].[Memberships] DROP CONSTRAINT [MembershipUser]
GO
/****** Object:  ForeignKey [FK_Record_Score]    Script Date: 04/01/2013 10:27:53 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Record_Score]') AND parent_object_id = OBJECT_ID(N'[dbo].[Record]'))
ALTER TABLE [dbo].[Record] DROP CONSTRAINT [FK_Record_Score]
GO
/****** Object:  ForeignKey [UserProfile]    Script Date: 04/01/2013 10:27:53 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[UserProfile]') AND parent_object_id = OBJECT_ID(N'[dbo].[Profiles]'))
ALTER TABLE [dbo].[Profiles] DROP CONSTRAINT [UserProfile]
GO
/****** Object:  ForeignKey [FK_EnrollmentCourse_Course]    Script Date: 04/01/2013 10:27:53 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_EnrollmentCourse_Course]') AND parent_object_id = OBJECT_ID(N'[dbo].[EnrollmentCourse]'))
ALTER TABLE [dbo].[EnrollmentCourse] DROP CONSTRAINT [FK_EnrollmentCourse_Course]
GO
/****** Object:  ForeignKey [FK_EnrollmentCourse_Enrollment]    Script Date: 04/01/2013 10:27:53 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_EnrollmentCourse_Enrollment]') AND parent_object_id = OBJECT_ID(N'[dbo].[EnrollmentCourse]'))
ALTER TABLE [dbo].[EnrollmentCourse] DROP CONSTRAINT [FK_EnrollmentCourse_Enrollment]
GO
/****** Object:  ForeignKey [FK_School-Scheme_Scheme]    Script Date: 04/01/2013 10:27:53 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_School-Scheme_Scheme]') AND parent_object_id = OBJECT_ID(N'[dbo].[School-Scheme]'))
ALTER TABLE [dbo].[School-Scheme] DROP CONSTRAINT [FK_School-Scheme_Scheme]
GO
/****** Object:  ForeignKey [FK_School-Scheme_School]    Script Date: 04/01/2013 10:27:53 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_School-Scheme_School]') AND parent_object_id = OBJECT_ID(N'[dbo].[School-Scheme]'))
ALTER TABLE [dbo].[School-Scheme] DROP CONSTRAINT [FK_School-Scheme_School]
GO
/****** Object:  ForeignKey [FK_Scheme-Requirement_Requirement]    Script Date: 04/01/2013 10:27:53 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Scheme-Requirement_Requirement]') AND parent_object_id = OBJECT_ID(N'[dbo].[Scheme-Requirement]'))
ALTER TABLE [dbo].[Scheme-Requirement] DROP CONSTRAINT [FK_Scheme-Requirement_Requirement]
GO
/****** Object:  ForeignKey [FK_Scheme-Requirement_Scheme]    Script Date: 04/01/2013 10:27:53 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Scheme-Requirement_Scheme]') AND parent_object_id = OBJECT_ID(N'[dbo].[Scheme-Requirement]'))
ALTER TABLE [dbo].[Scheme-Requirement] DROP CONSTRAINT [FK_Scheme-Requirement_Scheme]
GO
/****** Object:  ForeignKey [FK_Scheme-Plan_Plan]    Script Date: 04/01/2013 10:27:54 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Scheme-Plan_Plan]') AND parent_object_id = OBJECT_ID(N'[dbo].[Scheme-Plan]'))
ALTER TABLE [dbo].[Scheme-Plan] DROP CONSTRAINT [FK_Scheme-Plan_Plan]
GO
/****** Object:  ForeignKey [FK_Scheme-Plan_Scheme]    Script Date: 04/01/2013 10:27:54 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Scheme-Plan_Scheme]') AND parent_object_id = OBJECT_ID(N'[dbo].[Scheme-Plan]'))
ALTER TABLE [dbo].[Scheme-Plan] DROP CONSTRAINT [FK_Scheme-Plan_Scheme]
GO
/****** Object:  ForeignKey [FK_StudiesInformation_Student]    Script Date: 04/01/2013 10:27:54 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_StudiesInformation_Student]') AND parent_object_id = OBJECT_ID(N'[dbo].[StudiesInformation]'))
ALTER TABLE [dbo].[StudiesInformation] DROP CONSTRAINT [FK_StudiesInformation_Student]
GO
/****** Object:  ForeignKey [FK_StudentPlan_Plan]    Script Date: 04/01/2013 10:27:54 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_StudentPlan_Plan]') AND parent_object_id = OBJECT_ID(N'[dbo].[StudentPlan]'))
ALTER TABLE [dbo].[StudentPlan] DROP CONSTRAINT [FK_StudentPlan_Plan]
GO
/****** Object:  ForeignKey [FK_StudentPlan_Student]    Script Date: 04/01/2013 10:27:54 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_StudentPlan_Student]') AND parent_object_id = OBJECT_ID(N'[dbo].[StudentPlan]'))
ALTER TABLE [dbo].[StudentPlan] DROP CONSTRAINT [FK_StudentPlan_Student]
GO
/****** Object:  ForeignKey [FK_Student-Course_Course]    Script Date: 04/01/2013 10:27:54 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Student-Course_Course]') AND parent_object_id = OBJECT_ID(N'[dbo].[Student-Course]'))
ALTER TABLE [dbo].[Student-Course] DROP CONSTRAINT [FK_Student-Course_Course]
GO
/****** Object:  ForeignKey [FK_Student-Course_Student]    Script Date: 04/01/2013 10:27:54 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Student-Course_Student]') AND parent_object_id = OBJECT_ID(N'[dbo].[Student-Course]'))
ALTER TABLE [dbo].[Student-Course] DROP CONSTRAINT [FK_Student-Course_Student]
GO
/****** Object:  ForeignKey [FK_StudentAdditionalData_Student]    Script Date: 04/01/2013 10:27:54 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_StudentAdditionalData_Student]') AND parent_object_id = OBJECT_ID(N'[dbo].[StudentAdditionalData]'))
ALTER TABLE [dbo].[StudentAdditionalData] DROP CONSTRAINT [FK_StudentAdditionalData_Student]
GO
/****** Object:  ForeignKey [FK_StudentAdditionalData_Type_HowYouKnow]    Script Date: 04/01/2013 10:27:54 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_StudentAdditionalData_Type_HowYouKnow]') AND parent_object_id = OBJECT_ID(N'[dbo].[StudentAdditionalData]'))
ALTER TABLE [dbo].[StudentAdditionalData] DROP CONSTRAINT [FK_StudentAdditionalData_Type_HowYouKnow]
GO
/****** Object:  ForeignKey [FK_StudentAdditionalData_Type_WhoPays]    Script Date: 04/01/2013 10:27:54 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_StudentAdditionalData_Type_WhoPays]') AND parent_object_id = OBJECT_ID(N'[dbo].[StudentAdditionalData]'))
ALTER TABLE [dbo].[StudentAdditionalData] DROP CONSTRAINT [FK_StudentAdditionalData_Type_WhoPays]
GO
/****** Object:  ForeignKey [FK_EnrollmentGroups_Classroom]    Script Date: 04/01/2013 10:27:54 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_EnrollmentGroups_Classroom]') AND parent_object_id = OBJECT_ID(N'[dbo].[EnrollmentGroups]'))
ALTER TABLE [dbo].[EnrollmentGroups] DROP CONSTRAINT [FK_EnrollmentGroups_Classroom]
GO
/****** Object:  ForeignKey [FK_EnrollmentGroups_EnrollmentCourse]    Script Date: 04/01/2013 10:27:54 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_EnrollmentGroups_EnrollmentCourse]') AND parent_object_id = OBJECT_ID(N'[dbo].[EnrollmentGroups]'))
ALTER TABLE [dbo].[EnrollmentGroups] DROP CONSTRAINT [FK_EnrollmentGroups_EnrollmentCourse]
GO
/****** Object:  ForeignKey [FK_EnrollmentGroups_Users]    Script Date: 04/01/2013 10:27:54 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_EnrollmentGroups_Users]') AND parent_object_id = OBJECT_ID(N'[dbo].[EnrollmentGroups]'))
ALTER TABLE [dbo].[EnrollmentGroups] DROP CONSTRAINT [FK_EnrollmentGroups_Users]
GO
/****** Object:  ForeignKey [FK_EnrollmentGroupSchedule_EnrollmentGroups]    Script Date: 04/01/2013 10:27:55 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_EnrollmentGroupSchedule_EnrollmentGroups]') AND parent_object_id = OBJECT_ID(N'[dbo].[EnrollmentGroupSchedule]'))
ALTER TABLE [dbo].[EnrollmentGroupSchedule] DROP CONSTRAINT [FK_EnrollmentGroupSchedule_EnrollmentGroups]
GO
/****** Object:  Table [dbo].[EnrollmentGroupSchedule]    Script Date: 04/01/2013 10:27:55 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_EnrollmentGroupSchedule_EnrollmentGroups]') AND parent_object_id = OBJECT_ID(N'[dbo].[EnrollmentGroupSchedule]'))
ALTER TABLE [dbo].[EnrollmentGroupSchedule] DROP CONSTRAINT [FK_EnrollmentGroupSchedule_EnrollmentGroups]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EnrollmentGroupSchedule]') AND type in (N'U'))
DROP TABLE [dbo].[EnrollmentGroupSchedule]
GO
/****** Object:  Table [dbo].[EnrollmentGroups]    Script Date: 04/01/2013 10:27:54 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_EnrollmentGroups_Classroom]') AND parent_object_id = OBJECT_ID(N'[dbo].[EnrollmentGroups]'))
ALTER TABLE [dbo].[EnrollmentGroups] DROP CONSTRAINT [FK_EnrollmentGroups_Classroom]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_EnrollmentGroups_EnrollmentCourse]') AND parent_object_id = OBJECT_ID(N'[dbo].[EnrollmentGroups]'))
ALTER TABLE [dbo].[EnrollmentGroups] DROP CONSTRAINT [FK_EnrollmentGroups_EnrollmentCourse]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_EnrollmentGroups_Users]') AND parent_object_id = OBJECT_ID(N'[dbo].[EnrollmentGroups]'))
ALTER TABLE [dbo].[EnrollmentGroups] DROP CONSTRAINT [FK_EnrollmentGroups_Users]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EnrollmentGroups]') AND type in (N'U'))
DROP TABLE [dbo].[EnrollmentGroups]
GO
/****** Object:  View [dbo].[PlanDetails]    Script Date: 04/01/2013 10:27:54 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[PlanDetails]'))
DROP VIEW [dbo].[PlanDetails]
GO
/****** Object:  View [dbo].[ApplicationUser]    Script Date: 04/01/2013 10:27:54 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[ApplicationUser]'))
DROP VIEW [dbo].[ApplicationUser]
GO
/****** Object:  Table [dbo].[StudentAdditionalData]    Script Date: 04/01/2013 10:27:54 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_StudentAdditionalData_Student]') AND parent_object_id = OBJECT_ID(N'[dbo].[StudentAdditionalData]'))
ALTER TABLE [dbo].[StudentAdditionalData] DROP CONSTRAINT [FK_StudentAdditionalData_Student]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_StudentAdditionalData_Type_HowYouKnow]') AND parent_object_id = OBJECT_ID(N'[dbo].[StudentAdditionalData]'))
ALTER TABLE [dbo].[StudentAdditionalData] DROP CONSTRAINT [FK_StudentAdditionalData_Type_HowYouKnow]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_StudentAdditionalData_Type_WhoPays]') AND parent_object_id = OBJECT_ID(N'[dbo].[StudentAdditionalData]'))
ALTER TABLE [dbo].[StudentAdditionalData] DROP CONSTRAINT [FK_StudentAdditionalData_Type_WhoPays]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[StudentAdditionalData]') AND type in (N'U'))
DROP TABLE [dbo].[StudentAdditionalData]
GO
/****** Object:  Table [dbo].[Student-Course]    Script Date: 04/01/2013 10:27:54 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Student-Course_Course]') AND parent_object_id = OBJECT_ID(N'[dbo].[Student-Course]'))
ALTER TABLE [dbo].[Student-Course] DROP CONSTRAINT [FK_Student-Course_Course]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Student-Course_Student]') AND parent_object_id = OBJECT_ID(N'[dbo].[Student-Course]'))
ALTER TABLE [dbo].[Student-Course] DROP CONSTRAINT [FK_Student-Course_Student]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Student-Course]') AND type in (N'U'))
DROP TABLE [dbo].[Student-Course]
GO
/****** Object:  Table [dbo].[StudentPlan]    Script Date: 04/01/2013 10:27:54 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_StudentPlan_Plan]') AND parent_object_id = OBJECT_ID(N'[dbo].[StudentPlan]'))
ALTER TABLE [dbo].[StudentPlan] DROP CONSTRAINT [FK_StudentPlan_Plan]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_StudentPlan_Student]') AND parent_object_id = OBJECT_ID(N'[dbo].[StudentPlan]'))
ALTER TABLE [dbo].[StudentPlan] DROP CONSTRAINT [FK_StudentPlan_Student]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[StudentPlan]') AND type in (N'U'))
DROP TABLE [dbo].[StudentPlan]
GO
/****** Object:  Table [dbo].[StudiesInformation]    Script Date: 04/01/2013 10:27:54 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_StudiesInformation_Student]') AND parent_object_id = OBJECT_ID(N'[dbo].[StudiesInformation]'))
ALTER TABLE [dbo].[StudiesInformation] DROP CONSTRAINT [FK_StudiesInformation_Student]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[StudiesInformation]') AND type in (N'U'))
DROP TABLE [dbo].[StudiesInformation]
GO
/****** Object:  View [dbo].[SchemeDetails]    Script Date: 04/01/2013 10:27:54 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[SchemeDetails]'))
DROP VIEW [dbo].[SchemeDetails]
GO
/****** Object:  Table [dbo].[Scheme-Plan]    Script Date: 04/01/2013 10:27:54 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Scheme-Plan_Plan]') AND parent_object_id = OBJECT_ID(N'[dbo].[Scheme-Plan]'))
ALTER TABLE [dbo].[Scheme-Plan] DROP CONSTRAINT [FK_Scheme-Plan_Plan]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Scheme-Plan_Scheme]') AND parent_object_id = OBJECT_ID(N'[dbo].[Scheme-Plan]'))
ALTER TABLE [dbo].[Scheme-Plan] DROP CONSTRAINT [FK_Scheme-Plan_Scheme]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Scheme-Plan]') AND type in (N'U'))
DROP TABLE [dbo].[Scheme-Plan]
GO
/****** Object:  Table [dbo].[Scheme-Requirement]    Script Date: 04/01/2013 10:27:53 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Scheme-Requirement_Requirement]') AND parent_object_id = OBJECT_ID(N'[dbo].[Scheme-Requirement]'))
ALTER TABLE [dbo].[Scheme-Requirement] DROP CONSTRAINT [FK_Scheme-Requirement_Requirement]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Scheme-Requirement_Scheme]') AND parent_object_id = OBJECT_ID(N'[dbo].[Scheme-Requirement]'))
ALTER TABLE [dbo].[Scheme-Requirement] DROP CONSTRAINT [FK_Scheme-Requirement_Scheme]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Scheme-Requirement]') AND type in (N'U'))
DROP TABLE [dbo].[Scheme-Requirement]
GO
/****** Object:  Table [dbo].[School-Scheme]    Script Date: 04/01/2013 10:27:53 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_School-Scheme_Scheme]') AND parent_object_id = OBJECT_ID(N'[dbo].[School-Scheme]'))
ALTER TABLE [dbo].[School-Scheme] DROP CONSTRAINT [FK_School-Scheme_Scheme]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_School-Scheme_School]') AND parent_object_id = OBJECT_ID(N'[dbo].[School-Scheme]'))
ALTER TABLE [dbo].[School-Scheme] DROP CONSTRAINT [FK_School-Scheme_School]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[School-Scheme]') AND type in (N'U'))
DROP TABLE [dbo].[School-Scheme]
GO
/****** Object:  Table [dbo].[EnrollmentCourse]    Script Date: 04/01/2013 10:27:53 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_EnrollmentCourse_Course]') AND parent_object_id = OBJECT_ID(N'[dbo].[EnrollmentCourse]'))
ALTER TABLE [dbo].[EnrollmentCourse] DROP CONSTRAINT [FK_EnrollmentCourse_Course]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_EnrollmentCourse_Enrollment]') AND parent_object_id = OBJECT_ID(N'[dbo].[EnrollmentCourse]'))
ALTER TABLE [dbo].[EnrollmentCourse] DROP CONSTRAINT [FK_EnrollmentCourse_Enrollment]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EnrollmentCourse]') AND type in (N'U'))
DROP TABLE [dbo].[EnrollmentCourse]
GO
/****** Object:  Table [dbo].[Profiles]    Script Date: 04/01/2013 10:27:53 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[UserProfile]') AND parent_object_id = OBJECT_ID(N'[dbo].[Profiles]'))
ALTER TABLE [dbo].[Profiles] DROP CONSTRAINT [UserProfile]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Profiles]') AND type in (N'U'))
DROP TABLE [dbo].[Profiles]
GO
/****** Object:  Table [dbo].[Record]    Script Date: 04/01/2013 10:27:53 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Record_Score]') AND parent_object_id = OBJECT_ID(N'[dbo].[Record]'))
ALTER TABLE [dbo].[Record] DROP CONSTRAINT [FK_Record_Score]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Record]') AND type in (N'U'))
DROP TABLE [dbo].[Record]
GO
/****** Object:  Table [dbo].[Memberships]    Script Date: 04/01/2013 10:27:53 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[MembershipApplication]') AND parent_object_id = OBJECT_ID(N'[dbo].[Memberships]'))
ALTER TABLE [dbo].[Memberships] DROP CONSTRAINT [MembershipApplication]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[MembershipUser]') AND parent_object_id = OBJECT_ID(N'[dbo].[Memberships]'))
ALTER TABLE [dbo].[Memberships] DROP CONSTRAINT [MembershipUser]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Memberships]') AND type in (N'U'))
DROP TABLE [dbo].[Memberships]
GO
/****** Object:  Table [dbo].[Student]    Script Date: 04/01/2013 10:27:53 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Student_Country]') AND parent_object_id = OBJECT_ID(N'[dbo].[Student]'))
ALTER TABLE [dbo].[Student] DROP CONSTRAINT [FK_Student_Country]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Student_Type]') AND parent_object_id = OBJECT_ID(N'[dbo].[Student]'))
ALTER TABLE [dbo].[Student] DROP CONSTRAINT [FK_Student_Type]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Student_Type_MaritalStatus]') AND parent_object_id = OBJECT_ID(N'[dbo].[Student]'))
ALTER TABLE [dbo].[Student] DROP CONSTRAINT [FK_Student_Type_MaritalStatus]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Student_Users]') AND parent_object_id = OBJECT_ID(N'[dbo].[Student]'))
ALTER TABLE [dbo].[Student] DROP CONSTRAINT [FK_Student_Users]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Student]') AND type in (N'U'))
DROP TABLE [dbo].[Student]
GO
/****** Object:  Table [dbo].[UsersInRoles]    Script Date: 04/01/2013 10:27:52 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[UsersInRoleRole]') AND parent_object_id = OBJECT_ID(N'[dbo].[UsersInRoles]'))
ALTER TABLE [dbo].[UsersInRoles] DROP CONSTRAINT [UsersInRoleRole]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[UsersInRoleUser]') AND parent_object_id = OBJECT_ID(N'[dbo].[UsersInRoles]'))
ALTER TABLE [dbo].[UsersInRoles] DROP CONSTRAINT [UsersInRoleUser]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UsersInRoles]') AND type in (N'U'))
DROP TABLE [dbo].[UsersInRoles]
GO
/****** Object:  StoredProcedure [dbo].[uspRetrieveUserID]    Script Date: 04/01/2013 10:27:52 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[uspRetrieveUserID]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[uspRetrieveUserID]
GO
/****** Object:  StoredProcedure [dbo].[uspUserNameUpdate]    Script Date: 04/01/2013 10:27:52 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[uspUserNameUpdate]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[uspUserNameUpdate]
GO
/****** Object:  Table [dbo].[Plan-Course]    Script Date: 04/01/2013 10:27:50 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Plan-Course_Course]') AND parent_object_id = OBJECT_ID(N'[dbo].[Plan-Course]'))
ALTER TABLE [dbo].[Plan-Course] DROP CONSTRAINT [FK_Plan-Course_Course]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Plan-Course_Plan]') AND parent_object_id = OBJECT_ID(N'[dbo].[Plan-Course]'))
ALTER TABLE [dbo].[Plan-Course] DROP CONSTRAINT [FK_Plan-Course_Plan]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Plan-Course]') AND type in (N'U'))
DROP TABLE [dbo].[Plan-Course]
GO
/****** Object:  Table [dbo].[Course-Requirement]    Script Date: 04/01/2013 10:27:50 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Course-Requirement_Course]') AND parent_object_id = OBJECT_ID(N'[dbo].[Course-Requirement]'))
ALTER TABLE [dbo].[Course-Requirement] DROP CONSTRAINT [FK_Course-Requirement_Course]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Course-Requirement_Requirement]') AND parent_object_id = OBJECT_ID(N'[dbo].[Course-Requirement]'))
ALTER TABLE [dbo].[Course-Requirement] DROP CONSTRAINT [FK_Course-Requirement_Requirement]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Course-Requirement]') AND type in (N'U'))
DROP TABLE [dbo].[Course-Requirement]
GO
/****** Object:  Table [dbo].[Enrollment]    Script Date: 04/01/2013 10:27:50 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Enrollment_Location]') AND parent_object_id = OBJECT_ID(N'[dbo].[Enrollment]'))
ALTER TABLE [dbo].[Enrollment] DROP CONSTRAINT [FK_Enrollment_Location]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Enrollment_Plan]') AND parent_object_id = OBJECT_ID(N'[dbo].[Enrollment]'))
ALTER TABLE [dbo].[Enrollment] DROP CONSTRAINT [FK_Enrollment_Plan]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Enrollment]') AND type in (N'U'))
DROP TABLE [dbo].[Enrollment]
GO
/****** Object:  Table [dbo].[Score]    Script Date: 04/01/2013 10:27:50 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Score_Course]') AND parent_object_id = OBJECT_ID(N'[dbo].[Score]'))
ALTER TABLE [dbo].[Score] DROP CONSTRAINT [FK_Score_Course]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Score]') AND type in (N'U'))
DROP TABLE [dbo].[Score]
GO
/****** Object:  View [dbo].[RequirementDetails]    Script Date: 04/01/2013 10:27:50 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[RequirementDetails]'))
DROP VIEW [dbo].[RequirementDetails]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 04/01/2013 10:27:50 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[RoleApplication]') AND parent_object_id = OBJECT_ID(N'[dbo].[Roles]'))
ALTER TABLE [dbo].[Roles] DROP CONSTRAINT [RoleApplication]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Roles]') AND type in (N'U'))
DROP TABLE [dbo].[Roles]
GO
/****** Object:  Table [dbo].[Scheme]    Script Date: 04/01/2013 10:27:49 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Scheme_Modality]') AND parent_object_id = OBJECT_ID(N'[dbo].[Scheme]'))
ALTER TABLE [dbo].[Scheme] DROP CONSTRAINT [FK_Scheme_Modality]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Scheme]') AND type in (N'U'))
DROP TABLE [dbo].[Scheme]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 04/01/2013 10:27:49 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[UserApplication]') AND parent_object_id = OBJECT_ID(N'[dbo].[Users]'))
ALTER TABLE [dbo].[Users] DROP CONSTRAINT [UserApplication]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Users]') AND type in (N'U'))
DROP TABLE [dbo].[Users]
GO
/****** Object:  Table [dbo].[Type]    Script Date: 04/01/2013 10:27:49 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Type]') AND type in (N'U'))
DROP TABLE [dbo].[Type]
GO
/****** Object:  Table [dbo].[Resource]    Script Date: 04/01/2013 10:27:49 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Resource]') AND type in (N'U'))
DROP TABLE [dbo].[Resource]
GO
/****** Object:  Table [dbo].[School]    Script Date: 04/01/2013 10:27:49 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[School]') AND type in (N'U'))
DROP TABLE [dbo].[School]
GO
/****** Object:  Table [dbo].[Applications]    Script Date: 04/01/2013 10:27:49 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Applications]') AND type in (N'U'))
DROP TABLE [dbo].[Applications]
GO
/****** Object:  Table [dbo].[Classroom]    Script Date: 04/01/2013 10:27:49 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Classroom]') AND type in (N'U'))
DROP TABLE [dbo].[Classroom]
GO
/****** Object:  Table [dbo].[Country]    Script Date: 04/01/2013 10:27:48 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Country]') AND type in (N'U'))
DROP TABLE [dbo].[Country]
GO
/****** Object:  Table [dbo].[Course]    Script Date: 04/01/2013 10:27:48 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Course]') AND type in (N'U'))
DROP TABLE [dbo].[Course]
GO
/****** Object:  Table [dbo].[Modality]    Script Date: 04/01/2013 10:27:48 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Modality]') AND type in (N'U'))
DROP TABLE [dbo].[Modality]
GO
/****** Object:  Table [dbo].[Plan]    Script Date: 04/01/2013 10:27:48 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Plan]') AND type in (N'U'))
DROP TABLE [dbo].[Plan]
GO
/****** Object:  Table [dbo].[Requirement]    Script Date: 04/01/2013 10:27:48 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Requirement]') AND type in (N'U'))
DROP TABLE [dbo].[Requirement]
GO
/****** Object:  Table [dbo].[Location]    Script Date: 04/01/2013 10:27:48 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Location]') AND type in (N'U'))
DROP TABLE [dbo].[Location]
GO
/****** Object:  Table [dbo].[Location]    Script Date: 04/01/2013 10:27:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Location]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Location](
	[LocationID] [uniqueidentifier] NOT NULL,
	[Name] [varchar](120) NOT NULL,
	[Line1] [varchar](300) NULL,
	[Line2] [varchar](300) NULL,
	[InsertDate] [datetime] NULL,
	[Latitude] [decimal](9, 6) NULL,
	[Longitude] [decimal](9, 6) NULL,
	[InsertUserID] [uniqueidentifier] NULL,
	[ModifyDate] [datetime] NULL,
	[ModifyUserID] [uniqueidentifier] NULL,
	[IpAddress] [varchar](200) NULL,
 CONSTRAINT [PK_Location] PRIMARY KEY CLUSTERED 
(
	[LocationID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Location] ([LocationID], [Name], [Line1], [Line2], [InsertDate], [Latitude], [Longitude], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress]) VALUES (N'9b72a256-a6be-4928-9ae2-12e7a45bc0dc', N'I.N.S - Heredia', N'Detrás del edificio de los bomberos', N'Carretera a Cubujuquí', CAST(0x0000A18500000000 AS DateTime), NULL, NULL, N'07be103c-baba-4f65-96da-dbe111707758', NULL, NULL, N'172.17.7.10')
INSERT [dbo].[Location] ([LocationID], [Name], [Line1], [Line2], [InsertDate], [Latitude], [Longitude], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress]) VALUES (N'87d72c30-c1ba-4b2f-8ead-404de1acd149', N'I.N.S - Pérez Zeledón', N'Pérez Zeledón', NULL, NULL, NULL, NULL, NULL, CAST(0x0000A16400000000 AS DateTime), N'22e466ed-5b35-4734-89e9-cc2b9ec3e55a', N'172.26.52.168')
INSERT [dbo].[Location] ([LocationID], [Name], [Line1], [Line2], [InsertDate], [Latitude], [Longitude], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress]) VALUES (N'afa46c3d-891f-473d-86c2-ac6a0156b461', N'I.N.S - Puntarenas', N'Puntarenas', NULL, CAST(0x0000A16400000000 AS DateTime), NULL, NULL, N'22e466ed-5b35-4734-89e9-cc2b9ec3e55a', NULL, NULL, N'172.26.52.168')
INSERT [dbo].[Location] ([LocationID], [Name], [Line1], [Line2], [InsertDate], [Latitude], [Longitude], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress]) VALUES (N'0af4846d-c346-4e84-8338-b18c0f85f820', N'ITCR - Cartago', N'Instituto Tecnológico de Cartago', N'Sede central', NULL, NULL, NULL, NULL, CAST(0x0000A17F00000000 AS DateTime), N'09e4d1cd-a983-432a-80a9-2fc910e920d2', N'172.26.94.204')
INSERT [dbo].[Location] ([LocationID], [Name], [Line1], [Line2], [InsertDate], [Latitude], [Longitude], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress]) VALUES (N'dfab2d5c-d3fa-40c5-943d-b71b852f08c9', N'I.N.S', N'Edificio central en San José', N'Frente al Parque España', NULL, NULL, NULL, NULL, CAST(0x0000A16400000000 AS DateTime), N'22e466ed-5b35-4734-89e9-cc2b9ec3e55a', N'172.26.52.168')
INSERT [dbo].[Location] ([LocationID], [Name], [Line1], [Line2], [InsertDate], [Latitude], [Longitude], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress]) VALUES (N'81a83f73-ce0d-4dba-8730-d2e45c0a638f', N'ITCR - San José', N'Instituto Tecnológico de San José', N'Barrio Amón', NULL, NULL, NULL, NULL, CAST(0x0000A17F00000000 AS DateTime), N'09e4d1cd-a983-432a-80a9-2fc910e920d2', N'172.26.94.204')
/****** Object:  Table [dbo].[Requirement]    Script Date: 04/01/2013 10:27:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Requirement]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Requirement](
	[RequirementID] [uniqueidentifier] NOT NULL,
	[Name] [varchar](120) NOT NULL,
	[TypeID] [uniqueidentifier] NOT NULL,
	[InsertDate] [datetime] NULL,
	[InsertUserID] [uniqueidentifier] NULL,
	[ModifyDate] [datetime] NULL,
	[ModifyUserID] [uniqueidentifier] NULL,
	[IpAddress] [varchar](200) NULL,
 CONSTRAINT [PK_Requirement] PRIMARY KEY CLUSTERED 
(
	[RequirementID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Requirement] ([RequirementID], [Name], [TypeID], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress]) VALUES (N'37dede46-b07a-4564-8923-43cc39e50e43', N'test', N'83c60e73-64df-4dc0-b27e-81bba3ee50d3', CAST(0x0000A17D00000000 AS DateTime), N'22e466ed-5b35-4734-89e9-cc2b9ec3e55a', NULL, NULL, N'172.26.52.168')
INSERT [dbo].[Requirement] ([RequirementID], [Name], [TypeID], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress]) VALUES (N'3fe79ed2-f103-4086-8937-72b5551eadd7', N'Propiedades y Responsabilidad I', N'6b02ff49-21be-4f4e-9a60-573740ca63cf', NULL, NULL, CAST(0x0000A18200000000 AS DateTime), N'04622c29-cc0f-4876-9f0c-70266450200f', N'172.26.91.77')
INSERT [dbo].[Requirement] ([RequirementID], [Name], [TypeID], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress]) VALUES (N'40fa3530-01b7-4e9d-b0f0-877c41cb9845', N'Asesoramiento al Cliente', N'6b02ff49-21be-4f4e-9a60-573740ca63cf', CAST(0x0000A18200000000 AS DateTime), N'04622c29-cc0f-4876-9f0c-70266450200f', NULL, NULL, N'172.26.91.77')
INSERT [dbo].[Requirement] ([RequirementID], [Name], [TypeID], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress]) VALUES (N'34b5893c-d27c-4391-b7ea-8e2433756af6', N'Certificación', N'6b02ff49-21be-4f4e-9a60-573740ca63cf', CAST(0x0000A18800000000 AS DateTime), N'c8f318ea-34f0-4260-ba62-8f2e92949939', NULL, NULL, N'172.26.80.212')
/****** Object:  Table [dbo].[Plan]    Script Date: 04/01/2013 10:27:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Plan]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Plan](
	[PlanID] [uniqueidentifier] NOT NULL,
	[Name] [varchar](120) NOT NULL,
	[Description] [varchar](300) NULL,
	[InsertDate] [datetime] NULL,
	[InsertUserID] [uniqueidentifier] NULL,
	[ModifyDate] [datetime] NULL,
	[ModifyUserID] [uniqueidentifier] NULL,
	[IpAddress] [varchar](200) NULL,
	[Version] [varchar](100) NULL,
 CONSTRAINT [PK_Plan] PRIMARY KEY CLUSTERED 
(
	[PlanID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Plan] ([PlanID], [Name], [Description], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress], [Version]) VALUES (N'1693316d-2be7-4e10-8cb8-8dcdb2025876', N'Plan 410 Valoración', N'Plan de prueba kortega', CAST(0x0000A18800000000 AS DateTime), N'c8f318ea-34f0-4260-ba62-8f2e92949939', NULL, NULL, N'172.26.80.212', N'2013-1')
INSERT [dbo].[Plan] ([PlanID], [Name], [Description], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress], [Version]) VALUES (N'54445e55-c2f2-49e2-973c-9b68de2e7d8a', N'test', N'test', CAST(0x0000A17700000000 AS DateTime), N'22e466ed-5b35-4734-89e9-cc2b9ec3e55a', NULL, NULL, N'172.26.52.168', N'2013-1')
INSERT [dbo].[Plan] ([PlanID], [Name], [Description], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress], [Version]) VALUES (N'd53bcd0b-cd9e-4a1a-97eb-ca6c90f3fb7e', N'01', N'Técnico Asesor de Seguros del INS', CAST(0x0000A18000000000 AS DateTime), N'22e466ed-5b35-4734-89e9-cc2b9ec3e55a', NULL, NULL, N'172.26.52.168', N'2013-2')
/****** Object:  Table [dbo].[Modality]    Script Date: 04/01/2013 10:27:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Modality]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Modality](
	[ModalityID] [uniqueidentifier] NOT NULL,
	[Name] [varchar](120) NOT NULL,
	[Period] [varchar](300) NULL,
	[InsertDate] [datetime] NULL,
	[InsertUserID] [uniqueidentifier] NULL,
	[ModifyDate] [datetime] NULL,
	[ModifyUserID] [uniqueidentifier] NULL,
	[IpAddress] [varchar](200) NULL,
 CONSTRAINT [PK_Modality] PRIMARY KEY CLUSTERED 
(
	[ModalityID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Modality] ([ModalityID], [Name], [Period], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress]) VALUES (N'12eafede-371a-4ddd-8799-08f78c026401', N'VI', N'Semestral', CAST(0x0000A18500000000 AS DateTime), N'22e466ed-5b35-4734-89e9-cc2b9ec3e55a', NULL, NULL, N'172.17.7.10')
INSERT [dbo].[Modality] ([ModalityID], [Name], [Period], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress]) VALUES (N'aac24fca-150e-478d-987a-57520c2f81c3', N'III', N'Trimestral', NULL, NULL, CAST(0x0000A16400000000 AS DateTime), N'22e466ed-5b35-4734-89e9-cc2b9ec3e55a', N'172.26.52.168')
INSERT [dbo].[Modality] ([ModalityID], [Name], [Period], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress]) VALUES (N'6deb6676-6399-4c7b-a5c1-bb082c4ac391', N'II', N'Bimestral', NULL, NULL, CAST(0x0000A16400000000 AS DateTime), N'22e466ed-5b35-4734-89e9-cc2b9ec3e55a', N'172.26.52.168')
INSERT [dbo].[Modality] ([ModalityID], [Name], [Period], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress]) VALUES (N'009cfcb5-96f8-427f-b8a8-ebc6a3561438', N'IV', N'Cuatrimestre', CAST(0x0000A16200000000 AS DateTime), N'22e466ed-5b35-4734-89e9-cc2b9ec3e55a', NULL, NULL, N'172.26.52.168')
INSERT [dbo].[Modality] ([ModalityID], [Name], [Period], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress]) VALUES (N'c52d429d-f8bc-4a31-bec2-f21ce864444e', N'I', N'Mensual', CAST(0x0000A16200000000 AS DateTime), N'22e466ed-5b35-4734-89e9-cc2b9ec3e55a', NULL, NULL, N'172.26.52.168')
/****** Object:  Table [dbo].[Course]    Script Date: 04/01/2013 10:27:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Course]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Course](
	[CourseID] [uniqueidentifier] NOT NULL,
	[Code] [varchar](15) NOT NULL,
	[Name] [varchar](120) NOT NULL,
	[TeachingHours] [int] NULL,
	[Charge] [money] NULL,
	[IsActive] [bit] NULL,
	[InsertDate] [datetime] NULL,
	[InsertUserID] [uniqueidentifier] NULL,
	[ModifyDate] [datetime] NULL,
	[ModifyUserID] [uniqueidentifier] NULL,
	[IpAddress] [varchar](200) NULL,
 CONSTRAINT [PK_Course] PRIMARY KEY CLUSTERED 
(
	[CourseID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Course] ([CourseID], [Code], [Name], [TeachingHours], [Charge], [IsActive], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress]) VALUES (N'3afea159-af71-41ac-b612-0d67e741e76f', N'CS0102', N'Inglés Para Seguros', 48, 95506.0000, 1, NULL, NULL, CAST(0x0000A17B00000000 AS DateTime), N'09e4d1cd-a983-432a-80a9-2fc910e920d2', N'172.26.86.11')
INSERT [dbo].[Course] ([CourseID], [Code], [Name], [TeachingHours], [Charge], [IsActive], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress]) VALUES (N'66471d8a-d930-4dff-ad7f-1fe5ced5b5cf', N'PK0003', N'Matematica de valoración', 1, 0.0000, 1, CAST(0x0000A18800000000 AS DateTime), N'c8f318ea-34f0-4260-ba62-8f2e92949939', NULL, NULL, N'172.26.80.212')
INSERT [dbo].[Course] ([CourseID], [Code], [Name], [TeachingHours], [Charge], [IsActive], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress]) VALUES (N'60e2423a-1343-42b3-ba16-4698617bb0b8', N'SE0301', N'Embarcaciones y Transporte', 48, 95506.0000, 1, NULL, NULL, CAST(0x0000A17B00000000 AS DateTime), N'09e4d1cd-a983-432a-80a9-2fc910e920d2', N'172.26.86.11')
INSERT [dbo].[Course] ([CourseID], [Code], [Name], [TeachingHours], [Charge], [IsActive], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress]) VALUES (N'c906cbce-6f38-4b59-bd59-477ae36ebc2f', N'PK0001', N'Valoración de aplicativos 1', 1, 0.0000, 1, CAST(0x0000A18800000000 AS DateTime), N'c8f318ea-34f0-4260-ba62-8f2e92949939', NULL, NULL, N'172.26.80.212')
INSERT [dbo].[Course] ([CourseID], [Code], [Name], [TeachingHours], [Charge], [IsActive], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress]) VALUES (N'14407170-1495-4cde-95ba-5a2bbf54391a', N'AD0301', N'Asesoramiento al Cliente I', 48, 95506.0000, 1, NULL, NULL, CAST(0x0000A17B00000000 AS DateTime), N'09e4d1cd-a983-432a-80a9-2fc910e920d2', N'172.26.86.11')
INSERT [dbo].[Course] ([CourseID], [Code], [Name], [TeachingHours], [Charge], [IsActive], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress]) VALUES (N'e3dd19d5-cb96-41c1-abd3-5b9a12176066', N'SE0101', N'Introducción al Seguro', 48, 95506.0000, 1, NULL, NULL, CAST(0x0000A17B00000000 AS DateTime), N'09e4d1cd-a983-432a-80a9-2fc910e920d2', N'172.26.86.11')
INSERT [dbo].[Course] ([CourseID], [Code], [Name], [TeachingHours], [Charge], [IsActive], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress]) VALUES (N'60bc2970-b709-4de3-bfbe-7701dafc0b86', N'SE0302', N'Accidentes y Salud II', 48, 95506.0000, 1, NULL, NULL, CAST(0x0000A17B00000000 AS DateTime), N'09e4d1cd-a983-432a-80a9-2fc910e920d2', N'172.26.86.11')
INSERT [dbo].[Course] ([CourseID], [Code], [Name], [TeachingHours], [Charge], [IsActive], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress]) VALUES (N'20be1a4a-ed96-4d0b-a692-7f15dee8979b', N'SE0201', N'Seguros de Vida', 48, 95506.0000, 1, NULL, NULL, CAST(0x0000A17B00000000 AS DateTime), N'09e4d1cd-a983-432a-80a9-2fc910e920d2', N'172.26.86.11')
INSERT [dbo].[Course] ([CourseID], [Code], [Name], [TeachingHours], [Charge], [IsActive], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress]) VALUES (N'7b034ff3-a24a-4ca7-99c6-8157b12743f4', N'SE0401', N'Propiedades y Responsabilidad I', 48, 95506.0000, 1, NULL, NULL, CAST(0x0000A17B00000000 AS DateTime), N'09e4d1cd-a983-432a-80a9-2fc910e920d2', N'172.26.86.11')
INSERT [dbo].[Course] ([CourseID], [Code], [Name], [TeachingHours], [Charge], [IsActive], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress]) VALUES (N'837b2666-9de9-4df2-8cbb-8ddb6c431b2e', N'AD0401', N'Asesoramiento al Cliente II', 48, 95506.0000, 1, NULL, NULL, CAST(0x0000A17B00000000 AS DateTime), N'09e4d1cd-a983-432a-80a9-2fc910e920d2', N'172.26.86.11')
INSERT [dbo].[Course] ([CourseID], [Code], [Name], [TeachingHours], [Charge], [IsActive], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress]) VALUES (N'9e10143f-3e83-4288-86f5-9daa3361d0ac', N'SE0202', N'Accidentes y Salud', 48, 95506.0000, 1, NULL, NULL, CAST(0x0000A17B00000000 AS DateTime), N'09e4d1cd-a983-432a-80a9-2fc910e920d2', N'172.26.86.11')
INSERT [dbo].[Course] ([CourseID], [Code], [Name], [TeachingHours], [Charge], [IsActive], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress]) VALUES (N'd05ca21e-f5d5-4d63-b310-a5b819147ae3', N'SE0502', N'Seguro Voluntario de Automóviles', 48, 95506.0000, 1, NULL, NULL, CAST(0x0000A17B00000000 AS DateTime), N'09e4d1cd-a983-432a-80a9-2fc910e920d2', N'172.26.86.11')
INSERT [dbo].[Course] ([CourseID], [Code], [Name], [TeachingHours], [Charge], [IsActive], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress]) VALUES (N'242a7659-ffff-4c8a-8d4f-afa427a60b08', N'CS0101', N'Aplicación Computacional', 48, 95506.0000, 1, NULL, NULL, CAST(0x0000A17B00000000 AS DateTime), N'09e4d1cd-a983-432a-80a9-2fc910e920d2', N'172.26.86.11')
INSERT [dbo].[Course] ([CourseID], [Code], [Name], [TeachingHours], [Charge], [IsActive], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress]) VALUES (N'f8064532-8dbe-46c2-ba16-ba5c7b407cb5', N'AD0501', N'Organización de la Empresa', 48, 95506.0000, 1, NULL, NULL, CAST(0x0000A17B00000000 AS DateTime), N'09e4d1cd-a983-432a-80a9-2fc910e920d2', N'172.26.86.11')
INSERT [dbo].[Course] ([CourseID], [Code], [Name], [TeachingHours], [Charge], [IsActive], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress]) VALUES (N'9c022ba3-64e9-4921-936d-bbb8b7057128', N'SE0501', N'Administración de Riegos', 48, 95506.0000, 1, NULL, NULL, CAST(0x0000A17B00000000 AS DateTime), N'09e4d1cd-a983-432a-80a9-2fc910e920d2', N'172.26.86.11')
INSERT [dbo].[Course] ([CourseID], [Code], [Name], [TeachingHours], [Charge], [IsActive], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress]) VALUES (N'5e4ff0d3-9043-400e-919d-cccf818922c4', N'PK0002', N'Valoración de aplicativos 2', 1, 0.0000, 1, CAST(0x0000A18800000000 AS DateTime), N'c8f318ea-34f0-4260-ba62-8f2e92949939', NULL, NULL, N'172.26.80.212')
INSERT [dbo].[Course] ([CourseID], [Code], [Name], [TeachingHours], [Charge], [IsActive], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress]) VALUES (N'4d4d7b9a-d279-41fc-a699-dc693ad1490d', N'DE0101', N'Derecho en Seguros', 48, 95506.0000, 1, NULL, NULL, CAST(0x0000A17B00000000 AS DateTime), N'09e4d1cd-a983-432a-80a9-2fc910e920d2', N'172.26.86.11')
INSERT [dbo].[Course] ([CourseID], [Code], [Name], [TeachingHours], [Charge], [IsActive], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress]) VALUES (N'8aea151e-8e9c-4870-82a2-e8f711c53f93', N'SE0402', N'Propiedades y Responsabilidad II', 48, 95506.0000, 1, NULL, NULL, CAST(0x0000A17B00000000 AS DateTime), N'09e4d1cd-a983-432a-80a9-2fc910e920d2', N'172.26.86.11')
/****** Object:  Table [dbo].[Country]    Script Date: 04/01/2013 10:27:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Country]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Country](
	[CountryID] [uniqueidentifier] NOT NULL,
	[CountryName] [varchar](200) NOT NULL,
	[InsertDate] [datetime] NULL,
	[InsertUserID] [uniqueidentifier] NULL,
	[ModifyDate] [datetime] NULL,
	[ModifyUserID] [uniqueidentifier] NULL,
	[IpAddress] [varchar](10) NULL,
 CONSTRAINT [PK_Country] PRIMARY KEY CLUSTERED 
(
	[CountryID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Country] ([CountryID], [CountryName], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress]) VALUES (N'f99afe4a-f84b-49f2-b88a-a64a71c85ed8', N'Costa Rica', NULL, NULL, NULL, NULL, NULL)
/****** Object:  Table [dbo].[Classroom]    Script Date: 04/01/2013 10:27:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Classroom]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Classroom](
	[ClassroomID] [uniqueidentifier] NOT NULL,
	[Code] [varchar](50) NULL,
	[InsertDate] [datetime] NULL,
	[InsertUserID] [uniqueidentifier] NULL,
	[ModifyDate] [datetime] NULL,
	[ModifyUserID] [uniqueidentifier] NULL,
	[IpAddress] [varchar](200) NULL,
 CONSTRAINT [PK_Classroom] PRIMARY KEY CLUSTERED 
(
	[ClassroomID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Classroom] ([ClassroomID], [Code], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress]) VALUES (N'e08f781c-d21c-417b-b9c3-084c154f6679', N'LB-02 Zapote', CAST(0x0000A16200000000 AS DateTime), N'22e466ed-5b35-4734-89e9-cc2b9ec3e55a', NULL, NULL, N'172.26.52.168')
INSERT [dbo].[Classroom] ([ClassroomID], [Code], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress]) VALUES (N'93009cb2-e525-45f4-8012-16427d3501aa', N'LAB-Ciencias del Lenguaje', CAST(0x0000A16200000000 AS DateTime), N'22e466ed-5b35-4734-89e9-cc2b9ec3e55a', NULL, NULL, N'172.26.52.168')
INSERT [dbo].[Classroom] ([ClassroomID], [Code], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress]) VALUES (N'31758e2e-0450-435e-8acd-78b9533e5e68', N'LB-01 Zapote', NULL, NULL, CAST(0x0000A16200000000 AS DateTime), N'22e466ed-5b35-4734-89e9-cc2b9ec3e55a', N'172.26.52.168')
INSERT [dbo].[Classroom] ([ClassroomID], [Code], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress]) VALUES (N'f1540aa0-395d-4cb2-8f1a-c21c3a892a6e', N'LB-02 Zapote', CAST(0x0000A16200000000 AS DateTime), N'22e466ed-5b35-4734-89e9-cc2b9ec3e55a', NULL, NULL, N'172.26.52.168')
/****** Object:  Table [dbo].[Applications]    Script Date: 04/01/2013 10:27:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Applications]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Applications](
	[ApplicationName] [nvarchar](235) NOT NULL,
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[Description] [nvarchar](256) NULL,
PRIMARY KEY CLUSTERED 
(
	[ApplicationId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
INSERT [dbo].[Applications] ([ApplicationName], [ApplicationId], [Description]) VALUES (N'MatriFun', N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'Sistema de Matrícula de FundaTEC')
/****** Object:  Table [dbo].[School]    Script Date: 04/01/2013 10:27:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[School]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[School](
	[SchoolID] [uniqueidentifier] NOT NULL,
	[Name] [varchar](120) NOT NULL,
	[Description] [varchar](300) NULL,
	[InsertDate] [datetime] NULL,
	[InsertUserID] [uniqueidentifier] NULL,
	[ModifyDate] [datetime] NULL,
	[ModifyUserID] [uniqueidentifier] NULL,
	[IpAddress] [varchar](200) NULL,
	[Code] [varchar](120) NULL,
 CONSTRAINT [PK_School] PRIMARY KEY CLUSTERED 
(
	[SchoolID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[School] ([SchoolID], [Name], [Description], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress], [Code]) VALUES (N'43bf887e-19cf-45e4-8a1b-04c8aec7422b', N'Administración', N'Administracíón de Negocios - ITCR.', NULL, NULL, CAST(0x0000A16400000000 AS DateTime), N'22e466ed-5b35-4734-89e9-cc2b9ec3e55a', N'172.26.52.168', N'01')
INSERT [dbo].[School] ([SchoolID], [Name], [Description], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress], [Code]) VALUES (N'da8f6158-d549-4e99-9a36-0e30fc09bcff', N'Educación Técnica', N'Departamento de educación técnica - ITCR.', CAST(0x0000A18500000000 AS DateTime), N'22e466ed-5b35-4734-89e9-cc2b9ec3e55a', NULL, NULL, N'172.17.7.10', N'38')
INSERT [dbo].[School] ([SchoolID], [Name], [Description], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress], [Code]) VALUES (N'fb897b3b-772c-498e-adae-14cb3729a78e', N'Departamento de Salud', N'Departamento de salud - ITCR', CAST(0x0000A18500000000 AS DateTime), N'22e466ed-5b35-4734-89e9-cc2b9ec3e55a', NULL, NULL, N'172.17.7.10', N'31')
INSERT [dbo].[School] ([SchoolID], [Name], [Description], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress], [Code]) VALUES (N'91fc6f60-1b14-432f-8ffd-155555994a4b', N'Oficina de Prensa', N'Oficina de prensa', CAST(0x0000A18500000000 AS DateTime), N'22e466ed-5b35-4734-89e9-cc2b9ec3e55a', NULL, NULL, N'172.17.7.10', N'30')
INSERT [dbo].[School] ([SchoolID], [Name], [Description], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress], [Code]) VALUES (N'83246fd8-d29a-46a3-b70d-1a26b872b3f4', N'Educación Técnica', N'Escuela de Educación Técnica - ITCR', NULL, NULL, CAST(0x0000A16400000000 AS DateTime), N'22e466ed-5b35-4734-89e9-cc2b9ec3e55a', N'172.26.52.168', N'02')
INSERT [dbo].[School] ([SchoolID], [Name], [Description], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress], [Code]) VALUES (N'f61ff42e-a8ff-427d-8784-1b18c73144b1', N'Fisica', N'Escuela de Fisica - ITCR', CAST(0x0000A18500000000 AS DateTime), N'22e466ed-5b35-4734-89e9-cc2b9ec3e55a', NULL, NULL, N'172.17.7.10', N'03')
INSERT [dbo].[School] ([SchoolID], [Name], [Description], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress], [Code]) VALUES (N'c74d5508-48c9-44da-85b1-2092522a87f9', N'Agropecuaria', N'Escuela de ingeniería agropecuaria - ITCR.', CAST(0x0000A18500000000 AS DateTime), N'22e466ed-5b35-4734-89e9-cc2b9ec3e55a', NULL, NULL, N'172.17.7.10', N'18')
INSERT [dbo].[School] ([SchoolID], [Name], [Description], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress], [Code]) VALUES (N'9cee9763-7245-4453-af4a-2636824ac490', N'Centro Investigación Computación', N'Centro de investigación en computación, CIC - ITCR.', CAST(0x0000A18500000000 AS DateTime), N'22e466ed-5b35-4734-89e9-cc2b9ec3e55a', NULL, NULL, N'172.17.7.10', N'16')
INSERT [dbo].[School] ([SchoolID], [Name], [Description], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress], [Code]) VALUES (N'5943c40c-9dfd-48f5-b867-2baaaf43d7fd', N'Agrícola', N'Escuela de ingeniería agrícola - ITCR.', CAST(0x0000A18500000000 AS DateTime), N'22e466ed-5b35-4734-89e9-cc2b9ec3e55a', NULL, NULL, N'172.17.7.10', N'19')
INSERT [dbo].[School] ([SchoolID], [Name], [Description], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress], [Code]) VALUES (N'ba68a03b-6b10-4c9a-8de8-2bbc0c73244f', N'Ciencias de los materiales', N'Escuela de ciencias de los materiales. - ITCR', CAST(0x0000A18500000000 AS DateTime), N'22e466ed-5b35-4734-89e9-cc2b9ec3e55a', NULL, NULL, N'172.17.7.10', N'11')
INSERT [dbo].[School] ([SchoolID], [Name], [Description], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress], [Code]) VALUES (N'032a35f6-7b49-4183-b883-2c555779636a', N'Sede Regional San Carlos', N'Sede Reegional San Carlos', CAST(0x0000A18500000000 AS DateTime), N'22e466ed-5b35-4734-89e9-cc2b9ec3e55a', NULL, NULL, N'172.17.7.10', N'44')
INSERT [dbo].[School] ([SchoolID], [Name], [Description], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress], [Code]) VALUES (N'16bac713-e1a9-489a-81c2-2edc3d5ad394', N'Ciencias San Carlos', N'Departamento de ciencias San Carlos - ITCR.', CAST(0x0000A18500000000 AS DateTime), N'22e466ed-5b35-4734-89e9-cc2b9ec3e55a', NULL, NULL, N'172.17.7.10', N'42')
INSERT [dbo].[School] ([SchoolID], [Name], [Description], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress], [Code]) VALUES (N'41a37d32-5951-4321-9981-304f35418a0c', N'Biología', N'Escuela de biología', CAST(0x0000A18500000000 AS DateTime), N'22e466ed-5b35-4734-89e9-cc2b9ec3e55a', NULL, NULL, N'172.17.7.10', N'21')
INSERT [dbo].[School] ([SchoolID], [Name], [Description], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress], [Code]) VALUES (N'e7d7a4f6-7916-4c7e-b77c-3759f212450a', N'Centro de computo', N'Centro de computo - ITCR', CAST(0x0000A18500000000 AS DateTime), N'22e466ed-5b35-4734-89e9-cc2b9ec3e55a', NULL, NULL, N'172.17.7.10', N'06')
INSERT [dbo].[School] ([SchoolID], [Name], [Description], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress], [Code]) VALUES (N'84e33970-12c3-4e2a-8731-37ce9d236c13', N'Vicerrectoría de docencia.', N'Vicerrectoría de docencia - ITCR.', CAST(0x0000A18500000000 AS DateTime), N'22e466ed-5b35-4734-89e9-cc2b9ec3e55a', NULL, NULL, N'172.17.7.10', N'39')
INSERT [dbo].[School] ([SchoolID], [Name], [Description], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress], [Code]) VALUES (N'e04ea475-694f-4f09-8e02-3b9e404d8114', N'Orientación y Psicología', N'Departamento de orientación y psicología - ITCR', CAST(0x0000A18500000000 AS DateTime), N'22e466ed-5b35-4734-89e9-cc2b9ec3e55a', NULL, NULL, N'172.17.7.10', N'28')
INSERT [dbo].[School] ([SchoolID], [Name], [Description], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress], [Code]) VALUES (N'5f839a8e-79a2-4683-b713-439699fc8d30', N'Vida Estudiantil San Carlos', N'Departamento de vida estudiantil San Carlos - ITCR.', CAST(0x0000A18500000000 AS DateTime), N'22e466ed-5b35-4734-89e9-cc2b9ec3e55a', NULL, NULL, N'172.17.7.10', N'46')
INSERT [dbo].[School] ([SchoolID], [Name], [Description], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress], [Code]) VALUES (N'17c768f6-2e7f-4c36-a98c-48e3d1351e7b', N'Seguridad Laboral e Higiene', N'Escuela de ingeniería en seguridad laboral e higiene - ITCR.', CAST(0x0000A18500000000 AS DateTime), N'22e466ed-5b35-4734-89e9-cc2b9ec3e55a', NULL, NULL, N'172.17.7.10', N'22')
INSERT [dbo].[School] ([SchoolID], [Name], [Description], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress], [Code]) VALUES (N'b6c35add-091b-44a9-8c6a-4c4e8f5f8962', N'Ciencias del lenguaje', N'Escuela de ciencias del lenguaje - ITCR.', CAST(0x0000A18500000000 AS DateTime), N'22e466ed-5b35-4734-89e9-cc2b9ec3e55a', NULL, NULL, N'172.17.7.10', N'15')
INSERT [dbo].[School] ([SchoolID], [Name], [Description], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress], [Code]) VALUES (N'9c670341-b366-4d8c-9a9f-4ccb8b4a9cb6', N'Matemática', N'Escuela de matemática  - ITCR', CAST(0x0000A18500000000 AS DateTime), N'22e466ed-5b35-4734-89e9-cc2b9ec3e55a', NULL, NULL, N'172.17.7.10', N'09')
INSERT [dbo].[School] ([SchoolID], [Name], [Description], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress], [Code]) VALUES (N'c22b9dc1-a5a9-449c-ba55-56497da08070', N'Ciencias Sociales', N'Escuela de ciencias sociales - ITCR', CAST(0x0000A18500000000 AS DateTime), N'22e466ed-5b35-4734-89e9-cc2b9ec3e55a', NULL, NULL, N'172.17.7.10', N'37')
INSERT [dbo].[School] ([SchoolID], [Name], [Description], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress], [Code]) VALUES (N'29c47786-9aa7-462b-8096-62b71df84a51', N'Química', N'Escuela de química. - ITCR', CAST(0x0000A18500000000 AS DateTime), N'22e466ed-5b35-4734-89e9-cc2b9ec3e55a', NULL, NULL, N'172.17.7.10', N'13')
INSERT [dbo].[School] ([SchoolID], [Name], [Description], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress], [Code]) VALUES (N'f0f656ef-4235-4b15-ab7d-6347549a84ad', N'Agronomía San Carlos', N'Departamento de agronomía San Carlos - ITCR.', CAST(0x0000A18500000000 AS DateTime), N'22e466ed-5b35-4734-89e9-cc2b9ec3e55a', NULL, NULL, N'172.17.7.10', N'43')
INSERT [dbo].[School] ([SchoolID], [Name], [Description], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress], [Code]) VALUES (N'952d6d3d-33b0-49bb-862f-706718828646', N'CETMA', N'CETMA', CAST(0x0000A18500000000 AS DateTime), N'22e466ed-5b35-4734-89e9-cc2b9ec3e55a', NULL, NULL, N'172.17.7.10', N'32')
INSERT [dbo].[School] ([SchoolID], [Name], [Description], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress], [Code]) VALUES (N'84abf651-1c3b-4c29-8420-716f1b16a561', N'Computación San Carlos', N'Departamento de computación San Carlos - ITCR.', CAST(0x0000A18500000000 AS DateTime), N'22e466ed-5b35-4734-89e9-cc2b9ec3e55a', NULL, NULL, N'172.17.7.10', N'41')
INSERT [dbo].[School] ([SchoolID], [Name], [Description], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress], [Code]) VALUES (N'a2aa3809-2602-4f10-8a3b-74f435b77371', N'F.D.I', N'F.D.I', CAST(0x0000A18500000000 AS DateTime), N'22e466ed-5b35-4734-89e9-cc2b9ec3e55a', NULL, NULL, N'172.17.7.10', N'36')
INSERT [dbo].[School] ([SchoolID], [Name], [Description], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress], [Code]) VALUES (N'f6ca1f8e-7179-4c4f-8c6e-8f41cc5d5528', N'Forestal', N'Escuela de ingeniería forestal. - ITCR', CAST(0x0000A18500000000 AS DateTime), N'22e466ed-5b35-4734-89e9-cc2b9ec3e55a', NULL, NULL, N'172.17.7.10', N'12')
INSERT [dbo].[School] ([SchoolID], [Name], [Description], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress], [Code]) VALUES (N'730a1533-5e69-4534-8d05-9818b6b56bee', N'Editorial tecnológica', N'Editorial tecnológica.', CAST(0x0000A18500000000 AS DateTime), N'22e466ed-5b35-4734-89e9-cc2b9ec3e55a', NULL, NULL, N'172.17.7.10', N'27')
INSERT [dbo].[School] ([SchoolID], [Name], [Description], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress], [Code]) VALUES (N'2e38e1eb-8213-49fd-b127-9984b849fe52', N'CEQIATEC', N'CEQIATEC', CAST(0x0000A18500000000 AS DateTime), N'22e466ed-5b35-4734-89e9-cc2b9ec3e55a', NULL, NULL, N'172.17.7.10', N'40')
INSERT [dbo].[School] ([SchoolID], [Name], [Description], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress], [Code]) VALUES (N'4d4e3f95-f6e4-4838-b606-9fc1b34d94af', N'VIESA', N'VIESA', CAST(0x0000A18500000000 AS DateTime), N'22e466ed-5b35-4734-89e9-cc2b9ec3e55a', NULL, NULL, N'172.17.7.10', N'34')
INSERT [dbo].[School] ([SchoolID], [Name], [Description], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress], [Code]) VALUES (N'7e13fe84-3384-47f9-ad92-a0d5f3724e44', N'Centro Vinculación Universidad-Empresa', N'Centro de vinculación universidad-Empresa.', CAST(0x0000A18500000000 AS DateTime), N'22e466ed-5b35-4734-89e9-cc2b9ec3e55a', NULL, NULL, N'172.17.7.10', N'17')
INSERT [dbo].[School] ([SchoolID], [Name], [Description], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress], [Code]) VALUES (N'fba21227-a845-4f18-9347-a0f3d6e6b955', N'Electronica', N'Escuela de ingeniería en electrónica - ITCR', CAST(0x0000A18500000000 AS DateTime), N'22e466ed-5b35-4734-89e9-cc2b9ec3e55a', NULL, NULL, N'172.17.7.10', N'10')
INSERT [dbo].[School] ([SchoolID], [Name], [Description], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress], [Code]) VALUES (N'36521e04-17da-458e-8007-a76a40950695', N'CEDA', N'CEDA', CAST(0x0000A18500000000 AS DateTime), N'22e466ed-5b35-4734-89e9-cc2b9ec3e55a', NULL, NULL, N'172.17.7.10', N'26')
INSERT [dbo].[School] ([SchoolID], [Name], [Description], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress], [Code]) VALUES (N'8a1e4276-559d-4d29-ad77-a788ca9362a3', N'Producción Industrial', N'Escuela de producción industrial - ITCR', CAST(0x0000A18500000000 AS DateTime), N'22e466ed-5b35-4734-89e9-cc2b9ec3e55a', NULL, NULL, N'172.17.7.10', N'05')
INSERT [dbo].[School] ([SchoolID], [Name], [Description], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress], [Code]) VALUES (N'37456f32-02ba-4425-89a6-a83a248206b2', N'Administración San Carlos', N'Escuela de administración San Carlos - ITCR.', CAST(0x0000A18500000000 AS DateTime), N'22e466ed-5b35-4734-89e9-cc2b9ec3e55a', NULL, NULL, N'172.17.7.10', N'45')
INSERT [dbo].[School] ([SchoolID], [Name], [Description], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress], [Code]) VALUES (N'75089a8e-57c7-464e-8ced-af15f940d2dd', N'Equidad de genero', N'Oficina de equidad de genero.', CAST(0x0000A18500000000 AS DateTime), N'22e466ed-5b35-4734-89e9-cc2b9ec3e55a', NULL, NULL, N'172.17.7.10', N'24')
INSERT [dbo].[School] ([SchoolID], [Name], [Description], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress], [Code]) VALUES (N'9f5e234b-e9fc-4db7-b7dd-b81cd631d4f1', N'CIPA', N'CIPA', CAST(0x0000A18500000000 AS DateTime), N'22e466ed-5b35-4734-89e9-cc2b9ec3e55a', NULL, NULL, N'172.17.7.10', N'23')
INSERT [dbo].[School] ([SchoolID], [Name], [Description], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress], [Code]) VALUES (N'6434511c-5954-4d30-815e-c15ffa365ddb', N'Recursos Humanos ITCR', N'Departamento de recursos humanos - ITCR', CAST(0x0000A18500000000 AS DateTime), N'22e466ed-5b35-4734-89e9-cc2b9ec3e55a', NULL, NULL, N'172.17.7.10', N'35')
INSERT [dbo].[School] ([SchoolID], [Name], [Description], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress], [Code]) VALUES (N'0b923913-ac3f-4fba-bbdf-d3c51fdd9199', N'Centro Investigación Biotecnología', N'Centro Investigación en Biotecnología - ITCR', CAST(0x0000A18500000000 AS DateTime), N'22e466ed-5b35-4734-89e9-cc2b9ec3e55a', NULL, NULL, N'172.17.7.10', N'04')
INSERT [dbo].[School] ([SchoolID], [Name], [Description], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress], [Code]) VALUES (N'bfef25f2-e1c9-477c-bff0-dcd8bf2ccf3b', N'V.I.E', N'V.I.E', CAST(0x0000A18500000000 AS DateTime), N'22e466ed-5b35-4734-89e9-cc2b9ec3e55a', NULL, NULL, N'172.17.7.10', N'29')
INSERT [dbo].[School] ([SchoolID], [Name], [Description], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress], [Code]) VALUES (N'e9d2c830-7d5e-4bed-957d-e7779b57e9f9', N'Unidad de cultura', N'Unidad de cultura - ITCR.', CAST(0x0000A18500000000 AS DateTime), N'22e466ed-5b35-4734-89e9-cc2b9ec3e55a', NULL, NULL, N'172.17.7.10', N'25')
INSERT [dbo].[School] ([SchoolID], [Name], [Description], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress], [Code]) VALUES (N'f51e6991-d9d7-4674-92fb-eb2fff3b8897', N'Diseño Industrial', N'Escuela de diseño industrial. - ITCR', CAST(0x0000A18500000000 AS DateTime), N'22e466ed-5b35-4734-89e9-cc2b9ec3e55a', NULL, NULL, N'172.17.7.10', N'14')
INSERT [dbo].[School] ([SchoolID], [Name], [Description], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress], [Code]) VALUES (N'860eb0ab-97b2-435b-8dec-ede719912064', N'Electromecanica', N'Escuela de ingeniería en electromecánica. - ITCR', NULL, NULL, CAST(0x0000A18500000000 AS DateTime), N'22e466ed-5b35-4734-89e9-cc2b9ec3e55a', N'172.17.7.10', N'07')
INSERT [dbo].[School] ([SchoolID], [Name], [Description], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress], [Code]) VALUES (N'29b38a97-d477-42b8-90d1-ef75c07a82ca', N'Construcción', N'Escuela de ingeniería en construcción - ITCR', NULL, NULL, CAST(0x0000A18500000000 AS DateTime), N'22e466ed-5b35-4734-89e9-cc2b9ec3e55a', N'172.17.7.10', N'08')
INSERT [dbo].[School] ([SchoolID], [Name], [Description], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress], [Code]) VALUES (N'1580be3d-2d8b-418f-86d8-f9b387878660', N'Ambiental', N'Escuela de ingeniería ambiental.', CAST(0x0000A18500000000 AS DateTime), N'22e466ed-5b35-4734-89e9-cc2b9ec3e55a', NULL, NULL, N'172.17.7.10', N'47')
INSERT [dbo].[School] ([SchoolID], [Name], [Description], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress], [Code]) VALUES (N'a35f4c02-ba83-46f7-91ef-f9bf8e45aad1', N'Biblioteca', N'Departamento de biblioteca - ITCR.', CAST(0x0000A18500000000 AS DateTime), N'22e466ed-5b35-4734-89e9-cc2b9ec3e55a', NULL, NULL, N'172.17.7.10', N'20')
INSERT [dbo].[School] ([SchoolID], [Name], [Description], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress], [Code]) VALUES (N'd4d7176c-e8f4-43de-8309-fc65e9ef173e', N'Arquitectura', N'Escuela de ingeniería en arquitectura - ITCR.', CAST(0x0000A18500000000 AS DateTime), N'22e466ed-5b35-4734-89e9-cc2b9ec3e55a', NULL, NULL, N'172.17.7.10', N'33')
/****** Object:  Table [dbo].[Resource]    Script Date: 04/01/2013 10:27:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Resource]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Resource](
	[ResourceID] [uniqueidentifier] NOT NULL,
	[ResourceKey] [varchar](100) NOT NULL,
	[Culture] [varchar](6) NOT NULL,
	[ResourceValue] [varchar](max) NOT NULL,
 CONSTRAINT [PK_Resource] PRIMARY KEY CLUSTERED 
(
	[ResourceID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Resource]') AND name = N'IX_ResourcesKey_Culture')
CREATE UNIQUE NONCLUSTERED INDEX [IX_ResourcesKey_Culture] ON [dbo].[Resource] 
(
	[ResourceKey] ASC,
	[Culture] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'a4e8ce6b-bf3b-4c33-a5b6-005b9b323ab1', N'ADD_LOCATION', N'es-CR', N'Agregar Lugar Físico')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'91da58c1-0db8-48dc-aa18-006ad2b843af', N'LINK_PLAN_COURSE', N'es-CR', N'Vincular cursos a Planes')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'60533756-c93f-4f94-af4c-00d3655d5ac3', N'ENROLLMENT_ADD_TITLE', N'es-CR', N'Agregar Matrícula')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'd7a8fe41-3018-4b1b-bb70-01e0eb53683d', N'ENROLLMENT_GENERAL_INFO', N'es-CR', N'Información General')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'60642bfe-3d7b-4c48-b312-020ee6c30d98', N'STUDENT', N'es-CR', N'Estudiante')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'75a72827-bd80-4b4a-a493-04ca4a32a765', N'LOCATION', N'es-CR', N'Lugares Físicos')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'18f85b0b-cbdc-42cc-940b-051be806d5b3', N'NOTES_IMPORT_DETAIL', N'es-CR', N'Esta opción permite importar notas de estudiantes por curso desde un archivo en formato CSV')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'cf23b194-7bf3-4e9c-b566-052d825af091', N'STUDENT_MAINTENANCE', N'es-CR', N'Mantenimiento Estudiantes')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'b8063937-d01f-4186-8fb0-0535b703efdd', N'ROLE_TEACHER', N'es-CR', N'Profesor')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'12976d18-210e-4866-8527-078a4b00a665', N'PAGE', N'es-CR', N'Página')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'3e46b5b0-42ce-4895-b0d2-085dccc59531', N'MODALITY_NAME', N'es-CR', N'Modalidad')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'a6895360-bdd3-4fc1-8a95-0a11021cccb5', N'PASS_CONFIRM', N'es-CR', N'Confirmar Contraseña')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'0997b751-c558-4cb6-86ab-0acfe670e8fa', N'ENROLLMENTS', N'es-CR', N'Matrículas')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'360a40e6-8769-4529-ae42-0ae5052e863b', N'SCHEME_NAME', N'es-CR', N'Nombre del Programa')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'9166e8d2-e726-4273-883a-0c6a2a89a256', N'ACADEMIC_HISTORY', N'es-CR', N'Historial Académico')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'a571f733-8fbb-4b78-b4e8-0d35830e72a6', N'CLASSROOM_MANT', N'es-CR', N'Mantenimiento Aulas')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'76d88b07-26a8-4413-a97c-0d64779f5dce', N'STARTS_WITH', N'es-CR', N'Empiezan con')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'eb7efd61-ae0f-4cd4-a78a-0e209cc1f68d', N'IS_EQUAL_TO', N'es-CR', N'Sean iguales a')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'025b614a-b1e2-4f23-a39a-10af8d1b5271', N'LOCATION_LINE2', N'es-CR', N'Otras Señas')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'bf98cc19-fae3-4230-b5b4-124a456381e3', N'DELETE_CONFIRMATION', N'es-CR', N'¿Está seguro que desea eliminar el registro?')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'40f6e149-6666-46c8-9ef6-127f745e7f7a', N'ENDS_WITH', N'es-CR', N'Terminan con')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'8ed79a58-b34c-41f7-b95f-133f6f96a0d6', N'DISPLAY_GRID', N'es-CR', N'{0} - {1} de {2} registros')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'e3d1431a-a09e-431a-bff8-18032ff49c4b', N'ADD_USERS_TITLE', N'es-CR', N'Agregar Usuarios')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'a7a869e6-6773-4ef5-9271-1917bfe61efe', N'ENROLLMENT_DATES', N'es-CR', N'Período de Matrícula')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'b544e5b8-3c58-49a5-8dd5-1a10b1619710', N'WPS_DADS', N'es-CR', N'Padres de Familia')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'4e3079ca-2cd1-42f5-a28e-1bf6e6636376', N'CANCEL', N'es-CR', N'Cancelar')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'1fcab402-2dd7-42a4-a5f6-1c4cc326ec1e', N'HOME', N'es-CR', N'Inicio')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'7197f847-baf5-448a-aab7-1d79aab043f0', N'STUDENT_HOW_YOU_KNOW_ABOUT_US', N'es-CR', N'Cómo Supo de Nosotros')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'8b75b820-6515-457b-9587-1f42ab27da0b', N'WPS_FAMILY', N'es-CR', N'Familiar')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'685ccf85-8928-461b-9480-207dc04efa26', N'STUDENT_RECEIVE_NEWS', N'es-CR', N'Desea Recibir Noticias sobre Matrícula del Programa?')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'8d219e1b-cfd9-4422-8cdf-235ea08c7151', N'VAL_COURSE', N'es-CR', N'Convalidación de Cursos')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'dcec8f91-1709-4c0a-8e9b-246d9f7a8aca', N'PHONE_OFFICE', N'es-CR', N'Tel. Oficina')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'80dfa35e-efc6-400a-bf11-24bedf218cd3', N'ENROLLMENT_ADD', N'es-CR', N'Agregar Matrícula')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'335d4646-974d-47d5-b2c2-24d948c28438', N'DOES_NOT_CONTAIN', N'es-CR', N'No Contienen')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'517177d9-160c-4384-aadb-25633af5ae9d', N'SCHOOL', N'es-CR', N'Escuelas')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'fbe46808-8be6-44e1-8e42-25bd371e6b0f', N'WPS_SCHOLARSHIP', N'es-CR', N'Beca')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'b61bba6c-a157-40ea-8ca9-2672546946dd', N'ROLE_SCHOOL_ADMIN', N'es-CR', N'Admin. Escuela')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'2ca87564-a34d-4686-a708-28ebf25db480', N'ADD_SCHOOL', N'es-CR', N'Agregar Escuela')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'11ee40d1-3a44-465e-a276-292ab0d95a1e', N'PASS_CONFIRM_ERR', N'es-CR', N'Las contraseñas no coinciden.')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'4a1889ae-2cdb-4ed9-89fb-2b25b336e9cd', N'ADD_USER', N'es-CR', N'Agregar Usuario')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'76f162d3-12d2-43b7-8618-2ca90e556111', N'PLAN', N'es-CR', N'Planes')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'18101b56-b806-432a-b8e0-2dbe4244444d', N'STUDENT_RECEIVE_OFFERS', N'es-CR', N'Desea Recibir Ofertas?')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'6d86d69d-9084-410e-b53c-2e7df7a0b3b1', N'MAX_LENGTH', N'es-CR', N'{0} puede tener un maximo de {1} caracteres.')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'85e6f52b-e647-4f0d-92e4-302e68d68dab', N'ROLE', N'es-CR', N'Role')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'eaa9c7b5-3cda-45fe-838c-3500e88361bb', N'CONTAINS', N'es-CR', N'Contienen')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'dd1eda7a-7271-4d89-a453-354fb798ebdc', N'COURSE_COST', N'es-CR', N'Costo del Curso')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'450faec7-0116-42c6-ab17-36ca4e3bd187', N'PASS_STRING_LENGTH1', N'es-CR', N'La Contraseña debe tener al menos')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'2f718783-f4cc-4c69-bd94-37fcf93549a1', N'KAU_NEWS', N'es-CR', N'Noticias')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'733d5706-daae-4daa-9f8b-38122e2a4898', N'LAST_PAGE', N'es-CR', N'Ultima Página')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'1e958f25-185e-4b9b-9748-3843af65fa9c', N'TEACHING_HOURS', N'es-CR', N'Horas Lectivas')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'e6207665-2f53-4d4d-b12c-3a5928072a34', N'RECORDS1', N'es-CR', N'Notas')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'482317aa-aa1a-44b5-8d8c-3b0d9bd0e8c0', N'VIEW_DETAILS', N'es-CR', N'Ver Detalles')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'138d9f37-b415-4422-b76e-3b24dc1942ec', N'FIRST_PAGE', N'es-CR', N'Primera Página')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'cd691db5-296f-473e-9bf1-3cc804acd726', N'WPS_FUNDED', N'es-CR', N'Financiado')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'6a8d9ff4-74ce-4567-a42d-3d2d55943015', N'EDIT', N'es-CR', N'Editar')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'bdd213ee-8947-45a0-a7d8-3d8ba32022dc', N'WPS_OWN_INCOME', N'es-CR', N'Cuenta Propia')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'27cfd1d8-1d84-45b0-a12e-43674ca1c670', N'NOTES_IMPORT', N'es-CR', N'Importar Notas')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'5f934c6b-9928-4b90-9202-46578af66809', N'USERS', N'es-CR', N'Usuarios')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'688664fc-53ae-4a8a-accd-46e950e5537d', N'NEXT_PAGE', N'es-CR', N'Siguiente Página')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'0f415824-77b2-420e-a43b-47bb06015450', N'IDENTIFICATION_TYPE', N'es-CR', N'Tipo Identificación')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'76c80064-5cf2-49fc-acd7-47fa27004eb7', N'AUDIT_DETAIL', N'es-CR', N'Esta opción permite listar o detallar lo referente al historial de este catálogo')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'f70d8d5d-fd03-4461-8a80-4b13fe6feaea', N'OF_GRID', N'es-CR', N'de {0}')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'cc05e78b-30af-4ff6-b7f7-4b18d26aac2f', N'GENDER', N'es-CR', N'Género')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'b1ff951a-196e-471c-abe6-4b819bd498e3', N'NEW_USER', N'es-CR', N'Registrar un nuevo Usuario')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'afa3f49a-967f-4da8-96fd-4d675d04e55a', N'NOTES_COURSE_REGISTER_DETAIL', N'es-CR', N'Esta opción permite agregar y modificar las notas de los estudiantes matriculados en un determinado curso')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'003c78eb-1068-4e01-9430-4fa217c80d26', N'FIND', N'es-CR', N'Buscar')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'd3bc9df6-9227-43c7-9a70-5191f580be09', N'TYPE_AUTO_FILTER', N'es-CR', N'Escriba un nombre de curso para filtrar')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'f0f5f489-2930-4a58-8e8e-5484f846d0aa', N'CERTIFICATIONS', N'es-CR', N'Certificaciones')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'50e7d315-9483-4673-9b0c-54a8afd799d6', N'COURSE_CODE', N'es-CR', N'Codigo del Curso')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'add5effa-dabd-4a72-b88a-5519967fe785', N'ADD_STUDENT_TITLE', N'es-CR', N'Agregar Estudiantes')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'27e13ce0-dedf-445a-8285-555a30ae7917', N'MARITAL_STATUS_WIDOW', N'es-CR', N'Viudo(a)')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'dcdbf9f5-9b8a-4b16-b3e5-5580b1feb0e6', N'WPS_OTHER', N'es-CR', N'Otro')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'6e82dc3a-bcdf-4d47-8aab-560198476e85', N'ENROLLMENT_STUDENT', N'es-CR', N'Matrícula de Estudiantes')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'13a910c8-77d2-41ac-882b-56b5491ddb34', N'COURSE_CONSULT', N'es-CR', N'Consulta de Cursos')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'be6dd2eb-4e4f-48b5-9083-56c4f37383fc', N'LAST_NAME', N'es-CR', N'Apellidos')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'922c9306-9176-4fcf-b041-587f9b2f49b7', N'EMAIL', N'es-CR', N'Correo Electrónico')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'8b6d646c-16e7-4232-86dc-5b27b729e297', N'KAU_TV', N'es-CR', N'Televisión')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'1d8f6027-5c03-40b0-b0f8-5d2393dabd0f', N'NO_RECORDS', N'es-CR', N'No hay Registros')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'd9895a13-8274-41a4-88db-5d71cbd13f96', N'IS_NOT_EQUAL_TO', N'es-CR', N'Sean diferentes de')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'c2487419-a20b-440f-a8dd-5d82cf15b901', N'COURSE_MANT', N'es-CR', N'Mantenimiento de Cursos')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'8f986409-531c-435a-887b-5d977f405d28', N'SCHOOL_DETAIL', N'es-CR', N'Esta opción permite listar, agregar, modificar y eliminar una escuela')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'3eba6f73-0fc0-4b23-b274-5e63c3c3400b', N'LINK_PLAN_TEMPLATE_DETAIL', N'es-CR', N'Esta opción permite vincular una platilla a un determiando plan de estudios')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'31331af1-ce9a-4dd6-abb3-602c77134c17', N'SCORE_CONSULT_DETAILS', N'es-CR', N'Esta opción permite ver las notas de cada curso reportadas por el profesor')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'4410dbad-d547-401b-9268-612a2346dc1e', N'SCHOOL_NAME', N'es-CR', N'Nombre Escuela')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'3be7951d-8596-4485-beb4-632ae386b202', N'CLASSROOM', N'es-CR', N'Aulas')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'deeb1fa3-df27-4446-9ed0-63620cfd47de', N'ENROLLMENT_GROUPS_DETAILS', N'es-CR', N'Detalle de Grupos')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'77751b1c-053f-4928-8ff1-64128184f3ff', N'PASS_STRING_LENGTH', N'es-CR', N'{0} debe tener al menos {2} caracteres.')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'9e731aba-10ef-4778-896e-644161413f40', N'EDIT_REQ', N'es-CR', N'Editar Requisito')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'0a30e3b4-aef3-419d-83b9-65c18418b867', N'NEW_PASSWORD', N'es-CR', N'Nueva Contraseña')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'da12b593-8db0-4faf-8676-661aa8966d89', N'FIND_VAL_WHAT', N'es-CR', N'Buscar valores que:')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'5ccceecc-d966-4ec0-8e10-66923dd4dc1d', N'PROGRAMS', N'es-CR', N'Programas')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'e64f32fd-811e-4d6f-989f-66b9de4d1cb5', N'RECORDS', N'es-CR', N'Registro de Actas')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'410a1364-cdf3-4f97-b429-68072ac250c7', N'MODALITY_TYPE', N'es-CR', N'Tipos de Modalidad')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'9910ed9e-ec05-4e20-a709-69cb6160b226', N'FIRST_NAME', N'es-CR', N'Nombre')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'a181808a-4281-4f50-9f8d-6b396278c1de', N'ADD_PLAN', N'es-CR', N'Agregar Plan')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'4d6b128f-7ce6-4fa6-b5c0-6b3b565de901', N'SAVE', N'es-CR', N'Salvar')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'92d45980-9a97-44bc-b056-6bcc4dccb06c', N'PROGRAMS_DETAIL', N'es-CR', N'Esta opción permite listar, agregar, modificar y eliminar un programa')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'bad8ffbd-c42b-473c-9858-6dc10c6b0781', N'MARITAL_STATUS_MARRIED', N'es-CR', N'Casado')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'a1ca6641-0146-431f-9602-6e35baf9080e', N'STUDENT_ADDITIONAL_ADDRESS', N'es-CR', N'Domicilio Durante Curso')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'3c423985-87fc-4f7f-a37b-6f3f83ff1b62', N'ENROLLMENT_LOCATION', N'es-CR', N'Lugar Fisíco')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'81ceacbf-6267-4bb8-9afd-7290bdb2bd3e', N'COURSES_DETAIL', N'es-CR', N'Esta opción permite listar, agregar, modificar y eliminar un curso')
GO
print 'Processed 100 total records'
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'78b2f44c-fabc-4199-a7a3-73a8e6d8b686', N'EDIT_USERS_TITLE', N'es-CR', N'Edición de Usuarios')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'f00bd282-6267-496e-b056-73c8126184da', N'ADD_MODALITY', N'es-CR', N'Agregar Modalidad')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'08583944-a0bc-4b5a-8e49-75ab307b722d', N'ENROLLMENT_VERIFY_DATES', N'es-CR', N'Verificar Fechas')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'52e711d4-d92d-4c37-8bb9-75eb4c141a7c', N'ADD_STUDENT', N'es-CR', N'Agregar Studiante')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'bde827d4-5e2b-42c6-8532-762a8b919bfd', N'SCHEME_MANT', N'es-CR', N'Mantenimiento de Programas')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'270a031a-59e8-4a43-b945-798c9309b891', N'SCHOOL_CODE', N'es-CR', N'Codigo Escuela')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'bef240f6-7370-4b68-ad85-7a02db001732', N'EDIT_PLAN', N'es-CR', N'Editar Plan')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'181c69c1-eeb6-4232-ba46-7a62a7eabc46', N'NOTES_COURSE_REGISTER', N'es-CR', N'Registro de Notas por Curso')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'878234e7-63ff-4cd5-b5c5-7ac190d68292', N'COUNTRY', N'es-CR', N'País')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'd0c68483-0dea-42ef-bc27-7b8104805663', N'REQ_PLAN', N'es-CR', N'Plan')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'19ff73ef-c194-4f07-a2f8-7be6650009bc', N'ENROLLMENT_PLAN', N'es-CR', N'Plan de Estudio')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'0a5e6261-218a-4684-9371-7c7349ea0cf2', N'ROLE_AUDITOR', N'es-CR', N'Auditor')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'03ae3a0e-4c28-4033-9b58-7e7296276bed', N'STUDENT_ENROLLMENT_CONSULT', N'es-CR', N'Consulta de Matrículas por Estudiante')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'5fdee555-045d-4eb7-a445-7e8bc91a498a', N'PASS_STRING_LENGTH2', N'es-CR', N'caracteres.')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'742e2b03-d3e0-4a3c-9aca-7f68d7352568', N'PLAN_VERSION_DETAILS', N'es-CR', N'Esta opción permite crear una versión de un plan de estudio vigente. El Sistema crea una versión copia del plan actual y en el nuevo se prodrá hacer los cambios respectivos, quedando el anterior como una versión histórica')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'740adbd0-4390-4ac0-af79-7fe27f718f8e', N'MARITAL_STATUS_COHABIT', N'es-CR', N'Unión Libre')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'374976cd-56a9-4a81-8fb8-8017a0e7558b', N'DATE_OF_BIRTH', N'es-CR', N'Fecha Nac.')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'0d5167cd-14df-45a5-9deb-805a3edb7eda', N'PHONE_MOB', N'es-CR', N'Tel. Celular')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'847e282a-8899-4e36-ae53-820952eb9d95', N'AUDIT', N'es-CR', N'Auditoría')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'35119fb8-c63a-4884-a465-822586ef508b', N'STUDENT_WORK_PLACE', N'es-CR', N'Lugar de Trabajo')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'59a7a853-c545-4744-af79-8236b58f5a85', N'CLASSROOM_DETAIL', N'es-CR', N'Esta opción permite listar, agregar, modificar y eliminar un aula o espacio donde se imparte ')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'b308dcb3-ed5a-4734-a776-8527224ec609', N'PERSONAL_DATA', N'es-CR', N'Información Personal')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'a1fc71aa-8ff5-409b-8b75-8574722bfbad', N'PLAN_NAME', N'es-CR', N'Plan')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'5ac89e8e-8832-4df2-bf32-870b581216be', N'ENROLLMENT_DESCRIPTION', N'es-CR', N'Descripción')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'a3569ace-e29f-4c55-97c4-87dadf3018bc', N'ACADEMIC_INFORMATION', N'es-CR', N'Información Académica')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'acbdf529-7efd-4fb3-a7c5-88867e3d8b34', N'ENROLLMENT', N'es-CR', N'Matrícula')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'1198b064-c1bd-4ada-aa9f-88ae30064d49', N'REGISTER', N'es-CR', N'Registrar')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'd901aa13-13e4-4bc5-8b03-8982ade354e0', N'STUDENT_WORKS', N'es-CR', N'Trabaja')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'121b6aba-05d2-40c6-8828-8c02729d9884', N'PLAN_VERSION', N'es-CR', N'Versionamiento de Planes')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'0ae948e2-3f20-4d45-a59a-8d636ec9f7a1', N'COORDINATOR', N'es-CR', N'Coordinador')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'82adbe99-2e56-4cc8-916d-8e3d9da2700d', N'REQ_NAME', N'es-CR', N'Nombre Requisito')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'30d4fa15-c5c8-452b-8a28-8ea28db85e6f', N'ADD_REQ', N'es-CR', N'Agregar Requisito')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'9cc7696d-117f-4b29-807d-8f3020c79eb9', N'STUDENT_DETAILS', N'es-CR', N'Esta opción permite listar, agregar, modificar y eliminar estudiantes.')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'3f8409b3-7b44-46ba-8980-8f56773c878c', N'MAINTENANCE', N'es-CR', N'Mantenimiento')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'a3aafbd7-c276-4320-a567-902751eb135d', N'ROLE_COORDINATOR', N'es-CR', N'Coordinador')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'9f1a5ae9-0d0b-47ff-b948-902ebba66f64', N'ACADEMIC_HISTORY_DETAILS', N'es-CR', N'Esta opción permite sacar un historial de cursos y las notas respectivas del estudiante')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'3ea07dbf-5dae-4808-8a29-90f135e02ee4', N'LOCATION_LINE1', N'es-CR', N'Dirección')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'36fe9637-bf26-4bbf-94d7-924859f03dc5', N'PRINT_CERTIFICATION', N'es-CR', N'Imprimir Certificaciones')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'102f2015-eb57-4213-8ead-986cc95a4956', N'STUDENT_ENROLLMENT_CONSULT_DETAIL', N'es-CR', N'Esta opción permite verificar si un estudiante puede matricularse en un determinado plan')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'fb0451ce-dd09-4839-970c-9b8447a0e18d', N'REQUERIMENT_DETAIL', N'es-CR', N'Esta opción permite listar, agregar, modificar y eliminar requisitos')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'34f7b068-8bfa-4141-a57b-9d0117c1c96b', N'LOCATION_DETAIL', N'es-CR', N'Esta opción permite listar, agregar, modificar y eliminar un lugar físico o geográfico')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'7b4e24c3-ea65-40bf-9a34-9f5cd8eef2d5', N'RESIDENT_ID', N'es-CR', N'Cédula Residente')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'a3ca7034-5826-4cae-b77b-9f5e7efd0352', N'ENROLLMENTS_DETAIL', N'es-CR', N'Esta opción permite listar, agregar, modificar y eliminar una instancia de matrícula')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'fcf604df-19cc-4313-a115-9fdaaa3bc1d8', N'ENROLLMENT_COURSES_DETAILS', N'es-CR', N'Detalle de Cursos')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'65d26661-4e5d-4fe8-b2af-a001ebe5999e', N'STUDENT_OCUPATION', N'es-CR', N'Ocupación')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'ed47dd9c-cb08-43ab-b546-a046a9ca137f', N'UNASSIGNED_COURSE', N'es-CR', N'Cursos sin asignar')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'bec6bd6a-b438-4df6-9ee3-a263fc283af0', N'PASSWORD', N'es-CR', N'Contraseña')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'8fcef8bd-8bc5-4b76-b2bd-a268fdc50e43', N'USER', N'es-CR', N'Usuario')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'7df630cc-1107-4456-956d-a29415c207bf', N'ADD_COURSE', N'es-CR', N'Agregar Curso')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'50be2f29-9fc4-4740-8861-a68f8e71d91e', N'COURSE_NAME', N'es-CR', N'Nombre del Curso')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'78e4783f-dcde-4a22-9d9d-a6fdadbc7af2', N'REMEMBER', N'es-CR', N'Recordar')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'5eca83a3-f28c-4997-b3bf-a7f0a224ba02', N'GENDER_MALE', N'es-CR', N'Masculino')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'41a9c184-9951-4d94-8e0d-a9611930521f', N'REQ_PROGRAM', N'es-CR', N'Programa')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'c3104e80-4560-4b0e-9602-aa96ed53c00e', N'EDIT_STUDENT_TITLE', N'es-CR', N'Edición de Estudiantes')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'60939614-cb16-4387-b6c1-ab1d9a7281d4', N'NOTES_REGISTER', N'es-CR', N'Registro de Notas')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'b8e186ba-d18f-46cd-a0c8-ac0f0d48b17d', N'REQUIRED', N'es-CR', N'{0} es requerido')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'a14dcd13-e938-4539-b746-ac16c127cc04', N'RECORDS_COURSE', N'es-CR', N'Registro de Actas por curso')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'7ae1f046-10c1-4adc-b446-ac1739091aa5', N'PHONE_HOME', N'es-CR', N'Tel. Casa')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'2eef75b9-5b24-4dc2-bc88-ada5148b6936', N'LINK_PLAN_TEMPLATE', N'es-CR', N'Vincular Plantillas por Plan')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'48755370-09f5-4aea-9aee-adc7ea545ed0', N'ENROLLMENT_EXRTRA_DATES', N'es-CR', N'Período Extra-Ordinario')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'55c419ba-c405-4a10-ad34-af9f93d39fe3', N'ADDED_COURSES', N'es-CR', N'Cursos Agregados al Plan')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'39fa5763-5f7c-4bde-89a6-b26e3dcba515', N'DELETE', N'es-CR', N'Eliminar')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'f8a1b711-8c9c-488d-a02d-b28d647488f2', N'PERIOD', N'es-CR', N'Periodo')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'ab52759c-6648-4736-8b0c-b57717fedd69', N'REQ', N'es-CR', N'Requisitos')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'48a8f753-b467-4224-80d5-b66d48af099f', N'PASSPORT_ID', N'es-CR', N'Pasaporte Extrangero')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'defb349e-bf0e-4e27-95c6-b69fe1fd5e92', N'USER_MAINTENANCE', N'es-CR', N'Mantenimiento Usuarios')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'bda8cd0e-1144-472d-a0c4-b6fcdd0a363e', N'LOCATION_NAME', N'es-CR', N'Nombre del Lugar')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'4bc7b45f-0a94-464b-9239-b8e963ff6c46', N'CLEAN', N'es-CR', N'Limpiar')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'94cbc72a-d0fa-4e48-aeba-b8f18aeb67bc', N'ENROLLMENT_FECHA_BEGIN', N'es-CR', N'Fecha Inicio')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'7d553976-9ec3-46b1-a0dc-bcbd657a41bf', N'TEMPLATES', N'es-CR', N'Plantillas')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'eae90b56-16b3-40a1-9568-bccc566edebc', N'COURSES', N'es-CR', N'Cursos')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'd817b3d1-bffd-4213-aa72-bd0b332c1165', N'STUDENT_PHYSICA_LADDRESS', N'es-CR', N'Dirección de Residencia')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'a4729071-34a8-4f07-8c2b-bf254a7460cb', N'LOGIN_TITLE', N'es-CR', N'Inicio de sesión.')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'eecd36fe-04e1-4500-b996-c01bad44abaa', N'SCHOOL_MANT', N'es-CR', N'Mantenimiento Escuelas')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'4b538190-e4f2-460b-b52a-c23c40eab111', N'LOCATION_MANT', N'es-CR', N'Mantenimiento Lugares Físicos')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'453bf5a8-b944-4978-b911-c27820a8d6f7', N'REQUERIMENT', N'es-CR', N'Requisitos')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'894deb0d-1c16-4322-8a12-c324acc85bc5', N'ADITIONAL_DATA', N'es-CR', N'Datos Adicionales')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'b3a58d8e-9f9f-490c-9df2-c4647c04c768', N'PREVIOUS_PAGE', N'es-CR', N'Página Anterior')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'6b78172b-3e2a-4be7-8800-c4c89d5241dd', N'USERS_DETAIL', N'es-CR', N'Esta opción permite listar, agregar, modificar y eliminar usuarios del sistema.')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'0c86189e-f4b2-41ea-a42e-c5594ed1d2f5', N'KAU_OTHER', N'es-CR', N'Otro')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'b615c115-aa82-41c6-b1ef-c5fecb148bc8', N'TYPE_NAME', N'es-CR', N'Tipo')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'221281c9-5bb9-4947-9ae8-c6c3e62e1921', N'MODALITY', N'es-CR', N'Modalidades')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'e5b836b5-24ed-41b5-ac61-c7cfbe706abb', N'LINK_PLAN_COURSE_DETAILS', N'es-CR', N'Esta opción permite listar, agregar, modificar y eliminar los cursos asociados a los planes')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'2424fab0-d2db-464d-8e74-c80764c1bc4b', N'ADD_CLASSROOM', N'es-CR', N'Agregar Aula')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'9568c771-9077-430f-9b91-c90607b1417a', N'MODALITY_TYPE_DETAIL', N'es-CR', N'Esta opción permite listar, agregar, modificar y eliminar los tipos de modalidades')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'a7dfdaf9-9694-4c9d-a024-cbc2555a1ea3', N'MODALITY_MANT', N'es-CR', N'Mantenimiento de Modalidades')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'dd5fa20f-0d3a-46d0-a62b-cd14c9c5fd5a', N'PRINT_CERTIFICATION_DETAIL', N'es-CR', N'Esta opción permite realizar la impresión de las certificaciones de un plan')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'ffe0f5fe-59dd-49e0-803c-cd14fd8f011c', N'NATIONAL_ID', N'es-CR', N'Cédula Nacional')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'8e9e9e10-3ebb-4fe1-8024-cdf831c9fcb6', N'SIGNIN', N'es-CR', N'Ingresar')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'2847f4be-6a8f-4044-95a9-d15d9b19d2e1', N'DESCRIPTION', N'es-CR', N'Descripción')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'8c469a95-5d74-49b9-a552-d1ff4c208b03', N'CLASSROOM_CODE', N'es-CR', N'Código del Aula')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'82fa3cff-59d3-46c8-9e10-d45921af3f53', N'ADD_SCHEME', N'es-CR', N'Agregar Programa')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'731a26d3-4c17-434c-bdd4-d657674d8d37', N'COURSE_CONSULT_DETAILS', N'es-CR', N'Se muestran los cursos que un estudiante esta llevando y la información asociada al curso')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'8f8f9a4b-f9f0-487b-8c4d-da7e510332f8', N'GENDER_FEMALE', N'es-CR', N'Femenino')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'69177d06-7264-4c4d-8001-db8fec584af5', N'USERNAME', N'es-CR', N'Nombre Usuario')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'192597c0-528a-43c2-8c19-dc687fe7df9d', N'STUDENT_WHO_PAYS_YOUR_STUDIES', N'es-CR', N'Quien Paga sus Estudios')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'24fc2744-ec7e-4a74-ae11-dde6a99a3729', N'ENROLLMENT_FECHA_END', N'es-CR', N'Fecha Fin')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'9b9de126-6f59-43d3-82e0-df16606d2182', N'ENROLLMENT_STUDENT_DETAIL', N'es-CR', N'Esta opción permite listar, agregar, modificar y eliminar un estudiante en una matrícula')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'7543f979-d06e-4b83-acb6-e208669ce6c5', N'TEMPLATES_DETAIL', N'es-CR', N'Esta opción permite listar, agregar, modificar y eliminar plantillas de certificaciones')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'f73e9b4f-2a8d-4204-bc67-e21213e415c0', N'PLAN_DETAIL', N'es-CR', N'Esta opción permite listar, agregar, modificar y eliminar un plan')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'e759bd3d-51e1-490a-a63c-e2c08b32d8d4', N'MARITAL_STATUS', N'es-CR', N'Estado Civil')
GO
print 'Processed 200 total records'
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'182dd103-05fa-4a66-a4b9-e34bf7e530a0', N'IDENTIFICATION', N'es-CR', N'Identificación')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'c31c7b78-0bed-4116-a59a-e4260fe71a52', N'CURRENT_PASS', N'es-CR', N'Contraseña Actual')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'0ff107ec-fe79-4063-829f-e61673136988', N'REQ_COURSE', N'es-CR', N'Cursos')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'd5c98ceb-c156-4de7-a78c-e872fa0097ee', N'ROLE_STUDENT', N'es-CR', N'Estudiante')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'4e2d198d-4194-42ff-b7a7-ea5c38d80f35', N'WPS_INSTITUTION', N'es-CR', N'Institución')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'1843a924-6f13-4a3f-b6f8-eb0f4627b49a', N'UPDATE', N'es-CR', N'Actualizar')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'83b809b4-bd1e-4d6a-9f30-eb544b84d780', N'KAU_INTERNET', N'es-CR', N'Internet')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'd8c04072-a659-4afa-a309-ec05a5032d83', N'MARITAL_STATUS_SINGLE', N'es-CR', N'Soltero')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'749dedbc-a6e7-43f9-ac3d-efda3d1ab295', N'STUDENT_STUDIES', N'es-CR', N'Estudia')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'c815e869-b119-4599-862b-f1870ea844cd', N'VERSION', N'es-CR', N'Version')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'77d33a40-66da-43de-83ad-f248013fb464', N'RECORDS_COURSE_DETAIL', N'es-CR', N'Esta opción permite hacer el registro definitivo de las notas de los estudiantes en un determinado curso')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'370c54a9-b021-4f57-9c03-f29f50bd375e', N'SCORE_CONSULT', N'es-CR', N'Consulta de Notas')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'bd980937-142d-4222-903c-f3a94c630472', N'PROGRAM_PLAN_COURSE', N'es-CR', N'Programas, Planes y Cursos')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'f4b3a005-c271-4ef8-9495-f642dedbf0df', N'ROLE_ADMINISTRATOR', N'es-CR', N'Administrador')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'd88b81aa-da86-4569-b48d-f6506d0016b9', N'MARITAL_STATUS_DIVORCED', N'es-CR', N'Divorciado')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'01d0c493-5913-448d-b511-f6dd9f46ab4a', N'OLD_PASSWORD', N'es-CR', N'Contraseña Actual')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'42d6d2d8-b796-42cf-b134-f7c70bcb609a', N'VAL_COURSE_DETAIL', N'es-CR', N'Esta opción permite realizar la convalidación de cursos por estudiante')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'a1855bd1-e225-420c-b31c-f8c2ee34406f', N'STUDENT_JOB_TITLE', N'es-CR', N'Puesto que Desempeña')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'd3a3def6-5817-411a-a43a-f9865bae0d50', N'ENROLLMENT_MANT', N'es-CR', N'Mantenimiento Matrícula')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'39ac9365-7e2b-45b9-a793-fb97da0b4682', N'ITEMS_PER_PAGE', N'es-CR', N'Registros por página')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'8e321e4e-bf1a-46d4-a8e3-fd28eb5314d0', N'SIGN', N'es-CR', N'B&B Development, Todos los derechos reservados')
INSERT [dbo].[Resource] ([ResourceID], [ResourceKey], [Culture], [ResourceValue]) VALUES (N'd4de8ca9-e9e7-4d3c-b5c8-fd2a62e4a527', N'OWNER', N'es-CR', N'Responsable')
/****** Object:  Table [dbo].[Type]    Script Date: 04/01/2013 10:27:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Type]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Type](
	[TypeID] [uniqueidentifier] NOT NULL,
	[Name] [varchar](120) NOT NULL,
	[Description] [varchar](300) NULL,
	[Usage] [varchar](4) NULL,
	[InsertDate] [datetime] NULL,
	[InsertUserID] [uniqueidentifier] NULL,
	[ModifyDate] [datetime] NULL,
	[ModifyUserID] [uniqueidentifier] NULL,
	[IpAddress] [varchar](200) NULL,
 CONSTRAINT [PK_Type] PRIMARY KEY CLUSTERED 
(
	[TypeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Type] ([TypeID], [Name], [Description], [Usage], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress]) VALUES (N'36fc2c43-be02-40ac-ae1d-0d7dee3c5a10', N'PASSPORT_ID', N'Passport ID', N'IDS', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Type] ([TypeID], [Name], [Description], [Usage], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress]) VALUES (N'f18e97f6-b298-4f23-8a97-17f0fe527e5f', N'NATIONAL_ID', N'National ID', N'IDS', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Type] ([TypeID], [Name], [Description], [Usage], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress]) VALUES (N'eef8b9e5-293e-46dd-9bac-1b6188f524b9', N'REQ_PLAN', N'Plan Requeriments', N'REQ', CAST(0x0000A16F014F0CEB AS DateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[Type] ([TypeID], [Name], [Description], [Usage], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress]) VALUES (N'9d94f806-ba8f-497b-9004-23e170723a54', N'WPS_DADS', N'Dads', N'WPS', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Type] ([TypeID], [Name], [Description], [Usage], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress]) VALUES (N'35e8dde8-9380-4d17-a30a-25ae2e0fb432', N'MARITAL_STATUS_DIVORCED', N'Marital status divorced', N'MST', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Type] ([TypeID], [Name], [Description], [Usage], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress]) VALUES (N'd6c4565f-0e5f-4912-b448-386544d10e6f', N'WPS_OWN_INCOME', N'Own income', N'WPS', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Type] ([TypeID], [Name], [Description], [Usage], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress]) VALUES (N'bed5a989-da80-4868-b926-3d21b83be2af', N'WPS_FUNDED', N'Funded', N'WPS', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Type] ([TypeID], [Name], [Description], [Usage], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress]) VALUES (N'65fdde7d-05db-4a13-a77b-4d296dd66b48', N'WPS_SCHOLARSHIP', N'Scholarship', N'WPS', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Type] ([TypeID], [Name], [Description], [Usage], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress]) VALUES (N'9b4dfe2f-d329-4ef8-8099-554e7f541e16', N'WPS_OTHER', N'Other', N'WPS', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Type] ([TypeID], [Name], [Description], [Usage], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress]) VALUES (N'6b02ff49-21be-4f4e-9a60-573740ca63cf', N'REQ_COURSE', N'Course Requeriments', N'REQ', CAST(0x0000A16F014F0CEB AS DateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[Type] ([TypeID], [Name], [Description], [Usage], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress]) VALUES (N'e0c51afe-b019-4110-9503-59263bf7b054', N'KAU_TV', N'TV', N'KAU', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Type] ([TypeID], [Name], [Description], [Usage], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress]) VALUES (N'83c60e73-64df-4dc0-b27e-81bba3ee50d3', N'REQ_PROGRAM', N'Program Requeriments', N'REQ', CAST(0x0000A16F014F0CEB AS DateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[Type] ([TypeID], [Name], [Description], [Usage], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress]) VALUES (N'8ace842c-fa79-426c-9562-90eebc1db338', N'KAU_NEWS', N'NEWS', N'KAU', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Type] ([TypeID], [Name], [Description], [Usage], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress]) VALUES (N'feddb31f-d7f4-499a-87d1-add17ddfd616', N'KAU_INTERNET', N'INTERNET', N'KAU', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Type] ([TypeID], [Name], [Description], [Usage], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress]) VALUES (N'39e87213-c7e2-4357-ba47-adfc595ecacb', N'WPS_INSTITUTION', N'Institution', N'WPS', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Type] ([TypeID], [Name], [Description], [Usage], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress]) VALUES (N'66619626-8fbb-4319-b0b4-b3950afbc85e', N'MARITAL_STATUS_COHABIT', N'Marital status cohabit', N'MST', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Type] ([TypeID], [Name], [Description], [Usage], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress]) VALUES (N'95c0c502-3e24-4036-bac5-bff8db1a0946', N'MARITAL_STATUS_SINGLE', N'Marital status single', N'MST', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Type] ([TypeID], [Name], [Description], [Usage], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress]) VALUES (N'db37ecb2-ca86-46e1-b264-c609919fcc54', N'RESIDENT_ID', N'Resident ID', N'IDS', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Type] ([TypeID], [Name], [Description], [Usage], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress]) VALUES (N'eb64ecce-f794-470a-90c7-d50a98acab8d', N'KAU_OTHER', N'Other', N'KAU', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Type] ([TypeID], [Name], [Description], [Usage], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress]) VALUES (N'f174ac5c-3a96-4db7-b965-ddac9f2874ee', N'MARITAL_STATUS_MARRIED', N'Marital status married', N'MST', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Type] ([TypeID], [Name], [Description], [Usage], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress]) VALUES (N'e5122527-5bb0-447d-92bf-de1c0e7b05b4', N'WPS_FAMILY', N'Family', N'WPS', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Type] ([TypeID], [Name], [Description], [Usage], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress]) VALUES (N'39b6ea3d-02a7-4ce5-87e5-fa65e5ca321e', N'MARITAL_STATUS_WIDOW', N'Marital status widow', N'MST', NULL, NULL, NULL, NULL, NULL)
/****** Object:  Table [dbo].[Users]    Script Date: 04/01/2013 10:27:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Users]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Users](
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[IsAnonymous] [bit] NOT NULL,
	[LastActivityDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
INSERT [dbo].[Users] ([ApplicationId], [UserId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'f5a32da9-8a3e-4d62-8df1-03e046058bf7', N'401100524', 0, CAST(0x0000A17F01433995 AS DateTime))
INSERT [dbo].[Users] ([ApplicationId], [UserId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'af29b636-918e-4430-8db3-0a0df4c07170', N'109550496', 0, CAST(0x0000A17F010665D1 AS DateTime))
INSERT [dbo].[Users] ([ApplicationId], [UserId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'a9991d74-8e56-4018-87ba-0dc3501084e2', N'104140419', 0, CAST(0x0000A17F01402CE5 AS DateTime))
INSERT [dbo].[Users] ([ApplicationId], [UserId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'21853167-8ff5-473f-af25-125ce330e894', N'800730195', 0, CAST(0x0000A1780151BFC2 AS DateTime))
INSERT [dbo].[Users] ([ApplicationId], [UserId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'a8f3c61e-6fcb-4274-b82c-147b38771f22', N'110200810', 0, CAST(0x0000A17F013FD2EB AS DateTime))
INSERT [dbo].[Users] ([ApplicationId], [UserId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'9d1241d3-d8a4-48b7-8edc-147c3a538a25', N'110830199', 0, CAST(0x0000A17801232125 AS DateTime))
INSERT [dbo].[Users] ([ApplicationId], [UserId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'f1d11c86-1f1c-4a7e-8a3d-1ceb670134d4', N'206100930', 0, CAST(0x0000A17F013E0DCE AS DateTime))
INSERT [dbo].[Users] ([ApplicationId], [UserId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'4f7dfd20-ed18-4e16-9e3b-1ef7b799c7e5', N'113560127', 0, CAST(0x0000A17F012B4C8F AS DateTime))
INSERT [dbo].[Users] ([ApplicationId], [UserId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'7d78347a-ca15-481d-a2e2-20eba97e63db', N'107280738', 0, CAST(0x0000A1780121B9C4 AS DateTime))
INSERT [dbo].[Users] ([ApplicationId], [UserId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'61409b3f-51d2-49d6-a1e4-21e3cc46b0f6', N'103530796', 0, CAST(0x0000A17E01457218 AS DateTime))
INSERT [dbo].[Users] ([ApplicationId], [UserId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'd8140bf3-8511-4272-816e-2762228539dc', N'114960600', 0, CAST(0x0000A1780112B23A AS DateTime))
INSERT [dbo].[Users] ([ApplicationId], [UserId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'f7b84ea1-5c2a-49f0-98a5-279a3ace876e', N'1641661', 0, CAST(0x0000A17E012895AA AS DateTime))
INSERT [dbo].[Users] ([ApplicationId], [UserId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'ee615fc7-6c4c-4d6c-b468-27fff6d62a55', N'206300540', 0, CAST(0x0000A17801208516 AS DateTime))
INSERT [dbo].[Users] ([ApplicationId], [UserId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'ebb71c3e-be87-49cd-9171-2bd780a6072f', N'601270186', 0, CAST(0x0000A178014A4EFC AS DateTime))
INSERT [dbo].[Users] ([ApplicationId], [UserId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'52424689-6925-403a-84a0-2c210ba4ac97', N'203130283', 0, CAST(0x0000A17E014B3210 AS DateTime))
INSERT [dbo].[Users] ([ApplicationId], [UserId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'0d122016-8c8c-4716-800e-2d6ca55e5035', N'108800676', 0, CAST(0x0000A17F012BA5B6 AS DateTime))
INSERT [dbo].[Users] ([ApplicationId], [UserId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'bfb77445-7c40-4e88-900d-2f29aaa303e6', N'602010167', 0, CAST(0x0000A17801522AC9 AS DateTime))
INSERT [dbo].[Users] ([ApplicationId], [UserId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'ea8fd4a1-b420-492e-9769-2f47948310d1', N'303560974', 0, CAST(0x0000A17801114D80 AS DateTime))
INSERT [dbo].[Users] ([ApplicationId], [UserId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'1469f96d-0236-4ce3-bf26-2f6d74e3e8c6', N'105410171', 0, CAST(0x0000A17F013D617C AS DateTime))
INSERT [dbo].[Users] ([ApplicationId], [UserId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'09e4d1cd-a983-432a-80a9-2fc910e920d2', N'109530136', 0, CAST(0x0000A18601592817 AS DateTime))
INSERT [dbo].[Users] ([ApplicationId], [UserId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'5f7a4b47-a645-45d6-bd60-31353e1aeb70', N'302750483', 0, CAST(0x0000A1780117BCCA AS DateTime))
INSERT [dbo].[Users] ([ApplicationId], [UserId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'1219d423-677e-4d32-83e2-365a3335aa98', N'105280775', 0, CAST(0x0000A17F01425F6A AS DateTime))
INSERT [dbo].[Users] ([ApplicationId], [UserId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'41ac46b2-d777-4a88-933a-3697f42d8a6d', N'11004167', 0, CAST(0x0000A1820158E6F5 AS DateTime))
INSERT [dbo].[Users] ([ApplicationId], [UserId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'591a302b-99bb-470a-ae1e-3813d24e9173', N'203620012', 0, CAST(0x0000A17F0146E551 AS DateTime))
INSERT [dbo].[Users] ([ApplicationId], [UserId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'e6eca7c1-e3b8-48e8-90ea-381f6bd7d1f1', N'203470859', 0, CAST(0x0000A17F0142EE4A AS DateTime))
INSERT [dbo].[Users] ([ApplicationId], [UserId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'6f94a283-e581-4378-ac39-38236a3d47f3', N'109540563', 0, CAST(0x0000A17E0145FECB AS DateTime))
INSERT [dbo].[Users] ([ApplicationId], [UserId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'961f6a8a-a094-4036-98a1-39c686eecf3f', N'103370323', 0, CAST(0x0000A17801224457 AS DateTime))
INSERT [dbo].[Users] ([ApplicationId], [UserId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'556e3fd5-4f0a-4601-8f26-3a091566b667', N'110370476', 0, CAST(0x0000A17E014CEAD5 AS DateTime))
INSERT [dbo].[Users] ([ApplicationId], [UserId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'9ea890aa-35c5-4984-a1ed-3aba1df217c9', N'104850201', 0, CAST(0x0000A1780147DC82 AS DateTime))
INSERT [dbo].[Users] ([ApplicationId], [UserId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'6c2acc03-9573-4527-87c2-3b5f4127df35', N'303720138', 0, CAST(0x0000A15D018AC464 AS DateTime))
INSERT [dbo].[Users] ([ApplicationId], [UserId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'94222b2b-db37-432f-86f7-3f04b7b33a67', N'106980205', 0, CAST(0x0000A17E014C33A8 AS DateTime))
INSERT [dbo].[Users] ([ApplicationId], [UserId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'0f1c0606-d31b-472e-87a4-3fa7997f7d4f', N'401380955', 0, CAST(0x0000A17F01474620 AS DateTime))
INSERT [dbo].[Users] ([ApplicationId], [UserId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'1a30aaca-edec-4200-9a1e-41fdd5ba817d', N'401120892', 0, CAST(0x0000A178015294E5 AS DateTime))
INSERT [dbo].[Users] ([ApplicationId], [UserId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'60488e1b-9b99-4ef5-8339-4340748067c5', N'104320994', 0, CAST(0x0000A17801477A41 AS DateTime))
INSERT [dbo].[Users] ([ApplicationId], [UserId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'ac104041-4bd2-4d5b-af9e-4388bbb70f26', N'301990668', 0, CAST(0x0000A17801174F18 AS DateTime))
INSERT [dbo].[Users] ([ApplicationId], [UserId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'abb6ed1d-85f0-4cf4-9587-469116e56d3b', N'106240656', 0, CAST(0x0000A17F012C5EAF AS DateTime))
INSERT [dbo].[Users] ([ApplicationId], [UserId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'16e4f7d8-62a4-4452-836e-46f3518d5088', N'401050415', 0, CAST(0x0000A178012936E1 AS DateTime))
INSERT [dbo].[Users] ([ApplicationId], [UserId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'ee7735f6-3179-4b91-a3cf-4961de469d80', N'603350227', 0, CAST(0x0000A17F012CB076 AS DateTime))
INSERT [dbo].[Users] ([ApplicationId], [UserId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'dee40288-21b5-4de5-a167-4e0053d56216', N'11229397', 0, CAST(0x0000A17E0127B5F2 AS DateTime))
INSERT [dbo].[Users] ([ApplicationId], [UserId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'529d4a33-bd11-472e-8505-502c5142ce33', N'303500173', 0, CAST(0x0000A17801175C71 AS DateTime))
INSERT [dbo].[Users] ([ApplicationId], [UserId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'26918a5e-74c6-4f0d-a7e5-52c19b739e18', N'800700443', 0, CAST(0x0000A17E011ECF79 AS DateTime))
INSERT [dbo].[Users] ([ApplicationId], [UserId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'7a88f8e9-ffed-4276-b54a-52efb30977d0', N'108440437', 0, CAST(0x0000A1780152E6B0 AS DateTime))
INSERT [dbo].[Users] ([ApplicationId], [UserId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'4595be71-2715-40dc-8c14-54780ece4f8f', N'105250291', 0, CAST(0x0000A17F013EE195 AS DateTime))
INSERT [dbo].[Users] ([ApplicationId], [UserId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'2c45487c-8348-462c-b2d4-55d6c28a9b29', N'602290041', 0, CAST(0x0000A178011B92A0 AS DateTime))
INSERT [dbo].[Users] ([ApplicationId], [UserId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'9ed2f2d1-a18c-4735-82fe-5696294a188d', N'304150209', 0, CAST(0x0000A17801152D46 AS DateTime))
INSERT [dbo].[Users] ([ApplicationId], [UserId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'2e8f409d-3679-42eb-b5e4-583871bc0918', N'205580635', 0, CAST(0x0000A17F012C0745 AS DateTime))
INSERT [dbo].[Users] ([ApplicationId], [UserId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'124f8cbe-09f5-4b97-90d8-591c534cb6d7', N'303750180', 0, CAST(0x0000A17E014715F9 AS DateTime))
INSERT [dbo].[Users] ([ApplicationId], [UserId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'0a0f5d8e-9a39-4c12-8d7d-5a5a684a8096', N'103710589', 0, CAST(0x0000A17E01540749 AS DateTime))
INSERT [dbo].[Users] ([ApplicationId], [UserId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'02a769e4-464c-40a3-97c7-5bbf99a241e2', N'303220458', 0, CAST(0x0000A17F012CD687 AS DateTime))
INSERT [dbo].[Users] ([ApplicationId], [UserId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'81cfa0f1-e28b-48e4-90c5-5da8416d2128', N'108800608', 0, CAST(0x0000A17F010B83F5 AS DateTime))
INSERT [dbo].[Users] ([ApplicationId], [UserId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'c5e0e5f9-47fa-4edf-be9f-5db949700d1a', N'105570291', 0, CAST(0x0000A17F0117B1BF AS DateTime))
INSERT [dbo].[Users] ([ApplicationId], [UserId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'863ee975-9a5b-4321-9ea7-5dc2405ad0bb', N'108310140', 0, CAST(0x0000A17E0150982E AS DateTime))
INSERT [dbo].[Users] ([ApplicationId], [UserId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'031d2478-538b-4bf8-b8ba-5debe84de076', N'302770866', 0, CAST(0x0000A17E0144DF10 AS DateTime))
INSERT [dbo].[Users] ([ApplicationId], [UserId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'502844ea-ade5-4fff-aa26-5ec6fd5892a6', N'103951028', 0, CAST(0x0000A17F01439A10 AS DateTime))
INSERT [dbo].[Users] ([ApplicationId], [UserId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'a8ea54b7-1a19-4eee-8f4b-60dc08090b2c', N'602890775', 0, CAST(0x0000A17F012C51B4 AS DateTime))
INSERT [dbo].[Users] ([ApplicationId], [UserId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'28d9cc12-7efe-4fb9-a2d4-6126dd744408', N'104830377', 0, CAST(0x0000A1780110B710 AS DateTime))
INSERT [dbo].[Users] ([ApplicationId], [UserId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'aa323aaa-7184-46e8-8605-616e0a15119b', N'106010735', 0, CAST(0x0000A1780122982A AS DateTime))
INSERT [dbo].[Users] ([ApplicationId], [UserId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'a93929d6-1a02-4e5f-bd6b-61f4a86f77dc', N'602060981', 0, CAST(0x0000A178011C0274 AS DateTime))
INSERT [dbo].[Users] ([ApplicationId], [UserId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'28e6cadd-6359-4741-a46c-6304d83688f2', N'110330426', 0, CAST(0x0000A17E014E6B06 AS DateTime))
INSERT [dbo].[Users] ([ApplicationId], [UserId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'8209ebd5-c679-4da3-8630-6659f205d5ca', N'302280807', 0, CAST(0x0000A17801103973 AS DateTime))
INSERT [dbo].[Users] ([ApplicationId], [UserId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'991ba8ed-ddba-43ff-8722-66c228c0f074', N'109410335', 0, CAST(0x0000A17E01412A2C AS DateTime))
INSERT [dbo].[Users] ([ApplicationId], [UserId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'c1f24856-782a-440c-8d6a-671c1c40958a', N'203330722', 0, CAST(0x0000A17F01077321 AS DateTime))
INSERT [dbo].[Users] ([ApplicationId], [UserId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'f4dce8b4-7185-43a1-9ff3-67baed6a54b3', N'203250274', 0, CAST(0x0000A1780144619C AS DateTime))
INSERT [dbo].[Users] ([ApplicationId], [UserId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'7ebedf80-05f9-4639-bd3f-68bb8b906a46', N'302570884', 0, CAST(0x0000A1780113E432 AS DateTime))
INSERT [dbo].[Users] ([ApplicationId], [UserId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'2903b52f-bd35-4f65-ab73-6b376d770db3', N'800760820', 0, CAST(0x0000A17F013E654F AS DateTime))
INSERT [dbo].[Users] ([ApplicationId], [UserId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'f8adccc3-3494-4408-b822-6c50f60e7c0e', N'110650601', 0, CAST(0x0000A17E011E04E3 AS DateTime))
INSERT [dbo].[Users] ([ApplicationId], [UserId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'8b185310-8774-493b-a1ad-6e58c789e4b9', N'104920790', 0, CAST(0x0000A17E0148C2EF AS DateTime))
INSERT [dbo].[Users] ([ApplicationId], [UserId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'04622c29-cc0f-4876-9f0c-70266450200f', N'401870287', 0, CAST(0x0000A1820158365A AS DateTime))
INSERT [dbo].[Users] ([ApplicationId], [UserId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'3096d7b8-f414-4100-896b-704dcae0e617', N'303310964', 0, CAST(0x0000A16901776652 AS DateTime))
INSERT [dbo].[Users] ([ApplicationId], [UserId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'75674a63-d6dc-42f8-b861-73aca8bf8067', N'104420328', 0, CAST(0x0000A17801467287 AS DateTime))
INSERT [dbo].[Users] ([ApplicationId], [UserId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'ee65af32-888a-481e-9658-766438ae89b5', N'107240505', 0, CAST(0x0000A17E014BBEED AS DateTime))
INSERT [dbo].[Users] ([ApplicationId], [UserId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'eb9933c8-3bb7-45d2-815e-78508083ffad', N'108740203', 0, CAST(0x0000A17F012D5017 AS DateTime))
INSERT [dbo].[Users] ([ApplicationId], [UserId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'92d1923c-983b-49fd-ac66-7a264f3cc017', N'107090693', 0, CAST(0x0000A17F012C7BE4 AS DateTime))
INSERT [dbo].[Users] ([ApplicationId], [UserId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'ea40bef2-f9f6-4f71-a375-7d4ea3f645e2', N'104610623', 0, CAST(0x0000A1780116C984 AS DateTime))
INSERT [dbo].[Users] ([ApplicationId], [UserId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'280e4de7-8322-4e0d-a8a7-7ddb98ae94a1', N'106970453', 0, CAST(0x0000A188017F3A8B AS DateTime))
INSERT [dbo].[Users] ([ApplicationId], [UserId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'35463446-1c00-4652-8285-7dde516c0820', N'114450399', 0, CAST(0x0000A1780115F234 AS DateTime))
INSERT [dbo].[Users] ([ApplicationId], [UserId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'e377ff73-a125-4f9e-99a7-7e301eee749d', N'106380987', 0, CAST(0x0000A17E0127EBBE AS DateTime))
INSERT [dbo].[Users] ([ApplicationId], [UserId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'1403268e-d6d7-46e4-a3f2-7ec2f299253c', N'602210692', 0, CAST(0x0000A17F013DC262 AS DateTime))
INSERT [dbo].[Users] ([ApplicationId], [UserId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'40390a71-7344-47b5-bbd0-830addeb12ff', N'105770871', 0, CAST(0x0000A17F011E0D22 AS DateTime))
INSERT [dbo].[Users] ([ApplicationId], [UserId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'd9a71fd7-6cad-4ba1-b98f-83b4d7d330d4', N'104191489', 0, CAST(0x0000A17801533D2F AS DateTime))
INSERT [dbo].[Users] ([ApplicationId], [UserId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'506c0f75-8b9b-429e-bbfb-84a0fbdf8281', N'900460249', 0, CAST(0x0000A17F01418E90 AS DateTime))
INSERT [dbo].[Users] ([ApplicationId], [UserId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'9ca29c27-2a95-4324-a751-8588b71a0a07', N'204990647', 0, CAST(0x0000A17801190917 AS DateTime))
INSERT [dbo].[Users] ([ApplicationId], [UserId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'2e4798d2-bb68-40a1-80e1-86f76b450bb6', N'107310082', 0, CAST(0x0000A178011CD1A1 AS DateTime))
INSERT [dbo].[Users] ([ApplicationId], [UserId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'e080409a-d29f-424e-aae2-8a6237a0e748', N'106040177', 0, CAST(0x0000A178014BCC36 AS DateTime))
INSERT [dbo].[Users] ([ApplicationId], [UserId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'02b6e53a-ec02-42c7-8e52-8a70e1a458c5', N'109740950', 0, CAST(0x0000A17F012C87DE AS DateTime))
INSERT [dbo].[Users] ([ApplicationId], [UserId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'c79ab146-7cfd-4e06-bccb-8b8f783aaa2c', N'110790620', 0, CAST(0x0000A17801100ECA AS DateTime))
INSERT [dbo].[Users] ([ApplicationId], [UserId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'94ea1830-6fbb-4a1f-b114-8b9cf482b0bd', N'701050300', 0, CAST(0x0000A1780125B79F AS DateTime))
INSERT [dbo].[Users] ([ApplicationId], [UserId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'6a0c4923-b1aa-44a5-9171-8d3b5399a990', N'202900558', 0, CAST(0x0000A17801440AE8 AS DateTime))
INSERT [dbo].[Users] ([ApplicationId], [UserId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'c8f318ea-34f0-4260-ba62-8f2e92949939', N'115430230', 0, CAST(0x0000A19300EDA507 AS DateTime))
INSERT [dbo].[Users] ([ApplicationId], [UserId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'de3c64a6-2506-4b6c-b632-8f7ab298b58e', N'600840364', 0, CAST(0x0000A178011AAB2B AS DateTime))
INSERT [dbo].[Users] ([ApplicationId], [UserId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'8909d7be-fcb4-431e-adcf-91484e174c16', N'601330984', 0, CAST(0x0000A178011E588D AS DateTime))
INSERT [dbo].[Users] ([ApplicationId], [UserId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'a1c5b1c1-4398-4ef7-9479-92aec0674353', N'106330961', 0, CAST(0x0000A17F012CE561 AS DateTime))
INSERT [dbo].[Users] ([ApplicationId], [UserId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'f8f88a0e-2823-45b3-8075-92cdfd5c5c87', N'106910858', 0, CAST(0x0000A17F0129250B AS DateTime))
INSERT [dbo].[Users] ([ApplicationId], [UserId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'b0d5c63d-9b55-4b94-8f1b-92cf9ffdf98f', N'1710425', 0, CAST(0x0000A17E011A05A3 AS DateTime))
INSERT [dbo].[Users] ([ApplicationId], [UserId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'158e7f16-d0e0-4365-b7bd-94b3cc74ec0d', N'108150850', 0, CAST(0x0000A17F012C1CC9 AS DateTime))
INSERT [dbo].[Users] ([ApplicationId], [UserId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'd926932a-d547-488e-bdf4-96aba353557b', N'401460396', 0, CAST(0x0000A18C014C5CC4 AS DateTime))
INSERT [dbo].[Users] ([ApplicationId], [UserId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'4eb23992-0f12-4f29-9c0a-977a572efd48', N'111710678', 0, CAST(0x0000A17801122A25 AS DateTime))
INSERT [dbo].[Users] ([ApplicationId], [UserId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'e0ae4f1a-97d9-428a-a5e6-97b403e1763b', N'900550024', 0, CAST(0x0000A1780145BF99 AS DateTime))
INSERT [dbo].[Users] ([ApplicationId], [UserId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'1d304168-ccd0-4a53-9022-986f23768126', N'503260366', 0, CAST(0x0000A178011C7BC5 AS DateTime))
INSERT [dbo].[Users] ([ApplicationId], [UserId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'13858728-3e25-46f0-8f0b-989eb73cd7e9', N'106850044', 0, CAST(0x0000A17F010E9C20 AS DateTime))
INSERT [dbo].[Users] ([ApplicationId], [UserId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'8dba8e08-01a5-4381-9eac-9d998830a6df', N'106730418', 0, CAST(0x0000A17F012CC132 AS DateTime))
GO
print 'Processed 100 total records'
INSERT [dbo].[Users] ([ApplicationId], [UserId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'ae9feade-aafe-470d-8882-a1c4a1813343', N'1470062', 0, CAST(0x0000A17801101B00 AS DateTime))
INSERT [dbo].[Users] ([ApplicationId], [UserId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'ac278425-2d45-43eb-89b0-a2b0651dc7ab', N'105980255', 0, CAST(0x0000A17F011D929E AS DateTime))
INSERT [dbo].[Users] ([ApplicationId], [UserId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'793a3df7-a167-4bf7-aa75-a8610d5a3e9a', N'303070224', 0, CAST(0x0000A17801189B3C AS DateTime))
INSERT [dbo].[Users] ([ApplicationId], [UserId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'66edb6e2-4812-4c8a-80db-a8fefa711510', N'1563559', 0, CAST(0x0000A17E010DEFA6 AS DateTime))
INSERT [dbo].[Users] ([ApplicationId], [UserId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'24be72bc-9108-4bd6-bbeb-aaeeb5e757f9', N'104250812', 0, CAST(0x0000A17E011B17AC AS DateTime))
INSERT [dbo].[Users] ([ApplicationId], [UserId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'a1500fb0-d2a5-44f2-97ac-ab7002763037', N'503230500', 0, CAST(0x0000A178011B203B AS DateTime))
INSERT [dbo].[Users] ([ApplicationId], [UserId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'667f126c-cfee-4680-9230-b1275edc0da9', N'107770954', 0, CAST(0x0000A17F010C5AF5 AS DateTime))
INSERT [dbo].[Users] ([ApplicationId], [UserId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'c8f526e4-dee3-48e8-8483-b1334a19ebc3', N'104190914', 0, CAST(0x0000A17F0141E3AB AS DateTime))
INSERT [dbo].[Users] ([ApplicationId], [UserId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'f2bb2f46-d293-4f75-8d91-b20809d9ef3b', N'104790613', 0, CAST(0x0000A178011DFD82 AS DateTime))
INSERT [dbo].[Users] ([ApplicationId], [UserId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'595b7e7e-40bf-4053-80db-b79a684a026a', N'601040388', 0, CAST(0x0000A17801215827 AS DateTime))
INSERT [dbo].[Users] ([ApplicationId], [UserId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'4fa1031d-8d96-4b14-a9e0-c2c849d6924a', N'401550789', 0, CAST(0x0000A17801244FEE AS DateTime))
INSERT [dbo].[Users] ([ApplicationId], [UserId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'36cd8756-c330-4073-9801-c36b483be305', N'109600230', 0, CAST(0x0000A17E014685AB AS DateTime))
INSERT [dbo].[Users] ([ApplicationId], [UserId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'ef9357d3-a6fa-4673-8c99-c36ea808a54f', N'104630524', 0, CAST(0x0000A17F01041A2D AS DateTime))
INSERT [dbo].[Users] ([ApplicationId], [UserId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'8936d087-0be8-4d57-9767-c5a38f1c4b25', N'109150328', 0, CAST(0x0000A17801167155 AS DateTime))
INSERT [dbo].[Users] ([ApplicationId], [UserId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'd39ffd63-6295-4d44-b504-c63926c4d953', N'304310250', 0, CAST(0x0000A188017F7417 AS DateTime))
INSERT [dbo].[Users] ([ApplicationId], [UserId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'd3da52df-af8d-485d-a284-c68e91caa072', N'602390775', 0, CAST(0x0000A17F012D1E61 AS DateTime))
INSERT [dbo].[Users] ([ApplicationId], [UserId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'16042815-f9f4-477c-9bc4-c7364088ff20', N'105890737', 0, CAST(0x0000A17F01126C8E AS DateTime))
INSERT [dbo].[Users] ([ApplicationId], [UserId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'f5e2727b-1f15-4626-9b01-c8cc89dd2913', N'106520097', 0, CAST(0x0000A17E015368BC AS DateTime))
INSERT [dbo].[Users] ([ApplicationId], [UserId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'3b0b3574-321a-4dfb-b99e-c9a54db63fd6', N'303400207', 0, CAST(0x0000A17E014024A0 AS DateTime))
INSERT [dbo].[Users] ([ApplicationId], [UserId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'658e7420-a9a3-4d11-a751-c9f7b6876a5d', N'104780925', 0, CAST(0x0000A17801483A13 AS DateTime))
INSERT [dbo].[Users] ([ApplicationId], [UserId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'f9f012d1-e177-47f5-bc60-ca288d780dd4', N'3337617', 0, CAST(0x0000A17E0128D3B8 AS DateTime))
INSERT [dbo].[Users] ([ApplicationId], [UserId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'22e466ed-5b35-4734-89e9-cc2b9ec3e55a', N'admin', 0, CAST(0x0000A19300F19AF5 AS DateTime))
INSERT [dbo].[Users] ([ApplicationId], [UserId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'c01d504c-a20a-48f2-9a5c-ce5dfa5059c3', N'203480469', 0, CAST(0x0000A178011DA5E0 AS DateTime))
INSERT [dbo].[Users] ([ApplicationId], [UserId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'd594f477-dacb-414a-b34b-cf0937457b36', N'900300800', 0, CAST(0x0000A17801147BEF AS DateTime))
INSERT [dbo].[Users] ([ApplicationId], [UserId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'e87a5a50-b1da-401e-823d-d1a40d8525d5', N'110350545', 0, CAST(0x0000A17F01412982 AS DateTime))
INSERT [dbo].[Users] ([ApplicationId], [UserId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'2788dc45-794c-48e0-bdb5-d2648b35514c', N'109300338', 0, CAST(0x0000A1780118207E AS DateTime))
INSERT [dbo].[Users] ([ApplicationId], [UserId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'cd70ba0b-58e1-458d-8dee-d2e4bbbfb1c5', N'401450525', 0, CAST(0x0000A17F011747A8 AS DateTime))
INSERT [dbo].[Users] ([ApplicationId], [UserId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'42b5d6a5-d9a8-447a-be25-d5ab4c986f6a', N'104650159', 0, CAST(0x0000A17F0112E871 AS DateTime))
INSERT [dbo].[Users] ([ApplicationId], [UserId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'f1753657-3333-40ba-b9af-d8ef74622721', N'603250070', 0, CAST(0x0000A17801196DC4 AS DateTime))
INSERT [dbo].[Users] ([ApplicationId], [UserId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'fee6dd35-49bb-41f0-9760-d95f99b15bd1', N'110020597', 0, CAST(0x0000A1780143B6C1 AS DateTime))
INSERT [dbo].[Users] ([ApplicationId], [UserId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'4dc3f3d8-fa10-42e8-b625-da946e8c1f59', N'110040905', 0, CAST(0x0000A17E01483816 AS DateTime))
INSERT [dbo].[Users] ([ApplicationId], [UserId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'd4e2db0e-1291-4ded-963a-dab7babb446c', N'103941175', 0, CAST(0x0000A178011D3BD1 AS DateTime))
INSERT [dbo].[Users] ([ApplicationId], [UserId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'de15718a-08eb-48c0-a789-db560b83771c', N'110960299', 0, CAST(0x0000A17801472347 AS DateTime))
INSERT [dbo].[Users] ([ApplicationId], [UserId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'e6220e10-ccc5-4d1c-9291-dedd7dc87f55', N'108120432', 0, CAST(0x0000A17E01495C61 AS DateTime))
INSERT [dbo].[Users] ([ApplicationId], [UserId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'6da64653-1ff8-4938-8ecb-dee4b914ca8a', N'108010641', 0, CAST(0x0000A17F011ED586 AS DateTime))
INSERT [dbo].[Users] ([ApplicationId], [UserId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'88feaa39-d83c-4fa5-ba55-df3104ec908e', N'104030926', 0, CAST(0x0000A17E014AC77A AS DateTime))
INSERT [dbo].[Users] ([ApplicationId], [UserId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'f9439a9a-11a0-40ce-accc-e23fc5ae8f3c', N'401310738', 0, CAST(0x0000A17F014424D6 AS DateTime))
INSERT [dbo].[Users] ([ApplicationId], [UserId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'8b8b61e9-0892-4dba-b72b-e4b52c15dabe', N'202710124', 0, CAST(0x0000A17801454878 AS DateTime))
INSERT [dbo].[Users] ([ApplicationId], [UserId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'ed327b5a-0f81-45b6-95ef-e5c28806a8a0', N'601020582', 0, CAST(0x0000A17801159C66 AS DateTime))
INSERT [dbo].[Users] ([ApplicationId], [UserId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'79e11c51-1eb9-4ce8-9181-e73c25ac57ac', N'112820925', 0, CAST(0x0000A17F01120844 AS DateTime))
INSERT [dbo].[Users] ([ApplicationId], [UserId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'd31041af-cef8-40b8-a45e-e774be9dff6f', N'109550722', 0, CAST(0x0000A17E014DFD87 AS DateTime))
INSERT [dbo].[Users] ([ApplicationId], [UserId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'2cb27382-0595-41e8-9821-e77d8fdab632', N'112210016', 0, CAST(0x0000A17F012C297E AS DateTime))
INSERT [dbo].[Users] ([ApplicationId], [UserId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'4347b67c-5e00-4b89-aa64-e8c753fce49d', N'104460478', 0, CAST(0x0000A17F0104E74F AS DateTime))
INSERT [dbo].[Users] ([ApplicationId], [UserId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'd8be406b-eee8-49f2-bffc-e9859ab9910c', N'1508381', 0, CAST(0x0000A17E0129460D AS DateTime))
INSERT [dbo].[Users] ([ApplicationId], [UserId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'e33e7b01-c8e9-4e4b-9042-eafce9410dc7', N'204230867', 0, CAST(0x0000A17E014A6103 AS DateTime))
INSERT [dbo].[Users] ([ApplicationId], [UserId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'9d112d71-580e-4af0-b4be-f01a2a95b3be', N'700660482', 0, CAST(0x0000A17E0152CFC9 AS DateTime))
INSERT [dbo].[Users] ([ApplicationId], [UserId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'b081f97c-0d4e-40f8-b4c3-f058e89b31fd', N'113470951', 0, CAST(0x0000A17E0147B03E AS DateTime))
INSERT [dbo].[Users] ([ApplicationId], [UserId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'97b14396-7ab4-4094-9c4a-f06017a421de', N'104650002', 0, CAST(0x0000A1780144BFF2 AS DateTime))
INSERT [dbo].[Users] ([ApplicationId], [UserId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'c49386dc-3243-4e1b-8f4e-f2d07ca1ffc1', N'106670516', 0, CAST(0x0000A178014ABA0C AS DateTime))
INSERT [dbo].[Users] ([ApplicationId], [UserId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'e2807c0f-cf5d-4f98-bcb3-f3c7415ff1c5', N'1842089', 0, CAST(0x0000A17E011C0BE6 AS DateTime))
INSERT [dbo].[Users] ([ApplicationId], [UserId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'b23d276c-0795-48b2-b6a0-f5d0984dd682', N'105570612', 0, CAST(0x0000A17E014D983C AS DateTime))
INSERT [dbo].[Users] ([ApplicationId], [UserId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'50277c83-e5d4-4e6b-a694-f6a91a0e994e', N'109630380', 0, CAST(0x0000A1880143F989 AS DateTime))
INSERT [dbo].[Users] ([ApplicationId], [UserId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'd54386f4-d644-40d5-b4b0-f853be8b2e0b', N'203850085', 0, CAST(0x0000A1780146C7BF AS DateTime))
INSERT [dbo].[Users] ([ApplicationId], [UserId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'4f585e36-fd6e-43ef-b086-fa317a195d98', N'103550801', 0, CAST(0x0000A178014618A9 AS DateTime))
INSERT [dbo].[Users] ([ApplicationId], [UserId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'37161e19-f11e-493c-8506-fa396c3457c1', N'1567885', 0, CAST(0x0000A17E011CE7F9 AS DateTime))
INSERT [dbo].[Users] ([ApplicationId], [UserId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'2352bd85-dc90-4fd7-a523-fa7409a58b25', N'205020840', 0, CAST(0x0000A17801435AD1 AS DateTime))
INSERT [dbo].[Users] ([ApplicationId], [UserId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'b5d1c451-336d-48c3-ba16-fd4cfbbf9590', N'107590386', 0, CAST(0x0000A1780148EE4A AS DateTime))
INSERT [dbo].[Users] ([ApplicationId], [UserId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'11ba13b7-7df8-437a-bdaf-fe0d065212b4', N'106560544', 0, CAST(0x0000A1660164075D AS DateTime))
INSERT [dbo].[Users] ([ApplicationId], [UserId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'e64445cd-3d1d-4101-99dc-fefbc3b7173d', N'700840152', 0, CAST(0x0000A17F01048AAD AS DateTime))
/****** Object:  Table [dbo].[Scheme]    Script Date: 04/01/2013 10:27:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Scheme]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Scheme](
	[SchemeID] [uniqueidentifier] NOT NULL,
	[Name] [varchar](120) NULL,
	[Description] [varchar](120) NOT NULL,
	[OwnerUserId] [uniqueidentifier] NULL,
	[CoordinatorUserId] [uniqueidentifier] NULL,
	[ModalityID] [uniqueidentifier] NULL,
	[InsertDate] [datetime] NULL,
	[InsertUserID] [uniqueidentifier] NULL,
	[ModifyDate] [datetime] NULL,
	[ModifyUserID] [uniqueidentifier] NULL,
	[IpAddress] [varchar](200) NULL,
 CONSTRAINT [PK_Scheme] PRIMARY KEY CLUSTERED 
(
	[SchemeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Scheme] ([SchemeID], [Name], [Description], [OwnerUserId], [CoordinatorUserId], [ModalityID], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress]) VALUES (N'26fd5b63-130b-42c9-881b-0d3c1f811db9', N'Valoración de Aplicativos', N'Valoración de aplicativo - FundaTEC Matrícula', N'8f87f558-3180-4920-b872-ec5962ffe2ca', N'8f87f558-3180-4920-b872-ec5962ffe2ca', N'12eafede-371a-4ddd-8799-08f78c026401', CAST(0x0000A18500000000 AS DateTime), N'22e466ed-5b35-4734-89e9-cc2b9ec3e55a', NULL, NULL, N'172.17.7.10')
INSERT [dbo].[Scheme] ([SchemeID], [Name], [Description], [OwnerUserId], [CoordinatorUserId], [ModalityID], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress]) VALUES (N'a9283525-c52b-4446-ab7f-452b55184341', N'Técnico Asesor de Seguros del INS', N'Forma y capacita a asesores de seguros del INS', N'11ba13b7-7df8-437a-bdaf-fe0d065212b4', N'11ba13b7-7df8-437a-bdaf-fe0d065212b4', N'6deb6676-6399-4c7b-a5c1-bb082c4ac391', CAST(0x0000A17F00000000 AS DateTime), N'09e4d1cd-a983-432a-80a9-2fc910e920d2', NULL, NULL, N'172.26.94.204')
INSERT [dbo].[Scheme] ([SchemeID], [Name], [Description], [OwnerUserId], [CoordinatorUserId], [ModalityID], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress]) VALUES (N'af9343aa-b8cf-4d19-9600-c21896e640aa', N'test', N'test', N'11ba13b7-7df8-437a-bdaf-fe0d065212b4', N'11ba13b7-7df8-437a-bdaf-fe0d065212b4', N'6deb6676-6399-4c7b-a5c1-bb082c4ac391', CAST(0x0000A17D00000000 AS DateTime), N'22e466ed-5b35-4734-89e9-cc2b9ec3e55a', NULL, NULL, N'172.26.52.168')
INSERT [dbo].[Scheme] ([SchemeID], [Name], [Description], [OwnerUserId], [CoordinatorUserId], [ModalityID], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress]) VALUES (N'7a899884-43e2-4141-94fa-dee8dd57cbe5', N'Valoración de Aplicativos', N'Programa de prueba kortega', N'11ba13b7-7df8-437a-bdaf-fe0d065212b4', N'11ba13b7-7df8-437a-bdaf-fe0d065212b4', N'12eafede-371a-4ddd-8799-08f78c026401', CAST(0x0000A18800000000 AS DateTime), N'c8f318ea-34f0-4260-ba62-8f2e92949939', NULL, NULL, N'172.26.80.212')
/****** Object:  Table [dbo].[Roles]    Script Date: 04/01/2013 10:27:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Roles]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Roles](
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[RoleId] [uniqueidentifier] NOT NULL,
	[RoleName] [nvarchar](256) NOT NULL,
	[Description] [nvarchar](256) NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
INSERT [dbo].[Roles] ([ApplicationId], [RoleId], [RoleName], [Description]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'f7eb53b9-27bd-4183-bfda-01f8381eb398', N'ROLE_STUDENT', N'Student Role')
INSERT [dbo].[Roles] ([ApplicationId], [RoleId], [RoleName], [Description]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'072e2b75-9080-4b89-b82e-1598b29b9e86', N'ROLE_SCHOOL_ADMIN', N'School Administrator')
INSERT [dbo].[Roles] ([ApplicationId], [RoleId], [RoleName], [Description]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'0698ce6c-1e89-4631-a529-2f94db43a3a9', N'ROLE_TEACHER', N'Teacher')
INSERT [dbo].[Roles] ([ApplicationId], [RoleId], [RoleName], [Description]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'1aaed1ec-bde1-4804-9a8d-47e1f9d6f5a3', N'ROLE_COORDINATOR', N'Coordinator Role')
INSERT [dbo].[Roles] ([ApplicationId], [RoleId], [RoleName], [Description]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'272a27f1-8813-43f5-be8b-5028b8bfa003', N'ROLE_ADMINISTRATOR', N'Super Administrator')
INSERT [dbo].[Roles] ([ApplicationId], [RoleId], [RoleName], [Description]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'3939e289-91d1-44bd-9b15-559af02bb287', N'ROLE_AUDITOR', N'Auditor Role')
/****** Object:  View [dbo].[RequirementDetails]    Script Date: 04/01/2013 10:27:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[RequirementDetails]'))
EXEC dbo.sp_executesql @statement = N'
CREATE VIEW [dbo].[RequirementDetails]
AS
SELECT	r.RequirementID,
		r.Name,
		r.TypeID,
		t.Name TypeName
FROM Requirement r
INNER JOIN [Type] t ON r.TypeID= t.TypeID
'
GO
/****** Object:  Table [dbo].[Score]    Script Date: 04/01/2013 10:27:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Score]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Score](
	[ScoreID] [uniqueidentifier] NOT NULL,
	[CourseID] [uniqueidentifier] NOT NULL,
	[StudentID] [uniqueidentifier] NULL,
	[Result] [varchar](50) NULL,
	[InsertDate] [datetime] NULL,
	[InsertUserID] [uniqueidentifier] NULL,
	[ModifyDate] [datetime] NULL,
	[ModifyUserID] [uniqueidentifier] NULL,
	[IpAddress] [varchar](200) NULL,
 CONSTRAINT [PK_Score] PRIMARY KEY CLUSTERED 
(
	[ScoreID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Enrollment]    Script Date: 04/01/2013 10:27:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Enrollment]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Enrollment](
	[EnrollmentID] [uniqueidentifier] NOT NULL,
	[Description] [varchar](120) NOT NULL,
	[PlanID] [uniqueidentifier] NOT NULL,
	[InsertDate] [datetime] NULL,
	[InsertUserID] [uniqueidentifier] NULL,
	[ModifyDate] [datetime] NULL,
	[ModifyUserID] [uniqueidentifier] NULL,
	[IpAddress] [varchar](200) NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[ExtraStartDate] [datetime] NULL,
	[ExtraEndDate] [datetime] NULL,
	[VerifyDates] [bit] NOT NULL,
	[LocationID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_Enrollment] PRIMARY KEY CLUSTERED 
(
	[EnrollmentID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Enrollment] ([EnrollmentID], [Description], [PlanID], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress], [StartDate], [EndDate], [ExtraStartDate], [ExtraEndDate], [VerifyDates], [LocationID]) VALUES (N'91900012-b6ae-4edd-b045-0d9afea581e2', N'Primer semestre 2013 ', N'1693316d-2be7-4e10-8cb8-8dcdb2025876', CAST(0x0000A18C00000000 AS DateTime), N'22e466ed-5b35-4734-89e9-cc2b9ec3e55a', CAST(0x0000A19300000000 AS DateTime), N'22e466ed-5b35-4734-89e9-cc2b9ec3e55a', N'172.26.52.168', CAST(0x0000A13F00000000 AS DateTime), CAST(0x0000A14300000000 AS DateTime), CAST(0x0000A14600000000 AS DateTime), CAST(0x0000A14700000000 AS DateTime), 0, N'9b72a256-a6be-4928-9ae2-12e7a45bc0dc')
/****** Object:  Table [dbo].[Course-Requirement]    Script Date: 04/01/2013 10:27:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Course-Requirement]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Course-Requirement](
	[RequirementID] [uniqueidentifier] NOT NULL,
	[CourseID] [uniqueidentifier] NOT NULL,
	[InsertDate] [datetime] NULL,
	[InsertUserID] [uniqueidentifier] NULL,
	[ModifyDate] [datetime] NULL,
	[ModifyUserID] [uniqueidentifier] NULL,
	[IpAddress] [varchar](200) NULL
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Plan-Course]    Script Date: 04/01/2013 10:27:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Plan-Course]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Plan-Course](
	[PlanID] [uniqueidentifier] NOT NULL,
	[CourseID] [uniqueidentifier] NOT NULL,
	[InsertDate] [datetime] NULL,
	[InsertUserID] [uniqueidentifier] NULL,
	[ModifyDate] [datetime] NULL,
	[ModifyUserID] [uniqueidentifier] NULL,
	[IpAddress] [varchar](200) NULL,
 CONSTRAINT [PK_Plan-Course] PRIMARY KEY CLUSTERED 
(
	[PlanID] ASC,
	[CourseID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Plan-Course] ([PlanID], [CourseID], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress]) VALUES (N'1693316d-2be7-4e10-8cb8-8dcdb2025876', N'66471d8a-d930-4dff-ad7f-1fe5ced5b5cf', CAST(0x0000A18800000000 AS DateTime), N'c8f318ea-34f0-4260-ba62-8f2e92949939', NULL, NULL, N'172.26.80.212')
INSERT [dbo].[Plan-Course] ([PlanID], [CourseID], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress]) VALUES (N'1693316d-2be7-4e10-8cb8-8dcdb2025876', N'c906cbce-6f38-4b59-bd59-477ae36ebc2f', CAST(0x0000A18800000000 AS DateTime), N'c8f318ea-34f0-4260-ba62-8f2e92949939', NULL, NULL, N'172.26.80.212')
INSERT [dbo].[Plan-Course] ([PlanID], [CourseID], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress]) VALUES (N'1693316d-2be7-4e10-8cb8-8dcdb2025876', N'5e4ff0d3-9043-400e-919d-cccf818922c4', CAST(0x0000A18800000000 AS DateTime), N'c8f318ea-34f0-4260-ba62-8f2e92949939', NULL, NULL, N'172.26.80.212')
INSERT [dbo].[Plan-Course] ([PlanID], [CourseID], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress]) VALUES (N'd53bcd0b-cd9e-4a1a-97eb-ca6c90f3fb7e', N'3afea159-af71-41ac-b612-0d67e741e76f', CAST(0x0000A18C00000000 AS DateTime), N'22e466ed-5b35-4734-89e9-cc2b9ec3e55a', NULL, NULL, N'172.26.52.168')
INSERT [dbo].[Plan-Course] ([PlanID], [CourseID], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress]) VALUES (N'd53bcd0b-cd9e-4a1a-97eb-ca6c90f3fb7e', N'60e2423a-1343-42b3-ba16-4698617bb0b8', CAST(0x0000A18C00000000 AS DateTime), N'22e466ed-5b35-4734-89e9-cc2b9ec3e55a', NULL, NULL, N'172.26.52.168')
INSERT [dbo].[Plan-Course] ([PlanID], [CourseID], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress]) VALUES (N'd53bcd0b-cd9e-4a1a-97eb-ca6c90f3fb7e', N'14407170-1495-4cde-95ba-5a2bbf54391a', CAST(0x0000A18C00000000 AS DateTime), N'22e466ed-5b35-4734-89e9-cc2b9ec3e55a', NULL, NULL, N'172.26.52.168')
INSERT [dbo].[Plan-Course] ([PlanID], [CourseID], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress]) VALUES (N'd53bcd0b-cd9e-4a1a-97eb-ca6c90f3fb7e', N'e3dd19d5-cb96-41c1-abd3-5b9a12176066', CAST(0x0000A18C00000000 AS DateTime), N'22e466ed-5b35-4734-89e9-cc2b9ec3e55a', NULL, NULL, N'172.26.52.168')
INSERT [dbo].[Plan-Course] ([PlanID], [CourseID], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress]) VALUES (N'd53bcd0b-cd9e-4a1a-97eb-ca6c90f3fb7e', N'60bc2970-b709-4de3-bfbe-7701dafc0b86', CAST(0x0000A18C00000000 AS DateTime), N'22e466ed-5b35-4734-89e9-cc2b9ec3e55a', NULL, NULL, N'172.26.52.168')
INSERT [dbo].[Plan-Course] ([PlanID], [CourseID], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress]) VALUES (N'd53bcd0b-cd9e-4a1a-97eb-ca6c90f3fb7e', N'20be1a4a-ed96-4d0b-a692-7f15dee8979b', CAST(0x0000A18C00000000 AS DateTime), N'22e466ed-5b35-4734-89e9-cc2b9ec3e55a', NULL, NULL, N'172.26.52.168')
INSERT [dbo].[Plan-Course] ([PlanID], [CourseID], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress]) VALUES (N'd53bcd0b-cd9e-4a1a-97eb-ca6c90f3fb7e', N'7b034ff3-a24a-4ca7-99c6-8157b12743f4', CAST(0x0000A18C00000000 AS DateTime), N'22e466ed-5b35-4734-89e9-cc2b9ec3e55a', NULL, NULL, N'172.26.52.168')
INSERT [dbo].[Plan-Course] ([PlanID], [CourseID], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress]) VALUES (N'd53bcd0b-cd9e-4a1a-97eb-ca6c90f3fb7e', N'837b2666-9de9-4df2-8cbb-8ddb6c431b2e', CAST(0x0000A18C00000000 AS DateTime), N'22e466ed-5b35-4734-89e9-cc2b9ec3e55a', NULL, NULL, N'172.26.52.168')
INSERT [dbo].[Plan-Course] ([PlanID], [CourseID], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress]) VALUES (N'd53bcd0b-cd9e-4a1a-97eb-ca6c90f3fb7e', N'9e10143f-3e83-4288-86f5-9daa3361d0ac', CAST(0x0000A18C00000000 AS DateTime), N'22e466ed-5b35-4734-89e9-cc2b9ec3e55a', NULL, NULL, N'172.26.52.168')
INSERT [dbo].[Plan-Course] ([PlanID], [CourseID], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress]) VALUES (N'd53bcd0b-cd9e-4a1a-97eb-ca6c90f3fb7e', N'd05ca21e-f5d5-4d63-b310-a5b819147ae3', CAST(0x0000A18C00000000 AS DateTime), N'22e466ed-5b35-4734-89e9-cc2b9ec3e55a', NULL, NULL, N'172.26.52.168')
INSERT [dbo].[Plan-Course] ([PlanID], [CourseID], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress]) VALUES (N'd53bcd0b-cd9e-4a1a-97eb-ca6c90f3fb7e', N'242a7659-ffff-4c8a-8d4f-afa427a60b08', CAST(0x0000A18C00000000 AS DateTime), N'22e466ed-5b35-4734-89e9-cc2b9ec3e55a', NULL, NULL, N'172.26.52.168')
INSERT [dbo].[Plan-Course] ([PlanID], [CourseID], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress]) VALUES (N'd53bcd0b-cd9e-4a1a-97eb-ca6c90f3fb7e', N'f8064532-8dbe-46c2-ba16-ba5c7b407cb5', CAST(0x0000A18C00000000 AS DateTime), N'22e466ed-5b35-4734-89e9-cc2b9ec3e55a', NULL, NULL, N'172.26.52.168')
INSERT [dbo].[Plan-Course] ([PlanID], [CourseID], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress]) VALUES (N'd53bcd0b-cd9e-4a1a-97eb-ca6c90f3fb7e', N'9c022ba3-64e9-4921-936d-bbb8b7057128', CAST(0x0000A18C00000000 AS DateTime), N'22e466ed-5b35-4734-89e9-cc2b9ec3e55a', NULL, NULL, N'172.26.52.168')
INSERT [dbo].[Plan-Course] ([PlanID], [CourseID], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress]) VALUES (N'd53bcd0b-cd9e-4a1a-97eb-ca6c90f3fb7e', N'4d4d7b9a-d279-41fc-a699-dc693ad1490d', CAST(0x0000A18C00000000 AS DateTime), N'22e466ed-5b35-4734-89e9-cc2b9ec3e55a', NULL, NULL, N'172.26.52.168')
INSERT [dbo].[Plan-Course] ([PlanID], [CourseID], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress]) VALUES (N'd53bcd0b-cd9e-4a1a-97eb-ca6c90f3fb7e', N'8aea151e-8e9c-4870-82a2-e8f711c53f93', CAST(0x0000A18C00000000 AS DateTime), N'22e466ed-5b35-4734-89e9-cc2b9ec3e55a', NULL, NULL, N'172.26.52.168')
/****** Object:  StoredProcedure [dbo].[uspUserNameUpdate]    Script Date: 04/01/2013 10:27:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[uspUserNameUpdate]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		Berman Romero
-- Create date: 03-Febrero-2013
-- Description:	Update username, table: User
-- =============================================
CREATE PROCEDURE [dbo].[uspUserNameUpdate]
	@UserNameOld nvarchar(100), @UserNameNew nvarchar(100)
AS
BEGIN
	SET NOCOUNT ON;
	
	UPDATE dbo.Users
		SET UserName = @UserNameNew
	WHERE UserName = @UserNameOld
	
	SET NOCOUNT OFF;
END
' 
END
GO
/****** Object:  StoredProcedure [dbo].[uspRetrieveUserID]    Script Date: 04/01/2013 10:27:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[uspRetrieveUserID]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		Berman Romero
-- Create date: 17-Febrero-2013
-- Description:	Retrieve UserID, table: User
-- =============================================
CREATE PROCEDURE [dbo].[uspRetrieveUserID]
	@UserName nvarchar(100)
AS
BEGIN
	SET NOCOUNT ON;
	
	SELECT
		UserId 
	FROM dbo.Users
	WHERE UserName = @UserName
	
	SET NOCOUNT OFF;
END
' 
END
GO
/****** Object:  Table [dbo].[UsersInRoles]    Script Date: 04/01/2013 10:27:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UsersInRoles]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[UsersInRoles](
	[UserId] [uniqueidentifier] NOT NULL,
	[RoleId] [uniqueidentifier] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
INSERT [dbo].[UsersInRoles] ([UserId], [RoleId]) VALUES (N'f5a32da9-8a3e-4d62-8df1-03e046058bf7', N'f7eb53b9-27bd-4183-bfda-01f8381eb398')
INSERT [dbo].[UsersInRoles] ([UserId], [RoleId]) VALUES (N'af29b636-918e-4430-8db3-0a0df4c07170', N'f7eb53b9-27bd-4183-bfda-01f8381eb398')
INSERT [dbo].[UsersInRoles] ([UserId], [RoleId]) VALUES (N'a9991d74-8e56-4018-87ba-0dc3501084e2', N'f7eb53b9-27bd-4183-bfda-01f8381eb398')
INSERT [dbo].[UsersInRoles] ([UserId], [RoleId]) VALUES (N'21853167-8ff5-473f-af25-125ce330e894', N'f7eb53b9-27bd-4183-bfda-01f8381eb398')
INSERT [dbo].[UsersInRoles] ([UserId], [RoleId]) VALUES (N'a8f3c61e-6fcb-4274-b82c-147b38771f22', N'f7eb53b9-27bd-4183-bfda-01f8381eb398')
INSERT [dbo].[UsersInRoles] ([UserId], [RoleId]) VALUES (N'9d1241d3-d8a4-48b7-8edc-147c3a538a25', N'f7eb53b9-27bd-4183-bfda-01f8381eb398')
INSERT [dbo].[UsersInRoles] ([UserId], [RoleId]) VALUES (N'f1d11c86-1f1c-4a7e-8a3d-1ceb670134d4', N'f7eb53b9-27bd-4183-bfda-01f8381eb398')
INSERT [dbo].[UsersInRoles] ([UserId], [RoleId]) VALUES (N'4f7dfd20-ed18-4e16-9e3b-1ef7b799c7e5', N'f7eb53b9-27bd-4183-bfda-01f8381eb398')
INSERT [dbo].[UsersInRoles] ([UserId], [RoleId]) VALUES (N'7d78347a-ca15-481d-a2e2-20eba97e63db', N'f7eb53b9-27bd-4183-bfda-01f8381eb398')
INSERT [dbo].[UsersInRoles] ([UserId], [RoleId]) VALUES (N'61409b3f-51d2-49d6-a1e4-21e3cc46b0f6', N'f7eb53b9-27bd-4183-bfda-01f8381eb398')
INSERT [dbo].[UsersInRoles] ([UserId], [RoleId]) VALUES (N'd8140bf3-8511-4272-816e-2762228539dc', N'f7eb53b9-27bd-4183-bfda-01f8381eb398')
INSERT [dbo].[UsersInRoles] ([UserId], [RoleId]) VALUES (N'f7b84ea1-5c2a-49f0-98a5-279a3ace876e', N'f7eb53b9-27bd-4183-bfda-01f8381eb398')
INSERT [dbo].[UsersInRoles] ([UserId], [RoleId]) VALUES (N'ee615fc7-6c4c-4d6c-b468-27fff6d62a55', N'f7eb53b9-27bd-4183-bfda-01f8381eb398')
INSERT [dbo].[UsersInRoles] ([UserId], [RoleId]) VALUES (N'ebb71c3e-be87-49cd-9171-2bd780a6072f', N'f7eb53b9-27bd-4183-bfda-01f8381eb398')
INSERT [dbo].[UsersInRoles] ([UserId], [RoleId]) VALUES (N'52424689-6925-403a-84a0-2c210ba4ac97', N'f7eb53b9-27bd-4183-bfda-01f8381eb398')
INSERT [dbo].[UsersInRoles] ([UserId], [RoleId]) VALUES (N'0d122016-8c8c-4716-800e-2d6ca55e5035', N'f7eb53b9-27bd-4183-bfda-01f8381eb398')
INSERT [dbo].[UsersInRoles] ([UserId], [RoleId]) VALUES (N'bfb77445-7c40-4e88-900d-2f29aaa303e6', N'f7eb53b9-27bd-4183-bfda-01f8381eb398')
INSERT [dbo].[UsersInRoles] ([UserId], [RoleId]) VALUES (N'ea8fd4a1-b420-492e-9769-2f47948310d1', N'f7eb53b9-27bd-4183-bfda-01f8381eb398')
INSERT [dbo].[UsersInRoles] ([UserId], [RoleId]) VALUES (N'1469f96d-0236-4ce3-bf26-2f6d74e3e8c6', N'f7eb53b9-27bd-4183-bfda-01f8381eb398')
INSERT [dbo].[UsersInRoles] ([UserId], [RoleId]) VALUES (N'09e4d1cd-a983-432a-80a9-2fc910e920d2', N'072e2b75-9080-4b89-b82e-1598b29b9e86')
INSERT [dbo].[UsersInRoles] ([UserId], [RoleId]) VALUES (N'5f7a4b47-a645-45d6-bd60-31353e1aeb70', N'f7eb53b9-27bd-4183-bfda-01f8381eb398')
INSERT [dbo].[UsersInRoles] ([UserId], [RoleId]) VALUES (N'1219d423-677e-4d32-83e2-365a3335aa98', N'f7eb53b9-27bd-4183-bfda-01f8381eb398')
INSERT [dbo].[UsersInRoles] ([UserId], [RoleId]) VALUES (N'41ac46b2-d777-4a88-933a-3697f42d8a6d', N'f7eb53b9-27bd-4183-bfda-01f8381eb398')
INSERT [dbo].[UsersInRoles] ([UserId], [RoleId]) VALUES (N'591a302b-99bb-470a-ae1e-3813d24e9173', N'f7eb53b9-27bd-4183-bfda-01f8381eb398')
INSERT [dbo].[UsersInRoles] ([UserId], [RoleId]) VALUES (N'e6eca7c1-e3b8-48e8-90ea-381f6bd7d1f1', N'f7eb53b9-27bd-4183-bfda-01f8381eb398')
INSERT [dbo].[UsersInRoles] ([UserId], [RoleId]) VALUES (N'6f94a283-e581-4378-ac39-38236a3d47f3', N'f7eb53b9-27bd-4183-bfda-01f8381eb398')
INSERT [dbo].[UsersInRoles] ([UserId], [RoleId]) VALUES (N'961f6a8a-a094-4036-98a1-39c686eecf3f', N'f7eb53b9-27bd-4183-bfda-01f8381eb398')
INSERT [dbo].[UsersInRoles] ([UserId], [RoleId]) VALUES (N'556e3fd5-4f0a-4601-8f26-3a091566b667', N'f7eb53b9-27bd-4183-bfda-01f8381eb398')
INSERT [dbo].[UsersInRoles] ([UserId], [RoleId]) VALUES (N'9ea890aa-35c5-4984-a1ed-3aba1df217c9', N'f7eb53b9-27bd-4183-bfda-01f8381eb398')
INSERT [dbo].[UsersInRoles] ([UserId], [RoleId]) VALUES (N'94222b2b-db37-432f-86f7-3f04b7b33a67', N'f7eb53b9-27bd-4183-bfda-01f8381eb398')
INSERT [dbo].[UsersInRoles] ([UserId], [RoleId]) VALUES (N'0f1c0606-d31b-472e-87a4-3fa7997f7d4f', N'f7eb53b9-27bd-4183-bfda-01f8381eb398')
INSERT [dbo].[UsersInRoles] ([UserId], [RoleId]) VALUES (N'1a30aaca-edec-4200-9a1e-41fdd5ba817d', N'f7eb53b9-27bd-4183-bfda-01f8381eb398')
INSERT [dbo].[UsersInRoles] ([UserId], [RoleId]) VALUES (N'60488e1b-9b99-4ef5-8339-4340748067c5', N'f7eb53b9-27bd-4183-bfda-01f8381eb398')
INSERT [dbo].[UsersInRoles] ([UserId], [RoleId]) VALUES (N'ac104041-4bd2-4d5b-af9e-4388bbb70f26', N'f7eb53b9-27bd-4183-bfda-01f8381eb398')
INSERT [dbo].[UsersInRoles] ([UserId], [RoleId]) VALUES (N'abb6ed1d-85f0-4cf4-9587-469116e56d3b', N'f7eb53b9-27bd-4183-bfda-01f8381eb398')
INSERT [dbo].[UsersInRoles] ([UserId], [RoleId]) VALUES (N'16e4f7d8-62a4-4452-836e-46f3518d5088', N'f7eb53b9-27bd-4183-bfda-01f8381eb398')
INSERT [dbo].[UsersInRoles] ([UserId], [RoleId]) VALUES (N'ee7735f6-3179-4b91-a3cf-4961de469d80', N'f7eb53b9-27bd-4183-bfda-01f8381eb398')
INSERT [dbo].[UsersInRoles] ([UserId], [RoleId]) VALUES (N'dee40288-21b5-4de5-a167-4e0053d56216', N'f7eb53b9-27bd-4183-bfda-01f8381eb398')
INSERT [dbo].[UsersInRoles] ([UserId], [RoleId]) VALUES (N'529d4a33-bd11-472e-8505-502c5142ce33', N'f7eb53b9-27bd-4183-bfda-01f8381eb398')
INSERT [dbo].[UsersInRoles] ([UserId], [RoleId]) VALUES (N'26918a5e-74c6-4f0d-a7e5-52c19b739e18', N'f7eb53b9-27bd-4183-bfda-01f8381eb398')
INSERT [dbo].[UsersInRoles] ([UserId], [RoleId]) VALUES (N'7a88f8e9-ffed-4276-b54a-52efb30977d0', N'f7eb53b9-27bd-4183-bfda-01f8381eb398')
INSERT [dbo].[UsersInRoles] ([UserId], [RoleId]) VALUES (N'4595be71-2715-40dc-8c14-54780ece4f8f', N'f7eb53b9-27bd-4183-bfda-01f8381eb398')
INSERT [dbo].[UsersInRoles] ([UserId], [RoleId]) VALUES (N'2c45487c-8348-462c-b2d4-55d6c28a9b29', N'f7eb53b9-27bd-4183-bfda-01f8381eb398')
INSERT [dbo].[UsersInRoles] ([UserId], [RoleId]) VALUES (N'9ed2f2d1-a18c-4735-82fe-5696294a188d', N'f7eb53b9-27bd-4183-bfda-01f8381eb398')
INSERT [dbo].[UsersInRoles] ([UserId], [RoleId]) VALUES (N'2e8f409d-3679-42eb-b5e4-583871bc0918', N'f7eb53b9-27bd-4183-bfda-01f8381eb398')
INSERT [dbo].[UsersInRoles] ([UserId], [RoleId]) VALUES (N'124f8cbe-09f5-4b97-90d8-591c534cb6d7', N'f7eb53b9-27bd-4183-bfda-01f8381eb398')
INSERT [dbo].[UsersInRoles] ([UserId], [RoleId]) VALUES (N'0a0f5d8e-9a39-4c12-8d7d-5a5a684a8096', N'f7eb53b9-27bd-4183-bfda-01f8381eb398')
INSERT [dbo].[UsersInRoles] ([UserId], [RoleId]) VALUES (N'02a769e4-464c-40a3-97c7-5bbf99a241e2', N'f7eb53b9-27bd-4183-bfda-01f8381eb398')
INSERT [dbo].[UsersInRoles] ([UserId], [RoleId]) VALUES (N'81cfa0f1-e28b-48e4-90c5-5da8416d2128', N'f7eb53b9-27bd-4183-bfda-01f8381eb398')
INSERT [dbo].[UsersInRoles] ([UserId], [RoleId]) VALUES (N'c5e0e5f9-47fa-4edf-be9f-5db949700d1a', N'f7eb53b9-27bd-4183-bfda-01f8381eb398')
INSERT [dbo].[UsersInRoles] ([UserId], [RoleId]) VALUES (N'863ee975-9a5b-4321-9ea7-5dc2405ad0bb', N'f7eb53b9-27bd-4183-bfda-01f8381eb398')
INSERT [dbo].[UsersInRoles] ([UserId], [RoleId]) VALUES (N'031d2478-538b-4bf8-b8ba-5debe84de076', N'f7eb53b9-27bd-4183-bfda-01f8381eb398')
INSERT [dbo].[UsersInRoles] ([UserId], [RoleId]) VALUES (N'502844ea-ade5-4fff-aa26-5ec6fd5892a6', N'f7eb53b9-27bd-4183-bfda-01f8381eb398')
INSERT [dbo].[UsersInRoles] ([UserId], [RoleId]) VALUES (N'a8ea54b7-1a19-4eee-8f4b-60dc08090b2c', N'f7eb53b9-27bd-4183-bfda-01f8381eb398')
INSERT [dbo].[UsersInRoles] ([UserId], [RoleId]) VALUES (N'28d9cc12-7efe-4fb9-a2d4-6126dd744408', N'f7eb53b9-27bd-4183-bfda-01f8381eb398')
INSERT [dbo].[UsersInRoles] ([UserId], [RoleId]) VALUES (N'aa323aaa-7184-46e8-8605-616e0a15119b', N'f7eb53b9-27bd-4183-bfda-01f8381eb398')
INSERT [dbo].[UsersInRoles] ([UserId], [RoleId]) VALUES (N'a93929d6-1a02-4e5f-bd6b-61f4a86f77dc', N'f7eb53b9-27bd-4183-bfda-01f8381eb398')
INSERT [dbo].[UsersInRoles] ([UserId], [RoleId]) VALUES (N'28e6cadd-6359-4741-a46c-6304d83688f2', N'f7eb53b9-27bd-4183-bfda-01f8381eb398')
INSERT [dbo].[UsersInRoles] ([UserId], [RoleId]) VALUES (N'8209ebd5-c679-4da3-8630-6659f205d5ca', N'f7eb53b9-27bd-4183-bfda-01f8381eb398')
INSERT [dbo].[UsersInRoles] ([UserId], [RoleId]) VALUES (N'991ba8ed-ddba-43ff-8722-66c228c0f074', N'f7eb53b9-27bd-4183-bfda-01f8381eb398')
INSERT [dbo].[UsersInRoles] ([UserId], [RoleId]) VALUES (N'c1f24856-782a-440c-8d6a-671c1c40958a', N'f7eb53b9-27bd-4183-bfda-01f8381eb398')
INSERT [dbo].[UsersInRoles] ([UserId], [RoleId]) VALUES (N'f4dce8b4-7185-43a1-9ff3-67baed6a54b3', N'f7eb53b9-27bd-4183-bfda-01f8381eb398')
INSERT [dbo].[UsersInRoles] ([UserId], [RoleId]) VALUES (N'7ebedf80-05f9-4639-bd3f-68bb8b906a46', N'f7eb53b9-27bd-4183-bfda-01f8381eb398')
INSERT [dbo].[UsersInRoles] ([UserId], [RoleId]) VALUES (N'2903b52f-bd35-4f65-ab73-6b376d770db3', N'f7eb53b9-27bd-4183-bfda-01f8381eb398')
INSERT [dbo].[UsersInRoles] ([UserId], [RoleId]) VALUES (N'f8adccc3-3494-4408-b822-6c50f60e7c0e', N'f7eb53b9-27bd-4183-bfda-01f8381eb398')
INSERT [dbo].[UsersInRoles] ([UserId], [RoleId]) VALUES (N'8b185310-8774-493b-a1ad-6e58c789e4b9', N'f7eb53b9-27bd-4183-bfda-01f8381eb398')
INSERT [dbo].[UsersInRoles] ([UserId], [RoleId]) VALUES (N'04622c29-cc0f-4876-9f0c-70266450200f', N'072e2b75-9080-4b89-b82e-1598b29b9e86')
INSERT [dbo].[UsersInRoles] ([UserId], [RoleId]) VALUES (N'3096d7b8-f414-4100-896b-704dcae0e617', N'072e2b75-9080-4b89-b82e-1598b29b9e86')
INSERT [dbo].[UsersInRoles] ([UserId], [RoleId]) VALUES (N'75674a63-d6dc-42f8-b861-73aca8bf8067', N'f7eb53b9-27bd-4183-bfda-01f8381eb398')
INSERT [dbo].[UsersInRoles] ([UserId], [RoleId]) VALUES (N'ee65af32-888a-481e-9658-766438ae89b5', N'f7eb53b9-27bd-4183-bfda-01f8381eb398')
INSERT [dbo].[UsersInRoles] ([UserId], [RoleId]) VALUES (N'eb9933c8-3bb7-45d2-815e-78508083ffad', N'f7eb53b9-27bd-4183-bfda-01f8381eb398')
INSERT [dbo].[UsersInRoles] ([UserId], [RoleId]) VALUES (N'92d1923c-983b-49fd-ac66-7a264f3cc017', N'f7eb53b9-27bd-4183-bfda-01f8381eb398')
INSERT [dbo].[UsersInRoles] ([UserId], [RoleId]) VALUES (N'ea40bef2-f9f6-4f71-a375-7d4ea3f645e2', N'f7eb53b9-27bd-4183-bfda-01f8381eb398')
INSERT [dbo].[UsersInRoles] ([UserId], [RoleId]) VALUES (N'280e4de7-8322-4e0d-a8a7-7ddb98ae94a1', N'f7eb53b9-27bd-4183-bfda-01f8381eb398')
INSERT [dbo].[UsersInRoles] ([UserId], [RoleId]) VALUES (N'35463446-1c00-4652-8285-7dde516c0820', N'f7eb53b9-27bd-4183-bfda-01f8381eb398')
INSERT [dbo].[UsersInRoles] ([UserId], [RoleId]) VALUES (N'e377ff73-a125-4f9e-99a7-7e301eee749d', N'f7eb53b9-27bd-4183-bfda-01f8381eb398')
INSERT [dbo].[UsersInRoles] ([UserId], [RoleId]) VALUES (N'1403268e-d6d7-46e4-a3f2-7ec2f299253c', N'f7eb53b9-27bd-4183-bfda-01f8381eb398')
INSERT [dbo].[UsersInRoles] ([UserId], [RoleId]) VALUES (N'40390a71-7344-47b5-bbd0-830addeb12ff', N'f7eb53b9-27bd-4183-bfda-01f8381eb398')
INSERT [dbo].[UsersInRoles] ([UserId], [RoleId]) VALUES (N'd9a71fd7-6cad-4ba1-b98f-83b4d7d330d4', N'f7eb53b9-27bd-4183-bfda-01f8381eb398')
INSERT [dbo].[UsersInRoles] ([UserId], [RoleId]) VALUES (N'506c0f75-8b9b-429e-bbfb-84a0fbdf8281', N'f7eb53b9-27bd-4183-bfda-01f8381eb398')
INSERT [dbo].[UsersInRoles] ([UserId], [RoleId]) VALUES (N'9ca29c27-2a95-4324-a751-8588b71a0a07', N'f7eb53b9-27bd-4183-bfda-01f8381eb398')
INSERT [dbo].[UsersInRoles] ([UserId], [RoleId]) VALUES (N'2e4798d2-bb68-40a1-80e1-86f76b450bb6', N'f7eb53b9-27bd-4183-bfda-01f8381eb398')
INSERT [dbo].[UsersInRoles] ([UserId], [RoleId]) VALUES (N'e080409a-d29f-424e-aae2-8a6237a0e748', N'f7eb53b9-27bd-4183-bfda-01f8381eb398')
INSERT [dbo].[UsersInRoles] ([UserId], [RoleId]) VALUES (N'02b6e53a-ec02-42c7-8e52-8a70e1a458c5', N'f7eb53b9-27bd-4183-bfda-01f8381eb398')
INSERT [dbo].[UsersInRoles] ([UserId], [RoleId]) VALUES (N'c79ab146-7cfd-4e06-bccb-8b8f783aaa2c', N'f7eb53b9-27bd-4183-bfda-01f8381eb398')
INSERT [dbo].[UsersInRoles] ([UserId], [RoleId]) VALUES (N'94ea1830-6fbb-4a1f-b114-8b9cf482b0bd', N'f7eb53b9-27bd-4183-bfda-01f8381eb398')
INSERT [dbo].[UsersInRoles] ([UserId], [RoleId]) VALUES (N'6a0c4923-b1aa-44a5-9171-8d3b5399a990', N'f7eb53b9-27bd-4183-bfda-01f8381eb398')
INSERT [dbo].[UsersInRoles] ([UserId], [RoleId]) VALUES (N'c8f318ea-34f0-4260-ba62-8f2e92949939', N'272a27f1-8813-43f5-be8b-5028b8bfa003')
INSERT [dbo].[UsersInRoles] ([UserId], [RoleId]) VALUES (N'de3c64a6-2506-4b6c-b632-8f7ab298b58e', N'f7eb53b9-27bd-4183-bfda-01f8381eb398')
INSERT [dbo].[UsersInRoles] ([UserId], [RoleId]) VALUES (N'8909d7be-fcb4-431e-adcf-91484e174c16', N'f7eb53b9-27bd-4183-bfda-01f8381eb398')
INSERT [dbo].[UsersInRoles] ([UserId], [RoleId]) VALUES (N'a1c5b1c1-4398-4ef7-9479-92aec0674353', N'f7eb53b9-27bd-4183-bfda-01f8381eb398')
INSERT [dbo].[UsersInRoles] ([UserId], [RoleId]) VALUES (N'f8f88a0e-2823-45b3-8075-92cdfd5c5c87', N'f7eb53b9-27bd-4183-bfda-01f8381eb398')
INSERT [dbo].[UsersInRoles] ([UserId], [RoleId]) VALUES (N'b0d5c63d-9b55-4b94-8f1b-92cf9ffdf98f', N'f7eb53b9-27bd-4183-bfda-01f8381eb398')
INSERT [dbo].[UsersInRoles] ([UserId], [RoleId]) VALUES (N'158e7f16-d0e0-4365-b7bd-94b3cc74ec0d', N'f7eb53b9-27bd-4183-bfda-01f8381eb398')
INSERT [dbo].[UsersInRoles] ([UserId], [RoleId]) VALUES (N'd926932a-d547-488e-bdf4-96aba353557b', N'f7eb53b9-27bd-4183-bfda-01f8381eb398')
INSERT [dbo].[UsersInRoles] ([UserId], [RoleId]) VALUES (N'4eb23992-0f12-4f29-9c0a-977a572efd48', N'f7eb53b9-27bd-4183-bfda-01f8381eb398')
INSERT [dbo].[UsersInRoles] ([UserId], [RoleId]) VALUES (N'e0ae4f1a-97d9-428a-a5e6-97b403e1763b', N'f7eb53b9-27bd-4183-bfda-01f8381eb398')
INSERT [dbo].[UsersInRoles] ([UserId], [RoleId]) VALUES (N'1d304168-ccd0-4a53-9022-986f23768126', N'f7eb53b9-27bd-4183-bfda-01f8381eb398')
INSERT [dbo].[UsersInRoles] ([UserId], [RoleId]) VALUES (N'13858728-3e25-46f0-8f0b-989eb73cd7e9', N'f7eb53b9-27bd-4183-bfda-01f8381eb398')
INSERT [dbo].[UsersInRoles] ([UserId], [RoleId]) VALUES (N'8dba8e08-01a5-4381-9eac-9d998830a6df', N'f7eb53b9-27bd-4183-bfda-01f8381eb398')
INSERT [dbo].[UsersInRoles] ([UserId], [RoleId]) VALUES (N'ae9feade-aafe-470d-8882-a1c4a1813343', N'f7eb53b9-27bd-4183-bfda-01f8381eb398')
GO
print 'Processed 100 total records'
INSERT [dbo].[UsersInRoles] ([UserId], [RoleId]) VALUES (N'ac278425-2d45-43eb-89b0-a2b0651dc7ab', N'f7eb53b9-27bd-4183-bfda-01f8381eb398')
INSERT [dbo].[UsersInRoles] ([UserId], [RoleId]) VALUES (N'793a3df7-a167-4bf7-aa75-a8610d5a3e9a', N'f7eb53b9-27bd-4183-bfda-01f8381eb398')
INSERT [dbo].[UsersInRoles] ([UserId], [RoleId]) VALUES (N'66edb6e2-4812-4c8a-80db-a8fefa711510', N'f7eb53b9-27bd-4183-bfda-01f8381eb398')
INSERT [dbo].[UsersInRoles] ([UserId], [RoleId]) VALUES (N'24be72bc-9108-4bd6-bbeb-aaeeb5e757f9', N'f7eb53b9-27bd-4183-bfda-01f8381eb398')
INSERT [dbo].[UsersInRoles] ([UserId], [RoleId]) VALUES (N'a1500fb0-d2a5-44f2-97ac-ab7002763037', N'f7eb53b9-27bd-4183-bfda-01f8381eb398')
INSERT [dbo].[UsersInRoles] ([UserId], [RoleId]) VALUES (N'667f126c-cfee-4680-9230-b1275edc0da9', N'f7eb53b9-27bd-4183-bfda-01f8381eb398')
INSERT [dbo].[UsersInRoles] ([UserId], [RoleId]) VALUES (N'c8f526e4-dee3-48e8-8483-b1334a19ebc3', N'f7eb53b9-27bd-4183-bfda-01f8381eb398')
INSERT [dbo].[UsersInRoles] ([UserId], [RoleId]) VALUES (N'f2bb2f46-d293-4f75-8d91-b20809d9ef3b', N'f7eb53b9-27bd-4183-bfda-01f8381eb398')
INSERT [dbo].[UsersInRoles] ([UserId], [RoleId]) VALUES (N'595b7e7e-40bf-4053-80db-b79a684a026a', N'f7eb53b9-27bd-4183-bfda-01f8381eb398')
INSERT [dbo].[UsersInRoles] ([UserId], [RoleId]) VALUES (N'4fa1031d-8d96-4b14-a9e0-c2c849d6924a', N'f7eb53b9-27bd-4183-bfda-01f8381eb398')
INSERT [dbo].[UsersInRoles] ([UserId], [RoleId]) VALUES (N'36cd8756-c330-4073-9801-c36b483be305', N'f7eb53b9-27bd-4183-bfda-01f8381eb398')
INSERT [dbo].[UsersInRoles] ([UserId], [RoleId]) VALUES (N'ef9357d3-a6fa-4673-8c99-c36ea808a54f', N'f7eb53b9-27bd-4183-bfda-01f8381eb398')
INSERT [dbo].[UsersInRoles] ([UserId], [RoleId]) VALUES (N'8936d087-0be8-4d57-9767-c5a38f1c4b25', N'f7eb53b9-27bd-4183-bfda-01f8381eb398')
INSERT [dbo].[UsersInRoles] ([UserId], [RoleId]) VALUES (N'd39ffd63-6295-4d44-b504-c63926c4d953', N'f7eb53b9-27bd-4183-bfda-01f8381eb398')
INSERT [dbo].[UsersInRoles] ([UserId], [RoleId]) VALUES (N'd3da52df-af8d-485d-a284-c68e91caa072', N'f7eb53b9-27bd-4183-bfda-01f8381eb398')
INSERT [dbo].[UsersInRoles] ([UserId], [RoleId]) VALUES (N'16042815-f9f4-477c-9bc4-c7364088ff20', N'f7eb53b9-27bd-4183-bfda-01f8381eb398')
INSERT [dbo].[UsersInRoles] ([UserId], [RoleId]) VALUES (N'f5e2727b-1f15-4626-9b01-c8cc89dd2913', N'f7eb53b9-27bd-4183-bfda-01f8381eb398')
INSERT [dbo].[UsersInRoles] ([UserId], [RoleId]) VALUES (N'3b0b3574-321a-4dfb-b99e-c9a54db63fd6', N'f7eb53b9-27bd-4183-bfda-01f8381eb398')
INSERT [dbo].[UsersInRoles] ([UserId], [RoleId]) VALUES (N'658e7420-a9a3-4d11-a751-c9f7b6876a5d', N'f7eb53b9-27bd-4183-bfda-01f8381eb398')
INSERT [dbo].[UsersInRoles] ([UserId], [RoleId]) VALUES (N'f9f012d1-e177-47f5-bc60-ca288d780dd4', N'f7eb53b9-27bd-4183-bfda-01f8381eb398')
INSERT [dbo].[UsersInRoles] ([UserId], [RoleId]) VALUES (N'22e466ed-5b35-4734-89e9-cc2b9ec3e55a', N'272a27f1-8813-43f5-be8b-5028b8bfa003')
INSERT [dbo].[UsersInRoles] ([UserId], [RoleId]) VALUES (N'c01d504c-a20a-48f2-9a5c-ce5dfa5059c3', N'f7eb53b9-27bd-4183-bfda-01f8381eb398')
INSERT [dbo].[UsersInRoles] ([UserId], [RoleId]) VALUES (N'd594f477-dacb-414a-b34b-cf0937457b36', N'f7eb53b9-27bd-4183-bfda-01f8381eb398')
INSERT [dbo].[UsersInRoles] ([UserId], [RoleId]) VALUES (N'e87a5a50-b1da-401e-823d-d1a40d8525d5', N'f7eb53b9-27bd-4183-bfda-01f8381eb398')
INSERT [dbo].[UsersInRoles] ([UserId], [RoleId]) VALUES (N'2788dc45-794c-48e0-bdb5-d2648b35514c', N'f7eb53b9-27bd-4183-bfda-01f8381eb398')
INSERT [dbo].[UsersInRoles] ([UserId], [RoleId]) VALUES (N'cd70ba0b-58e1-458d-8dee-d2e4bbbfb1c5', N'f7eb53b9-27bd-4183-bfda-01f8381eb398')
INSERT [dbo].[UsersInRoles] ([UserId], [RoleId]) VALUES (N'42b5d6a5-d9a8-447a-be25-d5ab4c986f6a', N'f7eb53b9-27bd-4183-bfda-01f8381eb398')
INSERT [dbo].[UsersInRoles] ([UserId], [RoleId]) VALUES (N'f1753657-3333-40ba-b9af-d8ef74622721', N'f7eb53b9-27bd-4183-bfda-01f8381eb398')
INSERT [dbo].[UsersInRoles] ([UserId], [RoleId]) VALUES (N'fee6dd35-49bb-41f0-9760-d95f99b15bd1', N'f7eb53b9-27bd-4183-bfda-01f8381eb398')
INSERT [dbo].[UsersInRoles] ([UserId], [RoleId]) VALUES (N'4dc3f3d8-fa10-42e8-b625-da946e8c1f59', N'f7eb53b9-27bd-4183-bfda-01f8381eb398')
INSERT [dbo].[UsersInRoles] ([UserId], [RoleId]) VALUES (N'd4e2db0e-1291-4ded-963a-dab7babb446c', N'f7eb53b9-27bd-4183-bfda-01f8381eb398')
INSERT [dbo].[UsersInRoles] ([UserId], [RoleId]) VALUES (N'de15718a-08eb-48c0-a789-db560b83771c', N'f7eb53b9-27bd-4183-bfda-01f8381eb398')
INSERT [dbo].[UsersInRoles] ([UserId], [RoleId]) VALUES (N'e6220e10-ccc5-4d1c-9291-dedd7dc87f55', N'f7eb53b9-27bd-4183-bfda-01f8381eb398')
INSERT [dbo].[UsersInRoles] ([UserId], [RoleId]) VALUES (N'6da64653-1ff8-4938-8ecb-dee4b914ca8a', N'f7eb53b9-27bd-4183-bfda-01f8381eb398')
INSERT [dbo].[UsersInRoles] ([UserId], [RoleId]) VALUES (N'88feaa39-d83c-4fa5-ba55-df3104ec908e', N'f7eb53b9-27bd-4183-bfda-01f8381eb398')
INSERT [dbo].[UsersInRoles] ([UserId], [RoleId]) VALUES (N'f9439a9a-11a0-40ce-accc-e23fc5ae8f3c', N'f7eb53b9-27bd-4183-bfda-01f8381eb398')
INSERT [dbo].[UsersInRoles] ([UserId], [RoleId]) VALUES (N'8b8b61e9-0892-4dba-b72b-e4b52c15dabe', N'f7eb53b9-27bd-4183-bfda-01f8381eb398')
INSERT [dbo].[UsersInRoles] ([UserId], [RoleId]) VALUES (N'ed327b5a-0f81-45b6-95ef-e5c28806a8a0', N'f7eb53b9-27bd-4183-bfda-01f8381eb398')
INSERT [dbo].[UsersInRoles] ([UserId], [RoleId]) VALUES (N'79e11c51-1eb9-4ce8-9181-e73c25ac57ac', N'f7eb53b9-27bd-4183-bfda-01f8381eb398')
INSERT [dbo].[UsersInRoles] ([UserId], [RoleId]) VALUES (N'd31041af-cef8-40b8-a45e-e774be9dff6f', N'f7eb53b9-27bd-4183-bfda-01f8381eb398')
INSERT [dbo].[UsersInRoles] ([UserId], [RoleId]) VALUES (N'2cb27382-0595-41e8-9821-e77d8fdab632', N'f7eb53b9-27bd-4183-bfda-01f8381eb398')
INSERT [dbo].[UsersInRoles] ([UserId], [RoleId]) VALUES (N'4347b67c-5e00-4b89-aa64-e8c753fce49d', N'f7eb53b9-27bd-4183-bfda-01f8381eb398')
INSERT [dbo].[UsersInRoles] ([UserId], [RoleId]) VALUES (N'd8be406b-eee8-49f2-bffc-e9859ab9910c', N'f7eb53b9-27bd-4183-bfda-01f8381eb398')
INSERT [dbo].[UsersInRoles] ([UserId], [RoleId]) VALUES (N'e33e7b01-c8e9-4e4b-9042-eafce9410dc7', N'f7eb53b9-27bd-4183-bfda-01f8381eb398')
INSERT [dbo].[UsersInRoles] ([UserId], [RoleId]) VALUES (N'9d112d71-580e-4af0-b4be-f01a2a95b3be', N'f7eb53b9-27bd-4183-bfda-01f8381eb398')
INSERT [dbo].[UsersInRoles] ([UserId], [RoleId]) VALUES (N'b081f97c-0d4e-40f8-b4c3-f058e89b31fd', N'f7eb53b9-27bd-4183-bfda-01f8381eb398')
INSERT [dbo].[UsersInRoles] ([UserId], [RoleId]) VALUES (N'97b14396-7ab4-4094-9c4a-f06017a421de', N'f7eb53b9-27bd-4183-bfda-01f8381eb398')
INSERT [dbo].[UsersInRoles] ([UserId], [RoleId]) VALUES (N'c49386dc-3243-4e1b-8f4e-f2d07ca1ffc1', N'f7eb53b9-27bd-4183-bfda-01f8381eb398')
INSERT [dbo].[UsersInRoles] ([UserId], [RoleId]) VALUES (N'e2807c0f-cf5d-4f98-bcb3-f3c7415ff1c5', N'f7eb53b9-27bd-4183-bfda-01f8381eb398')
INSERT [dbo].[UsersInRoles] ([UserId], [RoleId]) VALUES (N'b23d276c-0795-48b2-b6a0-f5d0984dd682', N'f7eb53b9-27bd-4183-bfda-01f8381eb398')
INSERT [dbo].[UsersInRoles] ([UserId], [RoleId]) VALUES (N'50277c83-e5d4-4e6b-a694-f6a91a0e994e', N'f7eb53b9-27bd-4183-bfda-01f8381eb398')
INSERT [dbo].[UsersInRoles] ([UserId], [RoleId]) VALUES (N'd54386f4-d644-40d5-b4b0-f853be8b2e0b', N'f7eb53b9-27bd-4183-bfda-01f8381eb398')
INSERT [dbo].[UsersInRoles] ([UserId], [RoleId]) VALUES (N'4f585e36-fd6e-43ef-b086-fa317a195d98', N'f7eb53b9-27bd-4183-bfda-01f8381eb398')
INSERT [dbo].[UsersInRoles] ([UserId], [RoleId]) VALUES (N'37161e19-f11e-493c-8506-fa396c3457c1', N'f7eb53b9-27bd-4183-bfda-01f8381eb398')
INSERT [dbo].[UsersInRoles] ([UserId], [RoleId]) VALUES (N'2352bd85-dc90-4fd7-a523-fa7409a58b25', N'f7eb53b9-27bd-4183-bfda-01f8381eb398')
INSERT [dbo].[UsersInRoles] ([UserId], [RoleId]) VALUES (N'b5d1c451-336d-48c3-ba16-fd4cfbbf9590', N'f7eb53b9-27bd-4183-bfda-01f8381eb398')
INSERT [dbo].[UsersInRoles] ([UserId], [RoleId]) VALUES (N'11ba13b7-7df8-437a-bdaf-fe0d065212b4', N'1aaed1ec-bde1-4804-9a8d-47e1f9d6f5a3')
INSERT [dbo].[UsersInRoles] ([UserId], [RoleId]) VALUES (N'e64445cd-3d1d-4101-99dc-fefbc3b7173d', N'f7eb53b9-27bd-4183-bfda-01f8381eb398')
/****** Object:  Table [dbo].[Student]    Script Date: 04/01/2013 10:27:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Student]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Student](
	[StudentID] [uniqueidentifier] NOT NULL,
	[InsertDate] [datetime] NULL,
	[InsertUserID] [uniqueidentifier] NULL,
	[ModifyDate] [datetime] NULL,
	[ModifyUserID] [uniqueidentifier] NULL,
	[IpAddress] [varchar](200) NULL,
	[UserID] [uniqueidentifier] NOT NULL,
	[IdentificationTypeID] [uniqueidentifier] NOT NULL,
	[FirstName] [varchar](100) NOT NULL,
	[LastName] [varchar](100) NOT NULL,
	[Gender] [char](1) NOT NULL,
	[DateOfBirth] [datetime] NULL,
	[CountryID] [uniqueidentifier] NULL,
	[MaritalStatusTypeID] [uniqueidentifier] NOT NULL,
	[Phone1] [varchar](80) NOT NULL,
	[Phone2] [varchar](80) NULL,
	[Phone3] [varchar](80) NULL,
	[IsAppUser] [bit] NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[StudentID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Student] ([StudentID], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress], [UserID], [IdentificationTypeID], [FirstName], [LastName], [Gender], [DateOfBirth], [CountryID], [MaritalStatusTypeID], [Phone1], [Phone2], [Phone3], [IsAppUser]) VALUES (N'029f302d-c294-4f6f-8332-0056c1ea2953', NULL, NULL, CAST(0x0000A17F00000000 AS DateTime), N'09e4d1cd-a983-432a-80a9-2fc910e920d2', N'172.17.3.242', N'ef9357d3-a6fa-4673-8c99-c36ea808a54f', N'f18e97f6-b298-4f23-8a97-17f0fe527e5f', N'FRANKLIN DIEGO', N'LOPEZ BADILLA', N'M', CAST(0x000050C100000000 AS DateTime), N'f99afe4a-f84b-49f2-b88a-a64a71c85ed8', N'35e8dde8-9380-4d17-a30a-25ae2e0fb432', N'88178853', NULL, NULL, 0)
INSERT [dbo].[Student] ([StudentID], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress], [UserID], [IdentificationTypeID], [FirstName], [LastName], [Gender], [DateOfBirth], [CountryID], [MaritalStatusTypeID], [Phone1], [Phone2], [Phone3], [IsAppUser]) VALUES (N'd8f1a097-2765-4ff5-bdd8-025f4b31a20c', NULL, NULL, CAST(0x0000A17F00000000 AS DateTime), N'09e4d1cd-a983-432a-80a9-2fc910e920d2', N'172.17.3.242', N'cd70ba0b-58e1-458d-8dee-d2e4bbbfb1c5', N'f18e97f6-b298-4f23-8a97-17f0fe527e5f', N'EDGAR ENRIQUE', N'CAMPOS ALFARO', N'M', CAST(0x0000609B00000000 AS DateTime), N'f99afe4a-f84b-49f2-b88a-a64a71c85ed8', N'35e8dde8-9380-4d17-a30a-25ae2e0fb432', N'83883029', NULL, NULL, 0)
INSERT [dbo].[Student] ([StudentID], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress], [UserID], [IdentificationTypeID], [FirstName], [LastName], [Gender], [DateOfBirth], [CountryID], [MaritalStatusTypeID], [Phone1], [Phone2], [Phone3], [IsAppUser]) VALUES (N'37381df5-d751-4696-811e-0280c4faf9ea', NULL, NULL, CAST(0x0000A17F00000000 AS DateTime), N'09e4d1cd-a983-432a-80a9-2fc910e920d2', N'172.17.3.242', N'2e8f409d-3679-42eb-b5e4-583871bc0918', N'36fc2c43-be02-40ac-ae1d-0d7dee3c5a10', N'KARLA JOHANNA', N'CAMPOS RAMIREZ', N'F', CAST(0x000073C900000000 AS DateTime), N'f99afe4a-f84b-49f2-b88a-a64a71c85ed8', N'35e8dde8-9380-4d17-a30a-25ae2e0fb432', N'88256333', NULL, NULL, 0)
INSERT [dbo].[Student] ([StudentID], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress], [UserID], [IdentificationTypeID], [FirstName], [LastName], [Gender], [DateOfBirth], [CountryID], [MaritalStatusTypeID], [Phone1], [Phone2], [Phone3], [IsAppUser]) VALUES (N'81cef4d7-6a09-4c64-b9d5-02a57929037e', NULL, NULL, CAST(0x0000A18C00000000 AS DateTime), N'22e466ed-5b35-4734-89e9-cc2b9ec3e55a', N'172.26.52.168', N'd926932a-d547-488e-bdf4-96aba353557b', N'36fc2c43-be02-40ac-ae1d-0d7dee3c5a10', N'KATTHYA GABRIELA', N'CAMACHO BARRANTES', N'F', CAST(0x0000613C00000000 AS DateTime), N'f99afe4a-f84b-49f2-b88a-a64a71c85ed8', N'35e8dde8-9380-4d17-a30a-25ae2e0fb432', N'89806270', NULL, NULL, 0)
INSERT [dbo].[Student] ([StudentID], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress], [UserID], [IdentificationTypeID], [FirstName], [LastName], [Gender], [DateOfBirth], [CountryID], [MaritalStatusTypeID], [Phone1], [Phone2], [Phone3], [IsAppUser]) VALUES (N'98d50578-0f89-4b50-b457-031cd106b6e7', NULL, NULL, CAST(0x0000A17F00000000 AS DateTime), N'09e4d1cd-a983-432a-80a9-2fc910e920d2', N'172.17.3.242', N'158e7f16-d0e0-4365-b7bd-94b3cc74ec0d', N'36fc2c43-be02-40ac-ae1d-0d7dee3c5a10', N'HARUSKA', N'CORTES PACHECO', N'F', CAST(0x000066FC00000000 AS DateTime), N'f99afe4a-f84b-49f2-b88a-a64a71c85ed8', N'35e8dde8-9380-4d17-a30a-25ae2e0fb432', N'83860718', NULL, NULL, 0)
INSERT [dbo].[Student] ([StudentID], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress], [UserID], [IdentificationTypeID], [FirstName], [LastName], [Gender], [DateOfBirth], [CountryID], [MaritalStatusTypeID], [Phone1], [Phone2], [Phone3], [IsAppUser]) VALUES (N'e5d5238b-511f-4340-8fe3-0a8d76c3becd', NULL, NULL, CAST(0x0000A17800000000 AS DateTime), N'09e4d1cd-a983-432a-80a9-2fc910e920d2', N'172.17.1.198', N'2c45487c-8348-462c-b2d4-55d6c28a9b29', N'f18e97f6-b298-4f23-8a97-17f0fe527e5f', N'FRANKLIN JOSE', N'GARITA COUSIN', N'M', CAST(0x000063A600000000 AS DateTime), N'f99afe4a-f84b-49f2-b88a-a64a71c85ed8', N'35e8dde8-9380-4d17-a30a-25ae2e0fb432', N'882107957', NULL, NULL, 0)
INSERT [dbo].[Student] ([StudentID], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress], [UserID], [IdentificationTypeID], [FirstName], [LastName], [Gender], [DateOfBirth], [CountryID], [MaritalStatusTypeID], [Phone1], [Phone2], [Phone3], [IsAppUser]) VALUES (N'e858467b-af99-4ddb-bcac-0abe3dfec2d6', NULL, NULL, CAST(0x0000A17F00000000 AS DateTime), N'09e4d1cd-a983-432a-80a9-2fc910e920d2', N'172.17.3.242', N'2cb27382-0595-41e8-9821-e77d8fdab632', N'36fc2c43-be02-40ac-ae1d-0d7dee3c5a10', N'MAUREN NATALIA', N'VEGA BARRIENTOS', N'F', CAST(0x0000A17F00000000 AS DateTime), N'f99afe4a-f84b-49f2-b88a-a64a71c85ed8', N'35e8dde8-9380-4d17-a30a-25ae2e0fb432', N'8838 5863', NULL, NULL, 0)
INSERT [dbo].[Student] ([StudentID], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress], [UserID], [IdentificationTypeID], [FirstName], [LastName], [Gender], [DateOfBirth], [CountryID], [MaritalStatusTypeID], [Phone1], [Phone2], [Phone3], [IsAppUser]) VALUES (N'f2b8f26a-b5eb-49ba-ad45-0b2e4b959130', NULL, NULL, CAST(0x0000A17800000000 AS DateTime), N'09e4d1cd-a983-432a-80a9-2fc910e920d2', N'172.17.1.198', N'5f7a4b47-a645-45d6-bd60-31353e1aeb70', N'f18e97f6-b298-4f23-8a97-17f0fe527e5f', N'JORGE ALEJANDRO', N'VALERIN GOMEZ', N'M', CAST(0x00005D2B00000000 AS DateTime), N'f99afe4a-f84b-49f2-b88a-a64a71c85ed8', N'35e8dde8-9380-4d17-a30a-25ae2e0fb432', N'83765384', NULL, NULL, 0)
INSERT [dbo].[Student] ([StudentID], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress], [UserID], [IdentificationTypeID], [FirstName], [LastName], [Gender], [DateOfBirth], [CountryID], [MaritalStatusTypeID], [Phone1], [Phone2], [Phone3], [IsAppUser]) VALUES (N'48ee76c2-7c83-498b-bef9-0c81ecf0b2fb', NULL, NULL, CAST(0x0000A18800000000 AS DateTime), N'c8f318ea-34f0-4260-ba62-8f2e92949939', N'172.17.7.10', N'50277c83-e5d4-4e6b-a694-f6a91a0e994e', N'36fc2c43-be02-40ac-ae1d-0d7dee3c5a10', N'ANDREA PRISCILLA', N'SANCHO GRANADOS', N'F', CAST(0x00006E1B00000000 AS DateTime), N'f99afe4a-f84b-49f2-b88a-a64a71c85ed8', N'35e8dde8-9380-4d17-a30a-25ae2e0fb432', N'8833-1495', NULL, NULL, 0)
INSERT [dbo].[Student] ([StudentID], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress], [UserID], [IdentificationTypeID], [FirstName], [LastName], [Gender], [DateOfBirth], [CountryID], [MaritalStatusTypeID], [Phone1], [Phone2], [Phone3], [IsAppUser]) VALUES (N'731d502f-d39c-4403-aba1-0dc808d5c492', NULL, NULL, CAST(0x0000A17800000000 AS DateTime), N'09e4d1cd-a983-432a-80a9-2fc910e920d2', N'172.17.1.198', N'e080409a-d29f-424e-aae2-8a6237a0e748', N'f18e97f6-b298-4f23-8a97-17f0fe527e5f', N'MARVIN GERARDO', N'GUTIERREZ AGUILAR', N'M', CAST(0x00005A2600000000 AS DateTime), N'f99afe4a-f84b-49f2-b88a-a64a71c85ed8', N'35e8dde8-9380-4d17-a30a-25ae2e0fb432', N'83822566', NULL, NULL, 0)
INSERT [dbo].[Student] ([StudentID], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress], [UserID], [IdentificationTypeID], [FirstName], [LastName], [Gender], [DateOfBirth], [CountryID], [MaritalStatusTypeID], [Phone1], [Phone2], [Phone3], [IsAppUser]) VALUES (N'b0954509-a7a1-494f-a06a-0eab18f41f9b', NULL, NULL, CAST(0x0000A18200000000 AS DateTime), N'04622c29-cc0f-4876-9f0c-70266450200f', N'172.26.91.77', N'04622c29-cc0f-4876-9f0c-70266450200f', N'f18e97f6-b298-4f23-8a97-17f0fe527e5f', N'JESUS', N'HERNANDEZ ARAYA', N'M', CAST(0x000079C400000000 AS DateTime), N'f99afe4a-f84b-49f2-b88a-a64a71c85ed8', N'95c0c502-3e24-4036-bac5-bff8db1a0946', N'83898792', NULL, NULL, 1)
INSERT [dbo].[Student] ([StudentID], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress], [UserID], [IdentificationTypeID], [FirstName], [LastName], [Gender], [DateOfBirth], [CountryID], [MaritalStatusTypeID], [Phone1], [Phone2], [Phone3], [IsAppUser]) VALUES (N'059dd4e1-869e-48a9-aff0-0ece96414fa5', NULL, NULL, NULL, NULL, NULL, N'6c2acc03-9573-4527-87c2-3b5f4127df35', N'f18e97f6-b298-4f23-8a97-17f0fe527e5f', N'StudentTest', N'Test', N'F', CAST(0x000073D500000000 AS DateTime), N'f99afe4a-f84b-49f2-b88a-a64a71c85ed8', N'95c0c502-3e24-4036-bac5-bff8db1a0946', N'+50688203956', N'+50688203956', N'+50688203956', 1)
INSERT [dbo].[Student] ([StudentID], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress], [UserID], [IdentificationTypeID], [FirstName], [LastName], [Gender], [DateOfBirth], [CountryID], [MaritalStatusTypeID], [Phone1], [Phone2], [Phone3], [IsAppUser]) VALUES (N'328ff1dc-f1db-46d1-a83e-0fce63233b0e', NULL, NULL, CAST(0x0000A18800000000 AS DateTime), N'22e466ed-5b35-4734-89e9-cc2b9ec3e55a', N'172.26.52.168', N'd39ffd63-6295-4d44-b504-c63926c4d953', N'36fc2c43-be02-40ac-ae1d-0d7dee3c5a10', N'IRSA', N'FALLAS MORA', N'F', CAST(0x00007EA200000000 AS DateTime), N'f99afe4a-f84b-49f2-b88a-a64a71c85ed8', N'35e8dde8-9380-4d17-a30a-25ae2e0fb432', N'8745 5947', NULL, NULL, 0)
INSERT [dbo].[Student] ([StudentID], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress], [UserID], [IdentificationTypeID], [FirstName], [LastName], [Gender], [DateOfBirth], [CountryID], [MaritalStatusTypeID], [Phone1], [Phone2], [Phone3], [IsAppUser]) VALUES (N'd3daaab6-283e-4f47-a191-1139e37e3912', NULL, NULL, CAST(0x0000A17800000000 AS DateTime), N'09e4d1cd-a983-432a-80a9-2fc910e920d2', N'172.17.1.198', N'c01d504c-a20a-48f2-9a5c-ce5dfa5059c3', N'36fc2c43-be02-40ac-ae1d-0d7dee3c5a10', N'OLGER', N'MONTOYA MEJIAS', N'M', CAST(0x0000558200000000 AS DateTime), N'f99afe4a-f84b-49f2-b88a-a64a71c85ed8', N'35e8dde8-9380-4d17-a30a-25ae2e0fb432', N'87015344', NULL, NULL, 0)
INSERT [dbo].[Student] ([StudentID], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress], [UserID], [IdentificationTypeID], [FirstName], [LastName], [Gender], [DateOfBirth], [CountryID], [MaritalStatusTypeID], [Phone1], [Phone2], [Phone3], [IsAppUser]) VALUES (N'd56168a0-0c73-4e4a-a605-12bbf3f28869', NULL, NULL, CAST(0x0000A17800000000 AS DateTime), N'09e4d1cd-a983-432a-80a9-2fc910e920d2', N'172.17.1.198', N'6a0c4923-b1aa-44a5-9171-8d3b5399a990', N'f18e97f6-b298-4f23-8a97-17f0fe527e5f', N'GUIDO', N'MORA CAMACHO', N'M', CAST(0x00004CA500000000 AS DateTime), N'f99afe4a-f84b-49f2-b88a-a64a71c85ed8', N'35e8dde8-9380-4d17-a30a-25ae2e0fb432', N'0', N'2453-56-65', NULL, 0)
INSERT [dbo].[Student] ([StudentID], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress], [UserID], [IdentificationTypeID], [FirstName], [LastName], [Gender], [DateOfBirth], [CountryID], [MaritalStatusTypeID], [Phone1], [Phone2], [Phone3], [IsAppUser]) VALUES (N'870ed76c-6ffd-4255-898e-156279adfe62', NULL, NULL, CAST(0x0000A17E00000000 AS DateTime), N'09e4d1cd-a983-432a-80a9-2fc910e920d2', N'172.26.91.211', N'28e6cadd-6359-4741-a46c-6304d83688f2', N'36fc2c43-be02-40ac-ae1d-0d7dee3c5a10', N'MARIO ', N'CASTRO MURILLO', N'M', CAST(0x0000712200000000 AS DateTime), N'f99afe4a-f84b-49f2-b88a-a64a71c85ed8', N'35e8dde8-9380-4d17-a30a-25ae2e0fb432', N'8812-4299', NULL, NULL, 0)
INSERT [dbo].[Student] ([StudentID], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress], [UserID], [IdentificationTypeID], [FirstName], [LastName], [Gender], [DateOfBirth], [CountryID], [MaritalStatusTypeID], [Phone1], [Phone2], [Phone3], [IsAppUser]) VALUES (N'2b245dbc-4432-40dc-a9de-1590ec360b42', NULL, NULL, CAST(0x0000A17800000000 AS DateTime), N'09e4d1cd-a983-432a-80a9-2fc910e920d2', N'172.17.1.198', N'2e4798d2-bb68-40a1-80e1-86f76b450bb6', N'f18e97f6-b298-4f23-8a97-17f0fe527e5f', N'EDUARDO JOSE', N'HERNANDEZ VALLE', N'M', CAST(0x0000620D00000000 AS DateTime), N'f99afe4a-f84b-49f2-b88a-a64a71c85ed8', N'35e8dde8-9380-4d17-a30a-25ae2e0fb432', N'88885069', NULL, NULL, 0)
INSERT [dbo].[Student] ([StudentID], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress], [UserID], [IdentificationTypeID], [FirstName], [LastName], [Gender], [DateOfBirth], [CountryID], [MaritalStatusTypeID], [Phone1], [Phone2], [Phone3], [IsAppUser]) VALUES (N'e71bcc8b-7d27-46f6-85ab-18572f6f7b18', NULL, NULL, CAST(0x0000A17F00000000 AS DateTime), N'09e4d1cd-a983-432a-80a9-2fc910e920d2', N'172.17.3.242', N'f5a32da9-8a3e-4d62-8df1-03e046058bf7', N'f18e97f6-b298-4f23-8a97-17f0fe527e5f', N'	JOSE MANUEL', N'LEITON MORALES', N'M', CAST(0x00004FBA00000000 AS DateTime), N'f99afe4a-f84b-49f2-b88a-a64a71c85ed8', N'35e8dde8-9380-4d17-a30a-25ae2e0fb432', N'0', N'22616366', NULL, 0)
INSERT [dbo].[Student] ([StudentID], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress], [UserID], [IdentificationTypeID], [FirstName], [LastName], [Gender], [DateOfBirth], [CountryID], [MaritalStatusTypeID], [Phone1], [Phone2], [Phone3], [IsAppUser]) VALUES (N'5c082bac-efc7-4cd3-a768-18855ed24546', NULL, NULL, CAST(0x0000A17800000000 AS DateTime), N'09e4d1cd-a983-432a-80a9-2fc910e920d2', N'172.17.1.198', N'fee6dd35-49bb-41f0-9760-d95f99b15bd1', N'f18e97f6-b298-4f23-8a97-17f0fe527e5f', N'CARLOS ANDRES', N'MURILLO SOLIS', N'M', CAST(0x00006FDA00000000 AS DateTime), N'f99afe4a-f84b-49f2-b88a-a64a71c85ed8', N'35e8dde8-9380-4d17-a30a-25ae2e0fb432', N'88272824', NULL, NULL, 0)
INSERT [dbo].[Student] ([StudentID], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress], [UserID], [IdentificationTypeID], [FirstName], [LastName], [Gender], [DateOfBirth], [CountryID], [MaritalStatusTypeID], [Phone1], [Phone2], [Phone3], [IsAppUser]) VALUES (N'259f2171-df56-4b2e-a82a-1a9475da6dd8', NULL, NULL, CAST(0x0000A17800000000 AS DateTime), N'09e4d1cd-a983-432a-80a9-2fc910e920d2', N'172.17.1.198', N'8209ebd5-c679-4da3-8630-6659f205d5ca', N'f18e97f6-b298-4f23-8a97-17f0fe527e5f', N'RUBEN', N'ALFARO ARAYA', N'M', CAST(0x000052FD00000000 AS DateTime), N'f99afe4a-f84b-49f2-b88a-a64a71c85ed8', N'f174ac5c-3a96-4db7-b965-ddac9f2874ee', N'8823 2082', NULL, NULL, 0)
INSERT [dbo].[Student] ([StudentID], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress], [UserID], [IdentificationTypeID], [FirstName], [LastName], [Gender], [DateOfBirth], [CountryID], [MaritalStatusTypeID], [Phone1], [Phone2], [Phone3], [IsAppUser]) VALUES (N'b00cd5dc-4c83-4f20-9c3a-1ac949de358c', NULL, NULL, CAST(0x0000A17800000000 AS DateTime), N'09e4d1cd-a983-432a-80a9-2fc910e920d2', N'172.17.1.198', N'4eb23992-0f12-4f29-9c0a-977a572efd48', N'f18e97f6-b298-4f23-8a97-17f0fe527e5f', N'EDGAR LUIS', N'GOMEZ ARAYA', N'M', CAST(0x000076E800000000 AS DateTime), N'f99afe4a-f84b-49f2-b88a-a64a71c85ed8', N'35e8dde8-9380-4d17-a30a-25ae2e0fb432', N'83438496', NULL, NULL, 0)
INSERT [dbo].[Student] ([StudentID], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress], [UserID], [IdentificationTypeID], [FirstName], [LastName], [Gender], [DateOfBirth], [CountryID], [MaritalStatusTypeID], [Phone1], [Phone2], [Phone3], [IsAppUser]) VALUES (N'1db03037-5f73-4aac-9aaa-1b888ba416b7', NULL, NULL, CAST(0x0000A17F00000000 AS DateTime), N'09e4d1cd-a983-432a-80a9-2fc910e920d2', N'172.17.3.242', N'a8ea54b7-1a19-4eee-8f4b-60dc08090b2c', N'36fc2c43-be02-40ac-ae1d-0d7dee3c5a10', N'MIREYA', N'RODRIGUEZ HERNANDEZ', N'F', CAST(0x00006FB000000000 AS DateTime), N'f99afe4a-f84b-49f2-b88a-a64a71c85ed8', N'35e8dde8-9380-4d17-a30a-25ae2e0fb432', N'88710037', NULL, NULL, 0)
INSERT [dbo].[Student] ([StudentID], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress], [UserID], [IdentificationTypeID], [FirstName], [LastName], [Gender], [DateOfBirth], [CountryID], [MaritalStatusTypeID], [Phone1], [Phone2], [Phone3], [IsAppUser]) VALUES (N'5a29d295-33a7-41fe-a315-1d756cb21a39', NULL, NULL, CAST(0x0000A17800000000 AS DateTime), N'09e4d1cd-a983-432a-80a9-2fc910e920d2', N'172.17.1.198', N'9ca29c27-2a95-4324-a751-8588b71a0a07', N'f18e97f6-b298-4f23-8a97-17f0fe527e5f', N'GINNETH MARIA', N'ALFARO ROJAS', N'F', CAST(0x00006B1A00000000 AS DateTime), N'f99afe4a-f84b-49f2-b88a-a64a71c85ed8', N'35e8dde8-9380-4d17-a30a-25ae2e0fb432', N'83716886', NULL, NULL, 0)
INSERT [dbo].[Student] ([StudentID], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress], [UserID], [IdentificationTypeID], [FirstName], [LastName], [Gender], [DateOfBirth], [CountryID], [MaritalStatusTypeID], [Phone1], [Phone2], [Phone3], [IsAppUser]) VALUES (N'a86eaae3-8623-43f2-9d9a-1ea3ff86c55e', NULL, NULL, CAST(0x0000A17E00000000 AS DateTime), N'09e4d1cd-a983-432a-80a9-2fc910e920d2', N'172.26.91.211', N'3b0b3574-321a-4dfb-b99e-c9a54db63fd6', N'f18e97f6-b298-4f23-8a97-17f0fe527e5f', N'Randall', N'Camacho Solano', N'M', CAST(0x00006CB300000000 AS DateTime), N'f99afe4a-f84b-49f2-b88a-a64a71c85ed8', N'35e8dde8-9380-4d17-a30a-25ae2e0fb432', N'0', N'22876457', NULL, 0)
INSERT [dbo].[Student] ([StudentID], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress], [UserID], [IdentificationTypeID], [FirstName], [LastName], [Gender], [DateOfBirth], [CountryID], [MaritalStatusTypeID], [Phone1], [Phone2], [Phone3], [IsAppUser]) VALUES (N'fbf18100-734e-4d20-bc55-2242d4ce74af', NULL, NULL, CAST(0x0000A17F00000000 AS DateTime), N'09e4d1cd-a983-432a-80a9-2fc910e920d2', N'172.17.3.242', N'abb6ed1d-85f0-4cf4-9587-469116e56d3b', N'36fc2c43-be02-40ac-ae1d-0d7dee3c5a10', N'ANA CRISTINA', N'ALPIZAR CAMACHO', N'F', CAST(0x00005BA800000000 AS DateTime), N'f99afe4a-f84b-49f2-b88a-a64a71c85ed8', N'35e8dde8-9380-4d17-a30a-25ae2e0fb432', N'8879 6628', N'2249 9119', NULL, 0)
INSERT [dbo].[Student] ([StudentID], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress], [UserID], [IdentificationTypeID], [FirstName], [LastName], [Gender], [DateOfBirth], [CountryID], [MaritalStatusTypeID], [Phone1], [Phone2], [Phone3], [IsAppUser]) VALUES (N'bac4682e-fa71-4d43-85cc-227626997e28', NULL, NULL, CAST(0x0000A17800000000 AS DateTime), N'09e4d1cd-a983-432a-80a9-2fc910e920d2', N'172.17.1.198', N'75674a63-d6dc-42f8-b861-73aca8bf8067', N'f18e97f6-b298-4f23-8a97-17f0fe527e5f', N'LUIS FERNANDO', N'BARBOZA CAMPOS', N'M', CAST(0x00004E6B00000000 AS DateTime), N'f99afe4a-f84b-49f2-b88a-a64a71c85ed8', N'35e8dde8-9380-4d17-a30a-25ae2e0fb432', N'8813-3670', NULL, NULL, 0)
INSERT [dbo].[Student] ([StudentID], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress], [UserID], [IdentificationTypeID], [FirstName], [LastName], [Gender], [DateOfBirth], [CountryID], [MaritalStatusTypeID], [Phone1], [Phone2], [Phone3], [IsAppUser]) VALUES (N'ad5ae068-7b2c-4f72-8ec2-237cbacbbf6f', NULL, NULL, CAST(0x0000A17800000000 AS DateTime), N'09e4d1cd-a983-432a-80a9-2fc910e920d2', N'172.17.1.198', N'b5d1c451-336d-48c3-ba16-fd4cfbbf9590', N'f18e97f6-b298-4f23-8a97-17f0fe527e5f', N'RAYMOND PAUL', N'CHAGNON CARAZO', N'M', CAST(0x000063B300000000 AS DateTime), N'f99afe4a-f84b-49f2-b88a-a64a71c85ed8', N'35e8dde8-9380-4d17-a30a-25ae2e0fb432', N'8381 5022', NULL, NULL, 0)
INSERT [dbo].[Student] ([StudentID], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress], [UserID], [IdentificationTypeID], [FirstName], [LastName], [Gender], [DateOfBirth], [CountryID], [MaritalStatusTypeID], [Phone1], [Phone2], [Phone3], [IsAppUser]) VALUES (N'8ff02ada-5ce1-4c3d-a4c8-23e5a5e9bb24', NULL, NULL, CAST(0x0000A16900000000 AS DateTime), N'22e466ed-5b35-4734-89e9-cc2b9ec3e55a', N'172.26.52.168', N'3096d7b8-f414-4100-896b-704dcae0e617', N'f18e97f6-b298-4f23-8a97-17f0fe527e5f', N'SHIRLEY', N'FONSECA QUIROS', N'F', CAST(0x0000902B00000000 AS DateTime), N'f99afe4a-f84b-49f2-b88a-a64a71c85ed8', N'f174ac5c-3a96-4db7-b965-ddac9f2874ee', N'11111111', NULL, NULL, 1)
INSERT [dbo].[Student] ([StudentID], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress], [UserID], [IdentificationTypeID], [FirstName], [LastName], [Gender], [DateOfBirth], [CountryID], [MaritalStatusTypeID], [Phone1], [Phone2], [Phone3], [IsAppUser]) VALUES (N'ffde5017-0b70-4b34-8543-26d0e47cd975', NULL, NULL, CAST(0x0000A17F00000000 AS DateTime), N'09e4d1cd-a983-432a-80a9-2fc910e920d2', N'172.17.3.242', N'c1f24856-782a-440c-8d6a-671c1c40958a', N'f18e97f6-b298-4f23-8a97-17f0fe527e5f', N'ORLANDO', N' VINDAS LOPEZ', N'M', CAST(0x000053D700000000 AS DateTime), N'f99afe4a-f84b-49f2-b88a-a64a71c85ed8', N'35e8dde8-9380-4d17-a30a-25ae2e0fb432', N'8309 8121', N'2296 2270', NULL, 0)
INSERT [dbo].[Student] ([StudentID], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress], [UserID], [IdentificationTypeID], [FirstName], [LastName], [Gender], [DateOfBirth], [CountryID], [MaritalStatusTypeID], [Phone1], [Phone2], [Phone3], [IsAppUser]) VALUES (N'5788e366-79a5-4e3c-8139-288af94a80f8', NULL, NULL, CAST(0x0000A17E00000000 AS DateTime), N'09e4d1cd-a983-432a-80a9-2fc910e920d2', N'172.26.91.211', N'26918a5e-74c6-4f0d-a7e5-52c19b739e18', N'f18e97f6-b298-4f23-8a97-17f0fe527e5f', N'LUIS VICENTE', N'VILLAFRANCO ABREGO', N'M', CAST(0x000056E400000000 AS DateTime), N'f99afe4a-f84b-49f2-b88a-a64a71c85ed8', N'35e8dde8-9380-4d17-a30a-25ae2e0fb432', N'88744593', NULL, NULL, 0)
INSERT [dbo].[Student] ([StudentID], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress], [UserID], [IdentificationTypeID], [FirstName], [LastName], [Gender], [DateOfBirth], [CountryID], [MaritalStatusTypeID], [Phone1], [Phone2], [Phone3], [IsAppUser]) VALUES (N'946b2926-7853-4aa8-bbfa-28d8e7f30d10', NULL, NULL, CAST(0x0000A17800000000 AS DateTime), N'09e4d1cd-a983-432a-80a9-2fc910e920d2', N'172.17.1.198', N'961f6a8a-a094-4036-98a1-39c686eecf3f', N'f18e97f6-b298-4f23-8a97-17f0fe527e5f', N'ASDRUBAL', N'CAMPOS QUESADA', N'M', CAST(0x0000416F00000000 AS DateTime), N'f99afe4a-f84b-49f2-b88a-a64a71c85ed8', N'35e8dde8-9380-4d17-a30a-25ae2e0fb432', N'83918541', NULL, NULL, 0)
INSERT [dbo].[Student] ([StudentID], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress], [UserID], [IdentificationTypeID], [FirstName], [LastName], [Gender], [DateOfBirth], [CountryID], [MaritalStatusTypeID], [Phone1], [Phone2], [Phone3], [IsAppUser]) VALUES (N'6da7a311-f606-43e7-b222-292ff167f152', NULL, NULL, CAST(0x0000A17E00000000 AS DateTime), N'09e4d1cd-a983-432a-80a9-2fc910e920d2', N'172.26.91.211', N'd8be406b-eee8-49f2-bffc-e9859ab9910c', N'f18e97f6-b298-4f23-8a97-17f0fe527e5f', N'CARLOS', N'BORGE MUÑOZ', N'M', CAST(0x0000468A00000000 AS DateTime), N'f99afe4a-f84b-49f2-b88a-a64a71c85ed8', N'35e8dde8-9380-4d17-a30a-25ae2e0fb432', N'83772864', NULL, NULL, 0)
INSERT [dbo].[Student] ([StudentID], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress], [UserID], [IdentificationTypeID], [FirstName], [LastName], [Gender], [DateOfBirth], [CountryID], [MaritalStatusTypeID], [Phone1], [Phone2], [Phone3], [IsAppUser]) VALUES (N'14bf9b1e-fe53-4120-861b-2aaec2dbd59f', NULL, NULL, CAST(0x0000A17E00000000 AS DateTime), N'09e4d1cd-a983-432a-80a9-2fc910e920d2', N'172.26.91.211', N'f5e2727b-1f15-4626-9b01-c8cc89dd2913', N'f18e97f6-b298-4f23-8a97-17f0fe527e5f', N'SANTIAGO', N'GONZALEZ CORRALES', N'M', CAST(0x00005D1200000000 AS DateTime), N'f99afe4a-f84b-49f2-b88a-a64a71c85ed8', N'35e8dde8-9380-4d17-a30a-25ae2e0fb432', N'8704 9098', NULL, NULL, 0)
INSERT [dbo].[Student] ([StudentID], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress], [UserID], [IdentificationTypeID], [FirstName], [LastName], [Gender], [DateOfBirth], [CountryID], [MaritalStatusTypeID], [Phone1], [Phone2], [Phone3], [IsAppUser]) VALUES (N'3e38d4ef-db1f-4e7d-9a1a-2e2548f188f7', NULL, NULL, CAST(0x0000A17E00000000 AS DateTime), N'09e4d1cd-a983-432a-80a9-2fc910e920d2', N'172.26.91.211', N'd31041af-cef8-40b8-a45e-e774be9dff6f', N'f18e97f6-b298-4f23-8a97-17f0fe527e5f', N'FEDERICO ', N'CAÑAS CAÑAS', N'M', CAST(0x00006DBC00000000 AS DateTime), N'f99afe4a-f84b-49f2-b88a-a64a71c85ed8', N'35e8dde8-9380-4d17-a30a-25ae2e0fb432', N'8355 9520', NULL, NULL, 0)
INSERT [dbo].[Student] ([StudentID], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress], [UserID], [IdentificationTypeID], [FirstName], [LastName], [Gender], [DateOfBirth], [CountryID], [MaritalStatusTypeID], [Phone1], [Phone2], [Phone3], [IsAppUser]) VALUES (N'c9a070be-c5b1-4a64-8989-30a209fd716f', NULL, NULL, CAST(0x0000A17F00000000 AS DateTime), N'09e4d1cd-a983-432a-80a9-2fc910e920d2', N'172.17.3.242', N'ac278425-2d45-43eb-89b0-a2b0651dc7ab', N'f18e97f6-b298-4f23-8a97-17f0fe527e5f', N'MARCO ANTONIO', N'CHACON SOLIS', N'M', CAST(0x00005A1000000000 AS DateTime), N'f99afe4a-f84b-49f2-b88a-a64a71c85ed8', N'35e8dde8-9380-4d17-a30a-25ae2e0fb432', N'8863 0217', NULL, NULL, 0)
INSERT [dbo].[Student] ([StudentID], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress], [UserID], [IdentificationTypeID], [FirstName], [LastName], [Gender], [DateOfBirth], [CountryID], [MaritalStatusTypeID], [Phone1], [Phone2], [Phone3], [IsAppUser]) VALUES (N'9f3bcc41-391d-4625-9895-30a323a2dea5', NULL, NULL, CAST(0x0000A17F00000000 AS DateTime), N'09e4d1cd-a983-432a-80a9-2fc910e920d2', N'172.17.3.242', N'4f7dfd20-ed18-4e16-9e3b-1ef7b799c7e5', N'f18e97f6-b298-4f23-8a97-17f0fe527e5f', N'JERRY DAVID', N'MENDEZ MONGE', N'M', CAST(0x00007E2E00000000 AS DateTime), N'f99afe4a-f84b-49f2-b88a-a64a71c85ed8', N'35e8dde8-9380-4d17-a30a-25ae2e0fb432', N'8504 4912', N'2284 4330', NULL, 0)
INSERT [dbo].[Student] ([StudentID], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress], [UserID], [IdentificationTypeID], [FirstName], [LastName], [Gender], [DateOfBirth], [CountryID], [MaritalStatusTypeID], [Phone1], [Phone2], [Phone3], [IsAppUser]) VALUES (N'16349e61-d28c-47f4-ba81-310e157471e8', NULL, NULL, CAST(0x0000A17F00000000 AS DateTime), N'09e4d1cd-a983-432a-80a9-2fc910e920d2', N'172.17.3.242', N'1219d423-677e-4d32-83e2-365a3335aa98', N'f18e97f6-b298-4f23-8a97-17f0fe527e5f', N'FERNANDO ALBERTO', N'CHAVES SALAS', N'M', CAST(0x0000562000000000 AS DateTime), N'f99afe4a-f84b-49f2-b88a-a64a71c85ed8', N'35e8dde8-9380-4d17-a30a-25ae2e0fb432', N'8375 0565', NULL, NULL, 0)
INSERT [dbo].[Student] ([StudentID], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress], [UserID], [IdentificationTypeID], [FirstName], [LastName], [Gender], [DateOfBirth], [CountryID], [MaritalStatusTypeID], [Phone1], [Phone2], [Phone3], [IsAppUser]) VALUES (N'2a038970-a3e4-47d3-a3d4-332d0f84dbd5', NULL, NULL, CAST(0x0000A17800000000 AS DateTime), N'09e4d1cd-a983-432a-80a9-2fc910e920d2', N'172.17.1.198', N'595b7e7e-40bf-4053-80db-b79a684a026a', N'f18e97f6-b298-4f23-8a97-17f0fe527e5f', N'CARLOS GERARDO', N'SOSA ESQUIVEL', N'M', CAST(0x00004BA000000000 AS DateTime), N'f99afe4a-f84b-49f2-b88a-a64a71c85ed8', N'35e8dde8-9380-4d17-a30a-25ae2e0fb432', N'83744319', NULL, NULL, 0)
INSERT [dbo].[Student] ([StudentID], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress], [UserID], [IdentificationTypeID], [FirstName], [LastName], [Gender], [DateOfBirth], [CountryID], [MaritalStatusTypeID], [Phone1], [Phone2], [Phone3], [IsAppUser]) VALUES (N'56dd53fc-c95f-427c-9fbc-358b6d0cff16', NULL, NULL, CAST(0x0000A18200000000 AS DateTime), N'04622c29-cc0f-4876-9f0c-70266450200f', N'172.26.91.77', N'41ac46b2-d777-4a88-933a-3697f42d8a6d', N'36fc2c43-be02-40ac-ae1d-0d7dee3c5a10', N'ADRIANA', N'AVILA SALAZAR', N'F', CAST(0x00006FE700000000 AS DateTime), N'f99afe4a-f84b-49f2-b88a-a64a71c85ed8', N'35e8dde8-9380-4d17-a30a-25ae2e0fb432', N'83186772', NULL, NULL, 0)
INSERT [dbo].[Student] ([StudentID], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress], [UserID], [IdentificationTypeID], [FirstName], [LastName], [Gender], [DateOfBirth], [CountryID], [MaritalStatusTypeID], [Phone1], [Phone2], [Phone3], [IsAppUser]) VALUES (N'67907360-b1ef-469b-bf4f-37ca6f3b50ed', NULL, NULL, CAST(0x0000A17F00000000 AS DateTime), N'09e4d1cd-a983-432a-80a9-2fc910e920d2', N'172.17.3.242', N'92d1923c-983b-49fd-ac66-7a264f3cc017', N'36fc2c43-be02-40ac-ae1d-0d7dee3c5a10', N'MARCELA GUADALUPE', N'QUIROS ROJAS', N'F', CAST(0x000060D300000000 AS DateTime), N'f99afe4a-f84b-49f2-b88a-a64a71c85ed8', N'35e8dde8-9380-4d17-a30a-25ae2e0fb432', N'8864-0261', NULL, NULL, 0)
INSERT [dbo].[Student] ([StudentID], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress], [UserID], [IdentificationTypeID], [FirstName], [LastName], [Gender], [DateOfBirth], [CountryID], [MaritalStatusTypeID], [Phone1], [Phone2], [Phone3], [IsAppUser]) VALUES (N'81220e0b-1d63-49b6-8397-39ffaab80181', NULL, NULL, CAST(0x0000A17800000000 AS DateTime), N'09e4d1cd-a983-432a-80a9-2fc910e920d2', N'172.17.1.198', N'd4e2db0e-1291-4ded-963a-dab7babb446c', N'f18e97f6-b298-4f23-8a97-17f0fe527e5f', N'HECTOR GERARDO', N'MELENDEZ ZAMORA', N'M', CAST(0x000048EA00000000 AS DateTime), N'f99afe4a-f84b-49f2-b88a-a64a71c85ed8', N'35e8dde8-9380-4d17-a30a-25ae2e0fb432', N'83277752', NULL, NULL, 0)
INSERT [dbo].[Student] ([StudentID], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress], [UserID], [IdentificationTypeID], [FirstName], [LastName], [Gender], [DateOfBirth], [CountryID], [MaritalStatusTypeID], [Phone1], [Phone2], [Phone3], [IsAppUser]) VALUES (N'221ba9f8-a104-452b-ba69-3d795d7b6549', NULL, NULL, CAST(0x0000A17800000000 AS DateTime), N'09e4d1cd-a983-432a-80a9-2fc910e920d2', N'172.17.1.198', N'8909d7be-fcb4-431e-adcf-91484e174c16', N'f18e97f6-b298-4f23-8a97-17f0fe527e5f', N'EDGAR', N'MURILLO CHAN', N'M', CAST(0x0000526400000000 AS DateTime), N'f99afe4a-f84b-49f2-b88a-a64a71c85ed8', N'35e8dde8-9380-4d17-a30a-25ae2e0fb432', N'88549613', NULL, NULL, 0)
INSERT [dbo].[Student] ([StudentID], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress], [UserID], [IdentificationTypeID], [FirstName], [LastName], [Gender], [DateOfBirth], [CountryID], [MaritalStatusTypeID], [Phone1], [Phone2], [Phone3], [IsAppUser]) VALUES (N'8ec5db66-1599-46ca-860e-3d80fb261c2d', NULL, NULL, CAST(0x0000A17F00000000 AS DateTime), N'09e4d1cd-a983-432a-80a9-2fc910e920d2', N'172.17.3.242', N'02b6e53a-ec02-42c7-8e52-8a70e1a458c5', N'36fc2c43-be02-40ac-ae1d-0d7dee3c5a10', N'GRETTEL DE LOS ANGELES', N'CRUZ CHINCHILLA', N'F', CAST(0x00006EAD00000000 AS DateTime), N'f99afe4a-f84b-49f2-b88a-a64a71c85ed8', N'35e8dde8-9380-4d17-a30a-25ae2e0fb432', N'88270621', NULL, NULL, 0)
INSERT [dbo].[Student] ([StudentID], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress], [UserID], [IdentificationTypeID], [FirstName], [LastName], [Gender], [DateOfBirth], [CountryID], [MaritalStatusTypeID], [Phone1], [Phone2], [Phone3], [IsAppUser]) VALUES (N'932e5a45-db88-42de-af02-3e275dcde884', NULL, NULL, CAST(0x0000A17800000000 AS DateTime), N'09e4d1cd-a983-432a-80a9-2fc910e920d2', N'172.17.1.198', N'ae9feade-aafe-470d-8882-a1c4a1813343', N'f18e97f6-b298-4f23-8a97-17f0fe527e5f', N'EDWIN', N'CASTRO BOSCHINI', N'M', CAST(0x0000513200000000 AS DateTime), N'f99afe4a-f84b-49f2-b88a-a64a71c85ed8', N'35e8dde8-9380-4d17-a30a-25ae2e0fb432', N'8384 2496', NULL, NULL, 0)
INSERT [dbo].[Student] ([StudentID], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress], [UserID], [IdentificationTypeID], [FirstName], [LastName], [Gender], [DateOfBirth], [CountryID], [MaritalStatusTypeID], [Phone1], [Phone2], [Phone3], [IsAppUser]) VALUES (N'2ebf25f3-c043-4dd5-9c01-3e975bf83bcd', NULL, NULL, CAST(0x0000A17E00000000 AS DateTime), N'09e4d1cd-a983-432a-80a9-2fc910e920d2', N'172.26.91.211', N'6f94a283-e581-4378-ac39-38236a3d47f3', N'36fc2c43-be02-40ac-ae1d-0d7dee3c5a10', N'Luis Adrián', N'Gonzáles Villegas', N'M', CAST(0x00006DBD00000000 AS DateTime), N'f99afe4a-f84b-49f2-b88a-a64a71c85ed8', N'35e8dde8-9380-4d17-a30a-25ae2e0fb432', N'8608 1855', NULL, NULL, 0)
INSERT [dbo].[Student] ([StudentID], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress], [UserID], [IdentificationTypeID], [FirstName], [LastName], [Gender], [DateOfBirth], [CountryID], [MaritalStatusTypeID], [Phone1], [Phone2], [Phone3], [IsAppUser]) VALUES (N'b544131a-289e-4134-9910-4430aa24bee5', NULL, NULL, CAST(0x0000A17F00000000 AS DateTime), N'09e4d1cd-a983-432a-80a9-2fc910e920d2', N'172.17.3.242', N'ee7735f6-3179-4b91-a3cf-4961de469d80', N'36fc2c43-be02-40ac-ae1d-0d7dee3c5a10', N'MAYLIN', N'GONZALEZ PORRAS', N'F', CAST(0x000077E100000000 AS DateTime), N'f99afe4a-f84b-49f2-b88a-a64a71c85ed8', N'35e8dde8-9380-4d17-a30a-25ae2e0fb432', N'8824 1001', NULL, NULL, 0)
INSERT [dbo].[Student] ([StudentID], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress], [UserID], [IdentificationTypeID], [FirstName], [LastName], [Gender], [DateOfBirth], [CountryID], [MaritalStatusTypeID], [Phone1], [Phone2], [Phone3], [IsAppUser]) VALUES (N'e94451a2-135f-46cc-9e1e-45b6978d769d', NULL, NULL, CAST(0x0000A17800000000 AS DateTime), N'09e4d1cd-a983-432a-80a9-2fc910e920d2', N'172.17.1.198', N'94ea1830-6fbb-4a1f-b114-8b9cf482b0bd', N'f18e97f6-b298-4f23-8a97-17f0fe527e5f', N'ALVARO GERMAN', N'SOLANO LOBO', N'M', CAST(0x000067F400000000 AS DateTime), N'f99afe4a-f84b-49f2-b88a-a64a71c85ed8', N'35e8dde8-9380-4d17-a30a-25ae2e0fb432', N'0', N'2710-6869', NULL, 0)
INSERT [dbo].[Student] ([StudentID], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress], [UserID], [IdentificationTypeID], [FirstName], [LastName], [Gender], [DateOfBirth], [CountryID], [MaritalStatusTypeID], [Phone1], [Phone2], [Phone3], [IsAppUser]) VALUES (N'0cd478b0-ac7e-404d-be58-4770466af2fe', NULL, NULL, CAST(0x0000A17800000000 AS DateTime), N'09e4d1cd-a983-432a-80a9-2fc910e920d2', N'172.17.1.198', N'a1500fb0-d2a5-44f2-97ac-ab7002763037', N'f18e97f6-b298-4f23-8a97-17f0fe527e5f', N'REBECA PATRICIA', N'ELIZONDO RODRIGUEZ', N'F', CAST(0x0000742C00000000 AS DateTime), N'f99afe4a-f84b-49f2-b88a-a64a71c85ed8', N'35e8dde8-9380-4d17-a30a-25ae2e0fb432', N'88221022 / 71346029', NULL, NULL, 0)
INSERT [dbo].[Student] ([StudentID], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress], [UserID], [IdentificationTypeID], [FirstName], [LastName], [Gender], [DateOfBirth], [CountryID], [MaritalStatusTypeID], [Phone1], [Phone2], [Phone3], [IsAppUser]) VALUES (N'7384e2a2-7a6a-4e34-a2be-47a2a8c8773d', NULL, NULL, CAST(0x0000A17800000000 AS DateTime), N'09e4d1cd-a983-432a-80a9-2fc910e920d2', N'172.17.1.198', N'4fa1031d-8d96-4b14-a9e0-c2c849d6924a', N'36fc2c43-be02-40ac-ae1d-0d7dee3c5a10', N'CARLOS LUIS', N'CAMPOS ROSALES', N'M', CAST(0x0000675400000000 AS DateTime), N'f99afe4a-f84b-49f2-b88a-a64a71c85ed8', N'35e8dde8-9380-4d17-a30a-25ae2e0fb432', N'0', N'2710-6869', NULL, 0)
INSERT [dbo].[Student] ([StudentID], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress], [UserID], [IdentificationTypeID], [FirstName], [LastName], [Gender], [DateOfBirth], [CountryID], [MaritalStatusTypeID], [Phone1], [Phone2], [Phone3], [IsAppUser]) VALUES (N'34eee677-b536-43f8-a299-485f4095e742', NULL, NULL, CAST(0x0000A17F00000000 AS DateTime), N'09e4d1cd-a983-432a-80a9-2fc910e920d2', N'172.17.3.242', N'1403268e-d6d7-46e4-a3f2-7ec2f299253c', N'f18e97f6-b298-4f23-8a97-17f0fe527e5f', N'MANUEL ANTONIO', N' ALVARADO UMANZOR', N'M', CAST(0x000062A500000000 AS DateTime), N'f99afe4a-f84b-49f2-b88a-a64a71c85ed8', N'35e8dde8-9380-4d17-a30a-25ae2e0fb432', N'8889 5824', NULL, NULL, 0)
INSERT [dbo].[Student] ([StudentID], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress], [UserID], [IdentificationTypeID], [FirstName], [LastName], [Gender], [DateOfBirth], [CountryID], [MaritalStatusTypeID], [Phone1], [Phone2], [Phone3], [IsAppUser]) VALUES (N'2c2af8ce-ab18-49ad-b45a-48c9503f5818', NULL, NULL, CAST(0x0000A17E00000000 AS DateTime), N'09e4d1cd-a983-432a-80a9-2fc910e920d2', N'172.26.91.211', N'f9f012d1-e177-47f5-bc60-ca288d780dd4', N'f18e97f6-b298-4f23-8a97-17f0fe527e5f', N'ALEJANDRO', N'CALDERON CAMACHO', N'M', CAST(0x00006BE300000000 AS DateTime), N'f99afe4a-f84b-49f2-b88a-a64a71c85ed8', N'35e8dde8-9380-4d17-a30a-25ae2e0fb432', N'85311582', NULL, NULL, 0)
INSERT [dbo].[Student] ([StudentID], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress], [UserID], [IdentificationTypeID], [FirstName], [LastName], [Gender], [DateOfBirth], [CountryID], [MaritalStatusTypeID], [Phone1], [Phone2], [Phone3], [IsAppUser]) VALUES (N'54f1afd3-fcf5-4ca2-8269-4a9966e320c4', NULL, NULL, CAST(0x0000A17F00000000 AS DateTime), N'09e4d1cd-a983-432a-80a9-2fc910e920d2', N'172.17.3.242', N'1469f96d-0236-4ce3-bf26-2f6d74e3e8c6', N'f18e97f6-b298-4f23-8a97-17f0fe527e5f', N'JOSE ANGEL', N' ALPIZAR SALAZAR', N'M', CAST(0x0000569A00000000 AS DateTime), N'f99afe4a-f84b-49f2-b88a-a64a71c85ed8', N'35e8dde8-9380-4d17-a30a-25ae2e0fb432', N'8818-1358', NULL, NULL, 0)
INSERT [dbo].[Student] ([StudentID], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress], [UserID], [IdentificationTypeID], [FirstName], [LastName], [Gender], [DateOfBirth], [CountryID], [MaritalStatusTypeID], [Phone1], [Phone2], [Phone3], [IsAppUser]) VALUES (N'22a61bef-084d-46aa-86c5-4c5ddb7072c5', NULL, NULL, CAST(0x0000A17F00000000 AS DateTime), N'09e4d1cd-a983-432a-80a9-2fc910e920d2', N'172.17.3.242', N'0d122016-8c8c-4716-800e-2d6ca55e5035', N'36fc2c43-be02-40ac-ae1d-0d7dee3c5a10', N'JORGE MAURICIO', N'MIRANDA BRAVO', N'M', CAST(0x00006A1B00000000 AS DateTime), N'f99afe4a-f84b-49f2-b88a-a64a71c85ed8', N'35e8dde8-9380-4d17-a30a-25ae2e0fb432', N'8990-1588', NULL, NULL, 0)
INSERT [dbo].[Student] ([StudentID], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress], [UserID], [IdentificationTypeID], [FirstName], [LastName], [Gender], [DateOfBirth], [CountryID], [MaritalStatusTypeID], [Phone1], [Phone2], [Phone3], [IsAppUser]) VALUES (N'e0050b57-731f-417d-9d10-4cd3d1b57532', NULL, NULL, CAST(0x0000A17800000000 AS DateTime), N'09e4d1cd-a983-432a-80a9-2fc910e920d2', N'172.17.1.198', N'ebb71c3e-be87-49cd-9171-2bd780a6072f', N'36fc2c43-be02-40ac-ae1d-0d7dee3c5a10', N'DOMINGO ANTONIO', N'ESPINOZA LOPEZ', N'M', CAST(0x000050BD00000000 AS DateTime), N'f99afe4a-f84b-49f2-b88a-a64a71c85ed8', N'35e8dde8-9380-4d17-a30a-25ae2e0fb432', N'8828 8661', NULL, NULL, 0)
INSERT [dbo].[Student] ([StudentID], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress], [UserID], [IdentificationTypeID], [FirstName], [LastName], [Gender], [DateOfBirth], [CountryID], [MaritalStatusTypeID], [Phone1], [Phone2], [Phone3], [IsAppUser]) VALUES (N'18bd6365-24c9-4664-abc1-4d250c8ee5d5', NULL, NULL, CAST(0x0000A17F00000000 AS DateTime), N'09e4d1cd-a983-432a-80a9-2fc910e920d2', N'172.17.3.242', N'8dba8e08-01a5-4381-9eac-9d998830a6df', N'36fc2c43-be02-40ac-ae1d-0d7dee3c5a10', N'LIDIANET', N'GARCIA VALERIO', N'F', CAST(0x00005E8500000000 AS DateTime), N'f99afe4a-f84b-49f2-b88a-a64a71c85ed8', N'35e8dde8-9380-4d17-a30a-25ae2e0fb432', N'8870 6644', NULL, NULL, 0)
INSERT [dbo].[Student] ([StudentID], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress], [UserID], [IdentificationTypeID], [FirstName], [LastName], [Gender], [DateOfBirth], [CountryID], [MaritalStatusTypeID], [Phone1], [Phone2], [Phone3], [IsAppUser]) VALUES (N'5e0be4db-e001-41f0-beb3-4d9b8c3b8c7b', NULL, NULL, CAST(0x0000A17F00000000 AS DateTime), N'09e4d1cd-a983-432a-80a9-2fc910e920d2', N'172.17.3.242', N'f9439a9a-11a0-40ce-accc-e23fc5ae8f3c', N'f18e97f6-b298-4f23-8a97-17f0fe527e5f', N'ANA ISABEL', N'PEREZ BARRANTES', N'F', CAST(0x000059EE00000000 AS DateTime), N'f99afe4a-f84b-49f2-b88a-a64a71c85ed8', N'35e8dde8-9380-4d17-a30a-25ae2e0fb432', N'0', N'2252-0051', NULL, 0)
INSERT [dbo].[Student] ([StudentID], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress], [UserID], [IdentificationTypeID], [FirstName], [LastName], [Gender], [DateOfBirth], [CountryID], [MaritalStatusTypeID], [Phone1], [Phone2], [Phone3], [IsAppUser]) VALUES (N'faf8546a-346f-4442-985d-507ef55970ab', NULL, NULL, CAST(0x0000A17E00000000 AS DateTime), N'09e4d1cd-a983-432a-80a9-2fc910e920d2', N'172.26.91.211', N'8b185310-8774-493b-a1ad-6e58c789e4b9', N'f18e97f6-b298-4f23-8a97-17f0fe527e5f', N'Aldo', N'Protti Matteucci', N'M', CAST(0x0000539200000000 AS DateTime), N'f99afe4a-f84b-49f2-b88a-a64a71c85ed8', N'35e8dde8-9380-4d17-a30a-25ae2e0fb432', N'8384 0397', NULL, NULL, 0)
INSERT [dbo].[Student] ([StudentID], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress], [UserID], [IdentificationTypeID], [FirstName], [LastName], [Gender], [DateOfBirth], [CountryID], [MaritalStatusTypeID], [Phone1], [Phone2], [Phone3], [IsAppUser]) VALUES (N'bc71514d-cc11-4866-92f1-51af8c5624e3', NULL, NULL, CAST(0x0000A17800000000 AS DateTime), N'09e4d1cd-a983-432a-80a9-2fc910e920d2', N'172.17.1.198', N'9d1241d3-d8a4-48b7-8edc-147c3a538a25', N'36fc2c43-be02-40ac-ae1d-0d7dee3c5a10', N'ERICK LEONARDO', N'CHAVES HERNANDEZ', N'M', CAST(0x0000733A00000000 AS DateTime), N'f99afe4a-f84b-49f2-b88a-a64a71c85ed8', N'35e8dde8-9380-4d17-a30a-25ae2e0fb432', N'8334-9912', NULL, NULL, 0)
INSERT [dbo].[Student] ([StudentID], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress], [UserID], [IdentificationTypeID], [FirstName], [LastName], [Gender], [DateOfBirth], [CountryID], [MaritalStatusTypeID], [Phone1], [Phone2], [Phone3], [IsAppUser]) VALUES (N'37e44d5c-89b2-4f19-8c70-521847a66934', NULL, NULL, CAST(0x0000A17E00000000 AS DateTime), N'09e4d1cd-a983-432a-80a9-2fc910e920d2', N'172.26.91.211', N'f7b84ea1-5c2a-49f0-98a5-279a3ace876e', N'f18e97f6-b298-4f23-8a97-17f0fe527e5f', N'ANTONIO', N'BERMUDEZ MURILLO', N'M', CAST(0x00005C8A00000000 AS DateTime), N'f99afe4a-f84b-49f2-b88a-a64a71c85ed8', N'35e8dde8-9380-4d17-a30a-25ae2e0fb432', N'83942041', NULL, NULL, 0)
INSERT [dbo].[Student] ([StudentID], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress], [UserID], [IdentificationTypeID], [FirstName], [LastName], [Gender], [DateOfBirth], [CountryID], [MaritalStatusTypeID], [Phone1], [Phone2], [Phone3], [IsAppUser]) VALUES (N'76ed9d81-d121-4a55-b8a4-5312c9703824', NULL, NULL, CAST(0x0000A17F00000000 AS DateTime), N'09e4d1cd-a983-432a-80a9-2fc910e920d2', N'172.17.3.242', N'e6eca7c1-e3b8-48e8-90ea-381f6bd7d1f1', N'36fc2c43-be02-40ac-ae1d-0d7dee3c5a10', N'ISABEL MARIA', N'CORDERO FERNANDEZ', N'F', CAST(0x000055F800000000 AS DateTime), N'f99afe4a-f84b-49f2-b88a-a64a71c85ed8', N'35e8dde8-9380-4d17-a30a-25ae2e0fb432', N'8355 0708', NULL, NULL, 0)
INSERT [dbo].[Student] ([StudentID], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress], [UserID], [IdentificationTypeID], [FirstName], [LastName], [Gender], [DateOfBirth], [CountryID], [MaritalStatusTypeID], [Phone1], [Phone2], [Phone3], [IsAppUser]) VALUES (N'49e0c307-5a55-4326-9787-55b1cd46cc63', NULL, NULL, CAST(0x0000A17F00000000 AS DateTime), N'09e4d1cd-a983-432a-80a9-2fc910e920d2', N'172.17.3.242', N'506c0f75-8b9b-429e-bbfb-84a0fbdf8281', N'f18e97f6-b298-4f23-8a97-17f0fe527e5f', N'ZAIDA MARIA', N'CAMACHO AGUILAR', N'F', CAST(0x0000530000000000 AS DateTime), N'f99afe4a-f84b-49f2-b88a-a64a71c85ed8', N'35e8dde8-9380-4d17-a30a-25ae2e0fb432', N'83845801', NULL, NULL, 0)
INSERT [dbo].[Student] ([StudentID], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress], [UserID], [IdentificationTypeID], [FirstName], [LastName], [Gender], [DateOfBirth], [CountryID], [MaritalStatusTypeID], [Phone1], [Phone2], [Phone3], [IsAppUser]) VALUES (N'a8d99a4b-8f54-4d52-9761-597eebb13471', NULL, NULL, CAST(0x0000A17800000000 AS DateTime), N'09e4d1cd-a983-432a-80a9-2fc910e920d2', N'172.17.1.198', N'd594f477-dacb-414a-b34b-cf0937457b36', N'f18e97f6-b298-4f23-8a97-17f0fe527e5f', N'JAVIER ALFONSO', N' LEANDRO MARIN', N'M', CAST(0x000050E400000000 AS DateTime), N'f99afe4a-f84b-49f2-b88a-a64a71c85ed8', N'35e8dde8-9380-4d17-a30a-25ae2e0fb432', N'8829 7310', NULL, NULL, 0)
INSERT [dbo].[Student] ([StudentID], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress], [UserID], [IdentificationTypeID], [FirstName], [LastName], [Gender], [DateOfBirth], [CountryID], [MaritalStatusTypeID], [Phone1], [Phone2], [Phone3], [IsAppUser]) VALUES (N'fa0f13f3-6036-441e-a875-5e46afe84ac2', NULL, NULL, CAST(0x0000A17800000000 AS DateTime), N'09e4d1cd-a983-432a-80a9-2fc910e920d2', N'172.17.1.198', N'28d9cc12-7efe-4fb9-a2d4-6126dd744408', N'f18e97f6-b298-4f23-8a97-17f0fe527e5f', N'FREDDY HERMES', N'FALLAS JIMENEZ', N'M', CAST(0x0000527600000000 AS DateTime), N'f99afe4a-f84b-49f2-b88a-a64a71c85ed8', N'35e8dde8-9380-4d17-a30a-25ae2e0fb432', N'88414590', NULL, NULL, 0)
INSERT [dbo].[Student] ([StudentID], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress], [UserID], [IdentificationTypeID], [FirstName], [LastName], [Gender], [DateOfBirth], [CountryID], [MaritalStatusTypeID], [Phone1], [Phone2], [Phone3], [IsAppUser]) VALUES (N'c1a40bc8-270c-4845-82f0-5e7b3fc2b72c', NULL, NULL, CAST(0x0000A17F00000000 AS DateTime), N'09e4d1cd-a983-432a-80a9-2fc910e920d2', N'172.17.3.242', N'4595be71-2715-40dc-8c14-54780ece4f8f', N'f18e97f6-b298-4f23-8a97-17f0fe527e5f', N'RANDAL', N'CONTRERAS MONTES DE OCA', N'M', CAST(0x000055BB00000000 AS DateTime), N'f99afe4a-f84b-49f2-b88a-a64a71c85ed8', N'35e8dde8-9380-4d17-a30a-25ae2e0fb432', N'8703-8664', NULL, NULL, 0)
INSERT [dbo].[Student] ([StudentID], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress], [UserID], [IdentificationTypeID], [FirstName], [LastName], [Gender], [DateOfBirth], [CountryID], [MaritalStatusTypeID], [Phone1], [Phone2], [Phone3], [IsAppUser]) VALUES (N'e83b309c-66ea-4b84-897f-5f888412660c', NULL, NULL, CAST(0x0000A17F00000000 AS DateTime), N'09e4d1cd-a983-432a-80a9-2fc910e920d2', N'172.17.3.242', N'02a769e4-464c-40a3-97c7-5bbf99a241e2', N'36fc2c43-be02-40ac-ae1d-0d7dee3c5a10', N'ANA MARIA', N'COTO MEZA', N'F', CAST(0x000067FC00000000 AS DateTime), N'f99afe4a-f84b-49f2-b88a-a64a71c85ed8', N'35e8dde8-9380-4d17-a30a-25ae2e0fb432', N'86019055', NULL, NULL, 0)
INSERT [dbo].[Student] ([StudentID], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress], [UserID], [IdentificationTypeID], [FirstName], [LastName], [Gender], [DateOfBirth], [CountryID], [MaritalStatusTypeID], [Phone1], [Phone2], [Phone3], [IsAppUser]) VALUES (N'9814e05e-acc9-4acb-a15e-607d808dc2fc', NULL, NULL, CAST(0x0000A17F00000000 AS DateTime), N'09e4d1cd-a983-432a-80a9-2fc910e920d2', N'172.17.3.242', N'f1d11c86-1f1c-4a7e-8a3d-1ceb670134d4', N'f18e97f6-b298-4f23-8a97-17f0fe527e5f', N'LEONARDE', N'BARRANTES ALFARO', N'M', CAST(0x00007A3200000000 AS DateTime), N'f99afe4a-f84b-49f2-b88a-a64a71c85ed8', N'35e8dde8-9380-4d17-a30a-25ae2e0fb432', N'88240586', NULL, NULL, 0)
INSERT [dbo].[Student] ([StudentID], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress], [UserID], [IdentificationTypeID], [FirstName], [LastName], [Gender], [DateOfBirth], [CountryID], [MaritalStatusTypeID], [Phone1], [Phone2], [Phone3], [IsAppUser]) VALUES (N'b4f7c79b-3f7f-4025-a06c-60fc6e5ac00b', NULL, NULL, CAST(0x0000A17F00000000 AS DateTime), N'09e4d1cd-a983-432a-80a9-2fc910e920d2', N'172.17.3.242', N'af29b636-918e-4430-8db3-0a0df4c07170', N'f18e97f6-b298-4f23-8a97-17f0fe527e5f', N'JORGE ARTURO', N'SOLIS JAIME', N'M', CAST(0x00006DB700000000 AS DateTime), N'f99afe4a-f84b-49f2-b88a-a64a71c85ed8', N'35e8dde8-9380-4d17-a30a-25ae2e0fb432', N'88329923', NULL, NULL, 0)
INSERT [dbo].[Student] ([StudentID], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress], [UserID], [IdentificationTypeID], [FirstName], [LastName], [Gender], [DateOfBirth], [CountryID], [MaritalStatusTypeID], [Phone1], [Phone2], [Phone3], [IsAppUser]) VALUES (N'57edc091-818d-43c7-89cc-620c9d287cf0', NULL, NULL, CAST(0x0000A17E00000000 AS DateTime), N'09e4d1cd-a983-432a-80a9-2fc910e920d2', N'172.26.91.211', N'0a0f5d8e-9a39-4c12-8d7d-5a5a684a8096', N'f18e97f6-b298-4f23-8a97-17f0fe527e5f', N'GERMAN', N'HERRERA FLORES', N'M', CAST(0x000045CF00000000 AS DateTime), N'f99afe4a-f84b-49f2-b88a-a64a71c85ed8', N'35e8dde8-9380-4d17-a30a-25ae2e0fb432', N'87017321', NULL, NULL, 0)
INSERT [dbo].[Student] ([StudentID], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress], [UserID], [IdentificationTypeID], [FirstName], [LastName], [Gender], [DateOfBirth], [CountryID], [MaritalStatusTypeID], [Phone1], [Phone2], [Phone3], [IsAppUser]) VALUES (N'01766e10-229f-42ba-a0de-641ff20c5300', NULL, NULL, CAST(0x0000A17F00000000 AS DateTime), N'09e4d1cd-a983-432a-80a9-2fc910e920d2', N'172.17.3.242', N'a1c5b1c1-4398-4ef7-9479-92aec0674353', N'36fc2c43-be02-40ac-ae1d-0d7dee3c5a10', N'MARIA ISABEL', N'MOYA QUIROS', N'F', CAST(0x00005C4D00000000 AS DateTime), N'f99afe4a-f84b-49f2-b88a-a64a71c85ed8', N'35e8dde8-9380-4d17-a30a-25ae2e0fb432', N'8830 3010', NULL, NULL, 0)
INSERT [dbo].[Student] ([StudentID], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress], [UserID], [IdentificationTypeID], [FirstName], [LastName], [Gender], [DateOfBirth], [CountryID], [MaritalStatusTypeID], [Phone1], [Phone2], [Phone3], [IsAppUser]) VALUES (N'344eba78-e90e-4cf5-9361-64e5c337a906', NULL, NULL, CAST(0x0000A17F00000000 AS DateTime), N'09e4d1cd-a983-432a-80a9-2fc910e920d2', N'172.17.3.242', N'6da64653-1ff8-4938-8ecb-dee4b914ca8a', N'f18e97f6-b298-4f23-8a97-17f0fe527e5f', N'GIOVANNI ANSELMO', N'DURAN AGUILAR', N'M', CAST(0x0000660900000000 AS DateTime), N'f99afe4a-f84b-49f2-b88a-a64a71c85ed8', N'35e8dde8-9380-4d17-a30a-25ae2e0fb432', N'8347 7373', NULL, NULL, 0)
INSERT [dbo].[Student] ([StudentID], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress], [UserID], [IdentificationTypeID], [FirstName], [LastName], [Gender], [DateOfBirth], [CountryID], [MaritalStatusTypeID], [Phone1], [Phone2], [Phone3], [IsAppUser]) VALUES (N'862acc12-627d-4cf9-b81b-68ff6260fe6f', NULL, NULL, CAST(0x0000A17E00000000 AS DateTime), N'09e4d1cd-a983-432a-80a9-2fc910e920d2', N'172.26.91.211', N'863ee975-9a5b-4321-9ea7-5dc2405ad0bb', N'f18e97f6-b298-4f23-8a97-17f0fe527e5f', N'LUIS ', N'CORDERO ARGUEDAS', N'M', CAST(0x0000676F00000000 AS DateTime), N'f99afe4a-f84b-49f2-b88a-a64a71c85ed8', N'35e8dde8-9380-4d17-a30a-25ae2e0fb432', N'8322-6117', NULL, NULL, 0)
INSERT [dbo].[Student] ([StudentID], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress], [UserID], [IdentificationTypeID], [FirstName], [LastName], [Gender], [DateOfBirth], [CountryID], [MaritalStatusTypeID], [Phone1], [Phone2], [Phone3], [IsAppUser]) VALUES (N'39af061a-cc71-41aa-bbdf-6b9804f31073', NULL, NULL, CAST(0x0000A17F00000000 AS DateTime), N'09e4d1cd-a983-432a-80a9-2fc910e920d2', N'172.17.3.242', N'd3da52df-af8d-485d-a284-c68e91caa072', N'36fc2c43-be02-40ac-ae1d-0d7dee3c5a10', N'MIREYA', N'RODRIGUEZ HERNANDEZ', N'F', CAST(0x0000A17800000000 AS DateTime), N'f99afe4a-f84b-49f2-b88a-a64a71c85ed8', N'35e8dde8-9380-4d17-a30a-25ae2e0fb432', N'88710037', NULL, NULL, 0)
INSERT [dbo].[Student] ([StudentID], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress], [UserID], [IdentificationTypeID], [FirstName], [LastName], [Gender], [DateOfBirth], [CountryID], [MaritalStatusTypeID], [Phone1], [Phone2], [Phone3], [IsAppUser]) VALUES (N'9ab42a61-d6e0-4866-a260-701772249bc4', NULL, NULL, CAST(0x0000A17F00000000 AS DateTime), N'09e4d1cd-a983-432a-80a9-2fc910e920d2', N'172.17.3.242', N'a9991d74-8e56-4018-87ba-0dc3501084e2', N'f18e97f6-b298-4f23-8a97-17f0fe527e5f', N'ROXANA', N'RAMIREZ MENESES', N'F', CAST(0x00004CC700000000 AS DateTime), N'f99afe4a-f84b-49f2-b88a-a64a71c85ed8', N'35e8dde8-9380-4d17-a30a-25ae2e0fb432', N'88447144', NULL, NULL, 0)
INSERT [dbo].[Student] ([StudentID], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress], [UserID], [IdentificationTypeID], [FirstName], [LastName], [Gender], [DateOfBirth], [CountryID], [MaritalStatusTypeID], [Phone1], [Phone2], [Phone3], [IsAppUser]) VALUES (N'fc957a81-2dae-4ead-91d8-70f2e40e2865', NULL, NULL, CAST(0x0000A17800000000 AS DateTime), N'09e4d1cd-a983-432a-80a9-2fc910e920d2', N'172.17.1.198', N'f2bb2f46-d293-4f75-8d91-b20809d9ef3b', N'36fc2c43-be02-40ac-ae1d-0d7dee3c5a10', N'OSCAR EDUARDO', N'MUÑOZ CHACON', N'M', CAST(0x000050B800000000 AS DateTime), N'f99afe4a-f84b-49f2-b88a-a64a71c85ed8', N'35e8dde8-9380-4d17-a30a-25ae2e0fb432', N'83625673', NULL, NULL, 0)
INSERT [dbo].[Student] ([StudentID], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress], [UserID], [IdentificationTypeID], [FirstName], [LastName], [Gender], [DateOfBirth], [CountryID], [MaritalStatusTypeID], [Phone1], [Phone2], [Phone3], [IsAppUser]) VALUES (N'36080075-2f89-4c02-bb5e-71e8e4c9f53a', NULL, NULL, CAST(0x0000A17F00000000 AS DateTime), N'09e4d1cd-a983-432a-80a9-2fc910e920d2', N'172.17.3.242', N'0f1c0606-d31b-472e-87a4-3fa7997f7d4f', N'f18e97f6-b298-4f23-8a97-17f0fe527e5f', N'MARIO ANTONIO', N'ZUÑIGA ARCE', N'M', CAST(0x00005D5700000000 AS DateTime), N'f99afe4a-f84b-49f2-b88a-a64a71c85ed8', N'35e8dde8-9380-4d17-a30a-25ae2e0fb432', N'0', N'22602196', NULL, 0)
INSERT [dbo].[Student] ([StudentID], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress], [UserID], [IdentificationTypeID], [FirstName], [LastName], [Gender], [DateOfBirth], [CountryID], [MaritalStatusTypeID], [Phone1], [Phone2], [Phone3], [IsAppUser]) VALUES (N'23938bff-002c-4b70-92f4-73d38fef3c4a', NULL, NULL, CAST(0x0000A17E00000000 AS DateTime), N'09e4d1cd-a983-432a-80a9-2fc910e920d2', N'172.26.91.211', N'9d112d71-580e-4af0-b4be-f01a2a95b3be', N'f18e97f6-b298-4f23-8a97-17f0fe527e5f', N'ZOILA', N'GEORGE HERMAN', N'F', CAST(0x0000542F00000000 AS DateTime), N'f99afe4a-f84b-49f2-b88a-a64a71c85ed8', N'35e8dde8-9380-4d17-a30a-25ae2e0fb432', N'8385-8668', NULL, NULL, 0)
INSERT [dbo].[Student] ([StudentID], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress], [UserID], [IdentificationTypeID], [FirstName], [LastName], [Gender], [DateOfBirth], [CountryID], [MaritalStatusTypeID], [Phone1], [Phone2], [Phone3], [IsAppUser]) VALUES (N'7931cdf5-f5c5-4be1-8c44-762c0c575b41', NULL, NULL, CAST(0x0000A17800000000 AS DateTime), N'09e4d1cd-a983-432a-80a9-2fc910e920d2', N'172.17.1.198', N'c49386dc-3243-4e1b-8f4e-f2d07ca1ffc1', N'f18e97f6-b298-4f23-8a97-17f0fe527e5f', N'CARLOS LUIS', N'GARRO FERNANDEZ', N'M', CAST(0x00005CB600000000 AS DateTime), N'f99afe4a-f84b-49f2-b88a-a64a71c85ed8', N'35e8dde8-9380-4d17-a30a-25ae2e0fb432', N'8347-1028', NULL, NULL, 0)
INSERT [dbo].[Student] ([StudentID], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress], [UserID], [IdentificationTypeID], [FirstName], [LastName], [Gender], [DateOfBirth], [CountryID], [MaritalStatusTypeID], [Phone1], [Phone2], [Phone3], [IsAppUser]) VALUES (N'422b2e9b-a668-4a15-88e9-7ca31ebb8e1d', NULL, NULL, CAST(0x0000A17800000000 AS DateTime), N'09e4d1cd-a983-432a-80a9-2fc910e920d2', N'172.17.1.198', N'8b8b61e9-0892-4dba-b72b-e4b52c15dabe', N'f18e97f6-b298-4f23-8a97-17f0fe527e5f', N'EDWIN', N'ALFARO QUESADA', N'M', CAST(0x000047A500000000 AS DateTime), N'f99afe4a-f84b-49f2-b88a-a64a71c85ed8', N'35e8dde8-9380-4d17-a30a-25ae2e0fb432', N'8919 2956', NULL, NULL, 0)
INSERT [dbo].[Student] ([StudentID], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress], [UserID], [IdentificationTypeID], [FirstName], [LastName], [Gender], [DateOfBirth], [CountryID], [MaritalStatusTypeID], [Phone1], [Phone2], [Phone3], [IsAppUser]) VALUES (N'a37a786d-9f8c-4202-9ca9-7d86ec21d5a7', NULL, NULL, CAST(0x0000A17F00000000 AS DateTime), N'09e4d1cd-a983-432a-80a9-2fc910e920d2', N'172.17.3.242', N'a8f3c61e-6fcb-4274-b82c-147b38771f22', N'f18e97f6-b298-4f23-8a97-17f0fe527e5f', N'PRISCILA MARIA', N'RAMIREZ CHAVARRIA', N'F', CAST(0x0000709800000000 AS DateTime), N'f99afe4a-f84b-49f2-b88a-a64a71c85ed8', N'35e8dde8-9380-4d17-a30a-25ae2e0fb432', N'8741 9695', NULL, NULL, 0)
INSERT [dbo].[Student] ([StudentID], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress], [UserID], [IdentificationTypeID], [FirstName], [LastName], [Gender], [DateOfBirth], [CountryID], [MaritalStatusTypeID], [Phone1], [Phone2], [Phone3], [IsAppUser]) VALUES (N'bc9279af-e620-4e92-8b01-7d9f2c335cdc', NULL, NULL, CAST(0x0000A17E00000000 AS DateTime), N'09e4d1cd-a983-432a-80a9-2fc910e920d2', N'172.26.91.211', N'24be72bc-9108-4bd6-bbeb-aaeeb5e757f9', N'f18e97f6-b298-4f23-8a97-17f0fe527e5f', N'MARCO ANTONIO', N'ROJAS PORRAS', N'M', CAST(0x00004B6800000000 AS DateTime), N'f99afe4a-f84b-49f2-b88a-a64a71c85ed8', N'35e8dde8-9380-4d17-a30a-25ae2e0fb432', N'83822081', NULL, NULL, 0)
INSERT [dbo].[Student] ([StudentID], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress], [UserID], [IdentificationTypeID], [FirstName], [LastName], [Gender], [DateOfBirth], [CountryID], [MaritalStatusTypeID], [Phone1], [Phone2], [Phone3], [IsAppUser]) VALUES (N'cc470e14-252f-49e3-babc-7e0cfebe2504', NULL, NULL, CAST(0x0000A17800000000 AS DateTime), N'09e4d1cd-a983-432a-80a9-2fc910e920d2', N'172.17.1.198', N'9ea890aa-35c5-4984-a1ed-3aba1df217c9', N'f18e97f6-b298-4f23-8a97-17f0fe527e5f', N'BERNAL', N'CENTENO MADRIGAL', N'M', CAST(0x0000511100000000 AS DateTime), N'f99afe4a-f84b-49f2-b88a-a64a71c85ed8', N'35e8dde8-9380-4d17-a30a-25ae2e0fb432', N'8399 8312', NULL, NULL, 0)
INSERT [dbo].[Student] ([StudentID], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress], [UserID], [IdentificationTypeID], [FirstName], [LastName], [Gender], [DateOfBirth], [CountryID], [MaritalStatusTypeID], [Phone1], [Phone2], [Phone3], [IsAppUser]) VALUES (N'2a90b094-2b43-4ef1-838e-7e44883235bf', NULL, NULL, CAST(0x0000A17800000000 AS DateTime), N'09e4d1cd-a983-432a-80a9-2fc910e920d2', N'172.17.1.198', N'aa323aaa-7184-46e8-8605-616e0a15119b', N'36fc2c43-be02-40ac-ae1d-0d7dee3c5a10', N'VICTOR HUGO', N'CESPEDES SEGURA', N'M', CAST(0x000056A100000000 AS DateTime), N'f99afe4a-f84b-49f2-b88a-a64a71c85ed8', N'35e8dde8-9380-4d17-a30a-25ae2e0fb432', N'8362-3131', NULL, NULL, 0)
INSERT [dbo].[Student] ([StudentID], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress], [UserID], [IdentificationTypeID], [FirstName], [LastName], [Gender], [DateOfBirth], [CountryID], [MaritalStatusTypeID], [Phone1], [Phone2], [Phone3], [IsAppUser]) VALUES (N'f143eac6-4058-49cf-8f2d-7fc0272f1c39', NULL, NULL, CAST(0x0000A17800000000 AS DateTime), N'09e4d1cd-a983-432a-80a9-2fc910e920d2', N'172.17.1.198', N'2788dc45-794c-48e0-bdb5-d2648b35514c', N'f18e97f6-b298-4f23-8a97-17f0fe527e5f', N'PAOLA CAROLINA', N'MORA LOPEZ', N'M', CAST(0x00006C8B00000000 AS DateTime), N'f99afe4a-f84b-49f2-b88a-a64a71c85ed8', N'35e8dde8-9380-4d17-a30a-25ae2e0fb432', N'88839353', NULL, NULL, 0)
INSERT [dbo].[Student] ([StudentID], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress], [UserID], [IdentificationTypeID], [FirstName], [LastName], [Gender], [DateOfBirth], [CountryID], [MaritalStatusTypeID], [Phone1], [Phone2], [Phone3], [IsAppUser]) VALUES (N'fe3e16d5-e628-4c7f-9100-80a37a0face2', NULL, NULL, CAST(0x0000A17F00000000 AS DateTime), N'09e4d1cd-a983-432a-80a9-2fc910e920d2', N'172.17.3.242', N'42b5d6a5-d9a8-447a-be25-d5ab4c986f6a', N'f18e97f6-b298-4f23-8a97-17f0fe527e5f', N'ISAAC ROBERTO', N'BUDOWSKI BONILLA', N'M', CAST(0x00004D3B00000000 AS DateTime), N'f99afe4a-f84b-49f2-b88a-a64a71c85ed8', N'35e8dde8-9380-4d17-a30a-25ae2e0fb432', N'8348 4346', NULL, NULL, 0)
INSERT [dbo].[Student] ([StudentID], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress], [UserID], [IdentificationTypeID], [FirstName], [LastName], [Gender], [DateOfBirth], [CountryID], [MaritalStatusTypeID], [Phone1], [Phone2], [Phone3], [IsAppUser]) VALUES (N'7b0ce887-f884-4b43-b55d-82d6ff350bca', NULL, NULL, CAST(0x0000A17E00000000 AS DateTime), N'09e4d1cd-a983-432a-80a9-2fc910e920d2', N'172.26.91.211', N'991ba8ed-ddba-43ff-8722-66c228c0f074', N'f18e97f6-b298-4f23-8a97-17f0fe527e5f', N'MARCO', N'CAMPOS GONZÁLEZ', N'M', CAST(0x00006D0200000000 AS DateTime), N'f99afe4a-f84b-49f2-b88a-a64a71c85ed8', N'35e8dde8-9380-4d17-a30a-25ae2e0fb432', N'0', N'22876000', NULL, 0)
INSERT [dbo].[Student] ([StudentID], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress], [UserID], [IdentificationTypeID], [FirstName], [LastName], [Gender], [DateOfBirth], [CountryID], [MaritalStatusTypeID], [Phone1], [Phone2], [Phone3], [IsAppUser]) VALUES (N'399a1d71-1a43-4550-8860-831f9a1e4ae7', NULL, NULL, CAST(0x0000A17E00000000 AS DateTime), N'09e4d1cd-a983-432a-80a9-2fc910e920d2', N'172.26.91.211', N'556e3fd5-4f0a-4601-8f26-3a091566b667', N'f18e97f6-b298-4f23-8a97-17f0fe527e5f', N'SOREL', N'BUSTOS CASTRO', N'F', CAST(0x0000715100000000 AS DateTime), N'f99afe4a-f84b-49f2-b88a-a64a71c85ed8', N'35e8dde8-9380-4d17-a30a-25ae2e0fb432', N'8318 8642', NULL, NULL, 0)
INSERT [dbo].[Student] ([StudentID], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress], [UserID], [IdentificationTypeID], [FirstName], [LastName], [Gender], [DateOfBirth], [CountryID], [MaritalStatusTypeID], [Phone1], [Phone2], [Phone3], [IsAppUser]) VALUES (N'1d98c3ae-34f8-4f6b-af4b-86bc2f3c856e', NULL, NULL, CAST(0x0000A17800000000 AS DateTime), N'09e4d1cd-a983-432a-80a9-2fc910e920d2', N'172.17.1.198', N'97b14396-7ab4-4094-9c4a-f06017a421de', N'f18e97f6-b298-4f23-8a97-17f0fe527e5f', N'EDGAR ANTONIO', N'SALAS ZUÑIGA', N'M', CAST(0x000050E700000000 AS DateTime), N'f99afe4a-f84b-49f2-b88a-a64a71c85ed8', N'35e8dde8-9380-4d17-a30a-25ae2e0fb432', N'0', N'2445-93-89', NULL, 0)
INSERT [dbo].[Student] ([StudentID], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress], [UserID], [IdentificationTypeID], [FirstName], [LastName], [Gender], [DateOfBirth], [CountryID], [MaritalStatusTypeID], [Phone1], [Phone2], [Phone3], [IsAppUser]) VALUES (N'e38ff246-0523-4e22-89ec-87c3bdb3dfa4', NULL, NULL, CAST(0x0000A17F00000000 AS DateTime), N'09e4d1cd-a983-432a-80a9-2fc910e920d2', N'172.17.3.242', N'40390a71-7344-47b5-bbd0-830addeb12ff', N'f18e97f6-b298-4f23-8a97-17f0fe527e5f', N'MANUEL ANTONIO', N'CHINCHILLA DELGADO', N'M', CAST(0x000058C500000000 AS DateTime), N'f99afe4a-f84b-49f2-b88a-a64a71c85ed8', N'35e8dde8-9380-4d17-a30a-25ae2e0fb432', N'0', N'2416 7660', NULL, 0)
INSERT [dbo].[Student] ([StudentID], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress], [UserID], [IdentificationTypeID], [FirstName], [LastName], [Gender], [DateOfBirth], [CountryID], [MaritalStatusTypeID], [Phone1], [Phone2], [Phone3], [IsAppUser]) VALUES (N'2b1887c8-49f6-4c9f-ba89-89caf59c53dd', NULL, NULL, CAST(0x0000A17800000000 AS DateTime), N'09e4d1cd-a983-432a-80a9-2fc910e920d2', N'172.17.1.198', N'd9a71fd7-6cad-4ba1-b98f-83b4d7d330d4', N'f18e97f6-b298-4f23-8a97-17f0fe527e5f', N'JORGE ARTURO', N'MENESES FONSECA', N'M', CAST(0x00004CFF00000000 AS DateTime), N'f99afe4a-f84b-49f2-b88a-a64a71c85ed8', N'35e8dde8-9380-4d17-a30a-25ae2e0fb432', N'8314 7841', NULL, NULL, 0)
INSERT [dbo].[Student] ([StudentID], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress], [UserID], [IdentificationTypeID], [FirstName], [LastName], [Gender], [DateOfBirth], [CountryID], [MaritalStatusTypeID], [Phone1], [Phone2], [Phone3], [IsAppUser]) VALUES (N'd6fb251e-8ae4-441c-b411-8a246deb544b', NULL, NULL, CAST(0x0000A17F00000000 AS DateTime), N'09e4d1cd-a983-432a-80a9-2fc910e920d2', N'172.17.3.242', N'e87a5a50-b1da-401e-823d-d1a40d8525d5', N'f18e97f6-b298-4f23-8a97-17f0fe527e5f', N'JEFRY MANUEL', N'ARCE DE LA O', N'M', CAST(0x0000713600000000 AS DateTime), N'f99afe4a-f84b-49f2-b88a-a64a71c85ed8', N'35e8dde8-9380-4d17-a30a-25ae2e0fb432', N'8860-69-48', NULL, NULL, 0)
INSERT [dbo].[Student] ([StudentID], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress], [UserID], [IdentificationTypeID], [FirstName], [LastName], [Gender], [DateOfBirth], [CountryID], [MaritalStatusTypeID], [Phone1], [Phone2], [Phone3], [IsAppUser]) VALUES (N'845c1ad8-c536-4584-9b06-8cb23a1629cb', NULL, NULL, CAST(0x0000A17800000000 AS DateTime), N'09e4d1cd-a983-432a-80a9-2fc910e920d2', N'172.17.1.198', N'658e7420-a9a3-4d11-a751-c9f7b6876a5d', N'36fc2c43-be02-40ac-ae1d-0d7dee3c5a10', N'CARLOS ALBERTO', N'CORTES PACHECO', N'M', CAST(0x000046F100000000 AS DateTime), N'f99afe4a-f84b-49f2-b88a-a64a71c85ed8', N'35e8dde8-9380-4d17-a30a-25ae2e0fb432', N'8384-1610', NULL, NULL, 0)
INSERT [dbo].[Student] ([StudentID], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress], [UserID], [IdentificationTypeID], [FirstName], [LastName], [Gender], [DateOfBirth], [CountryID], [MaritalStatusTypeID], [Phone1], [Phone2], [Phone3], [IsAppUser]) VALUES (N'9f4698b3-186c-4fe1-9b11-8e6509f47b06', NULL, NULL, CAST(0x0000A17E00000000 AS DateTime), N'09e4d1cd-a983-432a-80a9-2fc910e920d2', N'172.26.91.211', N'88feaa39-d83c-4fa5-ba55-df3104ec908e', N'f18e97f6-b298-4f23-8a97-17f0fe527e5f', N'GUILLERMO', N'VARGAS GUILLEN', N'M', CAST(0x00004A8800000000 AS DateTime), N'f99afe4a-f84b-49f2-b88a-a64a71c85ed8', N'35e8dde8-9380-4d17-a30a-25ae2e0fb432', N'8395-7924', NULL, NULL, 0)
INSERT [dbo].[Student] ([StudentID], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress], [UserID], [IdentificationTypeID], [FirstName], [LastName], [Gender], [DateOfBirth], [CountryID], [MaritalStatusTypeID], [Phone1], [Phone2], [Phone3], [IsAppUser]) VALUES (N'fd8e1ec5-6e21-4004-a9d8-8eca28af6d92', NULL, NULL, CAST(0x0000A17E00000000 AS DateTime), N'09e4d1cd-a983-432a-80a9-2fc910e920d2', N'172.26.91.211', N'b23d276c-0795-48b2-b6a0-f5d0984dd682', N'f18e97f6-b298-4f23-8a97-17f0fe527e5f', N'WILLIE', N'CALDERON SAENZ', N'M', CAST(0x00004F4400000000 AS DateTime), N'f99afe4a-f84b-49f2-b88a-a64a71c85ed8', N'35e8dde8-9380-4d17-a30a-25ae2e0fb432', N'2287 6014', NULL, NULL, 0)
INSERT [dbo].[Student] ([StudentID], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress], [UserID], [IdentificationTypeID], [FirstName], [LastName], [Gender], [DateOfBirth], [CountryID], [MaritalStatusTypeID], [Phone1], [Phone2], [Phone3], [IsAppUser]) VALUES (N'49556fe4-9dba-492c-b763-924b55838544', NULL, NULL, CAST(0x0000A17800000000 AS DateTime), N'09e4d1cd-a983-432a-80a9-2fc910e920d2', N'172.17.1.198', N'de3c64a6-2506-4b6c-b632-8f7ab298b58e', N'f18e97f6-b298-4f23-8a97-17f0fe527e5f', N'JUAN JOSE', N'CARUZO RIVERA', N'M', CAST(0x000045A300000000 AS DateTime), N'f99afe4a-f84b-49f2-b88a-a64a71c85ed8', N'35e8dde8-9380-4d17-a30a-25ae2e0fb432', N'83402210', NULL, NULL, 0)
INSERT [dbo].[Student] ([StudentID], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress], [UserID], [IdentificationTypeID], [FirstName], [LastName], [Gender], [DateOfBirth], [CountryID], [MaritalStatusTypeID], [Phone1], [Phone2], [Phone3], [IsAppUser]) VALUES (N'93904bae-9509-4ad6-95fb-9258dac2572a', NULL, NULL, CAST(0x0000A17800000000 AS DateTime), N'09e4d1cd-a983-432a-80a9-2fc910e920d2', N'172.17.1.198', N'de15718a-08eb-48c0-a789-db560b83771c', N'f18e97f6-b298-4f23-8a97-17f0fe527e5f', N'MARIANELA', N'CASTRILLO COLE', N'F', CAST(0x000073C900000000 AS DateTime), N'f99afe4a-f84b-49f2-b88a-a64a71c85ed8', N'35e8dde8-9380-4d17-a30a-25ae2e0fb432', N'8884 2299', NULL, NULL, 0)
INSERT [dbo].[Student] ([StudentID], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress], [UserID], [IdentificationTypeID], [FirstName], [LastName], [Gender], [DateOfBirth], [CountryID], [MaritalStatusTypeID], [Phone1], [Phone2], [Phone3], [IsAppUser]) VALUES (N'8f02be1f-6f34-439d-874c-9347343b3a0e', NULL, NULL, CAST(0x0000A18600000000 AS DateTime), N'c8f318ea-34f0-4260-ba62-8f2e92949939', N'172.17.7.10', N'c8f318ea-34f0-4260-ba62-8f2e92949939', N'f18e97f6-b298-4f23-8a97-17f0fe527e5f', N'Kevin', N'Ortega Núñez', N'M', CAST(0x0000857D00000000 AS DateTime), N'f99afe4a-f84b-49f2-b88a-a64a71c85ed8', N'35e8dde8-9380-4d17-a30a-25ae2e0fb432', N'86319604', N'22612143', N'25525960', 1)
INSERT [dbo].[Student] ([StudentID], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress], [UserID], [IdentificationTypeID], [FirstName], [LastName], [Gender], [DateOfBirth], [CountryID], [MaritalStatusTypeID], [Phone1], [Phone2], [Phone3], [IsAppUser]) VALUES (N'1882cd80-a53c-496b-9b67-9553ff851eab', NULL, NULL, CAST(0x0000A17E00000000 AS DateTime), N'09e4d1cd-a983-432a-80a9-2fc910e920d2', N'172.26.91.211', N'61409b3f-51d2-49d6-a1e4-21e3cc46b0f6', N'f18e97f6-b298-4f23-8a97-17f0fe527e5f', N'Orlando', N'García Solís', N'M', CAST(0x000043DD00000000 AS DateTime), N'f99afe4a-f84b-49f2-b88a-a64a71c85ed8', N'35e8dde8-9380-4d17-a30a-25ae2e0fb432', N'8749 3467', NULL, NULL, 0)
INSERT [dbo].[Student] ([StudentID], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress], [UserID], [IdentificationTypeID], [FirstName], [LastName], [Gender], [DateOfBirth], [CountryID], [MaritalStatusTypeID], [Phone1], [Phone2], [Phone3], [IsAppUser]) VALUES (N'a3d7cb41-64b6-4c23-a53f-957609cf83d1', NULL, NULL, CAST(0x0000A17E00000000 AS DateTime), N'09e4d1cd-a983-432a-80a9-2fc910e920d2', N'172.26.91.211', N'e2807c0f-cf5d-4f98-bcb3-f3c7415ff1c5', N'f18e97f6-b298-4f23-8a97-17f0fe527e5f', N'SALOME', N'SALGADO SEGURA', N'F', CAST(0x000067F500000000 AS DateTime), N'f99afe4a-f84b-49f2-b88a-a64a71c85ed8', N'35e8dde8-9380-4d17-a30a-25ae2e0fb432', N'60578761', NULL, NULL, 0)
INSERT [dbo].[Student] ([StudentID], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress], [UserID], [IdentificationTypeID], [FirstName], [LastName], [Gender], [DateOfBirth], [CountryID], [MaritalStatusTypeID], [Phone1], [Phone2], [Phone3], [IsAppUser]) VALUES (N'd8d94f65-bd57-4ff4-9b6b-95eecec1c1e1', NULL, NULL, CAST(0x0000A17E00000000 AS DateTime), N'09e4d1cd-a983-432a-80a9-2fc910e920d2', N'172.26.91.211', N'37161e19-f11e-493c-8506-fa396c3457c1', N'f18e97f6-b298-4f23-8a97-17f0fe527e5f', N'GEOVANNI', N'SOLIS VARELA', N'M', CAST(0x0000583200000000 AS DateTime), N'f99afe4a-f84b-49f2-b88a-a64a71c85ed8', N'35e8dde8-9380-4d17-a30a-25ae2e0fb432', N'88727777', NULL, NULL, 0)
INSERT [dbo].[Student] ([StudentID], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress], [UserID], [IdentificationTypeID], [FirstName], [LastName], [Gender], [DateOfBirth], [CountryID], [MaritalStatusTypeID], [Phone1], [Phone2], [Phone3], [IsAppUser]) VALUES (N'72f1be41-b0b2-4d75-9fbd-985da77375a9', NULL, NULL, CAST(0x0000A17800000000 AS DateTime), N'09e4d1cd-a983-432a-80a9-2fc910e920d2', N'172.17.1.198', N'16e4f7d8-62a4-4452-836e-46f3518d5088', N'f18e97f6-b298-4f23-8a97-17f0fe527e5f', N'OLMAN ALONSO', N'CHAVES MATAMOROS', N'M', CAST(0x00004C0F00000000 AS DateTime), N'f99afe4a-f84b-49f2-b88a-a64a71c85ed8', N'35e8dde8-9380-4d17-a30a-25ae2e0fb432', N'0', N'22383340', NULL, 0)
INSERT [dbo].[Student] ([StudentID], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress], [UserID], [IdentificationTypeID], [FirstName], [LastName], [Gender], [DateOfBirth], [CountryID], [MaritalStatusTypeID], [Phone1], [Phone2], [Phone3], [IsAppUser]) VALUES (N'273d95e0-90bc-4799-8871-98e6e94b3f58', NULL, NULL, CAST(0x0000A17F00000000 AS DateTime), N'09e4d1cd-a983-432a-80a9-2fc910e920d2', N'172.17.3.242', N'c8f526e4-dee3-48e8-8483-b1334a19ebc3', N'f18e97f6-b298-4f23-8a97-17f0fe527e5f', N'JOSE LUIS', N'CAMPOS MOSCOA', N'M', CAST(0x00004AA100000000 AS DateTime), N'f99afe4a-f84b-49f2-b88a-a64a71c85ed8', N'35e8dde8-9380-4d17-a30a-25ae2e0fb432', N'8396 5693', NULL, NULL, 0)
GO
print 'Processed 100 total records'
INSERT [dbo].[Student] ([StudentID], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress], [UserID], [IdentificationTypeID], [FirstName], [LastName], [Gender], [DateOfBirth], [CountryID], [MaritalStatusTypeID], [Phone1], [Phone2], [Phone3], [IsAppUser]) VALUES (N'eb97b43c-9bc4-463d-b9d4-9d23da90bc9e', NULL, NULL, CAST(0x0000A17800000000 AS DateTime), N'09e4d1cd-a983-432a-80a9-2fc910e920d2', N'172.17.1.198', N'ee615fc7-6c4c-4d6c-b468-27fff6d62a55', N'f18e97f6-b298-4f23-8a97-17f0fe527e5f', N'SILVIA ELENA', N'ROJAS ARAYA', N'F', CAST(0x0000790B00000000 AS DateTime), N'f99afe4a-f84b-49f2-b88a-a64a71c85ed8', N'35e8dde8-9380-4d17-a30a-25ae2e0fb432', N'8810 2050', NULL, NULL, 0)
INSERT [dbo].[Student] ([StudentID], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress], [UserID], [IdentificationTypeID], [FirstName], [LastName], [Gender], [DateOfBirth], [CountryID], [MaritalStatusTypeID], [Phone1], [Phone2], [Phone3], [IsAppUser]) VALUES (N'fc59656d-d4c3-41a7-a552-a01ba65f9915', NULL, NULL, CAST(0x0000A17F00000000 AS DateTime), N'09e4d1cd-a983-432a-80a9-2fc910e920d2', N'172.17.3.242', N'4347b67c-5e00-4b89-aa64-e8c753fce49d', N'f18e97f6-b298-4f23-8a97-17f0fe527e5f', N'LUIS ANGEL', N'OTAROLA CHAVES', N'M', CAST(0x00004F0200000000 AS DateTime), N'f99afe4a-f84b-49f2-b88a-a64a71c85ed8', N'35e8dde8-9380-4d17-a30a-25ae2e0fb432', N'8384-1062', NULL, NULL, 0)
INSERT [dbo].[Student] ([StudentID], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress], [UserID], [IdentificationTypeID], [FirstName], [LastName], [Gender], [DateOfBirth], [CountryID], [MaritalStatusTypeID], [Phone1], [Phone2], [Phone3], [IsAppUser]) VALUES (N'6f3db188-89bd-46dc-b46b-a13993915b53', NULL, NULL, CAST(0x0000A17E00000000 AS DateTime), N'09e4d1cd-a983-432a-80a9-2fc910e920d2', N'172.26.91.211', N'e33e7b01-c8e9-4e4b-9042-eafce9410dc7', N'f18e97f6-b298-4f23-8a97-17f0fe527e5f', N'SILVIA', N'VILLALOBOS ARAYA', N'F', CAST(0x00005F7500000000 AS DateTime), N'f99afe4a-f84b-49f2-b88a-a64a71c85ed8', N'35e8dde8-9380-4d17-a30a-25ae2e0fb432', N'87132804', NULL, NULL, 0)
INSERT [dbo].[Student] ([StudentID], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress], [UserID], [IdentificationTypeID], [FirstName], [LastName], [Gender], [DateOfBirth], [CountryID], [MaritalStatusTypeID], [Phone1], [Phone2], [Phone3], [IsAppUser]) VALUES (N'ec46dc5d-aa52-4b92-b5ed-a261397f89e2', NULL, NULL, CAST(0x0000A17800000000 AS DateTime), N'09e4d1cd-a983-432a-80a9-2fc910e920d2', N'172.17.1.198', N'529d4a33-bd11-472e-8505-502c5142ce33', N'f18e97f6-b298-4f23-8a97-17f0fe527e5f', N'HENRY ROBERTO', N'HERNANDEZ VALERIO', N'M', CAST(0x00006F1000000000 AS DateTime), N'f99afe4a-f84b-49f2-b88a-a64a71c85ed8', N'35e8dde8-9380-4d17-a30a-25ae2e0fb432', N'8855 4696', NULL, NULL, 0)
INSERT [dbo].[Student] ([StudentID], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress], [UserID], [IdentificationTypeID], [FirstName], [LastName], [Gender], [DateOfBirth], [CountryID], [MaritalStatusTypeID], [Phone1], [Phone2], [Phone3], [IsAppUser]) VALUES (N'd68334ff-c224-4afe-915e-a7ebc25254b5', NULL, NULL, CAST(0x0000A17E00000000 AS DateTime), N'09e4d1cd-a983-432a-80a9-2fc910e920d2', N'172.26.91.211', N'124f8cbe-09f5-4b97-90d8-591c534cb6d7', N'f18e97f6-b298-4f23-8a97-17f0fe527e5f', N'Luis Enrique', N'Loiza Sandoval', N'M', CAST(0x0000745F00000000 AS DateTime), N'f99afe4a-f84b-49f2-b88a-a64a71c85ed8', N'35e8dde8-9380-4d17-a30a-25ae2e0fb432', N'8325 3289', NULL, NULL, 0)
INSERT [dbo].[Student] ([StudentID], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress], [UserID], [IdentificationTypeID], [FirstName], [LastName], [Gender], [DateOfBirth], [CountryID], [MaritalStatusTypeID], [Phone1], [Phone2], [Phone3], [IsAppUser]) VALUES (N'8adf9a5d-5901-4793-b8fd-a98112f8aca2', NULL, NULL, CAST(0x0000A17E00000000 AS DateTime), N'09e4d1cd-a983-432a-80a9-2fc910e920d2', N'172.26.91.211', N'031d2478-538b-4bf8-b8ba-5debe84de076', N'f18e97f6-b298-4f23-8a97-17f0fe527e5f', N'Marvin Jimmy', N'Fernández Arce', N'M', CAST(0x00005D9E00000000 AS DateTime), N'f99afe4a-f84b-49f2-b88a-a64a71c85ed8', N'35e8dde8-9380-4d17-a30a-25ae2e0fb432', N'8980 6270', NULL, NULL, 0)
INSERT [dbo].[Student] ([StudentID], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress], [UserID], [IdentificationTypeID], [FirstName], [LastName], [Gender], [DateOfBirth], [CountryID], [MaritalStatusTypeID], [Phone1], [Phone2], [Phone3], [IsAppUser]) VALUES (N'8a1ec8a2-42da-4764-a1f6-ab29f32dca34', NULL, NULL, CAST(0x0000A17E00000000 AS DateTime), N'09e4d1cd-a983-432a-80a9-2fc910e920d2', N'172.26.91.211', N'b0d5c63d-9b55-4b94-8f1b-92cf9ffdf98f', N'f18e97f6-b298-4f23-8a97-17f0fe527e5f', N'GERARDO ENRIQUE', N'ROJAS GUTIERREZ', N'M', CAST(0x0000601900000000 AS DateTime), N'f99afe4a-f84b-49f2-b88a-a64a71c85ed8', N'35e8dde8-9380-4d17-a30a-25ae2e0fb432', N'83839562', NULL, NULL, 0)
INSERT [dbo].[Student] ([StudentID], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress], [UserID], [IdentificationTypeID], [FirstName], [LastName], [Gender], [DateOfBirth], [CountryID], [MaritalStatusTypeID], [Phone1], [Phone2], [Phone3], [IsAppUser]) VALUES (N'a59dc3f2-35ab-42b6-8035-ab97ebcc41bd', NULL, NULL, CAST(0x0000A16900000000 AS DateTime), N'22e466ed-5b35-4734-89e9-cc2b9ec3e55a', N'172.26.52.168', N'11ba13b7-7df8-437a-bdaf-fe0d065212b4', N'f18e97f6-b298-4f23-8a97-17f0fe527e5f', N'WILLIAM', N'JAUBERT SOLANO', N'M', CAST(0x0000589D00000000 AS DateTime), N'f99afe4a-f84b-49f2-b88a-a64a71c85ed8', N'95c0c502-3e24-4036-bac5-bff8db1a0946', N'88267357', N'22545084', NULL, 1)
INSERT [dbo].[Student] ([StudentID], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress], [UserID], [IdentificationTypeID], [FirstName], [LastName], [Gender], [DateOfBirth], [CountryID], [MaritalStatusTypeID], [Phone1], [Phone2], [Phone3], [IsAppUser]) VALUES (N'1a235c85-4ea0-4716-8c0d-abcb4a4c7165', NULL, NULL, CAST(0x0000A17800000000 AS DateTime), N'09e4d1cd-a983-432a-80a9-2fc910e920d2', N'172.17.1.198', N'9ed2f2d1-a18c-4735-82fe-5696294a188d', N'f18e97f6-b298-4f23-8a97-17f0fe527e5f', N'LUIS FABRICIO', N'MARTINEZ QUIROS', N'M', CAST(0x00007BD500000000 AS DateTime), N'f99afe4a-f84b-49f2-b88a-a64a71c85ed8', N'35e8dde8-9380-4d17-a30a-25ae2e0fb432', N'8846 5183', NULL, NULL, 0)
INSERT [dbo].[Student] ([StudentID], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress], [UserID], [IdentificationTypeID], [FirstName], [LastName], [Gender], [DateOfBirth], [CountryID], [MaritalStatusTypeID], [Phone1], [Phone2], [Phone3], [IsAppUser]) VALUES (N'66b94458-c03e-4ba9-bb94-acf40cfe7ad2', NULL, NULL, CAST(0x0000A17F00000000 AS DateTime), N'09e4d1cd-a983-432a-80a9-2fc910e920d2', N'172.17.3.242', N'13858728-3e25-46f0-8f0b-989eb73cd7e9', N'f18e97f6-b298-4f23-8a97-17f0fe527e5f', N'HECTOR ARTURO', N'ABARCA RODRIGUEZ', N'M', CAST(0x0000576900000000 AS DateTime), N'f99afe4a-f84b-49f2-b88a-a64a71c85ed8', N'35e8dde8-9380-4d17-a30a-25ae2e0fb432', N'8380 5720', NULL, NULL, 0)
INSERT [dbo].[Student] ([StudentID], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress], [UserID], [IdentificationTypeID], [FirstName], [LastName], [Gender], [DateOfBirth], [CountryID], [MaritalStatusTypeID], [Phone1], [Phone2], [Phone3], [IsAppUser]) VALUES (N'a060d304-b378-408a-ae27-b45b867fb5a7', NULL, NULL, CAST(0x0000A17800000000 AS DateTime), N'09e4d1cd-a983-432a-80a9-2fc910e920d2', N'172.17.1.198', N'ac104041-4bd2-4d5b-af9e-4388bbb70f26', N'f18e97f6-b298-4f23-8a97-17f0fe527e5f', N'SONIA', N'SOLANO VILLALTA', N'M', CAST(0x00004CFE00000000 AS DateTime), N'f99afe4a-f84b-49f2-b88a-a64a71c85ed8', N'35e8dde8-9380-4d17-a30a-25ae2e0fb432', N'8648 7987', NULL, NULL, 0)
INSERT [dbo].[Student] ([StudentID], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress], [UserID], [IdentificationTypeID], [FirstName], [LastName], [Gender], [DateOfBirth], [CountryID], [MaritalStatusTypeID], [Phone1], [Phone2], [Phone3], [IsAppUser]) VALUES (N'a0d8b264-3abc-4d73-a06a-b4bb67ac3da4', NULL, NULL, CAST(0x0000A17E00000000 AS DateTime), N'09e4d1cd-a983-432a-80a9-2fc910e920d2', N'172.26.91.211', N'4dc3f3d8-fa10-42e8-b625-da946e8c1f59', N'f18e97f6-b298-4f23-8a97-17f0fe527e5f', N'KATTIA', N'NAVARRO QUESADA', N'F', CAST(0x0000700100000000 AS DateTime), N'f99afe4a-f84b-49f2-b88a-a64a71c85ed8', N'35e8dde8-9380-4d17-a30a-25ae2e0fb432', N'8367-3049', NULL, NULL, 0)
INSERT [dbo].[Student] ([StudentID], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress], [UserID], [IdentificationTypeID], [FirstName], [LastName], [Gender], [DateOfBirth], [CountryID], [MaritalStatusTypeID], [Phone1], [Phone2], [Phone3], [IsAppUser]) VALUES (N'4281a10f-0f45-4838-a2ca-b50d1029d618', NULL, NULL, CAST(0x0000A17F00000000 AS DateTime), N'09e4d1cd-a983-432a-80a9-2fc910e920d2', N'172.17.3.242', N'502844ea-ade5-4fff-aa26-5ec6fd5892a6', N'f18e97f6-b298-4f23-8a97-17f0fe527e5f', N'LUIS FERNANDO', N' MONGE RAMIREZ', N'M', CAST(0x0000495800000000 AS DateTime), N'f99afe4a-f84b-49f2-b88a-a64a71c85ed8', N'35e8dde8-9380-4d17-a30a-25ae2e0fb432', N'0', N'22602196', NULL, 0)
INSERT [dbo].[Student] ([StudentID], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress], [UserID], [IdentificationTypeID], [FirstName], [LastName], [Gender], [DateOfBirth], [CountryID], [MaritalStatusTypeID], [Phone1], [Phone2], [Phone3], [IsAppUser]) VALUES (N'8c1e07f8-cde8-456a-a22d-b6ae62bbc989', NULL, NULL, CAST(0x0000A17800000000 AS DateTime), N'09e4d1cd-a983-432a-80a9-2fc910e920d2', N'172.17.1.198', N'f1753657-3333-40ba-b9af-d8ef74622721', N'f18e97f6-b298-4f23-8a97-17f0fe527e5f', N'ESTEBAN JOSE', N'AYALA MONGE', N'M', CAST(0x0000763C00000000 AS DateTime), N'f99afe4a-f84b-49f2-b88a-a64a71c85ed8', N'35e8dde8-9380-4d17-a30a-25ae2e0fb432', N'88289255', NULL, NULL, 0)
INSERT [dbo].[Student] ([StudentID], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress], [UserID], [IdentificationTypeID], [FirstName], [LastName], [Gender], [DateOfBirth], [CountryID], [MaritalStatusTypeID], [Phone1], [Phone2], [Phone3], [IsAppUser]) VALUES (N'74f1bb3f-8ec9-438c-8af7-b6c03698de20', NULL, NULL, CAST(0x0000A17F00000000 AS DateTime), N'09e4d1cd-a983-432a-80a9-2fc910e920d2', N'172.17.3.242', N'f8f88a0e-2823-45b3-8075-92cdfd5c5c87', N'36fc2c43-be02-40ac-ae1d-0d7dee3c5a10', N'RUBEN EDUARDO', N'GARCIA HIDALGO 	', N'M', CAST(0x00005F9E00000000 AS DateTime), N'f99afe4a-f84b-49f2-b88a-a64a71c85ed8', N'35e8dde8-9380-4d17-a30a-25ae2e0fb432', N'8347 6156', NULL, NULL, 0)
INSERT [dbo].[Student] ([StudentID], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress], [UserID], [IdentificationTypeID], [FirstName], [LastName], [Gender], [DateOfBirth], [CountryID], [MaritalStatusTypeID], [Phone1], [Phone2], [Phone3], [IsAppUser]) VALUES (N'5b015679-c769-4fec-9216-bb84aa1d1d26', NULL, NULL, CAST(0x0000A17800000000 AS DateTime), N'09e4d1cd-a983-432a-80a9-2fc910e920d2', N'172.17.1.198', N'c79ab146-7cfd-4e06-bccb-8b8f783aaa2c', N'f18e97f6-b298-4f23-8a97-17f0fe527e5f', N'ROMMEL ADOLFO', N'ALFARO SANCHEZ', N'M', CAST(0x000071B100000000 AS DateTime), N'f99afe4a-f84b-49f2-b88a-a64a71c85ed8', N'95c0c502-3e24-4036-bac5-bff8db1a0946', N'70670924', N'22268112', NULL, 0)
INSERT [dbo].[Student] ([StudentID], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress], [UserID], [IdentificationTypeID], [FirstName], [LastName], [Gender], [DateOfBirth], [CountryID], [MaritalStatusTypeID], [Phone1], [Phone2], [Phone3], [IsAppUser]) VALUES (N'9fe5609a-1e64-4edd-bbaa-bbee38e5d963', NULL, NULL, CAST(0x0000A17E00000000 AS DateTime), N'09e4d1cd-a983-432a-80a9-2fc910e920d2', N'172.26.91.211', N'36cd8756-c330-4073-9801-c36b483be305', N'36fc2c43-be02-40ac-ae1d-0d7dee3c5a10', N'ADRIANA', N'GRANADOS GARCIA', N'F', CAST(0x00006DEC00000000 AS DateTime), N'f99afe4a-f84b-49f2-b88a-a64a71c85ed8', N'35e8dde8-9380-4d17-a30a-25ae2e0fb432', N'0', N'22876418', NULL, 0)
INSERT [dbo].[Student] ([StudentID], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress], [UserID], [IdentificationTypeID], [FirstName], [LastName], [Gender], [DateOfBirth], [CountryID], [MaritalStatusTypeID], [Phone1], [Phone2], [Phone3], [IsAppUser]) VALUES (N'1a337665-f6f5-4cab-8a64-bf1a8d2a49ec', NULL, NULL, CAST(0x0000A17800000000 AS DateTime), N'09e4d1cd-a983-432a-80a9-2fc910e920d2', N'172.17.1.198', N'f4dce8b4-7185-43a1-9ff3-67baed6a54b3', N'f18e97f6-b298-4f23-8a97-17f0fe527e5f', N'YALILE', N'RODRIGUEZ JIMENEZ', N'F', CAST(0x0000527300000000 AS DateTime), N'f99afe4a-f84b-49f2-b88a-a64a71c85ed8', N'35e8dde8-9380-4d17-a30a-25ae2e0fb432', N'8998-21-21', NULL, NULL, 0)
INSERT [dbo].[Student] ([StudentID], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress], [UserID], [IdentificationTypeID], [FirstName], [LastName], [Gender], [DateOfBirth], [CountryID], [MaritalStatusTypeID], [Phone1], [Phone2], [Phone3], [IsAppUser]) VALUES (N'ea032d17-25fd-46a8-98c8-c13dc736539f', NULL, NULL, CAST(0x0000A17F00000000 AS DateTime), N'09e4d1cd-a983-432a-80a9-2fc910e920d2', N'172.17.3.242', N'81cfa0f1-e28b-48e4-90c5-5da8416d2128', N'f18e97f6-b298-4f23-8a97-17f0fe527e5f', N'GUSTAVO ADOLFO', N'VALVERDE MARIN', N'M', CAST(0x00006A1F00000000 AS DateTime), N'f99afe4a-f84b-49f2-b88a-a64a71c85ed8', N'35e8dde8-9380-4d17-a30a-25ae2e0fb432', N'0', N'22876000', NULL, 0)
INSERT [dbo].[Student] ([StudentID], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress], [UserID], [IdentificationTypeID], [FirstName], [LastName], [Gender], [DateOfBirth], [CountryID], [MaritalStatusTypeID], [Phone1], [Phone2], [Phone3], [IsAppUser]) VALUES (N'cedb411e-13e5-4d73-b774-c4e221f3d98d', NULL, NULL, CAST(0x0000A17800000000 AS DateTime), N'09e4d1cd-a983-432a-80a9-2fc910e920d2', N'172.17.1.198', N'7a88f8e9-ffed-4276-b54a-52efb30977d0', N'f18e97f6-b298-4f23-8a97-17f0fe527e5f', N'SUANI GERARDO', N'MENDEZ ALVAREZ', N'M', CAST(0x0000681600000000 AS DateTime), N'f99afe4a-f84b-49f2-b88a-a64a71c85ed8', N'35e8dde8-9380-4d17-a30a-25ae2e0fb432', N'8812 7519', NULL, NULL, 0)
INSERT [dbo].[Student] ([StudentID], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress], [UserID], [IdentificationTypeID], [FirstName], [LastName], [Gender], [DateOfBirth], [CountryID], [MaritalStatusTypeID], [Phone1], [Phone2], [Phone3], [IsAppUser]) VALUES (N'bcabd5c6-2711-43b4-9306-c70954981e7a', NULL, NULL, CAST(0x0000A17800000000 AS DateTime), N'09e4d1cd-a983-432a-80a9-2fc910e920d2', N'172.17.1.198', N'35463446-1c00-4652-8285-7dde516c0820', N'f18e97f6-b298-4f23-8a97-17f0fe527e5f', N'JIMMY JOSUE', N'RIVERA SALAS', N'M', CAST(0x0000815B00000000 AS DateTime), N'f99afe4a-f84b-49f2-b88a-a64a71c85ed8', N'35e8dde8-9380-4d17-a30a-25ae2e0fb432', N'87661872', NULL, NULL, 0)
INSERT [dbo].[Student] ([StudentID], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress], [UserID], [IdentificationTypeID], [FirstName], [LastName], [Gender], [DateOfBirth], [CountryID], [MaritalStatusTypeID], [Phone1], [Phone2], [Phone3], [IsAppUser]) VALUES (N'caa05cdc-99d6-47b6-895d-c7432fcad583', NULL, NULL, CAST(0x0000A17E00000000 AS DateTime), N'09e4d1cd-a983-432a-80a9-2fc910e920d2', N'172.26.91.211', N'b081f97c-0d4e-40f8-b4c3-f058e89b31fd', N'f18e97f6-b298-4f23-8a97-17f0fe527e5f', N'KAREN', N'MURILLO FALLAS', N'F', CAST(0x00007DF900000000 AS DateTime), N'f99afe4a-f84b-49f2-b88a-a64a71c85ed8', N'35e8dde8-9380-4d17-a30a-25ae2e0fb432', N'89807747', NULL, NULL, 0)
INSERT [dbo].[Student] ([StudentID], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress], [UserID], [IdentificationTypeID], [FirstName], [LastName], [Gender], [DateOfBirth], [CountryID], [MaritalStatusTypeID], [Phone1], [Phone2], [Phone3], [IsAppUser]) VALUES (N'8ad1695a-e5e7-4921-a8cc-c8a892b7fb5e', NULL, NULL, CAST(0x0000A17E00000000 AS DateTime), N'09e4d1cd-a983-432a-80a9-2fc910e920d2', N'172.26.91.211', N'52424689-6925-403a-84a0-2c210ba4ac97', N'f18e97f6-b298-4f23-8a97-17f0fe527e5f', N'ALVARO', N'VINDAS LOPEZ', N'M', CAST(0x0000506A00000000 AS DateTime), N'f99afe4a-f84b-49f2-b88a-a64a71c85ed8', N'35e8dde8-9380-4d17-a30a-25ae2e0fb432', N'89944005', NULL, NULL, 0)
INSERT [dbo].[Student] ([StudentID], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress], [UserID], [IdentificationTypeID], [FirstName], [LastName], [Gender], [DateOfBirth], [CountryID], [MaritalStatusTypeID], [Phone1], [Phone2], [Phone3], [IsAppUser]) VALUES (N'672adf30-2929-4dca-b9e4-c9e29b4f4508', NULL, NULL, CAST(0x0000A18800000000 AS DateTime), N'22e466ed-5b35-4734-89e9-cc2b9ec3e55a', N'172.26.52.168', N'280e4de7-8322-4e0d-a8a7-7ddb98ae94a1', N'f18e97f6-b298-4f23-8a97-17f0fe527e5f', N'SERGIO', N'CASTRO LOPEZ', N'M', CAST(0x00005FFF00000000 AS DateTime), N'f99afe4a-f84b-49f2-b88a-a64a71c85ed8', N'35e8dde8-9380-4d17-a30a-25ae2e0fb432', N'8368 3852', NULL, NULL, 0)
INSERT [dbo].[Student] ([StudentID], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress], [UserID], [IdentificationTypeID], [FirstName], [LastName], [Gender], [DateOfBirth], [CountryID], [MaritalStatusTypeID], [Phone1], [Phone2], [Phone3], [IsAppUser]) VALUES (N'cb59f17b-c0da-42ec-b7f7-cc11994bc63a', NULL, NULL, CAST(0x0000A17E00000000 AS DateTime), N'09e4d1cd-a983-432a-80a9-2fc910e920d2', N'172.26.90.74', N'66edb6e2-4812-4c8a-80db-a8fefa711510', N'f18e97f6-b298-4f23-8a97-17f0fe527e5f', N'ROY', N'ODIO HERNANDEZ', N'M', CAST(0x0000580400000000 AS DateTime), N'f99afe4a-f84b-49f2-b88a-a64a71c85ed8', N'35e8dde8-9380-4d17-a30a-25ae2e0fb432', N'8384 1039', NULL, NULL, 0)
INSERT [dbo].[Student] ([StudentID], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress], [UserID], [IdentificationTypeID], [FirstName], [LastName], [Gender], [DateOfBirth], [CountryID], [MaritalStatusTypeID], [Phone1], [Phone2], [Phone3], [IsAppUser]) VALUES (N'7b1ea2c0-836b-4bf5-869f-cce1e3e8ac8a', NULL, NULL, CAST(0x0000A17800000000 AS DateTime), N'09e4d1cd-a983-432a-80a9-2fc910e920d2', N'172.17.1.198', N'ea8fd4a1-b420-492e-9769-2f47948310d1', N'f18e97f6-b298-4f23-8a97-17f0fe527e5f', N'SANDRA GABRIELA', N'FONSECA MAROTO', N'F', CAST(0x000070B600000000 AS DateTime), N'f99afe4a-f84b-49f2-b88a-a64a71c85ed8', N'35e8dde8-9380-4d17-a30a-25ae2e0fb432', N'8579 3729', NULL, NULL, 0)
INSERT [dbo].[Student] ([StudentID], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress], [UserID], [IdentificationTypeID], [FirstName], [LastName], [Gender], [DateOfBirth], [CountryID], [MaritalStatusTypeID], [Phone1], [Phone2], [Phone3], [IsAppUser]) VALUES (N'161d916a-933c-4bc5-a7f6-cfd4ebb84cf6', NULL, NULL, CAST(0x0000A17E00000000 AS DateTime), N'09e4d1cd-a983-432a-80a9-2fc910e920d2', N'172.26.91.211', N'dee40288-21b5-4de5-a167-4e0053d56216', N'f18e97f6-b298-4f23-8a97-17f0fe527e5f', N'IVAN', N'QUESADA MORA', N'M', CAST(0x0000790900000000 AS DateTime), N'f99afe4a-f84b-49f2-b88a-a64a71c85ed8', N'35e8dde8-9380-4d17-a30a-25ae2e0fb432', N'83445146', NULL, NULL, 0)
INSERT [dbo].[Student] ([StudentID], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress], [UserID], [IdentificationTypeID], [FirstName], [LastName], [Gender], [DateOfBirth], [CountryID], [MaritalStatusTypeID], [Phone1], [Phone2], [Phone3], [IsAppUser]) VALUES (N'69429316-6c25-4613-87b2-d00f372fb40d', NULL, NULL, CAST(0x0000A17F00000000 AS DateTime), N'09e4d1cd-a983-432a-80a9-2fc910e920d2', N'172.17.3.242', N'591a302b-99bb-470a-ae1e-3813d24e9173', N'f18e97f6-b298-4f23-8a97-17f0fe527e5f', N'AMADO', N' VARGAS SALAS', N'M', CAST(0x0000576E00000000 AS DateTime), N'f99afe4a-f84b-49f2-b88a-a64a71c85ed8', N'35e8dde8-9380-4d17-a30a-25ae2e0fb432', N'8395 7041', NULL, NULL, 0)
INSERT [dbo].[Student] ([StudentID], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress], [UserID], [IdentificationTypeID], [FirstName], [LastName], [Gender], [DateOfBirth], [CountryID], [MaritalStatusTypeID], [Phone1], [Phone2], [Phone3], [IsAppUser]) VALUES (N'024dfb84-d611-4db1-81be-d2eef43cf2af', NULL, NULL, CAST(0x0000A17800000000 AS DateTime), N'09e4d1cd-a983-432a-80a9-2fc910e920d2', N'172.17.1.198', N'4f585e36-fd6e-43ef-b086-fa317a195d98', N'f18e97f6-b298-4f23-8a97-17f0fe527e5f', N'RODRIGO', N'ARAYA INCERA', N'M', CAST(0x000044A900000000 AS DateTime), N'f99afe4a-f84b-49f2-b88a-a64a71c85ed8', N'35e8dde8-9380-4d17-a30a-25ae2e0fb432', N'8371-1913', NULL, NULL, 0)
INSERT [dbo].[Student] ([StudentID], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress], [UserID], [IdentificationTypeID], [FirstName], [LastName], [Gender], [DateOfBirth], [CountryID], [MaritalStatusTypeID], [Phone1], [Phone2], [Phone3], [IsAppUser]) VALUES (N'9d119461-739f-4a91-9d0e-d64670ab30b3', NULL, NULL, CAST(0x0000A17F00000000 AS DateTime), N'09e4d1cd-a983-432a-80a9-2fc910e920d2', N'172.17.3.242', N'16042815-f9f4-477c-9bc4-c7364088ff20', N'f18e97f6-b298-4f23-8a97-17f0fe527e5f', N'RAFAEL ALBERTO', N'ARTAVIA FERNANDEZ', N'M', CAST(0x00004F9E00000000 AS DateTime), N'f99afe4a-f84b-49f2-b88a-a64a71c85ed8', N'35e8dde8-9380-4d17-a30a-25ae2e0fb432', N'8819 9526', N'2273 4762', NULL, 0)
INSERT [dbo].[Student] ([StudentID], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress], [UserID], [IdentificationTypeID], [FirstName], [LastName], [Gender], [DateOfBirth], [CountryID], [MaritalStatusTypeID], [Phone1], [Phone2], [Phone3], [IsAppUser]) VALUES (N'2893a479-b8a6-4a31-a6cb-d6c25d3cc538', NULL, NULL, CAST(0x0000A17800000000 AS DateTime), N'09e4d1cd-a983-432a-80a9-2fc910e920d2', N'172.17.1.198', N'2352bd85-dc90-4fd7-a523-fa7409a58b25', N'f18e97f6-b298-4f23-8a97-17f0fe527e5f', N'SUSSY', N'ELIZONDO ALVEZ', N'F', CAST(0x00006BBC00000000 AS DateTime), N'f99afe4a-f84b-49f2-b88a-a64a71c85ed8', N'35e8dde8-9380-4d17-a30a-25ae2e0fb432', N'88174565', NULL, NULL, 0)
INSERT [dbo].[Student] ([StudentID], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress], [UserID], [IdentificationTypeID], [FirstName], [LastName], [Gender], [DateOfBirth], [CountryID], [MaritalStatusTypeID], [Phone1], [Phone2], [Phone3], [IsAppUser]) VALUES (N'086f73ff-790c-409c-a9b7-d751052711a1', NULL, NULL, CAST(0x0000A17F00000000 AS DateTime), N'09e4d1cd-a983-432a-80a9-2fc910e920d2', N'172.17.3.242', N'79e11c51-1eb9-4ce8-9181-e73c25ac57ac', N'f18e97f6-b298-4f23-8a97-17f0fe527e5f', N'FRANCISCO ANDRES', N'AMERLING SALAZAR', N'M', CAST(0x00007B6400000000 AS DateTime), N'f99afe4a-f84b-49f2-b88a-a64a71c85ed8', N'35e8dde8-9380-4d17-a30a-25ae2e0fb432', N'7012 7056', NULL, NULL, 0)
INSERT [dbo].[Student] ([StudentID], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress], [UserID], [IdentificationTypeID], [FirstName], [LastName], [Gender], [DateOfBirth], [CountryID], [MaritalStatusTypeID], [Phone1], [Phone2], [Phone3], [IsAppUser]) VALUES (N'd62a3e6c-2cce-4dda-9371-daf6405506af', NULL, NULL, CAST(0x0000A17800000000 AS DateTime), N'09e4d1cd-a983-432a-80a9-2fc910e920d2', N'172.17.1.198', N'a93929d6-1a02-4e5f-bd6b-61f4a86f77dc', N'f18e97f6-b298-4f23-8a97-17f0fe527e5f', N'VIVIAN ISABEL', N'GARITA COUSIN', N'F', CAST(0x0000601700000000 AS DateTime), N'f99afe4a-f84b-49f2-b88a-a64a71c85ed8', N'35e8dde8-9380-4d17-a30a-25ae2e0fb432', N'87205407', NULL, NULL, 0)
INSERT [dbo].[Student] ([StudentID], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress], [UserID], [IdentificationTypeID], [FirstName], [LastName], [Gender], [DateOfBirth], [CountryID], [MaritalStatusTypeID], [Phone1], [Phone2], [Phone3], [IsAppUser]) VALUES (N'7e6372f9-684c-43aa-b3f7-db9321588245', NULL, NULL, CAST(0x0000A17F00000000 AS DateTime), N'09e4d1cd-a983-432a-80a9-2fc910e920d2', N'172.17.3.242', N'667f126c-cfee-4680-9230-b1275edc0da9', N'f18e97f6-b298-4f23-8a97-17f0fe527e5f', N'ELMER EDUARDO', N'VARGAS TENCIO', N'M', CAST(0x000064D100000000 AS DateTime), N'f99afe4a-f84b-49f2-b88a-a64a71c85ed8', N'35e8dde8-9380-4d17-a30a-25ae2e0fb432', N'0', N'22876000', NULL, 0)
INSERT [dbo].[Student] ([StudentID], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress], [UserID], [IdentificationTypeID], [FirstName], [LastName], [Gender], [DateOfBirth], [CountryID], [MaritalStatusTypeID], [Phone1], [Phone2], [Phone3], [IsAppUser]) VALUES (N'd3ae73fd-8eb9-4b55-8c6e-dd3e7fee4d37', NULL, NULL, CAST(0x0000A17800000000 AS DateTime), N'09e4d1cd-a983-432a-80a9-2fc910e920d2', N'172.17.1.198', N'e0ae4f1a-97d9-428a-a5e6-97b403e1763b', N'f18e97f6-b298-4f23-8a97-17f0fe527e5f', N'LUIS ANTONIO', N'ALVARADO SEGURA', N'M', CAST(0x00004F3900000000 AS DateTime), N'f99afe4a-f84b-49f2-b88a-a64a71c85ed8', N'35e8dde8-9380-4d17-a30a-25ae2e0fb432', N'8391-9482', NULL, NULL, 0)
INSERT [dbo].[Student] ([StudentID], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress], [UserID], [IdentificationTypeID], [FirstName], [LastName], [Gender], [DateOfBirth], [CountryID], [MaritalStatusTypeID], [Phone1], [Phone2], [Phone3], [IsAppUser]) VALUES (N'c0d2efe7-3b9c-4d50-b2b0-dd526f707532', NULL, NULL, CAST(0x0000A17800000000 AS DateTime), N'09e4d1cd-a983-432a-80a9-2fc910e920d2', N'172.17.1.198', N'793a3df7-a167-4bf7-aa75-a8610d5a3e9a', N'f18e97f6-b298-4f23-8a97-17f0fe527e5f', N'NELSON ALBERTO', N'QUESADA CHINCHILLA', N'M', CAST(0x000063B500000000 AS DateTime), N'f99afe4a-f84b-49f2-b88a-a64a71c85ed8', N'35e8dde8-9380-4d17-a30a-25ae2e0fb432', N'83881590', NULL, NULL, 0)
INSERT [dbo].[Student] ([StudentID], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress], [UserID], [IdentificationTypeID], [FirstName], [LastName], [Gender], [DateOfBirth], [CountryID], [MaritalStatusTypeID], [Phone1], [Phone2], [Phone3], [IsAppUser]) VALUES (N'31284dbd-e162-45a1-96d0-ddb6fb7fefa9', NULL, NULL, CAST(0x0000A17800000000 AS DateTime), N'09e4d1cd-a983-432a-80a9-2fc910e920d2', N'172.17.1.198', N'1d304168-ccd0-4a53-9022-986f23768126', N'f18e97f6-b298-4f23-8a97-17f0fe527e5f', N'ALLAN', N'HERNANDEZ GARCIA', N'M', CAST(0x0000751F00000000 AS DateTime), N'f99afe4a-f84b-49f2-b88a-a64a71c85ed8', N'35e8dde8-9380-4d17-a30a-25ae2e0fb432', N'87308142', NULL, NULL, 0)
INSERT [dbo].[Student] ([StudentID], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress], [UserID], [IdentificationTypeID], [FirstName], [LastName], [Gender], [DateOfBirth], [CountryID], [MaritalStatusTypeID], [Phone1], [Phone2], [Phone3], [IsAppUser]) VALUES (N'e6daeb74-d1cb-4d95-9016-de685bd215c2', NULL, NULL, CAST(0x0000A16900000000 AS DateTime), N'22e466ed-5b35-4734-89e9-cc2b9ec3e55a', N'172.26.52.168', N'09e4d1cd-a983-432a-80a9-2fc910e920d2', N'f18e97f6-b298-4f23-8a97-17f0fe527e5f', N'INGRID', N'AMADOR SOLANO', N'F', CAST(0x00006D9500000000 AS DateTime), N'f99afe4a-f84b-49f2-b88a-a64a71c85ed8', N'f174ac5c-3a96-4db7-b965-ddac9f2874ee', N'1', NULL, NULL, 1)
INSERT [dbo].[Student] ([StudentID], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress], [UserID], [IdentificationTypeID], [FirstName], [LastName], [Gender], [DateOfBirth], [CountryID], [MaritalStatusTypeID], [Phone1], [Phone2], [Phone3], [IsAppUser]) VALUES (N'f7d374c0-33b0-4343-865c-dea56e1bf794', NULL, NULL, CAST(0x0000A17E00000000 AS DateTime), N'09e4d1cd-a983-432a-80a9-2fc910e920d2', N'172.26.91.211', N'e377ff73-a125-4f9e-99a7-7e301eee749d', N'36fc2c43-be02-40ac-ae1d-0d7dee3c5a10', N'GRETTY', N'ALPIZAR CHAVEZ', N'F', CAST(0x00005C8600000000 AS DateTime), N'f99afe4a-f84b-49f2-b88a-a64a71c85ed8', N'35e8dde8-9380-4d17-a30a-25ae2e0fb432', N'2287-6000', NULL, NULL, 0)
INSERT [dbo].[Student] ([StudentID], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress], [UserID], [IdentificationTypeID], [FirstName], [LastName], [Gender], [DateOfBirth], [CountryID], [MaritalStatusTypeID], [Phone1], [Phone2], [Phone3], [IsAppUser]) VALUES (N'2a5627a9-4fbb-4d3a-a51a-dee143a1c9ca', NULL, NULL, CAST(0x0000A17800000000 AS DateTime), N'09e4d1cd-a983-432a-80a9-2fc910e920d2', N'172.17.1.198', N'7ebedf80-05f9-4639-bd3f-68bb8b906a46', N'f18e97f6-b298-4f23-8a97-17f0fe527e5f', N'RONALD ENRIQUE', N'HIDALGO SAENZ', N'M', CAST(0x00004EC300000000 AS DateTime), N'f99afe4a-f84b-49f2-b88a-a64a71c85ed8', N'35e8dde8-9380-4d17-a30a-25ae2e0fb432', N'8996 6995', NULL, NULL, 0)
INSERT [dbo].[Student] ([StudentID], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress], [UserID], [IdentificationTypeID], [FirstName], [LastName], [Gender], [DateOfBirth], [CountryID], [MaritalStatusTypeID], [Phone1], [Phone2], [Phone3], [IsAppUser]) VALUES (N'9a7dc0b3-2197-4779-b4d7-df65edc3a7a0', NULL, NULL, CAST(0x0000A17F00000000 AS DateTime), N'09e4d1cd-a983-432a-80a9-2fc910e920d2', N'172.17.3.242', N'eb9933c8-3bb7-45d2-815e-78508083ffad', N'f18e97f6-b298-4f23-8a97-17f0fe527e5f', N'GUSTAVO ALONSO', N'PIEDRA MORA', N'M', CAST(0x000069A700000000 AS DateTime), N'f99afe4a-f84b-49f2-b88a-a64a71c85ed8', N'35e8dde8-9380-4d17-a30a-25ae2e0fb432', N'8872-9529', NULL, NULL, 0)
INSERT [dbo].[Student] ([StudentID], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress], [UserID], [IdentificationTypeID], [FirstName], [LastName], [Gender], [DateOfBirth], [CountryID], [MaritalStatusTypeID], [Phone1], [Phone2], [Phone3], [IsAppUser]) VALUES (N'd0139f22-271f-43e8-95c7-e1b4c20dff2f', NULL, NULL, CAST(0x0000A17E00000000 AS DateTime), N'09e4d1cd-a983-432a-80a9-2fc910e920d2', N'172.26.91.211', N'ee65af32-888a-481e-9658-766438ae89b5', N'f18e97f6-b298-4f23-8a97-17f0fe527e5f', N'FANNY', N'ARGUELLO VENEGAS', N'F', CAST(0x000061B200000000 AS DateTime), N'f99afe4a-f84b-49f2-b88a-a64a71c85ed8', N'35e8dde8-9380-4d17-a30a-25ae2e0fb432', N'8376-5758', NULL, NULL, 0)
INSERT [dbo].[Student] ([StudentID], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress], [UserID], [IdentificationTypeID], [FirstName], [LastName], [Gender], [DateOfBirth], [CountryID], [MaritalStatusTypeID], [Phone1], [Phone2], [Phone3], [IsAppUser]) VALUES (N'269aeddc-5130-4a13-871b-e1d21035adb9', NULL, NULL, CAST(0x0000A17800000000 AS DateTime), N'09e4d1cd-a983-432a-80a9-2fc910e920d2', N'172.17.1.198', N'd8140bf3-8511-4272-816e-2762228539dc', N'f18e97f6-b298-4f23-8a97-17f0fe527e5f', N'JOHNNY ALEJANDRO', N'GUTIERREZ ORTIZ', N'M', CAST(0x0000839B00000000 AS DateTime), N'f99afe4a-f84b-49f2-b88a-a64a71c85ed8', N'35e8dde8-9380-4d17-a30a-25ae2e0fb432', N'8380 0414', NULL, NULL, 0)
INSERT [dbo].[Student] ([StudentID], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress], [UserID], [IdentificationTypeID], [FirstName], [LastName], [Gender], [DateOfBirth], [CountryID], [MaritalStatusTypeID], [Phone1], [Phone2], [Phone3], [IsAppUser]) VALUES (N'eedf76c5-ab20-456b-9b31-e33140a8a191', NULL, NULL, CAST(0x0000A17800000000 AS DateTime), N'09e4d1cd-a983-432a-80a9-2fc910e920d2', N'172.17.1.198', N'7d78347a-ca15-481d-a2e2-20eba97e63db', N'f18e97f6-b298-4f23-8a97-17f0fe527e5f', N'TATIANA', N'UGARTE MEDINA', N'F', CAST(0x0000620600000000 AS DateTime), N'f99afe4a-f84b-49f2-b88a-a64a71c85ed8', N'35e8dde8-9380-4d17-a30a-25ae2e0fb432', N'88128762', NULL, NULL, 0)
INSERT [dbo].[Student] ([StudentID], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress], [UserID], [IdentificationTypeID], [FirstName], [LastName], [Gender], [DateOfBirth], [CountryID], [MaritalStatusTypeID], [Phone1], [Phone2], [Phone3], [IsAppUser]) VALUES (N'a8b6b34e-62aa-43f5-b899-e57bac716437', NULL, NULL, CAST(0x0000A17F00000000 AS DateTime), N'09e4d1cd-a983-432a-80a9-2fc910e920d2', N'172.17.3.242', N'2903b52f-bd35-4f65-ab73-6b376d770db3', N'f18e97f6-b298-4f23-8a97-17f0fe527e5f', N'LUIS OSCAR', N'BIANCO SANCHEZ', N'M', CAST(0x000059D100000000 AS DateTime), N'f99afe4a-f84b-49f2-b88a-a64a71c85ed8', N'35e8dde8-9380-4d17-a30a-25ae2e0fb432', N'8884-6399', NULL, NULL, 0)
INSERT [dbo].[Student] ([StudentID], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress], [UserID], [IdentificationTypeID], [FirstName], [LastName], [Gender], [DateOfBirth], [CountryID], [MaritalStatusTypeID], [Phone1], [Phone2], [Phone3], [IsAppUser]) VALUES (N'58cdeb13-edca-41d5-bd64-e7f621f799e2', NULL, NULL, CAST(0x0000A17E00000000 AS DateTime), N'09e4d1cd-a983-432a-80a9-2fc910e920d2', N'172.26.91.211', N'e6220e10-ccc5-4d1c-9291-dedd7dc87f55', N'f18e97f6-b298-4f23-8a97-17f0fe527e5f', N'Christian Alonso', N'Sancho Arroyo', N'M', CAST(0x0000669500000000 AS DateTime), N'f99afe4a-f84b-49f2-b88a-a64a71c85ed8', N'35e8dde8-9380-4d17-a30a-25ae2e0fb432', N'8382 1695', N'2262 1208', NULL, 0)
INSERT [dbo].[Student] ([StudentID], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress], [UserID], [IdentificationTypeID], [FirstName], [LastName], [Gender], [DateOfBirth], [CountryID], [MaritalStatusTypeID], [Phone1], [Phone2], [Phone3], [IsAppUser]) VALUES (N'31e2bac0-eb56-4517-88f5-eb4f29c83342', NULL, NULL, CAST(0x0000A17F00000000 AS DateTime), N'09e4d1cd-a983-432a-80a9-2fc910e920d2', N'172.17.3.242', N'e64445cd-3d1d-4101-99dc-fefbc3b7173d', N'f18e97f6-b298-4f23-8a97-17f0fe527e5f', N'EARL ALBERTO', N'MANLEY SOUTH', N'M', CAST(0x00005DAE00000000 AS DateTime), N'f99afe4a-f84b-49f2-b88a-a64a71c85ed8', N'35e8dde8-9380-4d17-a30a-25ae2e0fb432', N'0', N'22876000', NULL, 0)
INSERT [dbo].[Student] ([StudentID], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress], [UserID], [IdentificationTypeID], [FirstName], [LastName], [Gender], [DateOfBirth], [CountryID], [MaritalStatusTypeID], [Phone1], [Phone2], [Phone3], [IsAppUser]) VALUES (N'156419e9-391e-4ff9-8fc0-eb759c8b1605', NULL, NULL, CAST(0x0000A17E00000000 AS DateTime), N'09e4d1cd-a983-432a-80a9-2fc910e920d2', N'172.26.91.211', N'f8adccc3-3494-4408-b822-6c50f60e7c0e', N'f18e97f6-b298-4f23-8a97-17f0fe527e5f', N'REBECCA', N'SOTO PORRAS', N'F', CAST(0x0000727E00000000 AS DateTime), N'f99afe4a-f84b-49f2-b88a-a64a71c85ed8', N'35e8dde8-9380-4d17-a30a-25ae2e0fb432', N'83819344', NULL, NULL, 0)
INSERT [dbo].[Student] ([StudentID], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress], [UserID], [IdentificationTypeID], [FirstName], [LastName], [Gender], [DateOfBirth], [CountryID], [MaritalStatusTypeID], [Phone1], [Phone2], [Phone3], [IsAppUser]) VALUES (N'548c4401-40b8-4dec-90e3-edcb0f9e9ba9', NULL, NULL, CAST(0x0000A17800000000 AS DateTime), N'09e4d1cd-a983-432a-80a9-2fc910e920d2', N'172.17.1.198', N'bfb77445-7c40-4e88-900d-2f29aaa303e6', N'f18e97f6-b298-4f23-8a97-17f0fe527e5f', N'NORMAN GERARDO', N'JIMENEZ ARGUEDAS', N'M', CAST(0x00005F0500000000 AS DateTime), N'f99afe4a-f84b-49f2-b88a-a64a71c85ed8', N'35e8dde8-9380-4d17-a30a-25ae2e0fb432', N'8325 6117', NULL, NULL, 0)
INSERT [dbo].[Student] ([StudentID], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress], [UserID], [IdentificationTypeID], [FirstName], [LastName], [Gender], [DateOfBirth], [CountryID], [MaritalStatusTypeID], [Phone1], [Phone2], [Phone3], [IsAppUser]) VALUES (N'b5d009f6-9756-47df-842a-edd701028411', NULL, NULL, CAST(0x0000A17E00000000 AS DateTime), N'09e4d1cd-a983-432a-80a9-2fc910e920d2', N'172.26.91.211', N'94222b2b-db37-432f-86f7-3f04b7b33a67', N'f18e97f6-b298-4f23-8a97-17f0fe527e5f', N'RODRIGO', N'BERMUDEZ HIDALGO', N'M', CAST(0x0000600000000000 AS DateTime), N'f99afe4a-f84b-49f2-b88a-a64a71c85ed8', N'35e8dde8-9380-4d17-a30a-25ae2e0fb432', N'88333000', NULL, NULL, 0)
INSERT [dbo].[Student] ([StudentID], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress], [UserID], [IdentificationTypeID], [FirstName], [LastName], [Gender], [DateOfBirth], [CountryID], [MaritalStatusTypeID], [Phone1], [Phone2], [Phone3], [IsAppUser]) VALUES (N'66efdd4b-981b-4971-90e0-ee5d09be0d0d', NULL, NULL, CAST(0x0000A17800000000 AS DateTime), N'09e4d1cd-a983-432a-80a9-2fc910e920d2', N'172.17.1.198', N'21853167-8ff5-473f-af25-125ce330e894', N'f18e97f6-b298-4f23-8a97-17f0fe527e5f', N'FRANCISCO JAVIER', N'HERNANDEZ LEZAMA', N'M', CAST(0x0000554200000000 AS DateTime), N'f99afe4a-f84b-49f2-b88a-a64a71c85ed8', N'35e8dde8-9380-4d17-a30a-25ae2e0fb432', N'8912 2770', NULL, NULL, 0)
INSERT [dbo].[Student] ([StudentID], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress], [UserID], [IdentificationTypeID], [FirstName], [LastName], [Gender], [DateOfBirth], [CountryID], [MaritalStatusTypeID], [Phone1], [Phone2], [Phone3], [IsAppUser]) VALUES (N'cf2a0f91-784b-414f-bf63-f037e74d43ac', NULL, NULL, CAST(0x0000A17F00000000 AS DateTime), N'09e4d1cd-a983-432a-80a9-2fc910e920d2', N'172.17.3.242', N'c5e0e5f9-47fa-4edf-be9f-5db949700d1a', N'f18e97f6-b298-4f23-8a97-17f0fe527e5f', N'GUILLERMO MIGUEL', N'CORTES PULGUI', N'M', CAST(0x000057A900000000 AS DateTime), N'f99afe4a-f84b-49f2-b88a-a64a71c85ed8', N'35e8dde8-9380-4d17-a30a-25ae2e0fb432', N'8841-0513', NULL, NULL, 0)
INSERT [dbo].[Student] ([StudentID], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress], [UserID], [IdentificationTypeID], [FirstName], [LastName], [Gender], [DateOfBirth], [CountryID], [MaritalStatusTypeID], [Phone1], [Phone2], [Phone3], [IsAppUser]) VALUES (N'1ac182b8-6537-4438-b908-f7a253d41694', NULL, NULL, CAST(0x0000A17800000000 AS DateTime), N'09e4d1cd-a983-432a-80a9-2fc910e920d2', N'172.17.1.198', N'd54386f4-d644-40d5-b4b0-f853be8b2e0b', N'f18e97f6-b298-4f23-8a97-17f0fe527e5f', N'JORGE GERARDO', N'BERMUDEZ MUÑOZ', N'M', CAST(0x00005ABB00000000 AS DateTime), N'f99afe4a-f84b-49f2-b88a-a64a71c85ed8', N'35e8dde8-9380-4d17-a30a-25ae2e0fb432', N'8345-3116', NULL, NULL, 0)
INSERT [dbo].[Student] ([StudentID], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress], [UserID], [IdentificationTypeID], [FirstName], [LastName], [Gender], [DateOfBirth], [CountryID], [MaritalStatusTypeID], [Phone1], [Phone2], [Phone3], [IsAppUser]) VALUES (N'84ab7aae-6a99-4e0a-9cc0-fb0d908bb5b8', NULL, NULL, CAST(0x0000A17800000000 AS DateTime), N'09e4d1cd-a983-432a-80a9-2fc910e920d2', N'172.17.1.198', N'ed327b5a-0f81-45b6-95ef-e5c28806a8a0', N'f18e97f6-b298-4f23-8a97-17f0fe527e5f', N'CARLOS HUMBERTO GERARDO', N' MEOÑO SAENZ', N'M', CAST(0x00004B2B00000000 AS DateTime), N'f99afe4a-f84b-49f2-b88a-a64a71c85ed8', N'35e8dde8-9380-4d17-a30a-25ae2e0fb432', N'8882-3918', NULL, NULL, 0)
INSERT [dbo].[Student] ([StudentID], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress], [UserID], [IdentificationTypeID], [FirstName], [LastName], [Gender], [DateOfBirth], [CountryID], [MaritalStatusTypeID], [Phone1], [Phone2], [Phone3], [IsAppUser]) VALUES (N'bb738cc4-a724-4fa8-b6b7-fc0423ddeb7c', NULL, NULL, CAST(0x0000A17800000000 AS DateTime), N'09e4d1cd-a983-432a-80a9-2fc910e920d2', N'172.17.1.198', N'1a30aaca-edec-4200-9a1e-41fdd5ba817d', N'36fc2c43-be02-40ac-ae1d-0d7dee3c5a10', N'ELIETH', N'JIMENEZ BASTOS', N'F', CAST(0x000050BF00000000 AS DateTime), N'f99afe4a-f84b-49f2-b88a-a64a71c85ed8', N'35e8dde8-9380-4d17-a30a-25ae2e0fb432', N'8392-7334', NULL, NULL, 0)
INSERT [dbo].[Student] ([StudentID], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress], [UserID], [IdentificationTypeID], [FirstName], [LastName], [Gender], [DateOfBirth], [CountryID], [MaritalStatusTypeID], [Phone1], [Phone2], [Phone3], [IsAppUser]) VALUES (N'f437850d-d200-4d3b-82c4-fc9db506bc36', NULL, NULL, CAST(0x0000A17800000000 AS DateTime), N'09e4d1cd-a983-432a-80a9-2fc910e920d2', N'172.17.1.198', N'8936d087-0be8-4d57-9767-c5a38f1c4b25', N'f18e97f6-b298-4f23-8a97-17f0fe527e5f', N'IVAN ENRIQUE', N'SANABRIA GOMEZ', N'M', CAST(0x00006BD000000000 AS DateTime), N'f99afe4a-f84b-49f2-b88a-a64a71c85ed8', N'35e8dde8-9380-4d17-a30a-25ae2e0fb432', N'8896 2626', NULL, NULL, 0)
INSERT [dbo].[Student] ([StudentID], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress], [UserID], [IdentificationTypeID], [FirstName], [LastName], [Gender], [DateOfBirth], [CountryID], [MaritalStatusTypeID], [Phone1], [Phone2], [Phone3], [IsAppUser]) VALUES (N'8878b2ef-c77a-4ba7-830c-ff41f3fefb8b', NULL, NULL, CAST(0x0000A17800000000 AS DateTime), N'09e4d1cd-a983-432a-80a9-2fc910e920d2', N'172.17.1.198', N'60488e1b-9b99-4ef5-8339-4340748067c5', N'f18e97f6-b298-4f23-8a97-17f0fe527e5f', N'OSCAR FERNANDO', N'CASTRO SANCHEZ', N'M', CAST(0x00004E3600000000 AS DateTime), N'f99afe4a-f84b-49f2-b88a-a64a71c85ed8', N'35e8dde8-9380-4d17-a30a-25ae2e0fb432', N'83900055', NULL, NULL, 0)
INSERT [dbo].[Student] ([StudentID], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress], [UserID], [IdentificationTypeID], [FirstName], [LastName], [Gender], [DateOfBirth], [CountryID], [MaritalStatusTypeID], [Phone1], [Phone2], [Phone3], [IsAppUser]) VALUES (N'b7e7cf12-aebb-42de-8839-ff759baf3d02', NULL, NULL, CAST(0x0000A17800000000 AS DateTime), N'09e4d1cd-a983-432a-80a9-2fc910e920d2', N'172.17.1.198', N'ea40bef2-f9f6-4f71-a375-7d4ea3f645e2', N'f18e97f6-b298-4f23-8a97-17f0fe527e5f', N'MIGUEL ANTONIO', N'SANCHEZ SOTO', N'M', CAST(0x0000508C00000000 AS DateTime), N'f99afe4a-f84b-49f2-b88a-a64a71c85ed8', N'35e8dde8-9380-4d17-a30a-25ae2e0fb432', N'83842499', NULL, NULL, 0)
/****** Object:  Table [dbo].[Memberships]    Script Date: 04/01/2013 10:27:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Memberships]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Memberships](
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[Password] [nvarchar](128) NOT NULL,
	[PasswordFormat] [int] NOT NULL,
	[PasswordSalt] [nvarchar](128) NOT NULL,
	[Email] [nvarchar](256) NULL,
	[PasswordQuestion] [nvarchar](256) NULL,
	[PasswordAnswer] [nvarchar](128) NULL,
	[IsApproved] [bit] NOT NULL,
	[IsLockedOut] [bit] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[LastLoginDate] [datetime] NOT NULL,
	[LastPasswordChangedDate] [datetime] NOT NULL,
	[LastLockoutDate] [datetime] NOT NULL,
	[FailedPasswordAttemptCount] [int] NOT NULL,
	[FailedPasswordAttemptWindowStart] [datetime] NOT NULL,
	[FailedPasswordAnswerAttemptCount] [int] NOT NULL,
	[FailedPasswordAnswerAttemptWindowsStart] [datetime] NOT NULL,
	[Comment] [nvarchar](256) NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
INSERT [dbo].[Memberships] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'f5a32da9-8a3e-4d62-8df1-03e046058bf7', N'ixUBPcXA32MXfA+CrUQiJAZ+hayMAzLG+hQbmVXhRJE=', 1, N'U0jvw/tcJ0vpAX+918z9ig==', NULL, NULL, NULL, 1, 0, CAST(0x0000A17F0143396B AS DateTime), CAST(0x0000A17F0143396B AS DateTime), CAST(0x0000A17F0143396B AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[Memberships] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'af29b636-918e-4430-8db3-0a0df4c07170', N'ruvCnkHu5IAefu4quCZH8DOyr+W4LTfFTOh/pWcRDqs=', 1, N'0Oy+CuuHx190jcoMaLqAXw==', N'jsolisj@pricose.com', NULL, NULL, 1, 0, CAST(0x0000A17F010665B0 AS DateTime), CAST(0x0000A17F010665B0 AS DateTime), CAST(0x0000A17F010665B0 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[Memberships] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'a9991d74-8e56-4018-87ba-0dc3501084e2', N'VHYF6wGl+xvjMTJ7uYhCYzn26s/7CjTJlt8bkKahgbw=', 1, N'AkOgFCt6Ua05EhTHQSfhOw==', N'rramirez@pricose.com', NULL, NULL, 1, 0, CAST(0x0000A17F01402CBF AS DateTime), CAST(0x0000A17F01402CBF AS DateTime), CAST(0x0000A17F01402CBF AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[Memberships] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'21853167-8ff5-473f-af25-125ce330e894', N'cdqtzemOTi6dS1USrbw01pKBvgqtIhC3ssYJCrPrFM4=', 1, N's8/JpjSUmqZ1jWdvzrO0LQ==', N'hernandezlezama@gmail.com', NULL, NULL, 1, 0, CAST(0x0000A1780151BFA1 AS DateTime), CAST(0x0000A1780151BFA1 AS DateTime), CAST(0x0000A1780151BFA1 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[Memberships] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'a8f3c61e-6fcb-4274-b82c-147b38771f22', N'jchRo3rBerrk5J/blUCX6ljm4Cg38VXW0DHKsNGv5ec=', 1, N'QToB4IMIHcXSLs0pBedD8A==', N'prramírez@cajadeande.fi.cr', NULL, NULL, 1, 0, CAST(0x0000A17F013FD2CA AS DateTime), CAST(0x0000A17F013FD2CA AS DateTime), CAST(0x0000A17F013FD2CA AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[Memberships] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'9d1241d3-d8a4-48b7-8edc-147c3a538a25', N'VK/rL59PI/1v04JYZBtQLb8+I22SnolKCf4M33MCTtY=', 1, N'FLwTzAFlONVKaq6rj0QhnA==', N'seguros_erickchaves@hotmail.com', NULL, NULL, 1, 0, CAST(0x0000A17801232104 AS DateTime), CAST(0x0000A17801232104 AS DateTime), CAST(0x0000A17801232104 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[Memberships] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'f1d11c86-1f1c-4a7e-8a3d-1ceb670134d4', N'kUq6aBF+vNEbTz0e99O8Bo6kWsjuaC9VA0f7drDqYyY=', 1, N'Eoj14VIVZM/ygxt/O2cjTw==', N'lbarrantesa@purdymo.com', NULL, NULL, 1, 0, CAST(0x0000A17F013E0DAD AS DateTime), CAST(0x0000A17F013E0DAD AS DateTime), CAST(0x0000A17F013E0DAD AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[Memberships] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'4f7dfd20-ed18-4e16-9e3b-1ef7b799c7e5', N'VnxJKwoQSpXRBaBxHy99b69sdk1TILh4U40sWw2+BtI=', 1, N'qWzk/qxNWgmZBVOvDyvCuA==', N'jmendezm@improsa.com', NULL, NULL, 1, 0, CAST(0x0000A17F012B4C69 AS DateTime), CAST(0x0000A17F012B4C69 AS DateTime), CAST(0x0000A17F012B4C69 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[Memberships] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'7d78347a-ca15-481d-a2e2-20eba97e63db', N'nyvDcbQVCR4NTZR76nq5sBWyz8H1Q83bCKz0vdDx1HE=', 1, N'eIYPdirxiqZsZIxEhLUi4Q==', N'ugartta@hotmail.com', NULL, NULL, 1, 0, CAST(0x0000A1780121B9A3 AS DateTime), CAST(0x0000A1780121B9A3 AS DateTime), CAST(0x0000A1780121B9A3 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[Memberships] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'61409b3f-51d2-49d6-a1e4-21e3cc46b0f6', N'iWy44JsvX1GMLb8lDBBWDO7gXDMPRrU9vJh8/4d330s=', 1, N'OSrrK7Mlp/zMLK0i2OEyeQ==', N'landig47@hotmail.com', NULL, NULL, 1, 0, CAST(0x0000A17E014571F8 AS DateTime), CAST(0x0000A17E014571F8 AS DateTime), CAST(0x0000A17E014571F8 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[Memberships] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'd8140bf3-8511-4272-816e-2762228539dc', N'CswnXR6A8tmhCfVm+Y52h/H26H+osVsB+T58RjH8VgA=', 1, N'YPb/cubhEs0WJ3sKgf44kA==', N'johnny3092@hotmail.com', NULL, NULL, 1, 0, CAST(0x0000A1780112B215 AS DateTime), CAST(0x0000A1780112B215 AS DateTime), CAST(0x0000A1780112B215 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[Memberships] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'f7b84ea1-5c2a-49f0-98a5-279a3ace876e', N'XgOU9xFn5k/uYBj+zFHobvLrVr68eVHVvWFYfUQnoPc=', 1, N'+NC7iHh3dBtu8kJ1cgkUEg==', N'antonio.bermudezm@davivienda.cr', NULL, NULL, 1, 0, CAST(0x0000A17E0123E925 AS DateTime), CAST(0x0000A17E00C108A5 AS DateTime), CAST(0x0000A17E0123E925 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[Memberships] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'ee615fc7-6c4c-4d6c-b468-27fff6d62a55', N'Cj6LW4AWK1I593hZG2TYKaDZqsp/zONJTphYnEsYckk=', 1, N'Z4fSJ18lC5bNgjnUNkbonQ==', N'silviarojasa03@gmail.com', NULL, NULL, 1, 0, CAST(0x0000A178012084F5 AS DateTime), CAST(0x0000A178012084F5 AS DateTime), CAST(0x0000A178012084F5 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[Memberships] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'ebb71c3e-be87-49cd-9171-2bd780a6072f', N'BKJmBOcZjIKPkIwRQEOIHPXBAmvzqcjki02wWv4B51w=', 1, N'pBUUJsV2lrHL3iK1z0Or/A==', N'domingoel@gmail.com', NULL, NULL, 1, 0, CAST(0x0000A178014A4EDB AS DateTime), CAST(0x0000A178014A4EDB AS DateTime), CAST(0x0000A178014A4EDB AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[Memberships] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'52424689-6925-403a-84a0-2c210ba4ac97', N'dRB1DkoGnrKsqDyv7Iy1LMOX57522+WP5e4xdqtsJmk=', 1, N'ATOIa84OFyHSHA20NuKU0g==', N'avindas_lopez@hotmail.com', NULL, NULL, 1, 0, CAST(0x0000A17E014B31D8 AS DateTime), CAST(0x0000A17E014B31D8 AS DateTime), CAST(0x0000A17E014B31D8 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[Memberships] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'0d122016-8c8c-4716-800e-2d6ca55e5035', N'4gMG9C5/FZJezGr1aWT9bHTSC5eNuEnYrWX/YAJfJXk=', 1, N'MVmISuPpCVY9hAjN7u3nGA==', N'Maumiranda@bp.fi.cr', NULL, NULL, 1, 0, CAST(0x0000A17F012BA591 AS DateTime), CAST(0x0000A17F012BA591 AS DateTime), CAST(0x0000A17F012BA591 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[Memberships] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'bfb77445-7c40-4e88-900d-2f29aaa303e6', N'k6TuXTcn7mjjh4sNQlmjctIPbmKs8ioZ8KW4slMa9Ls=', 1, N'pkxuZ/T2tIUxdk4QIOAKnQ==', N'norman.ja@hotmail.com', NULL, NULL, 1, 0, CAST(0x0000A17801522AA3 AS DateTime), CAST(0x0000A17801522AA3 AS DateTime), CAST(0x0000A17801522AA3 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[Memberships] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'ea8fd4a1-b420-492e-9769-2f47948310d1', N'LVv+3CZF9aT+YxCyikPpL9X4Tz+WFmF4j3Sc5NNhuDM=', 1, N'GG0LbH+wA+EeEeRY4iabsA==', N'sandra.fonsecamaroto@gmail.com', NULL, NULL, 1, 0, CAST(0x0000A17801114D5F AS DateTime), CAST(0x0000A17801114D5F AS DateTime), CAST(0x0000A17801114D5F AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[Memberships] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'1469f96d-0236-4ce3-bf26-2f6d74e3e8c6', N'45pmQCN717py2552t84mSX9tt89548YUb+Gc+o2Gk/8=', 1, N'IyvXOSmducTCclnbBXyw1g==', N'alpizar.jose@gmail.com', NULL, NULL, 1, 0, CAST(0x0000A17F013D6151 AS DateTime), CAST(0x0000A17F013D6151 AS DateTime), CAST(0x0000A17F013D6151 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[Memberships] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'09e4d1cd-a983-432a-80a9-2fc910e920d2', N'muibxz/4xUskXhrAul2HC5BCpLfJH8k6puJrsWbjoAo=', 1, N'CYXvt2u/uawTx7F8SrTRAQ==', N'ingridasitcr@gmail.com', NULL, NULL, 1, 0, CAST(0x0000A169017904E6 AS DateTime), CAST(0x0000A18601592817 AS DateTime), CAST(0x0000A169017904E6 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[Memberships] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'5f7a4b47-a645-45d6-bd60-31353e1aeb70', N'p5zfuiD5HIFktWDPMqCu4kb4ghY1o6OY8MdVCIRj6bg=', 1, N'fsKdsbjRy2aSdBaHYTq4yA==', N'alevalerin2104@gmail.com', NULL, NULL, 1, 0, CAST(0x0000A1780117BCAA AS DateTime), CAST(0x0000A1780117BCAA AS DateTime), CAST(0x0000A1780117BCAA AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[Memberships] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'1219d423-677e-4d32-83e2-365a3335aa98', N'YtD37X/Tu6FBrZsxvUZJ1Bzmg99JtbYpbE39tTfZfgY=', 1, N'DEkY6qbQph2H+p+x9p2+TQ==', N'fecha_60@hotmail.com', NULL, NULL, 1, 0, CAST(0x0000A17F01425F44 AS DateTime), CAST(0x0000A17F01425F44 AS DateTime), CAST(0x0000A17F01425F44 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[Memberships] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'41ac46b2-d777-4a88-933a-3697f42d8a6d', N'/iVHCfFOrAnZMJZWlxteiUrlG5BUxe4YPriFDvKo3AM=', 1, N'fW3sOrrLw+5cHRLb9ehF9Q==', N'adriana.avila@davivienda.cr', NULL, NULL, 1, 0, CAST(0x0000A17E0122E5CB AS DateTime), CAST(0x0000A17D0185C64B AS DateTime), CAST(0x0000A17E0122E5CB AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[Memberships] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'591a302b-99bb-470a-ae1e-3813d24e9173', N'WoM6JOgfu7N/vooaEkEmx2+U9qQQNrgOAyeXDzpDcvQ=', 1, N'zInnk8sqZ72/mD7ehcPHNw==', N'artuvarsa@yahoo.com', NULL, NULL, 1, 0, CAST(0x0000A17F0146E52C AS DateTime), CAST(0x0000A17F0146E52C AS DateTime), CAST(0x0000A17F0146E52C AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[Memberships] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'e6eca7c1-e3b8-48e8-90ea-381f6bd7d1f1', N'wrOpLMbHumuzs3+hfue55nxfyCq69XeOipgXlcx2DLQ=', 1, N'3f5obgBkloW8VMEMVWuUvQ==', N'imaricordero@hotmail.com', NULL, NULL, 1, 0, CAST(0x0000A17F0142B2BA AS DateTime), CAST(0x0000A17F00DFD23A AS DateTime), CAST(0x0000A17F0142B2BA AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[Memberships] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'6f94a283-e581-4378-ac39-38236a3d47f3', N'RyyQh48xTNDEU4PSCrNnRX5KjH+WjBRqse+R/pdMT1E=', 1, N'wE4rsdo6rWnwbJmeVp7qtw==', N'lago.201233@gmail.com / lgonzalez@coopenae.fi.cr', NULL, NULL, 1, 0, CAST(0x0000A17E0145FEA6 AS DateTime), CAST(0x0000A17E0145FEA6 AS DateTime), CAST(0x0000A17E0145FEA6 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[Memberships] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'961f6a8a-a094-4036-98a1-39c686eecf3f', N'Gb1UxQKnR/la7jdDmAYqnwQZUt23ZS9ClNJ341xQULs=', 1, N'GUwouUfI3WgePzyDCwuoUQ==', N'don.asdrubal.sarchi@hotmail.com', NULL, NULL, 1, 0, CAST(0x0000A17801224436 AS DateTime), CAST(0x0000A17801224436 AS DateTime), CAST(0x0000A17801224436 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[Memberships] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'556e3fd5-4f0a-4601-8f26-3a091566b667', N'OCuBsrWX+u3bk/heyjxKNOi/mu/rizNM0vJ8aW9dIE0=', 1, N'xhMEoee3JsytgUjI7nv4Kw==', N'sorelbc@ins-cr.com', NULL, NULL, 1, 0, CAST(0x0000A17E014CEAAB AS DateTime), CAST(0x0000A17E014CEAAB AS DateTime), CAST(0x0000A17E014CEAAB AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[Memberships] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'9ea890aa-35c5-4984-a1ed-3aba1df217c9', N'2u0xMs0n3FKMAwPR/F3hIAAl9bsOccNWsmH5TIKr0lc=', 1, N'oLxdct/AMiFPMqyy63ZAeA==', N'bcenteno99@yahoo.com', NULL, NULL, 1, 0, CAST(0x0000A1780147DC61 AS DateTime), CAST(0x0000A1780147DC61 AS DateTime), CAST(0x0000A1780147DC61 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[Memberships] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'6c2acc03-9573-4527-87c2-3b5f4127df35', N'TGXzxMcUBFnNyj8Llp2V/dg7WeCpqy2yYVNr+s2jsOA=', 1, N'E7tgtDnm5bt7ob0893W2WA==', N'303720138@bandbcorp.com', NULL, NULL, 1, 0, CAST(0x0000A15D018AC464 AS DateTime), CAST(0x0000A15D018AC464 AS DateTime), CAST(0x0000A15D018AC464 AS DateTime), CAST(0x0000A15D018AC464 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), N'User create by initial script')
INSERT [dbo].[Memberships] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'94222b2b-db37-432f-86f7-3f04b7b33a67', N'lQ8ZzNLjMYE3R7iqAQoIh0sbQIcP71RoWHPB5UWt3OM=', 1, N'Wprmkm+pY06+0lQpu5OFuQ==', N'rbermudez@pricose', NULL, NULL, 1, 0, CAST(0x0000A17E014C3387 AS DateTime), CAST(0x0000A17E014C3387 AS DateTime), CAST(0x0000A17E014C3387 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[Memberships] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'0f1c0606-d31b-472e-87a4-3fa7997f7d4f', N'Tzl7hdOtge27mGmKKteoBhumN60AutJ94vDj5JacmHo=', 1, N'jiT5HRure7d5wwO3sXc1Vw==', N'zmseguros@hotmail.com', NULL, NULL, 1, 0, CAST(0x0000A17F014745F6 AS DateTime), CAST(0x0000A17F014745F6 AS DateTime), CAST(0x0000A17F014745F6 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[Memberships] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'1a30aaca-edec-4200-9a1e-41fdd5ba817d', N'OybHNunf1mteWXSoRs2xtY4jfAOLcU+0sbEsCsrf+tw=', 1, N'hrb49Uo//b7Rw1Ldv86CdQ==', N'elieth1155@hotmail.com', NULL, NULL, 1, 0, CAST(0x0000A17801528034 AS DateTime), CAST(0x0000A17800EF9FB4 AS DateTime), CAST(0x0000A17801528034 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[Memberships] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'60488e1b-9b99-4ef5-8339-4340748067c5', N'oNv2idy7U5G7dIEVTVYvaapVX54y0oavWTYCv+nKLQE=', 1, N'/MeRPmR0FqOJHeflpv03Vg==', N'oscarcastro1@gmail.com', NULL, NULL, 1, 0, CAST(0x0000A17801477A20 AS DateTime), CAST(0x0000A17801477A20 AS DateTime), CAST(0x0000A17801477A20 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[Memberships] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'ac104041-4bd2-4d5b-af9e-4388bbb70f26', N'pkS+LVOANhRSZD+tscjVnJK+2MyIlQdxrJpoEtpTaI4=', 1, N'qMVfegr8NDwxdJZk4BsQDA==', N'sonssolvilla@hotmail.com', NULL, NULL, 1, 0, CAST(0x0000A17801174461 AS DateTime), CAST(0x0000A17800B463E1 AS DateTime), CAST(0x0000A17801174461 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[Memberships] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'abb6ed1d-85f0-4cf4-9587-469116e56d3b', N'TX/KFUVydGbrFPBDQHPxVcaZNpC6pLc2M/bbaVOC9rs=', 1, N'3niP2/NUcv1ueGIiBRv4bw==', N'calpizare@pricose.com', NULL, NULL, 1, 0, CAST(0x0000A17F010F0002 AS DateTime), CAST(0x0000A17F00AC1F82 AS DateTime), CAST(0x0000A17F010F0002 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[Memberships] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'16e4f7d8-62a4-4452-836e-46f3518d5088', N'j7R/VsT1Y2F+YFkGKkdunzhmwqqWnDp4AxePOEMxp3g=', 1, N'sY1cjjqQVZy504aDIC+I3A==', N'chavesseguros@yahoo.com', NULL, NULL, 1, 0, CAST(0x0000A178012936BB AS DateTime), CAST(0x0000A178012936BB AS DateTime), CAST(0x0000A178012936BB AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[Memberships] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'ee7735f6-3179-4b91-a3cf-4961de469d80', N'/cvnHgj1H7AZLBtRqGsotlKPZ79LaN2pEiuStzFAg2o=', 1, N'eYi+zuuoo3DO58D7nokaqA==', N'maylingp84@hotmail.com', NULL, NULL, 1, 0, CAST(0x0000A178014B3F17 AS DateTime), CAST(0x0000A17800E85E97 AS DateTime), CAST(0x0000A178014B3F17 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[Memberships] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'dee40288-21b5-4de5-a167-4e0053d56216', N'wucOoLDj2itSy9LmV3dBjQx9Cxv8S2us8rC5PMDTFLM=', 1, N'RWTbBjr5QTC9pcIl7Y5KOw==', N'ivanqm@costarricense.cr', NULL, NULL, 1, 0, CAST(0x0000A17E0127B5CD AS DateTime), CAST(0x0000A17E0127B5CD AS DateTime), CAST(0x0000A17E0127B5CD AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[Memberships] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'529d4a33-bd11-472e-8505-502c5142ce33', N'ah34D6p0VFQGMdoY7nyPRS97hIqgVWtSvDan6nnISYA=', 1, N'+NSqERO3XzNHkdY0sA5wWQ==', N'henryhernandezcr@yahoo.com', NULL, NULL, 1, 0, CAST(0x0000A17801133474 AS DateTime), CAST(0x0000A17800B053F4 AS DateTime), CAST(0x0000A17801133474 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[Memberships] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'26918a5e-74c6-4f0d-a7e5-52c19b739e18', N'Lfxy5G/H/O9bQpcjjjr1666G7skOSQx0lRI1Hzg+c2U=', 1, N'z0I6PBFKD7VgDE7r8us+HQ==', N'lgvillafranco@racsa.co.cr', NULL, NULL, 1, 0, CAST(0x0000A17E011ECF54 AS DateTime), CAST(0x0000A17E011ECF54 AS DateTime), CAST(0x0000A17E011ECF54 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[Memberships] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'7a88f8e9-ffed-4276-b54a-52efb30977d0', N'8q2IeytCdWG9eEM8aQRiK+XEfEFOTSGmvtB21wdjV4k=', 1, N'uDqcQeL/Qn6m74Yq4DEgZw==', N'suanyseguros@gmail.com', NULL, NULL, 1, 0, CAST(0x0000A1780152E68F AS DateTime), CAST(0x0000A1780152E68F AS DateTime), CAST(0x0000A1780152E68F AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[Memberships] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'4595be71-2715-40dc-8c14-54780ece4f8f', N'tEEwxIfEQOxETWofp84xIUVRq1Naq9qeoZQtPtI0WCo=', 1, N'beFMtGWLWOlRamS7Pc1IiQ==', N'rcontreras@gmail.com', NULL, NULL, 1, 0, CAST(0x0000A17F013EE174 AS DateTime), CAST(0x0000A17F013EE174 AS DateTime), CAST(0x0000A17F013EE174 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[Memberships] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'2c45487c-8348-462c-b2d4-55d6c28a9b29', N'x54cF8DiZsmZrXy0VhZpnyyuZKMVm/NnRiZvSo3yxhg=', 1, N'pUXN4RMQ+HBX0pKYRObxJg==', N'franklin_garita@yahoo.es', NULL, NULL, 1, 0, CAST(0x0000A178011B927A AS DateTime), CAST(0x0000A178011B927A AS DateTime), CAST(0x0000A178011B927A AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[Memberships] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'9ed2f2d1-a18c-4735-82fe-5696294a188d', N'G+wsUA6yP77WRmggYAHnKX4jKKDACRHWpnBgfA3kCfY=', 1, N'40RSQc6+ysymt513a4rX+g==', N'luismaq1810@hotmail.com', NULL, NULL, 1, 0, CAST(0x0000A17801152D2A AS DateTime), CAST(0x0000A17801152D2A AS DateTime), CAST(0x0000A17801152D2A AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[Memberships] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'2e8f409d-3679-42eb-b5e4-583871bc0918', N'wgZXjUE3FLbpqBouqE9Ol/+Rv9lB2PYNFfIrUe3c7k0=', 1, N'2xBsixC7M7R+2eT96ztYvA==', N'kcampos@ice.co.cr', NULL, NULL, 1, 0, CAST(0x0000A1780119D102 AS DateTime), CAST(0x0000A17800541002 AS DateTime), CAST(0x0000A1780119D102 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[Memberships] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'124f8cbe-09f5-4b97-90d8-591c534cb6d7', N'gJZwH9+ayZDUoB3SvGP4y9lvYJ5NiHsVDK0QYDEcebY=', 1, N'D3MLNZDALaTqa7FmHoaUOg==', N'lloaizad@coopenae.fi.cr', NULL, NULL, 1, 0, CAST(0x0000A17E014715D9 AS DateTime), CAST(0x0000A17E014715D9 AS DateTime), CAST(0x0000A17E014715D9 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[Memberships] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'0a0f5d8e-9a39-4c12-8d7d-5a5a684a8096', N'Ln09k4FJrGyOCqv6Z5/WJUBVCn8rz7zLcCSWfbzfa6U=', 1, N'fv2KDyNfXePmXhI0fX1clQ==', N'germanherrera10@gmail.com', NULL, NULL, 1, 0, CAST(0x0000A17E0154071F AS DateTime), CAST(0x0000A17E0154071F AS DateTime), CAST(0x0000A17E0154071F AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[Memberships] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'02a769e4-464c-40a3-97c7-5bbf99a241e2', N'frU907VTv43OPj/Q6wsBaagv9Cnl5M3XTgFpLdDFOZQ=', 1, N'zonIXxtnMdhVrCP9wh6yFQ==', N'ana.coto@bancreditocr.com', NULL, NULL, 1, 0, CAST(0x0000A178010F7452 AS DateTime), CAST(0x0000A1780049B352 AS DateTime), CAST(0x0000A178010F7452 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[Memberships] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'81cfa0f1-e28b-48e4-90c5-5da8416d2128', N'tJnunR6cHxWyI6gj7T6yEAoXHLoYE8T4DVW7EX/RqhI=', 1, N't4b0pxHYEmdra3+5QElDAw==', N'gustavalverde@ins-cr.com', NULL, NULL, 1, 0, CAST(0x0000A17F010B83D4 AS DateTime), CAST(0x0000A17F010B83D4 AS DateTime), CAST(0x0000A17F010B83D4 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[Memberships] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'c5e0e5f9-47fa-4edf-be9f-5db949700d1a', N'iNkrHjr9C/ZJaSja3K5ZLV9bwv9mk6HBvqp1/Jw0NUo=', 1, N'vlf/Fgk/6HFQCyztIjZZZg==', N'gmocortesp@hotmail.com', NULL, NULL, 1, 0, CAST(0x0000A17F0117B19E AS DateTime), CAST(0x0000A17F0117B19E AS DateTime), CAST(0x0000A17F0117B19E AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[Memberships] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'863ee975-9a5b-4321-9ea7-5dc2405ad0bb', N'AH/Z5f1F9ORbqWj7TdcsRxbpd+8+rnVACFtez8ga68o=', 1, N'PT21GbYkqG7jRE3Z91p5dg==', N'lcordero21@gmail.com', NULL, NULL, 1, 0, CAST(0x0000A17E015097FA AS DateTime), CAST(0x0000A17E015097FA AS DateTime), CAST(0x0000A17E015097FA AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[Memberships] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'031d2478-538b-4bf8-b8ba-5debe84de076', N'C4Cd4pvwLCG20A93ZKcaDA0R2fniqpreTf8OuuqkRCM=', 1, N'm/2AKdOMb/SPhUl9WsbB+w==', N'mfernandez@proseguros.com', NULL, NULL, 1, 0, CAST(0x0000A17E0144DED7 AS DateTime), CAST(0x0000A17E0144DED7 AS DateTime), CAST(0x0000A17E0144DED7 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[Memberships] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'502844ea-ade5-4fff-aa26-5ec6fd5892a6', N'ljt4qYakd0GehoP97ZWC+jKeibtr5ICpq/WICiOPYf0=', 1, N'e7Fo9N2O/tIJwDi/rIx4IA==', NULL, NULL, NULL, 1, 0, CAST(0x0000A17F014399EA AS DateTime), CAST(0x0000A17F014399EA AS DateTime), CAST(0x0000A17F014399EA AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[Memberships] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'a8ea54b7-1a19-4eee-8f4b-60dc08090b2c', N'G3VupkgsiNwMgzdbh+EQz7ae9Ug2Rb9V6DBHaKc6iqc=', 1, N'xlErRCg1HBw+qAodRXzdqQ==', N'm.rodriguezms@gmail.com', NULL, NULL, 1, 0, CAST(0x0000A1780123F3C1 AS DateTime), CAST(0x0000A17800C11341 AS DateTime), CAST(0x0000A1780123F3C1 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[Memberships] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'28d9cc12-7efe-4fb9-a2d4-6126dd744408', N'e+ZUM3qKZw41qt4vCoxRhBfVSyVk7ubl34bUrUCMHAo=', 1, N'3ek1q582GyfPktHN3iX7mA==', N'88414590', NULL, NULL, 1, 0, CAST(0x0000A1780110B6EF AS DateTime), CAST(0x0000A1780110B6EF AS DateTime), CAST(0x0000A1780110B6EF AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[Memberships] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'aa323aaa-7184-46e8-8605-616e0a15119b', N'mlpxMWgmyujsEY9cIwh3J6Lo6jCrH7P4WLC98eashlk=', 1, N'YSU2uLhLx82wovWSDxb40g==', N'vcespedes@pricose.com', NULL, NULL, 1, 0, CAST(0x0000A17801229809 AS DateTime), CAST(0x0000A17801229809 AS DateTime), CAST(0x0000A17801229809 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[Memberships] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'a93929d6-1a02-4e5f-bd6b-61f4a86f77dc', N'vXyk6mmQdmvvjC5IUBYdsx1+A/0V2nBpzpNlQ4XO4pE=', 1, N'g7Drks3FW9xtXsGMwHuwlA==', N'vivigaritacousin@hotmail.com', NULL, NULL, 1, 0, CAST(0x0000A178011C024F AS DateTime), CAST(0x0000A178011C024F AS DateTime), CAST(0x0000A178011C024F AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[Memberships] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'28e6cadd-6359-4741-a46c-6304d83688f2', N'+AHSsKj3tC+tSuRT+jwe+bCNYQp0j1/X4I0nV4SKuR8=', 1, N'9RPZPYujqwFIitPc74fRZw==', N'mcastro@pricose.com', NULL, NULL, 1, 0, CAST(0x0000A17E014E6AE1 AS DateTime), CAST(0x0000A17E014E6AE1 AS DateTime), CAST(0x0000A17E014E6AE1 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[Memberships] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'8209ebd5-c679-4da3-8630-6659f205d5ca', N'Ix586W9IMZDvQQ1Tc3q7+URQ08QZymlRIxQ9Y+IBq3I=', 1, N'FV26ThNk/2M6aca37ATvzQ==', N'ralfaro@pricose.com', NULL, NULL, 1, 0, CAST(0x0000A178010DDFF8 AS DateTime), CAST(0x0000A17800481EF8 AS DateTime), CAST(0x0000A178010DDFF8 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[Memberships] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'991ba8ed-ddba-43ff-8722-66c228c0f074', N'HVejzAEDlz4OqvZsYJ4p6M07Id8ZYfO+phesBbwyNeU=', 1, N'zasiPxeC/UPxhoEi8WnqyA==', N'marcogonzalez@ins-cr.com', NULL, NULL, 1, 0, CAST(0x0000A17E01412A07 AS DateTime), CAST(0x0000A17E01412A07 AS DateTime), CAST(0x0000A17E01412A07 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[Memberships] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'c1f24856-782a-440c-8d6a-671c1c40958a', N'kCtQHgxL6NwB1D3kNcmcKiQTDGlat/B8pPRceLUf7Ic=', 1, N'ubgVxR2datPM8jh4E75vZQ==', N'ovl@ovindas.com', NULL, NULL, 1, 0, CAST(0x0000A17F010772FC AS DateTime), CAST(0x0000A17F010772FC AS DateTime), CAST(0x0000A17F010772FC AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[Memberships] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'f4dce8b4-7185-43a1-9ff3-67baed6a54b3', N'6HQJytcefle92iRonu4bdJnroMZd9SjE5cQFFdfwlo8=', 1, N'hrfoqEXLa+jTHKIsKZzwRQ==', N'yalilerodrigue@gmail.com', NULL, NULL, 1, 0, CAST(0x0000A1780144617B AS DateTime), CAST(0x0000A1780144617B AS DateTime), CAST(0x0000A1780144617B AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[Memberships] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'7ebedf80-05f9-4639-bd3f-68bb8b906a46', N'aq8of+b6kk4/9UGbQ1xfltkiO61EI7CZdqaU23RAhTA=', 1, N'vXVcrl8GheNM0LOSI4GEeQ==', N'9loboseg@yahoo.com', NULL, NULL, 1, 0, CAST(0x0000A1780113E408 AS DateTime), CAST(0x0000A1780113E408 AS DateTime), CAST(0x0000A1780113E408 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[Memberships] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'2903b52f-bd35-4f65-ab73-6b376d770db3', N'xjU1i+j3AkmnhTF8rC7y3/FpDkUWjH0YL8A2NHe3a8Q=', 1, N'aUjyLWO9jzNOzDPHcz2wsQ==', N'lbianco@mseguros.co.cr', NULL, NULL, 1, 0, CAST(0x0000A17F013E652A AS DateTime), CAST(0x0000A17F013E652A AS DateTime), CAST(0x0000A17F013E652A AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[Memberships] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'f8adccc3-3494-4408-b822-6c50f60e7c0e', N'YKaZaHKrNQODlylrclPjbxC+Ghs5TlhoegQ0sZjpZYs=', 1, N'/harIZZGUvUa8+0Axvmk/Q==', N'rsotop@pricose.com', NULL, NULL, 1, 0, CAST(0x0000A17E011E04BD AS DateTime), CAST(0x0000A17E011E04BD AS DateTime), CAST(0x0000A17E011E04BD AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[Memberships] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'8b185310-8774-493b-a1ad-6e58c789e4b9', N'h2tvB2hadZlubuhTJbh4a6qyAl5U9rP9U0Eze24YjwA=', 1, N'eavgV95I51rtnWuxjV3Jvw==', N'aldo.protti@davivenda.cr', NULL, NULL, 1, 0, CAST(0x0000A17E0148C2CA AS DateTime), CAST(0x0000A17E0148C2CA AS DateTime), CAST(0x0000A17E0148C2CA AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[Memberships] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'04622c29-cc0f-4876-9f0c-70266450200f', N'qYG2CHci2f8ljbuenQOFv6IuzdQvlaKOmfsX/uf/TIo=', 1, N'waSIe/oqSUrVJW7ozqiDQw==', NULL, NULL, NULL, 1, 0, CAST(0x0000A17F0119783C AS DateTime), CAST(0x0000A1820158365A AS DateTime), CAST(0x0000A17F0119783C AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[Memberships] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'3096d7b8-f414-4100-896b-704dcae0e617', N'1XOvCcTCOBoXdboXbC/+ikApTO1R5rKDfbhnUw1gGqs=', 1, N'dL8/IJ519MChJjqpwFWHoA==', N'sfonseca@itcr.ac.cr', NULL, NULL, 1, 0, CAST(0x0000A16901776631 AS DateTime), CAST(0x0000A16901776631 AS DateTime), CAST(0x0000A16901776631 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[Memberships] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'75674a63-d6dc-42f8-b861-73aca8bf8067', N'1dQ+uPMnlaGsOBGdOfZmGlvhbfzJh8rOXAJL5Q1tQY8=', 1, N'oyzzMDKwSSh+JSGJubNuyA==', N'ferba19@gmail.com', NULL, NULL, 1, 0, CAST(0x0000A17801467266 AS DateTime), CAST(0x0000A17801467266 AS DateTime), CAST(0x0000A17801467266 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[Memberships] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'ee65af32-888a-481e-9658-766438ae89b5', N'mdYPuirh8+yqqqQt7hY84CNohO8/ChgqgDlCjZo4+8E=', 1, N'5DPOTQXYLnPlPxqL/buD5Q==', N'fannyav@costarricense.cr', NULL, NULL, 1, 0, CAST(0x0000A17E014BBECC AS DateTime), CAST(0x0000A17E014BBECC AS DateTime), CAST(0x0000A17E014BBECC AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[Memberships] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'eb9933c8-3bb7-45d2-815e-78508083ffad', N'wjneCtu6w7urfPgkPRuqT8WbE6bac3TDAkM7SyDMp0k=', 1, N'z4gmYspeqeYqreEnBmVk4w==', N'gpiedra@bp.fi.cr', NULL, NULL, 1, 0, CAST(0x0000A17F012D4FF7 AS DateTime), CAST(0x0000A17F012D4FF7 AS DateTime), CAST(0x0000A17F012D4FF7 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[Memberships] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'92d1923c-983b-49fd-ac66-7a264f3cc017', N'ubDTCSo6p0JcXqlZQ+yZicmCrgoEtrJmYPbp80iGizY=', 1, N'Hg9ZqyWGYeN0Ha7UqWfB5w==', N'marcela@crnature.com', NULL, NULL, 1, 0, CAST(0x0000A17F01054885 AS DateTime), CAST(0x0000A17F00A26805 AS DateTime), CAST(0x0000A17F01054885 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[Memberships] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'ea40bef2-f9f6-4f71-a375-7d4ea3f645e2', N'oAFzB1V7hVBUNtd9UUX7MmTHF89um0MgVazYYebA02A=', 1, N'SZpFwMKIiNvSyCetm44thQ==', N'sansegur@yahoo.com', NULL, NULL, 1, 0, CAST(0x0000A1780116C95F AS DateTime), CAST(0x0000A1780116C95F AS DateTime), CAST(0x0000A1780116C95F AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[Memberships] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'280e4de7-8322-4e0d-a8a7-7ddb98ae94a1', N'v5X6xW+/J6krjPYwGTK7xdr6g6qNi3osaXVon/rOvRw=', 1, N'RqQIYYL0OzC5eJ7seyZPOg==', N'scastro@improsa.com', NULL, NULL, 1, 0, CAST(0x0000A17E01436124 AS DateTime), CAST(0x0000A17E00E080A4 AS DateTime), CAST(0x0000A17E01436124 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[Memberships] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'35463446-1c00-4652-8285-7dde516c0820', N'qR6EhjzQ3MdMapS9RtHD953/FTLZVE/utxpGK+1UHsM=', 1, N'eeQ2GZVdDY/HL4raBqsjog==', N'jym1490@hotmail.com', NULL, NULL, 1, 0, CAST(0x0000A1780115F20E AS DateTime), CAST(0x0000A1780115F20E AS DateTime), CAST(0x0000A1780115F20E AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[Memberships] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'e377ff73-a125-4f9e-99a7-7e301eee749d', N'+I1GMfGJYNLKvTM93ArzUm1xzUQDDeQC+zSmnATUWl8=', 1, N'gKjP+OJienxAURRsqaUzVw==', N'galpizar@ins-cr.com', NULL, NULL, 1, 0, CAST(0x0000A17E0121C473 AS DateTime), CAST(0x0000A17E00BEE3F3 AS DateTime), CAST(0x0000A17E0121C473 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[Memberships] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'1403268e-d6d7-46e4-a3f2-7ec2f299253c', N'+f47dIQdNY8dCsuW9+IttiRsiomHz595L9ZIP6EBLQo=', 1, N'yuWVSGUqut8cqECJMkV95w==', N'icultural@hotmail.com', NULL, NULL, 1, 0, CAST(0x0000A17F013DC241 AS DateTime), CAST(0x0000A17F013DC241 AS DateTime), CAST(0x0000A17F013DC241 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[Memberships] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'40390a71-7344-47b5-bbd0-830addeb12ff', N'on99IvuCS/CKboT0ueP42/23G1TxJj0wnDnUU7+0aVI=', 1, N'rL4ha+mJs/STCvGuMXNqKA==', N'mchinchillad@pricose.com', NULL, NULL, 1, 0, CAST(0x0000A17F011E0D01 AS DateTime), CAST(0x0000A17F011E0D01 AS DateTime), CAST(0x0000A17F011E0D01 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[Memberships] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'd9a71fd7-6cad-4ba1-b98f-83b4d7d330d4', N'WHh50NotJRFRqJAouF1Rgq+qNt8UGKv5vCawagV8et8=', 1, N'wzHo5U76SygxBynhAFNuzQ==', N'jmenesesf@hotmail.com', NULL, NULL, 1, 0, CAST(0x0000A17801533D0F AS DateTime), CAST(0x0000A17801533D0F AS DateTime), CAST(0x0000A17801533D0F AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[Memberships] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'506c0f75-8b9b-429e-bbfb-84a0fbdf8281', N'71uta+pU6zBnQWnQKRQ+fbrAncP9VEvIBd55gdYZ5a4=', 1, N'LRoeFypVaM0W6sSw18R1Cg==', N'zaida.ca@hotmail.com', NULL, NULL, 1, 0, CAST(0x0000A17F01418E6F AS DateTime), CAST(0x0000A17F01418E6F AS DateTime), CAST(0x0000A17F01418E6F AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[Memberships] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'9ca29c27-2a95-4324-a751-8588b71a0a07', N'CdzP32JzcZK3pMSQEUu7TLiId1qDc2FjUj4yEJwWcQM=', 1, N'7956PsDUzztazQkRBNjvOA==', N'galfaro@pricose.com', NULL, NULL, 1, 0, CAST(0x0000A178011908F7 AS DateTime), CAST(0x0000A178011908F7 AS DateTime), CAST(0x0000A178011908F7 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[Memberships] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'2e4798d2-bb68-40a1-80e1-86f76b450bb6', N'ZqRxYVt6HicUCqpqI/8iR9r6h0PzYfTMV8LnhlPgGzc=', 1, N'jz8SGSHnxYqWz5eD7lAjzA==', N'ehvalleseguros@ice.co.cr', NULL, NULL, 1, 0, CAST(0x0000A178011CD181 AS DateTime), CAST(0x0000A178011CD181 AS DateTime), CAST(0x0000A178011CD181 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[Memberships] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'e080409a-d29f-424e-aae2-8a6237a0e748', N'1JeLVE5YEH8LzeKpHYvyTbvNm8kOdiTkKoKHD6++I1w=', 1, N'dGFkdgrPJCg/6oyAeSnvhQ==', N'mggutierrez04@hotmail.com', NULL, NULL, 1, 0, CAST(0x0000A178014BCC15 AS DateTime), CAST(0x0000A178014BCC15 AS DateTime), CAST(0x0000A178014BCC15 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[Memberships] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'02b6e53a-ec02-42c7-8e52-8a70e1a458c5', N'iWIOkuJfz/Pyoojv9cjw01AWklXRxsFvbB/c9j3lLu8=', 1, N'MrrNfQXDk3hEIrE1VxTMWA==', N'gcruzc@pricose.com', NULL, NULL, 1, 0, CAST(0x0000A178010FE33A AS DateTime), CAST(0x0000A178004A223A AS DateTime), CAST(0x0000A178010FE33A AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[Memberships] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'c79ab146-7cfd-4e06-bccb-8b8f783aaa2c', N'NUTwe+WKuyWc4kGHU+M7DifShVSyD4JPYmR1BnT+tis=', 1, N'F+M0oE+d6PUFturJxNxoiA==', N'rommel291@hotmail.com', NULL, NULL, 1, 0, CAST(0x0000A16A015F76C7 AS DateTime), CAST(0x0000A16A00FC9647 AS DateTime), CAST(0x0000A16A015F76C7 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[Memberships] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'94ea1830-6fbb-4a1f-b114-8b9cf482b0bd', N'cM3IOHGhh11YMBJxy3OWsAXy5Q1wRmF9AK5IXjZDhgA=', 1, N'JFGDtpvRxaBW4KiAZNZbLg==', NULL, NULL, NULL, 1, 0, CAST(0x0000A1780125B779 AS DateTime), CAST(0x0000A1780125B779 AS DateTime), CAST(0x0000A1780125B779 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[Memberships] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'6a0c4923-b1aa-44a5-9171-8d3b5399a990', N'd+jchWL6Bod1nNIW3grxeExnyZYYiOUGCDRCPbLr2vU=', 1, N'cpM8x3ZsnfJ824R+A3Qhog==', N'guidomora53@hotmail.com', NULL, NULL, 1, 0, CAST(0x0000A17801440AC3 AS DateTime), CAST(0x0000A17801440AC3 AS DateTime), CAST(0x0000A17801440AC3 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[Memberships] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'c8f318ea-34f0-4260-ba62-8f2e92949939', N'WBqJLtYl8sjWjz72Xo4NI1EMhanL1WGS+5bYsqJB6n8=', 1, N'vdsuZn45Oplr+nbZLQcm6Q==', N'kortenu@gmail.com', NULL, NULL, 1, 0, CAST(0x0000A1850171977A AS DateTime), CAST(0x0000A19300EDA507 AS DateTime), CAST(0x0000A1850171977A AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[Memberships] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'de3c64a6-2506-4b6c-b632-8f7ab298b58e', N'yLgwOSKWl4SdRvIcPpcxEs8XtkJKZkYo4kvOq3qA0yY=', 1, N'YIo6EpJfm4n40YjL2MjnOg==', N'juancaruso@ice.co.cr', NULL, NULL, 1, 0, CAST(0x0000A178011AAB0B AS DateTime), CAST(0x0000A178011AAB0B AS DateTime), CAST(0x0000A178011AAB0B AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[Memberships] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'8909d7be-fcb4-431e-adcf-91484e174c16', N'B21/AU7b6CgGUpT4dJKJxcwozaSNAnYsRIId5XvczzU=', 1, N'NaocjY0LPiVRAEmLopWIFQ==', N'emurillo824@yahoo.com', NULL, NULL, 1, 0, CAST(0x0000A178011E586C AS DateTime), CAST(0x0000A178011E586C AS DateTime), CAST(0x0000A178011E586C AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[Memberships] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'a1c5b1c1-4398-4ef7-9479-92aec0674353', N'UnxJd0gYlzBzeYEGWBcRohiTuFGNWdhSLDy+gk4qB6Y=', 1, N'SQ+WzjeqYecQT1Y9I3hPxg==', N'isabelmoyaq@yahoo.com', NULL, NULL, 1, 0, CAST(0x0000A17F012BF724 AS DateTime), CAST(0x0000A17F00C916A4 AS DateTime), CAST(0x0000A17F012BF724 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[Memberships] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'f8f88a0e-2823-45b3-8075-92cdfd5c5c87', N'jh4nYB+q5VVrBl7Jkoehw0sRC5kXeb8a69tPVnLvSXk=', 1, N'E8dj7kb/QWTM2FqA7dZGRg==', N'rtrimegisto@me.com', NULL, NULL, 1, 0, CAST(0x0000A17F012924E6 AS DateTime), CAST(0x0000A17F012924E6 AS DateTime), CAST(0x0000A17F012924E6 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[Memberships] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'b0d5c63d-9b55-4b94-8f1b-92cf9ffdf98f', N'WlOHbrgrD37Fz2M4fGyJAWD10rZA2803bqTVGqS49Q8=', 1, N'd0dZCR+9QSLa3T9Xhq7DUQ==', N'grojas@segurosgamacr.com', NULL, NULL, 1, 0, CAST(0x0000A17E011A056B AS DateTime), CAST(0x0000A17E011A056B AS DateTime), CAST(0x0000A17E011A056B AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[Memberships] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'158e7f16-d0e0-4365-b7bd-94b3cc74ec0d', N'SrBBfGAEvjgn6xhH3JE5dsEe6hXN8yIjwpwy3FsC298=', 1, N'HjPi+FL7GycxUtrt1BJCrQ==', N'hcortes@improsa.com', NULL, NULL, 1, 0, CAST(0x0000A17E01513FC2 AS DateTime), CAST(0x0000A17E00EE5F42 AS DateTime), CAST(0x0000A17E01513FC2 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[Memberships] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'd926932a-d547-488e-bdf4-96aba353557b', N'0a33X+J/5ZXIhZF42j1bz5ZffkXldm3x+ZncfN3UtJE=', 1, N'2lHaB3FX83PBBRcuQLg0Ew==', N'kcamacho@proseguros.com', NULL, NULL, 1, 0, CAST(0x0000A17E0126B231 AS DateTime), CAST(0x0000A17D00C3D1B1 AS DateTime), CAST(0x0000A17E0126B231 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[Memberships] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'4eb23992-0f12-4f29-9c0a-977a572efd48', N'wbL6n3xw/oE1UHuXMf2yBUrTnaA8830uMg7gf00Be9o=', 1, N'r8N5Wjj4T26L4b22eVkBAA==', N'elgomez1983@gmail.com', NULL, NULL, 1, 0, CAST(0x0000A17801122A04 AS DateTime), CAST(0x0000A17801122A04 AS DateTime), CAST(0x0000A17801122A04 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[Memberships] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'e0ae4f1a-97d9-428a-a5e6-97b403e1763b', N'3uJEPcYDA3kkXufcFgpO1XkKvBN002MlvvSb2+d8jkA=', 1, N'MeKxvmRU+/dpkQ+zyBjvkw==', N'lalvarados@pricose.com', NULL, NULL, 1, 0, CAST(0x0000A1780145BF73 AS DateTime), CAST(0x0000A1780145BF73 AS DateTime), CAST(0x0000A1780145BF73 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[Memberships] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'1d304168-ccd0-4a53-9022-986f23768126', N'50l45plYwQDpHm8vOIKp9WSPivaEgcFoay6FY8S2dEw=', 1, N'RaXOysYSSETNxVaX2X7dHA==', N'allanhg@desyfin.fi.cr', NULL, NULL, 1, 0, CAST(0x0000A178011C7BA4 AS DateTime), CAST(0x0000A178011C7BA4 AS DateTime), CAST(0x0000A178011C7BA4 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[Memberships] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'13858728-3e25-46f0-8f0b-989eb73cd7e9', N'n0xm6qi3Vf2iM5XmUMQeWWQ48IKEpl7rxF71FmQxfo8=', 1, N'8iDHrUB31OjlyEpKeh7GTA==', N'habarca@acs-cr.com', NULL, NULL, 1, 0, CAST(0x0000A17F010E9BFA AS DateTime), CAST(0x0000A17F010E9BFA AS DateTime), CAST(0x0000A17F010E9BFA AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[Memberships] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'8dba8e08-01a5-4381-9eac-9d998830a6df', N'k2DQiZxdy0VepfkCxfvsaeGD6kdiQuKoTAIpnzIAUfo=', 1, N'DU1zFpt53gW1I9R/cBvz0w==', N'lidiagv66@gmail.com', NULL, NULL, 1, 0, CAST(0x0000A17F010DCCD9 AS DateTime), CAST(0x0000A17F00AAEC59 AS DateTime), CAST(0x0000A17F010DCCD9 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
GO
print 'Processed 100 total records'
INSERT [dbo].[Memberships] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'ae9feade-aafe-470d-8882-a1c4a1813343', N'sBrw4SjYbB05nzT/KENAphQzu4jvTDysYGjf8V0Pe0c=', 1, N'l36qUJhEiYqWlqkp03I5bA==', N'e.castro.ius@gmail.com', NULL, NULL, 1, 0, CAST(0x0000A178010EE335 AS DateTime), CAST(0x0000A17800AC02B5 AS DateTime), CAST(0x0000A178010EE335 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[Memberships] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'ac278425-2d45-43eb-89b0-a2b0651dc7ab', N'1mXHypN+ZRDn0zxJnPPApRbevJyvmYKf5xy80BaohgA=', 1, N'caZs8BTI2H/awWhGSmoinA==', N'marcochacons@ice.co.cr', NULL, NULL, 1, 0, CAST(0x0000A17F011D9279 AS DateTime), CAST(0x0000A17F011D9279 AS DateTime), CAST(0x0000A17F011D9279 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[Memberships] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'793a3df7-a167-4bf7-aa75-a8610d5a3e9a', N'z57803UMn8Ti+xUVT9kRhxwo/97UBEE4VUWVJDNlVo4=', 1, N'+UcAgZ/aE5IP67Dexq0XRQ==', N'nquesadac@pricose.com', NULL, NULL, 1, 0, CAST(0x0000A17801189B17 AS DateTime), CAST(0x0000A17801189B17 AS DateTime), CAST(0x0000A17801189B17 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[Memberships] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'66edb6e2-4812-4c8a-80db-a8fefa711510', N'2l42abavRCp6bDk+7d5A71jH5iqb8tlMOU10YxjzoVU=', 1, N'oMLn95CZr+pn7Us5nFaGbQ==', N'rodio61@gmail.com', NULL, NULL, 1, 0, CAST(0x0000A17E010DEF7C AS DateTime), CAST(0x0000A17E010DEF7C AS DateTime), CAST(0x0000A17E010DEF7C AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[Memberships] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'24be72bc-9108-4bd6-bbeb-aaeeb5e757f9', N'bLiEObhrEqTF88X5A9mQjuK/I93uStcx5YThqjex1aI=', 1, N'uCbE47dIy2Zl0FvhGGs7GA==', N'mrojasp@pricose.com', NULL, NULL, 1, 0, CAST(0x0000A17E011B1787 AS DateTime), CAST(0x0000A17E011B1787 AS DateTime), CAST(0x0000A17E011B1787 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[Memberships] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'a1500fb0-d2a5-44f2-97ac-ab7002763037', N'hJgAv4eQNMup+/tHXKyLWTZ/qFiHyST7WPnLkZMkloQ=', 1, N'hVBLKpF3hIdBTlGdSXtFVA==', N'LIORER@COSTARRICENSE.CR', NULL, NULL, 1, 0, CAST(0x0000A178011B201A AS DateTime), CAST(0x0000A178011B201A AS DateTime), CAST(0x0000A178011B201A AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[Memberships] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'667f126c-cfee-4680-9230-b1275edc0da9', N'8AnJUEQPDNy6lfPOg9JPf4iGT4Ehas09423SLVmJ2OY=', 1, N'S6L7rEYSorDNiekc1PZ2Zg==', N'evargas@ins-cr.com', NULL, NULL, 1, 0, CAST(0x0000A17F010C5AD4 AS DateTime), CAST(0x0000A17F010C5AD4 AS DateTime), CAST(0x0000A17F010C5AD4 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[Memberships] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'c8f526e4-dee3-48e8-8483-b1334a19ebc3', N'sVo7d0LNlKhbIO2O4EAb9ecZRl88TQoPR0jJhbK2eFQ=', 1, N'wlVtvCoHJplAt4TXu6O6OQ==', N'joseluiscampos52@gmail.com', NULL, NULL, 1, 0, CAST(0x0000A17F0141E38B AS DateTime), CAST(0x0000A17F0141E38B AS DateTime), CAST(0x0000A17F0141E38B AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[Memberships] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'f2bb2f46-d293-4f75-8d91-b20809d9ef3b', N'ARHAZfwo3PCkCKYISwAnLcj/q3hRrYOr34vVeJXBMCI=', 1, N'k4sFqO7rO6KZVBRcDIRRtg==', N'segurosmonteverde@gmail.com', NULL, NULL, 1, 0, CAST(0x0000A178011DFD5D AS DateTime), CAST(0x0000A178011DFD5D AS DateTime), CAST(0x0000A178011DFD5D AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[Memberships] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'595b7e7e-40bf-4053-80db-b79a684a026a', N'Q5Ei1nvq6htR9J5PdquoW4q4WaPPImqTYb1Yl4VorHI=', 1, N'Mqy5SCCPluqoSb1mjB15ug==', N'gerasosa@gmail.com', NULL, NULL, 1, 0, CAST(0x0000A17801215806 AS DateTime), CAST(0x0000A17801215806 AS DateTime), CAST(0x0000A17801215806 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[Memberships] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'4fa1031d-8d96-4b14-a9e0-c2c849d6924a', N'+nOTx5a8TE7Bf9Qed/GMhPv84O2MoGGU0lOCYnwYpcw=', 1, N'nNFXUMBfmeLp3tcLp6bvWw==', N'carcamposagentesag@ins-cr.com', NULL, NULL, 1, 0, CAST(0x0000A17801244FCD AS DateTime), CAST(0x0000A17801244FCD AS DateTime), CAST(0x0000A17801244FCD AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[Memberships] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'36cd8756-c330-4073-9801-c36b483be305', N'HS4XabtKU8TIicqjk9E6sSTUbRRYz6/0ozFeZ0qbEF8=', 1, N'CLSBbSeawmPBIh2ELmxsUQ==', N'adgranados@ins-cr.com', NULL, NULL, 1, 0, CAST(0x0000A17E0146858A AS DateTime), CAST(0x0000A17E0146858A AS DateTime), CAST(0x0000A17E0146858A AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[Memberships] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'ef9357d3-a6fa-4673-8c99-c36ea808a54f', N'moR46SJrZqr5THNCaQGFbF7JvBN+cw66qQqM4ouxnAc=', 1, N'BiJbY/fH8g/aNaJWuc4udg==', N'dlopez@dinamicaseguros.com', NULL, NULL, 1, 0, CAST(0x0000A17F010419FE AS DateTime), CAST(0x0000A17F010419FE AS DateTime), CAST(0x0000A17F010419FE AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[Memberships] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'8936d087-0be8-4d57-9767-c5a38f1c4b25', N'Lr2bDkXPCk0ZjsDRolPrvkqM5kh4w9FdjnCW1AUCDs4=', 1, N'fYmTF6WXqLJhlSCie7D4Xw==', N'ivansg27@hotmail.com', NULL, NULL, 1, 0, CAST(0x0000A17801167134 AS DateTime), CAST(0x0000A17801167134 AS DateTime), CAST(0x0000A17801167134 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[Memberships] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'd39ffd63-6295-4d44-b504-c63926c4d953', N'f9iPGMtH9dMOsDZuDZWXCEjnYfnAfD1kse9dxRuiVx8=', 1, N'BXgKREHBoled2bzfbvcp4Q==', N'irsa.fallas@bancreditocr.com / irfamo@hotmail.com', NULL, NULL, 1, 0, CAST(0x0000A17E01442959 AS DateTime), CAST(0x0000A17E001B87D9 AS DateTime), CAST(0x0000A17E01442959 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[Memberships] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'd3da52df-af8d-485d-a284-c68e91caa072', N'gDIyGymk3C0cLACR8wNl5bOpXMLDGq5/MBGrm18mPE4=', 1, N'B/I32D0lTLwK9CA7s6puiw==', N'm.rodriguezms@gmail.com', NULL, NULL, 1, 0, CAST(0x0000A178011FFB92 AS DateTime), CAST(0x0000A17800BD1B12 AS DateTime), CAST(0x0000A178011FFB92 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[Memberships] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'16042815-f9f4-477c-9bc4-c7364088ff20', N'EKlHHweu6MhxMNOP5L2A2NegCmDX+XMKNxAyjxpDRV8=', 1, N'FECxY/Br9TPZMpVG6lWE3g==', N'alberto.artavia@yahoo.com', NULL, NULL, 1, 0, CAST(0x0000A17F01126C6D AS DateTime), CAST(0x0000A17F01126C6D AS DateTime), CAST(0x0000A17F01126C6D AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[Memberships] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'f5e2727b-1f15-4626-9b01-c8cc89dd2913', N'E50J9FVWhS+Th6SFqYJ+lvQmvR1sTLIqF5gzcploXMM=', 1, N'4UkmmU3IxvNIoBSL/pRIbg==', N'sagonzalez@ins-cr.com', NULL, NULL, 1, 0, CAST(0x0000A17E0153689B AS DateTime), CAST(0x0000A17E0153689B AS DateTime), CAST(0x0000A17E0153689B AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[Memberships] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'3b0b3574-321a-4dfb-b99e-c9a54db63fd6', N'ZyxvmEjuxNX27MtQi95ijnDi52JL8qbmuwSxDKadH0g=', 1, N'tR8p4eCGvLoraUgMr9eK8Q==', N'racamacho@ins-cr.com', NULL, NULL, 1, 0, CAST(0x0000A17E0140247A AS DateTime), CAST(0x0000A17E0140247A AS DateTime), CAST(0x0000A17E0140247A AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[Memberships] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'658e7420-a9a3-4d11-a751-c9f7b6876a5d', N'1zZWD05qzYxIceNMkB1rHX0Ckdti2t6kvi0pID7xs9U=', 1, N'F8jvNUWdGQBQUleb9bEFZQ==', N'ccortes@improsa.com', NULL, NULL, 1, 0, CAST(0x0000A178014839F2 AS DateTime), CAST(0x0000A178014839F2 AS DateTime), CAST(0x0000A178014839F2 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[Memberships] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'f9f012d1-e177-47f5-bc60-ca288d780dd4', N'dlxt6zeeRkldLZBhKVxhWRaaAk/nZJ6iKhw59Nj1+Qo=', 1, N'oMmgC8QG3CZx4VA4wZkkAQ==', N'elejandrocaderon@bancreditocr.com', NULL, NULL, 1, 0, CAST(0x0000A17E0125B7ED AS DateTime), CAST(0x0000A17E00C2D76D AS DateTime), CAST(0x0000A17E0125B7ED AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[Memberships] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'22e466ed-5b35-4734-89e9-cc2b9ec3e55a', N'TGXzxMcUBFnNyj8Llp2V/dg7WeCpqy2yYVNr+s2jsOA=', 1, N'E7tgtDnm5bt7ob0893W2WA==', N'admin@bandbcorp.com', NULL, NULL, 1, 0, CAST(0x0000A15D0175C18D AS DateTime), CAST(0x0000A19300F19AF5 AS DateTime), CAST(0x0000A15D0175C18D AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), N'User create by initial script')
INSERT [dbo].[Memberships] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'c01d504c-a20a-48f2-9a5c-ce5dfa5059c3', N'mqyZgmj2EcZtiH/557KdH/u9UtvwHfwl8rHFH/EahI0=', 1, N'CuJrBcbAaRB03LDzRrCsMw==', N'olgermmm@gmail.com', NULL, NULL, 1, 0, CAST(0x0000A178011DA5BF AS DateTime), CAST(0x0000A178011DA5BF AS DateTime), CAST(0x0000A178011DA5BF AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[Memberships] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'd594f477-dacb-414a-b34b-cf0937457b36', N'UZP0eWN7RiTurOjvwdCtYvtXsFU78VhLXrps+SA6C8s=', 1, N'Hnc3+U+hOMhqwzcZHSGYAg==', N'jleandro56@gmail.com', NULL, NULL, 1, 0, CAST(0x0000A17801147BCA AS DateTime), CAST(0x0000A17801147BCA AS DateTime), CAST(0x0000A17801147BCA AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[Memberships] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'e87a5a50-b1da-401e-823d-d1a40d8525d5', N'LvOZocWTdekfPrgOiY0/3txJaKkpyjXmmnvMBprsgjo=', 1, N'25YQ7t0RXdAA894WjAF3qw==', N'jarce@cssseguros.com', NULL, NULL, 1, 0, CAST(0x0000A17F01412953 AS DateTime), CAST(0x0000A17F01412953 AS DateTime), CAST(0x0000A17F01412953 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[Memberships] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'2788dc45-794c-48e0-bdb5-d2648b35514c', N'+I5qkOmoCwBgriWBZ+IdEsLnEHLJp+cpVm3pPVnKoWE=', 1, N'TDZfISBJDAWpDR+9uRDaSA==', N'pacmora@hotmail.com', NULL, NULL, 1, 0, CAST(0x0000A1780118205D AS DateTime), CAST(0x0000A1780118205D AS DateTime), CAST(0x0000A1780118205D AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[Memberships] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'cd70ba0b-58e1-458d-8dee-d2e4bbbfb1c5', N'FgJR6PXRSQM+rugeHynt/Kmj0ezwxL1PbH2cLZUsh6g=', 1, N'3Gh+0yLbQ+22v83zoL8ilQ==', N'eca1867@gmail.com', NULL, NULL, 1, 0, CAST(0x0000A17F01174787 AS DateTime), CAST(0x0000A17F01174787 AS DateTime), CAST(0x0000A17F01174787 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[Memberships] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'42b5d6a5-d9a8-447a-be25-d5ab4c986f6a', N'ESDYpCx6meMBIxmMp0xScDv7ehEfgcfr/ifVeWj2+jA=', 1, N'BCwoLI+y1CPnVWZpnoDb1w==', N'robudo@ice.co.cr', NULL, NULL, 1, 0, CAST(0x0000A17F0112E850 AS DateTime), CAST(0x0000A17F0112E850 AS DateTime), CAST(0x0000A17F0112E850 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[Memberships] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'f1753657-3333-40ba-b9af-d8ef74622721', N'PymYxmqQ4VYc1HjTTxQTG4lIka2agO1m6P2MrGTdt04=', 1, N'XM5pUszwhgJSwiAO+IK5nw==', N'eayala.ins@gmail.com', NULL, NULL, 1, 0, CAST(0x0000A17801196DA4 AS DateTime), CAST(0x0000A17801196DA4 AS DateTime), CAST(0x0000A17801196DA4 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[Memberships] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'fee6dd35-49bb-41f0-9760-d95f99b15bd1', N'1j03ubyrzgXoKC/hc00KpqNVOJBwKyB7CuVe5nxF55c=', 1, N'4uDbC/Zi26/I5yIwh/XWBA==', N'carlosmurillos@gmail.com', NULL, NULL, 1, 0, CAST(0x0000A1780143B6A0 AS DateTime), CAST(0x0000A1780143B6A0 AS DateTime), CAST(0x0000A1780143B6A0 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[Memberships] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'4dc3f3d8-fa10-42e8-b625-da946e8c1f59', N'P8zTXsth9dVelstOiA3eH/VhCY/86DyphbX5tUTq0Ko=', 1, N'DVYZpotPJrd0QSi2ThaZag==', N'knavarro@segurossigloxxi.com', NULL, NULL, 1, 0, CAST(0x0000A17E014837F5 AS DateTime), CAST(0x0000A17E014837F5 AS DateTime), CAST(0x0000A17E014837F5 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[Memberships] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'd4e2db0e-1291-4ded-963a-dab7babb446c', N'gEYzQ5E5HR+n+OXETfubAv7DZjU6eoNvJx1++SzKSqc=', 1, N'yCpMjiJCiWArUf/XX2Vnog==', N'melzasa@hotmail.com', NULL, NULL, 1, 0, CAST(0x0000A178011D3BAB AS DateTime), CAST(0x0000A178011D3BAB AS DateTime), CAST(0x0000A178011D3BAB AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[Memberships] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'de15718a-08eb-48c0-a789-db560b83771c', N'j1L80fQZcOCXx4xyRlPillPRfPsLzDPnl52kL3pktzs=', 1, N'JlApOX586R/T8RLBH7qiSQ==', N'marianelacastrillo@gmail.com', NULL, NULL, 1, 0, CAST(0x0000A1780147232B AS DateTime), CAST(0x0000A1780147232B AS DateTime), CAST(0x0000A1780147232B AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[Memberships] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'e6220e10-ccc5-4d1c-9291-dedd7dc87f55', N'FjN6PTg9fuj0PDJFHljsY24ISH+jeRD3ppq1KcO6CyI=', 1, N'OvekwugMk9SjDwSIb1XFGw==', N'sancho_christian@yahoo.com', NULL, NULL, 1, 0, CAST(0x0000A17E01495C40 AS DateTime), CAST(0x0000A17E01495C40 AS DateTime), CAST(0x0000A17E01495C40 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[Memberships] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'6da64653-1ff8-4938-8ecb-dee4b914ca8a', N'OZw7dIcuPjIQY+a4lnvzrKxZU1X46XChXwYp+Mh0TnM=', 1, N'CnhjXb96VdsnGwOp/Cc9qA==', N'gduran@gsi_seguros.com', NULL, NULL, 1, 0, CAST(0x0000A17F011ED561 AS DateTime), CAST(0x0000A17F011ED561 AS DateTime), CAST(0x0000A17F011ED561 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[Memberships] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'88feaa39-d83c-4fa5-ba55-df3104ec908e', N'aB4mLm6JGUcEdaFJVg6zF+vNo9vbaNgFhZUxNjKmaZg=', 1, N'afd+FsbUDsPdZGInASAqJA==', N'gvargasg@pricose.com', NULL, NULL, 1, 0, CAST(0x0000A17E014AC754 AS DateTime), CAST(0x0000A17E014AC754 AS DateTime), CAST(0x0000A17E014AC754 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[Memberships] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'f9439a9a-11a0-40ce-accc-e23fc5ae8f3c', N'bibKZI+DLHb/fWNy92/u4Pf4ax49mEVsZfUW7wLY0L4=', 1, N'flE0vPOVsTWZA40o9TDCVQ==', N'aperez@bp.fi.cr', NULL, NULL, 1, 0, CAST(0x0000A17F014424B1 AS DateTime), CAST(0x0000A17F014424B1 AS DateTime), CAST(0x0000A17F014424B1 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[Memberships] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'8b8b61e9-0892-4dba-b72b-e4b52c15dabe', N'K/hBrSCzdydJEcj8RjRc5YXuZ9aSSbsi79wEutMJIp0=', 1, N'F+45T6Vob2lZzjdsCBsNzg==', N'ealfaro@racsa.co.cr', NULL, NULL, 1, 0, CAST(0x0000A17801454857 AS DateTime), CAST(0x0000A17801454857 AS DateTime), CAST(0x0000A17801454857 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[Memberships] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'ed327b5a-0f81-45b6-95ef-e5c28806a8a0', N'p+9YHcQ9zF/1eKj85LksegOQlcGNnHSzY8s+ABwFzJs=', 1, N'JqpUsw7LT/zDU9HBTrUjKw==', N'camesa52@hotmail.com', NULL, NULL, 1, 0, CAST(0x0000A17801159C46 AS DateTime), CAST(0x0000A17801159C46 AS DateTime), CAST(0x0000A17801159C46 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[Memberships] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'79e11c51-1eb9-4ce8-9181-e73c25ac57ac', N'OVBnn1f00tx5qyxCQsVZk2mIn/9xeNAdhL2pMgqulfc=', 1, N'E3U3TWjX4mCdlAIv0XhXsg==', N'andamo07@hotmail.com', NULL, NULL, 1, 0, CAST(0x0000A17F01120823 AS DateTime), CAST(0x0000A17F01120823 AS DateTime), CAST(0x0000A17F01120823 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[Memberships] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'd31041af-cef8-40b8-a45e-e774be9dff6f', N'NpZPdmq3JyHksYjAM+/2UPoRjrTHMz6Xtwm6h7kHWv8=', 1, N'7REejUDzxkPvhZl+Iivmtw==', N'fcanasc@pricose.com', NULL, NULL, 1, 0, CAST(0x0000A17E014DFD66 AS DateTime), CAST(0x0000A17E014DFD66 AS DateTime), CAST(0x0000A17E014DFD66 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[Memberships] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'2cb27382-0595-41e8-9821-e77d8fdab632', N'YZtOi/32dCvFtWgAAkCMhjhaw5wq302h9NBJ0Qydra8=', 1, N'XBz0n2wmtP6b5zctNzGOFw==', N'mauvega@oms-cr.com', NULL, NULL, 1, 0, CAST(0x0000A17F0106C5BA AS DateTime), CAST(0x0000A17F00A3E53A AS DateTime), CAST(0x0000A17F0106C5BA AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[Memberships] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'4347b67c-5e00-4b89-aa64-e8c753fce49d', N'zUD2KKobw06n4StJnfl37yZqzYrSb6mRAN2kDzmV4wc=', 1, N'fj4gmV0NGzIMKNHHQjVnaA==', N'oficina-seguros-ins102@hotmail.com', NULL, NULL, 1, 0, CAST(0x0000A17F0104E72F AS DateTime), CAST(0x0000A17F0104E72F AS DateTime), CAST(0x0000A17F0104E72F AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[Memberships] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'd8be406b-eee8-49f2-bffc-e9859ab9910c', N'GA1eaRH5PuiRlAE63QqHdOMcPXiIR4NR/L4WoGpAshk=', 1, N'eQyvJRNEZ0EsrSMASmdEjw==', N'cborge@pricose.com', NULL, NULL, 1, 0, CAST(0x0000A17E0124C038 AS DateTime), CAST(0x0000A17E00C1DFB8 AS DateTime), CAST(0x0000A17E0124C038 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[Memberships] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'e33e7b01-c8e9-4e4b-9042-eafce9410dc7', N't88XfcwiNL1vji7HtN+rz4NSO4nZh2kWIbyhmpev5lo=', 1, N'+OWPF+SVtYwEufYO5gcNow==', N'svillalobos@cadadeande.fi.cr, sil_va28@hotmail.com', NULL, NULL, 1, 0, CAST(0x0000A17E014A60DD AS DateTime), CAST(0x0000A17E014A60DD AS DateTime), CAST(0x0000A17E014A60DD AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[Memberships] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'9d112d71-580e-4af0-b4be-f01a2a95b3be', N'gL3IFi8cqYclHbPBgLkjhblV4jskG/QJxNYoYtiDoDg=', 1, N'7gEGaUqCbY2U17RF+BcVhA==', N'zgeorgeh@pricose.com', NULL, NULL, 1, 0, CAST(0x0000A17E0152CFA4 AS DateTime), CAST(0x0000A17E0152CFA4 AS DateTime), CAST(0x0000A17E0152CFA4 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[Memberships] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'b081f97c-0d4e-40f8-b4c3-f058e89b31fd', N'UrLOTrMOeS40iZx4bBQWh5eGrM9sy0jJHZgIMBOHmqA=', 1, N'oP2uksnUgxGnvXZlbgtOKg==', N'karenmf-18@hotmail.com', NULL, NULL, 1, 0, CAST(0x0000A17E0147B018 AS DateTime), CAST(0x0000A17E0147B018 AS DateTime), CAST(0x0000A17E0147B018 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[Memberships] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'97b14396-7ab4-4094-9c4a-f06017a421de', N'Iv0Sw91Sg71q0O3bGQwFRXIKKgkLL9eEkM7NBV+znSc=', 1, N'XRrPxAOgzF+nM/jX+xjjKg==', N'aseguradoresdeoccidente@gmail.com', NULL, NULL, 1, 0, CAST(0x0000A1780144BFD1 AS DateTime), CAST(0x0000A1780144BFD1 AS DateTime), CAST(0x0000A1780144BFD1 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[Memberships] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'c49386dc-3243-4e1b-8f4e-f2d07ca1ffc1', N'+xKygdm/7Orr6j9E84fGVq4KIdtJOx3TR6tvZqJdXn0=', 1, N'6orsnjarmE2L8+qWw2CIfg==', N'luiscgf2011@hotmail.com', NULL, NULL, 1, 0, CAST(0x0000A178014AB9EB AS DateTime), CAST(0x0000A178014AB9EB AS DateTime), CAST(0x0000A178014AB9EB AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[Memberships] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'e2807c0f-cf5d-4f98-bcb3-f3c7415ff1c5', N'ugU2kZjpI+Aysa/Mb3JNnfPwuQm0GqGWNxxya7Dl8Uw=', 1, N'5JGLz1IrmR3AeLOJTtZNxA==', N'salas_salgado@hotmail.com', NULL, NULL, 1, 0, CAST(0x0000A17E011C0BC5 AS DateTime), CAST(0x0000A17E011C0BC5 AS DateTime), CAST(0x0000A17E011C0BC5 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[Memberships] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'b23d276c-0795-48b2-b6a0-f5d0984dd682', N'VJLGkicxhDc22ALPgPXC7mQpaih5LIB8cRVESw/OZns=', 1, N'gS5XdpAP5etAa1sVmZU5Nw==', N'wcalderon@ins-cr.com', NULL, NULL, 1, 0, CAST(0x0000A17E014D981B AS DateTime), CAST(0x0000A17E014D981B AS DateTime), CAST(0x0000A17E014D981B AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[Memberships] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'50277c83-e5d4-4e6b-a694-f6a91a0e994e', N'WuFcrKfXMOBo2GEja4A4YyHtQMWc/o4m/dw41irZ2RU=', 1, N'cnTe6KAYIHy7EGpV3PI0Pg==', N'gloryfi68@hotmail.com', NULL, NULL, 1, 0, CAST(0x0000A17F0105A938 AS DateTime), CAST(0x0000A17F003FE838 AS DateTime), CAST(0x0000A17F0105A938 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[Memberships] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'd54386f4-d644-40d5-b4b0-f853be8b2e0b', N'YNRa6xBOWhab4aVPnc1q6T5YBsUFkTTXw7DrwGWgBbA=', 1, N'013rih4qCC6oM2+9lccanA==', N'asesor.ins@hotmail.com', NULL, NULL, 1, 0, CAST(0x0000A1780146C79E AS DateTime), CAST(0x0000A1780146C79E AS DateTime), CAST(0x0000A1780146C79E AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[Memberships] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'4f585e36-fd6e-43ef-b086-fa317a195d98', N'YKqXOy5ysFmFMyrNOjzZKs8+NNyTEpQAUbSO2R9nQrU=', 1, N'B0pYpgQVPhHAOiiyhGWMJg==', N'rarayai@pricose.com', NULL, NULL, 1, 0, CAST(0x0000A17801461888 AS DateTime), CAST(0x0000A17801461888 AS DateTime), CAST(0x0000A17801461888 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[Memberships] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'37161e19-f11e-493c-8506-fa396c3457c1', N'eLk6CkA9IMAMyUBc0QmrlmluxqPR5bcoa+PN0zMgazk=', 1, N'BUWfIEZA7nJ5Jbs7RTB3Ww==', N'geovannisv@gmail.com', NULL, NULL, 1, 0, CAST(0x0000A17E011CE7DD AS DateTime), CAST(0x0000A17E011CE7DD AS DateTime), CAST(0x0000A17E011CE7DD AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[Memberships] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'2352bd85-dc90-4fd7-a523-fa7409a58b25', N'1lIjWPbY47sVq+kY1DM7sr7QUQHuRfjOgZcH1FdmXeE=', 1, N'bTqRScn22kDeeO5QI6LwaQ==', N'sussyelizondo@gmail.com', NULL, NULL, 1, 0, CAST(0x0000A17801435AAB AS DateTime), CAST(0x0000A17801435AAB AS DateTime), CAST(0x0000A17801435AAB AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[Memberships] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'b5d1c451-336d-48c3-ba16-fd4cfbbf9590', N'a3AwpTJO5PcbVhHXtdAeYI/VHt9QmDWZWKiKQmF+CkQ=', 1, N'FCadu+7+pGq9Xtg0+54ZrA==', N'rchagnon@acs-cr.com', NULL, NULL, 1, 0, CAST(0x0000A1780148EE29 AS DateTime), CAST(0x0000A1780148EE29 AS DateTime), CAST(0x0000A1780148EE29 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[Memberships] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'11ba13b7-7df8-437a-bdaf-fe0d065212b4', N'quvQrCvs5GuO1iu2xaspmDpF8+sCGojxQdk8lsqWxEY=', 1, N'38kvkxWw+nHm5hHBt14Uwg==', N'wjaubert@itcr.ac.cr', NULL, NULL, 1, 0, CAST(0x0000A1660164072F AS DateTime), CAST(0x0000A1660164072F AS DateTime), CAST(0x0000A1660164072F AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[Memberships] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'b79950c3-c5ae-4855-8c6e-639b8d85b7bb', N'e64445cd-3d1d-4101-99dc-fefbc3b7173d', N'oQuFZF9ym1KhE0vluaCrrrOy60agLRRZ++Qt+1tKeO0=', 1, N'3D4b3qSHdrMAe/80yjR4dQ==', N'emanley@ins-cr.com', NULL, NULL, 1, 0, CAST(0x0000A17F01048A88 AS DateTime), CAST(0x0000A17F01048A88 AS DateTime), CAST(0x0000A17F01048A88 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
/****** Object:  Table [dbo].[Record]    Script Date: 04/01/2013 10:27:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Record]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Record](
	[RecordID] [uniqueidentifier] NOT NULL,
	[ScoreID] [uniqueidentifier] NOT NULL,
	[InsertDate] [datetime] NULL,
	[InsertUserID] [uniqueidentifier] NULL,
	[ModifyDate] [datetime] NULL,
	[ModifyUserID] [uniqueidentifier] NULL,
	[IpAddress] [varchar](200) NULL,
 CONSTRAINT [PK_Record] PRIMARY KEY CLUSTERED 
(
	[RecordID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Profiles]    Script Date: 04/01/2013 10:27:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Profiles]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Profiles](
	[UserId] [uniqueidentifier] NOT NULL,
	[PropertyNames] [nvarchar](4000) NOT NULL,
	[PropertyValueStrings] [nvarchar](4000) NOT NULL,
	[PropertyValueBinary] [image] NOT NULL,
	[LastUpdatedDate] [datetime] NOT NULL,
	[InsertDate] [datetime] NULL,
	[InsertUserID] [uniqueidentifier] NULL,
	[ModifyDate] [datetime] NULL,
	[ModifyUserID] [uniqueidentifier] NULL,
	[IpAddress] [varchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EnrollmentCourse]    Script Date: 04/01/2013 10:27:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EnrollmentCourse]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[EnrollmentCourse](
	[EnrollmentCourseID] [uniqueidentifier] NOT NULL,
	[EnrollmentID] [uniqueidentifier] NOT NULL,
	[CourseID] [uniqueidentifier] NOT NULL,
	[IsChecked] [bit] NOT NULL,
	[HasGroups] [bit] NOT NULL,
	[InsertDate] [datetime] NULL,
	[InsertUserID] [uniqueidentifier] NULL,
	[ModifyDate] [datetime] NULL,
	[ModifyUserID] [uniqueidentifier] NULL,
	[IpAddress] [varchar](200) NULL,
 CONSTRAINT [PK_EnrollmentCourse] PRIMARY KEY CLUSTERED 
(
	[EnrollmentCourseID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[EnrollmentCourse] ([EnrollmentCourseID], [EnrollmentID], [CourseID], [IsChecked], [HasGroups], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress]) VALUES (N'943f2c2f-3420-4d0f-ac59-024eb9fcb21d', N'91900012-b6ae-4edd-b045-0d9afea581e2', N'c906cbce-6f38-4b59-bd59-477ae36ebc2f', 0, 0, CAST(0x0000A18C00000000 AS DateTime), N'22e466ed-5b35-4734-89e9-cc2b9ec3e55a', NULL, NULL, N'172.26.52.168')
INSERT [dbo].[EnrollmentCourse] ([EnrollmentCourseID], [EnrollmentID], [CourseID], [IsChecked], [HasGroups], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress]) VALUES (N'85fcb25e-7b62-4323-9188-390980ef9179', N'91900012-b6ae-4edd-b045-0d9afea581e2', N'5e4ff0d3-9043-400e-919d-cccf818922c4', 0, 0, CAST(0x0000A18C00000000 AS DateTime), N'22e466ed-5b35-4734-89e9-cc2b9ec3e55a', NULL, NULL, N'172.26.52.168')
INSERT [dbo].[EnrollmentCourse] ([EnrollmentCourseID], [EnrollmentID], [CourseID], [IsChecked], [HasGroups], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress]) VALUES (N'aa1f1a82-b80a-4e00-98f3-675308268d79', N'91900012-b6ae-4edd-b045-0d9afea581e2', N'66471d8a-d930-4dff-ad7f-1fe5ced5b5cf', 0, 0, CAST(0x0000A18C00000000 AS DateTime), N'22e466ed-5b35-4734-89e9-cc2b9ec3e55a', NULL, NULL, N'172.26.52.168')
/****** Object:  Table [dbo].[School-Scheme]    Script Date: 04/01/2013 10:27:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[School-Scheme]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[School-Scheme](
	[SchoolID] [uniqueidentifier] NOT NULL,
	[SchemeID] [uniqueidentifier] NOT NULL,
	[InsertDate] [datetime] NULL,
	[InsertUserID] [uniqueidentifier] NULL,
	[ModifyDate] [datetime] NULL,
	[ModifyUserID] [uniqueidentifier] NULL,
	[IpAddress] [varchar](200) NULL
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Scheme-Requirement]    Script Date: 04/01/2013 10:27:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Scheme-Requirement]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Scheme-Requirement](
	[SchemeID] [uniqueidentifier] NOT NULL,
	[RequirementID] [uniqueidentifier] NOT NULL,
	[InsertDate] [datetime] NULL,
	[InsertUserID] [uniqueidentifier] NULL,
	[ModifyDate] [datetime] NULL,
	[ModifyUserID] [uniqueidentifier] NULL,
	[IpAddress] [varchar](200) NULL,
 CONSTRAINT [PK_Scheme-Requirement] PRIMARY KEY CLUSTERED 
(
	[SchemeID] ASC,
	[RequirementID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Scheme-Requirement] ([SchemeID], [RequirementID], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress]) VALUES (N'af9343aa-b8cf-4d19-9600-c21896e640aa', N'37dede46-b07a-4564-8923-43cc39e50e43', CAST(0x0000A17D00000000 AS DateTime), N'22e466ed-5b35-4734-89e9-cc2b9ec3e55a', NULL, NULL, N'172.26.52.168')
INSERT [dbo].[Scheme-Requirement] ([SchemeID], [RequirementID], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress]) VALUES (N'7a899884-43e2-4141-94fa-dee8dd57cbe5', N'37dede46-b07a-4564-8923-43cc39e50e43', CAST(0x0000A18800000000 AS DateTime), N'c8f318ea-34f0-4260-ba62-8f2e92949939', NULL, NULL, N'172.26.80.212')
/****** Object:  Table [dbo].[Scheme-Plan]    Script Date: 04/01/2013 10:27:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Scheme-Plan]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Scheme-Plan](
	[SchemeID] [uniqueidentifier] NOT NULL,
	[PlanID] [uniqueidentifier] NOT NULL,
	[InsertDate] [datetime] NULL,
	[InsertUserID] [uniqueidentifier] NULL,
	[ModifyDate] [datetime] NULL,
	[ModifyUserID] [uniqueidentifier] NULL,
	[IpAddress] [varchar](200) NULL,
 CONSTRAINT [PK_Scheme-Plan] PRIMARY KEY CLUSTERED 
(
	[SchemeID] ASC,
	[PlanID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Scheme-Plan] ([SchemeID], [PlanID], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress]) VALUES (N'26fd5b63-130b-42c9-881b-0d3c1f811db9', N'1693316d-2be7-4e10-8cb8-8dcdb2025876', CAST(0x0000A18800000000 AS DateTime), N'c8f318ea-34f0-4260-ba62-8f2e92949939', NULL, NULL, N'172.26.80.212')
INSERT [dbo].[Scheme-Plan] ([SchemeID], [PlanID], [InsertDate], [InsertUserID], [ModifyDate], [ModifyUserID], [IpAddress]) VALUES (N'a9283525-c52b-4446-ab7f-452b55184341', N'd53bcd0b-cd9e-4a1a-97eb-ca6c90f3fb7e', CAST(0x0000A17F00000000 AS DateTime), N'09e4d1cd-a983-432a-80a9-2fc910e920d2', NULL, NULL, N'172.26.94.204')
/****** Object:  View [dbo].[SchemeDetails]    Script Date: 04/01/2013 10:27:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[SchemeDetails]'))
EXEC dbo.sp_executesql @statement = N'
CREATE VIEW [dbo].[SchemeDetails]
AS
SELECT	s.SchemeID, 
		s.Name SchemeName, 
		s.Description,
		s.OwnerUserId,
		u1.UserName OwnerName,
		s.CoordinatorUserId,
		u2.UserName CoordinatorName,
		s.ModalityID,
		m.Name ModalityName				 
FROM Scheme s
INNER JOIN Modality m ON s.ModalityID = m.ModalityID
INNER JOIN Users u1 ON u1.UserId = s.OwnerUserId
INNER JOIN Users u2 ON u2.UserId= s.CoordinatorUserId
'
GO
/****** Object:  Table [dbo].[StudiesInformation]    Script Date: 04/01/2013 10:27:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[StudiesInformation]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[StudiesInformation](
	[StudyID] [uniqueidentifier] NOT NULL,
	[InsertDate] [datetime] NULL,
	[InsertUserID] [uniqueidentifier] NULL,
	[ModifyDate] [datetime] NULL,
	[ModifyUserID] [uniqueidentifier] NULL,
	[IpAddress] [varchar](10) NULL,
	[StudentID] [uniqueidentifier] NULL,
	[SchoolName] [varchar](300) NULL,
	[Degree] [varchar](300) NULL,
	[Year] [int] NULL,
	[SchoolPlace] [varchar](400) NULL,
 CONSTRAINT [PK_StudiesInformation] PRIMARY KEY CLUSTERED 
(
	[StudyID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[StudentPlan]    Script Date: 04/01/2013 10:27:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[StudentPlan]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[StudentPlan](
	[StudentID] [uniqueidentifier] NOT NULL,
	[PlanID] [uniqueidentifier] NOT NULL,
	[InsertDate] [datetime] NULL,
	[InsertUserID] [uniqueidentifier] NULL,
	[ModifyDate] [datetime] NULL,
	[ModifyUserID] [uniqueidentifier] NULL,
	[IpAddress] [varchar](200) NULL,
 CONSTRAINT [PK_StudentPlan] PRIMARY KEY CLUSTERED 
(
	[StudentID] ASC,
	[PlanID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Student-Course]    Script Date: 04/01/2013 10:27:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Student-Course]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Student-Course](
	[StudentID] [uniqueidentifier] NOT NULL,
	[CourseID] [uniqueidentifier] NOT NULL,
	[InsertDate] [datetime] NULL,
	[InsertUserID] [uniqueidentifier] NULL,
	[ModifyDate] [datetime] NULL,
	[ModifyUserID] [uniqueidentifier] NULL,
	[IpAddress] [varchar](200) NULL
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[StudentAdditionalData]    Script Date: 04/01/2013 10:27:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[StudentAdditionalData]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[StudentAdditionalData](
	[StudentID] [uniqueidentifier] NOT NULL,
	[InsertDate] [datetime] NULL,
	[InsertUserID] [uniqueidentifier] NULL,
	[ModifyDate] [datetime] NULL,
	[ModifyUserID] [uniqueidentifier] NULL,
	[IpAddress] [varchar](200) NULL,
	[PhysicalAddress] [varchar](400) NOT NULL,
	[AdditionalAddress] [varchar](400) NULL,
	[JobTitle] [varchar](200) NULL,
	[WorkPlace] [varchar](400) NULL,
	[Works] [bit] NOT NULL,
	[Studies] [bit] NOT NULL,
	[WhoPaysYourStudiesTypeID] [uniqueidentifier] NULL,
	[HowYouKnowAboutUsTypeID] [uniqueidentifier] NULL,
	[ReceiveOffers] [bit] NOT NULL,
	[ReceiveNews] [bit] NOT NULL,
 CONSTRAINT [PK_StudentAdditionalData] PRIMARY KEY CLUSTERED 
(
	[StudentID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[ApplicationUser]    Script Date: 04/01/2013 10:27:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[ApplicationUser]'))
EXEC dbo.sp_executesql @statement = N'
CREATE VIEW [dbo].[ApplicationUser]
AS
SELECT 
	  a.UserId
	, ISNULL(c.StudentID,NEWID())  AS StudentID
	, a.UserName
	, ISNULL(b.Email,'''') AS Email
	, ISNULL(c.FirstName,'''') AS FirstName
	, ISNULL(c.LastName,'''') AS LastName
	, ISNULL(c.Gender,''M'') AS Gender
	, ISNULL(c.DateOfBirth,GETDATE()) AS DateOfBirth
	, ISNULL(c.CountryID,NEWID()) AS CountryID
	, ISNULL(d.CountryName,'''') AS CountryName
	, ISNULL(c.MaritalStatusTypeID,NEWID()) AS MaritalStatusTypeID
	, ISNULL(c.Phone1,'''') AS Phone1
	, ISNULL(c.Phone2,'''') AS Phone2
	, ISNULL(c.Phone3,'''') AS Phone3
	, ISNULL(f.RoleName,'''') AS RoleName  
	, ISNULL(c.IdentificationTypeID,NEWID())IdentificationTypeID
FROM  dbo.Users AS a INNER JOIN
               dbo.Memberships AS b ON a.UserId = b.UserId LEFT JOIN
               dbo.Student AS c ON a.UserId = c.UserID LEFT JOIN
               dbo.Country AS d ON c.CountryID = d.CountryID
               LEFT JOIN dbo.UsersInRoles AS e ON e.UserId = a.UserId
               LEFT JOIN dbo.Roles AS f ON f.RoleId = e.RoleId
WHERE (c.IsAppUser is null OR c.IsAppUser = 1)
  AND a.UserName <> ''admin''

'
GO
/****** Object:  View [dbo].[PlanDetails]    Script Date: 04/01/2013 10:27:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[PlanDetails]'))
EXEC dbo.sp_executesql @statement = N'
CREATE VIEW [dbo].[PlanDetails]
AS
SELECT	sp.SchemeID,
		s.Name AS SchemeName, 		 
		p.PlanID, 
		p.Name AS PlanName,
		p.[Description],
		p.[Version] 
FROM [Plan] p
INNER JOIN [Scheme-Plan] sp ON p.PlanID = sp.PlanID
INNER JOIN Scheme s ON s.SchemeID = sp.SchemeID
'
GO
/****** Object:  Table [dbo].[EnrollmentGroups]    Script Date: 04/01/2013 10:27:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EnrollmentGroups]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[EnrollmentGroups](
	[EnrollmentGroupID] [uniqueidentifier] NOT NULL,
	[EnrollmentCourseID] [uniqueidentifier] NOT NULL,
	[GroupName] [varchar](80) NOT NULL,
	[ClassroomID] [uniqueidentifier] NULL,
	[ProfessorID] [uniqueidentifier] NULL,
	[Quota] [int] NOT NULL,
	[ExtraQuota] [int] NULL,
	[InsertDate] [datetime] NULL,
	[InsertUserID] [uniqueidentifier] NULL,
	[ModifyDate] [datetime] NULL,
	[ModifyUserID] [uniqueidentifier] NULL,
	[IpAddress] [varchar](200) NULL,
 CONSTRAINT [PK_EnrollmentGroups] PRIMARY KEY CLUSTERED 
(
	[EnrollmentGroupID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EnrollmentGroupSchedule]    Script Date: 04/01/2013 10:27:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EnrollmentGroupSchedule]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[EnrollmentGroupSchedule](
	[EnrollmentGroupScheduleID] [uniqueidentifier] NOT NULL,
	[EnrollmentGroupID] [uniqueidentifier] NOT NULL,
	[Day] [varchar](50) NOT NULL,
	[StartTime] [datetime] NOT NULL,
	[EndTime] [datetime] NOT NULL,
	[InsertDate] [datetime] NULL,
	[InsertUserID] [uniqueidentifier] NULL,
	[ModifyDate] [datetime] NULL,
	[ModifyUserID] [uniqueidentifier] NULL,
	[IpAddress] [varchar](200) NULL,
 CONSTRAINT [PK_EnrollmentGroupSchedule] PRIMARY KEY CLUSTERED 
(
	[EnrollmentGroupScheduleID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  ForeignKey [UserApplication]    Script Date: 04/01/2013 10:27:49 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[UserApplication]') AND parent_object_id = OBJECT_ID(N'[dbo].[Users]'))
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [UserApplication] FOREIGN KEY([ApplicationId])
REFERENCES [dbo].[Applications] ([ApplicationId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[UserApplication]') AND parent_object_id = OBJECT_ID(N'[dbo].[Users]'))
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [UserApplication]
GO
/****** Object:  ForeignKey [FK_Scheme_Modality]    Script Date: 04/01/2013 10:27:49 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Scheme_Modality]') AND parent_object_id = OBJECT_ID(N'[dbo].[Scheme]'))
ALTER TABLE [dbo].[Scheme]  WITH CHECK ADD  CONSTRAINT [FK_Scheme_Modality] FOREIGN KEY([ModalityID])
REFERENCES [dbo].[Modality] ([ModalityID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Scheme_Modality]') AND parent_object_id = OBJECT_ID(N'[dbo].[Scheme]'))
ALTER TABLE [dbo].[Scheme] CHECK CONSTRAINT [FK_Scheme_Modality]
GO
/****** Object:  ForeignKey [RoleApplication]    Script Date: 04/01/2013 10:27:50 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[RoleApplication]') AND parent_object_id = OBJECT_ID(N'[dbo].[Roles]'))
ALTER TABLE [dbo].[Roles]  WITH CHECK ADD  CONSTRAINT [RoleApplication] FOREIGN KEY([ApplicationId])
REFERENCES [dbo].[Applications] ([ApplicationId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[RoleApplication]') AND parent_object_id = OBJECT_ID(N'[dbo].[Roles]'))
ALTER TABLE [dbo].[Roles] CHECK CONSTRAINT [RoleApplication]
GO
/****** Object:  ForeignKey [FK_Score_Course]    Script Date: 04/01/2013 10:27:50 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Score_Course]') AND parent_object_id = OBJECT_ID(N'[dbo].[Score]'))
ALTER TABLE [dbo].[Score]  WITH CHECK ADD  CONSTRAINT [FK_Score_Course] FOREIGN KEY([CourseID])
REFERENCES [dbo].[Course] ([CourseID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Score_Course]') AND parent_object_id = OBJECT_ID(N'[dbo].[Score]'))
ALTER TABLE [dbo].[Score] CHECK CONSTRAINT [FK_Score_Course]
GO
/****** Object:  ForeignKey [FK_Enrollment_Location]    Script Date: 04/01/2013 10:27:50 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Enrollment_Location]') AND parent_object_id = OBJECT_ID(N'[dbo].[Enrollment]'))
ALTER TABLE [dbo].[Enrollment]  WITH CHECK ADD  CONSTRAINT [FK_Enrollment_Location] FOREIGN KEY([LocationID])
REFERENCES [dbo].[Location] ([LocationID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Enrollment_Location]') AND parent_object_id = OBJECT_ID(N'[dbo].[Enrollment]'))
ALTER TABLE [dbo].[Enrollment] CHECK CONSTRAINT [FK_Enrollment_Location]
GO
/****** Object:  ForeignKey [FK_Enrollment_Plan]    Script Date: 04/01/2013 10:27:50 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Enrollment_Plan]') AND parent_object_id = OBJECT_ID(N'[dbo].[Enrollment]'))
ALTER TABLE [dbo].[Enrollment]  WITH CHECK ADD  CONSTRAINT [FK_Enrollment_Plan] FOREIGN KEY([PlanID])
REFERENCES [dbo].[Plan] ([PlanID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Enrollment_Plan]') AND parent_object_id = OBJECT_ID(N'[dbo].[Enrollment]'))
ALTER TABLE [dbo].[Enrollment] CHECK CONSTRAINT [FK_Enrollment_Plan]
GO
/****** Object:  ForeignKey [FK_Course-Requirement_Course]    Script Date: 04/01/2013 10:27:50 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Course-Requirement_Course]') AND parent_object_id = OBJECT_ID(N'[dbo].[Course-Requirement]'))
ALTER TABLE [dbo].[Course-Requirement]  WITH CHECK ADD  CONSTRAINT [FK_Course-Requirement_Course] FOREIGN KEY([CourseID])
REFERENCES [dbo].[Course] ([CourseID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Course-Requirement_Course]') AND parent_object_id = OBJECT_ID(N'[dbo].[Course-Requirement]'))
ALTER TABLE [dbo].[Course-Requirement] CHECK CONSTRAINT [FK_Course-Requirement_Course]
GO
/****** Object:  ForeignKey [FK_Course-Requirement_Requirement]    Script Date: 04/01/2013 10:27:50 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Course-Requirement_Requirement]') AND parent_object_id = OBJECT_ID(N'[dbo].[Course-Requirement]'))
ALTER TABLE [dbo].[Course-Requirement]  WITH CHECK ADD  CONSTRAINT [FK_Course-Requirement_Requirement] FOREIGN KEY([RequirementID])
REFERENCES [dbo].[Requirement] ([RequirementID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Course-Requirement_Requirement]') AND parent_object_id = OBJECT_ID(N'[dbo].[Course-Requirement]'))
ALTER TABLE [dbo].[Course-Requirement] CHECK CONSTRAINT [FK_Course-Requirement_Requirement]
GO
/****** Object:  ForeignKey [FK_Plan-Course_Course]    Script Date: 04/01/2013 10:27:50 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Plan-Course_Course]') AND parent_object_id = OBJECT_ID(N'[dbo].[Plan-Course]'))
ALTER TABLE [dbo].[Plan-Course]  WITH CHECK ADD  CONSTRAINT [FK_Plan-Course_Course] FOREIGN KEY([CourseID])
REFERENCES [dbo].[Course] ([CourseID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Plan-Course_Course]') AND parent_object_id = OBJECT_ID(N'[dbo].[Plan-Course]'))
ALTER TABLE [dbo].[Plan-Course] CHECK CONSTRAINT [FK_Plan-Course_Course]
GO
/****** Object:  ForeignKey [FK_Plan-Course_Plan]    Script Date: 04/01/2013 10:27:50 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Plan-Course_Plan]') AND parent_object_id = OBJECT_ID(N'[dbo].[Plan-Course]'))
ALTER TABLE [dbo].[Plan-Course]  WITH CHECK ADD  CONSTRAINT [FK_Plan-Course_Plan] FOREIGN KEY([PlanID])
REFERENCES [dbo].[Plan] ([PlanID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Plan-Course_Plan]') AND parent_object_id = OBJECT_ID(N'[dbo].[Plan-Course]'))
ALTER TABLE [dbo].[Plan-Course] CHECK CONSTRAINT [FK_Plan-Course_Plan]
GO
/****** Object:  ForeignKey [UsersInRoleRole]    Script Date: 04/01/2013 10:27:52 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[UsersInRoleRole]') AND parent_object_id = OBJECT_ID(N'[dbo].[UsersInRoles]'))
ALTER TABLE [dbo].[UsersInRoles]  WITH CHECK ADD  CONSTRAINT [UsersInRoleRole] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([RoleId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[UsersInRoleRole]') AND parent_object_id = OBJECT_ID(N'[dbo].[UsersInRoles]'))
ALTER TABLE [dbo].[UsersInRoles] CHECK CONSTRAINT [UsersInRoleRole]
GO
/****** Object:  ForeignKey [UsersInRoleUser]    Script Date: 04/01/2013 10:27:52 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[UsersInRoleUser]') AND parent_object_id = OBJECT_ID(N'[dbo].[UsersInRoles]'))
ALTER TABLE [dbo].[UsersInRoles]  WITH CHECK ADD  CONSTRAINT [UsersInRoleUser] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[UsersInRoleUser]') AND parent_object_id = OBJECT_ID(N'[dbo].[UsersInRoles]'))
ALTER TABLE [dbo].[UsersInRoles] CHECK CONSTRAINT [UsersInRoleUser]
GO
/****** Object:  ForeignKey [FK_Student_Country]    Script Date: 04/01/2013 10:27:53 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Student_Country]') AND parent_object_id = OBJECT_ID(N'[dbo].[Student]'))
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_Country] FOREIGN KEY([CountryID])
REFERENCES [dbo].[Country] ([CountryID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Student_Country]') AND parent_object_id = OBJECT_ID(N'[dbo].[Student]'))
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_Country]
GO
/****** Object:  ForeignKey [FK_Student_Type]    Script Date: 04/01/2013 10:27:53 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Student_Type]') AND parent_object_id = OBJECT_ID(N'[dbo].[Student]'))
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_Type] FOREIGN KEY([IdentificationTypeID])
REFERENCES [dbo].[Type] ([TypeID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Student_Type]') AND parent_object_id = OBJECT_ID(N'[dbo].[Student]'))
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_Type]
GO
/****** Object:  ForeignKey [FK_Student_Type_MaritalStatus]    Script Date: 04/01/2013 10:27:53 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Student_Type_MaritalStatus]') AND parent_object_id = OBJECT_ID(N'[dbo].[Student]'))
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_Type_MaritalStatus] FOREIGN KEY([MaritalStatusTypeID])
REFERENCES [dbo].[Type] ([TypeID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Student_Type_MaritalStatus]') AND parent_object_id = OBJECT_ID(N'[dbo].[Student]'))
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_Type_MaritalStatus]
GO
/****** Object:  ForeignKey [FK_Student_Users]    Script Date: 04/01/2013 10:27:53 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Student_Users]') AND parent_object_id = OBJECT_ID(N'[dbo].[Student]'))
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Student_Users]') AND parent_object_id = OBJECT_ID(N'[dbo].[Student]'))
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_Users]
GO
/****** Object:  ForeignKey [MembershipApplication]    Script Date: 04/01/2013 10:27:53 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[MembershipApplication]') AND parent_object_id = OBJECT_ID(N'[dbo].[Memberships]'))
ALTER TABLE [dbo].[Memberships]  WITH CHECK ADD  CONSTRAINT [MembershipApplication] FOREIGN KEY([ApplicationId])
REFERENCES [dbo].[Applications] ([ApplicationId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[MembershipApplication]') AND parent_object_id = OBJECT_ID(N'[dbo].[Memberships]'))
ALTER TABLE [dbo].[Memberships] CHECK CONSTRAINT [MembershipApplication]
GO
/****** Object:  ForeignKey [MembershipUser]    Script Date: 04/01/2013 10:27:53 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[MembershipUser]') AND parent_object_id = OBJECT_ID(N'[dbo].[Memberships]'))
ALTER TABLE [dbo].[Memberships]  WITH CHECK ADD  CONSTRAINT [MembershipUser] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[MembershipUser]') AND parent_object_id = OBJECT_ID(N'[dbo].[Memberships]'))
ALTER TABLE [dbo].[Memberships] CHECK CONSTRAINT [MembershipUser]
GO
/****** Object:  ForeignKey [FK_Record_Score]    Script Date: 04/01/2013 10:27:53 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Record_Score]') AND parent_object_id = OBJECT_ID(N'[dbo].[Record]'))
ALTER TABLE [dbo].[Record]  WITH CHECK ADD  CONSTRAINT [FK_Record_Score] FOREIGN KEY([ScoreID])
REFERENCES [dbo].[Score] ([ScoreID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Record_Score]') AND parent_object_id = OBJECT_ID(N'[dbo].[Record]'))
ALTER TABLE [dbo].[Record] CHECK CONSTRAINT [FK_Record_Score]
GO
/****** Object:  ForeignKey [UserProfile]    Script Date: 04/01/2013 10:27:53 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[UserProfile]') AND parent_object_id = OBJECT_ID(N'[dbo].[Profiles]'))
ALTER TABLE [dbo].[Profiles]  WITH CHECK ADD  CONSTRAINT [UserProfile] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[UserProfile]') AND parent_object_id = OBJECT_ID(N'[dbo].[Profiles]'))
ALTER TABLE [dbo].[Profiles] CHECK CONSTRAINT [UserProfile]
GO
/****** Object:  ForeignKey [FK_EnrollmentCourse_Course]    Script Date: 04/01/2013 10:27:53 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_EnrollmentCourse_Course]') AND parent_object_id = OBJECT_ID(N'[dbo].[EnrollmentCourse]'))
ALTER TABLE [dbo].[EnrollmentCourse]  WITH CHECK ADD  CONSTRAINT [FK_EnrollmentCourse_Course] FOREIGN KEY([CourseID])
REFERENCES [dbo].[Course] ([CourseID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_EnrollmentCourse_Course]') AND parent_object_id = OBJECT_ID(N'[dbo].[EnrollmentCourse]'))
ALTER TABLE [dbo].[EnrollmentCourse] CHECK CONSTRAINT [FK_EnrollmentCourse_Course]
GO
/****** Object:  ForeignKey [FK_EnrollmentCourse_Enrollment]    Script Date: 04/01/2013 10:27:53 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_EnrollmentCourse_Enrollment]') AND parent_object_id = OBJECT_ID(N'[dbo].[EnrollmentCourse]'))
ALTER TABLE [dbo].[EnrollmentCourse]  WITH CHECK ADD  CONSTRAINT [FK_EnrollmentCourse_Enrollment] FOREIGN KEY([EnrollmentID])
REFERENCES [dbo].[Enrollment] ([EnrollmentID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_EnrollmentCourse_Enrollment]') AND parent_object_id = OBJECT_ID(N'[dbo].[EnrollmentCourse]'))
ALTER TABLE [dbo].[EnrollmentCourse] CHECK CONSTRAINT [FK_EnrollmentCourse_Enrollment]
GO
/****** Object:  ForeignKey [FK_School-Scheme_Scheme]    Script Date: 04/01/2013 10:27:53 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_School-Scheme_Scheme]') AND parent_object_id = OBJECT_ID(N'[dbo].[School-Scheme]'))
ALTER TABLE [dbo].[School-Scheme]  WITH CHECK ADD  CONSTRAINT [FK_School-Scheme_Scheme] FOREIGN KEY([SchemeID])
REFERENCES [dbo].[Scheme] ([SchemeID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_School-Scheme_Scheme]') AND parent_object_id = OBJECT_ID(N'[dbo].[School-Scheme]'))
ALTER TABLE [dbo].[School-Scheme] CHECK CONSTRAINT [FK_School-Scheme_Scheme]
GO
/****** Object:  ForeignKey [FK_School-Scheme_School]    Script Date: 04/01/2013 10:27:53 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_School-Scheme_School]') AND parent_object_id = OBJECT_ID(N'[dbo].[School-Scheme]'))
ALTER TABLE [dbo].[School-Scheme]  WITH CHECK ADD  CONSTRAINT [FK_School-Scheme_School] FOREIGN KEY([SchoolID])
REFERENCES [dbo].[School] ([SchoolID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_School-Scheme_School]') AND parent_object_id = OBJECT_ID(N'[dbo].[School-Scheme]'))
ALTER TABLE [dbo].[School-Scheme] CHECK CONSTRAINT [FK_School-Scheme_School]
GO
/****** Object:  ForeignKey [FK_Scheme-Requirement_Requirement]    Script Date: 04/01/2013 10:27:53 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Scheme-Requirement_Requirement]') AND parent_object_id = OBJECT_ID(N'[dbo].[Scheme-Requirement]'))
ALTER TABLE [dbo].[Scheme-Requirement]  WITH CHECK ADD  CONSTRAINT [FK_Scheme-Requirement_Requirement] FOREIGN KEY([RequirementID])
REFERENCES [dbo].[Requirement] ([RequirementID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Scheme-Requirement_Requirement]') AND parent_object_id = OBJECT_ID(N'[dbo].[Scheme-Requirement]'))
ALTER TABLE [dbo].[Scheme-Requirement] CHECK CONSTRAINT [FK_Scheme-Requirement_Requirement]
GO
/****** Object:  ForeignKey [FK_Scheme-Requirement_Scheme]    Script Date: 04/01/2013 10:27:53 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Scheme-Requirement_Scheme]') AND parent_object_id = OBJECT_ID(N'[dbo].[Scheme-Requirement]'))
ALTER TABLE [dbo].[Scheme-Requirement]  WITH CHECK ADD  CONSTRAINT [FK_Scheme-Requirement_Scheme] FOREIGN KEY([SchemeID])
REFERENCES [dbo].[Scheme] ([SchemeID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Scheme-Requirement_Scheme]') AND parent_object_id = OBJECT_ID(N'[dbo].[Scheme-Requirement]'))
ALTER TABLE [dbo].[Scheme-Requirement] CHECK CONSTRAINT [FK_Scheme-Requirement_Scheme]
GO
/****** Object:  ForeignKey [FK_Scheme-Plan_Plan]    Script Date: 04/01/2013 10:27:54 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Scheme-Plan_Plan]') AND parent_object_id = OBJECT_ID(N'[dbo].[Scheme-Plan]'))
ALTER TABLE [dbo].[Scheme-Plan]  WITH CHECK ADD  CONSTRAINT [FK_Scheme-Plan_Plan] FOREIGN KEY([PlanID])
REFERENCES [dbo].[Plan] ([PlanID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Scheme-Plan_Plan]') AND parent_object_id = OBJECT_ID(N'[dbo].[Scheme-Plan]'))
ALTER TABLE [dbo].[Scheme-Plan] CHECK CONSTRAINT [FK_Scheme-Plan_Plan]
GO
/****** Object:  ForeignKey [FK_Scheme-Plan_Scheme]    Script Date: 04/01/2013 10:27:54 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Scheme-Plan_Scheme]') AND parent_object_id = OBJECT_ID(N'[dbo].[Scheme-Plan]'))
ALTER TABLE [dbo].[Scheme-Plan]  WITH CHECK ADD  CONSTRAINT [FK_Scheme-Plan_Scheme] FOREIGN KEY([SchemeID])
REFERENCES [dbo].[Scheme] ([SchemeID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Scheme-Plan_Scheme]') AND parent_object_id = OBJECT_ID(N'[dbo].[Scheme-Plan]'))
ALTER TABLE [dbo].[Scheme-Plan] CHECK CONSTRAINT [FK_Scheme-Plan_Scheme]
GO
/****** Object:  ForeignKey [FK_StudiesInformation_Student]    Script Date: 04/01/2013 10:27:54 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_StudiesInformation_Student]') AND parent_object_id = OBJECT_ID(N'[dbo].[StudiesInformation]'))
ALTER TABLE [dbo].[StudiesInformation]  WITH CHECK ADD  CONSTRAINT [FK_StudiesInformation_Student] FOREIGN KEY([StudentID])
REFERENCES [dbo].[Student] ([StudentID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_StudiesInformation_Student]') AND parent_object_id = OBJECT_ID(N'[dbo].[StudiesInformation]'))
ALTER TABLE [dbo].[StudiesInformation] CHECK CONSTRAINT [FK_StudiesInformation_Student]
GO
/****** Object:  ForeignKey [FK_StudentPlan_Plan]    Script Date: 04/01/2013 10:27:54 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_StudentPlan_Plan]') AND parent_object_id = OBJECT_ID(N'[dbo].[StudentPlan]'))
ALTER TABLE [dbo].[StudentPlan]  WITH CHECK ADD  CONSTRAINT [FK_StudentPlan_Plan] FOREIGN KEY([PlanID])
REFERENCES [dbo].[Plan] ([PlanID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_StudentPlan_Plan]') AND parent_object_id = OBJECT_ID(N'[dbo].[StudentPlan]'))
ALTER TABLE [dbo].[StudentPlan] CHECK CONSTRAINT [FK_StudentPlan_Plan]
GO
/****** Object:  ForeignKey [FK_StudentPlan_Student]    Script Date: 04/01/2013 10:27:54 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_StudentPlan_Student]') AND parent_object_id = OBJECT_ID(N'[dbo].[StudentPlan]'))
ALTER TABLE [dbo].[StudentPlan]  WITH CHECK ADD  CONSTRAINT [FK_StudentPlan_Student] FOREIGN KEY([StudentID])
REFERENCES [dbo].[Student] ([StudentID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_StudentPlan_Student]') AND parent_object_id = OBJECT_ID(N'[dbo].[StudentPlan]'))
ALTER TABLE [dbo].[StudentPlan] CHECK CONSTRAINT [FK_StudentPlan_Student]
GO
/****** Object:  ForeignKey [FK_Student-Course_Course]    Script Date: 04/01/2013 10:27:54 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Student-Course_Course]') AND parent_object_id = OBJECT_ID(N'[dbo].[Student-Course]'))
ALTER TABLE [dbo].[Student-Course]  WITH CHECK ADD  CONSTRAINT [FK_Student-Course_Course] FOREIGN KEY([CourseID])
REFERENCES [dbo].[Course] ([CourseID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Student-Course_Course]') AND parent_object_id = OBJECT_ID(N'[dbo].[Student-Course]'))
ALTER TABLE [dbo].[Student-Course] CHECK CONSTRAINT [FK_Student-Course_Course]
GO
/****** Object:  ForeignKey [FK_Student-Course_Student]    Script Date: 04/01/2013 10:27:54 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Student-Course_Student]') AND parent_object_id = OBJECT_ID(N'[dbo].[Student-Course]'))
ALTER TABLE [dbo].[Student-Course]  WITH CHECK ADD  CONSTRAINT [FK_Student-Course_Student] FOREIGN KEY([StudentID])
REFERENCES [dbo].[Student] ([StudentID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Student-Course_Student]') AND parent_object_id = OBJECT_ID(N'[dbo].[Student-Course]'))
ALTER TABLE [dbo].[Student-Course] CHECK CONSTRAINT [FK_Student-Course_Student]
GO
/****** Object:  ForeignKey [FK_StudentAdditionalData_Student]    Script Date: 04/01/2013 10:27:54 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_StudentAdditionalData_Student]') AND parent_object_id = OBJECT_ID(N'[dbo].[StudentAdditionalData]'))
ALTER TABLE [dbo].[StudentAdditionalData]  WITH CHECK ADD  CONSTRAINT [FK_StudentAdditionalData_Student] FOREIGN KEY([StudentID])
REFERENCES [dbo].[Student] ([StudentID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_StudentAdditionalData_Student]') AND parent_object_id = OBJECT_ID(N'[dbo].[StudentAdditionalData]'))
ALTER TABLE [dbo].[StudentAdditionalData] CHECK CONSTRAINT [FK_StudentAdditionalData_Student]
GO
/****** Object:  ForeignKey [FK_StudentAdditionalData_Type_HowYouKnow]    Script Date: 04/01/2013 10:27:54 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_StudentAdditionalData_Type_HowYouKnow]') AND parent_object_id = OBJECT_ID(N'[dbo].[StudentAdditionalData]'))
ALTER TABLE [dbo].[StudentAdditionalData]  WITH CHECK ADD  CONSTRAINT [FK_StudentAdditionalData_Type_HowYouKnow] FOREIGN KEY([HowYouKnowAboutUsTypeID])
REFERENCES [dbo].[Type] ([TypeID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_StudentAdditionalData_Type_HowYouKnow]') AND parent_object_id = OBJECT_ID(N'[dbo].[StudentAdditionalData]'))
ALTER TABLE [dbo].[StudentAdditionalData] CHECK CONSTRAINT [FK_StudentAdditionalData_Type_HowYouKnow]
GO
/****** Object:  ForeignKey [FK_StudentAdditionalData_Type_WhoPays]    Script Date: 04/01/2013 10:27:54 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_StudentAdditionalData_Type_WhoPays]') AND parent_object_id = OBJECT_ID(N'[dbo].[StudentAdditionalData]'))
ALTER TABLE [dbo].[StudentAdditionalData]  WITH CHECK ADD  CONSTRAINT [FK_StudentAdditionalData_Type_WhoPays] FOREIGN KEY([WhoPaysYourStudiesTypeID])
REFERENCES [dbo].[Type] ([TypeID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_StudentAdditionalData_Type_WhoPays]') AND parent_object_id = OBJECT_ID(N'[dbo].[StudentAdditionalData]'))
ALTER TABLE [dbo].[StudentAdditionalData] CHECK CONSTRAINT [FK_StudentAdditionalData_Type_WhoPays]
GO
/****** Object:  ForeignKey [FK_EnrollmentGroups_Classroom]    Script Date: 04/01/2013 10:27:54 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_EnrollmentGroups_Classroom]') AND parent_object_id = OBJECT_ID(N'[dbo].[EnrollmentGroups]'))
ALTER TABLE [dbo].[EnrollmentGroups]  WITH CHECK ADD  CONSTRAINT [FK_EnrollmentGroups_Classroom] FOREIGN KEY([ClassroomID])
REFERENCES [dbo].[Classroom] ([ClassroomID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_EnrollmentGroups_Classroom]') AND parent_object_id = OBJECT_ID(N'[dbo].[EnrollmentGroups]'))
ALTER TABLE [dbo].[EnrollmentGroups] CHECK CONSTRAINT [FK_EnrollmentGroups_Classroom]
GO
/****** Object:  ForeignKey [FK_EnrollmentGroups_EnrollmentCourse]    Script Date: 04/01/2013 10:27:54 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_EnrollmentGroups_EnrollmentCourse]') AND parent_object_id = OBJECT_ID(N'[dbo].[EnrollmentGroups]'))
ALTER TABLE [dbo].[EnrollmentGroups]  WITH CHECK ADD  CONSTRAINT [FK_EnrollmentGroups_EnrollmentCourse] FOREIGN KEY([EnrollmentCourseID])
REFERENCES [dbo].[EnrollmentCourse] ([EnrollmentCourseID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_EnrollmentGroups_EnrollmentCourse]') AND parent_object_id = OBJECT_ID(N'[dbo].[EnrollmentGroups]'))
ALTER TABLE [dbo].[EnrollmentGroups] CHECK CONSTRAINT [FK_EnrollmentGroups_EnrollmentCourse]
GO
/****** Object:  ForeignKey [FK_EnrollmentGroups_Users]    Script Date: 04/01/2013 10:27:54 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_EnrollmentGroups_Users]') AND parent_object_id = OBJECT_ID(N'[dbo].[EnrollmentGroups]'))
ALTER TABLE [dbo].[EnrollmentGroups]  WITH CHECK ADD  CONSTRAINT [FK_EnrollmentGroups_Users] FOREIGN KEY([ProfessorID])
REFERENCES [dbo].[Users] ([UserId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_EnrollmentGroups_Users]') AND parent_object_id = OBJECT_ID(N'[dbo].[EnrollmentGroups]'))
ALTER TABLE [dbo].[EnrollmentGroups] CHECK CONSTRAINT [FK_EnrollmentGroups_Users]
GO
/****** Object:  ForeignKey [FK_EnrollmentGroupSchedule_EnrollmentGroups]    Script Date: 04/01/2013 10:27:55 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_EnrollmentGroupSchedule_EnrollmentGroups]') AND parent_object_id = OBJECT_ID(N'[dbo].[EnrollmentGroupSchedule]'))
ALTER TABLE [dbo].[EnrollmentGroupSchedule]  WITH CHECK ADD  CONSTRAINT [FK_EnrollmentGroupSchedule_EnrollmentGroups] FOREIGN KEY([EnrollmentGroupID])
REFERENCES [dbo].[EnrollmentGroups] ([EnrollmentGroupID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_EnrollmentGroupSchedule_EnrollmentGroups]') AND parent_object_id = OBJECT_ID(N'[dbo].[EnrollmentGroupSchedule]'))
ALTER TABLE [dbo].[EnrollmentGroupSchedule] CHECK CONSTRAINT [FK_EnrollmentGroupSchedule_EnrollmentGroups]
GO
