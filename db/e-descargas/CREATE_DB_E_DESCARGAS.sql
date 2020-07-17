-- CREACION DE TABLAS

CREATE TABLE Roles
(
	Id INT
		IDENTITY NOT NULL PRIMARY KEY,
	Rol NVARCHAR(255)
		NOT NULL
);


CREATE TABLE Usuarios
(
	Codigo NVARCHAR(255)
		NOT NULL PRIMARY KEY,
	Id_Rol INT
		NULL FOREIGN KEY REFERENCES Roles(Id),
	Usuario NVARCHAR(255)
		NOT NULL UNIQUE,
	Nombre NVARCHAR(255)
		NULL,
	Primer_Apellido NVARCHAR(255)
		NULL,
	Segundo_Apellido NVARCHAR(255)
		NULL,
	Correo NVARCHAR(255)
		NOT NULL,
	Contrasenna NVARCHAR(500)
		NOT NULL,
	Pregunta_Seguridad NVARCHAR(255)
		NOT NULL,
	Respuesta_Seguridad NVARCHAR(255)
		NOT NULL
);

CREATE TABLE Idiomas
(
	Id INT
		IDENTITY NOT NULL PRIMARY KEY,
	Idioma NVARCHAR(255)
		NOT NULL,
);

CREATE TABLE Generos_Peliculas
(
	Id INT
		IDENTITY NOT NULL PRIMARY KEY,
	Genero NVARCHAR(255)
		NOT NULL,
);

CREATE TABLE Peliculas
(
	Codigo NVARCHAR(255)
		NOT NULL PRIMARY KEY,
	Id_Genero INT
		NOT NULL FOREIGN KEY REFERENCES Generos_Peliculas(Id),
	Id_Idioma INT
		NOT NULL FOREIGN KEY REFERENCES Idiomas(Id),
	Nombre NVARCHAR(255)
		NULL,
	Anno INT
		NULL,
	Actores
		NVARCHAR(255)
		NULL,
	Archivo_Descarga
		NVARCHAR(255)
		NOT NULL,
	Archivo_Previsualizacion
		NVARCHAR(255)
		NOT NULL
);

CREATE TABLE Generos_Libros
(
	Id INT
		IDENTITY NOT NULL PRIMARY KEY,
	Genero NVARCHAR(255)
		NOT NULL,
);

CREATE TABLE Libros
(
	Codigo NVARCHAR(255)
		NOT NULL PRIMARY KEY,
	Id_Genero INT
		NULL FOREIGN KEY REFERENCES Generos_Libros(Id),
	Id_Idioma INT
		NULL FOREIGN KEY REFERENCES Idiomas(Id),
	Nombre NVARCHAR(255)
		NULL,
	Anno NVARCHAR(255)
		NULL,
	Autores NVARCHAR(255)
		NULL,
	Editorial NVARCHAR(255)
		NULL,
	Archivo_Descarga NVARCHAR(255)
		NOT NULL,
	Archivo_Previsualizacion NVARCHAR(255)
		NOT NULL
);

CREATE TABLE Generos_Musica
(
	Id INT IDENTITY
		NOT NULL PRIMARY KEY,
	Genero NVARCHAR(255)
		NOT NULL,
);


CREATE TABLE Musica
(
	Codigo NVARCHAR(255)
		NOT NULL PRIMARY KEY,
	Id_Genero INT
		NULL FOREIGN KEY REFERENCES Generos_Musica(Id),
	Id_Idioma INT
		NULL FOREIGN KEY REFERENCES Idiomas(Id),
	Nombre NVARCHAR(255)
		NULL,
	Anno NVARCHAR(255)
		NULL,
	Tipo_Interpretacion NVARCHAR(255)
		NULL,
	Pais NVARCHAR(255)
		NULL,
	Disquera NVARCHAR(255)
		NULL,
	Disco NVARCHAR(255)
		NULL,
	Compositor NVARCHAR(255)
		NULL,
	Archivo_Descarga NVARCHAR(255)
		NOT NULL,
	Archivo_Previsualizacion NVARCHAR(255)
		NOT NULL
);

CREATE TABLE Bitacora
(
	Id INT IDENTITY
		NOT NULL PRIMARY KEY,
	Codigo_Usuario NVARCHAR(255)
		NULL FOREIGN KEY REFERENCES Usuarios(Codigo),
	Codigo_Registro NVARCHAR(255)
		NOT NULL,
	Tipo NVARCHAR(255)
		NOT NULL,
	Descripcion NVARCHAR(500)
		NOT NULL,
	Detalle_Registro NVARCHAR(1000)
		NOT NULL,
	Fecha NVARCHAR(255)
		NOT NULL
);

CREATE TABLE Transacciones
(
	Codigo NVARCHAR(255)
		NOT NULL PRIMARY KEY,
	Tipo_Pago NVARCHAR(255)
		NOT NULL,
	Monto NVARCHAR(255)
		NOT NULL,
	Fecha NVARCHAR(255)
		NOT NULL
);

CREATE TABLE Descargas
(
	Id INT
		IDENTITY NOT NULL PRIMARY KEY,
	Genero NVARCHAR(255)
		NOT NULL,
	Tipo NVARCHAR(255)
		NOT NULL,
	Codigo_Referencia NVARCHAR(255)
		NOT NULL,
	Fecha NVARCHAR(255)
		NOT NULL
);

CREATE TABLE Errores
(
	Id INT
		IDENTITY NOT NULL PRIMARY KEY,
	Mensaje NVARCHAR(255)
		NOT NULL,
	Descripcion NVARCHAR(1000)
		NOT NULL,
	Codigo_Error NVARCHAR(30)
		NOT NULL,
	Fecha NVARCHAR(255)
		NOT NULL
);

CREATE TABLE Tarjetas
(
	Id INT
		IDENTITY NOT NULL PRIMARY KEY,
	Codigo_Usuario NVARCHAR(255)
		NOT NULL FOREIGN KEY REFERENCES Usuarios(Codigo),
	Numero NVARCHAR(255)
		NOT NULL UNIQUE,
	CVV INT
		NOT NULL,
	Tipo NVARCHAR(20)
		NOT NULL,
	Mes_Expiracion NVARCHAR(255)
		NOT NULL,
	Anno_Expiracion NVARCHAR(255)
		NOT NULL,
);

CREATE TABLE EasyPay
(
	Id INT
		IDENTITY NOT NULL PRIMARY KEY,
	Codigo_Usuario NVARCHAR(255)
		NOT NULL FOREIGN KEY REFERENCES Usuarios(Codigo),
	Numero_Cuenta NVARCHAR(500)
		NOT NULL,
	Codigo_Seguridad INT
		NOT NULL,
	Contrasenna NVARCHAR(500)
		NOT NULL
);

CREATE TABLE Parametros
(
	Id INT
		IDENTITY NOT NULL PRIMARY KEY,
	Codigo NVARCHAR(100)
		NOT NULL,
	Descripcion NVARCHAR(255)
		NULL,
	Valor NVARCHAR(1000)
		NOT NULL
);

CREATE TABLE Consecutivos
(
	Id INT
		IDENTITY NOT NULL PRIMARY KEY,
	Descripcion NVARCHAR(255)
		NULL,
	Consecutivo NVARCHAR(255)
		NOT NULL,
	Posee_Prefijo NVARCHAR(255)
		NOT NULL,
	Prefijo NVARCHAR(255)
		NULL,
	Rango_Inicio NVARCHAR(255)
		NOT NULL,
	Rango_Final NVARCHAR(255)
		NOT NULL
);