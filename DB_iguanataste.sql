CREATE DATABASE IF NOT EXISTS DB_iguanataste;
USE DB_iguanataste;

CREATE TABLE usuario(
usuarioID		int(255) auto
increment not null,
NombreUsuario varchar(50),
Password text,
Remember_token int, 
RolID int,
CONSTRAINT pk_users PRIMARY KEY(usuarioID))

CREATE TABLE persona(
personaID int, 
UsuarioID int, 
Nombres	varchar(200), 
ApellidoPat varchar(100),
ApellidoMat varchar(100),
Telefono varchar(20),
FechaNacimiento datetime,
sexo 			  int,
paisID 			  int,
foto text, 
tipoDoc_id int,
NumeroDocId varchar (30),
CONSTRAINT pk_persona PRIMARY KEY(personaID),
CONSTRAINT fk_persona_usuario FOREIGN KEY(UsuarioID) REFERENCES users(usuarioID)
)ENGINE=InnoDb;


CREATE TABLE Direccion(
direccionID		int(255) auto
increment not null,
personaID int,
TablaCodigoID int,
valor varchar(250))

CREATE TABLE capacidades(
capacID		int(255) auto
increment not null,
menuID int,
nombreCapac varchar(100)
)

CREATE TABLE Menu(
MenuID		int(255) auto
increment not null,
titulo varchar(50),
tituloslug varchar(75),
padreMenuID int,
tipoMenu int)


CREATE TABLE tablacodigo(
codigo_id int(255) auto_increment not null,
referencia varchar(50),
valor text,
CONSTRAINT pk_users PRIMARY KEY(codigo_id)
)ENGINE=InnoDb;

create table mm_accesoRol(
rollID int(255) auto_increment not null, 
capacidadID int, 
constraint pk_accesorol PRIMARY KEY(rollID)
)


CREATE TABLE rating(
contenidoID int(255) auto_increment not null,
usuario int,
rating_object text,
proRate decimal(5,2)
like int, 
commentID int,
CONSTRAINT pk_contenido PRIMARY KEY(contenidoID)
)ENGINE=InnoDb;

CREATE TABLE dpago(
dpagoID int(255) auto_increment not null,
cpagoID int,
monto decimal(11, 2),
concepto varchar(250),
monedaID int, 
CONSTRAINT pk_dpago PRIMARY KEY(dpagoID)
)ENGINE=InnoDb;

CREATE TABLE cpago(
cpagoID int(255) auto_increment not null,
pasarelaID int,
contenidoID int, 
ReservaID int, 
total decimal(11,2),
fechapago datetime,
estado int, 
CONSTRAINT pk_cpago PRIMARY KEY(cpagoID)
)ENGINE=InnoDb;




CREATE TABLE metadefinicion(
metadef_id int(255) auto_increment not null,
tablacodigo_id int,
llave varchar(250),
CONSTRAINT pk_users PRIMARY KEY(metadef_id)
)ENGINE=InnoDb;



CREATE TABLE mm_metacampos(
metadefid int(255) auto_increment not null,
contenidoid int,
valor text,
CONSTRAINT pk_users PRIMARY KEY(metadefid)
)ENGINE=InnoDb;

CREATE TABLE contenido(
contenido_id int(255) auto_increment not null,
titulo varchar(250),
titulo_slug varchar(250),
resumen text,
cuerpo text,
tipo int,
estado int,
autor int,
fecha_creacion datetime,
fecha_modificacion datetime,
CONSTRAINT pk_users PRIMARY KEY(contenidoid)
)ENGINE=InnoDb;

CREATE TABLE reserva(
ReservaID int(255) auto_increment not null,
contenidoID int,
usuarioID int,
fechareserva datetime,
fechaoperacion datetime,
pagoID int,
CONSTRAINT pk_reserva PRIMARY KEY(ReservaID)
)ENGINE=InnoDb;



CREATE TABLE tpconfig(
tpconfigID int(255) auto_increment not null,
metadefID int,
tpllave varchar(100),
tpvalor text, 
CONSTRAINT pk_tpconfig PRIMARY KEY(tpconfigID)
)ENGINE=InnoDb;


CREATE TABLE taxonomias(
taxo_id int(255) auto_increment not null,
metaf_id int,
valor varchar(100),
valor_slug varchar(100),
padretaxo_id varchar(100),
CONSTRAINT pk_users PRIMARY KEY(taxo_id)
)ENGINE=InnoDb;

CREATE TABLE mm_clasificacion(
contenido_id int(255) auto_increment not null,
textoid int, 
CONSTRAINT pk_users PRIMARY KEY(contenido_id)
)ENGINE=InnoDb;


