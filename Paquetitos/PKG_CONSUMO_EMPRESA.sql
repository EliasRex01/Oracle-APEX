create or replace PACKAGE pkg_consumo_empresa AS

PROCEDURE pr_rechazar(p_cod_sucursal IN OUT ajustes_stock.cod_sucursal%TYPE,
    p_nro_ajuste   IN OUT ajustes_stock.nro_ajuste%TYPE,
    p_fec_ajuste   IN OUT ajustes_stock.fec_ajuste%TYPE);
PROCEDURE pr_acciones_arti(p_cod_sucursal      IN NUMBER,
    p_fec_ajuste        IN DATE,
    p_nro_ajuste        IN NUMBER,
    p_stock             OUT NUMBER,
    p_cod_articulo      IN VARCHAR2,
    p_costo_unit        OUT NUMBER,
    p_cod_motivo_ajuste IN VARCHAR2);
PROCEDURE pr_listar_regis(p_cod_sucursal      ajustes_stock.cod_sucursal%TYPE,
    p_fec_ajuste        ajustes_stock.fec_ajuste%TYPE,
    p_cod_motivo_ajuste ajustes_stock.cod_motivo_ajuste%TYPE);

PROCEDURE pr_lookup_articulos(
        p_cod_articulo in articulos.cod_articulo%type,
        p_familia      in varchar2,
        p_grupo        in varchar2,
        p_sbgpo        in varchar2,
        p_descripcion  in varchar2
);

