-- PLSQL - ORACLE DATABASE
-- ****************** ELIMINACION DE TABLAS *****************
DROP TABLE CARGO CASCADE CONSTRAINTS;
DROP TABLE UNIDAD CASCADE CONSTRAINTS;
DROP TABLE ESPECIALIDAD CASCADE CONSTRAINTS;
DROP TABLE SALUD CASCADE CONSTRAINTS;
DROP TABLE TIPO_SALUD CASCADE CONSTRAINTS;
DROP TABLE MEDICO CASCADE CONSTRAINTS;
DROP TABLE ESPECIALIDAD_MEDICO CASCADE CONSTRAINTS;
DROP TABLE PACIENTE CASCADE CONSTRAINTS;
DROP TABLE ATENCION CASCADE CONSTRAINTS;
DROP TABLE PAGO_ATENCION CASCADE CONSTRAINTS;
DROP TABLE PORC_DESCTO_3RA_EDAD CASCADE CONSTRAINTS;
DROP TABLE INFO_MEDICO CASCADE CONSTRAINTS;
DROP TABLE TRAMO_ASIG_ATMED CASCADE CONSTRAINTS;

-- ****************** CREACION DE TABLAS *****************
CREATE TABLE UNIDAD
(
    uni_id      NUMBER(4)    NOT NULL,
    nombre      VARCHAR2(40) NOT NULL,
    jefe_unidad NUMBER(8)    NOT NULL
);
ALTER TABLE UNIDAD
    ADD CONSTRAINT PK_UNIDAD PRIMARY KEY (uni_id);

CREATE TABLE CARGO
(
    car_id NUMBER(3)    NOT NULL,
    nombre VARCHAR2(30) NOT NULL
);
ALTER TABLE CARGO
    ADD CONSTRAINT PK_CARGO PRIMARY KEY (car_id);

CREATE TABLE ESPECIALIDAD
(
    esp_id NUMBER(4)    NOT NULL,
    nombre VARCHAR2(40) NOT NULL
);
ALTER TABLE ESPECIALIDAD
    ADD CONSTRAINT PK_ESPECIALIDAD PRIMARY KEY (esp_id);

CREATE TABLE SALUD
(
    sal_id      NUMBER(3)     NOT NULL,
    descripcion VARCHAR2(100) NOT NULL,
    costo_pago  NUMBER(3)     NOT NULL,
    tipo_sal_id VARCHAR2(3)   NOT NULL
);
ALTER TABLE SALUD
    ADD CONSTRAINT PK_SALUD PRIMARY KEY (sal_id);


CREATE TABLE TIPO_SALUD
(
    tipo_sal_id VARCHAR2(3)   NOT NULL,
    descripcion VARCHAR2(100) NOT NULL
);
ALTER TABLE TIPO_SALUD
    ADD CONSTRAINT PK_TIPO_SALUD PRIMARY KEY (tipo_sal_id);

CREATE TABLE MEDICO
(
    med_run        NUMBER(8)    NOT NULL,
    dv_run         VARCHAR(1)   NOT NULL,
    pnombre        VARCHAR2(15) NOT NULL,
    snombre        VARCHAR2(15) NOT NULL,
    apaterno       VARCHAR2(15) NOT NULL,
    amaterno       VARCHAR2(15) NOT NULL,
    telefono       NUMBER(11)   NOT NULL,
    sueldo_base    NUMBER(8)    NOT NULL,
    fecha_contrato DATE         NOT NULL,
    uni_id         NUMBER(4),
    car_id         NUMBER(3)    NOT NULL
);
ALTER TABLE MEDICO
    ADD CONSTRAINT PK_MEDICO PRIMARY KEY (med_run);

CREATE TABLE ESPECIALIDAD_MEDICO
(
    med_run       NUMBER(8) NOT NULL,
    esp_id        NUMBER(4) NOT NULL,
    fec_ini_espec DATE      NOT NULL
);
ALTER TABLE ESPECIALIDAD_MEDICO
    ADD CONSTRAINT PK_ESPECIALIDAD_MEDICO PRIMARY KEY (med_run, esp_id);

CREATE TABLE PACIENTE
(
    pac_run          NUMBER(8)    NOT NULL,
    dv_run           VARCHAR(1)   NOT NULL,
    pnombre          VARCHAR2(15) NOT NULL,
    snombre          VARCHAR2(15) NOT NULL,
    apaterno         VARCHAR2(15) NOT NULL,
    amaterno         VARCHAR2(15) NOT NULL,
    fecha_nacimiento DATE         NOT NULL,
    telefono         NUMBER(9),
    sal_id           NUMBER(3)
);
ALTER TABLE PACIENTE
    ADD CONSTRAINT PK_PACIENTE PRIMARY KEY (pac_run);


CREATE TABLE ATENCION
(
    ate_id         NUMBER(8)  NOT NULL,
    fecha_atencion DATE       NOT NULL,
    hr_atencion    VARCHAR(5) NOT NULL,
    costo          NUMBER(8)  NOT NULL,
    med_run        NUMBER(8)  NOT NULL,
    esp_id         NUMBER(4)  NOT NULL,
    pac_run        NUMBER(8)  NOT NULL
);
ALTER TABLE ATENCION
    ADD CONSTRAINT PK_ATENCION PRIMARY KEY (ate_id);


CREATE TABLE PAGO_ATENCION
(
    ate_id           NUMBER(3) NOT NULL,
    fecha_venc_pago  DATE      NOT NULL,
    fecha_pago       DATE,
    monto_atencion   NUMBER(8) NOT NULL,
    monto_a_cancelar NUMBER(8),
    obs_pago         VARCHAR2(100)
);
ALTER TABLE PAGO_ATENCION
    ADD CONSTRAINT PK_PAGO_ATENCION PRIMARY KEY (ate_id);


CREATE TABLE PORC_DESCTO_3RA_EDAD
(
    anno_ini          NUMBER(3) NOT NULL,
    anno_ter          NUMBER(3) NOT NULL,
    porcentaje_descto NUMBER(4) NOT NULL
);
ALTER TABLE PORC_DESCTO_3RA_EDAD
    ADD CONSTRAINT PK_PORC_DESCTO_3RA_EDAD PRIMARY KEY (anno_ini);

CREATE TABLE info_medico
(
    mes_proceso     number(2)    NOT NULL,
    anno_proceso    NUMBER(4)    NOT NULL,
    numrun_medico   VARCHAR2(12) NOT NULL,
    nombre_completo VARCHAR2(60) NOT NULL,
    sueldo_base     NUMBER(15)   NOT NULL,
    aguinaldo       NUMBER(15)   NOT NULL,
    sueldo_final    NUMBER(8)    NOT NULL,
    CONSTRAINT pk_medico_info_sii PRIMARY KEY (anno_proceso,
                                               numrun_medico)
);

CREATE TABLE TRAMO_ASIG_ATMED
(
    tramo_inf_atm NUMBER(2) NOT NULL,
    tramo_sup_atm NUMBER(2) NOT NULL,
    porc_asig     NUMBER(2) NOT NULL,
    CONSTRAINT PK_TRAMO_ASIG_ATMED PRIMARY KEY (tramo_inf_atm, tramo_sup_atm)
);

-- ****************** POBLADO DE LAS TABLAS *****************
INSERT INTO TRAMO_ASIG_ATMED
VALUES (1, 4, 2);
INSERT INTO TRAMO_ASIG_ATMED
VALUES (5, 7, 5);
INSERT INTO TRAMO_ASIG_ATMED
VALUES (8, 10, 7);
INSERT INTO TRAMO_ASIG_ATMED
VALUES (11, 15, 9);
INSERT INTO TRAMO_ASIG_ATMED
VALUES (16, 30, 12);

INSERT INTO PORC_DESCTO_3RA_EDAD
VALUES (65, 70, 2);
INSERT INTO PORC_DESCTO_3RA_EDAD
VALUES (71, 75, 5);
INSERT INTO PORC_DESCTO_3RA_EDAD
VALUES (76, 80, 8);
INSERT INTO PORC_DESCTO_3RA_EDAD
VALUES (81, 85, 10);
INSERT INTO PORC_DESCTO_3RA_EDAD
VALUES (86, 120, 20);

INSERT INTO cargo
VALUES ('100', 'Presidente junta medica');
INSERT INTO cargo
VALUES ('200', 'Medico auditor');
INSERT INTO cargo
VALUES ('300', 'Medico atencion adulto');
INSERT INTO cargo
VALUES ('400', 'Medico atencion ambulatoria');
INSERT INTO cargo
VALUES ('500', 'Psiquiatra');
INSERT INTO cargo
VALUES ('600', 'Director medico');
INSERT INTO cargo
VALUES ('700', 'Medico paciente critico');
INSERT INTO cargo
VALUES ('800', 'Medico atencon urgencia');
INSERT INTO cargo
VALUES ('900', 'Medico Cirujano');

INSERT INTO tipo_salud
VALUES ('F', 'Fonasa');
INSERT INTO tipo_salud
VALUES ('I', 'Isapre');
INSERT INTO tipo_salud
VALUES ('FA', 'Fuerzas Armadas');
INSERT INTO tipo_salud
VALUES ('C', 'Carabineros y PDI');
INSERT INTO tipo_salud
VALUES ('P', 'Particular');

INSERT INTO salud
VALUES (10, 'Tramo A', 0, 'F');
INSERT INTO salud
VALUES (20, 'Tramo B', 25, 'F');
INSERT INTO salud
VALUES (30, 'Tramo C', 35, 'F');
INSERT INTO salud
VALUES (40, 'Tramo D', 45, 'F');
INSERT INTO salud
VALUES (50, 'Mas Vida', 46, 'I');
INSERT INTO salud
VALUES (60, 'Colmena', 55, 'I');
INSERT INTO salud
VALUES (70, 'Banmedica', 37, 'I');
INSERT INTO salud
VALUES (80, 'Cruz Blanca', 60, 'I');
INSERT INTO salud
VALUES (90, 'Consalud', 70, 'I');
INSERT INTO salud
VALUES (100, 'Vida Tres', 56, 'I');
INSERT INTO salud
VALUES (110, 'Personal activo FFAA', 30, 'FA');
INSERT INTO salud
VALUES (120, 'Carga Familar Personal FFAA', 50, 'FA');
INSERT INTO salud
VALUES (130, 'Personal Retirado FFAA', 35, 'FA');
INSERT INTO salud
VALUES (140, 'Personal activo de carabienros y PDI', 30, 'C');
INSERT INTO salud
VALUES (150, 'Carga Familar Personal Carabineros y PDI', 60, 'C');
INSERT INTO salud
VALUES (160, 'Personal Retirado Carabineros y PDI', 60, 'C');
INSERT INTO salud
VALUES (170, 'Personal no afiliado a un sistema de salud', 100, 'P');


INSERT INTO especialidad
VALUES ('100', 'Cirugia General');
INSERT INTO especialidad
VALUES ('200', 'Ortopedia y Traumatologia');
INSERT INTO especialidad
VALUES ('300', 'Dermatologia');
INSERT INTO especialidad
VALUES ('400', 'Inmunologia');
INSERT INTO especialidad
VALUES ('500', 'Fisiatria');
INSERT INTO especialidad
VALUES ('600', 'Medicina Interna');
INSERT INTO especialidad
VALUES ('700', 'Medicina General');
INSERT INTO especialidad
VALUES ('800', 'Neurologia');
INSERT INTO especialidad
VALUES ('900', 'Otorrinolaringologia');
INSERT INTO especialidad
VALUES ('1000', 'Oftalmologia');
INSERT INTO especialidad
VALUES ('1100', 'Psiquiatria Adultos');
INSERT INTO especialidad
VALUES ('1200', 'Urologia');
INSERT INTO especialidad
VALUES ('1300', 'Cirugia Cardiovascular');
INSERT INTO especialidad
VALUES ('1400', 'Cirugia Digestiva');
INSERT INTO especialidad
VALUES ('1500', 'Cardiologia');
INSERT INTO especialidad
VALUES ('1600', 'Gastroenterologia');
INSERT INTO especialidad
VALUES ('1700', 'Oncologia Medica');
INSERT INTO especialidad
VALUES ('1800', 'Reumatologia');
INSERT INTO especialidad
VALUES ('1900', 'Cirugia Plastica');

INSERT INTO medico
VALUES (3126425, '1', 'Gregoria', 'Regina', 'Gonzalez', 'Castillo', 56943757343, 808089,
        TO_DATE('21-08-' || TO_CHAR(EXTRACT(YEAR FROM SYSDATE) - 6), 'DD-MM-YYYY'), 200, 100);
INSERT INTO medico
VALUES (5588583, '4', 'Maria', 'Margarita', 'Fernandez', 'Fernandez', 56986067331, 475943,
        TO_DATE('23-08-' || TO_CHAR(EXTRACT(YEAR FROM SYSDATE) - 1), 'DD-MM-YYYY'), 700, 200);
INSERT INTO medico
VALUES (3490261, '5', 'Margarita', 'Andrea', 'Cares', 'Urrutia', 56960882196, 1781280,
        TO_DATE('09-05-' || TO_CHAR(EXTRACT(YEAR FROM SYSDATE) - 8), 'DD-MM-YYYY'), 100, 400);
INSERT INTO medico
VALUES (6231787, '6', 'Lucinda', 'Carmen', 'Soto', 'Figueroa', '56937479887', '1486384',
        TO_DATE('24-08-' || TO_CHAR(EXTRACT(YEAR FROM SYSDATE) - 8), 'DD-MM-YYYY'), 400, 300);
INSERT INTO medico
VALUES (6010332, '1', 'Rosa', 'Elena', 'Caceres', 'Ferrada', 56918781007, 1897489,
        TO_DATE('04-07-' || TO_CHAR(EXTRACT(YEAR FROM SYSDATE) - 11), 'DD-MM-YYYY'), 200, 800);
INSERT INTO medico
VALUES (6117105, '3', 'Margarita', 'Sandra', 'Gutierrez', 'Rebolledo', 56932544703, 1119823,
        TO_DATE('15-05-' || TO_CHAR(EXTRACT(YEAR FROM SYSDATE) - 6), 'DD-MM-YYYY'), 1000, 300);
INSERT INTO medico
VALUES (6475751, '2', 'Basilia', 'Elena', 'Cid', 'Cid', 56932263754, 894980,
        TO_DATE('27-09-' || TO_CHAR(EXTRACT(YEAR FROM SYSDATE) - 11), 'DD-MM-YYYY'), 1000, 300);
INSERT INTO medico
VALUES (7327526, '1', 'Santos', 'Abelardo', 'Reyes', 'Chavez', 56954933889, 801945,
        TO_DATE('2-06-' || TO_CHAR(EXTRACT(YEAR FROM SYSDATE) - 11), 'DD-MM-YYYY'), 1000, 300);
INSERT INTO medico
VALUES (6783834, '3', 'Ana', 'Rosario', 'Betanzo', 'Gacitua', 56954216826, 1601029,
        TO_DATE('20-04-' || TO_CHAR(EXTRACT(YEAR FROM SYSDATE) - 5), 'DD-MM-YYYY'), 400, 300);
INSERT INTO medico
VALUES (9169312, '7', 'Francisco', 'Cristian', 'Fuentes', 'Monsalve', 56937342030, 1130427,
        TO_DATE('11-12-' || TO_CHAR(EXTRACT(YEAR FROM SYSDATE) - 5), 'DD-MM-YYYY'), 400, 300);
INSERT INTO medico
VALUES (14284031, '6', 'Luis', 'Guillermo', 'Jara', 'Urbina', 56991869103, 1719285,
        TO_DATE('25-03-' || TO_CHAR(EXTRACT(YEAR FROM SYSDATE) - 5), 'DD-MM-YYYY'), 400, 300);
INSERT INTO medico
VALUES (6751207, '3', 'Delmira', 'Carmen', 'Sepulveda', 'Pena', 56935221206, 1062325,
        TO_DATE('05-08-' || TO_CHAR(EXTRACT(YEAR FROM SYSDATE) - 11), 'DD-MM-YYYY'), 900, 600);
INSERT INTO medico
VALUES (10834039, '8', 'Jose', 'Alberto', 'Badilla', 'Leal', 56939539356, 1518019,
        TO_DATE('11-03-' || TO_CHAR(EXTRACT(YEAR FROM SYSDATE) - 5), 'DD-MM-YYYY'), 400, 300);
INSERT INTO medico
VALUES (11959315, '8', 'Ana', 'Maria', 'Escobar', 'Montero', 56970510282, 1016910,
        TO_DATE('17-11-' || TO_CHAR(EXTRACT(YEAR FROM SYSDATE) - 5), 'DD-MM-YYYY'), 200, 800);
INSERT INTO medico
VALUES (13604392, '7', 'Blanca', 'Regina', 'Mendoza', 'Rojas', 56972531275, 1390157,
        TO_DATE('19-02-' || TO_CHAR(EXTRACT(YEAR FROM SYSDATE) - 9), 'DD-MM-YYYY'), 600, 500);
INSERT INTO medico
VALUES (14490825, '2', 'Gloria', 'Isabel', 'Hernandez', 'Zapata', 56948576648, 1386484,
        TO_DATE('07-12-' || TO_CHAR(EXTRACT(YEAR FROM SYSDATE) - 11), 'DD-MM-YYYY'), 500, 700);
INSERT INTO medico
VALUES (4808258, '0', 'Policarpo', 'Hipolito', 'Urrutia', 'Munoz', 56995507317, 959733,
        TO_DATE('14-08-' || TO_CHAR(EXTRACT(YEAR FROM SYSDATE) - 7), 'DD-MM-YYYY'), 100, 400);
INSERT INTO medico
VALUES (6543007, 'K', 'Maureen', 'Susan', 'Clemo', 'Turner', 56954073007, 1502219,
        TO_DATE('16-08-' || TO_CHAR(EXTRACT(YEAR FROM SYSDATE) - 10), 'DD-MM-YYYY'), 100, 400);
INSERT INTO medico
VALUES (3943337, '0', 'Isidoro', 'Eduardo', 'Ordenes', 'Hormazabal', 56976838623, 1520643,
        TO_DATE('23-06-' || TO_CHAR(EXTRACT(YEAR FROM SYSDATE) - 11), 'DD-MM-YYYY'), 400, 300);
INSERT INTO medico
VALUES (5644453, 'K', 'Manuel', 'Carlos', 'Aravena', 'Fuentealba', 56921581272, 1958094,
        TO_DATE('28-07-' || TO_CHAR(EXTRACT(YEAR FROM SYSDATE) - 10), 'DD-MM-YYYY'), 400, 300);
INSERT INTO medico
VALUES (10214564, 'K', 'Viviana', 'Jacqueline', 'Alarcon', 'Caceres', 56916304907, 1499338,
        TO_DATE('15-12-' || TO_CHAR(EXTRACT(YEAR FROM SYSDATE) - 9), 'DD-MM-YYYY'), 800, 900);
INSERT INTO medico
VALUES (3027750, '3', 'Fidel', 'Meri', 'Chavarria', 'Pacheco', 56982239447, 2144239,
        TO_DATE('16-04-' || TO_CHAR(EXTRACT(YEAR FROM SYSDATE) - 11), 'DD-MM-YYYY'), 100, 400);
INSERT INTO medico
VALUES (9827836, '2', 'Jose', 'Gaston', 'Rocha', 'Lara', 56952406038, 521659,
        TO_DATE('27-01-' || TO_CHAR(EXTRACT(YEAR FROM SYSDATE) - 11), 'DD-MM-YYYY'), 200, 800);
INSERT INTO medico
VALUES (11448750, '3', 'Maria', 'Nelly', 'Martinez', 'Hernandez', 56929544102, 1972989,
        TO_DATE('12-08-' || TO_CHAR(EXTRACT(YEAR FROM SYSDATE) - 11), 'DD-MM-YYYY'), 100, 400);
INSERT INTO medico
VALUES (3758049, 'K', 'Hector', 'Rene', 'Andrade', 'Faundez', 56930378649, 1604395,
        TO_DATE('03-05-' || TO_CHAR(EXTRACT(YEAR FROM SYSDATE) - 11), 'DD-MM-YYYY'), 800, 900);
INSERT INTO medico
VALUES (5412514, '3', 'Maria', 'Magdalena', 'Beltran', 'Jana', 56971076051, 966917,
        TO_DATE('15-10-' || TO_CHAR(EXTRACT(YEAR FROM SYSDATE) - 9), 'DD-MM-YYYY'), 400, 300);
INSERT INTO medico
VALUES (5825975, '6', 'Gladys', 'Yolanda', 'Echeverria', 'Cifuentes', 56974126261, 2014845,
        TO_DATE('20-03-' || TO_CHAR(EXTRACT(YEAR FROM SYSDATE) - 11), 'DD-MM-YYYY'), 100, 400);
INSERT INTO medico
VALUES (11293307, '7', 'Eduardo', 'Thomas', 'Castillo', 'Castillo', 56974063821, 2352622,
        TO_DATE('29-08-' || TO_CHAR(EXTRACT(YEAR FROM SYSDATE) - 11), 'DD-MM-YYYY'), 700, 900);
INSERT INTO medico
VALUES (4582433, '0', 'Bartolome', 'Ignacio', 'Parra', 'Parra', 56973814523, 559093,
        TO_DATE('22-05-' || TO_CHAR(EXTRACT(YEAR FROM SYSDATE) - 11), 'DD-MM-YYYY'), 700, 900);
INSERT INTO medico
VALUES (5693955, '5', 'Gabriel', 'Carmen', 'Vivallos', 'Riquelme', 56984907703, 2349570,
        TO_DATE('05-05-' || TO_CHAR(EXTRACT(YEAR FROM SYSDATE) - 4), 'DD-MM-YYYY'), 200, 800);
INSERT INTO medico
VALUES (6135687, '8', 'Enrique', 'Carmen', 'Morales', 'Silva', 56977918239, 550909,
        TO_DATE('10-07-' || TO_CHAR(EXTRACT(YEAR FROM SYSDATE) - 4), 'DD-MM-YYYY'), 700, 900);
INSERT INTO medico
VALUES (11292307, '9', 'Carlos', 'Alfonso', 'Mejias', 'Morales', 56987653212, 880396,
        TO_DATE('10-05-' || TO_CHAR(EXTRACT(YEAR FROM SYSDATE) - 5), 'DD-MM-YYYY'), 900, 300);
INSERT INTO medico
VALUES (10282370, 'K', 'Tania', 'Alejandra', 'Bahamondez', 'Perez', 56978562321, 930870,
        TO_DATE('02-08-' || TO_CHAR(EXTRACT(YEAR FROM SYSDATE) - 4), 'DD-MM-YYYY'), 500, 300);
INSERT INTO medico
VALUES (10573148, '5', 'Francisco', 'Fuentes', 'Gonzalez', 'Zapata', 56948576648, 1386484,
        TO_DATE('07-12-' || TO_CHAR(EXTRACT(YEAR FROM SYSDATE) - 11), 'DD-MM-YYYY'), 400, 300);
INSERT INTO medico
VALUES (13765749, 'K', 'Jose', 'Badilla', 'Leal', 'Munoz', 56995507317, 959733,
        TO_DATE('14-08-' || TO_CHAR(EXTRACT(YEAR FROM SYSDATE) - 7), 'DD-MM-YYYY'), 300, 700);
INSERT INTO medico
VALUES (13996528, '0', 'Ana', 'Rosario', 'Betanzo', 'Turner', 56954073007, 1502219,
        TO_DATE('16-08-' || TO_CHAR(EXTRACT(YEAR FROM SYSDATE) - 10), 'DD-MM-YYYY'), 400, 300);
INSERT INTO medico
VALUES (14030150, '7', 'Blanca', 'Mendoza', 'Rojas', 'Hormazabal', 56976838623, 1520643,
        TO_DATE('23-06-' || TO_CHAR(EXTRACT(YEAR FROM SYSDATE) - 11), 'DD-MM-YYYY'), 600, 500);
INSERT INTO medico
VALUES (10863274, '7', 'Isidoro', 'Ordenes', 'Hormazabal', 'Fuentealba', 56921581272, 1958094,
        TO_DATE('28-07-' || TO_CHAR(EXTRACT(YEAR FROM SYSDATE) - 1), 'DD-MM-YYYY'), 100, 400);
INSERT INTO medico
VALUES (13877357, '4', 'Gregoria', 'Gonzalez', 'Castillo', 'Caceres', 56916304907, 1499338,
        TO_DATE('15-12-' || TO_CHAR(EXTRACT(YEAR FROM SYSDATE) - 9), 'DD-MM-YYYY'), 400, 300);
INSERT INTO medico
VALUES (14353190, '2', 'Margarita', 'Cares', 'Urrutia', 'Pacheco', 56982239447, 2144239,
        TO_DATE('16-04-' || TO_CHAR(EXTRACT(YEAR FROM SYSDATE) - 11), 'DD-MM-YYYY'), 600, 500);
INSERT INTO medico
VALUES (12382007, 'K', 'Carlos', 'Mejias', 'Morales', 'Lara', 56952406038, 521659,
        TO_DATE('27-01-' || TO_CHAR(EXTRACT(YEAR FROM SYSDATE) - 11), 'DD-MM-YYYY'), 100, 400);
INSERT INTO medico
VALUES (9509590, '9', 'Gabriel', 'Vivallos', 'Riquelme', 'Hernandez', 56929544102, 1972989,
        TO_DATE('12-08-' || TO_CHAR(EXTRACT(YEAR FROM SYSDATE) - 11), 'DD-MM-YYYY'), 100, 400);
INSERT INTO medico
VALUES (7555800, '7', 'Maria', 'Martinez', 'Hernandez', 'Faundez', 56930378649, 1604395,
        TO_DATE('03-05-' || TO_CHAR(EXTRACT(YEAR FROM SYSDATE) - 11), 'DD-MM-YYYY'), 400, 300);
