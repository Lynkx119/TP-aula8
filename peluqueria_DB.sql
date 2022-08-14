create database peluqueriadb;
use peluqueriadb;

CREATE TABLE dueno (
    DNI INT NOT NULL,
    Nombre VARCHAR(50),
    Telefono BIGINT,
    Direccion VARCHAR(50),
    CONSTRAINT pk_cdni PRIMARY KEY (DNI)
);

CREATE TABLE perro (
    ID_Perro INT NOT NULL,
    Nombre VARCHAR(50),
    Fecha_nac DATE,
    Sexo VARCHAR(50),
    DNI_dueno INT,
    CONSTRAINT pk_cp PRIMARY KEY (ID_Perro),
    CONSTRAINT fk_fdueno FOREIGN KEY (DNI_dueno)
        REFERENCES dueno (DNI)
);

CREATE TABLE historial (
    ID_Historial INT NOT NULL,
    Fecha DATE,
    Perro INT,
    Descripcion VARCHAR(50),
    Monto DOUBLE,
    CONSTRAINT pk_ch PRIMARY KEY (ID_Historial),
    CONSTRAINT fk_cperro FOREIGN KEY (Perro)
        REFERENCES perro (ID_Perro)
);

insert into dueno values(11222333,"Juan",2364112233,"Sanabria 1000");
insert into perro values(1,"Firulais",01/01/2001,"Macho",11222333);
insert into historial values(1,01/01/2021,1,"Corte de pelo",1000.00);
    
SELECT 
    *
FROM
    historial
WHERE
    Fecha >= 01 / 01 / 2022;

DELETE FROM historial 
WHERE
    Fecha <= 01 / 01 / 2022;
