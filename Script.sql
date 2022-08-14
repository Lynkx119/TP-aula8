CREATE DATABASE peluqueria_canina;
DROP DATABASE peluqueria_canina;
USE peluqueria_canina;
SET SQL_SAFE_UPDATES = 0;

#Crear tablas (PUNTO 1)

CREATE TABLE dueno (
	dni INT NOT NULL PRIMARY KEY,
    nombre VARCHAR(20) NOT NULL,
    apellido VARCHAR(20) NOT NULL,
    telefono FLOAT NOT NULL,
    direccion VARCHAR(30) NOT NULL
);

CREATE TABLE perro (
	id_perro INT NOT NULL PRIMARY KEY,
    nombre VARCHAR(20) NOT NULL,
    fecha_nac DATE NOT NULL,
    sexo VARCHAR(10) NOT NULL,
    dni_dueno INT NOT NULL,
    FOREIGN KEY(dni_dueno) REFERENCES dueno(dni)
);

CREATE TABLE historial (
	id_historial INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    fecha DATE NOT NULL,
    perroid INT NOT NULL,
    descripcion VARCHAR(30) NOT NULL,
    monto FLOAT NOT NULL,
    FOREIGN KEY(perroid) REFERENCES perro(id_perro)
);
    
#Crear Dueños y perros (PUNTO 2)
INSERT INTO `dueno` VALUES (39704750,'fran','meier',3518011959,'maganiño');
INSERT INTO `dueno` VALUES (33437072,'andrew','meier',3764524518,'angelacuña');
INSERT INTO `perro` VALUES (1,'salchipuedes','2009-12-31','Macho',39704750);
INSERT INTO `perro` VALUES (2,'poroto','2020-11-19','Macho',33437072);
INSERT INTO `perro` VALUES (3,'firulais','1990-02-22','Macho',39704750);
INSERT INTO `perro` VALUES (10,'arveja','2015-01-01','Hembra',39704750);
INSERT INTO `historial` VALUES (1,'2022-08-13',1,'asicalado y tintura',10000);
INSERT INTO `historial` VALUES (2,'2022-08-08',2,'corte y confeccion',4500);
INSERT INTO `historial` VALUES (3,'1994-02-22',3,'correccion de color',10);
INSERT INTO `historial` VALUES (4,'2022-07-13',1,'reflejos',400);
INSERT INTO `historial` VALUES (5,'2022-07-01',1,'cresta',50000);

SELECT * FROM dueno;
SELECT * FROM perro;
SELECT * FROM historial;


#Consulta para perros con atencion anteriores a 2010
SELECT CONCAT(d.nombre,' ',d.apellido) AS 'Dueño', p.nombre, h.descripcion, h.fecha
FROM dueno AS d
INNER JOIN (perro AS p INNER JOIN historial AS h ON p.id_perro=h.perroid)
ON d.dni=p.dni_dueno
WHERE h.fecha < '2010-01-01';

#11
SELECT distinct CONCAT(d.nombre,' ',d.apellido) AS 'Dueño', p.nombre, floor(DATEDIFF(now(),p.fecha_nac)/365) AS 'edad'
FROM dueno AS d
INNER JOIN (perro AS p INNER JOIN historial AS h ON p.id_perro=h.perroid)
ON d.dni=p.dni_dueno
where YEAR(h.fecha)=2022 AND floor(DATEDIFF(now(),p.fecha_nac)/365) < 5;

#12
SELECT nombre
FROM perro
WHERE (YEAR(fecha_nac) BETWEEN 2020 AND 2022) AND sexo='Macho';