INSERT INTO medico
VALUES (13770506, '0', 'Eduardo', 'Castillo', 'Castillo', 'Jara', 56971076051, 966917,
        TO_DATE('15-10-' || TO_CHAR(EXTRACT(YEAR FROM SYSDATE) - 9), 'DD-MM-YYYY'), 500, 300);
INSERT INTO medico
VALUES (10726792, '1', 'Viviana', 'Alarcon', 'Caceres', 'Cifuentes', 56974126261, 2014845,
        TO_DATE('20-03-' || TO_CHAR(EXTRACT(YEAR FROM SYSDATE) - 11), 'DD-MM-YYYY'), 800, 900);
INSERT INTO medico
VALUES (7283959, '5', 'Manuel', 'Aravena', 'Fuentealba', 'Castillo', 56974063821, 2352622,
        TO_DATE('29-08-' || TO_CHAR(EXTRACT(YEAR FROM SYSDATE) - 11), 'DD-MM-YYYY'), 100, 400);
INSERT INTO medico
VALUES (10066612, 'K', 'Luis', 'Jara', 'Urbina', 'Parra', 56973814523, 559093,
        TO_DATE('22-05-' || TO_CHAR(EXTRACT(YEAR FROM SYSDATE) - 1), 'DD-MM-YYYY'), 700, 300);
INSERT INTO medico
VALUES (11574234, '5', 'Maureen', 'Hernandez', 'Zapata', 'Riquelme', 56984907703, 2349570,
        TO_DATE('05-05-' || TO_CHAR(EXTRACT(YEAR FROM SYSDATE) - 4), 'DD-MM-YYYY'), 200, 800);
INSERT INTO medico
VALUES (10805156, '6', 'Maria', 'Beltran', 'Garcia', 'Silva', 56977918239, 550909,
        TO_DATE('10-07-' || TO_CHAR(EXTRACT(YEAR FROM SYSDATE) - 1), 'DD-MM-YYYY'), 200, 800);
INSERT INTO medico
VALUES (11959215, '1', 'Fidel', 'Chavarria', 'Pacheco', 'Morales', 56987653212, 880396,
        TO_DATE('10-05-' || TO_CHAR(EXTRACT(YEAR FROM SYSDATE) - 5), 'DD-MM-YYYY'), 100, 400);
INSERT INTO medico
VALUES (10006101, '5', 'Jose', 'Rocha', 'Lara', 'Perez', 56978562321, 930870,
        TO_DATE('02-08-' || TO_CHAR(EXTRACT(YEAR FROM SYSDATE) - 4), 'DD-MM-YYYY'), 100, 400);

INSERT INTO especialidad_medico
VALUES ('3126425', '900', TO_DATE('21/08/' || TO_CHAR(EXTRACT(YEAR FROM SYSDATE) - 6), 'DD-MM-YYYY'));
INSERT INTO especialidad_medico
VALUES ('5588583', '100', TO_DATE('23/08/' || TO_CHAR(EXTRACT(YEAR FROM SYSDATE) - 17), 'DD-MM-YYYY'));
INSERT INTO especialidad_medico
VALUES ('5588583', '1300', TO_DATE('23/08/' || TO_CHAR(EXTRACT(YEAR FROM SYSDATE) - 9), 'DD-MM-YYYY'));
INSERT INTO especialidad_medico
VALUES ('3490261', '800', TO_DATE('09/05/' || TO_CHAR(EXTRACT(YEAR FROM SYSDATE) - 8), 'DD-MM-YYYY'));
INSERT INTO especialidad_medico
VALUES ('6231787', '900', TO_DATE('24/08/' || TO_CHAR(EXTRACT(YEAR FROM SYSDATE) - 8), 'DD-MM-YYYY'));
INSERT INTO especialidad_medico
VALUES ('6010332', '200', TO_DATE('04/07/' || TO_CHAR(EXTRACT(YEAR FROM SYSDATE) - 17), 'DD-MM-YYYY'));
INSERT INTO especialidad_medico
VALUES ('6117105', '200', TO_DATE('15/05/' || TO_CHAR(EXTRACT(YEAR FROM SYSDATE) - 6), 'DD-MM-YYYY'));
INSERT INTO especialidad_medico
VALUES ('6475751', '200', TO_DATE('27/09/' || TO_CHAR(EXTRACT(YEAR FROM SYSDATE) - 19), 'DD-MM-YYYY'));
INSERT INTO especialidad_medico
VALUES ('7327526', '200', TO_DATE('02/06/' || TO_CHAR(EXTRACT(YEAR FROM SYSDATE) - 11), 'DD-MM-YYYY'));
INSERT INTO especialidad_medico
VALUES ('6783834', '400', TO_DATE('20/04/' || TO_CHAR(EXTRACT(YEAR FROM SYSDATE) - 5), 'DD-MM-YYYY'));
INSERT INTO especialidad_medico
VALUES ('9169312', '400', TO_DATE('11/12/' || TO_CHAR(EXTRACT(YEAR FROM SYSDATE) - 5), 'DD-MM-YYYY'));
INSERT INTO especialidad_medico
VALUES ('14284031', '400', TO_DATE('25/03/' || TO_CHAR(EXTRACT(YEAR FROM SYSDATE) - 5), 'DD-MM-YYYY'));
INSERT INTO especialidad_medico
VALUES ('6751207', '600', TO_DATE('05/08/' || TO_CHAR(EXTRACT(YEAR FROM SYSDATE) - 18), 'DD-MM-YYYY'));
INSERT INTO especialidad_medico
VALUES ('6751207', '1500', TO_DATE('05/08/' || TO_CHAR(EXTRACT(YEAR FROM SYSDATE) - 9), 'DD-MM-YYYY'));
INSERT INTO especialidad_medico
VALUES ('10834039', '1800', TO_DATE('11/03/' || TO_CHAR(EXTRACT(YEAR FROM SYSDATE) - 5), 'DD-MM-YYYY'));
INSERT INTO especialidad_medico
VALUES ('11959315', '800', TO_DATE('17/11/' || TO_CHAR(EXTRACT(YEAR FROM SYSDATE) - 5), 'DD-MM-YYYY'));
INSERT INTO especialidad_medico
VALUES ('13604392', '1100', TO_DATE('19/02/' || TO_CHAR(EXTRACT(YEAR FROM SYSDATE) - 9), 'DD-MM-YYYY'));
INSERT INTO especialidad_medico
VALUES ('14490825', '600', TO_DATE('07/12/' || TO_CHAR(EXTRACT(YEAR FROM SYSDATE) - 15), 'DD-MM-YYYY'));
INSERT INTO especialidad_medico
VALUES ('14490825', '1700', TO_DATE('07/12/' || TO_CHAR(EXTRACT(YEAR FROM SYSDATE) - 5), 'DD-MM-YYYY'));
INSERT INTO especialidad_medico
VALUES ('4808258', '700', TO_DATE('14/08/' || TO_CHAR(EXTRACT(YEAR FROM SYSDATE) - 7), 'DD-MM-YYYY'));
INSERT INTO especialidad_medico
VALUES ('6543007', '700', TO_DATE('16/08/' || TO_CHAR(EXTRACT(YEAR FROM SYSDATE) - 10), 'DD-MM-YYYY'));
INSERT INTO especialidad_medico
VALUES ('3943337', '300', TO_DATE('23/06/' || TO_CHAR(EXTRACT(YEAR FROM SYSDATE) - 19), 'DD-MM-YYYY'));
INSERT INTO especialidad_medico
VALUES ('5644453', '300', TO_DATE('28/07/' || TO_CHAR(EXTRACT(YEAR FROM SYSDATE) - 10), 'DD-MM-YYYY'));
INSERT INTO especialidad_medico
VALUES ('10214564', '300', TO_DATE('15/12/' || TO_CHAR(EXTRACT(YEAR FROM SYSDATE) - 9), 'DD-MM-YYYY'));
INSERT INTO especialidad_medico
VALUES ('3027750', '700', TO_DATE('16/04/' || TO_CHAR(EXTRACT(YEAR FROM SYSDATE) - 13), 'DD-MM-YYYY'));
INSERT INTO especialidad_medico
VALUES ('9827836', '100', TO_DATE('27/01/' || TO_CHAR(EXTRACT(YEAR FROM SYSDATE) - 11), 'DD-MM-YYYY'));
INSERT INTO especialidad_medico
VALUES ('9827836', '1900', TO_DATE('27/01/' || TO_CHAR(EXTRACT(YEAR FROM SYSDATE) - 5), 'DD-MM-YYYY'));
INSERT INTO especialidad_medico
VALUES ('11448750', '500', TO_DATE('12/08/' || TO_CHAR(EXTRACT(YEAR FROM SYSDATE) - 12), 'DD-MM-YYYY'));
INSERT INTO especialidad_medico
VALUES ('3758049', '600', TO_DATE('03/05/' || TO_CHAR(EXTRACT(YEAR FROM SYSDATE) - 15), 'DD-MM-YYYY'));
INSERT INTO especialidad_medico
VALUES ('5412514', '600', TO_DATE('15/10/' || TO_CHAR(EXTRACT(YEAR FROM SYSDATE) - 9), 'DD-MM-YYYY'));
INSERT INTO especialidad_medico
VALUES ('5825975', '600', TO_DATE('20/03/' || TO_CHAR(EXTRACT(YEAR FROM SYSDATE) - 17), 'DD-MM-YYYY'));
INSERT INTO especialidad_medico
VALUES ('11293307', '1400', TO_DATE('29/08/' || TO_CHAR(EXTRACT(YEAR FROM SYSDATE) - 16), 'DD-MM-YYYY'));
INSERT INTO especialidad_medico
VALUES ('4582433', '100', TO_DATE('22/05/' || TO_CHAR(EXTRACT(YEAR FROM SYSDATE) - 14), 'DD-MM-YYYY'));
INSERT INTO especialidad_medico
VALUES ('4582433', '1400', TO_DATE('22/05/' || TO_CHAR(EXTRACT(YEAR FROM SYSDATE) - 4), 'DD-MM-YYYY'));
INSERT INTO especialidad_medico
VALUES ('5693955', '100', TO_DATE('05/05/' || TO_CHAR(EXTRACT(YEAR FROM SYSDATE) - 4), 'DD-MM-YYYY'));
INSERT INTO especialidad_medico
VALUES ('6135687', '100', TO_DATE('10/07/' || TO_CHAR(EXTRACT(YEAR FROM SYSDATE) - 4), 'DD-MM-YYYY'));
INSERT INTO especialidad_medico
VALUES ('11292307', '1500', TO_DATE('10/05/' || TO_CHAR(EXTRACT(YEAR FROM SYSDATE) - 5), 'DD-MM-YYYY'));
INSERT INTO especialidad_medico
VALUES ('10282370', '600', TO_DATE('02/08/' || TO_CHAR(EXTRACT(YEAR FROM SYSDATE) - 4), 'DD-MM-YYYY'));
INSERT INTO especialidad_medico
VALUES ('10834039', '600', TO_DATE('07/12/' || TO_CHAR(EXTRACT(YEAR FROM SYSDATE) - 15), 'DD-MM-YYYY'));
INSERT INTO especialidad_medico
VALUES ('9509590', '300', TO_DATE('28/07/' || TO_CHAR(EXTRACT(YEAR FROM SYSDATE) - 10), 'DD-MM-YYYY'));
INSERT INTO especialidad_medico
VALUES ('11293307', '100', TO_DATE('15/12/' || TO_CHAR(EXTRACT(YEAR FROM SYSDATE) - 9), 'DD-MM-YYYY'));
INSERT INTO especialidad_medico
VALUES ('11292307', '600', TO_DATE('16/04/' || TO_CHAR(EXTRACT(YEAR FROM SYSDATE) - 13), 'DD-MM-YYYY'));
INSERT INTO especialidad_medico
VALUES ('10282370', '1700', TO_DATE('27/01/' || TO_CHAR(EXTRACT(YEAR FROM SYSDATE) - 11), 'DD-MM-YYYY'));
INSERT INTO especialidad_medico
VALUES ('10573148', '500', TO_DATE('12/08/' || TO_CHAR(EXTRACT(YEAR FROM SYSDATE) - 12), 'DD-MM-YYYY'));
INSERT INTO especialidad_medico
VALUES ('7555800', '600', TO_DATE('03/05/' || TO_CHAR(EXTRACT(YEAR FROM SYSDATE) - 15), 'DD-MM-YYYY'));
INSERT INTO especialidad_medico
VALUES ('7555800', '1800', TO_DATE('03/05/' || TO_CHAR(EXTRACT(YEAR FROM SYSDATE) - 6), 'DD-MM-YYYY'));
INSERT INTO especialidad_medico
VALUES ('13770506', '600', TO_DATE('15/10/' || TO_CHAR(EXTRACT(YEAR FROM SYSDATE) - 9), 'DD-MM-YYYY'));
INSERT INTO especialidad_medico
VALUES ('10726792', '600', TO_DATE('20/03/' || TO_CHAR(EXTRACT(YEAR FROM SYSDATE) - 17), 'DD-MM-YYYY'));
INSERT INTO especialidad_medico
VALUES ('10726792', '1700', TO_DATE('20/03/' || TO_CHAR(EXTRACT(YEAR FROM SYSDATE) - 5), 'DD-MM-YYYY'));
INSERT INTO especialidad_medico
VALUES ('7283959', '600', TO_DATE('29/08/' || TO_CHAR(EXTRACT(YEAR FROM SYSDATE) - 16), 'DD-MM-YYYY'));
INSERT INTO especialidad_medico
VALUES ('10066612', '100', TO_DATE('22/05/' || TO_CHAR(EXTRACT(YEAR FROM SYSDATE) - 14), 'DD-MM-YYYY'));
INSERT INTO especialidad_medico
VALUES ('10066612', '1300', TO_DATE('22/05/' || TO_CHAR(EXTRACT(YEAR FROM SYSDATE) - 4), 'DD-MM-YYYY'));
INSERT INTO especialidad_medico
VALUES ('11574234', '100', TO_DATE('05/05/' || TO_CHAR(EXTRACT(YEAR FROM SYSDATE) - 4), 'DD-MM-YYYY'));
INSERT INTO especialidad_medico
VALUES ('10805156', '100', TO_DATE('10/07/' || TO_CHAR(EXTRACT(YEAR FROM SYSDATE) - 4), 'DD-MM-YYYY'));
INSERT INTO especialidad_medico
VALUES ('11959215', '700', TO_DATE('10/05/' || TO_CHAR(EXTRACT(YEAR FROM SYSDATE) - 5), 'DD-MM-YYYY'));
INSERT INTO especialidad_medico
VALUES ('10006101', '700', TO_DATE('02/08/' || TO_CHAR(EXTRACT(YEAR FROM SYSDATE) - 4), 'DD-MM-YYYY'));
INSERT INTO especialidad_medico
VALUES ('10863274', '300', TO_DATE('28/07/' || TO_CHAR(EXTRACT(YEAR FROM SYSDATE) - 10), 'DD-MM-YYYY'));
INSERT INTO especialidad_medico
VALUES ('12382007', '300', TO_DATE('27/01/' || TO_CHAR(EXTRACT(YEAR FROM SYSDATE) - 11), 'DD-MM-YYYY'));
INSERT INTO especialidad_medico
VALUES ('13765749', '400', TO_DATE('14/08/' || TO_CHAR(EXTRACT(YEAR FROM SYSDATE) - 7), 'DD-MM-YYYY'));
INSERT INTO especialidad_medico
VALUES ('13877357', '800', TO_DATE('15/12/' || TO_CHAR(EXTRACT(YEAR FROM SYSDATE) - 9), 'DD-MM-YYYY'));
INSERT INTO especialidad_medico
VALUES ('13996528', '500', TO_DATE('16/08/' || TO_CHAR(EXTRACT(YEAR FROM SYSDATE) - 10), 'DD-MM-YYYY'));
INSERT INTO especialidad_medico
VALUES ('14030150', '1100', TO_DATE('23/06/' || TO_CHAR(EXTRACT(YEAR FROM SYSDATE) - 19), 'DD-MM-YYYY'));
INSERT INTO especialidad_medico
VALUES ('14353190', '1100', TO_DATE('16/04/' || TO_CHAR(EXTRACT(YEAR FROM SYSDATE) - 13), 'DD-MM-YYYY'));

INSERT INTO unidad
VALUES ('100', 'ATENCION AMBULATORIA', 7283959);
INSERT INTO unidad
VALUES ('200', 'ATENCION URGENCIA', 11959315);
INSERT INTO unidad
VALUES ('300', 'PACIENTE CRITICO', 3758049);
INSERT INTO unidad
VALUES ('400', 'ATENCION ADULTO', 10573148);
INSERT INTO unidad
VALUES ('500', 'ONCOLOGIGA', 10282370);
INSERT INTO unidad
VALUES ('600', 'PSIQUIATria Y SALUD MENTAL', 14353190);
INSERT INTO unidad
VALUES ('700', 'CIRUgia', 5588583);
INSERT INTO unidad
VALUES ('800', 'CIRUgia Plastica', 5588583);
INSERT INTO unidad
VALUES ('900', 'CARDIOLOgia', 5588583);
INSERT INTO unidad
VALUES ('1000', 'TRAUMATOLOgia ADULTO', 6117105);

INSERT INTO paciente
VALUES (6215470, '5', 'Nora', 'Carmen', 'Escobar', 'Montero', TO_DATE('21-07-' || TO_CHAR(EXTRACT(YEAR FROM SYSDATE) - 4), 'DD-MM-YYYY'),
        416794313, 120);
INSERT INTO paciente
VALUES (7555810, '7', 'Jenoveva', 'Carmen', 'Monares', 'Urrutia', TO_DATE('10-09-' || TO_CHAR(EXTRACT(YEAR FROM SYSDATE) - 4), 'DD-MM-YYYY'),
        413753199, 70);
INSERT INTO paciente
VALUES (6941733, '7', 'Miguel', 'Navor', 'Diocares', 'Herrera', TO_DATE('25-01-' || TO_CHAR(EXTRACT(YEAR FROM SYSDATE) - 6), 'DD-MM-YYYY'),
        414528259, 50);
INSERT INTO paciente
VALUES (7144708, '1', 'Maria', 'Julia', 'Gonzalez', 'Beltran', TO_DATE('23-02-' || TO_CHAR(EXTRACT(YEAR FROM SYSDATE) - 7), 'DD-MM-YYYY'),
        414837162, 90);
INSERT INTO paciente
VALUES (2576808, '6', 'Jose', 'Jorge', 'Echeverria', 'Munoz', TO_DATE('08-01-' || TO_CHAR(EXTRACT(YEAR FROM SYSDATE) - 7), 'DD-MM-YYYY'),
        413706131, 40);
INSERT INTO paciente
VALUES (13770506, '0', 'Yasna', 'Elizabeth', 'Diaz', 'Cisterna', TO_DATE('15-02-' || TO_CHAR(EXTRACT(YEAR FROM SYSDATE) - 8), 'DD-MM-YYYY'),
        413226082, 20);
INSERT INTO paciente
VALUES (15494012, 'K', 'Soledad', 'Alejandra', 'Perez', 'Gallejos', TO_DATE('17-11-' || TO_CHAR(EXTRACT(YEAR FROM SYSDATE) - 8), 'DD-MM-YYYY'),
        418253241, 40);
INSERT INTO paciente
VALUES (6400537, '5', 'Jose', 'Cardenio', 'Zurita', 'Bustamante', TO_DATE('04-04-' || TO_CHAR(EXTRACT(YEAR FROM SYSDATE) - 13), 'DD-MM-YYYY'),
        417824064, 50);
INSERT INTO paciente
VALUES (6239966, 'K', 'Rosa', 'Irenia', 'Beltran', 'Rodriguez', TO_DATE('19-06-' || TO_CHAR(EXTRACT(YEAR FROM SYSDATE) - 14), 'DD-MM-YYYY'),
        414487222, 70);
INSERT INTO paciente
VALUES (5649139, '2', 'Prosperina', 'Mercedes', 'Quiroz', 'Valenzuela',
        TO_DATE('06-03-' || TO_CHAR(EXTRACT(YEAR FROM SYSDATE) - 14), 'DD-MM-YYYY'), 417677800, 30);
INSERT INTO paciente
VALUES (10726792, '1', 'Cecilia', 'Nieves', 'Carrasco', 'Munoz', TO_DATE('09-10-' || TO_CHAR(EXTRACT(YEAR FROM SYSDATE) - 15), 'DD-MM-YYYY'),
        418443858, 120);
INSERT INTO paciente
VALUES (16204720, '5', 'Marlene', 'Ivon', 'Gutierrez', 'Vasquez', TO_DATE('16-03-' || TO_CHAR(EXTRACT(YEAR FROM SYSDATE) - 15), 'DD-MM-YYYY'),
        415901844, 90);
INSERT INTO paciente
VALUES (5820729, '2', 'Bernardo', 'Jose', 'Inzunza', 'Sepulveda', TO_DATE('02-07-' || TO_CHAR(EXTRACT(YEAR FROM SYSDATE) - 15), 'DD-MM-YYYY'),
        412247153, 10);
INSERT INTO paciente
VALUES (12766479, 'K', 'Maria', 'Pilar', 'Arroyo', 'Escobar', TO_DATE('29-09-' || TO_CHAR(EXTRACT(YEAR FROM SYSDATE) - 17), 'DD-MM-YYYY'),
        414177253, 90);
INSERT INTO paciente
VALUES (6675981, '4', 'Olga', 'Carmen', 'Navarrete', 'Paredes', TO_DATE('24-06-' || TO_CHAR(EXTRACT(YEAR FROM SYSDATE) - 19), 'DD-MM-YYYY'),
        416789707, 100);
INSERT INTO paciente
VALUES (4744782, '8', 'Jose', 'Santos', 'Torres', 'Munoz', TO_DATE('28-02-' || TO_CHAR(EXTRACT(YEAR FROM SYSDATE) - 19), 'DD-MM-YYYY'),
        415575381, 90);
INSERT INTO paciente
VALUES (9073794, '5', 'Cenobia', 'Carmen', 'Marin', 'Valenzuela', TO_DATE('04-11-' || TO_CHAR(EXTRACT(YEAR FROM SYSDATE) - 21), 'DD-MM-YYYY'),
        413152009, 110);
INSERT INTO paciente
VALUES (7283959, '5', 'Hugo', 'Alfredo', 'Suazo', 'Riquelme', TO_DATE('16-08-' || TO_CHAR(EXTRACT(YEAR FROM SYSDATE) - 22), 'DD-MM-YYYY'),
        415234899, 30);
INSERT INTO paciente
VALUES (8928585, '2', 'Gladys', 'Carmen', 'Beltran', 'Parra', TO_DATE('26-08-' || TO_CHAR(EXTRACT(YEAR FROM SYSDATE) - 24), 'DD-MM-YYYY'),
        418376396, 90);
INSERT INTO paciente
VALUES (5091732, '0', 'Jerman', 'Marcelo', 'Escalona', 'Espinoza', TO_DATE('12-05-' || TO_CHAR(EXTRACT(YEAR FROM SYSDATE) - 24), 'DD-MM-YYYY'),
        415399103, 60);
INSERT INTO paciente
VALUES (8572120, '8', 'Florencio', 'Eduardo', 'Suazo', 'Riquelme', TO_DATE('6-07-' || TO_CHAR(EXTRACT(YEAR FROM SYSDATE) - 24), 'DD-MM-YYYY'),
        418552190, 100);
INSERT INTO paciente
VALUES (8284373, '6', 'Norma', 'Carmen', 'Echeverria', 'Echevarria',
        TO_DATE('16-03-' || TO_CHAR(EXTRACT(YEAR FROM SYSDATE) - 26), 'DD-MM-YYYY'), 418269172, 80);
INSERT INTO paciente
VALUES (9101755, '5', 'Maria', 'Leontina', 'Guinez', 'Munoz', TO_DATE('19-03-' || TO_CHAR(EXTRACT(YEAR FROM SYSDATE) - 23), 'DD-MM-YYYY'),
        414895096, 50);
INSERT INTO paciente
VALUES (8671238, '5', 'Marina', 'Rosario', 'Carrasco', 'Lopez', TO_DATE('16-04-' || TO_CHAR(EXTRACT(YEAR FROM SYSDATE) - 28), 'DD-MM-YYYY'),
        416756218, 50);
INSERT INTO paciente
VALUES (8162534, '4', 'Honoria', 'Transito', 'Escobar', 'Valenzuela',
        TO_DATE('27-08-' || TO_CHAR(EXTRACT(YEAR FROM SYSDATE) - 28), 'DD-MM-YYYY'), 418902836, 60);
INSERT INTO paciente
VALUES (4378812, '4', 'Julia', 'Iris', 'Chavarria', 'Gutierrez', TO_DATE('05-02-' || TO_CHAR(EXTRACT(YEAR FROM SYSDATE) - 29), 'DD-MM-YYYY'),
        414424462, 70);
INSERT INTO paciente
VALUES (13604980, '1', 'Veronica', 'Yaneth', 'Ormeno', 'Heredia', TO_DATE('13-08-' || TO_CHAR(EXTRACT(YEAR FROM SYSDATE) - 29), 'DD-MM-YYYY'),
        417688395, 150);
INSERT INTO paciente
VALUES (4426899, 'K', 'Sergio', 'Rodrigo', 'Vasquez', 'Olate', TO_DATE('02-04-' || TO_CHAR(EXTRACT(YEAR FROM SYSDATE) - 29), 'DD-MM-YYYY'),
        412725231, 60);
