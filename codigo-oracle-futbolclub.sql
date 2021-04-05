--CREAR UN USUARIO NUEVO

--create user FUTBOLCLUB identified by FUTBOLCLUB;
--grant connect, resource to FUTBOLCLUB;
--conn FUTBOLCLUB/FUTBOLCLUB;


--crear las tablas de menor relaciones a las de mayor relaciones

CREATE TABLE CONTINENTES (
  ID_CONTINENTE NUMBER(3) not null,
  NOMBRE_CONTINENTE VARCHAR2(45) not null,
  constraint CONT_PK_IDCONT primary key (ID_CONTINENTE)
);

CREATE TABLE TRABAJOS (
  ID_TRABAJO NUMBER(3) not null,
  NOMBRE_TRABAJO VARCHAR2(45) not null,
  constraint TRA_PK_IDTRA primary key (ID_TRABAJO)
);

CREATE TABLE PAISES (
  ID_PAIS NUMBER(4) not null,
  NOMBRE_PAIS VARCHAR2(45) not null,
  CONTINENTES_ID_CONTINENTE NUMBER(3) not null,
  constraint PAIS_PK_IDPAS primary key (ID_PAIS)
);

CREATE TABLE UBICACIONES (
  ID_UBICACION NUMBER(11) not null,
  CIUDAD VARCHAR2(45) not null,
  CODIGO_POSTAL VARCHAR2(45) not null,
  DIRECCION VARCHAR2(45) not null,
  ESTADO_PROVINCIA VARCHAR2(45) not null,
  PAISES_ID_PAIS NUMBER(4) not null,
  constraint UB_PK_IDUBI primary key (ID_UBICACION)
);

CREATE TABLE CLUBES (
  ID_CLUB NUMBER(11) not null,
  NOMBRE_CLUB VARCHAR2(45) not null,
  UBICACIONES_ID_UBICACION NUMBER(11) not null,
  constraint CLUB_PK_IDCLUB primary key (ID_CLUB)
);

CREATE TABLE EMPLEADOS (
  ID_EMPLEADO NUMBER(11) not null,
  NOMBRE_EMPLEADO VARCHAR2(45) not null,
  TELEFONO_EMPLEADO VARCHAR2(45) not null,
  EMAIL_EMPLEADO VARCHAR2(45) not null,
  FECHA_EMPLEADO DATE not null,
  SALARIO_EMPLEADO NUMBER(12,2) not null,
  CLUBES_ID_CLUB NUMBER(11) not null,
  TRABAJOS_ID_TRABAJO NUMBER(11) not null,
  JEFE_ID_EMPLEADO NUMBER(11),
  constraint EMP_PK_IDEMP primary key (ID_EMPLEADO)
);

CREATE TABLE HISTORIAL_TRABAJOS (
  ID_HISTORIAL_TRABAJO NUMBER(11) not null,
  FECHA_INICIO DATE not null,
  FECHA_FIN DATE not null,
  TRABAJOS_ID_TRABAJO NUMBER(11) not null,
  EMPLEADOS_ID_EMPLEADO NUMBER(11) not null,
  CLUBES_ID_CLUB NUMBER(11) not null,
  constraint HITRA_PK_IDHT primary key (ID_HISTORIAL_TRABAJO)
);

--LLAVES FORANEAS

alter table PAISES add(
	constraint PAIS_FK_IDCONT foreign key (CONTINENTES_ID_CONTINENTE) references CONTINENTES(ID_CONTINENTE)
);

alter table UBICACIONES add(
	constraint UBI_FK_IDPAIS foreign key (PAISES_ID_PAIS) references PAISES(ID_PAIS)
);

alter table CLUBES add(
	constraint CLUB_FK_IDUBI foreign key (UBICACIONES_ID_UBICACION) references UBICACIONES(ID_UBICACION)
);

alter table EMPLEADOS add(
	constraint EMP_FK_IDCLB foreign key (CLUBES_ID_CLUB) references CLUBES(ID_CLUB),
	constraint EMP_FK_IDTRA foreign key (TRABAJOS_ID_TRABAJO) references TRABAJOS(ID_TRABAJO),
	constraint EMP_FK_IDEMP foreign key (JEFE_ID_EMPLEADO) references EMPLEADOS(ID_EMPLEADO)
);

