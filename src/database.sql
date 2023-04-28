CREATE DATABASE Gimnasio;

CREATE TABLE Cliente(
  NoIdentificacion VARCHAR(11) PRIMARY KEY,
  Nombres VARCHAR(50) NOT NULL,
  Apellidos VARCHAR(50) NOT NULL,
  Edad SMALLINT NOT NULL,
  IdSuscripcion INTEGER,
  FOREIGN KEY(IdSuscripcion) REFERENCES Suscripcion(IdSuscripcion)
);

CREATE TABLE Instructor(
  NoIdentificacion VARCHAR(11) PRIMARY KEY,
  Sueldo DOUBLE PRECISION NOT NULL,
  Nombres VARCHAR(50) NOT NULL,
  Apellidos VARCHAR(50) NOT NULL
);

CREATE TABLE Suscripcion(
  IdSuscripcion INTEGER PRIMARY KEY,
  Estado VARCHAR(20) CHECK (Estado = 'Activo' AND Estado = 'Inactivo') NOT NULL,
  Precio DOUBLE PRECISION NOT NULL,
  IdTipoSuscripcion SMALLINT,
  FOREIGN KEY(IdTipoSuscripcion) REFERENCES TipoSuscripcion(IdTipoSuscripcion)
);

CREATE TABLE TipoSuscripcion(
  IdTipoSuscripcion SMALLINT CHECK (IdTipoSuscripcion >= 1 AND IdTipoSuscripcion <= 4) 
  PRIMARY KEY,
  Tipo VARCHAR(20) 
  CHECK(Tipo = 'Mensual' OR Tipo = 'Trimestral' OR Tipo = 'Semestral' OR Tipo = 'Anual')
  NOT NULL
);

CREATE TABLE Acudiente(
  NoIdentificacion VARCHAR(11),
  Nombres VARCHAR(50) NOT NULL,
  Apellidos VARCHAR(50) NOT NULL,
  Telefono VARCHAR(11) UNIQUE NOT NULL,
  Parentesco VARCHAR(25) NOT NULL,
  PRIMARY KEY(NoIdentificacion, Nombres),
  FOREIGN KEY(NoIdentificacion) REFERENCES Cliente(NoIdentificacion)
);

CREATE TABLE Cliente_Instructor(
  NoIdentificacion VARCHAR(11),
  NoIdentificacion_Ins VARCHAR(11),
  Tiempo INTEGER,
  FOREIGN KEY(NoIdentificacion) REFERENCES Cliente(NoIdentificacion),
  FOREIGN KEY(NoIdentificacion_Ins) REFERENCES Instructor(NoIdentificacion_Ins),
  PRIMARY KEY(NoIdentificacion, NoIdentificacion_Ins)
);