INSERT INTO paciente
VALUES (4884829, 'K', 'Flor', 'Maria', 'Alvarez', 'Caceres', TO_DATE('21-06-' || TO_CHAR(EXTRACT(YEAR FROM SYSDATE) - 31), 'DD-MM-YYYY'),
        416302077, 130);
INSERT INTO paciente
VALUES (4603482, '1', 'Berta', 'Ines', 'Gutierrez', 'Solar', TO_DATE('25-11-' || TO_CHAR(EXTRACT(YEAR FROM SYSDATE) - 31), 'DD-MM-YYYY'),
        415561511, 40);
INSERT INTO paciente
VALUES (2583879, '3', 'Teresa', 'Carmen', 'Rivas', 'Espinoza', TO_DATE('13-07-' || TO_CHAR(EXTRACT(YEAR FROM SYSDATE) - 31), 'DD-MM-YYYY'),
        412638163, 50);
INSERT INTO paciente
VALUES (7000164, '0', 'Juan', 'Pedro', 'Gutierrez', 'Jara', TO_DATE('17-03-' || TO_CHAR(EXTRACT(YEAR FROM SYSDATE) - 32), 'DD-MM-YYYY'),
        415790075, 20);
INSERT INTO paciente
VALUES (3433444, '7', 'Maria', 'Ines', 'Araneda', 'Araneda', TO_DATE('11-03-' || TO_CHAR(EXTRACT(YEAR FROM SYSDATE) - 34), 'DD-MM-YYYY'),
        417962039, 150);
INSERT INTO paciente
VALUES (10066612, 'K', 'Maria', 'Isabel', 'Lobos', 'Araneda', TO_DATE('3-09-' || TO_CHAR(EXTRACT(YEAR FROM SYSDATE) - 34), 'DD-MM-YYYY'),
        416499872, 20);
INSERT INTO paciente
VALUES (4389745, '4', 'Marta', 'Beatriz', 'Osses', 'Tapia', TO_DATE('15-07-' || TO_CHAR(EXTRACT(YEAR FROM SYSDATE) - 35), 'DD-MM-YYYY'),
        415429852, 20);
INSERT INTO paciente
VALUES (11574234, '5', 'Jeannette', 'Maria', 'Matamala', 'Arroyo', TO_DATE('12-07-' || TO_CHAR(EXTRACT(YEAR FROM SYSDATE) - 36), 'DD-MM-YYYY'),
        416346062, 30);
INSERT INTO paciente
VALUES (12165324, '9', 'Ana', 'Gabriela', 'Zavala', 'Zavala', TO_DATE('08-05-' || TO_CHAR(EXTRACT(YEAR FROM SYSDATE) - 36), 'DD-MM-YYYY'),
        412440414, 100);
INSERT INTO paciente
VALUES (4892956, '7', 'Martiniano', 'Segundo', 'Quilodran', 'Hernandez',
        TO_DATE('30-08-' || TO_CHAR(EXTRACT(YEAR FROM SYSDATE) - 36), 'DD-MM-YYYY'), 412870010, 70);
INSERT INTO paciente
VALUES (3066256, '3', 'Olga', 'Ximena', 'Belmar', 'Lamilla', TO_DATE('10-05-' || TO_CHAR(EXTRACT(YEAR FROM SYSDATE) - 37), 'DD-MM-YYYY'),
        412805543, 130);
INSERT INTO paciente
VALUES (5117349, 'K', 'Hugo', 'Pablina', 'Munoz', 'Figueroa', TO_DATE('29-12-' || TO_CHAR(EXTRACT(YEAR FROM SYSDATE) - 37), 'DD-MM-YYYY'),
        417928279, 10);
INSERT INTO paciente
VALUES (9685598, '2', 'Victor', 'Manuel', 'Estrada', 'Porraz', TO_DATE('26-09-' || TO_CHAR(EXTRACT(YEAR FROM SYSDATE) - 38), 'DD-MM-YYYY'),
        418882718, 50);
INSERT INTO paciente
VALUES (6110507, '7', 'Rebeca', 'Carmen', 'Sanchez', 'Campos', TO_DATE('9-03-' || TO_CHAR(EXTRACT(YEAR FROM SYSDATE) - 39), 'DD-MM-YYYY'),
        413314293, 10);
INSERT INTO paciente
VALUES (5056163, '1', 'Florencio', 'Segundo', 'Villalobos', 'Constanzo',
        TO_DATE('08-09-' || TO_CHAR(EXTRACT(YEAR FROM SYSDATE) - 39), 'DD-MM-YYYY'), 412391625, 170);
INSERT INTO paciente
VALUES (6340382, '2', 'Adolfina', 'Carmen', 'Sazo', 'Arroyo', TO_DATE('28-06-' || TO_CHAR(EXTRACT(YEAR FROM SYSDATE) - 42), 'DD-MM-YYYY'),
        415943846, 20);
INSERT INTO paciente
VALUES (10805156, '6', 'Mirna', 'Susi', 'Soto', 'Echeverria', TO_DATE('11-09-' || TO_CHAR(EXTRACT(YEAR FROM SYSDATE) - 42), 'DD-MM-YYYY'),
        413797330, 40);
INSERT INTO paciente
VALUES (4347082, '5', 'Jose', 'Hipolito', 'Bobadilla', 'Ortega', TO_DATE('22-09-' || TO_CHAR(EXTRACT(YEAR FROM SYSDATE) - 44), 'DD-MM-YYYY'),
        415919644, 90);
INSERT INTO paciente
VALUES (3385116, '2', 'Jose', 'Francisco', 'Figueroa', 'Castillo', TO_DATE('17-12-' || TO_CHAR(EXTRACT(YEAR FROM SYSDATE) - 44), 'DD-MM-YYYY'),
        415432086, 40);
INSERT INTO paciente
VALUES (5738855, '2', 'Evarista', 'Carmen', 'Riffo', 'Arroyo', TO_DATE('14-02-' || TO_CHAR(EXTRACT(YEAR FROM SYSDATE) - 45), 'DD-MM-YYYY'),
        414431983, 10);
INSERT INTO paciente
VALUES (6845014, '4', 'Manuel', 'Jesus', 'Munoz', 'Cabezas', TO_DATE('30-10-' || TO_CHAR(EXTRACT(YEAR FROM SYSDATE) - 47), 'DD-MM-YYYY'),
        418809142, 30);
INSERT INTO paciente
VALUES (10493740, '3', 'Carmela', 'Guacolda', 'Osses', 'Ramirez', TO_DATE('25-11-' || TO_CHAR(EXTRACT(YEAR FROM SYSDATE) - 48), 'DD-MM-YYYY'),
        415669938, 90);
INSERT INTO paciente
VALUES (5932711, '9', 'Marta', 'Elena', 'Valeria', 'Acuna', TO_DATE('04-10-' || TO_CHAR(EXTRACT(YEAR FROM SYSDATE) - 48), 'DD-MM-YYYY'),
        412627756, 20);
INSERT INTO paciente
VALUES (6655779, '0', 'Maria', 'Gabriela', 'Sanchez', 'Cid', TO_DATE('11-01-' || TO_CHAR(EXTRACT(YEAR FROM SYSDATE) - 50), 'DD-MM-YYYY'),
        414121203, 90);
INSERT INTO paciente
VALUES (4396440, '2', 'Luis', 'Mario', 'Diaz', 'Contreras', TO_DATE('25-01-' || TO_CHAR(EXTRACT(YEAR FROM SYSDATE) - 50), 'DD-MM-YYYY'),
        413424438, 50);
INSERT INTO paciente
VALUES (7603793, '0', 'Rina', 'Alme', 'Lavin', 'Escobar', TO_DATE('16-01-' || TO_CHAR(EXTRACT(YEAR FROM SYSDATE) - 52), 'DD-MM-YYYY'),
        412803051, 100);
INSERT INTO paciente
VALUES (5643549, '2', 'Ramon', 'Antonio', 'Contreras', 'Toledo', TO_DATE('24-02-' || TO_CHAR(EXTRACT(YEAR FROM SYSDATE) - 52), 'DD-MM-YYYY'),
        416840790, 90);
INSERT INTO paciente
VALUES (4273820, '4', 'Silda', 'Malvina', 'Gutierrez', 'Vidal', TO_DATE('04-03-' || TO_CHAR(EXTRACT(YEAR FROM SYSDATE) - 54), 'DD-MM-YYYY'),
        414844034, 40);
INSERT INTO paciente
VALUES (5537553, '4', 'Elia', 'Lupe', 'Cifuentes', 'Cifuentes', TO_DATE('08-03-' || TO_CHAR(EXTRACT(YEAR FROM SYSDATE) - 55), 'DD-MM-YYYY'),
        416306718, 30);
INSERT INTO paciente
VALUES (4410442, '3', 'Maria', 'Noemi', 'Meza', 'Fonseca', TO_DATE('05-03-' || TO_CHAR(EXTRACT(YEAR FROM SYSDATE) - 57), 'DD-MM-YYYY'),
        417885246, 40);
INSERT INTO paciente
VALUES (6776358, '0', 'Maria', 'Humilde', 'Veloso', 'Burgos', TO_DATE('10-10-' || TO_CHAR(EXTRACT(YEAR FROM SYSDATE) - 58), 'DD-MM-YYYY'),
        414616107, 50);
INSERT INTO paciente
VALUES (6603093, '8', 'Manuel', 'Humberto', 'Martinez', 'Moreno', TO_DATE('10-10-' || TO_CHAR(EXTRACT(YEAR FROM SYSDATE) - 58), 'DD-MM-YYYY'),
        417388714, 70);
INSERT INTO paciente
VALUES (7393396, 'K', 'Maria', 'Graciela', 'Montes', 'Bobadilla', TO_DATE('04-02-' || TO_CHAR(EXTRACT(YEAR FROM SYSDATE) - 59), 'DD-MM-YYYY'),
        416915736, 10);
INSERT INTO paciente
VALUES (3632537, '2', 'Homero', 'Jorge', 'Gonzalez', 'Sanhueza', TO_DATE('27-02-' || TO_CHAR(EXTRACT(YEAR FROM SYSDATE) - 59), 'DD-MM-YYYY'),
        412703452, 20);
INSERT INTO paciente
VALUES (5822189, '9', 'Sonia', 'Claudia', 'Gutierrez', 'Pedraza', TO_DATE('01-03-' || TO_CHAR(EXTRACT(YEAR FROM SYSDATE) - 61), 'DD-MM-YYYY'),
        416488227, 80);
INSERT INTO paciente
VALUES (8329433, '7', 'Eliana', 'Andrea', 'Liempi', 'Liempi', TO_DATE('29-08-' || TO_CHAR(EXTRACT(YEAR FROM SYSDATE) - 61), 'DD-MM-YYYY'),
        416116217, 80);
INSERT INTO paciente
VALUES (13604300, '5', 'Claudia', 'Soledad', 'Inzunza', 'Bravo', TO_DATE('21-10-' || TO_CHAR(EXTRACT(YEAR FROM SYSDATE) - 62), 'DD-MM-YYYY'),
        418591075, 10);
INSERT INTO paciente
VALUES (4989000, '1', 'Eliana', 'Clotilde', 'Sepulveda', 'Pena', TO_DATE('22-12-' || TO_CHAR(EXTRACT(YEAR FROM SYSDATE) - 62), 'DD-MM-YYYY'),
        417253732, 90);
INSERT INTO paciente
VALUES (8601391, '6', 'Hector', 'Claudio', 'Castillo', 'Castillo', TO_DATE('20-04-' || TO_CHAR(EXTRACT(YEAR FROM SYSDATE) - 63), 'DD-MM-YYYY'),
        412428209, 20);
INSERT INTO paciente
VALUES (7599430, '3', 'Monica', 'Rosario', 'Sepulveda', 'Carrasco', TO_DATE('3-08-' || TO_CHAR(EXTRACT(YEAR FROM SYSDATE) - 65), 'DD-MM-YYYY'),
        416716457, 10);
INSERT INTO paciente
VALUES (11959215, '1', 'Texia', 'Yaneth', 'Pena', 'Gutierrez', TO_DATE('02-03-' || TO_CHAR(EXTRACT(YEAR FROM SYSDATE) - 66), 'DD-MM-YYYY'),
        413158388, 80);
INSERT INTO paciente
VALUES (6407635, '3', 'Maria', 'Albertina', 'Rivera', 'Soto', TO_DATE('21-07-' || TO_CHAR(EXTRACT(YEAR FROM SYSDATE) - 66), 'DD-MM-YYYY'),
        413389873, 30);
INSERT INTO paciente
VALUES (3781561, '6', 'Maria', 'Lucila', 'Alarcon', 'Sepulveda', TO_DATE('16-04-' || TO_CHAR(EXTRACT(YEAR FROM SYSDATE) - 67), 'DD-MM-YYYY'),
        417792292, 100);
INSERT INTO paciente
VALUES (9851387, '6', 'Elba', 'Damaris', 'Castillo', 'Castillo', TO_DATE('08-02-' || TO_CHAR(EXTRACT(YEAR FROM SYSDATE) - 67), 'DD-MM-YYYY'),
        412959770, 50);
INSERT INTO paciente
VALUES (3900425, '9', 'Hernan', 'Eduardo', 'Echeverria', 'Juan', TO_DATE('25-03-' || TO_CHAR(EXTRACT(YEAR FROM SYSDATE) - 69), 'DD-MM-YYYY'),
        418348244, 20);
INSERT INTO paciente
VALUES (10006101, '5', 'Silvia', 'Ivonne', 'Cabezas', 'Lopez', TO_DATE('09-04-' || TO_CHAR(EXTRACT(YEAR FROM SYSDATE) - 70), 'DD-MM-YYYY'),
        418694997, 20);
INSERT INTO paciente
VALUES (7378093, '4', 'Prosperina', 'Ignacia', 'Figueroa', 'Becar',
        TO_DATE('08-05-' || TO_CHAR(EXTRACT(YEAR FROM SYSDATE) - 70), 'DD-MM-YYYY'), 417935482, 30);
INSERT INTO paciente
VALUES (3493962, '4', 'Jose', 'Romualdo', 'Romero', 'Romero', TO_DATE('29-11-' || TO_CHAR(EXTRACT(YEAR FROM SYSDATE) - 70), 'DD-MM-YYYY'),
        413231391, 20);
INSERT INTO paciente
VALUES (5348333, 'K', 'Maria', 'Marta', 'Cabezas', 'Arroyo', TO_DATE('30-03-' || TO_CHAR(EXTRACT(YEAR FROM SYSDATE) - 71), 'DD-MM-YYYY'),
        412770421, 10);
INSERT INTO paciente
VALUES (5000746, '4', 'Ana', 'Maria', 'Cisterna', 'Navarro', TO_DATE('19-12-' || TO_CHAR(EXTRACT(YEAR FROM SYSDATE) - 71), 'DD-MM-YYYY'),
        417686694, 10);
INSERT INTO paciente
VALUES (8484348, '2', 'Petronila', 'Orfelia', 'Escobar', 'Montero',
        TO_DATE('06-11-' || TO_CHAR(EXTRACT(YEAR FROM SYSDATE) - 74), 'DD-MM-YYYY'), 413588168, 20);
INSERT INTO paciente
VALUES (7800257, '3', 'Alfredo', 'Manuel', 'Medina', 'Montero', TO_DATE('30-11-' || TO_CHAR(EXTRACT(YEAR FROM SYSDATE) - 74), 'DD-MM-YYYY'),
        416274955, 30);
INSERT INTO paciente
VALUES (8918609, '9', 'Rosa', 'Carmen', 'Parra', 'Fonseca', TO_DATE('30-10-' || TO_CHAR(EXTRACT(YEAR FROM SYSDATE) - 75), 'DD-MM-YYYY'),
        412936524, 30);
INSERT INTO paciente
VALUES (12765836, '6', 'Manuel', 'Gonzalo', 'Aravena', 'Bobadilla',
        TO_DATE('26-02-' || TO_CHAR(EXTRACT(YEAR FROM SYSDATE) - 75), 'DD-MM-YYYY'), 418831088, 20);
INSERT INTO paciente
VALUES (7851700, 'K', 'Rosa', 'Grimilda', 'Cardenas', 'Moreno', TO_DATE('07-08-' || TO_CHAR(EXTRACT(YEAR FROM SYSDATE) - 77), 'DD-MM-YYYY'),
        417329451, 10);
INSERT INTO paciente
VALUES (3795697, 'K', 'Nelly', 'Carmen', 'Morales', 'Araneda', TO_DATE('02-10-' || TO_CHAR(EXTRACT(YEAR FROM SYSDATE) - 77), 'DD-MM-YYYY'),
        412153576, 30);
INSERT INTO paciente
VALUES (12765873, '0', 'Sergio', 'Jose', 'Hernandez', 'Zapata', TO_DATE('19-04-' || TO_CHAR(EXTRACT(YEAR FROM SYSDATE) - 78), 'DD-MM-YYYY'),
        413307241, 40);
INSERT INTO paciente
VALUES (3562788, 'K', 'Norma', 'Magdalena', 'Araneda', 'Araneda', TO_DATE('04-08-' || TO_CHAR(EXTRACT(YEAR FROM SYSDATE) - 79), 'DD-MM-YYYY'),
        418466801, 10);
INSERT INTO paciente
VALUES (7422084, '3', 'Jose', 'Segundo', 'Constanzo', 'Caceres', TO_DATE('09-08-' || TO_CHAR(EXTRACT(YEAR FROM SYSDATE) - 79), 'DD-MM-YYYY'),
        414665564, 40);
INSERT INTO paciente
VALUES (6415238, '6', 'Juan', 'Antonio', 'Medina', 'Medina', TO_DATE('29-04-' || TO_CHAR(EXTRACT(YEAR FROM SYSDATE) - 79), 'DD-MM-YYYY'),
        416938824, 20);
INSERT INTO paciente
VALUES (3754747, '6', 'Silvio', 'Erasmo', 'Pena', 'Gutierrez', TO_DATE('27-09-' || TO_CHAR(EXTRACT(YEAR FROM SYSDATE) - 79), 'DD-MM-YYYY'),
        416512973, 40);
INSERT INTO paciente
VALUES (9168286, '9', 'Luisa', 'Amalia', 'Chavarria', 'Mella', TO_DATE('12-12-' || TO_CHAR(EXTRACT(YEAR FROM SYSDATE) - 81), 'DD-MM-YYYY'),
        413809076, 20);
INSERT INTO paciente
VALUES (14438381, '8', 'Jorge', 'Antonio', 'Munoz', 'Lara', TO_DATE('03-04-' || TO_CHAR(EXTRACT(YEAR FROM SYSDATE) - 81), 'DD-MM-YYYY'),
        415197075, 40);
INSERT INTO paciente
VALUES (3911077, '6', 'Fidelina', 'Carmen', 'Sepulveda', 'Vega', TO_DATE('03-04-' || TO_CHAR(EXTRACT(YEAR FROM SYSDATE) - 83), 'DD-MM-YYYY'),
        414837119, 30);
INSERT INTO paciente
VALUES (5628094, '4', 'Nelly', 'Carmen', 'Torres', 'Sanhueza', TO_DATE('08-07-' || TO_CHAR(EXTRACT(YEAR FROM SYSDATE) - 83), 'DD-MM-YYYY'),
        414975945, 10);
INSERT INTO paciente
VALUES (5455736, '1', 'Gladys', 'Elena', 'Gonzalez', 'Cabezas', TO_DATE('05-06-' || TO_CHAR(EXTRACT(YEAR FROM SYSDATE) - 84), 'DD-MM-YYYY'),
        414285128, 30);
INSERT INTO paciente
VALUES (3331075, '7', 'Julia', 'Del Transito', 'Sobarzo', 'Peralta',
        TO_DATE('09-03-' || TO_CHAR(EXTRACT(YEAR FROM SYSDATE) - 84), 'DD-MM-YYYY'), 412963901, 30);
INSERT INTO paciente
VALUES (1105913, '9', 'Gerardo', 'German', 'Gonzalez', 'Bonta', TO_DATE('10-10-' || TO_CHAR(EXTRACT(YEAR FROM SYSDATE) - 85), 'DD-MM-YYYY'),
        413321635, 40);
INSERT INTO paciente
VALUES (11959885, '0', 'Jose', 'Enrique', 'Vasquez', 'Parra', TO_DATE('05-12-' || TO_CHAR(EXTRACT(YEAR FROM SYSDATE) - 85), 'DD-MM-YYYY'),
        414179335, 30);
INSERT INTO paciente
VALUES (4922881, '3', 'Irma', 'Maria', 'Garcia', 'Amdam', TO_DATE('29-05-' || TO_CHAR(EXTRACT(YEAR FROM SYSDATE) - 86), 'DD-MM-YYYY'),
        413321059, 10);
INSERT INTO paciente
VALUES (6626326, '6', 'Hector', 'Raimundo', 'Inzunza', 'Quevedo', TO_DATE('30-05-' || TO_CHAR(EXTRACT(YEAR FROM SYSDATE) - 87), 'DD-MM-YYYY'),
        416118789, 40);
INSERT INTO paciente
VALUES (6239390, '4', 'Rene', 'Heraldo', 'Hernandez', 'Amestica', TO_DATE('19-07-' || TO_CHAR(EXTRACT(YEAR FROM SYSDATE) - 88), 'DD-MM-YYYY'),
        414404176, 10);

