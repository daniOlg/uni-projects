-- USANDO PLSQL/ORACLE DATABASE

-- Procedimientos
-- Verificar existencia de paciente con rut
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

-- Registrar atencion siempre y cuadno el paciente exista
CREATE OR REPLACE PROCEDURE registrar_atencion(
    p_ate_id IN ATENCION.ate_id%TYPE,
    p_fecha_atencion IN ATENCION.fecha_atencion%TYPE,
    p_hr_atencion IN ATENCION.hr_atencion%TYPE,
    p_costo IN ATENCION.costo%TYPE,
    p_med_run IN ATENCION.med_run%TYPE,
    p_esp_id IN ATENCION.esp_id%TYPE,
    p_pac_run IN ATENCION.pac_run%TYPE,
    p_resultado OUT VARCHAR2
) AS
    v_existe BOOLEAN;
BEGIN
    verificar_paciente(p_pac_run, v_existe);
    IF v_existe THEN
        INSERT INTO ATENCION
        VALUES (p_ate_id, p_fecha_atencion, p_hr_atencion, p_costo, p_med_run, p_esp_id, p_pac_run);
        p_resultado := 'Atencion registrada';
    ELSE
        p_resultado := 'Paciente no existe';
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        p_resultado := 'Error al registrar atencion';
END registrar_atencion;

-- Consultar atenciones por rango de fecha
CREATE OR REPLACE PROCEDURE consultar_atenciones(
    p_fecha_inicio IN ATENCION.fecha_atencion%TYPE,
    p_fecha_fin IN ATENCION.fecha_atencion%TYPE,
    p_resultado OUT SYS_REFCURSOR
) AS
BEGIN
    OPEN p_resultado FOR
        SELECT *
        FROM ATENCION
        WHERE fecha_atencion BETWEEN p_fecha_inicio AND p_fecha_fin;
END consultar_atenciones;

-- Probar procedimientos
-- Verificar existencia de paciente
DECLARE
    v_existe BOOLEAN;
BEGIN
    verificar_paciente('19522', v_existe);
    IF v_existe THEN
        DBMS_OUTPUT.PUT_LINE('Paciente existe');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Paciente no existe');
    END IF;
END;

-- Registrar atencion
DECLARE
    v_resultado VARCHAR2(100);
BEGIN
    registrar_atencion('557', '01/01/2021', '10:00', 10000, '19522', '50222', '19522', v_resultado);
    DBMS_OUTPUT.PUT_LINE(v_resultado);
END;

-- Consultar atenciones por rango de fecha
DECLARE
    v_cursor         SYS_REFCURSOR;
    v_ate_id         ATENCION.ate_id%TYPE;
    v_fecha_atencion ATENCION.fecha_atencion%TYPE;
    v_hr_atencion    ATENCION.hr_atencion%TYPE;
    v_costo          ATENCION.costo%TYPE;
    v_med_run        ATENCION.med_run%TYPE;
    v_esp_id         ATENCION.esp_id%TYPE;
    v_pac_run        ATENCION.pac_run%TYPE;
BEGIN
    consultar_atenciones('01/01/2021', '31/12/2021', v_cursor);
    LOOP
        FETCH v_cursor INTO v_ate_id, v_fecha_atencion, v_hr_atencion, v_costo, v_med_run, v_esp_id, v_pac_run;
        EXIT WHEN v_cursor%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE(v_ate_id || ' ' || v_fecha_atencion || ' ' || v_hr_atencion || ' ' || v_costo || ' ' ||
                             v_med_run || ' ' || v_esp_id || ' ' || v_pac_run);
    END LOOP;
    CLOSE v_cursor;
END;