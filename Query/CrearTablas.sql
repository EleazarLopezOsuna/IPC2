/*
Created: 3/09/2018
Modified: 14/10/2018
Model: Microsoft SQL Server 2017
Database: MS SQL Server 2017
*/


-- Create tables section -------------------------------------------------

-- Table Salon

CREATE TABLE [Salon]
(
 [cod_salon] Int IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
 [edificio] Varchar(5) NOT NULL,
 [numero_salon] Int NOT NULL,
 [estado_salon] Varchar(max) NOT NULL
)


-- Add keys for table Salon

ALTER TABLE [Salon] ADD CONSTRAINT [Key1] PRIMARY KEY ([cod_salon])

-- Table Mantenimiento

CREATE TABLE [Mantenimiento]
(
 [cod_mantenimiento] Int IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
 [fecha_inicio_mantenimiento] Date NOT NULL,
 [motivo_mantenimiento] Varchar(max) NOT NULL,
 [observaciones_mantenimiento] Varchar(max) NULL,
 [fecha_fin_mantenimiento] Date NOT NULL,
 [cod_salon] Int NOT NULL
)


-- Add keys for table Mantenimiento

ALTER TABLE [Mantenimiento] ADD CONSTRAINT [Key2] PRIMARY KEY ([cod_mantenimiento],[cod_salon])

-- Table Reservacion

CREATE TABLE [Reservacion]
(
 [cod_reservacion] Int IDENTITY(1,1) NOT NULL,
 [fecha_inicio_reservacion] Date NOT NULL,
 [hora_inicio_reservacion] Time NOT NULL,
 [fecha_fin_reservacion] Date NOT NULL,
 [hora_fin_reservacion] Time NOT NULL,
 [cod_salon] Int NOT NULL,
 [carnet_usuario] Nvarchar(9) NOT NULL,
 [estado_reservacion] Varchar(30) NOT NULL,
 [urlCarta] Varchar(max) NULL,
 [urlQR] Varchar(max) NULL,
 [codigoQR] Varchar(max) NULL
)


-- Add keys for table Reservacion

ALTER TABLE [Reservacion] ADD CONSTRAINT [Key3] PRIMARY KEY ([cod_reservacion],[cod_salon],[carnet_usuario])

-- Table Preguntas

CREATE TABLE [Preguntas]
(
 [pregunta] Varchar(150) NOT NULL,
 [respuesta1] Varchar(150) NOT NULL,
 [respuesta2] Varchar(150) NOT NULL,
 [respuesta3] Varchar(150) NOT NULL,
 [respuesta4] Varchar(150) NOT NULL,
 [respuesta_correcta] Varchar(150) NOT NULL,
 [cod_reservacion] Int NOT NULL,
 [cod_salon] Int NOT NULL,
 [carnet_usuario] Nvarchar(9) NOT NULL
)


-- Add keys for table Preguntas

ALTER TABLE [Preguntas] ADD CONSTRAINT [Key6] PRIMARY KEY ([cod_reservacion],[cod_salon],[carnet_usuario])

-- Table Matriculacion

CREATE TABLE [Matriculacion]
(
 [carnet_usuario] Nvarchar(9) NOT NULL,
 [cod_reservacion] Int NOT NULL,
 [cod_salon] Int NOT NULL,
 [carnet_usuario1] Nvarchar(9) NOT NULL
)


-- Add keys for table Matriculacion

ALTER TABLE [Matriculacion] ADD CONSTRAINT [Key9] PRIMARY KEY ([carnet_usuario],[cod_reservacion],[cod_salon],[carnet_usuario1])

-- Table Usuario

CREATE TABLE [Usuario]
(
 [rol_usuario] Varchar(20) NOT NULL,
 [carnet_usuario] Nvarchar(9) NOT NULL,
 [nombre_usuario] Varchar(100) NOT NULL,
 [nacimiento_usuario] Date NOT NULL,
 [email_usuario] Varchar(60) NOT NULL,
 [telefono_usuario] Nvarchar(8) NOT NULL,
 [usuario_usuario] Varchar(20) NOT NULL,
 [password_usuario] Varchar(50) NOT NULL,
 [palabra_usuario] Varchar(20) NOT NULL
)


-- Add keys for table Usuario

ALTER TABLE [Usuario] ADD CONSTRAINT [Key11] PRIMARY KEY ([carnet_usuario])

-- Table Prestamo

CREATE TABLE [Prestamo]
(
 [cod_prestamo] Int IDENTITY(1,1) NOT NULL,
 [cod_insumo] Varchar(150) NOT NULL,
 [carnet_usuario] Nvarchar(9) NOT NULL
)


-- Add keys for table Prestamo

ALTER TABLE [Prestamo] ADD CONSTRAINT [Key12] PRIMARY KEY ([cod_prestamo],[cod_insumo],[carnet_usuario])

