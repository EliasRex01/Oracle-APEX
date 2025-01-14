PROMPT CREATE OR REPLACE PACKAGE pkg_comision_boca_de_cobranza
CREATE OR REPLACE PACKAGE pkg_comision_boca_de_cobranza AS
  -- Creado por Elias Zaracho, Octubre del 2024
  -- para cbc01000, ult mod: 30 octubre del 2024

  -- procedimiento para listar liquidaciones de cbc
  PROCEDURE pr_listar_comisiones_boca_cobranzas(
    P_COD_SUCURSAL                comi_boca_cob_liq.cod_sucursal%TYPE,
    P_COD_PROVEEDOR               comi_boca_cob_liq.cod_proveedor%TYPE,
    P_COD_MONEDA                  comi_boca_cob_liq.cod_moneda%TYPE,
    p_fecha_desde                 comi_boca_cob_liq.fec_liquidacion%TYPE,
    p_fecha_hasta                 comi_boca_cob_liq.fec_liquidacion%TYPE
  );
END PKG_COMISION_BOCA_DE_COBRANZA;
/

PROMPT CREATE OR REPLACE PACKAGE BODY pkg_comision_boca_de_cobranza
CREATE OR REPLACE PACKAGE BODY pkg_comision_boca_de_cobranza AS
  -- body del listar comisiones de cbc cobranzas
  PROCEDURE pr_listar_comisiones_boca_cobranzas(
      P_COD_SUCURSAL                comi_boca_cob_liq.cod_sucursal%TYPE,
      P_COD_PROVEEDOR               comi_boca_cob_liq.cod_proveedor%TYPE,
      P_COD_MONEDA                  comi_boca_cob_liq.cod_moneda%TYPE,
      p_fecha_desde                 comi_boca_cob_liq.fec_liquidacion%TYPE,
      p_fecha_hasta                 comi_boca_cob_liq.fec_liquidacion%TYPE
  )
  IS
  BEGIN
      pkg_ic.inicializar;
      apex_collection.create_or_truncate_collection(p_collection_name => 'TMP_CBCL');
      IF fn_bandera THEN
        DECLARE
          l_query VARCHAR2(4000) :=
          'SELECT cbcl.cod_sucursal,
                cbcl.nro_liqui,
                cbcl.cod_proveedor,
                cbcl.fec_liquidacion,
                cbcl.cod_moneda,
                cbcl.cod_cliente,
                cbcl.importe_comi,
                pl.proveedor,
                cl.cliente,
                mo.abrev_moneda,
                cbcl.fec_liquidacion AS fec
          FROM comi_boca_cob_liq cbcl
          JOIN proveedor_local pl ON cbcl.cod_proveedor = pl.cod_proveedor
          JOIN clientes cl ON cbcl.cod_cliente = cl.cod_cliente
          JOIN monedas mo ON cbcl.cod_moneda = mo.cod_moneda
          JOIN sucursal su ON cbcl.cod_sucursal = su.cod_sucursal
          WHERE (cbcl.cod_sucursal = ?)
            AND (cbcl.cod_proveedor = ?)
            AND (cbcl.cod_moneda = ?)
            AND (cbcl.fec_liquidacion >= ? ) AND (cbcl.fec_liquidacion <= ?)';
        l_cursor BINARY_INTEGER;
        l_nr NUMBER := 0;
        l_count NUMBER := 0;
        l_arr_cod_sucursal     apex_application_global.vc_arr2;
        l_arr_nro_liqui        apex_application_global.vc_arr2;
        l_arr_cod_proveedor    apex_application_global.vc_arr2;
        l_arr_fec_liquidacion  apex_application_global.vc_arr2;
        l_arr_cod_moneda       apex_application_global.vc_arr2;
        l_arr_cod_cliente      apex_application_global.vc_arr2;
        l_arr_importe_comi     apex_application_global.vc_arr2;
        l_arr_proveedor        apex_application_global.vc_arr2;
        l_arr_cliente          apex_application_global.vc_arr2;
        l_arr_abrev_moneda     apex_application_global.vc_arr2;
        l_fec_liquidacion      apex_application_global.D_ARR;
      BEGIN
        l_cursor := DBMS_HS_PASSTHROUGH.OPEN_CURSOR@WRK1;
        DBMS_HS_PASSTHROUGH.PARSE@WRK1(l_cursor, l_query);
        DBMS_HS_PASSTHROUGH.BIND_VARIABLE@WRK1(l_cursor, 1, P_COD_SUCURSAL );
        DBMS_HS_PASSTHROUGH.BIND_VARIABLE@WRK1(l_cursor, 2, P_COD_PROVEEDOR);
        DBMS_HS_PASSTHROUGH.BIND_VARIABLE@WRK1(l_cursor, 3, P_COD_MONEDA);
        DBMS_HS_PASSTHROUGH.BIND_VARIABLE@WRK1(l_cursor, 4, p_fecha_desde);
        DBMS_HS_PASSTHROUGH.BIND_VARIABLE@WRK1(l_cursor, 5, p_fecha_hasta);
        LOOP
          l_nr := DBMS_HS_PASSTHROUGH.FETCH_ROW@WRK1(l_cursor, FALSE);
          EXIT WHEN l_nr = 0;
          l_count := l_count  + 1;
          DBMS_HS_PASSTHROUGH.GET_VALUE@WRK1(l_cursor, 1,  l_arr_cod_sucursal   (l_count));
          DBMS_HS_PASSTHROUGH.GET_VALUE@WRK1(l_cursor, 2,  l_arr_nro_liqui      (l_count));
          DBMS_HS_PASSTHROUGH.GET_VALUE@WRK1(l_cursor, 3,  l_arr_cod_proveedor  (l_count));
          DBMS_HS_PASSTHROUGH.GET_VALUE@WRK1(l_cursor, 4,  l_arr_fec_liquidacion(l_count));
          DBMS_HS_PASSTHROUGH.GET_VALUE@WRK1(l_cursor, 5,  l_arr_cod_moneda     (l_count));
          DBMS_HS_PASSTHROUGH.GET_VALUE@WRK1(l_cursor, 6,  l_arr_cod_cliente    (l_count));
          DBMS_HS_PASSTHROUGH.GET_VALUE@WRK1(l_cursor, 7,  l_arr_importe_comi   (l_count));
          DBMS_HS_PASSTHROUGH.GET_VALUE@WRK1(l_cursor, 8,  l_arr_proveedor      (l_count));
          DBMS_HS_PASSTHROUGH.GET_VALUE@WRK1(l_cursor, 9,  l_arr_cliente        (l_count));
          DBMS_HS_PASSTHROUGH.GET_VALUE@WRK1(l_cursor, 10, l_arr_abrev_moneda   (l_count));
          DBMS_HS_PASSTHROUGH.GET_VALUE@WRK1(l_cursor, 11, l_fec_liquidacion    (l_count));
        END LOOP;
        DBMS_HS_PASSTHROUGH.CLOSE_CURSOR@WRK1(l_cursor);
        apex_collection.add_members(
            p_collection_name => 'TMP_CBCL',
            p_c001 => l_arr_cod_sucursal   ,
            p_c002 => l_arr_nro_liqui      ,
            p_c003 => l_arr_cod_proveedor  ,
            p_c004 => l_arr_fec_liquidacion,
            p_c005 => l_arr_cod_moneda     ,
            p_c006 => l_arr_cod_cliente    ,
            p_c007 => l_arr_importe_comi   ,
            p_c008 => l_arr_proveedor      ,
            p_c009 => l_arr_cliente        ,
            p_c010 => l_arr_abrev_moneda   ,
            p_d001 => l_fec_liquidacion
        );
      END;
    ELSE
      DECLARE
        l_count NUMBER := 0;
        l_arr_cod_sucursal                    apex_application_global.vc_arr2;
        l_arr_nro_liqui                       apex_application_global.vc_arr2;
        l_arr_cod_proveedor                   apex_application_global.vc_arr2;
        l_arr_fec_liquidacion                 apex_application_global.vc_arr2;
        l_arr_cod_moneda                      apex_application_global.vc_arr2;
        l_arr_cod_cliente                     apex_application_global.vc_arr2;
        l_arr_importe_comi                    apex_application_global.vc_arr2;
        l_arr_proveedor                       apex_application_global.vc_arr2;
        l_arr_cliente                         apex_application_global.vc_arr2;
        l_arr_abrev_moneda                    apex_application_global.vc_arr2;
        l_fec_liquidacion                     apex_application_global.D_ARR;
      BEGIN

          FOR R IN (
              SELECT cbcl.cod_sucursal,
                    cbcl.nro_liqui,
                    cbcl.cod_proveedor,
                    TO_CHAR(cbcl.fec_liquidacion, 'DD/MM/YYYY') AS fec_liquidacion,
                    cbcl.cod_moneda,
                    cbcl.cod_cliente,
                    TO_CHAR(cbcl.importe_comi, '999G999G999G999G999G999G990') AS importe_comi,
                    pl.proveedor,
                    cl.cliente,
                    mo.abrev_moneda
              FROM comi_boca_cob_liq cbcl
              JOIN proveedor_local pl ON cbcl.cod_proveedor = pl.cod_proveedor
              JOIN clientes cl ON cbcl.cod_cliente = cl.cod_cliente
              JOIN monedas mo ON cbcl.cod_moneda = mo.cod_moneda
              JOIN sucursal su ON cbcl.cod_sucursal = su.cod_sucursal
              WHERE cbcl.cod_sucursal = P_COD_SUCURSAL
                AND cbcl.cod_proveedor = P_COD_PROVEEDOR
                AND cbcl.cod_moneda = P_COD_MONEDA
                AND cbcl.fec_liquidacion BETWEEN p_fecha_desde AND p_fecha_hasta
          ) LOOP
              l_count := l_count + 1;
              l_arr_cod_sucursal   (l_count) := R.cod_sucursal;
              l_arr_nro_liqui      (l_count) := R.nro_liqui;
              l_arr_cod_proveedor  (l_count) := R.cod_proveedor;
              l_arr_fec_liquidacion(l_count) := R.fec_liquidacion;
              l_arr_cod_moneda     (l_count) := R.cod_moneda;
              l_arr_cod_cliente    (l_count) := R.cod_cliente;
              l_arr_importe_comi   (l_count) := R.importe_comi;
              l_arr_proveedor      (l_count) := R.proveedor;
              l_arr_cliente        (l_count) := R.cliente;
              l_arr_abrev_moneda   (l_count) := R.abrev_moneda;
              l_fec_liquidacion    (l_count) := R.fec_liquidacion;
          END LOOP;
          apex_collection.add_members(
              p_collection_name => 'TMP_CBCL',
              p_c001 => l_arr_cod_sucursal   ,
              p_c002 => l_arr_nro_liqui      ,
              p_c003 => l_arr_cod_proveedor  ,
              p_c004 => l_arr_fec_liquidacion,
              p_c005 => l_arr_cod_moneda     ,
              p_c006 => l_arr_cod_cliente    ,
              p_c007 => l_arr_importe_comi   ,
              p_c008 => l_arr_proveedor      ,
              p_c009 => l_arr_cliente        ,
              p_c010 => l_arr_abrev_moneda   ,
              p_d001 => l_fec_liquidacion
          );
      END;
    END IF;
  END pr_listar_comisiones_boca_cobranzas;
END pkg_comision_boca_de_cobranza;
/

