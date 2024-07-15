--Database oluþturuldu
create database HastaneRandavuSistemiDb
go

--Oluþturulan database kullanýldý
use HastaneRandavuSistemiDb
go

--Hastalar tablosu oluþturuldu
create table Patient(
Id int primary key identity(1,1) not null,
[Name] nvarchar(50),
Surname nvarchar(50),
Age int,
Gender nvarchar(10),
TcNo nvarchar(11),
DepartmentId int,
IsStatus bit default 1,
IsDelete bit default 0
)

--Doktorlar tablosu oluþturuldu
create table Doctor(
Id int primary key identity(1,1) not null,
[Name] nvarchar(50),
Surname nvarchar(50),
IsStatus bit default 1,
IsDelete bit default 0)

--Departman tablosu oluþturuldu
create table Departmen(
Id int primary key identity(1,1) not null,
[Name] nvarchar(200),
IsStatus bit default 1,
IsDelete bit default 0
)

--DoktorDepartman tablosu oluþturuldu
create table DoctorDepartmen(
Id int primary key identity(1,1) not null,
DepartmentId int,
DoctorId int,
IsStatus bit default 1,
IsDelete bit default 0
)

--Hasta randavu tablosu oluþturuldu
create table PatientAppointment(
Id int primary key identity(1,1) not null,
DepartmentId int,
DoctorId int,
PatientId int,
[Date] date,
[Hour] time,
IsStatus bit default 1,
IsDelete bit default 0
)