-- Table Insumo

CREATE TABLE [Insumo]
(
 [cod_insumo] Varchar(150) NOT NULL,
 [nombre_insumo] Varchar(max) NOT NULL,
 [tipo_insumo] Varchar(max) NOT NULL,
 [descripcion_insumo] Varchar(250) NULL
)


-- Add keys for table Insumo

ALTER TABLE [Insumo] ADD CONSTRAINT [Key13] PRIMARY KEY ([cod_insumo])

-- Table Incidentes_insumos

CREATE TABLE [Incidentes_insumos]
(
 [cod_incidente] Int IDENTITY(1,1) NOT NULL,
 [estado_incidente] Varchar(max) NOT NULL,
 [descripcion_incidente] Varchar(max) NULL,
 [cod_prestamo] Int NOT NULL,
 [cod_insumo] Varchar(150) NOT NULL,
 [carnet_usuario] Nvarchar(9) NOT NULL
)


-- Add keys for table Incidentes_insumos

ALTER TABLE [Incidentes_insumos] ADD CONSTRAINT [Key14] PRIMARY KEY ([cod_incidente],[cod_prestamo],[cod_insumo],[carnet_usuario])

-- Table Incidentes_salones

CREATE TABLE [Incidentes_salones]
(
 [cod_incidente] Int IDENTITY(1,1) NOT NULL,
 [estado_incidente] Varchar(max) NOT NULL,
 [descripcion_incidente] Varchar(max) NULL,
 [cod_reservacion] Int NOT NULL,
 [cod_salon] Int NOT NULL,
 [carnet_usuario] Nvarchar(9) NOT NULL
)


-- Add keys for table Incidentes_salones

ALTER TABLE [Incidentes_salones] ADD CONSTRAINT [Key15] PRIMARY KEY ([cod_incidente],[cod_reservacion],[cod_salon],[carnet_usuario])

-- Create foreign keys (relationships) section ------------------------------------------------- 


ALTER TABLE [Reservacion] ADD CONSTRAINT [Tiene] FOREIGN KEY ([cod_salon]) REFERENCES [Salon] ([cod_salon]) ON UPDATE NO ACTION ON DELETE NO ACTION



ALTER TABLE [Mantenimiento] ADD CONSTRAINT [Tiene] FOREIGN KEY ([cod_salon]) REFERENCES [Salon] ([cod_salon]) ON UPDATE NO ACTION ON DELETE NO ACTION



ALTER TABLE [Prestamo] ADD CONSTRAINT [añade] FOREIGN KEY ([cod_insumo]) REFERENCES [Insumo] ([cod_insumo]) ON UPDATE NO ACTION ON DELETE NO ACTION



ALTER TABLE [Incidentes_insumos] ADD CONSTRAINT [Genera] FOREIGN KEY ([cod_prestamo], [cod_insumo], [carnet_usuario]) REFERENCES [Prestamo] ([cod_prestamo], [cod_insumo], [carnet_usuario]) ON UPDATE NO ACTION ON DELETE NO ACTION



ALTER TABLE [Incidentes_salones] ADD CONSTRAINT [Relationship3] FOREIGN KEY ([cod_reservacion], [cod_salon], [carnet_usuario]) REFERENCES [Reservacion] ([cod_reservacion], [cod_salon], [carnet_usuario]) ON UPDATE NO ACTION ON DELETE NO ACTION



ALTER TABLE [Reservacion] ADD CONSTRAINT [Relationship6] FOREIGN KEY ([carnet_usuario]) REFERENCES [Usuario] ([carnet_usuario]) ON UPDATE NO ACTION ON DELETE NO ACTION



ALTER TABLE [Matriculacion] ADD CONSTRAINT [Relationship8] FOREIGN KEY ([carnet_usuario]) REFERENCES [Usuario] ([carnet_usuario]) ON UPDATE NO ACTION ON DELETE NO ACTION



ALTER TABLE [Prestamo] ADD CONSTRAINT [Relationship10] FOREIGN KEY ([carnet_usuario]) REFERENCES [Usuario] ([carnet_usuario]) ON UPDATE NO ACTION ON DELETE NO ACTION



ALTER TABLE [Preguntas] ADD CONSTRAINT [Relationship11] FOREIGN KEY ([cod_reservacion], [cod_salon], [carnet_usuario]) REFERENCES [Reservacion] ([cod_reservacion], [cod_salon], [carnet_usuario]) ON UPDATE NO ACTION ON DELETE NO ACTION



ALTER TABLE [Matriculacion] ADD CONSTRAINT [Relationship15] FOREIGN KEY ([cod_reservacion], [cod_salon], [carnet_usuario1]) REFERENCES [Reservacion] ([cod_reservacion], [cod_salon], [carnet_usuario]) ON UPDATE NO ACTION ON DELETE NO ACTION





