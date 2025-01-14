PROMPT CREATE OR REPLACE PACKAGE pkg_insumo_oficina
CREATE OR REPLACE PACKAGE pkg_insumo_oficina AS

  PROCEDURE pr_procesar_insumos(p_fec_desde        IN OUT DATE,
                                p_fec_hasta        IN OUT DATE,
                                p_cod_sucursal     IN OUT VARCHAR2,
                                p_cod_region_venta IN OUT VARCHAR2,
                                p_cod_subgrupo     IN OUT VARCHAR2,
                                p_nro_pedido       IN NUMBER);

  PROCEDURE pr_pasar_pedi(p_fec_desde        IN OUT pedidos_oficina.fec_alta%TYPE,
                          p_fec_hasta        IN OUT pedidos_oficina.fec_alta%TYPE,
                          p_cod_sucursal     IN OUT VARCHAR2,
                          p_cod_region_venta IN OUT VARCHAR2
                          --    p_cod_subgrupo            in out varchar2,
                          --   p_nro_pedido              in  number
                          );

  PROCEDURE pr_rechazar(p_cod_sucursal IN OUT pedidos_oficina.cod_sucursal%TYPE,
                        p_nro_pedido   IN OUT pedidos_oficina.nro_pedido%TYPE
                        --  p_reg                   in out   number ,
                        --  p_rech                   in out  number

                        );
  PROCEDURE pr_distribucion_insumos(p_fec_desde    IN OUT DATE,
                                    p_fec_hasta    IN OUT DATE,
                                    p_cod_sucursal IN OUT VARCHAR2

                                    );
  PROCEDURE pr_aprobar(p_cod_sucursal IN NUMBER,
                       p_nro_pedido   IN NUMBER,
                       p_reg          OUT NUMBER,
                       p_apro         OUT NUMBER);
  PROCEDURE pr_costo_unitario(p_costo_unit   OUT NUMBER,
                              p_cod_sucursal IN NUMBER,
                              p_cod_articulo IN VARCHAR2);



END pkg_insumo_oficina;
/

