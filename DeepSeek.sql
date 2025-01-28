-- news availables
CREATE GLOBAL TEMPORARY TABLE soli_vend (
    cod_vendedor     VARCHAR2(8) NOT NULL,
    vendedor         VARCHAR2(40) NOT NULL,
    cant_soli        NUMBER NOT NULL,
    cant_soli_fact   NUMBER NOT NULL,
    cant_soli_apro   NUMBER NOT NULL,
    cant_soli_ana    NUMBER NOT NULL,
    cant_soli_insi   NUMBER NOT NULL,
    cant_soli_refe   NUMBER NOT NULL,
    cant_soli_revi   NUMBER NOT NULL,
    cant_soli_veri   NUMBER NOT NULL,
    cant_soli_proc   NUMBER NOT NULL,
    cant_soli_digi   NUMBER NOT NULL,
    cant_soli_canc   NUMBER NOT NULL,
    cant_soli_rech   NUMBER NOT NULL
) ON COMMIT PRESERVE ROWS;

----------------------------------------------
CREATE OR REPLACE PROCEDURE pr_solicitudes_del_imo(
    p_cod_personal        IN VARCHAR2 DEFAULT ' ',
    p_periodo             IN VARCHAR2 DEFAULT NULL,
    p_agrupar             IN NUMBER,
    p_detalle             IN NUMBER,
    p_cod_sucursal        IN NUMBER,
    p_cod_tipo_mercaderia IN VARCHAR2,
    p_cod_articulo        IN VARCHAR2
) IS
    v_agrupa              NUMBER := p_agrupar;
    v_detalle             NUMBER := p_detalle;
    h_cod_sucursal        VARCHAR2(1000) := p_cod_sucursal;
    v_cod_sucursal        NUMBER := 0;
    v_where               VARCHAR2(4000);
    v_periodo             DATE;
    v_cod_personal        VARCHAR2(1000) := p_cod_personal;
    v_cod_articulo        VARCHAR2(100) := p_cod_articulo;
    v_cod_tipo_mercaderia VARCHAR2(100) := p_cod_tipo_mercaderia;
    v_existe              NUMBER := 0;
