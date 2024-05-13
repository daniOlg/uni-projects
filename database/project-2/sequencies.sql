-- USANDO PLSQL/ORACLE DATABASE

-- procedimientos
-- verificar si paciente existe con rut
CREATE OR REPLACE PROCEDURE verificar_paciente(
    p_pac_run IN PACIENTE.pac_run%TYPE,
    p_dv_run IN PACIENTE.dv_run%TYPE,
    p_existe OUT BOOLEAN
) AS
    v_rut PACIENTE.pac_run%TYPE;
BEGIN
    SELECT pac_run
    INTO v_rut
    FROM PACIENTE
    WHERE pac_run = p_pac_run AND dv_run = p_dv_run;
    p_existe := TRUE;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        p_existe := FALSE;
END verificar_paciente;

-- registrar atencion siempre y cuando el paciente exista
CREATE OR REPLACE PROCEDURE registrar_atencion(
    p_ate_id IN ATENCION.ate_id%TYPE,
    p_fecha_atencion IN ATENCION.fecha_atencion%TYPE DEFAULT SYSDATE,
    p_hr_atencion IN ATENCION.hr_atencion%TYPE DEFAULT TO_CHAR(SYSDATE, 'HH24:MI'),
    p_costo IN ATENCION.costo%TYPE,
    p_med_run IN ATENCION.med_run%TYPE,
    p_esp_id IN ATENCION.esp_id%TYPE,
    p_pac_run IN ATENCION.pac_run%TYPE,
    p_pac_dv_run IN PACIENTE.dv_run%TYPE,
    p_resultado OUT VARCHAR2
) AS
    v_existe BOOLEAN;
BEGIN
    verificar_paciente(p_pac_run, p_pac_dv_run, v_existe);
    IF v_existe THEN
        INSERT INTO ATENCION
        VALUES (p_ate_id, p_fecha_atencion, p_hr_atencion, p_costo, p_med_run, p_esp_id, p_pac_run);
        p_resultado := 'Atencion registrada';
    ELSE
        p_resultado := 'Paciente no existe';
    END IF;
END registrar_atencion;

-- consultar atenciones dentro de un rango de fecha
CREATE OR REPLACE PROCEDURE consultar_atenciones(
    p_fecha_inicio IN DATE,
    p_fecha_fin IN DATE
) AS
BEGIN
    FOR atencion IN (
        SELECT *
        FROM ATENCION
        WHERE fecha_atencion BETWEEN p_fecha_inicio AND p_fecha_fin
    ) LOOP
        DBMS_OUTPUT.PUT_LINE('ID: ' || atencion.ate_id || ' - Fecha: ' || atencion.fecha_atencion || ' - Hora: ' || atencion.hr_atencion || ' - Costo: ' || atencion.costo);
    END LOOP;
END consultar_atenciones;

-- actualizar sueldo base de un medico por especialidad
CREATE OR REPLACE PROCEDURE actualizar_sueldo_base_medico(
    p_med_run IN MEDICO.med_run%TYPE,
    p_sueldo_base IN MEDICO.sueldo_base%TYPE
) AS
BEGIN
    UPDATE MEDICO
    SET sueldo_base = p_sueldo_base
    WHERE med_run = p_med_run;
END actualizar_sueldo_base_medico;

-- calcular edad de un paciente por rut
CREATE OR REPLACE PROCEDURE calcular_edad_paciente(
    p_pac_run IN PACIENTE.pac_run%TYPE,
    p_dv_run IN PACIENTE.dv_run%TYPE,
    p_edad OUT NUMBER
) AS
    v_fecha_nacimiento PACIENTE.fecha_nacimiento%TYPE;
BEGIN
    SELECT fecha_nacimiento
    INTO v_fecha_nacimiento
    FROM PACIENTE
    WHERE pac_run = p_pac_run AND dv_run = p_dv_run;
    p_edad := TRUNC(MONTHS_BETWEEN(SYSDATE, v_fecha_nacimiento) / 12);
END calcular_edad_paciente;

-- Probar procedimientos
-- verificar_paciente
DECLARE
    v_existe BOOLEAN;
BEGIN
    verificar_paciente(6215470, '5', v_existe);
    IF v_existe THEN
        DBMS_OUTPUT.PUT_LINE('Paciente existe');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Paciente no existe');
    END IF;
END;

-- registrar_atencion
DECLARE
    v_resultado VARCHAR2(50);
BEGIN
    registrar_atencion(600, SYSDATE, '10:00', 10000, 3126425, 900, 6215470, '5', v_resultado);
    DBMS_OUTPUT.PUT_LINE(v_resultado);
END;

-- consultar_atenciones
BEGIN
    consultar_atenciones(TO_DATE('01/12/2023', 'DD/MM/YYYY'), TO_DATE('25/12/2024', 'DD/MM/YYYY'));
END;

-- actualizar_sueldo_base_medico
BEGIN
    actualizar_sueldo_base_medico(3126425, 1500000);
END;

-- calcular_edad_paciente
DECLARE
    v_edad NUMBER;
BEGIN
    calcular_edad_paciente(7000164, '0', v_edad);
    DBMS_OUTPUT.PUT_LINE('Edad: ' || v_edad);
END;