alter table HISTORIAL_TRABAJOS add(
	constraint HIT_FK_IDTRA foreign key (TRABAJOS_ID_TRABAJO) references TRABAJOS(ID_TRABAJO),
	constraint HIT_FK_IDEMP foreign key (EMPLEADOS_ID_EMPLEADO) references EMPLEADOS(ID_EMPLEADO),
	constraint HIT_FK_IDCLB foreign key (CLUBES_ID_CLUB) references CLUBES(ID_CLUB)
);

/*drop table CONTINENTES cascade constraints;
drop table TRABAJOS cascade constraints;
drop table PAISES cascade constraints;
drop table UBICACIONES cascade constraints;
drop table CLUBES cascade constraints;
drop table EMPLEADOS cascade constraints;
drop table HISTORIAL_TRABAJOS cascade constraints;*/

/* ******************************************************* */

INSERT INTO CONTINENTES VALUES (1, 'AMERICA');
INSERT INTO CONTINENTES VALUES (2, 'EUROPA');

INSERT INTO PAISES VALUES (1, 'Colombia', 1);
INSERT INTO PAISES VALUES (2, 'Argentina', 1);
INSERT INTO PAISES VALUES (3, 'Brasil', 1);
INSERT INTO PAISES VALUES (4, 'Uruguay', 1);
INSERT INTO PAISES VALUES (5, 'Chile', 1);
INSERT INTO PAISES VALUES (6, 'Peru', 1);
INSERT INTO PAISES VALUES (7, 'Portugal', 2);
INSERT INTO PAISES VALUES (8, 'España', 2);
INSERT INTO PAISES VALUES (9, 'Francia', 2);
INSERT INTO PAISES VALUES (10, 'Italia', 2);
INSERT INTO PAISES VALUES (11, 'Alemania', 2);
INSERT INTO PAISES VALUES (12, 'Reino Unido', 2);


INSERT INTO UBICACIONES VALUES (1, 'Madrid', '28001', 'calle 10', 'Madrid', 8);
INSERT INTO UBICACIONES VALUES (2, 'Barcelona', '08001', 'Carrera 5', 'Catalunia', 8);
INSERT INTO UBICACIONES VALUES (3, 'Londres', '10097', 'Transv 5', 'Londres', 12);
INSERT INTO UBICACIONES VALUES (4, 'Paris', '98776', 'calle 5 - 1-2', 'Paris', 9);
INSERT INTO UBICACIONES VALUES (5, 'Turin', '987005', 'carrera 5', 'Turin', 10);
INSERT INTO UBICACIONES VALUES (6, 'Manchester', '98706', 'calle manchester united', 'Manchester', 12);
INSERT INTO UBICACIONES VALUES (7, 'Munich', '98543', 'Calle Arena', 'Munich', 11);
INSERT INTO UBICACIONES VALUES (8, 'Buenos Aires', '98544', 'Calle de Boca', 'Buenos Aires', 2);
INSERT INTO UBICACIONES VALUES (9, 'Buenos Aires', '98545', 'Calle de River', 'Buenos Aires', 2);
INSERT INTO UBICACIONES VALUES (10, 'Medellin', '98546', 'Calle Atanasio', 'Medellin', 1);
INSERT INTO UBICACIONES VALUES (11, 'Cali', '98547', 'Calle pascual', 'Cali', 1);
INSERT INTO UBICACIONES VALUES (12, 'Bogota', '98548', 'Calle Campin', 'Bogota', 1);
INSERT INTO UBICACIONES VALUES (13, 'Sao Paulo', '98549', 'Calle Sao Paulo', 'Sao Paulo', 3);
INSERT INTO UBICACIONES VALUES (14, 'Santos', '98550', 'Calle Santos', 'Santos', 3);
INSERT INTO UBICACIONES VALUES (15, 'Rio de Janeiro', '98551', 'Calle Flamengo', 'Rio de Janeiro', 3);
INSERT INTO UBICACIONES VALUES (16, 'Santiago', '98552', 'Calle Colo colo', 'Santiago', 5);