END "PKG_CONSUMO_EMPRESA";
/
create or replace PACKAGE BODY pkg_consumo_empresa AS
  /**
  * procedimiento para rechazar consumo y Buscador de Artículos. 
  * author  : Fabian Rondan 
  * created : 7/12/2024
  **/

  PROCEDURE pr_rechazar(p_cod_sucursal IN OUT ajustes_stock.cod_sucursal%TYPE,
                        p_nro_ajuste   IN OUT ajustes_stock.nro_ajuste%TYPE,
                        p_fec_ajuste   IN OUT ajustes_stock.fec_ajuste%TYPE) IS
    v_comentario    VARCHAR2(500);
    v_estado_ajuste VARCHAR2(20) := 'RECH';
    g_usuario       VARCHAR(20) := fn_user;
    v_fec_ult_act   DATE := current_date;
    v_prueba        VARCHAR2(50);
  BEGIN
    v_prueba := 'RECH.:' || g_usuario || ' ' || v_comentario;
    UPDATE ajustes_stock
       SET estado_ajuste = v_estado_ajuste,
           comentario    = v_prueba,
           fec_ult_act   = v_fec_ult_act,
           usr_ult_act   = g_usuario
     WHERE cod_sucursal = p_cod_sucursal
       AND nro_ajuste = p_nro_ajuste
       AND fec_ajuste = p_fec_ajuste
       AND estado_ajuste = 'EDIT';

  EXCEPTION
    WHEN no_data_found THEN
      raise_application_error(-20001, 'Error al Rechazar el Consumo...');
    WHEN OTHERS THEN
      raise_application_error(-20002,
                              'No se Rechazo el Consumo, Verifique el Estado...' ||
                              SQLERRM);
  END pr_rechazar;
        /**
  * procedimiento para envio de mail 
  * author  : Mariano Arguello 
  * created : 02/12/2024
  **/

  PROCEDURE pr_acciones_arti(p_cod_sucursal      IN NUMBER,
                             p_fec_ajuste        IN DATE,
                             p_nro_ajuste        IN NUMBER,
                             p_stock             OUT NUMBER,
                             p_cod_articulo      IN VARCHAR2,
                             p_costo_unit        OUT NUMBER,
                             p_cod_motivo_ajuste IN VARCHAR2) IS
    v_cod_deposito             NUMBER;
    v_cod_tipo_mercaderia      VARCHAR2(100);
    v_cod_articulo             VARCHAR(15);
    v_cod_motivo_ajuste        VARCHAR2(100) := ' ';
    v_mueve_stock              NUMBER;
    g_rows                     NUMBER;
    v_cod_sucursal             NUMBER;
    v_fec_ajuste               DATE := current_date;
    v_nro_ajuste               NUMBER;
    v_costo_unit               NUMBER;
    g_cod_suc_casa_central     NUMBER;
    v_fecha                    DATE := current_date;
    v_costo_unit_mr            NUMBER;
    g_fec_ingrid               DATE := current_date;
    v_ubicacion                articulos_suc.ubicacion%TYPE := ' ';
    v_stock_corriente          articulos_suc.stock_corriente%TYPE := 0;
    v_cant_reservada           articulos_suc.cant_reservada%TYPE := 0;
    v_cant_consignacion        articulos_suc.cant_consignacion%TYPE := 0;
    v_cant_pedida              articulos_suc.cant_pedida%TYPE := 0;
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
    v_fec_ult_emis_ped         articulos_suc.fec_ult_emis_ped%TYPE := current_date;
    v_fec_ult_recep_ped        articulos_suc.fec_ult_recep_ped%TYPE := current_date;
    v_fec_ult_vta              articulos_suc.fec_ult_vta%TYPE := current_date;
    v_fec_ult_recep_suc        articulos_suc.fec_ult_recep_suc%TYPE := current_date;
    v_fec_ult_remis_suc        articulos_suc.fec_ult_remis_suc%TYPE := current_date;
    v_fec_ult_ajus_cant        articulos_suc.fec_ult_ajus_cant%TYPE := current_date;
    v_fec_ult_ajus_costo       articulos_suc.fec_ult_ajus_costo%TYPE := current_date;
    v_fec_ult_reserva          articulos_suc.fec_ult_reserva%TYPE := current_date;
    v_ranking_abc              articulos_suc.ranking_abc%TYPE := ' ';
    v_fec_ult_calc_rank        articulos_suc.fec_ult_calc_rank%TYPE := current_date;
    v_indice_rot_inv           articulos_suc.indice_rot_inv%TYPE := 0;
    v_fec_ult_calc_iri         articulos_suc.fec_ult_calc_iri%TYPE := current_date;
    v_vehiculo                 NUMBER;

  BEGIN
    pkg_ic.inicializar;
    g_cod_suc_casa_central := pkg_ic.g_cod_suc_casa_central;
    g_fec_ingrid           := pkg_ic.g_fec_ingrid;
    BEGIN

      --raise_application_error(-20999,'Cod.Articulo '|| p_cod_articulo);
      SELECT b.cod_tipo_mercaderia
        INTO v_cod_tipo_mercaderia
        FROM articulos a, familias b, motivos_ajustes_stk c
       WHERE a.cod_articulo = p_cod_articulo
         AND a.cod_familia = b.cod_familia
         AND b.cod_tipo_mercaderia = c.cod_tipo_mercaderia
         AND c.cod_motivo_ajuste = p_cod_motivo_ajuste;

    EXCEPTION
      WHEN no_data_found THEN
        raise_application_error(-20999,
                                'Verifique, No Coinciden el Tipo Mercaderia del Articulo ingresado con el motivo de ajuste...');
      WHEN OTHERS THEN
        raise_application_error(-20999,
                                'Error al Seleccionar Cod.Tipo Mercaderia...' ||
                                SQLERRM);
    END;

    IF v_mueve_stock = 0 THEN
      ROLLBACK;
      raise_application_error(-20999,
                              'No se permiten ajustes de items que no mueven stock...');
    END IF;

    IF v_vehiculo = 1 AND
       (v_cod_tipo_mercaderia != 'REPU' OR v_cod_tipo_mercaderia != 'ELEC') THEN
      raise_application_error(-20999,
                              'No se Permite Consumo Empresa de Vehiculos...');
    END IF;

    BEGIN
      SELECT cod_sucursal
        INTO v_cod_sucursal
        FROM ajustes_stock_art
       WHERE cod_sucursal = p_cod_sucursal
         AND fec_ajuste = p_fec_ajuste
         AND nro_ajuste = p_nro_ajuste
         AND cod_articulo = p_cod_articulo;
      g_rows := 1;
    EXCEPTION
      WHEN no_data_found THEN
        g_rows := 0;
    END;
    IF g_rows > 0 THEN
      ROLLBACK;
      raise_application_error(-20999,
                              'No se permite dos veces el mismo articulo en Consumo Empresa...');
    END IF;

    BEGIN
      SELECT costo_unit
        INTO p_costo_unit
        FROM articulos_suc
       WHERE cod_articulo = p_cod_articulo
         AND cod_sucursal = p_cod_sucursal;
      g_rows := 1;
    EXCEPTION
      WHEN no_data_found THEN
        g_rows := 0;
      WHEN OTHERS THEN
        raise_application_error(-20999,
                                'Error al seleccionar el costo del producto.');
    END;

    IF g_rows <= 0 OR p_costo_unit <= 0 THEN
      BEGIN
        SELECT costo_unit, nvl(costo_unit_mr, 0)
          INTO v_costo_unit, v_costo_unit_mr
          FROM articulos_suc
         WHERE cod_articulo = p_cod_articulo
           AND cod_sucursal = g_cod_suc_casa_central;
      EXCEPTION
        WHEN OTHERS THEN
          raise_application_error(-20999,
                                  'Error al seleccionar articulos_suc...');
      END;
      BEGIN
        UPDATE articulos_suc
           SET costo_unit    = p_costo_unit,
               costo_unit_mr = v_costo_unit_mr,
               fec_ult_act   = v_fecha
         WHERE cod_articulo = p_cod_articulo
           AND cod_sucursal = p_cod_sucursal;
      EXCEPTION
        WHEN OTHERS THEN
          ROLLBACK;
          raise_application_error(-20999,
                                  'Error al actualizar articulos_suc...' ||
                                  SQLERRM);
      END;
      IF g_rows <= 0 THEN
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
             p_costo_unit,
             v_costo_unit_mr,
             v_cant_ult_compra,
             v_costo_unit_prom,
             v_costo_unit_prom_mr,
             v_costo_unit_ult_compra,
             v_costo_unit_ult_compra_mr,
             v_coef_ult_compra,
             v_stock_minimo,
             v_stock_maximo,
             v_punto_pedido,
             v_cod_revision,
             g_fec_ingrid,
             v_fec_ult_emis_ped,
             v_fec_ult_recep_ped,
             v_fec_ult_vta,
             v_fec_ult_recep_suc,
             v_fec_ult_remis_suc,
             v_fec_ult_ajus_cant,
             v_fec_ult_ajus_costo,
             v_fec_ult_reserva,
             v_ranking_abc,
             v_fec_ult_calc_rank,
             v_indice_rot_inv,
             v_fec_ult_calc_iri);
        EXCEPTION
          WHEN OTHERS THEN
            ROLLBACK;
            raise_application_error(-20999,
                                    'Error al Incluir registro en articulos_suc...');
        END;
      END IF;
    END IF;
    IF p_costo_unit <= 0 THEN
      ROLLBACK;
      raise_application_error(-20999,
                              'Verifique el costo del articulo debe ser mayor a cero.');
    END IF;
  END pr_acciones_arti;
        /**
  * procedimiento para filtros 
  * author  : Mariano Arguello 
  * created : 08/12/2024
  **/