INSERT INTO atencion
VALUES ('275', TO_DATE('23/11/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), '13:45', '43655', '7555800', '600', '8928585');
INSERT INTO atencion
VALUES ('276', TO_DATE('24/01/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '15:45', '21880', '6010332', '200', '3433444');
INSERT INTO atencion
VALUES ('277', TO_DATE('17/08/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), '13:15', '15207', '6231787', '900', '7378093');
INSERT INTO atencion
VALUES ('278', TO_DATE('17/09/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), '19:15', '15680', '6751207', '600', '7283959');
INSERT INTO atencion
VALUES ('279', TO_DATE('05/05/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), '13:30', '17141', '6543007', '700', '5649139');
INSERT INTO atencion
VALUES ('280', TO_DATE('07/01/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), '10:30', '18930', '3943337', '300', '7800257');
INSERT INTO atencion
VALUES ('281', TO_DATE('26/02/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), '10:30', '19273', '3027750', '700', '6845014');
INSERT INTO atencion
VALUES ('282', TO_DATE('04/10/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), '18:15', '17522', '3943337', '300', '8918609');
INSERT INTO atencion
VALUES ('283', TO_DATE('04/03/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), '10:45', '9924', '4582433', '100', '6110507');
INSERT INTO atencion
VALUES ('284', TO_DATE('05/05/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), '13:15', '36640', '5825975', '600', '4347082');
INSERT INTO atencion
VALUES ('285', TO_DATE('03/04/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '18:15', '16389', '3758049', '600', '4884829');
INSERT INTO atencion
VALUES ('286', TO_DATE('06/02/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '18:45', '15944', '6010332', '200', '5649139');
INSERT INTO atencion
VALUES ('287', TO_DATE('09/03/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), '11:45', '24431', '6135687', '100', '7800257');
INSERT INTO atencion
VALUES ('288', TO_DATE('12/07/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), '17:00', '50766', '3490261', '800', '6941733');
INSERT INTO atencion
VALUES ('289', TO_DATE('30/06/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), '18:15', '60861', '6543007', '700', '5643549');
INSERT INTO atencion
VALUES ('290', TO_DATE('05/09/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), '13:15', '37837', '6751207', '1500', '16204720');
INSERT INTO atencion
VALUES ('291', TO_DATE('02/06/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), '18:30', '46795', '6135687', '100', '7144708');
INSERT INTO atencion
VALUES ('292', TO_DATE('13/02/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), '11:15', '42851', '7555800', '600', '6400537');
INSERT INTO atencion
VALUES ('293', TO_DATE('10/03/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), '18:45', '14964', '6783834', '400', '5117349');
INSERT INTO atencion
VALUES ('294', TO_DATE('09/08/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), '16:30', '17529', '7555800', '1800', '7378093');
INSERT INTO atencion
VALUES ('295', TO_DATE('17/04/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '10:30', '10700', '5412514', '600', '10006101');
INSERT INTO atencion
VALUES ('296', TO_DATE('06/01/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), '11:45', '12548', '6135687', '100', '3493962');
INSERT INTO atencion
VALUES ('297', TO_DATE('20/07/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '13:45', '22905', '6010332', '200', '7378093');
INSERT INTO atencion
VALUES ('298', TO_DATE('01/08/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), '16:15', '52312', '3027750', '700', '4378812');
INSERT INTO atencion
VALUES ('299', TO_DATE('08/03/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '10:15', '3988', '6231787', '900', '5820729');
INSERT INTO atencion
VALUES ('300', TO_DATE('01/03/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), '11:30', '61573', '11959315', '800', '6239966');
INSERT INTO atencion
VALUES ('301', TO_DATE('22/01/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), '17:45', '6008', '10214564', '300', '5000746');
INSERT INTO atencion
VALUES ('302', TO_DATE('27/01/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), '20:30', '33035', '6117105', '200', '6215470');
INSERT INTO atencion
VALUES ('303', TO_DATE('30/03/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), '17:30', '32579', '6117105', '200', '3385116');
INSERT INTO atencion
VALUES ('304', TO_DATE('16/01/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), '16:00', '9435', '7555800', '600', '5738855');
INSERT INTO atencion
VALUES ('305', TO_DATE('25/03/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), '09:00', '12560', '3943337', '300', '5117349');
INSERT INTO atencion
VALUES ('307', TO_DATE('19/07/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), '13:30', '12581', '6475751', '200', '10066612');
INSERT INTO atencion
VALUES ('308', TO_DATE('05/09/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '15:30', '27056', '10834039', '1800', '6215470');
INSERT INTO atencion
VALUES ('309', TO_DATE('21/11/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), '19:45', '20657', '9169312', '400', '11959885');
INSERT INTO atencion
VALUES ('310', TO_DATE('15/01/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '18:15', '12112', '9169312', '400', '7851700');
INSERT INTO atencion
VALUES ('311', TO_DATE('23/11/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), '17:00', '35989', '6117105', '200', '9685598');
INSERT INTO atencion
VALUES ('312', TO_DATE('10/10/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), '11:30', '10248', '10214564', '300', '8484348');
INSERT INTO atencion
VALUES ('313', TO_DATE('03/08/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), '20:15', '25025', '10834039', '1800', '2576808');
INSERT INTO atencion
VALUES ('314', TO_DATE('28/02/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '16:15', '56144', '14284031', '400', '9851387');
INSERT INTO atencion
VALUES ('315', TO_DATE('03/02/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), '16:15', '62981', '6010332', '200', '5091732');
INSERT INTO atencion
VALUES ('316', TO_DATE('01/06/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), '10:30', '18610', '4582433', '1400', '7000164');
INSERT INTO atencion
VALUES ('317', TO_DATE('03/09/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '17:15', '18121', '13604392', '1100', '10006101');
INSERT INTO atencion
VALUES ('318', TO_DATE('10/09/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '13:15', '4628', '4808258', '700', '7393396');
INSERT INTO atencion
VALUES ('319', TO_DATE('21/01/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), '10:30', '10481', '3126425', '900', '3066256');
INSERT INTO atencion
VALUES ('320', TO_DATE('08/07/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '11:45', '25190', '5412514', '600', '3754747');
INSERT INTO atencion
VALUES ('321', TO_DATE('14/02/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '10:30', '33116', '11448750', '500', '4273820');
INSERT INTO atencion
VALUES ('322', TO_DATE('21/05/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), '09:00', '13040', '3027750', '700', '5932711');
INSERT INTO atencion
VALUES ('323', TO_DATE('29/07/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), '20:45', '7202', '5693955', '100', '7599430');
INSERT INTO atencion
VALUES ('324', TO_DATE('04/05/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '09:45', '50362', '14490825', '600', '6941733');
INSERT INTO atencion
VALUES ('325', TO_DATE('18/08/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), '13:45', '9506', '6783834', '400', '4922881');
INSERT INTO atencion
VALUES ('326', TO_DATE('25/05/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '15:45', '43297', '3027750', '700', '5822189');
INSERT INTO atencion
VALUES ('327', TO_DATE('26/03/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), '15:15', '22948', '7555800', '600', '3911077');
INSERT INTO atencion
VALUES ('328', TO_DATE('05/08/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '13:45', '12772', '7555800', '1800', '6415238');
INSERT INTO atencion
VALUES ('329', TO_DATE('17/01/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '10:00', '14582', '5825975', '600', '7599430');
INSERT INTO atencion
VALUES ('330', TO_DATE('21/03/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), '14:30', '13390', '11448750', '500', '10006101');
INSERT INTO atencion
VALUES ('331', TO_DATE('14/07/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '12:30', '22593', '6543007', '700', '7378093');
INSERT INTO atencion
VALUES ('332', TO_DATE('07/02/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), '12:00', '12445', '6475751', '200', '6239390');
INSERT INTO atencion
VALUES ('333', TO_DATE('03/03/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '18:30', '12766', '6475751', '200', '6415238');
INSERT INTO atencion
VALUES ('334', TO_DATE('15/02/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), '18:30', '22305', '11448750', '500', '8918609');
INSERT INTO atencion
VALUES ('335', TO_DATE('11/01/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), '12:15', '22250', '5693955', '100', '6407635');
INSERT INTO atencion
VALUES ('336', TO_DATE('02/03/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '12:30', '37544', '7555800', '1800', '7144708');
INSERT INTO atencion
VALUES ('337', TO_DATE('03/02/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), '15:00', '39229', '3126425', '900', '5091732');
INSERT INTO atencion
VALUES ('338', TO_DATE('27/01/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), '09:15', '15732', '6010332', '200', '6407635');
INSERT INTO atencion
VALUES ('339', TO_DATE('14/04/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '16:45', '29257', '3027750', '700', '15494012');
INSERT INTO atencion
VALUES ('340', TO_DATE('08/03/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), '13:30', '16883', '6783834', '400', '5932711');
INSERT INTO atencion
VALUES ('341', TO_DATE('17/02/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), '10:00', '15356', '11959315', '800', '9168286');
INSERT INTO atencion
VALUES ('342', TO_DATE('19/03/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '11:45', '46341', '6751207', '1500', '9851387');
INSERT INTO atencion
VALUES ('343', TO_DATE('10/01/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), '16:15', '12457', '14284031', '400', '4884829');
INSERT INTO atencion
VALUES ('344', TO_DATE('14/07/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), '12:45', '55013', '10214564', '300', '8329433');
INSERT INTO atencion
VALUES ('345', TO_DATE('08/08/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '19:00', '33542', '5412514', '600', '10805156');
INSERT INTO atencion
VALUES ('346', TO_DATE('02/02/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), '15:00', '3858', '14284031', '400', '5117349');
INSERT INTO atencion
VALUES ('347', TO_DATE('19/01/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), '09:15', '29262', '3126425', '900', '4410442');
INSERT INTO atencion
VALUES ('348', TO_DATE('07/03/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), '12:45', '50885', '6231787', '900', '10726792');
INSERT INTO atencion
VALUES ('349', TO_DATE('26/05/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '15:30', '28781', '6475751', '200', '4273820');
INSERT INTO atencion
VALUES ('350', TO_DATE('10/06/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), '11:45', '48628', '3943337', '300', '16204720');
INSERT INTO atencion
VALUES ('351', TO_DATE('12/02/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), '18:30', '51287', '11448750', '500', '8329433');
INSERT INTO atencion
VALUES ('352', TO_DATE('12/08/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), '17:15', '9906', '9827836', '100', '13604300');
INSERT INTO atencion
VALUES ('353', TO_DATE('25/01/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), '09:15', '13736', '9169312', '400', '5056163');
INSERT INTO atencion
VALUES ('354', TO_DATE('07/04/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '20:45', '50165', '3943337', '300', '7555810');
INSERT INTO atencion
VALUES ('355', TO_DATE('28/02/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '16:30', '2813', '5644453', '300', '13604300');
INSERT INTO atencion
VALUES ('356', TO_DATE('02/09/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), '11:00', '11129', '6231787', '900', '6415238');
INSERT INTO atencion
VALUES ('357', TO_DATE('02/03/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), '14:30', '46075', '5693955', '100', '4892956');
INSERT INTO atencion
VALUES ('358', TO_DATE('28/02/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), '11:15', '9454', '4582433', '100', '7393396');
INSERT INTO atencion
VALUES ('359', TO_DATE('15/08/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '10:15', '9846', '13604392', '1100', '6110507');
INSERT INTO atencion
VALUES ('360', TO_DATE('23/05/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '13:45', '50274', '6475751', '200', '12766479');
INSERT INTO atencion
VALUES ('361', TO_DATE('28/03/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '15:15', '16890', '3027750', '700', '3433444');
INSERT INTO atencion
VALUES ('362', TO_DATE('09/09/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), '10:15', '13244', '5412514', '600', '7393396');
INSERT INTO atencion
VALUES ('363', TO_DATE('03/05/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), '11:30', '13157', '6117105', '200', '12765836');
INSERT INTO atencion
VALUES ('364', TO_DATE('08/08/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), '10:15', '54810', '9827836', '100', '5822189');
INSERT INTO atencion
VALUES ('365', TO_DATE('25/06/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), '15:30', '12450', '11293307', '1400', '10066612');
INSERT INTO atencion
VALUES ('366', TO_DATE('25/03/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), '14:00', '55421', '14284031', '400', '9685598');
INSERT INTO atencion
VALUES ('367', TO_DATE('16/01/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), '19:00', '40977', '10834039', '600', '8329433');
INSERT INTO atencion
VALUES ('368', TO_DATE('30/08/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '18:45', '10697', '14490825', '1700', '5056163');
INSERT INTO atencion
VALUES ('369', TO_DATE('03/01/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), '10:30', '7218', '7555800', '600', '5056163');
INSERT INTO atencion
VALUES ('370', TO_DATE('30/06/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '11:15', '12739', '3027750', '700', '10066612');
INSERT INTO atencion
VALUES ('371', TO_DATE('15/01/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), '20:30', '61128', '3126425', '900', '5643549');
INSERT INTO atencion
VALUES ('372', TO_DATE('27/01/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), '13:00', '24383', '7555800', '600', '7283959');
INSERT INTO atencion
VALUES ('373', TO_DATE('12/07/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '11:00', '8704', '5644453', '300', '5738855');
INSERT INTO atencion
VALUES ('374', TO_DATE('27/01/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), '20:15', '22832', '3126425', '900', '3795697');
INSERT INTO atencion
VALUES ('376', TO_DATE('20/03/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), '14:00', '17888', '3027750', '700', '4389745');
INSERT INTO atencion
VALUES ('377', TO_DATE('16/10/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), '15:45', '55500', '3490261', '800', '6603093');
INSERT INTO atencion
VALUES ('378', TO_DATE('18/02/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), '18:00', '48197', '6231787', '900', '6655779');
INSERT INTO atencion
VALUES ('379', TO_DATE('25/08/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '18:15', '6505', '5693955', '100', '7851700');
INSERT INTO atencion
VALUES ('380', TO_DATE('29/07/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '14:00', '55120', '14284031', '400', '10493740');
INSERT INTO atencion
VALUES ('381', TO_DATE('08/01/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '15:00', '45878', '5644453', '300', '9851387');
INSERT INTO atencion
VALUES ('382', TO_DATE('11/04/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), '14:30', '46728', '5825975', '600', '9101755');
INSERT INTO atencion
VALUES ('383', TO_DATE('24/01/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), '17:45', '44604', '6475751', '200', '4744782');
INSERT INTO atencion
VALUES ('384', TO_DATE('02/08/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '11:30', '36144', '6117105', '200', '6239966');
INSERT INTO atencion
VALUES ('385', TO_DATE('14/01/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), '09:15', '30052', '9169312', '400', '3385116');
INSERT INTO atencion
VALUES ('386', TO_DATE('06/07/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), '20:45', '13913', '11959315', '800', '6340382');
INSERT INTO atencion
VALUES ('387', TO_DATE('20/03/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), '19:30', '48535', '4582433', '100', '5091732');
INSERT INTO atencion
VALUES ('388', TO_DATE('17/11/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), '19:30', '15946', '14490825', '600', '3900425');
INSERT INTO atencion
VALUES ('389', TO_DATE('03/09/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '11:15', '2885', '11293307', '1400', '5000746');
INSERT INTO atencion
VALUES ('390', TO_DATE('02/07/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), '13:30', '33807', '10834039', '1800', '4410442');
INSERT INTO atencion
VALUES ('391', TO_DATE('16/02/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), '18:15', '50268', '6783834', '400', '5822189');
INSERT INTO atencion
VALUES ('392', TO_DATE('02/02/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), '18:15', '47262', '9169312', '400', '9685598');
INSERT INTO atencion
VALUES ('393', TO_DATE('18/11/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), '13:45', '53679', '4808258', '700', '8671238');
INSERT INTO atencion
VALUES ('394', TO_DATE('23/08/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '15:45', '24870', '5825975', '600', '11574234');
INSERT INTO atencion
VALUES ('395', TO_DATE('05/01/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), '11:15', '42793', '11959315', '800', '9685598');
INSERT INTO atencion
VALUES ('396', TO_DATE('04/01/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '15:30', '18368', '3490261', '800', '11959885');
INSERT INTO atencion
VALUES ('397', TO_DATE('07/03/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), '14:45', '26252', '6751207', '600', '4273820');
INSERT INTO atencion
VALUES ('398', TO_DATE('16/02/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), '12:45', '35912', '5693955', '100', '6239966');
INSERT INTO atencion
VALUES ('399', TO_DATE('07/08/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '16:45', '11230', '5412514', '600', '7000164');
INSERT INTO atencion
VALUES ('400', TO_DATE('09/02/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), '17:15', '19023', '5693955', '100', '8601391');
INSERT INTO atencion
VALUES ('401', TO_DATE('15/02/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), '18:00', '3702', '3758049', '600', '5820729');
INSERT INTO atencion
VALUES ('402', TO_DATE('02/07/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), '11:00', '13900', '3943337', '300', '13770506');
INSERT INTO atencion
VALUES ('403', TO_DATE('12/08/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '18:15', '57156', '3490261', '800', '7144708');
INSERT INTO atencion
VALUES ('404', TO_DATE('06/08/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '14:30', '17159', '11293307', '1400', '4884829');
INSERT INTO atencion
VALUES ('405', TO_DATE('29/01/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), '15:15', '11206', '3027750', '700', '13604980');
INSERT INTO atencion
VALUES ('406', TO_DATE('18/03/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), '19:00', '59633', '11448750', '500', '4989000');
INSERT INTO atencion
VALUES ('407', TO_DATE('11/01/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), '14:45', '12892', '7555800', '1800', '9168286');
INSERT INTO atencion
VALUES ('408', TO_DATE('18/02/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '11:00', '4374', '9827836', '1900', '7393396');
INSERT INTO atencion
VALUES ('409', TO_DATE('07/06/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '17:00', '19600', '11448750', '500', '11959885');
INSERT INTO atencion
VALUES ('410', TO_DATE('23/11/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), '09:00', '49213', '6543007', '700', '8329433');
INSERT INTO atencion
VALUES ('411', TO_DATE('05/05/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '17:00', '49762', '11293307', '1400', '8329433');
INSERT INTO atencion
VALUES ('412', TO_DATE('25/02/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), '12:15', '28006', '5825975', '600', '6626326');
INSERT INTO atencion
VALUES ('413', TO_DATE('01/08/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), '09:00', '16077', '9169312', '400', '12765836');
INSERT INTO atencion
VALUES ('414', TO_DATE('10/01/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '19:45', '31771', '6117105', '200', '15494012');
INSERT INTO atencion
VALUES ('415', TO_DATE('22/05/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '12:00', '46303', '3027750', '700', '9685598');
INSERT INTO atencion
VALUES ('416', TO_DATE('15/09/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), '17:00', '32736', '6231787', '900', '3385116');
INSERT INTO atencion
VALUES ('417', TO_DATE('03/09/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), '13:00', '16402', '9827836', '1900', '7000164');
INSERT INTO atencion
VALUES ('418', TO_DATE('06/07/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '11:15', '15912', '14284031', '400', '7000164');
INSERT INTO atencion
VALUES ('419', TO_DATE('09/09/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '15:30', '45094', '6543007', '700', '8928585');
INSERT INTO atencion
VALUES ('420', TO_DATE('08/09/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '09:30', '10476', '4582433', '1400', '7851700');
INSERT INTO atencion
VALUES ('421', TO_DATE('12/08/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '10:00', '17561', '14284031', '400', '3493962');
INSERT INTO atencion
VALUES ('422', TO_DATE('08/01/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), '17:30', '15333', '6135687', '100', '9168286');
INSERT INTO atencion
VALUES ('423', TO_DATE('03/06/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), '11:45', '8651', '11293307', '1400', '6110507');
INSERT INTO atencion
VALUES ('424', TO_DATE('02/01/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '18:30', '44042', '6231787', '900', '6603093');
INSERT INTO atencion
VALUES ('425', TO_DATE('02/08/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), '12:30', '45588', '6231787', '900', '8284373');
INSERT INTO atencion
VALUES ('426', TO_DATE('20/09/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '09:45', '3052', '4808258', '700', '5000746');
INSERT INTO atencion
VALUES ('427', TO_DATE('16/07/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), '11:15', '22501', '7555800', '1800', '8918609');
INSERT INTO atencion
VALUES ('428', TO_DATE('13/01/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), '15:30', '50222', '9827836', '100', '6776358');
INSERT INTO atencion
VALUES ('429', TO_DATE('28/02/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '18:30', '19522', '7555800', '1800', '7000164');
INSERT INTO atencion
VALUES ('430', TO_DATE('23/11/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), '18:15', '42828', '5825975', '600', '6941733');
INSERT INTO atencion
VALUES ('431', TO_DATE('19/08/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '18:15', '63041', '7555800', '1800', '5091732');
INSERT INTO atencion
VALUES ('432', TO_DATE('20/03/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), '20:30', '28653', '3758049', '600', '12765873');
INSERT INTO atencion
VALUES ('434', TO_DATE('05/08/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), '16:15', '51733', '6543007', '700', '6941733');
INSERT INTO atencion
VALUES ('435', TO_DATE('19/01/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), '10:15', '10180', '7555800', '1800', '10006101');
INSERT INTO atencion
VALUES ('436', TO_DATE('09/11/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), '12:00', '25656', '6475751', '200', '6626326');
INSERT INTO atencion
VALUES ('437', TO_DATE('29/10/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), '10:30', '41297', '6135687', '100', '4989000');
INSERT INTO atencion
VALUES ('438', TO_DATE('04/08/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), '12:30', '41383', '6783834', '400', '4989000');
INSERT INTO atencion
VALUES ('439', TO_DATE('17/02/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), '09:00', '11410', '13604392', '1100', '3900425');
INSERT INTO atencion
VALUES ('440', TO_DATE('03/01/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), '15:15', '10370', '3758049', '600', '10066612');
INSERT INTO atencion
VALUES ('441', TO_DATE('18/08/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '13:15', '53780', '5825975', '600', '6655779');
INSERT INTO atencion
VALUES ('442', TO_DATE('08/03/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), '11:45', '11017', '5825975', '600', '8484348');
INSERT INTO atencion
VALUES ('443', TO_DATE('25/05/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '16:00', '10377', '9827836', '1900', '5056163');
INSERT INTO atencion
VALUES ('444', TO_DATE('12/05/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), '16:00', '33081', '11959315', '800', '4273820');
INSERT INTO atencion
VALUES ('445', TO_DATE('11/02/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), '10:15', '27901', '4582433', '100', '12765873');
INSERT INTO atencion
VALUES ('446', TO_DATE('01/03/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), '12:45', '62707', '6751207', '1500', '8329433');
INSERT INTO atencion
VALUES ('447', TO_DATE('02/01/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), '15:30', '47596', '4582433', '100', '4347082');
INSERT INTO atencion
VALUES ('448', TO_DATE('14/05/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), '18:15', '46474', '10834039', '600', '6400537');
INSERT INTO atencion
VALUES ('149', TO_DATE('07/06/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), '12:00', '17337', '4582433', '1400', '3632537');
INSERT INTO atencion
VALUES ('150', TO_DATE('20/08/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '13:15', '18015', '3490261', '800', '9168286');
INSERT INTO atencion
VALUES ('151', TO_DATE('05/03/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '15:00', '14248', '7555800', '1800', '7393396');
INSERT INTO atencion
VALUES ('152', TO_DATE('14/07/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), '18:15', '10804', '7555800', '1800', '12765836');
INSERT INTO atencion
VALUES ('153', TO_DATE('19/07/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '18:15', '32494', '4808258', '700', '7422084');
INSERT INTO atencion
VALUES ('154', TO_DATE('23/03/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '18:30', '36151', '11959315', '800', '8162534');
INSERT INTO atencion
VALUES ('155', TO_DATE('23/08/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '16:00', '16843', '5644453', '300', '8484348');
INSERT INTO atencion
VALUES ('156', TO_DATE('11/08/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '17:00', '32612', '10214564', '300', '4410442');
INSERT INTO atencion
VALUES ('157', TO_DATE('19/04/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '20:00', '16270', '3126425', '900', '11574234');
INSERT INTO atencion
VALUES ('158', TO_DATE('23/02/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), '12:00', '10696', '3126425', '900', '6110507');
INSERT INTO atencion
VALUES ('159', TO_DATE('13/01/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), '15:45', '53095', '10834039', '1800', '16204720');
INSERT INTO atencion
VALUES ('160', TO_DATE('24/05/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), '13:30', '22442', '11293307', '1400', '6845014');
INSERT INTO atencion
VALUES ('161', TO_DATE('15/08/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '09:15', '46137', '4808258', '700', '6776358');
INSERT INTO atencion
VALUES ('162', TO_DATE('04/04/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '17:15', '14995', '13604392', '1100', '5056163');
INSERT INTO atencion
VALUES ('163', TO_DATE('16/02/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), '09:45', '11122', '11959315', '800', '12765836');
INSERT INTO atencion
VALUES ('164', TO_DATE('10/01/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), '15:45', '29874', '3758049', '600', '4410442');
INSERT INTO atencion
VALUES ('165', TO_DATE('11/11/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), '19:15', '60325', '6010332', '200', '11959215');
INSERT INTO atencion
VALUES ('166', TO_DATE('15/01/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '15:00', '31662', '11448750', '500', '12765873');
INSERT INTO atencion
VALUES ('167', TO_DATE('04/09/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '14:45', '54681', '3126425', '900', '6655779');
INSERT INTO atencion
VALUES ('168', TO_DATE('19/07/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '19:15', '7218', '3758049', '600', '7393396');
INSERT INTO atencion
VALUES ('169', TO_DATE('11/08/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '18:00', '44941', '14284031', '400', '9851387');
INSERT INTO atencion
VALUES ('170', TO_DATE('13/08/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '16:30', '57459', '5644453', '300', '4378812');
INSERT INTO atencion
VALUES ('171', TO_DATE('03/08/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '17:00', '22242', '7555800', '1800', '11574234');
INSERT INTO atencion
VALUES ('172', TO_DATE('22/05/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), '14:15', '16914', '9169312', '400', '11959885');
INSERT INTO atencion
VALUES ('173', TO_DATE('12/08/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '17:00', '10384', '5412514', '600', '13604300');
INSERT INTO atencion
VALUES ('174', TO_DATE('02/08/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '09:45', '64439', '3490261', '800', '6239966');
INSERT INTO atencion
VALUES ('175', TO_DATE('04/09/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), '14:00', '54959', '7555800', '1800', '16204720');
INSERT INTO atencion
VALUES ('176', TO_DATE('19/01/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '18:30', '38282', '14490825', '1700', '6400537');
INSERT INTO atencion
VALUES ('177', TO_DATE('12/07/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '11:30', '16245', '4808258', '700', '10006101');
INSERT INTO atencion
VALUES ('178', TO_DATE('10/08/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '14:30', '21259', '6135687', '100', '5455736');
INSERT INTO atencion
VALUES ('179', TO_DATE('11/06/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), '15:45', '14337', '10834039', '600', '3493962');
INSERT INTO atencion
VALUES ('180', TO_DATE('01/05/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '16:45', '52145', '6231787', '900', '10493740');
INSERT INTO atencion
VALUES ('181', TO_DATE('12/09/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '13:00', '49583', '7555800', '1800', '16204720');
INSERT INTO atencion
VALUES ('182', TO_DATE('09/02/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '17:30', '53843', '6231787', '900', '9685598');
INSERT INTO atencion
VALUES ('183', TO_DATE('16/07/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '12:15', '25634', '6475751', '200', '4273820');
INSERT INTO atencion
VALUES ('184', TO_DATE('25/02/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), '15:00', '44346', '6751207', '1500', '6603093');
INSERT INTO atencion
VALUES ('185', TO_DATE('30/01/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), '18:00', '52586', '7555800', '600', '6603093');
INSERT INTO atencion
VALUES ('186', TO_DATE('17/02/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), '09:15', '21989', '7555800', '600', '3433444');
INSERT INTO atencion
VALUES ('187', TO_DATE('16/02/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '10:30', '61799', '11959315', '800', '10726792');
INSERT INTO atencion
VALUES ('188', TO_DATE('04/03/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), '16:15', '60725', '14284031', '400', '5091732');
INSERT INTO atencion
VALUES ('189', TO_DATE('13/01/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), '12:30', '42571', '14284031', '400', '9101755');
INSERT INTO atencion
VALUES ('190', TO_DATE('23/09/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), '19:30', '18044', '4582433', '1400', '4389745');
INSERT INTO atencion
VALUES ('191', TO_DATE('21/08/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '17:45', '9549', '6751207', '1500', '5056163');
INSERT INTO atencion
VALUES ('192', TO_DATE('25/08/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '13:45', '55587', '6117105', '200', '4347082');
INSERT INTO atencion
VALUES ('193', TO_DATE('01/09/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '13:30', '16581', '4808258', '700', '7000164');
INSERT INTO atencion
VALUES ('194', TO_DATE('12/03/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), '17:00', '41381', '10834039', '1800', '16204720');
INSERT INTO atencion
VALUES ('195', TO_DATE('03/06/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), '18:45', '8482', '5825975', '600', '6110507');
INSERT INTO atencion
VALUES ('196', TO_DATE('27/01/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), '14:15', '18443', '6751207', '1500', '5537553');
INSERT INTO atencion
VALUES ('197', TO_DATE('02/03/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '14:00', '23350', '3758049', '600', '11574234');
INSERT INTO atencion
VALUES ('198', TO_DATE('06/08/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '20:00', '57098', '5412514', '600', '4378812');
INSERT INTO atencion
VALUES ('199', TO_DATE('05/04/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), '17:30', '16502', '4582433', '100', '6340382');
INSERT INTO atencion
VALUES ('200', TO_DATE('03/09/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '15:30', '16621', '6543007', '700', '8918609');
INSERT INTO atencion
VALUES ('201', TO_DATE('27/04/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '14:30', '12390', '6543007', '700', '13770506');
INSERT INTO atencion
VALUES ('202', TO_DATE('05/03/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), '12:15', '25129', '7555800', '600', '6626326');
INSERT INTO atencion
VALUES ('203', TO_DATE('21/03/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), '19:30', '26737', '6475751', '200', '3754747');
INSERT INTO atencion
VALUES ('204', TO_DATE('29/05/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), '14:15', '8964', '6475751', '200', '13604980');
INSERT INTO atencion
VALUES ('205', TO_DATE('29/08/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '15:45', '15798', '7555800', '1800', '6407635');
INSERT INTO atencion
VALUES ('206', TO_DATE('30/07/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '14:45', '11713', '7555800', '1800', '13770506');
INSERT INTO atencion
VALUES ('207', TO_DATE('13/10/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), '14:00', '40849', '11448750', '500', '4426899');
INSERT INTO atencion
VALUES ('208', TO_DATE('13/04/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '14:15', '13043', '6135687', '100', '9168286');
INSERT INTO atencion
VALUES ('209', TO_DATE('16/06/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), '17:30', '58280', '10834039', '600', '4744782');
INSERT INTO atencion
VALUES ('210', TO_DATE('17/03/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), '10:00', '24883', '3490261', '800', '7283959');
INSERT INTO atencion
VALUES ('211', TO_DATE('22/06/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '17:00', '3634', '3758049', '600', '5348333');
INSERT INTO atencion
VALUES ('212', TO_DATE('30/08/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), '09:45', '64596', '4808258', '700', '4892956');
INSERT INTO atencion
VALUES ('213', TO_DATE('03/03/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), '15:00', '59560', '5825975', '600', '8329433');
INSERT INTO atencion
VALUES ('214', TO_DATE('30/11/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), '13:30', '13402', '11448750', '500', '5932711');
INSERT INTO atencion
VALUES ('215', TO_DATE('27/01/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), '18:45', '15393', '4808258', '700', '3331075');
INSERT INTO atencion
VALUES ('216', TO_DATE('11/09/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '09:30', '8701', '5644453', '300', '3562788');
INSERT INTO atencion
VALUES ('217', TO_DATE('18/05/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '09:30', '33532', '3758049', '600', '10805156');
INSERT INTO atencion
VALUES ('218', TO_DATE('24/08/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '14:45', '30420', '7555800', '1800', '4410442');
INSERT INTO atencion
VALUES ('219', TO_DATE('13/02/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), '13:00', '13546', '6010332', '200', '5820729');
INSERT INTO atencion
VALUES ('220', TO_DATE('08/08/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), '13:00', '42495', '3126425', '900', '12766479');
INSERT INTO atencion
VALUES ('221', TO_DATE('12/01/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), '15:15', '42441', '11959315', '800', '4892956');
INSERT INTO atencion
VALUES ('222', TO_DATE('20/07/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), '09:15', '40100', '9827836', '1900', '9101755');
INSERT INTO atencion
VALUES ('223', TO_DATE('23/07/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), '17:15', '35611', '5825975', '600', '8162534');
INSERT INTO atencion
VALUES ('224', TO_DATE('20/09/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '19:45', '62937', '5825975', '600', '8284373');
INSERT INTO atencion
VALUES ('225', TO_DATE('15/09/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '18:15', '43176', '11448750', '500', '4892956');
INSERT INTO atencion
VALUES ('226', TO_DATE('25/09/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), '18:00', '18768', '9169312', '400', '5537553');
INSERT INTO atencion
VALUES ('227', TO_DATE('09/06/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), '13:00', '13517', '5644453', '300', '6239390');
INSERT INTO atencion
VALUES ('228', TO_DATE('18/01/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '16:15', '20064', '5644453', '300', '3911077');
INSERT INTO atencion
VALUES ('229', TO_DATE('18/03/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '10:15', '57894', '10834039', '1800', '6941733');
INSERT INTO atencion
VALUES ('230', TO_DATE('04/10/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), '15:15', '38243', '4582433', '1400', '9101755');
INSERT INTO atencion
VALUES ('231', TO_DATE('18/10/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), '12:30', '14018', '6783834', '400', '3493962');
INSERT INTO atencion
VALUES ('232', TO_DATE('18/11/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), '19:30', '50303', '4808258', '700', '4892956');
INSERT INTO atencion
VALUES ('233', TO_DATE('10/02/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), '10:15', '14284', '7555800', '600', '7599430');
INSERT INTO atencion
VALUES ('234', TO_DATE('08/09/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), '14:30', '26319', '11448750', '500', '3754747');
INSERT INTO atencion
VALUES ('235', TO_DATE('26/05/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '11:00', '18594', '6783834', '400', '3433444');
INSERT INTO atencion
VALUES ('236', TO_DATE('05/09/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '17:45', '38944', '14490825', '1700', '8928585');
INSERT INTO atencion
VALUES ('237', TO_DATE('04/07/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '13:30', '13832', '14284031', '400', '10006101');
INSERT INTO atencion
VALUES ('238', TO_DATE('03/09/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '17:30', '62765', '6117105', '200', '9101755');
INSERT INTO atencion
VALUES ('239', TO_DATE('09/03/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), '09:15', '58973', '6543007', '700', '6655779');
INSERT INTO atencion
VALUES ('240', TO_DATE('26/04/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), '10:00', '11089', '5644453', '300', '8601391');
INSERT INTO atencion
VALUES ('241', TO_DATE('06/03/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '13:00', '28135', '13604392', '1100', '6626326');
INSERT INTO atencion
VALUES ('242', TO_DATE('24/01/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '09:00', '59650', '9827836', '1900', '8928585');
INSERT INTO atencion
VALUES ('243', TO_DATE('25/11/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), '10:30', '47570', '3027750', '700', '9851387');
INSERT INTO atencion
VALUES ('244', TO_DATE('22/03/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '09:15', '24516', '4582433', '100', '3433444');
INSERT INTO atencion
VALUES ('245', TO_DATE('08/10/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), '17:30', '15831', '5825975', '600', '10006101');
INSERT INTO atencion
VALUES ('246', TO_DATE('11/09/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), '18:00', '47489', '14490825', '600', '6239966');
INSERT INTO atencion
VALUES ('247', TO_DATE('29/08/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), '17:45', '55667', '3126425', '900', '16204720');
INSERT INTO atencion
VALUES ('248', TO_DATE('19/09/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), '09:00', '12563', '3027750', '700', '4922881');
INSERT INTO atencion
VALUES ('249', TO_DATE('26/02/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), '11:15', '17580', '6751207', '600', '4389745');
INSERT INTO atencion
VALUES ('250', TO_DATE('10/09/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), '20:00', '14935', '4582433', '100', '6110507');
INSERT INTO atencion
VALUES ('251', TO_DATE('16/10/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), '13:30', '29772', '3126425', '900', '6626326');
INSERT INTO atencion
VALUES ('252', TO_DATE('23/01/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), '09:00', '33800', '11293307', '100', '2576808');
INSERT INTO atencion
VALUES ('253', TO_DATE('06/02/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '15:30', '4759', '5644453', '300', '3562788');
INSERT INTO atencion
VALUES ('254', TO_DATE('17/02/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), '09:45', '27447', '6231787', '900', '4603482');
INSERT INTO atencion
VALUES ('255', TO_DATE('18/06/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '13:15', '17896', '5825975', '600', '9168286');
INSERT INTO atencion
VALUES ('256', TO_DATE('12/03/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), '11:30', '14256', '10834039', '600', '10006101');
INSERT INTO atencion
VALUES ('257', TO_DATE('17/03/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '13:15', '24393', '13604392', '1100', '7283959');
INSERT INTO atencion
VALUES ('258', TO_DATE('28/02/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), '18:45', '33379', '6751207', '600', '7422084');
INSERT INTO atencion
VALUES ('259', TO_DATE('25/05/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '18:00', '25637', '6117105', '200', '1105913');
INSERT INTO atencion
VALUES ('260', TO_DATE('02/09/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '18:00', '52231', '11293307', '1400', '9101755');
INSERT INTO atencion
VALUES ('261', TO_DATE('14/01/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), '11:45', '50705', '3490261', '800', '5091732');
INSERT INTO atencion
VALUES ('262', TO_DATE('19/11/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), '09:00', '6598', '5693955', '100', '7599430');
INSERT INTO atencion
VALUES ('263', TO_DATE('25/08/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '14:30', '63528', '14284031', '400', '12766479');
INSERT INTO atencion
VALUES ('264', TO_DATE('14/03/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '13:00', '10022', '3758049', '600', '5820729');
INSERT INTO atencion
VALUES ('265', TO_DATE('25/03/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), '13:15', '11504', '3490261', '800', '5738855');
INSERT INTO atencion
VALUES ('266', TO_DATE('18/06/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), '09:30', '34752', '5644453', '300', '7422084');
INSERT INTO atencion
VALUES ('267', TO_DATE('29/07/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '15:15', '11493', '3126425', '900', '6340382');
INSERT INTO atencion
VALUES ('268', TO_DATE('01/02/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), '17:45', '38153', '9169312', '400', '6655779');
INSERT INTO atencion
VALUES ('269', TO_DATE('02/09/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '19:45', '56598', '10834039', '1800', '4378812');
INSERT INTO atencion
VALUES ('270', TO_DATE('03/05/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), '13:00', '55768', '6135687', '100', '5643549');
INSERT INTO atencion
VALUES ('271', TO_DATE('26/06/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), '17:00', '18072', '6783834', '400', '7800257');
INSERT INTO atencion
VALUES ('272', TO_DATE('01/08/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), '12:30', '41708', '6475751', '200', '6239966');
INSERT INTO atencion
VALUES ('273', TO_DATE('10/09/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '18:00', '10408', '10834039', '1800', '3900425');
INSERT INTO atencion
VALUES ('274', TO_DATE('11/09/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '18:30', '51144', '7555800', '1800', '5643549');
INSERT INTO atencion
VALUES ('449', TO_DATE('05/03/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), '09:00', '60380', '5412514', '600', '12766479');
INSERT INTO atencion
VALUES ('450', TO_DATE('20/06/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), '16:30', '16925', '6543007', '700', '7283959');
INSERT INTO atencion
VALUES ('451', TO_DATE('22/09/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), '13:30', '16734', '6231787', '900', '3433444');
INSERT INTO atencion
VALUES ('452', TO_DATE('24/03/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), '15:00', '11348', '6231787', '900', '10006101');
INSERT INTO atencion
VALUES ('453', TO_DATE('25/02/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '16:00', '18846', '4582433', '1400', '3795697');
INSERT INTO atencion
VALUES ('454', TO_DATE('09/07/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), '11:15', '22243', '6751207', '1500', '7378093');
INSERT INTO atencion
VALUES ('456', TO_DATE('09/10/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), '19:15', '58981', '7555800', '1800', '6400537');
INSERT INTO atencion
VALUES ('457', TO_DATE('02/02/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), '19:45', '6705', '5825975', '600', '13604980');
INSERT INTO atencion
VALUES ('458', TO_DATE('05/10/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), '17:30', '19939', '9827836', '100', '3331075');
INSERT INTO atencion
VALUES ('459', TO_DATE('01/07/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), '10:15', '17346', '6543007', '700', '3632537');
INSERT INTO atencion
VALUES ('460', TO_DATE('07/07/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '11:30', '14977', '6783834', '400', '13604300');
INSERT INTO atencion
VALUES ('461', TO_DATE('02/07/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '14:15', '39560', '13604392', '1100', '4744782');
INSERT INTO atencion
VALUES ('462', TO_DATE('03/01/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), '11:30', '37562', '3126425', '900', '8329433');
INSERT INTO atencion
VALUES ('463', TO_DATE('11/02/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '18:45', '28131', '3490261', '800', '10805156');
INSERT INTO atencion
VALUES ('464', TO_DATE('20/03/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), '16:15', '18540', '11448750', '500', '11959885');
INSERT INTO atencion
VALUES ('465', TO_DATE('07/11/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), '18:00', '61784', '4808258', '700', '6655779');
INSERT INTO atencion
VALUES ('466', TO_DATE('29/05/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), '17:45', '4910', '6231787', '900', '13604980');
INSERT INTO atencion
VALUES ('467', TO_DATE('04/02/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), '11:15', '50552', '6010332', '200', '12766479');
INSERT INTO atencion
VALUES ('468', TO_DATE('03/03/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '20:15', '50930', '9827836', '1900', '16204720');
INSERT INTO atencion
VALUES ('469', TO_DATE('10/04/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), '12:15', '33068', '4582433', '100', '3385116');
INSERT INTO atencion
VALUES ('470', TO_DATE('12/01/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), '19:30', '32628', '3490261', '800', '6215470');
INSERT INTO atencion
VALUES ('471', TO_DATE('23/06/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), '11:30', '44930', '4808258', '700', '5643549');
INSERT INTO atencion
VALUES ('472', TO_DATE('03/05/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), '14:30', '10174', '6117105', '200', '9168286');
INSERT INTO atencion
VALUES ('473', TO_DATE('18/04/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), '09:00', '15986', '9827836', '100', '6415238');
INSERT INTO atencion
VALUES ('474', TO_DATE('24/04/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '18:30', '61147', '11448750', '500', '16204720');
INSERT INTO atencion
VALUES ('475', TO_DATE('01/02/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), '17:00', '38515', '14284031', '400', '9685598');
INSERT INTO atencion
VALUES ('476', TO_DATE('26/03/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), '17:30', '28705', '7555800', '600', '6215470');
INSERT INTO atencion
VALUES ('477', TO_DATE('09/08/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '18:30', '52878', '11293307', '1400', '4426899');
INSERT INTO atencion
VALUES ('478', TO_DATE('19/02/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), '16:45', '20445', '3943337', '300', '11959885');
INSERT INTO atencion
VALUES ('479', TO_DATE('15/05/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '16:15', '23571', '6117105', '200', '11959885');
INSERT INTO atencion
VALUES ('480', TO_DATE('02/02/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), '16:15', '16371', '6135687', '100', '4884829');
INSERT INTO atencion
VALUES ('481', TO_DATE('09/01/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), '16:45', '8245', '7555800', '600', '6239390');
INSERT INTO atencion
VALUES ('482', TO_DATE('16/03/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), '12:30', '24238', '10834039', '1800', '5649139');
INSERT INTO atencion
VALUES ('483', TO_DATE('25/04/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), '12:15', '13280', '7555800', '1800', '6239390');
INSERT INTO atencion
VALUES ('484', TO_DATE('17/07/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '16:15', '62962', '3758049', '600', '10493740');
INSERT INTO atencion
VALUES ('485', TO_DATE('02/07/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '17:00', '19111', '14490825', '1700', '3493962');
INSERT INTO atencion
VALUES ('486', TO_DATE('13/01/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '13:45', '48595', '6475751', '200', '7555810');
INSERT INTO atencion
VALUES ('487', TO_DATE('03/06/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '18:15', '49037', '14490825', '600', '10493740');
INSERT INTO atencion
VALUES ('488', TO_DATE('24/07/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), '12:30', '23748', '5644453', '300', '7800257');
INSERT INTO atencion
VALUES ('489', TO_DATE('10/02/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), '14:30', '9135', '3490261', '800', '6239390');
INSERT INTO atencion
VALUES ('490', TO_DATE('04/08/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), '16:00', '17732', '6231787', '900', '13770506');
INSERT INTO atencion
VALUES ('491', TO_DATE('17/01/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), '17:30', '45711', '11959315', '800', '8162534');
INSERT INTO atencion
VALUES ('492', TO_DATE('02/08/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '20:30', '32330', '3490261', '800', '7422084');
INSERT INTO atencion
VALUES ('493', TO_DATE('15/02/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), '09:15', '18151', '5825975', '600', '10066612');
INSERT INTO atencion
VALUES ('494', TO_DATE('20/01/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), '09:15', '38859', '5644453', '300', '8284373');
INSERT INTO atencion
VALUES ('495', TO_DATE('23/05/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '17:30', '25826', '10214564', '300', '3385116');
INSERT INTO atencion
VALUES ('496', TO_DATE('09/03/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), '13:00', '36254', '10214564', '300', '5091732');
INSERT INTO atencion
VALUES ('497', TO_DATE('25/02/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), '16:00', '5594', '10834039', '600', '5000746');
INSERT INTO atencion
VALUES ('498', TO_DATE('01/10/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), '19:00', '14911', '11959315', '800', '13770506');
INSERT INTO atencion
VALUES ('499', TO_DATE('17/08/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '17:00', '14422', '9827836', '1900', '5820729');
INSERT INTO atencion
VALUES ('500', TO_DATE('21/08/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '18:00', '26338', '7555800', '1800', '12765873');
INSERT INTO atencion
VALUES ('501', TO_DATE('16/06/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), '17:30', '15629', '3943337', '300', '10066612');
INSERT INTO atencion
VALUES ('502', TO_DATE('05/08/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '20:30', '12558', '11293307', '1400', '6415238');
INSERT INTO atencion
VALUES ('503', TO_DATE('27/11/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), '19:30', '56925', '5693955', '100', '6239966');
INSERT INTO atencion
VALUES ('504', TO_DATE('11/06/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), '14:45', '6286', '9827836', '100', '7393396');
INSERT INTO atencion
VALUES ('505', TO_DATE('16/08/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '14:45', '38419', '6135687', '100', '5822189');
INSERT INTO atencion
VALUES ('506', TO_DATE('10/01/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), '12:15', '26598', '3027750', '700', '3754747');
INSERT INTO atencion
VALUES ('507', TO_DATE('04/07/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '13:00', '40991', '10214564', '300', '9685598');
INSERT INTO atencion
VALUES ('508', TO_DATE('05/09/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '13:00', '48559', '5412514', '600', '7144708');
INSERT INTO atencion
VALUES ('509', TO_DATE('14/03/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), '12:30', '7299', '13604392', '1100', '7393396');
INSERT INTO atencion
VALUES ('510', TO_DATE('22/05/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '13:45', '18938', '3126425', '900', '11959885');
INSERT INTO atencion
VALUES ('511', TO_DATE('08/04/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), '18:30', '14449', '6783834', '400', '3562788');
INSERT INTO atencion
VALUES ('512', TO_DATE('28/04/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), '09:15', '11059', '3943337', '300', '7000164');
INSERT INTO atencion
VALUES ('513', TO_DATE('11/04/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '11:45', '49490', '11448750', '500', '4989000');
INSERT INTO atencion
VALUES ('514', TO_DATE('04/01/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), '16:45', '45008', '11448750', '500', '4396440');
INSERT INTO atencion
VALUES ('515', TO_DATE('09/07/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), '20:30', '10734', '5412514', '600', '5056163');
INSERT INTO atencion
VALUES ('516', TO_DATE('13/07/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), '20:00', '7643', '10834039', '600', '7393396');
INSERT INTO atencion
VALUES ('517', TO_DATE('14/01/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), '11:45', '14048', '6783834', '400', '5056163');
INSERT INTO atencion
VALUES ('518', TO_DATE('12/01/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '14:15', '16234', '6751207', '600', '9168286');
INSERT INTO atencion
VALUES ('519', TO_DATE('15/01/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), '17:15', '56304', '11959315', '800', '5643549');
INSERT INTO atencion
VALUES ('520', TO_DATE('22/04/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '12:45', '34919', '11959315', '800', '10805156');
INSERT INTO atencion
VALUES ('521', TO_DATE('08/04/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '09:45', '8826', '3126425', '900', '13604300');
INSERT INTO atencion
VALUES ('522', TO_DATE('11/03/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), '10:30', '35411', '11959315', '800', '10726792');
INSERT INTO atencion
VALUES ('523', TO_DATE('10/05/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), '10:00', '40886', '14490825', '600', '7555810');
INSERT INTO atencion
VALUES ('524', TO_DATE('28/02/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), '17:30', '39804', '7555800', '600', '8284373');
INSERT INTO atencion
VALUES ('525', TO_DATE('10/08/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), '12:30', '13147', '11293307', '1400', '3066256');
INSERT INTO atencion
VALUES ('526', TO_DATE('23/09/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), '19:15', '12999', '6751207', '1500', '5820729');
INSERT INTO atencion
VALUES ('527', TO_DATE('27/07/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '09:00', '20351', '11959315', '800', '3911077');
INSERT INTO atencion
VALUES ('528', TO_DATE('02/09/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '10:15', '27009', '11448750', '500', '7422084');
INSERT INTO atencion
VALUES ('529', TO_DATE('19/08/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '09:30', '16473', '5644453', '300', '6415238');
INSERT INTO atencion
VALUES ('530', TO_DATE('07/09/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '18:30', '55253', '4582433', '1400', '9851387');
INSERT INTO atencion
VALUES ('531', TO_DATE('14/06/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '13:30', '36071', '3490261', '800', '4396440');
INSERT INTO atencion
VALUES ('532', TO_DATE('02/08/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), '15:45', '58181', '9827836', '100', '4744782');
INSERT INTO atencion
VALUES ('533', TO_DATE('08/01/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), '19:45', '6550', '3126425', '900', '7851700');
INSERT INTO atencion
VALUES ('534', TO_DATE('11/06/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '20:0', '56034', '3126425', '900', '12766479');
INSERT INTO atencion
VALUES ('535', TO_DATE('07/04/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), '20:00', '52000', '6231787', '900', '4892956');
INSERT INTO atencion
VALUES ('536', TO_DATE('19/08/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), '13:45', '8491', '3758049', '600', '13604980');
INSERT INTO atencion
VALUES ('537', TO_DATE('14/03/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), '12:00', '10839', '5693955', '100', '5628094');
INSERT INTO atencion
VALUES ('538', TO_DATE('03/11/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), '12:15', '38218', '7555800', '1800', '4744782');
INSERT INTO atencion
VALUES ('539', TO_DATE('19/04/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), '20:30', '18689', '6543007', '700', '3632537');
INSERT INTO atencion
VALUES ('540', TO_DATE('02/05/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '11:15', '14343', '9827836', '1900', '5628094');
INSERT INTO atencion
VALUES ('541', TO_DATE('25/10/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), '20:15', '11403', '6475751', '200', '12765836');
INSERT INTO atencion
VALUES ('542', TO_DATE('08/01/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), '09:45', '16852', '6783834', '400', '10006101');
INSERT INTO atencion
VALUES ('543', TO_DATE('10/06/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '10:15', '11147', '5693955', '100', '8484348');
INSERT INTO atencion
VALUES ('544', TO_DATE('03/03/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), '11:00', '22499', '3943337', '300', '11574234');
INSERT INTO atencion
VALUES ('545', TO_DATE('03/07/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '13:15', '23874', '4808258', '700', '7800257');
INSERT INTO atencion
VALUES ('546', TO_DATE('07/02/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), '13:45', '7370', '5644453', '300', '13604300');
INSERT INTO atencion
VALUES ('547', TO_DATE('02/04/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), '14:00', '21216', '9169312', '400', '11574234');
INSERT INTO atencion
VALUES ('548', TO_DATE('29/09/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), '17:00', '45224', '3943337', '300', '11959215');
INSERT INTO atencion
VALUES ('549', TO_DATE('28/03/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), '15:45', '22513', '11293307', '1400', '3433444');
INSERT INTO atencion
VALUES ('550', TO_DATE('16/02/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), '18:45', '18795', '6231787', '900', '10006101');
INSERT INTO atencion
VALUES ('551', TO_DATE('28/03/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), '13:30', '15396', '7555800', '600', '10006101');
INSERT INTO atencion
VALUES ('552', TO_DATE('27/07/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), '09:30', '12806', '6543007', '700', '7393396');
INSERT INTO atencion
VALUES ('553', TO_DATE('03/09/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '17:15', '12581', '11448750', '500', '3900425');
INSERT INTO atencion
VALUES ('554', TO_DATE('23/01/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), '12:30', '9158', '3490261', '800', '3562788');
INSERT INTO atencion
VALUES ('555', TO_DATE('11/01/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), '13:00', '52852', '6543007', '700', '7555810');
INSERT INTO atencion
VALUES ('556', TO_DATE('25/08/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '12:45', '60405', '10214564', '300', '8329433');
INSERT INTO atencion
VALUES ('557', TO_DATE('25/04/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), '19:15', '10928', '9169312', '400', '13604300');
INSERT INTO atencion
VALUES ('558', TO_DATE('09/02/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), '11:15', '11320', '11293307', '1400', '9168286');
INSERT INTO atencion
VALUES ('559', TO_DATE('05/03/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), '10:15', '26957', '5644453', '300', '6626326');
INSERT INTO atencion
VALUES ('560', TO_DATE('05/07/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '17:45', '34336', '6117105', '200', '4603482');
INSERT INTO atencion
VALUES ('561', TO_DATE('30/04/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '09:45', '7307', '4808258', '700', '6239390');
INSERT INTO atencion
VALUES ('562', TO_DATE('19/01/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '14:00', '5478', '9169312', '400', '6110507');
INSERT INTO atencion
VALUES ('563', TO_DATE('25/03/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '17:15', '40681', '6783834', '400', '7555810');
INSERT INTO atencion
VALUES ('564', TO_DATE('22/03/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), '12:45', '16786', '6135687', '100', '6407635');
INSERT INTO atencion
VALUES ('565', TO_DATE('15/08/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '10:30', '33295', '6783834', '400', '2576808');
INSERT INTO atencion
VALUES ('567', TO_DATE('13/02/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), '17:30', '37779', '7555800', '600', '6400537');
INSERT INTO atencion
VALUES ('568', TO_DATE('22/01/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), '20:00', '4668', '5412514', '600', '3066256');
INSERT INTO atencion
VALUES ('569', TO_DATE('14/04/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), '17:30', '31019', '5825975', '600', '6215470');
INSERT INTO atencion
VALUES ('570', TO_DATE('11/01/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), '09:30', '63045', '3943337', '300', '4744782');
INSERT INTO atencion
VALUES ('571', TO_DATE('12/05/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), '10:00', '55536', '6231787', '900', '8162534');
INSERT INTO atencion
VALUES ('572', TO_DATE('23/02/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '12:45', '24456', '9827836', '1900', '7378093');
INSERT INTO atencion
VALUES ('100', TO_DATE('17/04/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '10:45', '30094', '6751207', '1500', '1105913');
INSERT INTO atencion
VALUES ('101', TO_DATE('08/01/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), '14:30', '37325', '6475751', '200', '8329433');
INSERT INTO atencion
VALUES ('102', TO_DATE('04/08/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), '12:15', '28251', '6117105', '200', '14438381');
INSERT INTO atencion
VALUES ('103', TO_DATE('21/10/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), '15:45', '43026', '4808258', '700', '2583879');
INSERT INTO atencion
VALUES ('104', TO_DATE('24/04/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), '20:45', '48011', '6751207', '600', '4892956');
INSERT INTO atencion
VALUES ('105', TO_DATE('28/03/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), '11:15', '21956', '3126425', '900', '3331075');
INSERT INTO atencion
VALUES ('106', TO_DATE('18/03/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), '15:45', '12545', '9169312', '400', '5348333');
INSERT INTO atencion
VALUES ('107', TO_DATE('23/01/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), '20:00', '26324', '10834039', '600', '3385116');
INSERT INTO atencion
VALUES ('108', TO_DATE('13/06/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '11:0', '23827', '6117105', '200', '11959885');
INSERT INTO atencion
VALUES ('109', TO_DATE('08/09/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '09:45', '59315', '6231787', '900', '4426899');
INSERT INTO atencion
VALUES ('110', TO_DATE('05/11/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), '15:00', '7427', '14490825', '600', '3066256');
INSERT INTO atencion
VALUES ('111', TO_DATE('09/08/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '10:15', '13457', '3126425', '900', '3493962');
INSERT INTO atencion
VALUES ('112', TO_DATE('20/07/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '11:45', '6877', '3943337', '300', '5738855');
INSERT INTO atencion
VALUES ('113', TO_DATE('13/02/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '10:30', '13001', '6135687', '100', '5820729');
INSERT INTO atencion
VALUES ('114', TO_DATE('09/03/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), '10:00', '30891', '10214564', '300', '4273820');
INSERT INTO atencion
VALUES ('115', TO_DATE('30/09/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), '14:30', '13704', '3027750', '700', '8601391');
INSERT INTO atencion
VALUES ('116', TO_DATE('25/01/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), '15:15', '11356', '3027750', '700', '5932711');
INSERT INTO atencion
VALUES ('117', TO_DATE('17/01/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), '16:00', '44717', '11959315', '800', '7555810');
INSERT INTO atencion
VALUES ('118', TO_DATE('02/06/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), '12:45', '50882', '6117105', '200', '5822189');
INSERT INTO atencion
VALUES ('119', TO_DATE('25/10/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), '17:00', '11824', '9169312', '400', '3493962');
INSERT INTO atencion
VALUES ('120', TO_DATE('28/03/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), '16:00', '11351', '6783834', '400', '6415238');
INSERT INTO atencion
VALUES ('121', TO_DATE('29/05/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '19:00', '7669', '3027750', '700', '13604300');
INSERT INTO atencion
VALUES ('122', TO_DATE('06/03/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), '13:45', '34663', '9827836', '1900', '2576808');
INSERT INTO atencion
VALUES ('123', TO_DATE('04/02/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), '20:15', '58292', '6475751', '200', '4378812');
INSERT INTO atencion
VALUES ('124', TO_DATE('17/06/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '15:45', '19456', '11959315', '800', '5932711');
INSERT INTO atencion
VALUES ('125', TO_DATE('07/01/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), '15:45', '19314', '14284031', '400', '7000164');
INSERT INTO atencion
VALUES ('127', TO_DATE('15/05/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '12:00', '37813', '6751207', '1500', '8284373');
INSERT INTO atencion
VALUES ('128', TO_DATE('26/02/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), '09:45', '14372', '9827836', '100', '4884829');
INSERT INTO atencion
VALUES ('129', TO_DATE('04/01/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), '16:45', '23090', '11448750', '500', '3331075');
INSERT INTO atencion
VALUES ('130', TO_DATE('06/01/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), '15:30', '19205', '14490825', '600', '7000164');
INSERT INTO atencion
VALUES ('131', TO_DATE('04/09/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), '17:00', '5460', '6751207', '1500', '7599430');
INSERT INTO atencion
VALUES ('132', TO_DATE('29/07/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '19:30', '47940', '6117105', '200', '8162534');
INSERT INTO atencion
VALUES ('133', TO_DATE('17/03/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), '13:15', '30117', '13604392', '1100', '6215470');
INSERT INTO atencion
VALUES ('134', TO_DATE('17/08/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '17:00', '40475', '10834039', '1800', '8671238');
INSERT INTO atencion
VALUES ('135', TO_DATE('28/02/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), '09:45', '56852', '6475751', '200', '7144708');
INSERT INTO atencion
VALUES ('136', TO_DATE('17/04/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), '15:45', '60640', '11448750', '500', '6941733');
INSERT INTO atencion
VALUES ('137', TO_DATE('04/10/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), '10:30', '16349', '13604392', '1100', '6415238');
INSERT INTO atencion
VALUES ('138', TO_DATE('01/07/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '13:45', '14260', '4582433', '1400', '6239390');
INSERT INTO atencion
VALUES ('139', TO_DATE('10/01/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), '15:00', '63732', '5693955', '100', '4744782');
INSERT INTO atencion
VALUES ('140', TO_DATE('26/06/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), '15:45', '43268', '14490825', '600', '4378812');
INSERT INTO atencion
VALUES ('141', TO_DATE('12/07/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '14:30', '49647', '3027750', '700', '8162534');
INSERT INTO atencion
VALUES ('142', TO_DATE('22/06/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '20:30', '54687', '3027750', '700', '4396440');
INSERT INTO atencion
VALUES ('143', TO_DATE('01/03/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '17:00', '15863', '3490261', '800', '5455736');
INSERT INTO atencion
VALUES ('145', TO_DATE('28/02/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), '16:00', '13088', '5412514', '600', '6340382');
INSERT INTO atencion
VALUES ('146', TO_DATE('26/01/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), '19:45', '36855', '6117105', '200', '16204720');
INSERT INTO atencion
VALUES ('147', TO_DATE('04/03/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), '13:30', '6968', '6751207', '600', '5000746');
INSERT INTO atencion
VALUES ('148', TO_DATE('05/06/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), '11:45', '14527', '4582433', '100', '5348333');

INSERT INTO pago_atencion
VALUES ('100', TO_DATE('17/05/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), TO_DATE('18/06/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'),
        '30094', '30094', null);
INSERT INTO pago_atencion
VALUES ('101', TO_DATE('08/02/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), TO_DATE('10/02/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'),
        '37325', '37325', null);
INSERT INTO pago_atencion
VALUES ('102', TO_DATE('04/09/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), TO_DATE('04/09/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'),
        '28251', '28251', null);
INSERT INTO pago_atencion
VALUES ('103', TO_DATE('21/11/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), TO_DATE('21/11/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'),
        '43026', '43026', null);
INSERT INTO pago_atencion
VALUES ('104', TO_DATE('24/05/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), TO_DATE('24/05/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'),
        '48011', '48011', null);
INSERT INTO pago_atencion
VALUES ('105', TO_DATE('28/04/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), TO_DATE('30/04/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'),
        '21956', '21956', null);
INSERT INTO pago_atencion
VALUES ('106', TO_DATE('18/04/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), TO_DATE('18/04/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'),
        '12545', '12545', null);
INSERT INTO pago_atencion
VALUES ('107', TO_DATE('23/02/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), TO_DATE('23/02/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'),
        '26324', '26324', null);
INSERT INTO pago_atencion
VALUES ('108', TO_DATE('13/07/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), TO_DATE('13/07/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'),
        '23827', '23827', null);
INSERT INTO pago_atencion
VALUES ('109', TO_DATE('12/09/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), TO_DATE('14/09/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '59315', '59315', null);
INSERT INTO pago_atencion
VALUES ('110', TO_DATE('05/12/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), TO_DATE('05/12/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'),
        '7427', '7427', null);
INSERT INTO pago_atencion
VALUES ('111', TO_DATE('20/08/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), TO_DATE('09/10/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '13457', '13457', null);
INSERT INTO pago_atencion
VALUES ('112', TO_DATE('20/08/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), TO_DATE('20/08/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '6877', '6877', null);
INSERT INTO pago_atencion
VALUES ('113', TO_DATE('13/03/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), TO_DATE('13/03/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'),
        '13001', '13001', null);
INSERT INTO pago_atencion
VALUES ('114', TO_DATE('09/04/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), TO_DATE('09/04/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'),
        '30891', '30891', null);
INSERT INTO pago_atencion
VALUES ('115', TO_DATE('30/10/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), TO_DATE('03/11/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'),
        '13704', '13704', null);
INSERT INTO pago_atencion
VALUES ('116', TO_DATE('25/02/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), TO_DATE('25/02/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'),
        '11356', '11356', null);
INSERT INTO pago_atencion
VALUES ('117', TO_DATE('17/02/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), TO_DATE('17/03/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'),
        '44717', '44717', null);
INSERT INTO pago_atencion
VALUES ('118', TO_DATE('02/07/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), TO_DATE('08/07/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'),
        '50882', '50882', null);
INSERT INTO pago_atencion
VALUES ('119', TO_DATE('25/11/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), TO_DATE('25/11/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'),
        '11824', '11824', null);
INSERT INTO pago_atencion
VALUES ('120', TO_DATE('28/04/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), TO_DATE('28/04/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'),
        '11351', '11351', null);
INSERT INTO pago_atencion
VALUES ('121', TO_DATE('29/06/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), TO_DATE('03/07/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'),
        '7669', '7669', null);
INSERT INTO pago_atencion
VALUES ('122', TO_DATE('06/04/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), TO_DATE('06/04/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'),
        '34663', '34663', null);
INSERT INTO pago_atencion
VALUES ('123', TO_DATE('04/03/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), TO_DATE('04/03/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'),
        '58292', '58292', null);
INSERT INTO pago_atencion
VALUES ('124', TO_DATE('17/07/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), TO_DATE('17/07/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '19456', '19456', null);
INSERT INTO pago_atencion
VALUES ('125', TO_DATE('07/02/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), TO_DATE('07/02/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'),
        '19314', '19314', null);
INSERT INTO pago_atencion
VALUES ('127', TO_DATE('15/06/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), TO_DATE('15/07/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '37813', '37813', null);
INSERT INTO pago_atencion
VALUES ('128', TO_DATE('26/03/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), TO_DATE('26/03/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'),
        '14372', '14372', null);
INSERT INTO pago_atencion
VALUES ('129', TO_DATE('04/02/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), TO_DATE('04/02/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'),
        '23090', '23090', null);
INSERT INTO pago_atencion
VALUES ('130', TO_DATE('06/02/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), TO_DATE('06/02/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'),
        '19205', '19205', null);
INSERT INTO pago_atencion
VALUES ('131', TO_DATE('09/09/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), TO_DATE('12/09/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '5460', '5460', null);
INSERT INTO pago_atencion
VALUES ('132', TO_DATE('29/08/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), TO_DATE('29/08/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'),
        '47940', '47940', null);
INSERT INTO pago_atencion
VALUES ('133', TO_DATE('17/04/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), TO_DATE('17/04/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'),
        '30117', '30117', null);
INSERT INTO pago_atencion
VALUES ('134', TO_DATE('05/09/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), TO_DATE('08/09/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'),
        '40475', '40475', null);
INSERT INTO pago_atencion
VALUES ('135', TO_DATE('28/03/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), TO_DATE('28/03/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'),
        '56852', '56852', null);
INSERT INTO pago_atencion
VALUES ('136', TO_DATE('17/05/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), TO_DATE('27/05/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'),
        '60640', '60640', null);
INSERT INTO pago_atencion
VALUES ('137', TO_DATE('04/11/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), TO_DATE('04/11/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'),
        '16349', '16349', null);
INSERT INTO pago_atencion
VALUES ('138', TO_DATE('01/08/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), TO_DATE('01/08/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '14260', '14260', null);
INSERT INTO pago_atencion
VALUES ('139', TO_DATE('10/02/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), TO_DATE('12/02/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'),
        '63732', '63732', null);
INSERT INTO pago_atencion
VALUES ('140', TO_DATE('26/07/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), TO_DATE('26/07/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'),
        '43268', '43268', null);
INSERT INTO pago_atencion
VALUES ('141', TO_DATE('12/08/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), TO_DATE('12/08/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '49647', '49647', null);
INSERT INTO pago_atencion
VALUES ('142', TO_DATE('22/07/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), TO_DATE('22/07/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '54687', '54687', null);
INSERT INTO pago_atencion
VALUES ('143', TO_DATE('01/04/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), TO_DATE('01/04/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '15863', '15863', null);
INSERT INTO pago_atencion
VALUES ('145', TO_DATE('29/03/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), TO_DATE('29/03/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'),
        '13088', '13088', null);
INSERT INTO pago_atencion
VALUES ('146', TO_DATE('26/02/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), TO_DATE('03/01/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'),
        '36855', '36855', null);
INSERT INTO pago_atencion
VALUES ('147', TO_DATE('04/04/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), TO_DATE('04/04/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'),
        '6968', '6968', null);
INSERT INTO pago_atencion
VALUES ('148', TO_DATE('05/07/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), TO_DATE('05/07/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'),
        '14527', '14527', null);
INSERT INTO pago_atencion
VALUES ('149', TO_DATE('07/07/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), TO_DATE('07/07/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'),
        '17337', '17337', null);
INSERT INTO pago_atencion
VALUES ('150', TO_DATE('05/09/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), TO_DATE('06/09/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '18015', '18015', null);
INSERT INTO pago_atencion
VALUES ('151', TO_DATE('05/04/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), TO_DATE('07/04/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '14248', '14248', null);
INSERT INTO pago_atencion
VALUES ('152', TO_DATE('14/08/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), TO_DATE('14/08/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'),
        '10804', '10804', null);
INSERT INTO pago_atencion
VALUES ('153', TO_DATE('19/08/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), TO_DATE('20/08/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '32494', '32494', null);
INSERT INTO pago_atencion
VALUES ('154', TO_DATE('23/04/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), TO_DATE('23/04/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'),
        '36151', '36151', null);
INSERT INTO pago_atencion
VALUES ('155', TO_DATE('03/09/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), TO_DATE('03/09/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '16843', '16843', null);
INSERT INTO pago_atencion
VALUES ('156', TO_DATE('20/08/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), TO_DATE('22/08/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '32612', '32612', null);
INSERT INTO pago_atencion
VALUES ('157', TO_DATE('19/05/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), TO_DATE('19/05/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '16270', '16270', null);
INSERT INTO pago_atencion
VALUES ('158', TO_DATE('23/03/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), TO_DATE('23/03/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'),
        '10696', '10696', null);
INSERT INTO pago_atencion
VALUES ('159', TO_DATE('13/02/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), TO_DATE('13/02/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'),
        '53095', '53095', null);
INSERT INTO pago_atencion
VALUES ('160', TO_DATE('24/06/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), TO_DATE('24/06/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'),
        '22442', '22442', null);
INSERT INTO pago_atencion
VALUES ('161', TO_DATE('28/08/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), TO_DATE('23/08/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '46137', '46137', null);
INSERT INTO pago_atencion
VALUES ('162', TO_DATE('04/05/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), TO_DATE('04/05/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '14995', '14995', null);
INSERT INTO pago_atencion
VALUES ('163', TO_DATE('16/03/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), TO_DATE('16/03/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'),
        '11122', '11122', null);
INSERT INTO pago_atencion
VALUES ('164', TO_DATE('10/02/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), TO_DATE('10/02/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'),
        '29874', '29874', null);
INSERT INTO pago_atencion
VALUES ('165', TO_DATE('11/12/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), TO_DATE('11/12/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'),
        '60325', '60325', null);
INSERT INTO pago_atencion
VALUES ('166', TO_DATE('15/02/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), TO_DATE('25/02/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'),
        '31662', '31662', null);
INSERT INTO pago_atencion
VALUES ('167', TO_DATE('10/09/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), TO_DATE('11/09/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '54681', '54681', null);
INSERT INTO pago_atencion
VALUES ('168', TO_DATE('19/08/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), TO_DATE('19/08/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '7218', '7218', null);
INSERT INTO pago_atencion
VALUES ('169', TO_DATE('24/08/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), TO_DATE('23/08/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '44941', '44941', null);
INSERT INTO pago_atencion
VALUES ('170', TO_DATE('20/08/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), TO_DATE('20/08/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '57459', '57459', null);
INSERT INTO pago_atencion
VALUES ('171', TO_DATE('03/08/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), TO_DATE('03/08/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '22242', '22242', null);
INSERT INTO pago_atencion
VALUES ('172', TO_DATE('22/06/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), TO_DATE('22/06/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'),
        '16914', '16914', null);
INSERT INTO pago_atencion
VALUES ('173', TO_DATE('12/09/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), TO_DATE('12/09/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '10384', '10384', null);
INSERT INTO pago_atencion
VALUES ('174', TO_DATE('02/09/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), TO_DATE('28/09/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '64439', '64439', null);
INSERT INTO pago_atencion
VALUES ('175', TO_DATE('04/10/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), TO_DATE('04/10/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'),
        '54959', '54959', null);
INSERT INTO pago_atencion
VALUES ('176', TO_DATE('19/02/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), TO_DATE('20/02/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '38282', '38282', null);
INSERT INTO pago_atencion
VALUES ('177', TO_DATE('12/08/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), TO_DATE('12/08/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '16245', '16245', null);
INSERT INTO pago_atencion
VALUES ('178', TO_DATE('10/09/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), TO_DATE('10/09/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '21259', '21259', null);
INSERT INTO pago_atencion
VALUES ('179', TO_DATE('11/07/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), TO_DATE('11/07/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'),
        '14337', '14337', null);
INSERT INTO pago_atencion
VALUES ('180', TO_DATE('01/06/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), TO_DATE('01/06/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '52145', '52145', null);
INSERT INTO pago_atencion
VALUES ('181', TO_DATE('12/09/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), TO_DATE('12/09/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '49583', '49583', null);
INSERT INTO pago_atencion
VALUES ('182', TO_DATE('09/03/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), TO_DATE('09/03/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '53843', '53843', null);
INSERT INTO pago_atencion
VALUES ('183', TO_DATE('16/08/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), TO_DATE('16/08/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '25634', '25634', null);
INSERT INTO pago_atencion
VALUES ('184', TO_DATE('25/03/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), TO_DATE('25/03/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'),
        '44346', '44346', null);
INSERT INTO pago_atencion
VALUES ('185', TO_DATE('28/02/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), TO_DATE('05/03/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'),
        '52586', '52586', null);
INSERT INTO pago_atencion
VALUES ('187', TO_DATE('16/03/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), TO_DATE('16/03/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '61799', '61799', null);
INSERT INTO pago_atencion
VALUES ('188', TO_DATE('04/04/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), TO_DATE('04/04/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'),
        '60725', '60725', null);
INSERT INTO pago_atencion
VALUES ('189', TO_DATE('13/02/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), TO_DATE('13/02/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'),
        '42571', '42571', null);
INSERT INTO pago_atencion
VALUES ('190', TO_DATE('23/10/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), TO_DATE('23/10/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'),
        '18044', '18044', null);
INSERT INTO pago_atencion
VALUES ('191', TO_DATE('10/09/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), TO_DATE('12/09/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '9549', '9549', null);
INSERT INTO pago_atencion
VALUES ('192', TO_DATE('04/09/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), TO_DATE('06/09/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '55587', '55587', null);
INSERT INTO pago_atencion
VALUES ('193', TO_DATE('01/09/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), TO_DATE('03/09/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '16581', '16581', null);
INSERT INTO pago_atencion
VALUES ('194', TO_DATE('12/04/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), TO_DATE('12/04/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'),
        '41381', '41381', null);
INSERT INTO pago_atencion
VALUES ('195', TO_DATE('03/07/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), TO_DATE('03/07/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'),
        '8482', '8482', null);
INSERT INTO pago_atencion
VALUES ('196', TO_DATE('27/02/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), TO_DATE('01/03/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'),
        '18443', '18443', null);
INSERT INTO pago_atencion
VALUES ('197', TO_DATE('02/04/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), TO_DATE('02/04/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '23350', '23350', null);
INSERT INTO pago_atencion
VALUES ('198', TO_DATE('06/09/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), TO_DATE('09/09/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '57098', '57098', null);
INSERT INTO pago_atencion
VALUES ('199', TO_DATE('05/05/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), TO_DATE('05/05/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'),
        '16502', '16502', null);
INSERT INTO pago_atencion
VALUES ('200', TO_DATE('10/09/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), TO_DATE('11/09/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '16621', '16621', null);
INSERT INTO pago_atencion
VALUES ('201', TO_DATE('27/05/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), TO_DATE('27/05/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '12390', '12390', null);
INSERT INTO pago_atencion
VALUES ('202', TO_DATE('05/04/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), TO_DATE('05/04/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'),
        '25129', '25129', null);
INSERT INTO pago_atencion
VALUES ('203', TO_DATE('21/04/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), TO_DATE('23/04/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'),
        '26737', '26737', null);
INSERT INTO pago_atencion
VALUES ('204', TO_DATE('29/06/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), TO_DATE('02/07/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'),
        '8964', '8964', null);
INSERT INTO pago_atencion
VALUES ('205', TO_DATE('03/09/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), TO_DATE('05/09/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '15798', '15798', null);
INSERT INTO pago_atencion
VALUES ('206', TO_DATE('30/08/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), TO_DATE('30/08/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '11713', '11713', null);
INSERT INTO pago_atencion
VALUES ('207', TO_DATE('13/11/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), TO_DATE('13/11/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'),
        '40849', '40849', null);
INSERT INTO pago_atencion
VALUES ('208', TO_DATE('13/05/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), TO_DATE('18/05/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'),
        '13043', '13043', null);
INSERT INTO pago_atencion
VALUES ('209', TO_DATE('16/07/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), TO_DATE('16/07/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'),
        '58280', '58280', null);
INSERT INTO pago_atencion
VALUES ('210', TO_DATE('17/04/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), TO_DATE('17/04/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'),
        '24883', '24883', null);
INSERT INTO pago_atencion
VALUES ('211', TO_DATE('22/07/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), TO_DATE('22/07/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '3634', '3634', null);
INSERT INTO pago_atencion
VALUES ('212', TO_DATE('30/09/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), TO_DATE('30/09/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'),
        '64596', '64596', null);
INSERT INTO pago_atencion
VALUES ('213', TO_DATE('03/04/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), TO_DATE('09/04/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'),
        '59560', '59560', null);
INSERT INTO pago_atencion
VALUES ('214', TO_DATE('30/12/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), TO_DATE('30/12/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'),
        '13402', '13402', null);
INSERT INTO pago_atencion
VALUES ('215', TO_DATE('27/02/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), TO_DATE('28/02/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'),
        '15393', '15393', null);
INSERT INTO pago_atencion
VALUES ('216', TO_DATE('11/09/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), TO_DATE('12/09/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '8701', '8701', null);
INSERT INTO pago_atencion
VALUES ('217', TO_DATE('18/06/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), TO_DATE('18/06/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '33532', '33532', null);
INSERT INTO pago_atencion
VALUES ('218', TO_DATE('05/09/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), TO_DATE('07/09/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '30420', '30420', null);
INSERT INTO pago_atencion
VALUES ('219', TO_DATE('13/03/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), TO_DATE('13/03/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'),
        '13546', '13546', null);
INSERT INTO pago_atencion
VALUES ('220', TO_DATE('08/09/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), TO_DATE('08/09/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'),
        '42495', '42495', null);
INSERT INTO pago_atencion
VALUES ('221', TO_DATE('12/02/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), TO_DATE('19/02/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'),
        '42441', '42441', null);
INSERT INTO pago_atencion
VALUES ('222', TO_DATE('20/08/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), TO_DATE('20/08/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'),
        '40100', '40100', null);
INSERT INTO pago_atencion
VALUES ('223', TO_DATE('23/08/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), TO_DATE('23/08/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'),
        '35611', '35611', null);
INSERT INTO pago_atencion
VALUES ('224', TO_DATE('20/09/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), TO_DATE('20/09/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '62937', '62937', null);
INSERT INTO pago_atencion
VALUES ('225', TO_DATE('15/09/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), TO_DATE('15/09/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '43176', '43176', null);
INSERT INTO pago_atencion
VALUES ('226', TO_DATE('25/10/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), TO_DATE('25/10/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'),
        '18768', '18768', null);
INSERT INTO pago_atencion
VALUES ('227', TO_DATE('09/07/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), TO_DATE('09/07/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'),
        '13517', '13517', null);
INSERT INTO pago_atencion
VALUES ('228', TO_DATE('18/02/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), TO_DATE('24/02/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'),
        '20064', '20064', null);
INSERT INTO pago_atencion
VALUES ('229', TO_DATE('18/04/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), TO_DATE('18/04/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '57894', '57894', null);
INSERT INTO pago_atencion
VALUES ('230', TO_DATE('04/11/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), TO_DATE('10/11/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'),
        '38243', '38243', null);
INSERT INTO pago_atencion
VALUES ('231', TO_DATE('18/11/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), TO_DATE('18/11/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'),
        '14018', '14018', null);
INSERT INTO pago_atencion
VALUES ('232', TO_DATE('18/12/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), TO_DATE('18/12/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'),
        '50303', '50303', null);
INSERT INTO pago_atencion
VALUES ('233', TO_DATE('10/03/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), TO_DATE('10/03/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'),
        '14284', '14284', null);
INSERT INTO pago_atencion
VALUES ('234', TO_DATE('08/10/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), TO_DATE('08/10/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'),
        '26319', '26319', null);
INSERT INTO pago_atencion
VALUES ('235', TO_DATE('26/06/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), TO_DATE('26/06/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '18594', '18594', null);
INSERT INTO pago_atencion
VALUES ('236', TO_DATE('10/09/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), TO_DATE('12/09/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '38944', '38944', null);
INSERT INTO pago_atencion
VALUES ('237', TO_DATE('04/08/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), TO_DATE('04/08/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '13832', '13832', null);
INSERT INTO pago_atencion
VALUES ('238', TO_DATE('05/09/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), TO_DATE('07/09/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '62765', '62765', null);
INSERT INTO pago_atencion
VALUES ('240', TO_DATE('26/05/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), TO_DATE('28/05/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'),
        '11089', '11089', null);
INSERT INTO pago_atencion
VALUES ('241', TO_DATE('06/04/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), TO_DATE('08/04/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'),
        '28135', '28135', null);
INSERT INTO pago_atencion
VALUES ('242', TO_DATE('24/02/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), TO_DATE('24/02/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '59650', '59650', null);
INSERT INTO pago_atencion
VALUES ('244', TO_DATE('22/04/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), TO_DATE('22/04/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '24516', '24516', null);
INSERT INTO pago_atencion
VALUES ('245', TO_DATE('08/11/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), TO_DATE('08/11/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'),
        '15831', '15831', null);
INSERT INTO pago_atencion
VALUES ('246', TO_DATE('11/10/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), TO_DATE('11/10/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'),
        '47489', '47489', null);
INSERT INTO pago_atencion
VALUES ('248', TO_DATE('19/10/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), TO_DATE('19/10/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'),
        '12563', '12563', null);
INSERT INTO pago_atencion
VALUES ('249', TO_DATE('26/03/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), TO_DATE('26/03/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'),
        '17580', '17580', null);
INSERT INTO pago_atencion
VALUES ('250', TO_DATE('10/10/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), TO_DATE('10/10/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'),
        '14935', '14935', null);
INSERT INTO pago_atencion
VALUES ('251', TO_DATE('16/11/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), TO_DATE('19/11/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'),
        '29772', '29772', null);
INSERT INTO pago_atencion
VALUES ('253', TO_DATE('06/03/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), TO_DATE('15/03/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'),
        '4759', '4759', null);
INSERT INTO pago_atencion
VALUES ('254', TO_DATE('17/03/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), TO_DATE('17/03/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'),
        '27447', '27447', null);
INSERT INTO pago_atencion
VALUES ('255', TO_DATE('18/07/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), TO_DATE('18/07/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '17896', '17896', null);
INSERT INTO pago_atencion
VALUES ('257', TO_DATE('17/04/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), TO_DATE('17/04/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '24393', '24393', null);
INSERT INTO pago_atencion
VALUES ('258', TO_DATE('28/03/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), TO_DATE('28/03/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'),
        '33379', '33379', null);
INSERT INTO pago_atencion
VALUES ('259', TO_DATE('25/06/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), TO_DATE('25/06/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '25637', '25637', null);
INSERT INTO pago_atencion
VALUES ('261', TO_DATE('14/02/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), TO_DATE('14/02/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'),
        '50705', '50705', null);
INSERT INTO pago_atencion
VALUES ('262', TO_DATE('19/12/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), TO_DATE('22/12/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'),
        '6598', '6598', null);
INSERT INTO pago_atencion
VALUES ('263', TO_DATE('25/08/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), TO_DATE('25/08/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '63528', '63528', null);
INSERT INTO pago_atencion
VALUES ('265', TO_DATE('25/04/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), TO_DATE('25/04/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'),
        '11504', '11504', null);
INSERT INTO pago_atencion
VALUES ('266', TO_DATE('18/07/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), TO_DATE('25/07/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'),
        '34752', '34752', null);
INSERT INTO pago_atencion
VALUES ('267', TO_DATE('29/08/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), TO_DATE('29/08/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '11493', '11493', null);
INSERT INTO pago_atencion
VALUES ('269', TO_DATE('02/09/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), TO_DATE('06/09/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '56598', '56598', null);
INSERT INTO pago_atencion
VALUES ('270', TO_DATE('03/06/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), TO_DATE('08/06/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'),
        '55768', '55768', null);
INSERT INTO pago_atencion
VALUES ('271', TO_DATE('26/07/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), TO_DATE('27/07/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'),
        '18072', '18072', null);
INSERT INTO pago_atencion
VALUES ('272', TO_DATE('01/09/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), TO_DATE('06/09/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'),
        '41708', '41708', null);
INSERT INTO pago_atencion
VALUES ('274', TO_DATE('11/09/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), TO_DATE('11/09/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '51144', '51144', null);
INSERT INTO pago_atencion
VALUES ('275', TO_DATE('23/12/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), TO_DATE('23/12/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'),
        '43655', '43655', null);
INSERT INTO pago_atencion
VALUES ('276', TO_DATE('24/02/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), TO_DATE('24/02/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '21880', '21880', null);
INSERT INTO pago_atencion
VALUES ('278', TO_DATE('17/10/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), TO_DATE('17/10/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'),
        '15680', '15680', null);
INSERT INTO pago_atencion
VALUES ('279', TO_DATE('05/06/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), TO_DATE('05/06/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'),
        '17141', '17141', null);
INSERT INTO pago_atencion
VALUES ('280', TO_DATE('07/02/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), TO_DATE('07/02/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'),
        '18930', '18930', null);
INSERT INTO pago_atencion
VALUES ('282', TO_DATE('04/11/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), TO_DATE('04/11/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'),
        '17522', '17522', null);
INSERT INTO pago_atencion
VALUES ('283', TO_DATE('04/04/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), TO_DATE('04/04/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'),
        '9924', '9924', null);
INSERT INTO pago_atencion
VALUES ('284', TO_DATE('05/06/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), TO_DATE('05/06/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'),
        '36640', '36640', null);
INSERT INTO pago_atencion
VALUES ('286', TO_DATE('06/03/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), TO_DATE('06/03/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '15944', '15944', null);
INSERT INTO pago_atencion
VALUES ('287', TO_DATE('09/04/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), TO_DATE('09/04/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'),
        '24431', '24431', null);
INSERT INTO pago_atencion
VALUES ('288', TO_DATE('12/08/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), TO_DATE('12/08/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'),
        '50766', '50766', null);
INSERT INTO pago_atencion
VALUES ('290', TO_DATE('05/10/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), TO_DATE('05/10/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'),
        '37837', '37837', null);
INSERT INTO pago_atencion
VALUES ('291', TO_DATE('02/07/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), TO_DATE('02/07/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'),
        '46795', '46795', null);
INSERT INTO pago_atencion
VALUES ('292', TO_DATE('13/03/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), TO_DATE('13/03/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'),
        '42851', '42851', null);
INSERT INTO pago_atencion
VALUES ('293', TO_DATE('10/04/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), TO_DATE('10/04/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'),
        '14964', '14964', null);
INSERT INTO pago_atencion
VALUES ('295', TO_DATE('17/05/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), TO_DATE('17/05/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '10700', '10700', null);
INSERT INTO pago_atencion
VALUES ('296', TO_DATE('06/02/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), TO_DATE('06/02/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'),
        '12548', '12548', null);
INSERT INTO pago_atencion
VALUES ('297', TO_DATE('20/08/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), TO_DATE('20/08/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '22905', '22905', null);
INSERT INTO pago_atencion
VALUES ('299', TO_DATE('08/04/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), TO_DATE('08/04/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'),
        '3988', '3988', null);
INSERT INTO pago_atencion
VALUES ('300', TO_DATE('01/04/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), TO_DATE('01/04/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'),
        '61573', '61573', null);
INSERT INTO pago_atencion
VALUES ('301', TO_DATE('22/02/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), TO_DATE('26/02/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'),
        '6008', '6008', null);
INSERT INTO pago_atencion
VALUES ('303', TO_DATE('30/04/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), TO_DATE('30/04/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'),
        '32579', '32579', null);
INSERT INTO pago_atencion
VALUES ('304', TO_DATE('16/02/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), TO_DATE('16/02/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'),
        '9435', '9435', null);
INSERT INTO pago_atencion
VALUES ('305', TO_DATE('25/04/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), TO_DATE('25/04/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'),
        '12560', '12560', null);
INSERT INTO pago_atencion
VALUES ('307', TO_DATE('19/08/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), TO_DATE('19/08/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'),
        '12581', '12581', null);
INSERT INTO pago_atencion
VALUES ('309', TO_DATE('21/12/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), TO_DATE('21/12/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'),
        '20657', '20657', null);
INSERT INTO pago_atencion
VALUES ('310', TO_DATE('15/02/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), TO_DATE('20/02/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '12112', '12112', null);
INSERT INTO pago_atencion
VALUES ('311', TO_DATE('23/12/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), TO_DATE('23/12/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'),
        '35989', '35989', null);
INSERT INTO pago_atencion
VALUES ('313', TO_DATE('03/09/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), TO_DATE('03/09/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'),
        '25025', '25025', null);
INSERT INTO pago_atencion
VALUES ('314', TO_DATE('28/03/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), TO_DATE('28/03/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '56144', '56144', null);
INSERT INTO pago_atencion
VALUES ('315', TO_DATE('03/03/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), TO_DATE('03/03/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'),
        '62981', '62981', null);
INSERT INTO pago_atencion
VALUES ('317', TO_DATE('15/09/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), TO_DATE('15/09/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '18121', '18121', null);
INSERT INTO pago_atencion
VALUES ('318', TO_DATE('11/09/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), TO_DATE('13/09/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '4628', '4628', null);
INSERT INTO pago_atencion
VALUES ('319', TO_DATE('21/02/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), TO_DATE('24/02/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'),
        '10481', '10481', null);
INSERT INTO pago_atencion
VALUES ('321', TO_DATE('14/03/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), TO_DATE('14/03/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'),
        '33116', '33116', null);
INSERT INTO pago_atencion
VALUES ('322', TO_DATE('21/06/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), TO_DATE('21/06/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'),
        '13040', '13040', null);
INSERT INTO pago_atencion
VALUES ('323', TO_DATE('29/08/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), TO_DATE('29/08/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'),
        '7202', '7202', null);
INSERT INTO pago_atencion
VALUES ('324', TO_DATE('04/06/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), TO_DATE('04/06/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '50362', '50362', null);
INSERT INTO pago_atencion
VALUES ('326', TO_DATE('25/06/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), TO_DATE('25/06/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '43297', '43297', null);
INSERT INTO pago_atencion
VALUES ('327', TO_DATE('26/04/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), TO_DATE('26/04/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'),
        '22948', '22948', null);
INSERT INTO pago_atencion
VALUES ('328', TO_DATE('05/08/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), TO_DATE('05/08/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '12772', '12772', null);
INSERT INTO pago_atencion
VALUES ('556', TO_DATE('27/08/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), TO_DATE('28/08/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '60405', '60405', null);
INSERT INTO pago_atencion
VALUES ('557', TO_DATE('25/05/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), TO_DATE('25/05/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'),
        '10928', '10928', null);
INSERT INTO pago_atencion
VALUES ('559', TO_DATE('05/04/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), TO_DATE('05/04/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'),
        '26957', '26957', null);
INSERT INTO pago_atencion
VALUES ('560', TO_DATE('05/08/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), TO_DATE('05/08/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '34336', '34336', null);
INSERT INTO pago_atencion
VALUES ('561', TO_DATE('30/05/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), TO_DATE('30/05/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '7307', '7307', null);
INSERT INTO pago_atencion
VALUES ('563', TO_DATE('25/04/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), TO_DATE('25/04/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'),
        '40681', '40681', null);
INSERT INTO pago_atencion
VALUES ('564', TO_DATE('22/04/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), TO_DATE('22/04/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'),
        '16786', '16786', null);
INSERT INTO pago_atencion
VALUES ('565', TO_DATE('28/08/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), TO_DATE('26/08/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '33295', '33295', null);
INSERT INTO pago_atencion
VALUES ('568', TO_DATE('22/02/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), TO_DATE('05/03/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'),
        '4668', '4668', null);
INSERT INTO pago_atencion
VALUES ('569', TO_DATE('14/05/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), TO_DATE('14/05/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'),
        '31019', '31019', null);
INSERT INTO pago_atencion
VALUES ('570', TO_DATE('11/02/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), TO_DATE('11/02/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'),
        '63045', '63045', null);
INSERT INTO pago_atencion
VALUES ('572', TO_DATE('23/03/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), TO_DATE('23/03/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'),
        '24456', '24456', null);
INSERT INTO pago_atencion
VALUES ('239', TO_DATE('09/04/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), TO_DATE('09/04/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'),
        '58973', '58973', null);
INSERT INTO pago_atencion
VALUES ('243', TO_DATE('25/12/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), TO_DATE('25/12/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'),
        '47570', '47570', null);
INSERT INTO pago_atencion
VALUES ('247', TO_DATE('29/09/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), TO_DATE('29/09/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'),
        '55667', '55667', null);
INSERT INTO pago_atencion
VALUES ('252', TO_DATE('23/02/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), TO_DATE('28/02/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'),
        '33800', '33800', null);
INSERT INTO pago_atencion
VALUES ('256', TO_DATE('12/04/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), TO_DATE('12/04/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'),
        '14256', '14256', null);
INSERT INTO pago_atencion
VALUES ('260', TO_DATE('09/09/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), TO_DATE('12/09/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '52231', '52231', null);
INSERT INTO pago_atencion
VALUES ('264', TO_DATE('14/04/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), TO_DATE('14/04/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '10022', '10022', null);
INSERT INTO pago_atencion
VALUES ('268', TO_DATE('01/03/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), TO_DATE('01/03/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'),
        '38153', '38153', null);
INSERT INTO pago_atencion
VALUES ('273', TO_DATE('10/09/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), TO_DATE('10/09/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '10408', '10408', null);
INSERT INTO pago_atencion
VALUES ('277', TO_DATE('17/09/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), TO_DATE('17/09/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'),
        '15207', '15207', null);
INSERT INTO pago_atencion
VALUES ('281', TO_DATE('26/03/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), TO_DATE('26/03/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'),
        '19273', '19273', null);
INSERT INTO pago_atencion
VALUES ('285', TO_DATE('03/05/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), TO_DATE('03/05/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '16389', '16389', null);
INSERT INTO pago_atencion
VALUES ('289', TO_DATE('30/07/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), TO_DATE('30/07/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'),
        '60861', '60861', null);
INSERT INTO pago_atencion
VALUES ('294', TO_DATE('09/09/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), TO_DATE('09/09/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'),
        '17529', '17529', null);
INSERT INTO pago_atencion
VALUES ('298', TO_DATE('01/09/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), TO_DATE('01/09/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'),
        '52312', '52312', null);
INSERT INTO pago_atencion
VALUES ('302', TO_DATE('27/02/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), TO_DATE('27/02/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'),
        '33035', '33035', null);
INSERT INTO pago_atencion
VALUES ('308', TO_DATE('07/09/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), TO_DATE('08/09/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '27056', '27056', null);
INSERT INTO pago_atencion
VALUES ('312', TO_DATE('10/11/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), TO_DATE('10/11/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'),
        '10248', '10248', null);
INSERT INTO pago_atencion
VALUES ('316', TO_DATE('01/07/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), TO_DATE('01/07/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'),
        '18610', '18610', null);
INSERT INTO pago_atencion
VALUES ('320', TO_DATE('08/08/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), TO_DATE('08/08/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '25190', '25190', null);
INSERT INTO pago_atencion
VALUES ('325', TO_DATE('18/09/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), TO_DATE('18/09/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'),
        '9506', '9506', null);
INSERT INTO pago_atencion
VALUES ('329', TO_DATE('17/02/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), TO_DATE('17/02/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '14582', '14582', null);
INSERT INTO pago_atencion
VALUES ('333', TO_DATE('03/04/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), TO_DATE('03/04/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'),
        '12766', '12766', null);
INSERT INTO pago_atencion
VALUES ('337', TO_DATE('03/03/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), TO_DATE('03/03/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'),
        '39229', '39229', null);
INSERT INTO pago_atencion
VALUES ('341', TO_DATE('17/03/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), TO_DATE('17/03/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'),
        '15356', '15356', null);
INSERT INTO pago_atencion
VALUES ('345', TO_DATE('08/09/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), TO_DATE('08/09/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '33542', '33542', null);
INSERT INTO pago_atencion
VALUES ('490', TO_DATE('04/09/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), TO_DATE('04/09/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'),
        '17732', '17732', null);
INSERT INTO pago_atencion
VALUES ('494', TO_DATE('20/02/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), TO_DATE('22/02/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'),
        '38859', '38859', null);
INSERT INTO pago_atencion
VALUES ('498', TO_DATE('01/11/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), TO_DATE('01/11/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'),
        '14911', '14911', null);
INSERT INTO pago_atencion
VALUES ('502', TO_DATE('19/08/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), TO_DATE('17/08/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '12558', '12558', null);
INSERT INTO pago_atencion
VALUES ('507', TO_DATE('04/08/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), TO_DATE('04/08/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'),
        '40991', '40991', null);
INSERT INTO pago_atencion
VALUES ('511', TO_DATE('08/05/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), TO_DATE('08/05/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'),
        '14449', '14449', null);
INSERT INTO pago_atencion
VALUES ('515', TO_DATE('09/08/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), TO_DATE('09/08/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'),
        '10734', '10734', null);
INSERT INTO pago_atencion
VALUES ('520', TO_DATE('22/05/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), TO_DATE('22/05/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '34919', '34919', null);
INSERT INTO pago_atencion
VALUES ('524', TO_DATE('29/03/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), TO_DATE('29/03/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'),
        '39804', '39804', null);
INSERT INTO pago_atencion
VALUES ('528', TO_DATE('02/09/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), TO_DATE('02/09/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '27009', '27009', null);
INSERT INTO pago_atencion
VALUES ('532', TO_DATE('02/09/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), TO_DATE('02/09/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'),
        '58181', '58181', null);
INSERT INTO pago_atencion
VALUES ('537', TO_DATE('14/04/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), TO_DATE('14/04/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'),
        '10839', '10839', null);
INSERT INTO pago_atencion
VALUES ('541', TO_DATE('25/11/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), TO_DATE('25/11/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'),
        '11403', '11403', null);
INSERT INTO pago_atencion
VALUES ('545', TO_DATE('03/08/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), TO_DATE('03/08/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '23874', '23874', null);
INSERT INTO pago_atencion
VALUES ('550', TO_DATE('16/03/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), TO_DATE('16/03/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'),
        '18795', '18795', null);
INSERT INTO pago_atencion
VALUES ('554', TO_DATE('23/02/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), TO_DATE('23/02/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'),
        '9158', '9158', null);
INSERT INTO pago_atencion
VALUES ('558', TO_DATE('09/03/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), TO_DATE('09/03/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'),
        '11320', '11320', null);
INSERT INTO pago_atencion
VALUES ('562', TO_DATE('19/02/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), TO_DATE('14/02/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '5478', '5478', null);
INSERT INTO pago_atencion
VALUES ('567', TO_DATE('13/03/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), TO_DATE('13/03/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'),
        '37779', '37779', null);
INSERT INTO pago_atencion
VALUES ('571', TO_DATE('12/06/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), TO_DATE('12/06/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'),
        '55536', '55536', null);
INSERT INTO pago_atencion
VALUES ('330', TO_DATE('21/04/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), TO_DATE('21/04/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'),
        '13390', '13390', null);
INSERT INTO pago_atencion
VALUES ('331', TO_DATE('14/08/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), TO_DATE('14/08/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '22593', '22593', null);
INSERT INTO pago_atencion
VALUES ('332', TO_DATE('07/03/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), TO_DATE('07/03/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'),
        '12445', '12445', null);
INSERT INTO pago_atencion
VALUES ('334', TO_DATE('15/03/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), TO_DATE('15/03/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'),
        '22305', '22305', null);
INSERT INTO pago_atencion
VALUES ('335', TO_DATE('11/02/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), TO_DATE('11/02/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'),
        '22250', '22250', null);
INSERT INTO pago_atencion
VALUES ('336', TO_DATE('02/04/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), TO_DATE('02/04/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '37544', '37544', null);
INSERT INTO pago_atencion
VALUES ('338', TO_DATE('27/02/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), TO_DATE('08/03/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'),
        '15732', '15732', null);
INSERT INTO pago_atencion
VALUES ('339', TO_DATE('14/05/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), TO_DATE('14/05/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '29257', '29257', null);
INSERT INTO pago_atencion
VALUES ('340', TO_DATE('08/04/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), TO_DATE('08/04/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'),
        '16883', '16883', null);
INSERT INTO pago_atencion
VALUES ('342', TO_DATE('19/04/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), TO_DATE('19/04/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '46341', '46341', null);
INSERT INTO pago_atencion
VALUES ('343', TO_DATE('10/02/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), TO_DATE('11/02/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'),
        '12457', '12457', null);
INSERT INTO pago_atencion
VALUES ('344', TO_DATE('14/08/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), TO_DATE('14/08/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'),
        '55013', '55013', null);
INSERT INTO pago_atencion
VALUES ('346', TO_DATE('02/03/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), TO_DATE('02/03/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'),
        '3858', '3858', null);
INSERT INTO pago_atencion
VALUES ('347', TO_DATE('19/02/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), TO_DATE('19/02/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'),
        '29262', '29262', null);
INSERT INTO pago_atencion
VALUES ('348', TO_DATE('07/04/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), TO_DATE('07/04/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'),
        '50885', '50885', null);
INSERT INTO pago_atencion
VALUES ('349', TO_DATE('26/06/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), TO_DATE('26/06/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '28781', '28781', null);
INSERT INTO pago_atencion
VALUES ('350', TO_DATE('10/07/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), TO_DATE('10/07/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'),
        '48628', '48628', null);
INSERT INTO pago_atencion
VALUES ('351', TO_DATE('12/03/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), TO_DATE('12/03/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'),
        '51287', '51287', null);
INSERT INTO pago_atencion
VALUES ('352', TO_DATE('12/09/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), TO_DATE('12/09/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'),
        '9906', '9906', null);
INSERT INTO pago_atencion
VALUES ('353', TO_DATE('25/02/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), TO_DATE('01/03/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'),
        '13736', '13736', null);
INSERT INTO pago_atencion
VALUES ('354', TO_DATE('07/05/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), TO_DATE('07/05/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '50165', '50165', null);
INSERT INTO pago_atencion
VALUES ('355', TO_DATE('28/03/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), TO_DATE('28/03/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '2813', '2813', null);
INSERT INTO pago_atencion
VALUES ('356', TO_DATE('02/10/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), TO_DATE('02/10/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'),
        '11129', '11129', null);
INSERT INTO pago_atencion
VALUES ('357', TO_DATE('02/04/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), TO_DATE('02/04/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'),
        '46075', '46075', null);
INSERT INTO pago_atencion
VALUES ('358', TO_DATE('29/03/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), TO_DATE('29/03/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'),
        '9454', '9454', null);
INSERT INTO pago_atencion
VALUES ('359', TO_DATE('04/09/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), TO_DATE('06/09/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '9846', '9846', null);
INSERT INTO pago_atencion
VALUES ('360', TO_DATE('23/06/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), TO_DATE('23/06/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '50274', '50274', null);
INSERT INTO pago_atencion
VALUES ('361', TO_DATE('28/04/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), TO_DATE('28/04/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'),
        '16890', '16890', null);
INSERT INTO pago_atencion
VALUES ('362', TO_DATE('09/10/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), TO_DATE('09/10/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'),
        '13244', '13244', null);
INSERT INTO pago_atencion
VALUES ('363', TO_DATE('03/06/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), TO_DATE('03/06/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'),
        '13157', '13157', null);
INSERT INTO pago_atencion
VALUES ('364', TO_DATE('08/09/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), TO_DATE('08/09/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'),
        '54810', '54810', null);
INSERT INTO pago_atencion
VALUES ('365', TO_DATE('25/07/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), TO_DATE('25/07/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'),
        '12450', '12450', null);
INSERT INTO pago_atencion
VALUES ('366', TO_DATE('25/04/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), TO_DATE('25/04/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'),
        '55421', '55421', null);
INSERT INTO pago_atencion
VALUES ('367', TO_DATE('16/02/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), TO_DATE('16/02/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'),
        '40977', '40977', null);
INSERT INTO pago_atencion
VALUES ('368', TO_DATE('10/09/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), TO_DATE('10/09/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '10697', '10697', null);
INSERT INTO pago_atencion
VALUES ('369', TO_DATE('03/02/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), TO_DATE('03/02/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'),
        '7218', '7218', null);
INSERT INTO pago_atencion
VALUES ('370', TO_DATE('30/07/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), TO_DATE('30/07/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '12739', '12739', null);
INSERT INTO pago_atencion
VALUES ('371', TO_DATE('15/02/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), TO_DATE('28/02/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'),
        '61128', '61128', null);
INSERT INTO pago_atencion
VALUES ('372', TO_DATE('27/02/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), TO_DATE('27/02/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'),
        '24383', '24383', null);
INSERT INTO pago_atencion
VALUES ('373', TO_DATE('12/08/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), TO_DATE('12/08/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '8704', '8704', null);
INSERT INTO pago_atencion
VALUES ('374', TO_DATE('27/02/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), TO_DATE('27/02/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'),
        '22832', '22832', null);
INSERT INTO pago_atencion
VALUES ('376', TO_DATE('20/04/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), TO_DATE('20/04/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'),
        '17888', '17888', null);
INSERT INTO pago_atencion
VALUES ('377', TO_DATE('16/11/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), TO_DATE('16/11/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'),
        '55500', '55500', null);
INSERT INTO pago_atencion
VALUES ('378', TO_DATE('18/03/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), TO_DATE('18/03/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'),
        '48197', '48197', null);
INSERT INTO pago_atencion
VALUES ('379', TO_DATE('25/08/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), TO_DATE('25/08/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '6505', '6505', null);
INSERT INTO pago_atencion
VALUES ('380', TO_DATE('29/08/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), TO_DATE('29/08/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '55120', '55120', null);
INSERT INTO pago_atencion
VALUES ('381', TO_DATE('08/02/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), TO_DATE('19/02/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '45878', '45878', null);
INSERT INTO pago_atencion
VALUES ('382', TO_DATE('11/05/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), TO_DATE('11/05/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'),
        '46728', '46728', null);
INSERT INTO pago_atencion
VALUES ('383', TO_DATE('24/02/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), TO_DATE('28/02/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'),
        '44604', '44604', null);
INSERT INTO pago_atencion
VALUES ('384', TO_DATE('23/08/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), TO_DATE('25/08/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '36144', '36144', null);
INSERT INTO pago_atencion
VALUES ('385', TO_DATE('14/02/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), TO_DATE('15/02/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'),
        '30052', '30052', null);
INSERT INTO pago_atencion
VALUES ('386', TO_DATE('06/08/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), TO_DATE('06/08/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'),
        '13913', '13913', null);
INSERT INTO pago_atencion
VALUES ('387', TO_DATE('20/04/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), TO_DATE('20/04/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'),
        '48535', '48535', null);
INSERT INTO pago_atencion
VALUES ('388', TO_DATE('17/12/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), TO_DATE('17/12/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'),
        '15946', '15946', null);
INSERT INTO pago_atencion
VALUES ('389', TO_DATE('08/09/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), TO_DATE('06/09/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'),
        '2885', '2885', null);
INSERT INTO pago_atencion
VALUES ('390', TO_DATE('02/08/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), TO_DATE('02/08/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'),
        '33807', '33807', null);
INSERT INTO pago_atencion
VALUES ('391', TO_DATE('16/03/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), TO_DATE('16/03/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'),
        '50268', '50268', null);
INSERT INTO pago_atencion
VALUES ('392', TO_DATE('02/03/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), TO_DATE('02/03/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'),
        '47262', '47262', null);
INSERT INTO pago_atencion
VALUES ('393', TO_DATE('18/12/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), TO_DATE('18/12/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'),
        '53679', '53679', null);
INSERT INTO pago_atencion
VALUES ('394', TO_DATE('03/09/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), TO_DATE('04/09/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '24870', '24870', null);
INSERT INTO pago_atencion
VALUES ('395', TO_DATE('05/02/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), TO_DATE('08/02/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'),
        '42793', '42793', null);
INSERT INTO pago_atencion
VALUES ('396', TO_DATE('04/02/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), TO_DATE('05/02/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '18368', '18368', null);
INSERT INTO pago_atencion
VALUES ('397', TO_DATE('07/04/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), TO_DATE('07/04/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'),
        '26252', '26252', null);
INSERT INTO pago_atencion
VALUES ('398', TO_DATE('16/03/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), TO_DATE('16/03/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'),
        '35912', '35912', null);
INSERT INTO pago_atencion
VALUES ('399', TO_DATE('20/08/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), TO_DATE('23/08/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '11230', '11230', null);
INSERT INTO pago_atencion
VALUES ('400', TO_DATE('09/03/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), TO_DATE('09/03/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'),
        '19023', '19023', null);
INSERT INTO pago_atencion
VALUES ('401', TO_DATE('15/03/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), TO_DATE('15/03/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'),
        '3702', '3702', null);
INSERT INTO pago_atencion
VALUES ('402', TO_DATE('02/08/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), TO_DATE('02/08/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'),
        '13900', '13900', null);
INSERT INTO pago_atencion
VALUES ('403', TO_DATE('12/09/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), TO_DATE('12/09/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '57156', '57156', null);
INSERT INTO pago_atencion
VALUES ('404', TO_DATE('20/08/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), TO_DATE('03/09/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '17159', '17159', null);
INSERT INTO pago_atencion
VALUES ('405', TO_DATE('03/02/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), TO_DATE('03/02/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'),
        '11206', '11206', null);
INSERT INTO pago_atencion
VALUES ('406', TO_DATE('18/04/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), TO_DATE('18/04/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'),
        '59633', '59633', null);
INSERT INTO pago_atencion
VALUES ('407', TO_DATE('11/02/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), TO_DATE('11/02/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'),
        '12892', '12892', null);
INSERT INTO pago_atencion
VALUES ('408', TO_DATE('18/03/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), TO_DATE('18/03/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '4374', '4374', null);
INSERT INTO pago_atencion
VALUES ('409', TO_DATE('07/07/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), TO_DATE('07/07/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '19600', '19600', null);
INSERT INTO pago_atencion
VALUES ('410', TO_DATE('23/12/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), TO_DATE('23/12/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'),
        '49213', '49213', null);
INSERT INTO pago_atencion
VALUES ('411', TO_DATE('05/06/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), TO_DATE('05/06/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '49762', '49762', null);
INSERT INTO pago_atencion
VALUES ('412', TO_DATE('25/03/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), TO_DATE('25/03/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'),
        '28006', '28006', null);
INSERT INTO pago_atencion
VALUES ('413', TO_DATE('01/09/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), TO_DATE('01/09/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'),
        '16077', '16077', null);
INSERT INTO pago_atencion
VALUES ('414', TO_DATE('10/02/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), TO_DATE('15/02/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '31771', '31771', null);
INSERT INTO pago_atencion
VALUES ('415', TO_DATE('22/06/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), TO_DATE('22/06/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'),
        '46303', '46303', null);
INSERT INTO pago_atencion
VALUES ('416', TO_DATE('15/10/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), TO_DATE('15/10/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'),
        '32736', '32736', null);
INSERT INTO pago_atencion
VALUES ('417', TO_DATE('03/10/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), TO_DATE('03/10/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'),
        '16402', '16402', null);
INSERT INTO pago_atencion
VALUES ('418', TO_DATE('06/08/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), TO_DATE('06/08/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '15912', '15912', null);
INSERT INTO pago_atencion
VALUES ('419', TO_DATE('10/09/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), TO_DATE('12/09/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '45094', '45094', null);
INSERT INTO pago_atencion
VALUES ('420', TO_DATE('12/09/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), TO_DATE('13/09/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '10476', '10476', null);
INSERT INTO pago_atencion
VALUES ('421', TO_DATE('25/08/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), TO_DATE('29/08/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '17561', '17561', null);
INSERT INTO pago_atencion
VALUES ('422', TO_DATE('08/02/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), TO_DATE('10/02/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'),
        '15333', '15333', null);
INSERT INTO pago_atencion
VALUES ('423', TO_DATE('03/07/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), TO_DATE('03/07/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'),
        '8651', '8651', null);
INSERT INTO pago_atencion
VALUES ('424', TO_DATE('02/02/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), TO_DATE('09/02/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '44042', '44042', null);
INSERT INTO pago_atencion
VALUES ('425', TO_DATE('02/09/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), TO_DATE('03/09/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'),
        '45588', '45588', null);
INSERT INTO pago_atencion
VALUES ('426', TO_DATE('22/09/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), TO_DATE('24/09/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '3052', '3052', null);
INSERT INTO pago_atencion
VALUES ('427', TO_DATE('16/08/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), TO_DATE('16/08/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'),
        '22501', '22501', null);
INSERT INTO pago_atencion
VALUES ('428', TO_DATE('13/02/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), TO_DATE('13/02/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'),
        '50222', '50222', null);
INSERT INTO pago_atencion
VALUES ('429', TO_DATE('28/03/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), TO_DATE('28/03/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '19522', '19522', null);
INSERT INTO pago_atencion
VALUES ('430', TO_DATE('23/12/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), TO_DATE('23/12/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'),
        '42828', '42828', null);
INSERT INTO pago_atencion
VALUES ('431', TO_DATE('24/08/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), TO_DATE('21/08/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '63041', '63041', null);
INSERT INTO pago_atencion
VALUES ('432', TO_DATE('20/04/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), TO_DATE('20/04/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'),
        '28653', '28653', null);
INSERT INTO pago_atencion
VALUES ('434', TO_DATE('05/09/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), TO_DATE('05/09/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'),
        '51733', '51733', null);
INSERT INTO pago_atencion
VALUES ('435', TO_DATE('19/02/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), TO_DATE('25/02/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'),
        '10180', '10180', null);
INSERT INTO pago_atencion
VALUES ('436', TO_DATE('09/12/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), TO_DATE('09/12/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'),
        '25656', '25656', null);
INSERT INTO pago_atencion
VALUES ('437', TO_DATE('29/11/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), TO_DATE('29/11/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'),
        '41297', '41297', null);
INSERT INTO pago_atencion
VALUES ('438', TO_DATE('04/09/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), TO_DATE('04/09/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'),
        '41383', '41383', null);
INSERT INTO pago_atencion
VALUES ('439', TO_DATE('17/03/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), TO_DATE('17/03/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'),
        '11410', '11410', null);
INSERT INTO pago_atencion
VALUES ('440', TO_DATE('03/02/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), TO_DATE('03/02/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'),
        '10370', '10370', null);
INSERT INTO pago_atencion
VALUES ('441', TO_DATE('03/09/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), TO_DATE('20/09/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'),
        '53780', '53780', null);
INSERT INTO pago_atencion
VALUES ('442', TO_DATE('08/04/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), TO_DATE('08/04/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'),
        '11017', '11017', null);
INSERT INTO pago_atencion
VALUES ('443', TO_DATE('25/06/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), TO_DATE('25/06/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '10377', '10377', null);
INSERT INTO pago_atencion
VALUES ('444', TO_DATE('12/06/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), TO_DATE('12/06/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'),
        '33081', '33081', null);
INSERT INTO pago_atencion
VALUES ('445', TO_DATE('11/03/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), TO_DATE('11/03/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'),
        '27901', '27901', null);
INSERT INTO pago_atencion
VALUES ('446', TO_DATE('01/04/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), TO_DATE('01/04/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'),
        '62707', '62707', null);
INSERT INTO pago_atencion
VALUES ('447', TO_DATE('02/02/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), TO_DATE('07/02/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'),
        '47596', '47596', null);
INSERT INTO pago_atencion
VALUES ('448', TO_DATE('14/06/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), TO_DATE('14/06/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'),
        '46474', '46474', null);
INSERT INTO pago_atencion
VALUES ('449', TO_DATE('05/04/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), TO_DATE('05/04/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'),
        '60380', '60380', null);
INSERT INTO pago_atencion
VALUES ('450', TO_DATE('20/07/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), TO_DATE('20/07/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'),
        '16925', '16925', null);
INSERT INTO pago_atencion
VALUES ('451', TO_DATE('22/10/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), TO_DATE('22/10/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'),
        '16734', '16734', null);
INSERT INTO pago_atencion
VALUES ('452', TO_DATE('24/04/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), TO_DATE('24/04/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'),
        '11348', '11348', null);
INSERT INTO pago_atencion
VALUES ('453', TO_DATE('25/03/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), TO_DATE('25/03/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '18846', '18846', null);
INSERT INTO pago_atencion
VALUES ('454', TO_DATE('09/08/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), TO_DATE('09/08/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'),
        '22243', '22243', null);
INSERT INTO pago_atencion
VALUES ('456', TO_DATE('09/11/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), TO_DATE('09/11/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'),
        '58981', '58981', null);
INSERT INTO pago_atencion
VALUES ('457', TO_DATE('02/03/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), TO_DATE('02/03/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'),
        '6705', '6705', null);
INSERT INTO pago_atencion
VALUES ('458', TO_DATE('05/11/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), TO_DATE('05/11/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'),
        '19939', '19939', null);
INSERT INTO pago_atencion
VALUES ('459', TO_DATE('01/08/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), TO_DATE('01/08/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'),
        '17346', '17346', null);
INSERT INTO pago_atencion
VALUES ('460', TO_DATE('07/08/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), TO_DATE('07/08/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '14977', '14977', null);
INSERT INTO pago_atencion
VALUES ('461', TO_DATE('02/08/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), TO_DATE('02/08/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '39560', '39560', null);
INSERT INTO pago_atencion
VALUES ('462', TO_DATE('03/02/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), TO_DATE('03/02/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'),
        '37562', '37562', null);
INSERT INTO pago_atencion
VALUES ('463', TO_DATE('11/03/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), TO_DATE('11/03/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '28131', '28131', null);
INSERT INTO pago_atencion
VALUES ('464', TO_DATE('20/04/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), TO_DATE('20/04/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'),
        '18540', '18540', null);
INSERT INTO pago_atencion
VALUES ('465', TO_DATE('07/12/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), TO_DATE('07/12/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'),
        '61784', '61784', null);
INSERT INTO pago_atencion
VALUES ('466', TO_DATE('29/06/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), TO_DATE('29/06/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'),
        '4910', '4910', null);
INSERT INTO pago_atencion
VALUES ('467', TO_DATE('04/03/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), TO_DATE('04/03/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'),
        '50552', '50552', null);
INSERT INTO pago_atencion
VALUES ('468', TO_DATE('03/04/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), TO_DATE('03/04/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '50930', '50930', null);
INSERT INTO pago_atencion
VALUES ('469', TO_DATE('10/05/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), TO_DATE('10/05/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'),
        '33068', '33068', null);
INSERT INTO pago_atencion
VALUES ('470', TO_DATE('12/02/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), TO_DATE('03/02/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'),
        '32628', '32628', null);
INSERT INTO pago_atencion
VALUES ('471', TO_DATE('23/07/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), TO_DATE('23/07/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'),
        '44930', '44930', null);
INSERT INTO pago_atencion
VALUES ('472', TO_DATE('03/06/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), TO_DATE('03/06/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'),
        '10174', '10174', null);
INSERT INTO pago_atencion
VALUES ('473', TO_DATE('18/05/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), TO_DATE('18/05/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'),
        '15986', '15986', null);
INSERT INTO pago_atencion
VALUES ('474', TO_DATE('24/05/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), TO_DATE('24/05/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'),
        '61147', '61147', null);
INSERT INTO pago_atencion
VALUES ('475', TO_DATE('01/03/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), TO_DATE('01/03/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'),
        '38515', '38515', null);
INSERT INTO pago_atencion
VALUES ('476', TO_DATE('26/04/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), TO_DATE('26/04/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'),
        '28705', '28705', null);
INSERT INTO pago_atencion
VALUES ('477', TO_DATE('22/08/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), TO_DATE('02/09/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '52878', '52878', null);
INSERT INTO pago_atencion
VALUES ('478', TO_DATE('19/03/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), TO_DATE('19/03/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'),
        '20445', '20445', null);
INSERT INTO pago_atencion
VALUES ('479', TO_DATE('15/06/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), TO_DATE('15/06/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '23571', '23571', null);
INSERT INTO pago_atencion
VALUES ('480', TO_DATE('02/03/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), TO_DATE('02/03/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'),
        '16371', '16371', null);
INSERT INTO pago_atencion
VALUES ('481', TO_DATE('09/02/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), TO_DATE('07/02/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'),
        '8245', '8245', null);
INSERT INTO pago_atencion
VALUES ('482', TO_DATE('16/04/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), TO_DATE('16/04/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'),
        '24238', '24238', null);
INSERT INTO pago_atencion
VALUES ('483', TO_DATE('25/05/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), TO_DATE('25/05/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'),
        '13280', '13280', null);
INSERT INTO pago_atencion
VALUES ('484', TO_DATE('17/08/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), TO_DATE('17/08/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '62962', '62962', null);
INSERT INTO pago_atencion
VALUES ('485', TO_DATE('02/08/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), TO_DATE('02/08/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '19111', '19111', null);
INSERT INTO pago_atencion
VALUES ('486', TO_DATE('13/01/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), TO_DATE('13/01/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '48595', '48595', null);
INSERT INTO pago_atencion
VALUES ('487', TO_DATE('03/07/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), TO_DATE('03/07/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '49037', '49037', null);
INSERT INTO pago_atencion
VALUES ('488', TO_DATE('24/08/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), TO_DATE('24/08/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'),
        '23748', '23748', null);
INSERT INTO pago_atencion
VALUES ('489', TO_DATE('10/03/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), TO_DATE('10/03/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'),
        '9135', '9135', null);
INSERT INTO pago_atencion
VALUES ('491', TO_DATE('17/02/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), TO_DATE('16/02/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'),
        '45711', '45711', null);
INSERT INTO pago_atencion
VALUES ('492', TO_DATE('26/08/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), TO_DATE('01/09/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '32330', '32330', null);
INSERT INTO pago_atencion
VALUES ('493', TO_DATE('15/03/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), TO_DATE('15/03/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'),
        '18151', '18151', null);
INSERT INTO pago_atencion
VALUES ('495', TO_DATE('23/06/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), TO_DATE('23/06/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '25826', '25826', null);
INSERT INTO pago_atencion
VALUES ('496', TO_DATE('09/04/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), TO_DATE('09/04/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'),
        '36254', '36254', null);
INSERT INTO pago_atencion
VALUES ('497', TO_DATE('25/03/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), TO_DATE('25/03/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'),
        '5594', '5594', null);
INSERT INTO pago_atencion
VALUES ('499', TO_DATE('25/08/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), TO_DATE('20/08/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '14422', '14422', null);
INSERT INTO pago_atencion
VALUES ('500', TO_DATE('02/09/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), TO_DATE('28/08/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '26338', '26338', null);
INSERT INTO pago_atencion
VALUES ('501', TO_DATE('16/07/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), TO_DATE('16/07/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'),
        '15629', '15629', null);
INSERT INTO pago_atencion
VALUES ('503', TO_DATE('27/12/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), TO_DATE('27/12/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'),
        '56925', '56925', null);
INSERT INTO pago_atencion
VALUES ('504', TO_DATE('11/07/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), TO_DATE('11/07/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'),
        '6286', '6286', null);
INSERT INTO pago_atencion
VALUES ('505', TO_DATE('29/08/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), TO_DATE('29/08/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '38419', '38419', null);
INSERT INTO pago_atencion
VALUES ('506', TO_DATE('10/02/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), TO_DATE('19/02/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'),
        '26598', '26598', null);
INSERT INTO pago_atencion
VALUES ('508', TO_DATE('05/09/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), TO_DATE('05/09/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '48559', '48559', null);
INSERT INTO pago_atencion
VALUES ('509', TO_DATE('14/04/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), TO_DATE('14/04/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'),
        '7299', '7299', null);
INSERT INTO pago_atencion
VALUES ('510', TO_DATE('22/06/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), TO_DATE('22/06/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '18938', '18938', null);
INSERT INTO pago_atencion
VALUES ('512', TO_DATE('28/05/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), TO_DATE('28/05/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'),
        '11059', '11059', null);
INSERT INTO pago_atencion
VALUES ('513', TO_DATE('11/05/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), TO_DATE('11/05/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '49490', '49490', null);
INSERT INTO pago_atencion
VALUES ('514', TO_DATE('04/02/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), TO_DATE('09/02/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'),
        '45008', '45008', null);
INSERT INTO pago_atencion
VALUES ('516', TO_DATE('13/08/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), TO_DATE('13/08/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'),
        '7643', '7643', null);
INSERT INTO pago_atencion
VALUES ('517', TO_DATE('14/02/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), TO_DATE('14/02/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'),
        '14048', '14048', null);
INSERT INTO pago_atencion
VALUES ('518', TO_DATE('12/02/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), TO_DATE('28/02/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '16234', '16234', null);
INSERT INTO pago_atencion
VALUES ('519', TO_DATE('15/02/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), TO_DATE('15/02/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'),
        '56304', '56304', null);
INSERT INTO pago_atencion
VALUES ('521', TO_DATE('08/05/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), TO_DATE('08/05/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '8826', '8826', null);
INSERT INTO pago_atencion
VALUES ('522', TO_DATE('11/04/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), TO_DATE('11/04/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'),
        '35411', '35411', null);
INSERT INTO pago_atencion
VALUES ('523', TO_DATE('10/06/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), TO_DATE('10/06/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'),
        '40886', '40886', null);
INSERT INTO pago_atencion
VALUES ('525', TO_DATE('10/09/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), TO_DATE('10/09/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'),
        '13147', '13147', null);
INSERT INTO pago_atencion
VALUES ('526', TO_DATE('23/10/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), TO_DATE('23/10/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'),
        '12999', '12999', null);
INSERT INTO pago_atencion
VALUES ('527', TO_DATE('27/08/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), TO_DATE('27/08/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'),
        '20351', '20351', null);
INSERT INTO pago_atencion
VALUES ('529', TO_DATE('25/09/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), TO_DATE('26/09/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '16473', '16473', null);
INSERT INTO pago_atencion
VALUES ('530', TO_DATE('10/09/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), TO_DATE('12/09/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '55253', '55253', null);
INSERT INTO pago_atencion
VALUES ('531', TO_DATE('14/07/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), TO_DATE('14/07/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '36071', '36071', null);
INSERT INTO pago_atencion
VALUES ('533', TO_DATE('08/02/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), TO_DATE('08/02/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'),
        '6550', '6550', null);
INSERT INTO pago_atencion
VALUES ('534', TO_DATE('11/07/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), TO_DATE('11/07/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '56034', '56034', null);
INSERT INTO pago_atencion
VALUES ('535', TO_DATE('07/05/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), TO_DATE('07/05/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'),
        '52000', '52000', null);
INSERT INTO pago_atencion
VALUES ('536', TO_DATE('19/09/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), TO_DATE('19/09/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'),
        '8491', '8491', null);
INSERT INTO pago_atencion
VALUES ('538', TO_DATE('03/12/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), TO_DATE('03/12/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'),
        '38218', '38218', null);
INSERT INTO pago_atencion
VALUES ('539', TO_DATE('19/05/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), TO_DATE('19/05/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'),
        '18689', '18689', null);
INSERT INTO pago_atencion
VALUES ('540', TO_DATE('02/06/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), TO_DATE('02/06/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '14343', '14343', null);
INSERT INTO pago_atencion
VALUES ('542', TO_DATE('08/02/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), TO_DATE('20/02/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'),
        '16852', '16852', null);
INSERT INTO pago_atencion
VALUES ('543', TO_DATE('10/07/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), TO_DATE('10/07/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '11147', '11147', null);
INSERT INTO pago_atencion
VALUES ('544', TO_DATE('03/04/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), TO_DATE('03/04/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'),
        '22499', '22499', null);
INSERT INTO pago_atencion
VALUES ('546', TO_DATE('07/02/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), TO_DATE('05/02/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'),
        '7370', '7370', null);
INSERT INTO pago_atencion
VALUES ('547', TO_DATE('02/05/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), TO_DATE('02/05/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'),
        '21216', '21216', null);
INSERT INTO pago_atencion
VALUES ('548', TO_DATE('29/10/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), TO_DATE('29/10/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'),
        '45224', '45224', null);
INSERT INTO pago_atencion
VALUES ('549', TO_DATE('28/04/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), TO_DATE('28/04/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'),
        '22513', '22513', null);
INSERT INTO pago_atencion
VALUES ('551', TO_DATE('28/04/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), TO_DATE('28/04/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'),
        '15396', '15396', null);
INSERT INTO pago_atencion
VALUES ('552', TO_DATE('27/08/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'), TO_DATE('27/08/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 1), 'DD-MM-YYYY'),
        '12806', '12806', null);
INSERT INTO pago_atencion
VALUES ('553', TO_DATE('06/09/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), TO_DATE('10/09/' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), '12581', '12581', null);
INSERT INTO pago_atencion
VALUES ('555', TO_DATE('11/02/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'), TO_DATE('20/02/' || TO_CHAR(TO_CHAR(SYSDATE, 'YYYY') - 2), 'DD-MM-YYYY'),
        '52852', '52852', null);

-- ****************** CREACION DE CLAVES FOriaNEAS *****************
ALTER TABLE MEDICO
    ADD CONSTRAINT FK_UNIDAD FOREIGN KEY (uni_id) REFERENCES UNIDAD (uni_id);
ALTER TABLE MEDICO
    ADD CONSTRAINT FK_CARGO FOREIGN KEY (car_id) REFERENCES CARGO (car_id);
ALTER TABLE ESPECIALIDAD_MEDICO
    ADD CONSTRAINT FK_ESPECIALIDAD_MEDICO_MED FOREIGN KEY (med_run) REFERENCES MEDICO (med_run);
ALTER TABLE ESPECIALIDAD_MEDICO
    ADD CONSTRAINT FK_ESPECIALIDAD_MEDICO_ESP FOREIGN KEY (esp_id) REFERENCES ESPECIALIDAD (esp_id);
ALTER TABLE PACIENTE
    ADD CONSTRAINT FK_SALUD FOREIGN KEY (sal_id) REFERENCES SALUD (sal_id);
ALTER TABLE SALUD
    ADD CONSTRAINT FK_TIPO_SALUD FOREIGN KEY (tipo_sal_id) REFERENCES TIPO_SALUD (tipo_sal_id);
ALTER TABLE ATENCION
    ADD CONSTRAINT FK_MEDICO_ESP FOREIGN KEY (med_run, esp_id) REFERENCES ESPECIALIDAD_MEDICO (med_run, esp_id);
ALTER TABLE ATENCION
    ADD CONSTRAINT FK_PACIENTE FOREIGN KEY (pac_run) REFERENCES PACIENTE (pac_run);
ALTER TABLE PAGO_ATENCION
    ADD CONSTRAINT FK_PAGO_ATENCION FOREIGN KEY (ate_id) REFERENCES ATENCION (ate_id);
ALTER TABLE UNIDAD
    ADD CONSTRAINT FK_UNIDAD_MEDICO FOREIGN KEY (jefe_unidad) REFERENCES MEDICO (med_run);
COMMIT;