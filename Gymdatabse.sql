create database GYM
drop table Usuarios
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
USU_Sexo  varchar (25),
USU_Correo varchar (25),
USU_Estado int ,
USU_FechaUltimoPago varchar (25),
USU_FechaAlta varchar (25),
USU_UrlImage varchar (250),
USU_Perfil int default 1,
USU_Password varchar(25),

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
PROF_UrlImage varchar (250),
USU_Perfil int

CONSTRAINT PK_PROFESORES PRIMARY KEY (PROF_Dni),
constraint FK_PROFESORES_ESTADOS FOREIGN KEY (PROF_Estado) references Estados(EST_Codigo)

)


create TABLE Turnos 
(
Tur_Dni varchar(25),
Tur_Fecha_solicitada varchar(25) ,
Tur_Fecha_de_solicitud varchar(25) ,
Turn_Estado int,
Turn_Profesor_confirma varchar(25),

)