INSERT INTO CLUBES VALUES (1, 'Real Madrid', 1);
INSERT INTO CLUBES VALUES (2, 'FC Barcelona', 2);
INSERT INTO CLUBES VALUES (3, 'Chelsea', 3);
INSERT INTO CLUBES VALUES (4, 'París Saint-Germain Football Club', 4);
INSERT INTO CLUBES VALUES (5, 'Atletico de madrid', 1);
INSERT INTO CLUBES VALUES (6, 'Juventus', 5);
INSERT INTO CLUBES VALUES (7, 'Tottenham', 3);
INSERT INTO CLUBES VALUES (8, 'Manchester United', 6);
INSERT INTO CLUBES VALUES (9, 'Manchester City', 6);
INSERT INTO CLUBES VALUES (10, 'Bayern de Munich', 7);
INSERT INTO CLUBES VALUES (11, 'Boca Juniors', 8);
INSERT INTO CLUBES VALUES (12, 'River Plate', 9);
INSERT INTO CLUBES VALUES (13, 'Atletico Nacional', 10);
INSERT INTO CLUBES VALUES (14, 'America de Cali', 11);
INSERT INTO CLUBES VALUES (15, 'Santafe', 12);
INSERT INTO CLUBES VALUES (16, 'Sao Paulo', 13);
INSERT INTO CLUBES VALUES (17, 'Santos', 14);
INSERT INTO CLUBES VALUES (18, 'Flamengo', 15);
INSERT INTO CLUBES VALUES (19, 'Colo Colo', 16);
INSERT INTO CLUBES VALUES (20, 'Millonarios', 12);
INSERT INTO CLUBES VALUES (21, 'Deportivo Independiente Medellin', 10);


INSERT INTO TRABAJOS VALUES (1, 'Jugadores');
INSERT INTO TRABAJOS VALUES (2, 'Entrenadores');
INSERT INTO TRABAJOS VALUES (3, 'Directores Deportivos');
INSERT INTO TRABAJOS VALUES (4, 'Entdor porteros');
INSERT INTO TRABAJOS VALUES (5, 'fisioterapeutas');
INSERT INTO TRABAJOS VALUES (6, 'Nutricionistas');
INSERT INTO TRABAJOS VALUES (7, 'Preparador fisico');
INSERT INTO TRABAJOS VALUES (8, 'Representantes');
INSERT INTO TRABAJOS VALUES (9, 'Marketing');
INSERT INTO TRABAJOS VALUES (10, 'Presidente');


