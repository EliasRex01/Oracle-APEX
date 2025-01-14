PROMPT CREATE OR REPLACE PACKAGE pkg_geolocalizacion_cliente
CREATE OR REPLACE package pkg_geolocalizacion_cliente as

PROCEDURE geo01050(
                p_cod_cliente   IN  VARCHAR2 DEFAULT ' ',
                p_fec_desde     IN  cliente_coordenada.fec_coordenada%TYPE DEFAULT NULL,
                p_fec_hasta     IN  cliente_coordenada.fec_coordenada%TYPE DEFAULT NULL
);

end "PKG_GEOLOCALIZACION_CLIENTE";
/

PROMPT CREATE OR REPLACE PACKAGE BODY pkg_geolocalizacion_cliente
CREATE OR REPLACE package body pkg_geolocalizacion_cliente as

-- IA: muchacho
-- 2024/10/23 16:07:04
-- Source:geo01050.osq

-- Editado por: Matheo Maidana
-- 2024/10/28
-- Paquete para la aplicación geo01000: Geolocalizacion del cliente

PROCEDURE geo01050(
                p_cod_cliente   IN  VARCHAR2 DEFAULT ' ',
                p_fec_desde     IN  cliente_coordenada.fec_coordenada%TYPE DEFAULT NULL,
                p_fec_hasta     IN  cliente_coordenada.fec_coordenada%TYPE DEFAULT NULL
)
IS
    --ESTOS cod_cliente SON RANGOS
    v_cod_cliente_d  cliente_coordenada.cod_cliente%TYPE := 0;
    v_cod_cliente_h  cliente_coordenada.cod_cliente%TYPE := 0;

    --ESTE ES EL QUE SE USA PARA ANALIZAR DE A UNO
    v_cod_cliente_l         cliente_coordenada.cod_cliente%TYPE := 0;

    v_latitud_resultado     cliente_coordenada_moda.latitud_resultado%TYPE      := ' ';
    v_longitud_resultado    cliente_coordenada_moda.longitud_resultado%TYPE     := ' ';
    v_lati_longi_resultado  cliente_coordenada_moda.lati_longi_resultado%TYPE   := ' ';
    v_cant_universo         cliente_coordenada_moda.cant_universo%TYPE          := 0;

    v_p               VARCHAR2 (100)    := ' ';
    v_i               NUMBER            := 0;
    v_parametro       VARCHAR2 (250)    := ' ';
    v_contador        NUMBER            := 0;
    v_latitud         VARCHAR2 (10)     := ' ';
    v_longitud        VARCHAR2 (10)     := ' ';
    v_lati_longi      VARCHAR2 (20)     := ' ';
    v_nro_generacion  cliente_coordenada_moda.nro_generacion%TYPE := 0;
    v_nro_item_nuevo  cliente_coordenada.nro_item%TYPE := 0;

    v_g_usuario       VARCHAR2 (8) := fn_user;
    v_g_fec_ingrid    DATE;
    v_p_cod_cliente   VARCHAR2 (10);
    v_p_fec_desde     DATE;
    v_p_fec_hasta     DATE;
    v_sql_rowcount    NUMBER;
