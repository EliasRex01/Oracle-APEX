PROMPT CREATE OR REPLACE PROCEDURE pr_solicitudes_del_imo
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
  g_rows                    NUMBER := 0;
  v_existe                  NUMBER := 0;
BEGIN

  IF p_periodo IS NOT NULL THEN
    v_periodo := TO_DATE(p_periodo, 'DD/MM/YYYY');
  ELSE
    v_periodo := NULL;
  END IF;

  IF h_cod_sucursal = ' ' THEN
    h_cod_sucursal := TO_CHAR(v_cod_sucursal);
  ELSIF h_cod_sucursal != '*' THEN
    v_cod_sucursal := TO_NUMBER(h_cod_sucursal);
  END IF;

  /*Raise_Application_Error(-20001, ' v_agrupa: ' || v_agrupa || ' v_detalle: ' || v_detalle ||
  ' h_cod_sucursal: ' || h_cod_sucursal || ' v_periodo: ' || v_periodo || ' v_cod_personal: ' || v_cod_personal ||
   ' v_cod_articulo: ' || v_cod_articulo || ' v_cod_tipo_mercaderia: ' || v_cod_tipo_mercaderia);*/


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
      v_seq                       NUMBER;
      v_cant_soli                 NUMBER := 0;
      g_rows                      NUMBER := 0;
    BEGIN
    g_rows:=0;
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

            IF l_estado_soli = 'FACT' THEN
                v_cant_soli_fact := l_cantidad;
            ELSIF l_estado_soli = 'APRO' THEN
                v_cant_soli_apro := l_cantidad;
            ELSIF l_estado_soli = 'ANA'  THEN
                v_cant_soli_ana  := l_cantidad;
            ELSIF l_estado_soli = 'INSI' THEN
                v_cant_soli_insi := l_cantidad;
            ELSIF l_estado_soli = 'REFE' THEN
                v_cant_soli_refe := l_cantidad;
            ELSIF l_estado_soli = 'REVI' THEN
                v_cant_soli_revi := l_cantidad;
            ELSIF l_estado_soli = 'VERI' THEN
                v_cant_soli_veri := l_cantidad;
            ELSIF l_estado_soli = 'PROC' THEN
                v_cant_soli_proc := l_cantidad;
            ELSIF l_estado_soli = 'DIGI' THEN
                v_cant_soli_digi := l_cantidad;
            ELSIF l_estado_soli = 'CANC' THEN
                v_cant_soli_canc := l_cantidad;
            ELSIF l_estado_soli = 'RECH' THEN
                v_cant_soli_rech := l_cantidad;
            END IF;
           
          SELECT COUNT(1) INTO v_existe FROM TMP_SOLI_VEND WHERE COD_VENDEDOR = l_cod_vendedor;
          IF v_existe > 0 THEN
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
              INSERT INTO TMP_SOLI_VEND (cod_vendedor, vendedor, cant_soli, cant_soli_fact, cant_soli_apro,
              cant_soli_ana, cant_soli_insi, cant_soli_refe, cant_soli_revi, cant_soli_veri,
              cant_soli_proc, cant_soli_digi, cant_soli_canc, cant_soli_rech)
              VALUES(l_cod_vendedor, l_vendedor, l_cantidad, v_cant_soli_fact, v_cant_soli_apro, v_cant_soli_ana,
              v_cant_soli_insi, v_cant_soli_refe, v_cant_soli_revi, v_cant_soli_veri, v_cant_soli_proc, v_cant_soli_digi,
              v_cant_soli_canc, v_cant_soli_rech);
          END IF;

        END LOOP;
        DBMS_HS_PASSTHROUGH.CLOSE_CURSOR@WRK1(l_cursor);

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

    END;


  ELSE

    IF h_cod_sucursal = '*' THEN
      v_where := 'a.cod_sucursal IN (SELECT cod_sucursal '
                 || 'FROM imo_det_suc WHERE periodo = '
                 || '''' || TO_CHAR(v_periodo, 'YYYY-MM-DD') || ''''
                 || ' AND cod_personal = '
                 || '''' || v_cod_personal || ''''
                 || ') AND a.nro_soli = b.nro_soli'
               || ' AND a.fec_soli >= ''' || TO_CHAR(v_periodo, 'YYYY-MM-DD') || ''''
               || ' AND b.cod_articulo = c.cod_articulo '
               || ' AND c.mueve_stock = 1 AND c.articulo_usado = 0 '
               || ' AND c.cod_familia = f.cod_familia '
               || ' AND f.cod_tipo_mercaderia = ''' || v_cod_tipo_mercaderia || ''''
               || ' AND c.cod_subgrupo = ''' || v_cod_articulo || ''''
               || ' AND a.cod_vendedor = v.cod_vendedor'
               || ' GROUP BY a.cod_vendedor, v.vendedor, a.estado_soli';
    ELSE
      v_where := 'a.cod_sucursal = ' || v_cod_sucursal ||
                  ' AND a.nro_soli = b.nro_soli'
               || ' AND a.fec_soli >= ''' || TO_CHAR(v_periodo, 'YYYY-MM-DD') || ''''
               || ' AND b.cod_articulo = c.cod_articulo '
               || ' AND c.mueve_stock = 1 AND c.articulo_usado = 0 '
               || ' AND c.cod_familia = f.cod_familia '
               || ' AND f.cod_tipo_mercaderia = ''' || v_cod_tipo_mercaderia || ''''
               || ' AND c.cod_subgrupo = ''' || v_cod_articulo || ''''
               || ' AND a.cod_vendedor = v.cod_vendedor'
               || ' GROUP BY a.cod_vendedor, v.vendedor, a.estado_soli';
    END IF;

    DECLARE
      l_query                         CLOB;
      l_cursor                        SYS_REFCURSOR;
      l_cod_vendedor                  VARCHAR2(1000);
      l_vendedor                      VARCHAR2(1000);
      l_estado_soli                   VARCHAR2(100);
      l_cantidad                      NUMBER := 0;
      v_cant_soli_fact                NUMBER := 0;
      v_cant_soli_apro                NUMBER := 0;
      v_cant_soli_ana                 NUMBER := 0;
      v_cant_soli_insi                NUMBER := 0;
      v_cant_soli_refe                NUMBER := 0;
      v_cant_soli_revi                NUMBER := 0;
      v_cant_soli_veri                NUMBER := 0;
      v_cant_soli_proc                NUMBER := 0;
      v_cant_soli_digi                NUMBER := 0;
      v_cant_soli_canc                NUMBER := 0;
      v_cant_soli_rech                NUMBER := 0;
      v_cant_soli                     NUMBER := 0;

    BEGIN
        l_query := 'SELECT a.cod_vendedor, v.vendedor, a.estado_soli, NVL(COUNT(a.nro_soli), 0) AS cantidad
                    FROM sc a
                    JOIN sc_articulo b ON a.id_articulo = b.id_articulo
                    JOIN vendedores v ON a.cod_vendedor = v.cod_vendedor
                    WHERE ' || v_where || '
                    GROUP BY a.cod_vendedor, v.vendedor, a.estado_soli';

        OPEN l_cursor FOR l_query;
        LOOP
            FETCH l_cursor INTO l_cod_vendedor, l_vendedor, l_estado_soli, l_cantidad;
            EXIT WHEN l_cursor%NOTFOUND;

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

            BEGIN
              UPDATE TMP_SOLI_VEND
              SET cant_soli      = v_cant_soli + l_cantidad,
                cant_soli_fact = v_cant_soli_fact + v_cant_soli_fact,
                cant_soli_apro = v_cant_soli_apro + v_cant_soli_apro,
                cant_soli_ana  = v_cant_soli_ana  + v_cant_soli_ana,
                cant_soli_insi = v_cant_soli_insi + v_cant_soli_insi,
                cant_soli_refe = v_cant_soli_refe + v_cant_soli_refe,
                cant_soli_revi = v_cant_soli_revi + v_cant_soli_revi,
                cant_soli_veri = v_cant_soli_veri + v_cant_soli_veri,
                cant_soli_proc = v_cant_soli_proc + v_cant_soli_proc,
                cant_soli_digi = v_cant_soli_digi + v_cant_soli_digi,
                cant_soli_canc = v_cant_soli_canc + v_cant_soli_canc,
                cant_soli_rech = v_cant_soli_rech + v_cant_soli_rech
              WHERE COD_VENDEDOR = l_cod_vendedor;
            EXCEPTION
                WHEN NO_DATA_FOUND THEN
                    NULL;
                WHEN OTHERS THEN
                    ROLLBACK;
                    RAISE_APPLICATION_ERROR(-20011, 'Error al actualizar la colección SOLI_VEND_TMP: ' || SQLERRM);
            END;

            BEGIN
              INSERT INTO TMP_SOLI_VEND (cod_vendedor, vendedor, cant_soli, cant_soli_fact, cant_soli_apro,
              cant_soli_ana, cant_soli_insi, cant_soli_refe, cant_soli_revi, cant_soli_veri,
              cant_soli_proc, cant_soli_digi, cant_soli_canc, cant_soli_rech)
              VALUES(l_cod_vendedor, l_vendedor, l_cantidad, v_cant_soli_fact, v_cant_soli_apro, v_cant_soli_ana,
              v_cant_soli_insi, v_cant_soli_refe, v_cant_soli_revi, v_cant_soli_veri, v_cant_soli_proc, v_cant_soli_digi,
              v_cant_soli_canc, v_cant_soli_rech);
            EXCEPTION
                WHEN OTHERS THEN
                    RAISE_APPLICATION_ERROR(-20012, 'Error al insertar en la colección SOLI_VEND_TMP: ' || SQLERRM);
            END;

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
        CLOSE l_cursor;
    END;

  END IF;

EXCEPTION
  WHEN OTHERS THEN
    pr_capturar_error();
    RAISE;
END pr_solicitudes_del_imo;
/




-------------------------------------------------------------------------------------------------------------------------
DECLARE GLOBAL TEMPORARY TABLE SESSION.soli_vend
    (cod_vendedor     varchar(8) not null,
     vendedor         varchar(40) not null,
     cant_soli           i4 not null,
     cant_soli_fact      i4 not null,
     cant_soli_apro      i4 not null,
     cant_soli_ana       i4 not null,
     cant_soli_insi      i4 not null,
     cant_soli_refe      i4 not null,
     cant_soli_revi      i4 not null,
     cant_soli_veri      i4 not null,
     cant_soli_proc      i4 not null,
     cant_soli_digi      i4 not null,
     cant_soli_canc      i4 not null,
     cant_soli_rech      i4 not null
    )
    ON COMMIT PRESERVE ROWS WITH NORECOVERY;
    COMMIT;
    IF h_cod_sucursal = '' THEN
        h_cod_sucursal = varchar(cod_sucursal);
    ELSEIF h_cod_sucursal != '*' THEN
        cod_sucursal = int2(h_cod_sucursal);
    ENDIF;
    IF agrupa = 0 OR detalle = 1 THEN
        IF h_cod_sucursal = '*' THEN
            var_where = 'a.cod_sucursal in ( select cod_sucursal '
                      + 'from imo_det_suc where periodo='
                      + '''' + varchar(periodo) + ''''
                      + ' and cod_personal = '
                      + '''' + varchar(cod_personal) + ''''
                      + ')';
        ELSE
            var_where = 'a.cod_sucursal=' + varchar(cod_sucursal);
        ENDIF;
        var_where = var_where
            + ' AND a.nro_soli = b.nro_soli'
            + ' AND a.fec_soli >= ' + '''' + varchar(periodo) + ''''
            + ' AND b.cod_articulo=' + '''' + varchar(cod_articulo) + ''''
            + ' AND a.cod_vendedor  = v.cod_vendedor'
            + ' GROUP BY a.cod_vendedor, v.vendedor, a.estado_soli';
    SELECT a.cod_vendedor AS :cod_vendedor,
           v.vendedor     AS :vendedor,
           a.estado_soli  AS :estado_soli,
           IFNULL(COUNT(a.nro_soli),0) AS :cantidad
        FROM sc a, sc_articulo b, vendedores v
      WHERE :var_where
    BEGIN
        IF estado_soli = 'FACT' THEN
            cant_soli_fact = cantidad;
        ELSEIF estado_soli = 'APRO' THEN
            cant_soli_apro = cantidad;
        ELSEIF estado_soli = 'ANA'  THEN
            cant_soli_ana  = cantidad;
        ELSEIF estado_soli = 'INSI' THEN
            cant_soli_insi = cantidad;
        ELSEIF estado_soli = 'REFE' THEN
            cant_soli_refe = cantidad;
        ELSEIF estado_soli = 'REVI' THEN
            cant_soli_revi = cantidad;
        ELSEIF estado_soli = 'VERI' THEN
            cant_soli_veri = cantidad;
        ELSEIF estado_soli = 'PROC' THEN
            cant_soli_proc = cantidad;
        ELSEIF estado_soli = 'DIGI' THEN
            cant_soli_digi = cantidad;
        ELSEIF estado_soli = 'CANC' THEN
            cant_soli_canc = cantidad;
        ELSEIF estado_soli = 'RECH' THEN
            cant_soli_rech = cantidad;
        ENDIF;
        UPDATE SESSION.soli_vend
            SET cant_soli      = cant_soli + :cantidad,
                cant_soli_fact = cant_soli_fact + :cant_soli_fact,
                cant_soli_apro = cant_soli_apro + :cant_soli_apro,
                cant_soli_ana  = cant_soli_ana  + :cant_soli_ana,
                cant_soli_insi = cant_soli_insi + :cant_soli_insi,
                cant_soli_refe = cant_soli_refe + :cant_soli_refe,
                cant_soli_revi = cant_soli_revi + :cant_soli_revi,
                cant_soli_veri = cant_soli_veri + :cant_soli_veri,
                cant_soli_proc = cant_soli_proc + :cant_soli_proc,
                cant_soli_digi = cant_soli_digi + :cant_soli_digi,
                cant_soli_canc = cant_soli_canc + :cant_soli_canc,
                cant_soli_rech = cant_soli_rech + :cant_soli_rech
           WHERE cod_vendedor = :cod_vendedor;
        INQUIRE_SQL(g_err=ERRORNO, g_err_text=ERRORTEXT, g_rows=ROWCOUNT);
        IF g_err != 0 THEN
            SET LOCKMODE SESSION WHERE LEVEL = SESSION, READLOCK= SYSTEM;
            MESSAGE 'Error al insertar tabla temporal SESSION.soli_vend...'
                  + X'0D' + g_err_text;
            RETURN;
        ENDIF;
        IF g_rows <= 0 THEN
            INSERT INTO SESSION.soli_vend
            VALUES
            (:cod_vendedor, :vendedor,
             :cantidad, :cant_soli_fact, :cant_soli_apro,
              :cant_soli_ana, :cant_soli_insi, :cant_soli_refe,
              :cant_soli_revi, :cant_soli_veri, :cant_soli_proc,
              :cant_soli_digi, :cant_soli_canc, :cant_soli_rech
             );
            INQUIRE_SQL(g_err=ERRORNO, g_err_text=ERRORTEXT, g_rows=ROWCOUNT);
            IF g_err != 0 THEN
                SET LOCKMODE SESSION WHERE LEVEL = SESSION, READLOCK = SYSTEM;
                MESSAGE 'Error al insertar tabla temporal SESSION.soli_vend...'
                      + X'0D' + g_err_text;
                RETURN;
            ENDIF;
        ENDIF;
        cant_soli_fact = 0; cant_soli_apro = 0;
        cant_soli_ana  = 0; cant_soli_insi = 0;
        cant_soli_refe = 0; cant_soli_revi = 0;
        cant_soli_veri = 0; cant_soli_proc = 0;
        cant_soli_digi = 0; cant_soli_canc = 0;
        cant_soli_rech = 0;
        COMMIT;
    END;
    ELSE
        IF h_cod_sucursal = '*' THEN
            var_where = 'a.cod_sucursal in ( select cod_sucursal '
                      + 'from imo_det_suc where periodo='
                      + '''' + varchar(periodo) + ''''
                      + ' and cod_personal = '
                      + '''' + varchar(cod_personal) + ''''
                      + ')';
        ELSE
            var_where = 'a.cod_sucursal=' + varchar(cod_sucursal);
        ENDIF;
        var_where = var_where
            + ' AND a.nro_soli = b.nro_soli'
            + ' AND a.fec_soli >= ' + '''' + varchar(periodo) + ''''
            + ' AND b.cod_articulo=c.cod_articulo '
            + ' AND c.mueve_stock = 1 AND c.articulo_usado = 0 '
            + ' AND c.cod_familia = f.cod_familia '
            + ' AND f.cod_tipo_mercaderia='
            + '''' + varchar(cod_tipo_mercaderia) + ''''
            + ' AND c.cod_subgrupo=' + '''' + varchar(cod_articulo) + ''''
            + ' AND a.cod_vendedor  = v.cod_vendedor'
            + ' GROUP BY a.cod_vendedor, v.vendedor, a.estado_soli';
    SELECT a.cod_vendedor AS :cod_vendedor,
           v.vendedor     AS :vendedor,
           a.estado_soli  AS :estado_soli,
           IFNULL(COUNT(a.nro_soli),0) AS :cantidad
        FROM sc a, sc_articulo b, vendedores v, articulos c, familias f
      WHERE :var_where
    BEGIN
        IF estado_soli = 'FACT' THEN
            cant_soli_fact = cantidad;
        ELSEIF estado_soli = 'APRO' THEN
            cant_soli_apro = cantidad;
        ELSEIF estado_soli = 'ANA'  THEN
            cant_soli_ana  = cantidad;
        ELSEIF estado_soli = 'INSI' THEN
            cant_soli_insi = cantidad;
        ELSEIF estado_soli = 'REFE' THEN
            cant_soli_refe = cantidad;
        ELSEIF estado_soli = 'REVI' THEN
            cant_soli_revi = cantidad;
        ELSEIF estado_soli = 'VERI' THEN
            cant_soli_veri = cantidad;
        ELSEIF estado_soli = 'PROC' THEN
            cant_soli_proc = cantidad;
        ELSEIF estado_soli = 'DIGI' THEN
            cant_soli_digi = cantidad;
        ELSEIF estado_soli = 'CANC' THEN
            cant_soli_canc = cantidad;
        ELSEIF estado_soli = 'RECH' THEN
            cant_soli_rech = cantidad;
        ENDIF;
        UPDATE SESSION.soli_vend
            SET cant_soli      = cant_soli + :cantidad,
                cant_soli_fact = cant_soli_fact + :cant_soli_fact,
                cant_soli_apro = cant_soli_apro + :cant_soli_apro,
                cant_soli_ana  = cant_soli_ana  + :cant_soli_ana,
                cant_soli_insi = cant_soli_insi + :cant_soli_insi,
                cant_soli_refe = cant_soli_refe + :cant_soli_refe,
                cant_soli_revi = cant_soli_revi + :cant_soli_revi,
                cant_soli_veri = cant_soli_veri + :cant_soli_veri,
                cant_soli_proc = cant_soli_proc + :cant_soli_proc,
                cant_soli_digi = cant_soli_digi + :cant_soli_digi,
                cant_soli_canc = cant_soli_canc + :cant_soli_canc,
                cant_soli_rech = cant_soli_rech + :cant_soli_rech
           WHERE cod_vendedor = :cod_vendedor;
        INQUIRE_SQL(g_err=ERRORNO, g_err_text=ERRORTEXT, g_rows=ROWCOUNT);
        IF g_err != 0 THEN
            SET LOCKMODE SESSION WHERE LEVEL = SESSION, READLOCK= SYSTEM;
            MESSAGE 'Error al insertar tabla temporal SESSION.soli_vend...'
                  + X'0D' + g_err_text;
            RETURN;
        ENDIF;
        IF g_rows <= 0 THEN
            INSERT INTO SESSION.soli_vend
            VALUES
            (:cod_vendedor, :vendedor,
             :cantidad, :cant_soli_fact, :cant_soli_apro,
              :cant_soli_ana, :cant_soli_insi, :cant_soli_refe,
              :cant_soli_revi, :cant_soli_veri, :cant_soli_proc,
              :cant_soli_digi, :cant_soli_canc, :cant_soli_rech
             );
            INQUIRE_SQL(g_err=ERRORNO, g_err_text=ERRORTEXT, g_rows=ROWCOUNT);
            IF g_err != 0 THEN
                SET LOCKMODE SESSION WHERE LEVEL = SESSION, READLOCK = SYSTEM;
                MESSAGE 'Error al insertar tabla temporal SESSION.soli_vend...'
                      + X'0D' + g_err_text;
                RETURN;
            ENDIF;
        ENDIF;
        cant_soli_fact = 0; cant_soli_apro = 0;
        cant_soli_ana  = 0; cant_soli_insi = 0;
        cant_soli_refe = 0; cant_soli_revi = 0;
        cant_soli_veri = 0; cant_soli_proc = 0;
        cant_soli_digi = 0; cant_soli_canc = 0;
        cant_soli_rech = 0;
        COMMIT;
    END;
    ENDIF;
        ENDIF;
        cant_soli_fact = 0; cant_soli_apro = 0;
        cant_soli_ana  = 0; cant_soli_insi = 0;
        cant_soli_refe = 0; cant_soli_revi = 0;
        cant_soli_veri = 0; cant_soli_proc = 0;
        cant_soli_digi = 0; cant_soli_canc = 0;
        cant_soli_rech = 0;
        COMMIT;
    END;
    ENDIF;
    imo02344.iitf :=
       SELECT cod_vendedor = m.cod_vendedor, vendedor = m.vendedor,
              cant_soli = m.cant_soli, cant_soli_fact = m.cant_soli_fact,
              cant_soli_apro = m.cant_soli_apro, cant_soli_ana = m.cant_soli_ana,
              cant_soli_insi = m.cant_soli_insi, cant_soli_refe = m.cant_soli_refe,
              cant_soli_revi = m.cant_soli_revi, cant_soli_veri = m.cant_soli_veri,
              cant_soli_proc = m.cant_soli_proc, cant_soli_digi = m.cant_soli_digi,
              cant_soli_canc = m.cant_soli_canc, cant_soli_rech = m.cant_soli_rech
         FROM SESSION.soli_vend m
        ORDER BY cant_soli_fact DESC;
    INQUIRE_INGRES(g_rows = ROWCOUNT, g_err = ERRORNO, g_err_text = ERRORTEXT);
    COMMIT;
    IF g_err != 0 THEN
        MESSAGE 'Error al seleccionar vendedores...'
               + X'0D' + g_err_text
        WITH STYLE = POPUP;
        RETURN;
    ELSEIF g_rows <= 0 THEN
        MESSAGE 'No se seleccionaron vendedores...'
             WITH STYLE = POPUP;
        RETURN;
    ENDIF;
    SET LOCKMODE SESSION WHERE LEVEL = SESSION, READLOCK = SYSTEM;
    SET_FORMS FORM (MODE = 'read');
    SET_FORMS FIELD imo02344 (MODE(iitf) = 'read');
END

