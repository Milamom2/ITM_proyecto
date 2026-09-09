CREATE TABLE Tipo(
    Id SERIAL PRIMARY KEY,
    Tipo VARCHAR(100) NOT NULL
);

CREATE UNIQUE INDEX ixTipo
    ON Tipo(Tipo);

CREATE TABLE Calendario(
    Id SERIAL PRIMARY KEY,
    Fecha DATE NOT NULL,
    IdTipo INT NOT NULL,
    CONSTRAINT fkCalendario_Tipo
        FOREIGN KEY (IdTipo) REFERENCES Tipo(Id),
    Descripcion VARCHAR(100) NULL
);

CREATE UNIQUE INDEX ixCalendario
    ON Calendario(Fecha);