BEGIN
	-- aqui se crea la coleccion para evitar el fallo del commit en el cursor del dblink
 apex_collection.create_or_truncate_collection(p_collection_name => 'TMP_INSERT_COORDENADA_MODA');
    v_p_fec_hasta   := p_fec_hasta;
    v_p_fec_desde   := p_fec_desde;
    v_p_cod_cliente := p_cod_cliente;

    pkg_ic.inicializar;

    v_g_fec_ingrid  := pkg_ic.g_fec_ingrid;

    IF v_p_cod_cliente != '*' THEN
        v_cod_cliente_d := TRUNC(v_p_cod_cliente);
        v_cod_cliente_h := TRUNC(v_p_cod_cliente);
    ELSE
        v_cod_cliente_d := 0;
        v_cod_cliente_h := 2000000000;
    END IF;

    IF fn_bandera THEN
        DECLARE
            l_query_1   VARCHAR2(4000);
            l_cursor_1  BINARY_INTEGER;
            l_nr_1      NUMBER := 0;
        BEGIN
            l_query_1 :='SELECT
                          ifnull( MAX (nro_generacion), 0) + 1
                        FROM cliente_coordenada_moda';
            l_cursor_1 := dbms_hs_passthrough.open_cursor@wrk1; -- OPEN __CURSOR
            dbms_hs_passthrough.parse@wrk1(l_cursor_1,l_query_1);

            l_nr_1 := dbms_hs_passthrough.fetch_row@wrk1(l_cursor_1,FALSE);

            IF l_nr_1 >= 1 THEN
                dbms_hs_passthrough.get_value@wrk1(l_cursor_1,  1,  v_nro_generacion);
            END IF;
            dbms_hs_passthrough.close_cursor@wrk1(l_cursor_1); -- CLOSE __CURSOR
        EXCEPTION
            WHEN No_Data_Found THEN
                NULL;
            WHEN OTHERS THEN
                ROLLBACK;
                Raise_Application_Error (-20001,'Error al seleccionar nro. de generación...' || '' || ' ' || SQLERRM);
        END;
    ELSE
        BEGIN 
            SELECT
                NVL( MAX(nro_generacion),0) + 1
            INTO
                v_nro_generacion
            FROM cliente_coordenada_moda;
        EXCEPTION
            WHEN No_Data_Found THEN
                NULL;
            WHEN OTHERS THEN
                ROLLBACK;
                Raise_Application_Error (-20002,'Error al seleccionar nro. de generación...' || '' || ' ' || SQLERRM);
        END;
    END IF;
    COMMIT;

    IF fn_bandera THEN

        DECLARE
            l_query_2   VARCHAR2(4000);
            l_cursor_2  BINARY_INTEGER;
            l_nr_2      NUMBER := 0;
        BEGIN
            v_sql_rowcount := 0;
            --COMMIT;
            apex_collection.create_or_truncate_collection('TEMP_CLIENTES');
            l_query_2 := 'SELECT DISTINCT (a.cod_cliente)
                  FROM cliente_coordenada a, gestion_cobranza_cliente b
                WHERE a.cod_cliente >= ?
                  AND a.cod_cliente     <= ?
                  AND a.fec_coordenada  >= ?
                  AND a.fec_coordenada  <= ?
                  AND a.cod_cliente = b.cod_cliente
                  AND b.periodo = date_trunc(''mos'',?)
                  AND b.fase IN (''FASE3'', ''FASE2'', ''FASE1'', ''FASE0'')
                AND b.tipo_comercio = ''MINORISTA''
                AND a.cod_cliente NOT IN ( SELECT cod_cliente
                                        FROM cliente_coordenada
                                      WHERE para_localizar_cliente = 1)';

                l_cursor_2 := dbms_hs_passthrough.open_cursor@wrk1;   -- OPEN __CURSOR
                dbms_hs_passthrough.parse@wrk1(l_cursor_2, l_query_2);
                dbms_hs_passthrough.bind_variable@wrk1(l_cursor_2,  1,  v_cod_cliente_d);
                dbms_hs_passthrough.bind_variable@wrk1(l_cursor_2,  2,  v_cod_cliente_h);
                dbms_hs_passthrough.bind_variable@wrk1(l_cursor_2,  3,  v_p_fec_desde);
                dbms_hs_passthrough.bind_variable@wrk1(l_cursor_2,  4,  v_p_fec_hasta);
                dbms_hs_passthrough.bind_variable@wrk1(l_cursor_2,  5,  v_g_fec_ingrid);

            LOOP
                l_nr_2 := dbms_hs_passthrough.fetch_row@wrk1(l_cursor_2,FALSE);
                EXIT WHEN l_nr_2 = 0;
                v_sql_rowcount := v_sql_rowcount + 1;
                dbms_hs_passthrough.get_value@wrk1(l_cursor_2, 1, v_cod_cliente_l); 
				-- se agregan elementos del passtrough a la coleccion
                apex_collection.add_member(p_collection_name => 'TEMP_CLIENTES',
                                           p_n001 => v_cod_cliente_l);
            END LOOP;
            dbms_hs_passthrough.close_cursor@wrk1(l_cursor_2); -- CLOSE __CURSOR
            IF v_sql_rowcount  <= 0 THEN
                RAISE NO_DATA_FOUND;
            END IF;
            FOR i IN (SELECT n001 cod_cliente_l
                      FROM apex_collections
                      WHERE collection_name = 'TEMP_CLIENTES')
            LOOP
                BEGIN 
                    SELECT
                        count(a.cod_cliente)
                    INTO
                        v_cant_universo
                    FROM cliente_coordenada a, agenda_seg_coordenada age, gestion_morosidad_seg seg, situ_coordenadas situ
                    WHERE a.cod_cliente  = i.cod_cliente_l
                        AND a.fec_coordenada  >= v_p_fec_desde
                        AND a.fec_coordenada  <= v_p_fec_hasta
                        AND a.cod_cliente     = age.cod_cliente
                        AND a.nro_item        = age.nro_item_coordenada
                        AND age.cod_sucursal  = seg.cod_sucursal
                        AND age.fec_planilla  = seg.fec_planilla
                        AND age.nro_planilla  = seg.nro_planilla
                        AND age.nro_item      = seg.nro_item
                        AND age.item_seg      = seg.item_seg
                        AND seg.cod_situ      = situ.cod_situ;
                EXCEPTION
                    WHEN No_Data_Found THEN
                        NULL;
                    WHEN OTHERS THEN
                        Raise_Application_Error (-20003,'Error al contar universo de coordenadas del clte...' || i.cod_cliente_l || ' ' || ' ' || SQLERRM);
                END;

                --COMMIT;
                DECLARE
                    l_query_4     VARCHAR2(4000);
                    l_cursor_4    BINARY_INTEGER;
                    l_nr_4        NUMBER := 0;
                    l_latitud     VARCHAR2(10);
                    l_longitud    VARCHAR2(10);
                    l_lati_longi  VARCHAR2(20);
                BEGIN

                    l_query_4 := 'SELECT
                         decimal(a.latitud,6,4),
                         decimal(a.longitud,6,4),
                         varchar(decimal(a.latitud,6,4)) + '','' + varchar(decimal(a.longitud,6,4))
                     FROM cliente_coordenada a, agenda_seg_coordenada b, gestion_morosidad_seg c, situ_coordenadas d
                     WHERE a.cod_cliente = ?
                       AND a.fec_coordenada >= ?
                       AND a.fec_coordenada <= ?
                       AND a.cod_cliente = b.cod_cliente
                       AND a.nro_item = b.nro_item_coordenada
                       AND b.cod_sucursal = c.cod_sucursal
                       AND b.fec_planilla = c.fec_planilla
                       AND b.nro_planilla = c.nro_planilla
                       AND b.nro_item = c.nro_item
                       AND b.item_seg = c.item_seg
                       AND c.cod_situ = d.cod_situ';
                    l_cursor_4 := dbms_hs_passthrough.open_cursor@wrk1;  -- OPEN __CURSOR
                    dbms_hs_passthrough.parse@wrk1(l_cursor_4,l_query_4);

                    dbms_hs_passthrough.bind_variable@wrk1(l_cursor_4,  1,  i.cod_cliente_l);
                    dbms_hs_passthrough.bind_variable@wrk1(l_cursor_4,  2,  v_p_fec_desde);
                    dbms_hs_passthrough.bind_variable@wrk1(l_cursor_4,  3,  v_p_fec_hasta);
                    LOOP
                        l_nr_4 := dbms_hs_passthrough.fetch_row@wrk1(l_cursor_4,FALSE);
                        EXIT WHEN l_nr_4 = 0;
                        dbms_hs_passthrough.get_value@wrk1(l_cursor_4,  1,  l_latitud);
                        dbms_hs_passthrough.get_value@wrk1(l_cursor_4,  2,  l_longitud);
                        dbms_hs_passthrough.get_value@wrk1(l_cursor_4,  3,  l_lati_longi);

                        apex_collection.create_or_truncate_collection(p_collection_name => 'TMP_COORDENADAS_CORTAS');
                        APEX_COLLECTION.ADD_MEMBER(
                            P_COLLECTION_NAME => 'TMP_COORDENADAS_CORTAS',
                               P_C001            => l_latitud,
                               P_C002            => l_longitud,
                               P_C003            => l_lati_longi
                        );
                    END LOOP;
                    dbms_hs_passthrough.close_cursor@wrk1(l_cursor_4); -- CLOSE __CURSOR
                EXCEPTION
                    WHEN OTHERS THEN
                        Raise_Application_Error(-20004,'texto del error' || ' ' || SQLERRM);
                END;
                BEGIN 
                    SELECT
                         count(C001), -- C001 es latitud
                         C001
                    INTO
                         v_contador,
                         v_latitud_resultado
                    FROM apex_collections WHERE collection_name = 'TMP_COORDENADAS_CORTAS'
                        GROUP BY C001
                        ORDER BY v_contador DESC
                        FETCH first 1 ROWS only;
                EXCEPTION
                    WHEN No_Data_Found THEN
                      NULL;
                    WHEN OTHERS THEN
                        ROLLBACK;
                        Raise_Application_Error (-20005,'Error al seleccionar MODA latitud...' || '' || ' ' || SQLERRM);
                END;
                BEGIN 
                    SELECT count(C002), -- C002 es longitud
                           C002
                    INTO v_contador,
                         v_longitud_resultado
                    FROM apex_collections WHERE collection_name = 'TMP_COORDENADAS_CORTAS'
                    GROUP BY C002
                    ORDER BY v_contador DESC
                    FETCH first 1 ROWS only;
                EXCEPTION
                    WHEN No_Data_Found THEN
                        NULL;
                    WHEN OTHERS THEN
                        ROLLBACK;
                        Raise_Application_Error (-20006,'Error al seleccionar MODA longitud...' || '' || ' ' || SQLERRM);
                END;
                BEGIN 
                    SELECT
                         count(C003), -- C003 es longitud
                         C003
                    INTO
                         v_contador,
                         v_lati_longi_resultado
                    FROM apex_collections WHERE collection_name = 'TMP_COORDENADAS_CORTAS'
                        GROUP BY C003
                        ORDER BY v_contador DESC
                        FETCH first 1 ROWS only;
                EXCEPTION
                    WHEN No_Data_Found THEN
                        NULL;
                    WHEN OTHERS THEN
                        ROLLBACK;
                        Raise_Application_Error (-20007,'Error al seleccionar MODA latitud/longitud...' || '' || ' ' || SQLERRM);
                END;

                DECLARE
                    l_current_date date := current_date;
                BEGIN 
                    /*
                    raise_application_error(-20999,
                           ' v_nro_generacion: '        ||  v_nro_generacion
                        || ' i.cod_cliente_l: '         ||  i.cod_cliente_l
                        || ' v_latitud_resultado: '     ||  v_latitud_resultado
                        || ' v_longitud_resultado: '    ||  v_longitud_resultado
                        || ' v_lati_longi_resultado: '  ||  v_lati_longi_resultado
                        || ' v_cant_universo: '         ||  v_cant_universo
                        || ' v_g_usuario: '             ||  v_g_usuario
                        || ' l_current_date: '          ||  l_current_date
                    );
                    */

                        APEX_COLLECTION.ADD_MEMBER(
                            P_COLLECTION_NAME => 'TMP_INSERT_COORDENADA_MODA',
                               P_N001            => v_nro_generacion,
                               P_N002            => i.cod_cliente_l,
                               P_C001            => v_latitud_resultado,
                               P_C002            => v_longitud_resultado,
                               P_C003            => v_lati_longi_resultado,
                               P_N003            => v_cant_universo,
                               P_C004            => v_g_usuario,
                               P_D001            => l_current_date
                        );
                    COMMIT;

                    SELECT N001, N002, C001, C002, C003, N003, C004, D001
                    INTO v_nro_generacion, i.cod_cliente_l,
                        v_latitud_resultado, v_longitud_resultado,
                        v_lati_longi_resultado, v_cant_universo,
                        v_g_usuario, l_current_date
                    FROM APEX_COLLECTIONS
                    WHERE collection_name = 'TMP_INSERT_COORDENADA_MODA';

                    INSERT INTO cliente_coordenada_moda(
                        nro_generacion,
                        cod_cliente,
                        latitud_resultado,
                        longitud_resultado,
                        lati_longi_resultado,
                        cant_universo,
                        usr_alta,
                        fec_alta
                    ) VALUES(
                        v_nro_generacion,
                        i.cod_cliente_l,
                        v_latitud_resultado,
                        v_longitud_resultado,
                        v_lati_longi_resultado,
                        v_cant_universo,
                        v_g_usuario,
                        l_current_date
                    );
                EXCEPTION
                    WHEN OTHERS THEN
                        ROLLBACK;
                        Raise_Application_Error (-20008,'Error al insertar resultados del cliente...' || i.cod_cliente_l || ' ' || SQLERRM);
                END;

                BEGIN 
                    SELECT
                        NVL( MAX(nro_item),0) + 1
                    INTO
                        v_nro_item_nuevo
                    FROM cliente_coordenada
                    WHERE cod_cliente  = i.cod_cliente_l;
                EXCEPTION
                    WHEN No_Data_Found THEN
                        NULL;
                    WHEN OTHERS THEN
                        ROLLBACK;
                        Raise_Application_Error (-20009,'Error al seleccionar nro.item para insertar moda de cliente...' || '' || ' ' || SQLERRM);
                END;

                --raise_application_error(-20999, 'test');
                DECLARE
                    l_current_date date := current_date;
                    v_comentario VARCHAR(100) := 'RESULTADO GENERACION DE MODA NRO.' || v_nro_generacion;
                BEGIN
                    --raise_application_error(-20999, 'test');
                   INSERT INTO cliente_coordenada(
                        cod_cliente,
                        nro_item,
                        fec_coordenada,
                        latitud,
                        longitud,
                        altitud,
                        latitud_gms,
                        longitud_gms,
                        altitud_gms,
                        precision,
                        cod_lugar,
                        login_visitador,
                        path_foto,
                        direccion,
                        comentario,
                        origen,
                        edm_cod_tarea,
                        moda,
                        para_localizar_cliente,
                        aplicacion_origen,
                        fec_alta,
                        usr_alta,
                        fec_ult_act,
                        usr_ult_act
                    ) VALUES (
                        i.cod_cliente_l,
                        v_nro_item_nuevo,
                        l_current_date,
                        v_latitud_resultado,
                        v_longitud_resultado,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        v_g_usuario,
                        '--',
                        '--',
                        v_comentario,
                        'I',
                        0,
                        1,
                        1,
                        'GEO',
                        l_current_date,
                        v_g_usuario,
                        l_current_date,
                        v_g_usuario
                    );
                EXCEPTION
                    WHEN OTHERS THEN
                        ROLLBACK;
                        Raise_Application_Error (-20010,'Error al insertar moda en coordenadas del Clte...' || i.cod_cliente_l || ' ' || SQLERRM);
                END;
                COMMIT;
            END LOOP;
        EXCEPTION
            WHEN No_Data_Found THEN
                ROLLBACK;
                Raise_Application_Error (-20011,'No se seleccionaron clientes con los parámetros...');
            WHEN OTHERS THEN
                ROLLBACK;
                Raise_Application_Error (-20012,'Error al seleccionar clientes con los parámetros...' || ' ' || SQLERRM);
        END;
    ELSE
        BEGIN 
            v_sql_rowcount := 0;
            FOR for_1 IN (
                SELECT DISTINCT (a.cod_cliente) AS cod_cliente_l
                    FROM cliente_coordenada a, gestion_cobranza_cliente b
                WHERE a.cod_cliente  >= v_cod_cliente_d
                    AND a.cod_cliente      <= v_cod_cliente_h
                    AND a.fec_coordenada   >= v_p_fec_desde
                    AND a.fec_coordenada   <= v_p_fec_hasta
                    AND a.cod_cliente      = b.cod_cliente
                    AND b.periodo          = TRUNC(v_g_fec_ingrid,'mm')
                    AND b.fase             IN ('FASE3','FASE2','FASE1','FASE0')
                    AND b.tipo_comercio    = 'MINORISTA'
                    AND a.cod_cliente NOT IN ( SELECT cod_cliente
                                               FROM cliente_coordenada
                                            WHERE para_localizar_cliente  = 1 )
            ) LOOP
                v_cod_cliente_l := for_1.cod_cliente_l;
                v_sql_rowcount  := v_sql_rowcount + 1;
                --DBMS_OUTPUT.PUT_LINE('Analizando Cliente...:' || v_cod_cliente_l);
                BEGIN 
                    SELECT
                        count(a.cod_cliente)
                    INTO
                        v_cant_universo
                    FROM cliente_coordenada a, agenda_seg_coordenada age, gestion_morosidad_seg seg, situ_coordenadas situ
                    WHERE a.cod_cliente  = v_cod_cliente_l
                        AND a.fec_coordenada  >= v_p_fec_desde
                        AND a.fec_coordenada  <= v_p_fec_hasta
                        AND a.cod_cliente     = age.cod_cliente
                        AND a.nro_item        = age.nro_item_coordenada
                        AND age.cod_sucursal  = seg.cod_sucursal
                        AND age.fec_planilla  = seg.fec_planilla
                        AND age.nro_planilla  = seg.nro_planilla
                        AND age.nro_item      = seg.nro_item
                        AND age.item_seg      = seg.item_seg
                        AND seg.cod_situ      = situ.cod_situ;
                EXCEPTION
                    WHEN No_Data_Found THEN
                        NULL;
                    WHEN OTHERS THEN
                        Raise_Application_Error (-20013,'Error al contar universo de coordenadas del clte...' || v_cod_cliente_l || ' ' || ' ' || SQLERRM);
                END;
                --COMMIT;

                DECLARE
                    CURSOR CUR_DETALLES IS
                        SELECT
                            TRUNC(a.latitud,4) 	AS latitud,
                            TRUNC(a.longitud,4)	AS longitud,
                            (TRUNC(a.latitud,4) || ', ' || TRUNC(a.longitud,4)) AS lati_longi
                        FROM cliente_coordenada a, agenda_seg_coordenada b, gestion_morosidad_seg c, situ_coordenadas d
                        WHERE a.cod_cliente         = v_cod_cliente_l
                            AND a.fec_coordenada  	>= v_p_fec_desde
                            AND a.fec_coordenada  	<= v_p_fec_hasta
                            AND a.cod_cliente  	    = b.cod_cliente
                            AND a.nro_item  	    = b.nro_item_coordenada
                            AND b.cod_sucursal  	= c.cod_sucursal
                            AND b.fec_planilla  	= c.fec_planilla
                            AND b.nro_planilla  	= c.nro_planilla
                            AND b.nro_item  	    = c.nro_item
                            AND b.item_seg  	    = c.item_seg
                            AND c.cod_situ  	    = d.cod_situ;
                BEGIN 
                    /*INSERT INTO apex_collections(
                        latitud,
                        longitud,
                        lati_longi
                    )*/
                    apex_collection.create_or_truncate_collection(p_collection_name => 'TMP_COORDENADAS_CORTAS');
                    FOR R IN CUR_DETALLES LOOP
                        BEGIN
                            APEX_COLLECTION.ADD_MEMBER(
                                P_COLLECTION_NAME => 'TMP_COORDENADAS_CORTAS',
                                    P_C001            => R.latitud,
                                    P_C002            => R.longitud,
                                    P_C003            => R.lati_longi
                            );
                        EXCEPTION
                            WHEN OTHERS THEN
                                RAISE_APPLICATION_ERROR(-20014, 'No se pudo insertar en coleccion. ' || sqlerrm, true);
                        END;
                    END LOOP;
                EXCEPTION
                    WHEN OTHERS THEN
                        Raise_Application_Error (-20015,'Error al insertar en tabla temporal...' || '' || ' ' || SQLERRM);
                END;
                COMMIT;

                BEGIN 
                    SELECT
                        count(C001),
                        C001
                    INTO
                        v_contador,
                        v_latitud_resultado
                    FROM apex_collections WHERE collection_name = 'TMP_COORDENADAS_CORTAS'
                    GROUP BY C001
                    ORDER BY v_contador DESC
                    FETCH first 1 ROWS only;
                EXCEPTION
                    WHEN No_Data_Found THEN
                        NULL;
                    WHEN OTHERS THEN
                        ROLLBACK;
                        Raise_Application_Error (-20016,'Error al seleccionar MODA latitud...' || '' || ' ' || SQLERRM);
                END;

                BEGIN 
                    SELECT
                        count(C002),
                        C002
                    INTO
                        v_contador,
                        v_longitud_resultado
                    FROM apex_collections WHERE collection_name = 'TMP_COORDENADAS_CORTAS'
                    GROUP BY C002
                    ORDER BY v_contador DESC
                    FETCH first 1 ROWS only;
                EXCEPTION
                    WHEN No_Data_Found THEN
                        NULL;
                    WHEN OTHERS THEN
                        ROLLBACK;
                        Raise_Application_Error (-20017,'Error al seleccionar MODA longitud...' || '' || ' ' || SQLERRM);
                END;

                BEGIN 
                    SELECT
                         count(C003),
                         C003
                    INTO
                         v_contador,
                         v_lati_longi_resultado
                    FROM apex_collections WHERE collection_name = 'TMP_COORDENADAS_CORTAS'
                    GROUP BY C003
                    ORDER BY v_contador DESC
                    FETCH first 1 ROWS only;
                EXCEPTION
                    WHEN No_Data_Found THEN
                        NULL;
                    WHEN OTHERS THEN
                        ROLLBACK;
                        Raise_Application_Error (-20018,'Error al seleccionar MODA latitud/longitud...' || '' || ' ' || SQLERRM);
                END;

                DECLARE
                l_current_date date := current_date;
                BEGIN 
                    INSERT INTO cliente_coordenada_moda(
                        nro_generacion,
                        cod_cliente,
                        latitud_resultado,
                        longitud_resultado,
                        lati_longi_resultado,
                        cant_universo,
                        usr_alta,
                        fec_alta
                    ) VALUES (
                        v_nro_generacion,
                        v_cod_cliente_l,
                        v_latitud_resultado,
                        v_longitud_resultado,
                        v_lati_longi_resultado,
                        v_cant_universo,
                        v_g_usuario,
                        l_current_date
                    );
                EXCEPTION
                    WHEN OTHERS THEN
                        ROLLBACK;
                        Raise_Application_Error (-20019,'Error al insertar resultados del cliente...' || v_cod_cliente_l || ' ' || SQLERRM);
                END;

                BEGIN 
                    SELECT
                        NVL( MAX (nro_item), 0) + 1
                    INTO
                        v_nro_item_nuevo
                    FROM cliente_coordenada
                    WHERE cod_cliente  = v_cod_cliente_l;
                EXCEPTION
                    WHEN No_Data_Found THEN
                        NULL;
                    WHEN OTHERS THEN
                        ROLLBACK;
                        Raise_Application_Error (-20020,'Error al seleccionar nro.item para insertar moda de cliente...' || '' || ' ' || SQLERRM);
                END;

                BEGIN 
                    INSERT INTO cliente_coordenada(
                        cod_cliente,
                        nro_item,
                        fec_coordenada,
                        latitud,
                        longitud,
                        altitud,
                        latitud_gms,
                        longitud_gms,
                        altitud_gms,
                        precision,
                        cod_lugar,
                        login_visitador,
                        path_foto,
                        direccion,
                        comentario,
                        origen,
                        edm_cod_tarea,
                        moda,
                        para_localizar_cliente,
                        aplicacion_origen,
                        fec_alta,
                        usr_alta,
                        fec_ult_act,
                        usr_ult_act
                    ) VALUES (
                        v_cod_cliente_l,
                        v_nro_item_nuevo,
                        'today',
                        v_latitud_resultado,
                        v_longitud_resultado,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        v_g_usuario,
                        '--',
                        '--',
                        'RESULTADO GENERACION DE MODA NRO.' || to_char(v_nro_generacion),
                        'I',
                        0,
                        1,
                        1,
                        'GEO',
                        current_date,
                        v_g_usuario,
                        current_date,
                        v_g_usuario
                    );
                EXCEPTION
                    WHEN OTHERS THEN
                        ROLLBACK;
                        Raise_Application_Error (-20021,'Error al insertar moda en coordenadas del Clte...' || v_cod_cliente_l || ' ' || SQLERRM);
                END;
                COMMIT;
            END LOOP;

            IF v_sql_rowcount  <= 0 THEN
                RAISE NO_DATA_FOUND;
            END IF;

        EXCEPTION
            WHEN No_Data_Found THEN
                ROLLBACK;
                Raise_Application_Error (-20022,'No se seleccionaron clientes con los parámetros...');
            WHEN OTHERS THEN
                ROLLBACK;
                Raise_Application_Error (-20023,'Error al seleccionar clientes con los parámetros...' || ' ' || SQLERRM);
        END;
    END IF;
    COMMIT;
    --DBMS_OUTPUT.PUT_LINE('Termino OK el análisis de la MODA de coordenadas Clientes...');

END geo01050;


end "PKG_GEOLOCALIZACION_CLIENTE";
/