INSERT INTO EMPLEADOS VALUES (1, 'Josep Maria Bartomeu', '7005640', 'bartomeu@fcbarca.com', TO_DATE('2015-07-18', 'YYYY-MM-DD'), 150000, 2, 10, NULL);
INSERT INTO EMPLEADOS VALUES (2, 'Florentino Pérez', '7005661', 'florentino@rmadrid.com', TO_DATE('2010-04-15', 'YYYY-MM-DD'), 150000, 1, 10, NULL);
INSERT INTO EMPLEADOS VALUES (3, 'Enrique Setién Solar', '7005644', 'setien@fcbarca.com', TO_DATE('2020-01-13', 'YYYY-MM-DD'), 70000, 2, 2, 1);
INSERT INTO EMPLEADOS VALUES (4, 'Zidane', '7005646', 'zidane@rmadrid.com', TO_DATE('2019-01-15', 'YYYY-MM-DD'), 70000, 1, 2, 2);
INSERT INTO EMPLEADOS VALUES (5, 'Lionel Andrés Messi Cuccittini', '7005645', 'messi@fcbarca.com', TO_DATE('2004-10-16', 'YYYY-MM-DD'), 100000.00, 2, 1, 3);
INSERT INTO EMPLEADOS VALUES (6, 'Antoine GRIEZMANN', '7005665', 'antoine@barca.com', TO_DATE('2019-07-20', 'YYYY-MM-DD'), 80000.00, 2, 1, 3);
INSERT INTO EMPLEADOS VALUES (7, 'Jordi Alba', '7005630', 'alba@barca.com', TO_DATE('2012-06-20', 'YYYY-MM-DD'), 50000.00, 2, 1, 3);
INSERT INTO EMPLEADOS VALUES (8, 'Frenkie de Jong', '7005632', 'frankie@barca.com', TO_DATE('2019-08-20', 'YYYY-MM-DD'), 70000.00, 2, 1, 3);
INSERT INTO EMPLEADOS VALUES (9, 'Eden Hazard', '7005662', 'hazard@rmadrid.com', TO_DATE('2019-06-17', 'YYYY-MM-DD'), 80000.00, 1, 1, 4);
INSERT INTO EMPLEADOS VALUES (10, 'Sergio Ramos', '7005663', 'ramos@rmadrid.com', TO_DATE('2005-06-20', 'YYYY-MM-DD'), 70000.00, 1, 1, 4);
INSERT INTO EMPLEADOS VALUES (11, 'Thibaut Courtois', '7005635', 'courtois@rmadrid.com', TO_DATE('2018-07-15', 'YYYY-MM-DD'), 50000.00, 1, 1, 4);
INSERT INTO EMPLEADOS VALUES (12, 'Federico Valverde', '7005670', 'valverde@rmadrid.com', TO_DATE('2018-07-15', 'YYYY-MM-DD'), 70000.00, 1, 1, 4);
INSERT INTO EMPLEADOS VALUES (13, 'Enrique Cerezo', '7005647', 'cerezo@amadrid.com', TO_DATE('2003-04-14', 'YYYY-MM-DD'), 70000.00, 5, 10, NULL);
INSERT INTO EMPLEADOS VALUES (14, 'Andrea Agnelli', '7005648', 'andrea@juventus.com', TO_DATE('2010-06-15', 'YYYY-MM-DD'), 80000.00, 6, 10, NULL);
INSERT INTO EMPLEADOS VALUES (15, 'Nasser Al-Khelaifi', '7005649', 'nasser@paris.com', TO_DATE('2011-06-10', 'YYYY-MM-DD'), 150000.00, 4, 10, NULL);
INSERT INTO EMPLEADOS VALUES (16, 'Daniel Levy', '7005655', 'levy@tot.com', TO_DATE('2001-06-10', 'YYYY-MM-DD'), 120000.00, 7, 10, NULL);
INSERT INTO EMPLEADOS VALUES (17, 'Thomas Tuchel', '7005650', 'tuchel@paris.com', TO_DATE('2018-06-10', 'YYYY-MM-DD'), 70000.00, 4, 2, 15);
INSERT INTO EMPLEADOS VALUES (18, 'Neymar', '7005651', 'neymar@paris.com', TO_DATE('2017-07-10', 'YYYY-MM-DD'), 90000.00, 4, 1, 17);
INSERT INTO EMPLEADOS VALUES (19, 'Kylian Mbappe', '7005652', 'bappe@paris.com', TO_DATE('2018-06-17', 'YYYY-MM-DD'), 70000.00, 4, 1, 17);
INSERT INTO EMPLEADOS VALUES (20, 'Jose Mourinho', '7005656', 'mou@tot.com', TO_DATE('2019-06-24', 'YYYY-MM-DD'), 80000.00, 7, 2, 16);
INSERT INTO EMPLEADOS VALUES (21, 'Delle ALLI', '7005657', 'alli@tot.com', TO_DATE('2015-06-18', 'YYYY-MM-DD'), 70000.00, 7, 1, 20);
INSERT INTO EMPLEADOS VALUES (22, 'Harry Kane', '7005658', 'kane@tot.com', TO_DATE('2011-06-15', 'YYYY-MM-DD'), 70000.00, 7, 1, 20);
INSERT INTO EMPLEADOS VALUES (23, 'Maurizio Sarri', '7005659', 'sarri@juventus.com', TO_DATE('2019-06-17', 'YYYY-MM-DD'), 80000.00, 6, 2, 14);
INSERT INTO EMPLEADOS VALUES (24, 'Cristiano Ronaldo', '7005660', 'ronaldo@juventus.com', TO_DATE('2018-07-30', 'YYYY-MM-DD'), 88000.00, 6, 1, 23);
INSERT INTO EMPLEADOS VALUES (25, 'Paulo Dybala', '7005661', 'dybala@juventus.com', TO_DATE('2015-06-23', 'YYYY-MM-DD'), 85000.00, 6, 1, 23);
INSERT INTO EMPLEADOS VALUES (26, 'Diego Simeone', '7005680', 'simeone@juventus.com', TO_DATE('2011-06-23', 'YYYY-MM-DD'), 80000.00, 5, 2, 13);
INSERT INTO EMPLEADOS VALUES (27, 'Joel Glazer', '7005690', 'glazer@manunited.com', TO_DATE('2005-06-30', 'YYYY-MM-DD'), 150000.00, 8, 10, NULL);
INSERT INTO EMPLEADOS VALUES (28, 'Khaldoon Al Mubarak', '7005691', 'mubarak@city.com', TO_DATE('2010-07-30', 'YYYY-MM-DD'), 200000.00, 9, 10, NULL);
INSERT INTO EMPLEADOS VALUES (29, 'Herbert Hainer', '7005692', 'herbet@munich.com', TO_DATE('2020-01-30', 'YYYY-MM-DD'), 100000.00, 10, 10, NULL);
INSERT INTO EMPLEADOS VALUES (30, 'Ole Gunnar Solskjaer', '7005693', 'ole@manunited.com', TO_DATE('2019-07-30', 'YYYY-MM-DD'), 110000.00, 8, 2, 27);
INSERT INTO EMPLEADOS VALUES (31, 'Pep Guardiola', '7005613', 'pep@city.com', TO_DATE('2016-08-20', 'YYYY-MM-DD'), '130000.00', 9, 2, 28);
INSERT INTO EMPLEADOS VALUES (32, 'Hans-Dieter Flick', '7005694', 'hans@munich.com', TO_DATE('2020-01-01', 'YYYY-MM-DD'), 100000.00, 10, 2, 29);
INSERT INTO EMPLEADOS VALUES (33, 'Paul Pogba', '800001', 'pogba@manunited.com', TO_DATE('2016-07-30', 'YYYY-MM-DD'), 90000.00, 8, 1, 30);
INSERT INTO EMPLEADOS VALUES (34, 'Marcus Rashford', '800002', 'marcus@manunited.com', TO_DATE('2015-07-30', 'YYYY-MM-DD'), 70000.00, 8, 1, 30);
INSERT INTO EMPLEADOS VALUES (35, 'Sergio Aguero', '800003', 'aguero@city.com', TO_DATE('2011-08-01', 'YYYY-MM-DD'), 86000.00, 9, 1, 31);
INSERT INTO EMPLEADOS VALUES (36, 'Kevin De Bruyne', '800004', 'kevin@city.com', TO_DATE('2015-07-10', 'YYYY-MM-DD'), 78000.00, 9, 1, 31);
INSERT INTO EMPLEADOS VALUES (37, 'Thomas Muller', '800005', 'muller@munich.com', TO_DATE('2008-07-15', 'YYYY-MM-DD'), 75000.00, 10, 1, 32);
INSERT INTO EMPLEADOS VALUES (38, 'Robert Lewandowski', '800006', 'robert@munich.com', TO_DATE('2014-07-30', 'YYYY-MM-DD'), 79000.00, 10, 1, 32);
INSERT INTO EMPLEADOS VALUES (39, 'Bruce Buck', '8005650', 'buck@chelsea.com', TO_DATE('1990-01-01', 'YYYY-MM-DD'), 120000.00, 3, 10, NULL);
INSERT INTO EMPLEADOS VALUES (40, 'Frank Lampard', '8005645', 'lampard@chelsea.com', TO_DATE('2019-07-10', 'YYYY-MM-DD'), 100000.00, 3, 2, 39);
INSERT INTO EMPLEADOS VALUES (41, 'Willian Borges da Silva', '8005646', 'willian@chelsea.com', TO_DATE('2013-07-15', 'YYYY-MM-DD'), 70000.00, 3, 1, 40);
INSERT INTO EMPLEADOS VALUES (42, 'César Azpilicueta', '8005647', 'azpi@chelsea.com', TO_DATE('2012-07-15', 'YYYY-MM-DD'), 70000.00, 3, 1, 40);


INSERT INTO HISTORIAL_TRABAJOS VALUES (1, TO_DATE('2009-07-20', 'YYYY-MM-DD'), TO_DATE('2018-07-25', 'YYYY-MM-DD'), 1, 24, 1);
INSERT INTO HISTORIAL_TRABAJOS VALUES (2, TO_DATE('2013-07-15', 'YYYY-MM-DD'), TO_DATE('2017-07-09', 'YYYY-MM-DD'), 1, 18, 2);
INSERT INTO HISTORIAL_TRABAJOS VALUES (3, TO_DATE('2012-07-10', 'YYYY-MM-DD'), TO_DATE('2019-06-15', 'YYYY-MM-DD'), 1, 9, 3);
INSERT INTO HISTORIAL_TRABAJOS VALUES (4, TO_DATE('2014-06-19', 'YYYY-MM-DD'), TO_DATE('2019-07-19', 'YYYY-MM-DD'), 1, 6, 5);
INSERT INTO HISTORIAL_TRABAJOS VALUES (5, TO_DATE('2012-07-10', 'YYYY-MM-DD'), TO_DATE('2016-07-29', 'YYYY-MM-DD'), 1, 33, 6);
