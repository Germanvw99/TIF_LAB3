create database GYM

use GYM

create table Estados
(
EST_Codigo int,
EST_Descripcion varchar(25)

constraint PK_ESTADOS PRIMARY KEY (EST_Codigo)
)

create TABLE Usuarios
(
USU_Dni varchar(10),
USU_Nombre varchar(25),
USU_Apellido varchar (25),
USU_Telefono varchar (25),
USU_Nacimiento varchar (25),
USU_Sexo  varchar (1),
USU_Correo varchar (25),
USU_Estado int ,
USU_FechaUltimoPago DATE ,
USU_FechaAlta DATE ,

CONSTRAINT PK_USUARIOS PRIMARY KEY (USU_Dni),
CONSTRAINT FK_USUARIO_ESTADOS FOREIGN KEY (USU_Estado) references Estados(EST_Codigo)

)

create TABLE Profesores
(
PROF_Dni varchar(10),
PROF_Nombre varchar(25),
PROF_Apellido varchar (25),
PROF_Telefono varchar (25),
PROF_Nacimiento varchar (25),
PROF_Sexo  varchar (1),
PROF_Correo varchar (25),
PROF_Estado int ,
PROF_FechaAlta DATE ,

CONSTRAINT PK_PROFESORES PRIMARY KEY (PROF_Dni),
constraint FK_PROFESORES_ESTADOS FOREIGN KEY (PROF_Estado) references Estados(EST_Codigo)

)