PROCEDURE pr_listar_regis(p_cod_sucursal      ajustes_stock.cod_sucursal%TYPE,
                            p_fec_ajuste        ajustes_stock.fec_ajuste%TYPE,
                            p_cod_motivo_ajuste ajustes_stock.cod_motivo_ajuste%TYPE) IS
    g_cod_sucursal   NUMBER;
    g_cod_sucursal_d NUMBER;
    g_cod_sucursal_h NUMBER;
  BEGIN
    pkg_ic.inicializar;
    g_cod_sucursal := pkg_ic.g_cod_sucursal;
    g_cod_sucursal_d := p_cod_sucursal;
    g_cod_sucursal_h := p_cod_sucursal;
    BEGIN
        apex_collection.create_or_truncate_collection(p_collection_name => 'TMP_REGI');

      -- insertar los registros en la coleccion
    IF fn_bandera THEN
        DECLARE
            l_query VARCHAR2(4000) := '  
            SELECT
                m.cod_sucursal,
                m.fec_ajuste,
                m.nro_ajuste,
                m.cod_motivo_ajuste,
                m.comentario,
                m.cod_deposito,
                to_char(m.fec_ult_act, ''DD/MM/YYYY HH24:MI:SS'') AS fec_ult_act,
                m.usr_ult_act
            FROM   ajustes_stock m,
                motivos_ajustes_stk n,
                ajustes_stk_tipos l
            WHERE ( m.cod_sucursal >= ?)
                AND ( m.cod_sucursal <= ?)
                AND m.estado_ajuste = ''REGI''
                AND m.cod_motivo_ajuste = n.cod_motivo_ajuste
                AND n.activo = 1
                AND n.cod_tipo_ajuste = l.cod_tipo_ajuste
                AND l.consumo_empresa = 1';

        l_cursor                BINARY_INTEGER;
        l_nr                    NUMBER := 0;
        l_count                 NUMBER := 0;
        l_arr_cod_sucursal      apex_application_global.vc_arr2;
        l_arr_fec_ajuste        apex_application_global.vc_arr2;
        l_arr_nro_ajuste        apex_application_global.vc_arr2;
        l_arr_cod_motivo_ajuste apex_application_global.vc_arr2;
        l_arr_comentario        apex_application_global.vc_arr2;
        l_arr_cod_deposito      apex_application_global.vc_arr2;
        l_arr_fec_ult_act       apex_application_global.vc_arr2;
        l_arr_usr_ult_act       apex_application_global.vc_arr2;

        BEGIN
            l_cursor := dbms_hs_passthrough.open_cursor@wrk1;
            dbms_hs_passthrough.parse@wrk1(l_cursor, l_query);
            dbms_hs_passthrough.bind_variable@wrk1(l_cursor,1,g_cod_sucursal_d);
            dbms_hs_passthrough.bind_variable@wrk1(l_cursor,2,g_cod_sucursal_h);
        LOOP
            l_nr := dbms_hs_passthrough.fetch_row@wrk1(l_cursor, FALSE);
            EXIT WHEN l_nr = 0;
            l_count := l_count + 1;
            dbms_hs_passthrough.get_value@wrk1(l_cursor,1,l_arr_cod_sucursal(l_count));
            dbms_hs_passthrough.get_value@wrk1(l_cursor,2,l_arr_fec_ajuste(l_count));
            dbms_hs_passthrough.get_value@wrk1(l_cursor,3,l_arr_nro_ajuste(l_count));
            dbms_hs_passthrough.get_value@wrk1(l_cursor,4,l_arr_cod_motivo_ajuste(l_count));
            dbms_hs_passthrough.get_value@wrk1(l_cursor,5,l_arr_comentario(l_count));
            dbms_hs_passthrough.get_value@wrk1(l_cursor,6,l_arr_cod_deposito(l_count));
            dbms_hs_passthrough.get_value@wrk1(l_cursor,7,l_arr_fec_ult_act(l_count));
            dbms_hs_passthrough.get_value@wrk1(l_cursor,8,l_arr_usr_ult_act(l_count));
        END LOOP;

            dbms_hs_passthrough.close_cursor@wrk1(l_cursor);

        apex_collection.add_members(p_collection_name => 'TMP_REGI',
            p_c001            => l_arr_cod_sucursal,
            p_c002            => l_arr_fec_ajuste,
            p_c003            => l_arr_nro_ajuste,
            p_c004            => l_arr_cod_motivo_ajuste,
            p_c005            => l_arr_comentario,
            p_c006            => l_arr_cod_deposito,
            p_c007            => l_arr_fec_ult_act,
            p_c008            => l_arr_usr_ult_act);

        END;
     --   out_out('LLEGA' || p_cod_sucursal || p_fec_ajuste ||
     --           p_cod_motivo_ajuste);
        COMMIT;
        ELSE
            DECLARE
                l_count                 NUMBER := 0;
                l_arr_cod_sucursal      apex_application_global.vc_arr2;
                l_arr_fec_ajuste        apex_application_global.vc_arr2;
                l_arr_nro_ajuste        apex_application_global.vc_arr2;
                l_arr_cod_motivo_ajuste apex_application_global.vc_arr2;
                l_arr_comentario        apex_application_global.vc_arr2;
                l_arr_cod_deposito      apex_application_global.vc_arr2;
                l_arr_fec_ult_act       apex_application_global.vc_arr2;
                l_arr_usr_ult_act       apex_application_global.vc_arr2;

        BEGIN

        FOR rec IN (SELECT m.cod_sucursal,
            m.fec_ajuste,
            m.nro_ajuste,
            m.cod_motivo_ajuste,
            m.comentario,
            m.cod_deposito,
            m.fec_ult_act,
            m.usr_ult_act
        FROM ajustes_stock m,
            motivos_ajustes_stk n,
            ajustes_stk_tipos   l
        WHERE (m.cod_sucursal >= g_cod_sucursal_d OR g_cod_sucursal_d IS NULL)
            AND (m.cod_sucursal <= g_cod_sucursal_h OR g_cod_sucursal_d IS NULL)
            AND m.estado_ajuste = 'REGI'
            AND m.cod_motivo_ajuste = n.cod_motivo_ajuste
            AND n.activo = 1
            AND n.cod_tipo_ajuste = l.cod_tipo_ajuste
            AND l.consumo_empresa = 1) LOOP

            apex_collection.add_member(p_collection_name => 'TMP_REGI',
                p_c001            => rec.cod_sucursal,
                p_c002            => rec.fec_ajuste,
                p_c003            => rec.nro_ajuste,
                p_c004            => rec.cod_motivo_ajuste,
                p_c005            => rec.comentario,
                p_c006            => rec.cod_deposito,
                p_c007            => rec.fec_ult_act,
                p_c008            => rec.usr_ult_act);
        END LOOP;
        END;


    END IF;
    END;
  END pr_listar_regis;

 procedure pr_lookup_articulos(
        p_cod_articulo in articulos.cod_articulo%type,
        p_familia      in varchar2,
        p_grupo        in varchar2,
        p_sbgpo        in varchar2,
        p_descripcion  in varchar2
    ) is
        v1 varchar2(100);
        v2 varchar2(100);
        v3 varchar2(100);
        v4 varchar2(100);
        v5 varchar2(100);
        v_conca_names varchar2(1000);
        v_conca_values varchar2(1000);
        v_sql clob;
    BEGIN

        SELECT
            nvl2(p_descripcion, ' and ml1.descripcion LIKE :p_descripcion ' , null),
            nvl2(p_familia, ' and ml1.cod_familia = :p_familia ', null),
            nvl2(p_grupo, ' and ml1.cod_grupo = :p_grupo ', null),
            nvl2(p_sbgpo, ' and ml1.cod_subgrupo = :p_sbgpo ', null),
            nvl2(p_cod_articulo, ' and ml1.cod_articulo LIKE :p_cod_articulo ', null)
        into
            v1, v2, v3, v4, v5
        from dual;

        v_sql := '
            SELECT
                ml1.cod_articulo,
                ml1.cod_familia,
                ml1.cod_grupo,
                ml1.cod_subgrupo,
                ml1.descripcion,
                ml1.cod_unid_medida,
                ml1.fec_alta,
                ml1.fec_ult_mov,
                ml1.no_reponer,
                ml1.sustituido
            FROM articulos ml1
            WHERE 1 = 1
        ' || v1 || v2 || v3 || v4 || v5;

       --raise_application_error(-20999, 'v_sql : ' || v_sql);

        if v1 is not null then
            v_conca_names := 'p_descripcion';
            v_conca_values := v_conca_values || '%' || UPPER(p_descripcion) || '%' ;
        end if;

        if v2 is not null then
            if v_conca_names is null then
                v_conca_names := 'p_familia';
                v_conca_values := p_familia;
            else
                v_conca_names := v_conca_names || ':p_familia';
                v_conca_values := v_conca_values || ':' || p_familia;
            end if;
        end if;

        if v3 is not null then
            if v_conca_names is null then
                v_conca_names := 'p_grupo';
                v_conca_values := p_grupo;
            else
                v_conca_names := v_conca_names || ':p_grupo';
                v_conca_values := v_conca_values || ':' || p_grupo;
            end if;
        end if;

        if v4 is not null then
            if v_conca_names is null then
                v_conca_names := 'p_sbgpo';
                v_conca_values := p_sbgpo;
            else
                v_conca_names := v_conca_names || ':p_sbgpo';
                v_conca_values := v_conca_values || ':' || p_sbgpo;
            end if;
        end if;

        if v5 is not null then
            if v_conca_names is null then
                v_conca_names := 'p_cod_articulo';
                --v_conca_values := p_cod_articulo;
                v_conca_values := v_conca_values || '%' || Upper(p_cod_articulo) || '%' ;

            else
                v_conca_names := v_conca_names || ':p_cod_articulo';
                v_conca_values := v_conca_values || '%' || Upper(p_cod_articulo) || '%' ;

            end if;
        end if;

        apex_collection.create_collection_from_query_b(
            p_collection_name => 'COL_COM01106_FILTROS',
            p_query => v_sql,
            p_names => apex_util.string_to_table(v_conca_names),
            p_values => apex_util.string_to_table(v_conca_values),
            p_truncate_if_exists => 'YES'
        );
    END pr_lookup_articulos;

END pkg_consumo_empresa;
/