BEGIN
    -- Convert p_periodo to DATE if not NULL
    IF p_periodo IS NOT NULL THEN
        v_periodo := TO_DATE(p_periodo, 'DD/MM/YYYY');
    ELSE
        v_periodo := NULL;
    END IF;

    -- Handle h_cod_sucursal
    IF h_cod_sucursal = ' ' THEN
        h_cod_sucursal := TO_CHAR(v_cod_sucursal);
    ELSIF h_cod_sucursal != '*' THEN
        v_cod_sucursal := TO_NUMBER(h_cod_sucursal);
    END IF;

    -- Main logic
    IF v_agrupa = 0 OR v_detalle = 1 THEN
        IF h_cod_sucursal = '*' THEN
            v_where := 'a.cod_sucursal IN (SELECT cod_sucursal '
                       || 'FROM imo_det_suc WHERE periodo = '
                       || '''' || TO_CHAR(v_periodo, 'DD/MM/YYYY') || ''''
                       || ' AND cod_personal = '
                       || '''' || v_cod_personal || ''''
                       || ')';
        ELSE
            v_where := 'a.cod_sucursal = ' || v_cod_sucursal;
        END IF;

        v_where := v_where
            || ' AND a.nro_soli = b.nro_soli'
            || ' AND a.fec_soli >= ''' || TO_CHAR(v_periodo, 'DD/MM/YYYY') || ''''
            || ' AND b.cod_articulo = ''' || v_cod_articulo || ''''
            || ' AND a.cod_vendedor = v.cod_vendedor'
            || ' GROUP BY a.cod_vendedor, v.vendedor, a.estado_soli';

        -- Execute dynamic SQL
        FOR rec IN (EXECUTE IMMEDIATE 'SELECT a.cod_vendedor, v.vendedor, a.estado_soli, NVL(COUNT(a.nro_soli), 0) AS cantidad
                                       FROM sc a, sc_articulo b, vendedores v
                                       WHERE ' || v_where) LOOP
            -- Process each row
            IF rec.estado_soli = 'FACT' THEN
                v_cant_soli_fact := rec.cantidad;
            ELSIF rec.estado_soli = 'APRO' THEN
                v_cant_soli_apro := rec.cantidad;
            -- Add other conditions here
            END IF;

            -- Update or insert into temporary table
            UPDATE soli_vend
            SET cant_soli = cant_soli + rec.cantidad,
                cant_soli_fact = cant_soli_fact + v_cant_soli_fact,
                -- Adds more
            WHERE cod_vendedor = rec.cod_vendedor;

            IF SQL%ROWCOUNT = 0 THEN
                INSERT INTO soli_vend (cod_vendedor, vendedor, cant_soli, cant_soli_fact, ...)
                VALUES (rec.cod_vendedor, rec.vendedor, rec.cantidad, v_cant_soli_fact, ...);
            END IF;
        END LOOP;
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(-20001, 'Error in pr_solicitudes_del_imo: ' || SQLERRM);
END;


----------------------------------------------------------------------------------

CREATE OR REPLACE PROCEDURE pr_solicitudes_del_imo(
  p_cod_personal          IN imo_det_suc.cod_personal%TYPE DEFAULT ' ',
  p_periodo               IN imo_det_suc.periodo%TYPE DEFAULT NULL,
  p_agrupar               IN NUMBER,
  p_detalle               IN NUMBER,
  p_cod_sucursal          IN NUMBER, 
  p_cod_tipo_mercaderia   IN VARCHAR2,
  p_cod_articulo          IN VARCHAR2
)
IS
  v_agrupa                  NUMBER := p_agrupar;
  v_detalle                 NUMBER := p_detalle;
  h_cod_sucursal            VARCHAR2(1000) := p_cod_sucursal;
  v_cod_sucursal            NUMBER := 0;
  v_where                   VARCHAR2(4000);
  v_periodo                 DATE;
  v_cod_personal            VARCHAR2(1000) := p_cod_personal;
  v_cod_articulo            VARCHAR2(100) := p_cod_articulo;
  v_cod_tipo_mercaderia     VARCHAR2(100) := p_cod_tipo_mercaderia;
  v_existe                  NUMBER := 0;
BEGIN
  -- Convert p_periodo to DATE if not NULL
  IF p_periodo IS NOT NULL THEN
    v_periodo := TO_DATE(p_periodo, 'DD/MM/YYYY');
  ELSE
    v_periodo := NULL;
  END IF;

  -- Handle h_cod_sucursal
  IF h_cod_sucursal = ' ' THEN
    h_cod_sucursal := TO_CHAR(v_cod_sucursal);
  ELSIF h_cod_sucursal != '*' THEN
    v_cod_sucursal := TO_NUMBER(h_cod_sucursal);
  END IF;

  -- Main logic
  IF v_agrupa = 0 OR v_detalle = 1 THEN
    IF h_cod_sucursal = '*' THEN
      v_where := 'a.cod_sucursal IN (SELECT cod_sucursal '
                 || 'FROM imo_det_suc WHERE periodo = '
                 || '''' || TO_CHAR(v_periodo, 'DD/MM/YYYY') || ''''
                 || ' AND cod_personal = '
                 || '''' || v_cod_personal || ''''
                 || ') AND a.nro_soli = b.nro_soli'
               || ' AND a.fec_soli >= ''' || TO_CHAR(v_periodo, 'DD/MM/YYYY') || ''''
               || ' AND b.cod_articulo = ''' || v_cod_articulo || ''''
               || ' AND a.cod_vendedor = v.cod_vendedor'
               || ' GROUP BY a.cod_vendedor, v.vendedor, a.estado_soli';
    ELSE
      v_where := 'a.cod_sucursal = ' || v_cod_sucursal ||
                  ' AND a.nro_soli = b.nro_soli'
               || ' AND a.fec_soli >= ''' || TO_CHAR(v_periodo, 'DD/MM/YYYY') || ''''
               || ' AND b.cod_articulo = ''' || v_cod_articulo || ''''
               || ' AND a.cod_vendedor = v.cod_vendedor'
               || ' GROUP BY a.cod_vendedor, v.vendedor, a.estado_soli';
    END IF;

    DECLARE
      l_query                     CLOB;
      l_cursor                    BINARY_INTEGER;
      l_nr                        NUMBER := 0;
      l_cod_vendedor              VARCHAR2(1000);
      l_vendedor                  VARCHAR2(1000);
      l_estado_soli               VARCHAR2(100);
      l_cantidad                  NUMBER := 0;
      v_cant_soli_fact            NUMBER := 0;
      v_cant_soli_apro            NUMBER := 0;
      v_cant_soli_ana             NUMBER := 0;
      v_cant_soli_insi            NUMBER := 0;
      v_cant_soli_refe            NUMBER := 0;
      v_cant_soli_revi            NUMBER := 0;
      v_cant_soli_veri            NUMBER := 0;
      v_cant_soli_proc            NUMBER := 0;
      v_cant_soli_digi            NUMBER := 0;
      v_cant_soli_canc            NUMBER := 0;
      v_cant_soli_rech            NUMBER := 0;
    BEGIN
      l_query := 'SELECT a.cod_vendedor, v.vendedor, a.estado_soli, NVL(COUNT(a.nro_soli),0)
                  FROM sc a, sc_articulo b, vendedores v
                  WHERE ' || v_where;

      l_cursor := DBMS_HS_PASSTHROUGH.OPEN_CURSOR@WRK1;
      DBMS_HS_PASSTHROUGH.PARSE@WRK1(l_cursor, l_query);

      LOOP
        l_nr := DBMS_HS_PASSTHROUGH.FETCH_ROW@WRK1(l_cursor, FALSE);
        EXIT WHEN l_nr = 0;

        DBMS_HS_PASSTHROUGH.GET_VALUE@WRK1(l_cursor, 1, l_cod_vendedor);
        DBMS_HS_PASSTHROUGH.GET_VALUE@WRK1(l_cursor, 2, l_vendedor);
        DBMS_HS_PASSTHROUGH.GET_VALUE@WRK1(l_cursor, 3, l_estado_soli);
        DBMS_HS_PASSTHROUGH.GET_VALUE@WRK1(l_cursor, 4, l_cantidad);

        -- Assign values based on estado_soli
        CASE l_estado_soli
          WHEN 'FACT' THEN v_cant_soli_fact := l_cantidad;
          WHEN 'APRO' THEN v_cant_soli_apro := l_cantidad;
          WHEN 'ANA'  THEN v_cant_soli_ana  := l_cantidad;
          WHEN 'INSI' THEN v_cant_soli_insi := l_cantidad;
          WHEN 'REFE' THEN v_cant_soli_refe := l_cantidad;
          WHEN 'REVI' THEN v_cant_soli_revi := l_cantidad;
          WHEN 'VERI' THEN v_cant_soli_veri := l_cantidad;
          WHEN 'PROC' THEN v_cant_soli_proc := l_cantidad;
          WHEN 'DIGI' THEN v_cant_soli_digi := l_cantidad;
          WHEN 'CANC' THEN v_cant_soli_canc := l_cantidad;
          WHEN 'RECH' THEN v_cant_soli_rech := l_cantidad;
        END CASE;

        -- Check if the row exists in TMP_SOLI_VEND
        SELECT COUNT(1) INTO v_existe 
        FROM TMP_SOLI_VEND 
        WHERE COD_VENDEDOR = l_cod_vendedor;

        IF v_existe > 0 THEN
          -- Update existing row
          UPDATE TMP_SOLI_VEND
          SET cant_soli      = cant_soli + l_cantidad,
              cant_soli_fact = cant_soli_fact + v_cant_soli_fact,
              cant_soli_apro = cant_soli_apro + v_cant_soli_apro,
              cant_soli_ana  = cant_soli_ana  + v_cant_soli_ana,
              cant_soli_insi = cant_soli_insi + v_cant_soli_insi,
              cant_soli_refe = cant_soli_refe + v_cant_soli_refe,
              cant_soli_revi = cant_soli_revi + v_cant_soli_revi,
              cant_soli_veri = cant_soli_veri + v_cant_soli_veri,
              cant_soli_proc = cant_soli_proc + v_cant_soli_proc,
              cant_soli_digi = cant_soli_digi + v_cant_soli_digi,
              cant_soli_canc = cant_soli_canc + v_cant_soli_canc,
              cant_soli_rech = cant_soli_rech + v_cant_soli_rech
          WHERE COD_VENDEDOR = l_cod_vendedor;
        ELSE
          -- Insert new row
          INSERT INTO TMP_SOLI_VEND (cod_vendedor, vendedor, cant_soli, cant_soli_fact, cant_soli_apro,
            cant_soli_ana, cant_soli_insi, cant_soli_refe, cant_soli_revi, cant_soli_veri,
            cant_soli_proc, cant_soli_digi, cant_soli_canc, cant_soli_rech)
          VALUES(l_cod_vendedor, l_vendedor, l_cantidad, v_cant_soli_fact, v_cant_soli_apro, v_cant_soli_ana,
            v_cant_soli_insi, v_cant_soli_refe, v_cant_soli_revi, v_cant_soli_veri, v_cant_soli_proc, v_cant_soli_digi,
            v_cant_soli_canc, v_cant_soli_rech);
        END IF;

        -- Reset counters
        v_cant_soli_fact := 0;
        v_cant_soli_apro := 0;
        v_cant_soli_ana  := 0;
        v_cant_soli_insi := 0;
        v_cant_soli_refe := 0;
        v_cant_soli_revi := 0;
        v_cant_soli_veri := 0;
        v_cant_soli_proc := 0;
        v_cant_soli_digi := 0;
        v_cant_soli_canc := 0;
        v_cant_soli_rech := 0;
      END LOOP;

      DBMS_HS_PASSTHROUGH.CLOSE_CURSOR@WRK1(l_cursor);
    END;
  END IF;

EXCEPTION
  WHEN OTHERS THEN
    pr_capturar_error();
    RAISE;
END pr_solicitudes_del_imo;