PROMPT CREATE OR REPLACE PACKAGE BODY pkg_insumo_oficina
CREATE OR REPLACE PACKAGE BODY pkg_insumo_oficina AS
  /**
  * procedimiento para procesar insumos
  * author  : Mariano Arguello
  * created : 05/11/2024
  **/

  PROCEDURE pr_procesar_insumos(p_fec_desde        IN OUT DATE,
                                p_fec_hasta        IN OUT DATE,
                                p_cod_sucursal     IN OUT VARCHAR2,
                                p_cod_region_venta IN OUT VARCHAR2,
                                p_cod_subgrupo     IN OUT VARCHAR2,
                                p_nro_pedido       IN NUMBER) IS
    v_fecha              DATE := current_date;
    v_estado_pedido      VARCHAR2(10) := 'PEDI';
    v_cod_sucursal_d     NUMBER;
    v_cod_sucursal_h     NUMBER;
    v_cod_region_venta_d VARCHAR2(10);
    v_cod_region_venta_h VARCHAR2(10);
    v_cod_subgrupo_d     VARCHAR2(10);
    v_cod_subgrupo_h     VARCHAR2(10);
    v_subgrupo           VARCHAR2(10);
    g_usuario            VARCHAR(50) := fn_user;
    v_cod_sucursal       NUMBER;
    v_costo              NUMBER;
    v_total              NUMBER;
    v_canti              NUMBER;

  BEGIN

    v_estado_pedido := 'PEDI';

    IF p_cod_sucursal = '*' THEN
      v_cod_sucursal_d := 0;
      v_cod_sucursal_h := 999;
    ELSE
      v_cod_sucursal_d := p_cod_sucursal;
      v_cod_sucursal_h := p_cod_sucursal;
    END IF;

    IF p_cod_region_venta = '*' THEN
      v_cod_region_venta_d := '    ';
      v_cod_region_venta_h := 'ZZZZ';
    ELSE
      v_cod_region_venta_d := p_cod_region_venta;
      v_cod_region_venta_h := p_cod_region_venta;
    END IF;

    IF p_cod_subgrupo = '*' THEN
      v_cod_subgrupo_d := '        ';
      v_cod_subgrupo_h := 'ZZZZZZZZ';
      v_subgrupo       := 'TODOS';
    ELSE
      v_cod_subgrupo_d := p_cod_subgrupo;
      v_cod_subgrupo_h := p_cod_subgrupo;
      v_subgrupo       := p_cod_subgrupo;
    END IF;

    apex_collection.create_or_truncate_collection(p_collection_name => 'TMP_INSUMO');

    FOR adic IN (SELECT poa.cod_articulo,
                        SUM(nvl(poa.cantidad, 0)) AS cantidad,
                        a.descripcion,
                        a.cod_grupo,
                        a.cod_subgrupo,
                        b.cod_tipo_mercaderia,
                        po.nro_pedido,
                        po.cod_sucursal,
                        po.fec_alta
                   FROM pedidos_oficina po
                   JOIN pedidos_oficina_art poa
                     ON po.nro_pedido = poa.nro_pedido
                    AND po.cod_sucursal = poa.cod_sucursal
                   JOIN articulos a
                     ON a.cod_articulo = poa.cod_articulo
                   JOIN familias b
                     ON a.cod_familia = b.cod_familia
                   JOIN sucursal s
                     ON po.cod_sucursal = s.cod_sucursal
                  WHERE po.estado = v_estado_pedido
                    AND po.cod_sucursal >= v_cod_sucursal_d
                    AND po.cod_sucursal <= v_cod_sucursal_h
                    AND trunc(po.fec_alta) >= p_fec_desde
                    AND trunc(po.fec_alta) <= p_fec_hasta
                    AND s.cod_region_venta >= v_cod_region_venta_d
                    AND s.cod_region_venta <= v_cod_region_venta_h
                    AND a.cod_subgrupo >= v_cod_subgrupo_d
                    AND a.cod_subgrupo <= v_cod_subgrupo_h
                  GROUP BY poa.cod_articulo,
                           a.descripcion,
                           a.cod_grupo,
                           a.cod_subgrupo,
                           po.fec_alta,
                           b.cod_tipo_mercaderia,
                           po.nro_pedido,
                           po.cod_sucursal) LOOP

      apex_collection.add_member(p_collection_name => 'TMP_INSUMO',
                                 p_c001            => adic.cod_articulo,
                                 p_c002            => adic.cantidad,
                                 p_c003            => adic.descripcion,
                                 p_c004            => adic.cod_grupo,
                                 p_c005            => adic.cod_subgrupo,
                                 p_c006            => adic.cod_tipo_mercaderia,
                                 p_c007            => adic.nro_pedido,
                                 p_c008            => adic.cod_sucursal,
                                 p_c009            => v_costo,
                                 p_c010            => v_total);

      COMMIT;
      BEGIN

        UPDATE pedidos_oficina
           SET fec_pedi = v_fecha, usr_ult_act = g_usuario
         WHERE estado = 'PEDI'
           AND cod_sucursal >= adic.cod_sucursal
           AND nro_pedido <= adic.nro_pedido
           AND fec_alta = adic.fec_alta;
      EXCEPTION
        WHEN no_data_found THEN
          raise_application_error(-20999,
                                  'Error al intentar cambiar de estado');
        WHEN OTHERS THEN
          raise_application_error(-20999,
                                  'No se actualizo el estado: ' || SQLERRM);

      END;
      COMMIT;

    END LOOP;


    COMMIT;
  END pr_procesar_insumos;

    /**
  * procedimiento para cambio de estado
  * author  : Mariano Arguello
  * created : 09/11/2024
  **/

  PROCEDURE pr_pasar_pedi(p_fec_desde        IN OUT pedidos_oficina.fec_alta%TYPE,
                          p_fec_hasta        IN OUT pedidos_oficina.fec_alta%TYPE,
                          p_cod_sucursal     IN OUT VARCHAR2,
                          p_cod_region_venta IN OUT VARCHAR2
                          --   p_cod_subgrupo            in out varchar2,
                          --    p_nro_pedido              in  number
                          ) IS
    v_fecha              DATE := current_date;
    v_estado             VARCHAR2(20) := 'PEDI';
    v_cod_sucursal_d     NUMBER;
    v_cod_sucursal_h     NUMBER;
    v_cod_region_venta_d VARCHAR2(10);
    v_cod_region_venta_h VARCHAR2(10);
    --   v_cod_subgrupo_d varchar2(10);
    --   v_cod_subgrupo_h varchar2(10);
    --   v_subgrupo varchar2(10);
    g_usuario      VARCHAR(50) := fn_user;
    v_cod_sucursal NUMBER;

  BEGIN
    IF p_cod_sucursal = '*' THEN
      v_cod_sucursal_d := 0;
      v_cod_sucursal_h := 999;
    ELSE
      v_cod_sucursal_d := p_cod_sucursal;
      v_cod_sucursal_h := p_cod_sucursal;
    END IF;

    --   raise_application_error(-20999,'esta: '|| v_cod_sucursal_d || 'fec: ' || v_cod_sucursal_h || ' user: ' || g_usuario );
    IF NOT fn_bandera THEN
      DECLARE
        l_query  VARCHAR2(4000);
        l_cursor BINARY_INTEGER;
        l_nr     NUMBER := 0;
      BEGIN
        l_query  := 'UPDATE pedidos_oficina
                           SET estado = ?,
                               fec_ult_act = ?,
                               usr_ult_act = ?
                           WHERE estado = ''EDIT''
                            and fec_alta >= ?
                            AND fec_alta <= ?
                            AND cod_sucursal >= ?
                            AND cod_sucursal <= ?';
        l_cursor := dbms_hs_passthrough.open_cursor@wrk1;
        dbms_hs_passthrough.parse@wrk1(l_cursor, l_query);
        dbms_hs_passthrough.bind_variable@wrk1(l_cursor, 1, v_estado);
        dbms_hs_passthrough.bind_variable@wrk1(l_cursor, 2, v_fecha);
        dbms_hs_passthrough.bind_variable@wrk1(l_cursor, 3, g_usuario);
        dbms_hs_passthrough.bind_variable@wrk1(l_cursor, 4, p_fec_desde);
        dbms_hs_passthrough.bind_variable@wrk1(l_cursor, 5, p_fec_hasta);
        dbms_hs_passthrough.bind_variable@wrk1(l_cursor,
                                               6,
                                               v_cod_sucursal_d);
        dbms_hs_passthrough.bind_variable@wrk1(l_cursor,
                                               7,
                                               v_cod_sucursal_h);
        dbms_hs_passthrough.close_cursor@wrk1(l_cursor);
      END;
    ELSE
      DECLARE
        l_count NUMBER := 0;
      BEGIN
        FOR i IN (SELECT nro_pedido, cod_sucursal
                    FROM pedidos_oficina
                   WHERE estado = 'EDIT'
                     AND trunc(fec_alta) >= p_fec_desde
                     AND trunc(fec_alta) <= p_fec_hasta
                     AND cod_sucursal >= v_cod_sucursal_d
                     AND cod_sucursal <= v_cod_sucursal_h) LOOP
          l_count := l_count + 1;
          UPDATE pedidos_oficina
             SET estado      = 'PEDI',
                 fec_ult_act = v_fecha,
                 usr_ult_act = g_usuario
           WHERE cod_sucursal = i.cod_sucursal
             AND nro_pedido = i.nro_pedido;
        END LOOP;
        IF l_count = 0 THEN
          RAISE no_data_found;
        END IF;
      EXCEPTION
        WHEN no_data_found THEN
          raise_application_error(-20999,
                                  'Error al intentar cambiar de estado...');
        WHEN OTHERS THEN
          raise_application_error(-20999,
                                  'No se actualizo el estado de ningun estado...' ||
                                  SQLERRM);
      END;
    END IF;
  END pr_pasar_pedi;

     /**
  * procedimiento para cambio de estado
  * author  : Mariano Arguello
  * created : 12/11/2024
  **/

  PROCEDURE pr_rechazar(p_cod_sucursal IN OUT pedidos_oficina.cod_sucursal%TYPE,
                        p_nro_pedido   IN OUT pedidos_oficina.nro_pedido%TYPE
                        --  p_reg                     in out number,
                        --  p_rech                    in out number
                        ) IS
    v_fecha      DATE := current_date;
    v_fec_rech   DATE := current_date;
    v_estado     VARCHAR2(20) := 'RECH';
    g_usuario    VARCHAR2(50) := fn_user;
    v_comentario VARCHAR2(1000);
    v_prue       VARCHAR(200);
  BEGIN

    v_prue := 'RECH.:' || g_usuario || ' ' || v_comentario;

    UPDATE pedidos_oficina
       SET estado      = v_estado,
           comentario  = v_prue,
           fec_ult_act = v_fecha,
           usr_ult_act = g_usuario,
           fec_rech    = v_fec_rech
     WHERE nro_pedido = p_nro_pedido
       AND cod_sucursal = p_cod_sucursal
       AND estado = 'PEDI';


  EXCEPTION
    WHEN no_data_found THEN
      raise_application_error(-20001, 'No se Rechazo el Pedido, Verifique el Estado...' );
    WHEN OTHERS THEN
      raise_application_error(-20999,
                              'Error al Rechazar Pedido...' ||
                              SQLERRM);

  END pr_rechazar;


      /**
  * procedimiento para envio de mail
  * author  : Mariano Arguello
  * created : 18/11/2024
  **/

  PROCEDURE pr_distribucion_insumos(p_fec_desde    IN OUT DATE,
                                    p_fec_hasta    IN OUT DATE,
                                    p_cod_sucursal IN OUT VARCHAR2

                                    ) IS
    v_cod_sucursal_d NUMBER;
    v_cod_sucursal_h NUMBER;

  BEGIN

    IF p_cod_sucursal = '*' THEN
      v_cod_sucursal_d := 0;
      v_cod_sucursal_h := 999;
    ELSE
      v_cod_sucursal_d := to_number(p_cod_sucursal);
      v_cod_sucursal_h := to_number(p_cod_sucursal);
    END IF;

    apex_collection.create_or_truncate_collection(p_collection_name => 'TMP_DISTRI');

    FOR w IN (SELECT poa.cod_articulo,
                     SUM(nvl(poa.cantidad, 0)) AS cantidad,
                     a.descripcion,
                     a.cod_grupo,
                     a.cod_subgrupo,
                     po.cod_sucursal,
                     s.sucursal,
                     po.usr_alta,
                     b.nombre
                FROM pedidos_oficina po
                JOIN pedidos_oficina_art poa
                  ON po.nro_pedido = poa.nro_pedido
                 AND po.cod_sucursal = poa.cod_sucursal
                JOIN articulos a
                  ON a.cod_articulo = poa.cod_articulo
                JOIN sucursal s
                  ON po.cod_sucursal = s.cod_sucursal
                JOIN perspers b
                  ON po.usr_alta = b.login
               WHERE po.estado = 'APRO'
                 AND po.cod_sucursal >= p_cod_sucursal
                 AND po.cod_sucursal <= p_cod_sucursal
                 AND trunc(po.fec_alta) >= p_fec_desde
                 AND trunc(po.fec_alta) <= p_fec_hasta
               GROUP BY poa.cod_articulo,
                        a.descripcion,
                        a.cod_grupo,
                        a.cod_subgrupo,
                        po.cod_sucursal,
                        s.sucursal,
                        b.nombre,
                        po.usr_alta) LOOP

      apex_collection.add_member(p_collection_name => 'TMP_DISTRI',
                                 p_c001            => w.cod_articulo,
                                 p_c002            => w.cantidad,
                                 p_c003            => w.descripcion,
                                 p_c004            => w.cod_grupo,
                                 p_c005            => w.cod_subgrupo,
                                 p_c006            => w.cod_sucursal,
                                 p_c007            => w.sucursal,
                                 p_c008            => w.usr_alta,
                                 p_c009            => w.nombre);

    END LOOP;

  END pr_distribucion_insumos;
        /**
  * procedimiento para aprobacion y cambio de estado
  * author  : Mariano Arguello
  * created : 18/11/2024
  * Ult.Mod.: vrojas 19/12/2024 cambie de lugar en donde igualaba v_cod_articulo
  **/


  PROCEDURE pr_aprobar(p_cod_sucursal IN NUMBER,
                       p_nro_pedido   IN NUMBER,
                       p_reg          OUT NUMBER,
                       p_apro         OUT NUMBER) IS
    v_fecha DATE := to_date(current_date, 'dd/mm/yyyy');
    --    v_estado varchar2(20) := 'RECH';
    g_usuario             VARCHAR2(50) := fn_user;
    v_comentario          ajustes_stock.comentario%TYPE := ' ';
    v_cod_sucursal_pedido NUMBER;
    g_fec_ingrid          DATE := current_date;
    v_nro_ajuste          NUMBER;
    v_cod_motivo_ajuste   VARCHAR2(100) := ' ';
    v_cod_depo_pedido     ajustes_stock.cod_deposito%TYPE := 0;
    v_nro_item_art    NUMBER;
    v_cod_grupo       VARCHAR2(100);
    v_cod_subgrupo    VARCHAR(100);
    v_sum_o_res       NUMBER;
    v_stock_corriente articulos_suc_depo.stock_corriente%TYPE := 0;
    g_rows            NUMBER;
    v_cant_reservada  NUMBER;
    v_fec_apro        DATE := current_date;
    v_costo_unit      NUMBER; -- ajustes_stock_art.costo_unit%type := 0;
    v_nro_asiento     ajustes_stock.nro_asiento%TYPE := 0;
    v_ult_item_art    ajustes_stock.ult_item_art%TYPE := 0;
    v_nro_comprobante ajustes_stock.nro_comprobante%TYPE := 0;
    v_cod_cliente     ajustes_stock.cod_cliente%TYPE := 0;
    v_nro_pedido      ajustes_stock.nro_pedido%TYPE := 0;
    v_nro_x           ajustes_stock.nro_x%TYPE := 0;
    v_costo_ajuste    ajustes_stock.costo_ajuste%TYPE := 0;
    v_esta_edit       ajustes_stock.estado_ajuste%TYPE := 'EDIT';
    v_fec_ajuste      ajustes_stock.fec_ajuste%TYPE := current_date;
    v_cod_sucursal    ajustes_stock.cod_sucursal%TYPE := 0;
    v_cod_articulo    articulos.cod_articulo%TYPE;

  BEGIN
    p_apro := 0;
    p_reg  := 0;
    pkg_ic.inicializar;
    g_fec_ingrid := pkg_ic.g_fec_ingrid;
    g_usuario    := pkg_ic.g_usuario;

    BEGIN
      SELECT cod_sucursal_pedido, cod_depo_pedido, comentario
        INTO v_cod_sucursal_pedido, v_cod_depo_pedido, v_comentario
        FROM pedidos_oficina
       WHERE cod_sucursal = p_cod_sucursal
         AND nro_pedido = p_nro_pedido;
      COMMIT;
    EXCEPTION
      WHEN no_data_found THEN
        raise_application_error(-20001,
                                'No se seleciono ningun pedido de oficina');
      WHEN OTHERS THEN
        raise_application_error(-20002,
                                'Error al seleccionar los del los pedidos del oficina');
    END;

    BEGIN
      SELECT cod_motivo_ajuste, cod_grupo, cod_subgrupo
        INTO v_cod_motivo_ajuste, v_cod_grupo, v_cod_subgrupo
        FROM pedidos_oficina_control
       WHERE dkey = 1;
      COMMIT;
    EXCEPTION
      WHEN no_data_found THEN
        raise_application_error(-20003,
                                'No se seleciono ningun registro de control');
      WHEN OTHERS THEN
        raise_application_error(-20004,
                                'Error al seleccionar los datos de control');
    END;

    BEGIN
      v_fec_ajuste := g_fec_ingrid;
      SELECT nvl(MAX(nro_ajuste), 0) + 1
        INTO v_nro_ajuste
        FROM ajustes_stock
       WHERE cod_sucursal = v_cod_sucursal_pedido
         AND fec_ajuste = v_fec_ajuste;
    EXCEPTION
      WHEN no_data_found THEN
        raise_application_error(-20005,
                                'No se seleciono ningun Nro. de Ajuste');
      WHEN OTHERS THEN
        raise_application_error(-20006,
                                'Error al seleccionar Nro. de Ajuste.');
    END;

    BEGIN

      INSERT INTO ajustes_stock
        (cod_sucursal,
         fec_ajuste,
         nro_ajuste,
         estado_ajuste,
         cod_motivo_ajuste,
         nro_x,
         costo_ajuste,
         nro_pedido,
         cod_cliente,
         nro_comprobante,
         comentario,
         ult_item_art,
         nro_asiento,
         cod_deposito,
         fec_ult_act,
         usr_ult_act)
      VALUES
        (v_cod_sucursal_pedido,
         v_fec_ajuste,
         v_nro_ajuste,
         v_esta_edit,
         v_cod_motivo_ajuste,
         v_nro_x,
         v_costo_ajuste,
         v_nro_pedido,
         v_cod_cliente,
         v_nro_comprobante,
         v_comentario,
         v_ult_item_art,
         v_nro_asiento,
         v_cod_depo_pedido,
         v_fecha,
         g_usuario);

    EXCEPTION
      WHEN OTHERS THEN
        raise_application_error(-20007,
                                'Error al insertar cabecera del ajuste..');
    END;
    COMMIT;
    BEGIN
      FOR for1 IN (SELECT cod_articulo, cantidad, nro_item_art
                     FROM pedidos_oficina_art
                    WHERE nro_pedido = p_nro_pedido
                      AND cod_sucursal = p_cod_sucursal) LOOP

      v_cod_articulo := for1.cod_articulo;

      IF v_cod_articulo IS NULL THEN
         NULL;
      ELSE
        v_costo_unit := 0;
        BEGIN
          pkg_insumo_oficina.pr_costo_unitario(p_costo_unit   => v_costo_unit,
                                               p_cod_sucursal => v_cod_sucursal_pedido,
                                               p_cod_articulo => v_cod_articulo);


        EXCEPTION
          WHEN OTHERS THEN
            raise_application_error(-20999,
                                    'Error al selecionar el costo....' ||
                                    SQLERRM);
        END;

        BEGIN
          SELECT stock_corriente, cant_reservada
            INTO v_stock_corriente, v_cant_reservada
            FROM articulos_suc_depo
           WHERE cod_articulo = for1.cod_articulo
             AND cod_sucursal = v_cod_sucursal_pedido
             AND cod_deposito = v_cod_depo_pedido;
          g_rows := 1;
        EXCEPTION
          WHEN no_data_found THEN
            g_rows := 0;
          WHEN OTHERS THEN
            raise_application_error(-20008,
                                    'Error al seleccionar el stock... ');
        END;

        IF g_rows > 0 AND
           ((v_stock_corriente - v_cant_reservada) - for1.cantidad) < 0 THEN
          ROLLBACK;
          raise_application_error(-20009,
                                  'El articulo con codigo ' ||
                                  for1.cod_articulo ||
                                  ' ya no cuenta con stock disponible...');
        END IF;

        BEGIN
          INSERT INTO ajustes_stock_art
            (cod_sucursal,
             fec_ajuste,
             nro_ajuste,
             nro_item_art,
             cod_articulo,
             cantidad,
             costo_unit,
             fec_ult_act,
             usr_ult_act)
          VALUES
            (v_cod_sucursal_pedido,
             v_fec_ajuste,
             v_nro_ajuste,
             for1.nro_item_art,
             v_cod_articulo,
             for1.cantidad,
             v_costo_unit,
             v_fecha,
             g_usuario);
        EXCEPTION
          WHEN OTHERS THEN
            raise_application_error(-20010,
                                    'Error al insertar en la tabla ajustes_stock' || sqlerrm);
        END;
       END IF;
      END LOOP;


    EXCEPTION
      WHEN no_data_found THEN
        raise_application_error(-20011,
                                'No se selecciono detalle de art.oficinas...');
      WHEN OTHERS THEN
        raise_application_error(-20012,
                                'Error al seleccionar detalle de art.oficina' ||
                                SQLERRM);
    END;
    COMMIT;
    BEGIN
      SELECT b.sum_o_res
        INTO v_sum_o_res
        FROM ajustes_stock a, motivos_ajustes_stk b, ajustes_stk_tipos c
       WHERE a.cod_sucursal = v_cod_sucursal_pedido
         AND a.fec_ajuste = g_fec_ingrid
         AND a.nro_ajuste = v_nro_ajuste
         AND a.cod_motivo_ajuste = b.cod_motivo_ajuste
         AND b.cod_tipo_ajuste = c.cod_tipo_ajuste;
    EXCEPTION
      WHEN no_data_found THEN
        raise_application_error(-20013,
                                'No se Selecciono Motivo de Ajuste...');
      WHEN OTHERS THEN
        raise_application_error(-20014,
                                'Error al Seleccionar motivo de ajuste...' ||
                                SQLERRM);
    END;

    IF v_sum_o_res = 0 THEN
      DECLARE
        v_codigo    adu_aplicacion.codigo%TYPE := 209;
        v_recurso   adu_menu_recurso.recurso%TYPE := 'FN_203';
        v_resultado BOOLEAN;
      BEGIN
        v_resultado := fn_recurso(v_codigo, v_recurso);

        IF v_resultado = TRUE THEN
          NULL;
        ELSE
          raise_application_error(-20015,
                                  'No tiene permiso para registrar ajuste de salida de stock...' ||
                                  SQLERRM);
        END IF;
      END;
    END IF;

    BEGIN
      pr_regajustestk(p_cod_sucursal => v_cod_sucursal_pedido,
                      p_fec_ajuste   => g_fec_ingrid,
                      p_nro_ajuste   => v_nro_ajuste);
    EXCEPTION
      WHEN OTHERS THEN
        raise_application_error(-20999,'Error en procedimiento regajustestk...'|| sqlerrm);
    END;

    BEGIN
      UPDATE pedidos_oficina
         SET fec_ajuste  = g_fec_ingrid,
             nro_ajuste  = v_nro_ajuste,
             fec_ult_act = v_fecha,
             usr_ult_act = g_usuario,
             estado      = 'APRO',
             fec_apro    = v_fec_apro
       WHERE cod_sucursal = p_cod_sucursal
         AND nro_pedido = p_nro_pedido;
    EXCEPTION
      WHEN no_data_found THEN
        raise_application_error(-20017,
                                'No se encontro el pedido de oficina a actualizar');
      WHEN OTHERS THEN
        raise_application_error(-20018,
                                'Error al actualizar pedidos oficina');
    END;

    DECLARE
      l_fecha   DATE;
      l_cod_var VARCHAR2 (1000);

    BEGIN

      pkg_bal_asientos_contables#01.pr_bal04100(
                              p_cod_sucursal =>  v_cod_sucursal_pedido,
                              p_fecha        =>  g_fec_ingrid,
                              p_numero       =>  v_nro_ajuste,
                              p_cod_tipo_asto => 'AJST',
                              p_numero2       =>  0,
                              p_tipo_f4       =>  0,
                              p_fecha2        => l_fecha,
                              p_cod_varchar   => l_cod_var);
   END;
    COMMIT;

  END pr_aprobar;

        /**
  * procedimiento para calculo de precio unitario e insertar
  * author  : Mariano Arguello
  * created : 20/11/2024
  **/

  PROCEDURE pr_costo_unitario(p_costo_unit   OUT NUMBER,
                              p_cod_sucursal IN NUMBER,
                              p_cod_articulo IN VARCHAR2) IS

    g_fec_ingrid           DATE := current_date;
    g_cod_suc_casa_central NUMBER;
    v_costo_unit           NUMBER;
    v_costo_unit_mr        NUMBER;
    v_ubicacion            articulos_suc.ubicacion%TYPE := ' ';
    v_stock_corriente      articulos_suc.stock_corriente%TYPE := 0;
    v_cant_reservada       articulos_suc.cant_reservada%TYPE := 0;
    v_cant_consignacion    articulos_suc.cant_consignacion%TYPE := 0;
    v_cant_pedida          articulos_suc.cant_pedida%TYPE := 0;
    g_rows                 NUMBER;
    v_fecha                DATE := current_date;
    --  v_cod_articulo varchar2(100);
    v_cant_ult_compra          articulos_suc.cant_ult_compra%TYPE := 0;
    v_costo_unit_prom          articulos_suc.costo_unit_prom%TYPE := 0;
    v_costo_unit_prom_mr       articulos_suc.costo_unit_prom_mr%TYPE := 0;
    v_costo_unit_ult_compra    articulos_suc.costo_unit_ult_compra%TYPE := 0;
    v_costo_unit_ult_compra_mr NUMBER;
    v_coef_ult_compra          articulos_suc.coef_ult_compra%TYPE := 0;
    v_stock_minimo             articulos_suc.stock_minimo%TYPE := 0;
    v_stock_maximo             articulos_suc.stock_maximo%TYPE := 0;
    v_punto_pedido             articulos_suc.punto_pedido%TYPE := 0;
    v_cod_revision             articulos_suc.cod_revision%TYPE := ' ';
    v_fec_ult_emis_ped          articulos_suc.fec_ult_emis_ped%TYPE:= current_date;
    v_fec_ult_recep_ped        articulos_suc.fec_ult_recep_ped%TYPE:= current_date;
    v_fec_ult_vta              articulos_suc.fec_ult_vta%TYPE:=current_date ;
    v_fec_ult_recep_suc        articulos_suc.fec_ult_recep_suc%TYPE:=current_date ;
    v_fec_ult_remis_suc        articulos_suc.fec_ult_remis_suc%TYPE:=current_date ;
    v_fec_ult_ajus_cant        articulos_suc.fec_ult_ajus_cant%TYPE:=current_date ;
    v_fec_ult_ajus_costo       articulos_suc.fec_ult_ajus_costo%TYPE:=current_date ;
    v_fec_ult_reserva          articulos_suc.fec_ult_reserva%TYPE:=current_date ;
    v_ranking_abc              articulos_suc.ranking_abc%TYPE := ' ';
    v_fec_ult_calc_rank        articulos_suc.fec_ult_calc_rank%TYPE:=current_date ;
    v_indice_rot_inv           articulos_suc.indice_rot_inv%TYPE := 0;
    v_fec_ult_calc_iri         articulos_suc.fec_ult_calc_iri%TYPE:=current_date ;
    v_cod_articulo VARCHAR2(100);

  BEGIN
  v_cod_articulo:= p_cod_articulo;

  IF v_cod_articulo IS NULL THEN
     NULL;
  ELSE

    pkg_ic.inicializar;
    g_fec_ingrid := pkg_ic.g_fec_ingrid;
    -- g_usuario:= pkg_ic.g_usuario;
    g_cod_suc_casa_central := pkg_ic.g_cod_suc_casa_central;
    g_rows := 0;
    BEGIN
      SELECT costo_unit,1
        INTO v_costo_unit,g_rows
        FROM articulos_suc
       WHERE cod_articulo = v_cod_articulo
         AND cod_sucursal = p_cod_sucursal;
    EXCEPTION
      WHEN no_data_found THEN
        g_rows := 0;
      WHEN OTHERS THEN
        ROLLBACK;
        raise_application_error(-20999,'Error al seleccionar el costo del producto.' || SQLERRM);
    END;

  IF g_rows <= 0 OR v_costo_unit <= 0 THEN

      BEGIN
        SELECT costo_unit, nvl(costo_unit_mr, 0)
          INTO v_costo_unit, v_costo_unit_mr
          FROM articulos_suc
         WHERE cod_articulo = v_cod_articulo
           AND cod_sucursal = g_cod_suc_casa_central;
        g_rows := 1;
      EXCEPTION
        WHEN no_data_found THEN
          g_rows := 0;
        WHEN OTHERS THEN
          raise_application_error(-20999,
                                  'Error al seleccionar articulos_suc...' ||
                                  SQLERRM);
      END;

      BEGIN
        UPDATE articulos_suc
           SET costo_unit    = v_costo_unit,
               costo_unit_mr = v_costo_unit_mr,
               fec_ult_act   = v_fecha
         WHERE cod_articulo = v_cod_articulo
           AND cod_sucursal = p_cod_sucursal;
      EXCEPTION
        WHEN OTHERS THEN
          raise_application_error(-20999,
                                  'Error al actualizar articulos_suc...');
      END;
      v_costo_unit    := Nvl(v_costo_unit,0);
      v_costo_unit_mr := Nvl(v_costo_unit_mr,0);
      BEGIN
        INSERT INTO articulos_suc
          (cod_articulo,
           cod_sucursal,
           ubicacion,
           stock_corriente,
           cant_reservada,
           cant_consignacion,
           cant_pedida,
           costo_unit,
           costo_unit_mr,
           cant_ult_compra,
           costo_unit_prom,
           costo_unit_prom_mr,
           costo_unit_ult_compra,
           costo_unit_ult_compra_mr,
           coef_ult_compra,
           stock_minimo,
           stock_maximo,
           punto_pedido,
           cod_revision,
           fec_ult_act,
           fec_ult_emis_ped,
           fec_ult_recep_ped,
           fec_ult_vta,
           fec_ult_recep_suc,
           fec_ult_remis_suc,
           fec_ult_ajus_cant,
           fec_ult_ajus_costo,
           fec_ult_reserva,
           ranking_abc,
           fec_ult_calc_rank,
           indice_rot_inv,
           fec_ult_calc_iri)
        VALUES
          (p_cod_articulo,
           p_cod_sucursal,
           '--',
           0,
           0,
           0,
           0,
           v_costo_unit,
           v_costo_unit_mr,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           '--',
           g_fec_ingrid,
           v_fec_ult_emis_ped,
           v_fec_ult_recep_ped,
           v_fec_ult_vta,
           v_fec_ult_recep_suc,
           v_fec_ult_remis_suc,
           v_fec_ult_ajus_cant,
           v_fec_ult_ajus_costo,
           v_fec_ult_reserva,
           ' ',
           v_fec_ult_calc_rank,
           0,
           v_fec_ult_calc_iri);
      EXCEPTION
        WHEN OTHERS THEN
          ROLLBACK;
          raise_application_error(-20999,
                                  'Error al Incluir registro en articulos_suc del articulo ' || p_cod_articulo || SQLERRM);
      END;

    END IF;

    p_costo_unit := v_costo_unit;
  END IF;
  END pr_costo_unitario;



END pkg_insumo_oficina;
/

