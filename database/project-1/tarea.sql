CREATE SEQUENCE SEQ_PROFESION
    START WITH 1
    INCREMENT BY 1;

CREATE SEQUENCE SEQ_TRABAJADOR
    START WITH 1
    INCREMENT BY 1;

CREATE TABLE PROFESION (
    cod_prof    NUMBER(3)    NOT NULL,
    nombre_prof VARCHAR2(50) NOT NULL,
    CONSTRAINT PK_PROFESION PRIMARY KEY (cod_prof)
);

CREATE TABLE TRABAJADOR (
    id        NUMBER(5)    NOT NULL,
    numrut    NUMBER(10)   NOT NULL,
    dvrut     VARCHAR2(1)  NOT NULL,
    pnombre   VARCHAR2(50) NOT NULL,
    snombre   VARCHAR2(50),
    appaterno VARCHAR2(50) NOT NULL,
    apmaterno VARCHAR2(50),
    cod_prof  NUMBER(3)    NOT NULL,
    sueldo    NUMBER(10)   NOT NULL,
    CONSTRAINT PK_TRABAJADOR PRIMARY KEY (id),
    CONSTRAINT FK_TRABAJADOR_PROFESION FOREIGN KEY (cod_prof) REFERENCES PROFESION (cod_prof)
);

INSERT INTO PROFESION VALUES (SEQ_PROFESION.NEXTVAL, 'Abogado');
INSERT INTO PROFESION VALUES (SEQ_PROFESION.NEXTVAL, 'Ingeniero comercial');
INSERT INTO PROFESION VALUES (SEQ_PROFESION.NEXTVAL, 'Ingeniero en Informática');
INSERT INTO PROFESION VALUES (SEQ_PROFESION.NEXTVAL, 'Ingeniero en Redes y Telecomunicaciones');
INSERT INTO PROFESION VALUES (SEQ_PROFESION.NEXTVAL, 'Medico');

INSERT INTO TRABAJADOR VALUES ('1', '8333032', '5', 'RODOLFO ', 'SERGIO', 'FRITZ', 'OTAROLA', 1, 800000);
INSERT INTO TRABAJADOR VALUES ('2', '16000472', 'k', 'ROBERTO', 'JUAN', 'MENDEZ', 'GIRARDI', 2, 1200000);
INSERT INTO TRABAJADOR VALUES ('3', '16044255', '7', 'STEPHANIE', null, 'DIAZ', 'KOHNERT', 3, 1500000);
INSERT INTO TRABAJADOR VALUES ('4', '10534911', '4', 'CATALINA', 'ANDREA', 'AGUIRRE', 'PEREIRA', 4, 2000000);
INSERT INTO TRABAJADOR VALUES ('5', '21425048', '9', 'SEBASTIAN', 'PATRICIO', 'QUINTANA', 'BERRIOS', 5, 3000000);
INSERT INTO TRABAJADOR VALUES ('6', '21815820', 'k', 'HERNAN', 'CESAR', 'CASTRO', 'VALLADARES', 1, 800000);

INSERT INTO TRABAJADOR VALUES ('7', '10006101', '5', 'JOSE', null, 'LARA', 'PEREZ', 5, 930870);
INSERT INTO TRABAJADOR VALUES ('8', '4808258', '0', 'POLICARPO', null, 'URRUTIA', 'MUÑOZ', 5, 959733);

SELECT *
FROM TRABAJADOR;

DECLARE
    n_sueldo       NUMBER;
    n_bono         NUMBER := 0;
    n_sueldo_final NUMBER;
    n_run          NUMBER;
    v_dvrun        VARCHAR2(1);
    v_nombre       VARCHAR2(50);
    v_apellido     VARCHAR(50);

BEGIN
    n_run := &run_input;

    SELECT sueldo, dvrut, pnombre, appaterno
    INTO n_sueldo, v_dvrun, v_nombre, v_apellido
    FROM TRABAJADOR
    WHERE numrut = n_run;

    IF n_sueldo < 1000000 THEN
        n_bono := n_sueldo * 0.15;
    END IF;

    n_sueldo_final := n_sueldo + n_bono;

-- Imprimir resultados
    DBMS_OUTPUT.PUT_LINE('Nombre: ' || v_nombre || ' ' || v_apellido);
    DBMS_OUTPUT.PUT_LINE('RUN: ' || n_run || '-' || v_dvrun);
    DBMS_OUTPUT.PUT_LINE('Sueldo Actual: ' || TO_CHAR(n_sueldo, 'L999G999G990D00'));
    DBMS_OUTPUT.PUT_LINE('Bono extra (15%): ' || TO_CHAR(n_bono, 'L999G999G990D00'));
    DBMS_OUTPUT.PUT_LINE('Sueldo final con Bono: ' || TO_CHAR(n_sueldo_final, 'L999G999G990D00'));

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No se encontró un empleado con el RUN proporcionado.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al calcular el bono: ' || SQLERRM);
END;