create or replace PACKAGE pkg_insitu IS

  -- author  : user
  -- created : 17/10/2024 14:14:59
  -- purpose : pkg_insitu

  PROCEDURE pr_app_confirm_proc(p_login            IN sc_sol_confirmacion.usr_proc%TYPE DEFAULT ' ',
                                p_nro_soli         IN sc.nro_soli%TYPE DEFAULT 0,
                                p_nro_confirmacion IN sc_sol_confirmacion.nro_confirmacion%TYPE DEFAULT 0,
                                p_cod_resultado    IN OUT NUMBER,
                                p_resultado        IN OUT VARCHAR2);

  PROCEDURE pr_app_crea_insitu(p_programa                 IN VARCHAR2 DEFAULT ' ',
                               p_cod_resultado            IN OUT NUMBER,
                               p_resultado                IN OUT VARCHAR2,
                               p_login                    IN sc_insitu.usr_alta%TYPE DEFAULT ' ',
                               p_serial_instal            IN app_sinc_sc_insitu.serial_instal%TYPE DEFAULT 0,
                               p_id_row_device            IN app_sinc_sc_insitu.id_row_device%TYPE DEFAULT 0,
                               p_nro_soli                 IN sc_insitu.nro_soli%TYPE DEFAULT 0,
                               p_nro_sol                  IN sc_insitu.nro_sol%TYPE DEFAULT 0,
                               p_nro_item_trabajo         IN sc_insitu.nro_item_trabajo%TYPE DEFAULT 0,
                               p_depend_indep_agrogan     IN sc_insitu.depend_indep_agrogan%TYPE DEFAULT ' ',
                               p_nombre                   IN sc_insitu.nombre%TYPE DEFAULT ' ',
                               p_apellido                 IN sc_insitu.apellido%TYPE DEFAULT ' ',
                               p_direccion_laboral        IN sc_insitu.direccion_laboral%TYPE DEFAULT ' ',
                               p_tipo_local               IN sc_insitu.tipo_local%TYPE DEFAULT ' ',
                               p_paga_patente             IN sc_insitu.paga_patente%TYPE DEFAULT ' ',
                               p_fecha_confirmacion       IN sc_insitu.fecha_confirmacion%TYPE DEFAULT NULL,
                               p_estado_civil             IN sc_insitu.estado_civil%TYPE DEFAULT ' ',
                               p_hijos                    IN sc_insitu.hijos%TYPE DEFAULT 0,
                               p_menores                  IN sc_insitu.menores%TYPE DEFAULT 0,
                               p_nombre_conyuge           IN sc_insitu.nombre_conyuge%TYPE DEFAULT ' ',
                               p_trabajo_conyuge          IN sc_insitu.trabajo_conyuge%TYPE DEFAULT ' ',
                               p_comentario               IN sc_insitu.comentario%TYPE DEFAULT ' ',
                               p_datos_proporcionados_por IN sc_insitu.datos_proporcionados_por%TYPE DEFAULT ' ',
                               p_nro_confirmacion         IN NUMBER DEFAULT 0,
                               p_croquis_hablado          IN sc_insitu.croquis_hablado%TYPE DEFAULT ' ',
                               p_visitador_aprueba        IN sc_insitu.visitador_aprueba%TYPE DEFAULT ' ',
                               p_visitador_comentario     IN sc_insitu.visitador_comentario%TYPE DEFAULT ' ');

  PROCEDURE pr_app_crea_insitu_depe(p_login                    IN sc_insitu_dependiente.usr_ult_act%TYPE DEFAULT ' ',
                                    p_serial_instal            IN NUMBER DEFAULT 0,
                                    p_id_row_device            IN NUMBER DEFAULT 0,
                                    p_nro_soli                 IN sc_insitu_dependiente.nro_soli%TYPE DEFAULT 0,
                                    p_nro_sol                  IN sc_insitu_dependiente.nro_sol%TYPE DEFAULT 0,
                                    p_nro_item_trabajo         IN sc_insitu_dependiente.nro_item_trabajo%TYPE DEFAULT 0,
                                    p_depend_indep_agrogan     IN VARCHAR2 DEFAULT ' ',
                                    p_nombre                   IN VARCHAR2 DEFAULT ' ',
                                    p_apellido                 IN VARCHAR2 DEFAULT ' ',
                                    p_direccion_laboral        IN VARCHAR2 DEFAULT ' ',
                                    p_tipo_local               IN VARCHAR2 DEFAULT ' ',
                                    p_paga_patente             IN VARCHAR2 DEFAULT ' ',
                                    p_fecha_confirmacion       IN DATE DEFAULT NULL,
                                    p_estado_civil             IN VARCHAR2 DEFAULT ' ',
                                    p_hijos                    IN NUMBER DEFAULT 0,
                                    p_menores                  IN NUMBER DEFAULT 0,
                                    p_nombre_conyuge           IN VARCHAR2 DEFAULT ' ',
                                    p_trabajo_conyuge          IN VARCHAR2 DEFAULT ' ',
                                    p_comentario               IN sc_insitu_dependiente.comentario%TYPE DEFAULT ' ',
                                    p_datos_proporcionados_por IN VARCHAR2 DEFAULT ' ',
                                    p_empresa                  IN sc_insitu_dependiente.empresa%TYPE DEFAULT ' ',
                                    p_antiguedad_anos          IN NUMBER DEFAULT 0,
                                    p_antiguedad_meses         IN NUMBER DEFAULT 0,
                                    p_cargo                    IN sc_insitu_dependiente.cargo%TYPE DEFAULT ' ',
                                    p_salario_mensual          IN sc_insitu_dependiente.salario_mensual%TYPE DEFAULT 0,
                                    p_salario_semanal          IN sc_insitu_dependiente.salario_semanal%TYPE DEFAULT 0,
                                    p_comision                 IN sc_insitu_dependiente.comision%TYPE DEFAULT 0,
                                    p_rubro_empresa            IN sc_insitu_dependiente.rubro_empresa%TYPE DEFAULT ' ',
                                    p_cantidad_funcionario     IN sc_insitu_dependiente.cantidad_funcionario%TYPE DEFAULT 0,
                                    p_cantidad_sucursal        IN sc_insitu_dependiente.cantidad_sucursal%TYPE DEFAULT 0,
                                    p_comentario_depe          IN sc_insitu_dependiente.comentario%TYPE DEFAULT ' ',
                                    p_nro_confirmacion         IN NUMBER DEFAULT 0,
                                    p_croquis_hablado          IN VARCHAR2 DEFAULT ' ',
                                    p_visitador_aprueba        IN VARCHAR2 DEFAULT ' ',
                                    p_visitador_comentario     IN VARCHAR2 DEFAULT ' ');

  PROCEDURE pr_bandeja_analista(p_nro_soli      IN sc_sol_confirmacion.nro_soli%TYPE DEFAULT 0,
                                p_login         IN sc_sol_confirmacion.usr_alta%TYPE DEFAULT ' ',
                                p_origen        IN sc_sol_confirmacion.origen%TYPE DEFAULT ' ',
                                p_cod_resultado OUT NUMBER,
                                p_resultado     IN OUT VARCHAR2);

  PROCEDURE pr_guarda_proceso_depe(p_nro_soli         IN NUMBER,
                                   p_nro_sol          IN NUMBER,
                                   p_nombre           IN VARCHAR2,
                                   p_apellido         IN VARCHAR2,
                                   p_nro_confirmacion IN NUMBER,
                                   p_nro_item_trabajo IN NUMBER);

  PROCEDURE pr_cargar_articulos_inventarios;

  PROCEDURE pr_app_crea_insitu_inde(p_login                     IN sc_insitu_independiente.usr_ult_act%TYPE DEFAULT ' ',
                                    p_serial_instal             IN NUMBER DEFAULT 0,
                                    p_id_row_device             IN NUMBER DEFAULT 0,
                                    p_nro_soli                  IN sc_insitu_independiente.nro_soli%TYPE DEFAULT 0,
                                    p_nro_sol                   IN sc_insitu_independiente.nro_sol%TYPE DEFAULT 0,
                                    p_nro_item_trabajo          IN sc_insitu_independiente.nro_item_trabajo%TYPE DEFAULT 0,
                                    p_depend_indep_agrogan      IN VARCHAR2 DEFAULT ' ',
                                    p_nombre                    IN VARCHAR2 DEFAULT ' ',
                                    p_apellido                  IN VARCHAR2 DEFAULT ' ',
                                    p_direccion_laboral         IN VARCHAR2 DEFAULT ' ',
                                    p_tipo_local                IN VARCHAR2 DEFAULT ' ',
                                    p_paga_patente              IN VARCHAR2 DEFAULT ' ',
                                    p_fecha_confirmacion        IN DATE DEFAULT NULL,
                                    p_estado_civil              IN VARCHAR2 DEFAULT ' ',
                                    p_hijos                     IN NUMBER DEFAULT 0,
                                    p_menores                   IN NUMBER DEFAULT 0,
                                    p_nombre_conyuge            IN VARCHAR2 DEFAULT ' ',
                                    p_trabajo_conyuge           IN VARCHAR2 DEFAULT ' ',
                                    p_comentario                IN sc_insitu_independiente.comentario%TYPE DEFAULT ' ',
                                    p_datos_proporcionados_por  IN VARCHAR2 DEFAULT ' ',
                                    p_actividad                 IN sc_insitu_independiente.actividad%TYPE DEFAULT ' ',
                                    p_antiguedad                IN sc_insitu_independiente.antiguedad%TYPE DEFAULT NULL,
                                    p_antiguedad_anos           IN NUMBER DEFAULT 0,
                                    p_antiguedad_meses          IN NUMBER DEFAULT 0,
                                    p_venta_semanal             IN sc_insitu_independiente.venta_semanal%TYPE DEFAULT 0,
                                    p_costo_semanal             IN sc_insitu_independiente.costo_semanal%TYPE DEFAULT 0,
                                    p_ganancia_semanal          IN sc_insitu_independiente.ganancia_semanal%TYPE DEFAULT 0,
                                    p_cantidad_mercaderia       IN sc_insitu_independiente.cantidad_mercaderia%TYPE DEFAULT 0,
                                    p_valor_aproximado          IN sc_insitu_independiente.valor_aproximado%TYPE DEFAULT 0,
                                    p_tiene_funcionario         IN sc_insitu_independiente.tiene_funcionario%TYPE DEFAULT ' ',
                                    p_cantidad_funcionario      IN sc_insitu_independiente.cantidad_funcionario%TYPE DEFAULT 0,
                                    p_sueldo                    IN sc_insitu_independiente.sueldo%TYPE DEFAULT 0,
                                    p_vehiculo                  IN sc_insitu_independiente.vehiculo%TYPE DEFAULT ' ',
                                    p_anho_vehiculo             IN sc_insitu_independiente.anho_vehiculo%TYPE DEFAULT 0,
                                    p_comentario_inde           IN sc_insitu_independiente.comentario%TYPE DEFAULT ' ',
                                    p_venta_mensual             IN sc_insitu_independiente.venta_mensual%TYPE DEFAULT 0,
                                    p_costo_mensual             IN sc_insitu_independiente.costo_mensual%TYPE DEFAULT 0,
                                    p_ganancia_mensual          IN sc_insitu_independiente.ganancia_mensual%TYPE DEFAULT 0,
                                    p_otra_act_economica        IN sc_insitu_independiente.otra_act_economica%TYPE DEFAULT ' ',
                                    p_otra_act_antiguedad_anho  IN sc_insitu_independiente.otra_act_antiguedad_anho%TYPE DEFAULT 0,
                                    p_otra_act_antiguedad_meses IN sc_insitu_independiente.otra_act_antiguedad_meses%TYPE DEFAULT 0,
                                    p_otra_act_ingreso          IN sc_insitu_independiente.otra_act_ingreso%TYPE DEFAULT 0,
                                    p_otra_act_comentario       IN sc_insitu_independiente.otra_act_comentario%TYPE DEFAULT ' ',
                                    p_descripcion_de            IN sc_insitu_independiente.descripcion_de%TYPE DEFAULT ' ',
                                    p_cod_localidad             IN sc_insitu_independiente.cod_localidad%TYPE DEFAULT 0,
                                    p_construccion_de           IN sc_insitu_independiente.construccion_de%TYPE DEFAULT ' ',
                                    p_muebles_vehiculos         IN sc_insitu_independiente.muebles_vehiculos%TYPE DEFAULT ' ',
                                    p_maquinarias_herramientas  IN sc_insitu_independiente.maquinarias_herramientas%TYPE DEFAULT ' ',
                                    p_nro_confirmacion          IN NUMBER DEFAULT 0,
                                    p_croquis_hablado           IN VARCHAR2 DEFAULT ' ',
                                    p_visitador_aprueba         IN VARCHAR2 DEFAULT ' ',
                                    p_visitador_comentario      IN VARCHAR2 DEFAULT ' ');

  PROCEDURE pr_guarda_proceso_inde(p_nro_soli         IN NUMBER,
                                   p_nro_sol          IN NUMBER,
                                   p_nombre           IN VARCHAR2,
                                   p_apellido         IN VARCHAR2,
                                   p_nro_confirmacion IN NUMBER,
                                   p_nro_item_trabajo IN NUMBER);

  PROCEDURE pr_app_inserta_insitu_inventario(p_login            IN sc_insitu_inventario.usr_alta%TYPE DEFAULT ' ',
                                             p_serial_instal    IN NUMBER DEFAULT 0,
                                             p_nro_soli         IN sc_insitu_inventario.nro_soli%TYPE DEFAULT 0,
                                             p_nro_sol          IN sc_insitu_inventario.nro_sol%TYPE DEFAULT 0,
                                             p_nro_item_trabajo IN sc_insitu_inventario.nro_item_trabajo%TYPE DEFAULT 0,
                                             p_cod_producto     IN sc_insitu_inventario.cod_producto%TYPE DEFAULT ' ',
                                             p_cantidad         IN sc_insitu_inventario.cantidad%TYPE DEFAULT 0);

  PROCEDURE pr_cargar_cultivos;

  PROCEDURE pr_cargar_ganados;

  PROCEDURE pr_cargar_derivados;

  PROCEDURE pr_app_crea_insitu_agro(p_login                    IN sc_insitu_agrogana.usr_ult_act%TYPE DEFAULT ' ',
                                    p_serial_instal            IN NUMBER DEFAULT 0,
                                    p_id_row_device            IN NUMBER DEFAULT 0,
                                    p_nro_soli                 IN sc_insitu_agrogana.nro_soli%TYPE DEFAULT 0,
                                    p_nro_sol                  IN sc_insitu_agrogana.nro_sol%TYPE DEFAULT 0,
                                    p_nro_item_trabajo         IN sc_insitu_agrogana.nro_item_trabajo%TYPE DEFAULT 0,
                                    p_depend_indep_agrogan     IN VARCHAR2 DEFAULT ' ',
                                    p_nombre                   IN VARCHAR2 DEFAULT ' ',
                                    p_apellido                 IN VARCHAR2 DEFAULT ' ',
                                    p_direccion_laboral        IN VARCHAR2 DEFAULT ' ',
                                    p_tipo_local               IN VARCHAR2 DEFAULT ' ',
                                    p_paga_patente             IN VARCHAR2 DEFAULT ' ',
                                    p_fecha_confirmacion       IN DATE DEFAULT NULL,
                                    p_estado_civil             IN VARCHAR2 DEFAULT ' ',
                                    p_hijos                    IN NUMBER DEFAULT 0,
                                    p_menores                  IN NUMBER DEFAULT 0,
                                    p_nombre_conyuge           IN VARCHAR2 DEFAULT ' ',
                                    p_trabajo_conyuge          IN VARCHAR2 DEFAULT ' ',
                                    p_comentario               IN VARCHAR2 DEFAULT ' ',
                                    p_datos_proporcionados_por IN VARCHAR2 DEFAULT ' ',
                                    p_actividad_principal      IN sc_insitu_agrogana.actividad_principal%TYPE DEFAULT ' ',
                                    p_desc_actividad           IN sc_insitu_agrogana.desc_actividad%TYPE DEFAULT ' ',
                                    p_total_hectarea           IN sc_insitu_agrogana.total_hectarea%TYPE DEFAULT 0,
                                    p_total_plantado           IN sc_insitu_agrogana.total_plantado%TYPE DEFAULT 0,
                                    p_desc_plantacion          IN sc_insitu_agrogana.desc_plantacion%TYPE DEFAULT ' ',
                                    p_producto_derivado        IN sc_insitu_agrogana.producto_derivado%TYPE DEFAULT ' ',
                                    p_desc_derivado            IN sc_insitu_agrogana.desc_derivado%TYPE DEFAULT ' ',
                                    p_cantidad_por_semana      IN sc_insitu_agrogana.cantidad_por_semana%TYPE DEFAULT 0,
                                    p_precio_por_semana        IN sc_insitu_agrogana.precio_por_semana%TYPE DEFAULT 0,
                                    p_referencia_comercial     IN sc_insitu_agrogana.referencia_comercial%TYPE DEFAULT ' ',
                                    p_nombre_acopiador         IN sc_insitu_agrogana.nombre_acopiador%TYPE DEFAULT ' ',
                                    p_nombre_proveedor         IN sc_insitu_agrogana.nombre_proveedor%TYPE DEFAULT ' ',
                                    p_cant_electro             IN sc_insitu_agrogana.cant_electro%TYPE DEFAULT 0,
                                    p_cant_movil               IN sc_insitu_agrogana.cant_movil%TYPE DEFAULT 0,
                                    p_cant_maquinaria          IN sc_insitu_agrogana.cant_maquinaria%TYPE DEFAULT 0,
                                    p_ingreso_diario           IN sc_insitu_agrogana.ingreso_diario%TYPE DEFAULT 0,
                                    p_ingreso_semanal          IN sc_insitu_agrogana.ingreso_semanal%TYPE DEFAULT 0,
                                    p_ingreso_quincenal        IN sc_insitu_agrogana.ingreso_quincenal%TYPE DEFAULT 0,
                                    p_ingreso_mensual          IN sc_insitu_agrogana.ingreso_mensual%TYPE DEFAULT 0,
                                    p_ingreso_por_zafra        IN sc_insitu_agrogana.ingreso_por_zafra%TYPE DEFAULT 0,
                                    p_total_ingresos           IN sc_insitu_agrogana.total_ingresos%TYPE DEFAULT 0,
                                    p_otra_act_economica       IN sc_insitu_agrogana.otra_act_economica%TYPE DEFAULT ' ',
                                    p_otra_act_ingreso_mensual IN sc_insitu_agrogana.otra_act_ingreso_mensual%TYPE DEFAULT 0,
                                    p_otra_act_comentario      IN sc_insitu_agrogana.otra_act_comentario%TYPE DEFAULT ' ',
                                    p_descripcion_de           IN sc_insitu_agrogana.descripcion_de%TYPE DEFAULT ' ',
                                    p_cod_localidad            IN sc_insitu_agrogana.cod_localidad%TYPE DEFAULT 0,
                                    p_terreno                  IN sc_insitu_agrogana.terreno%TYPE DEFAULT ' ',
                                    p_muebles_vehiculos        IN sc_insitu_agrogana.muebles_vehiculos%TYPE DEFAULT ' ',
                                    p_maquinarias_herramientas IN sc_insitu_agrogana.maquinarias_herramientas%TYPE DEFAULT ' ',
                                    p_nro_confirmacion         IN NUMBER DEFAULT 0,
                                    p_croquis_hablado          IN VARCHAR2 DEFAULT ' ',
                                    p_visitador_aprueba        IN VARCHAR2 DEFAULT ' ',
                                    p_visitador_comentario     IN VARCHAR2 DEFAULT ' ');

  PROCEDURE pr_guarda_proceso_agro(p_nro_soli         IN NUMBER,
                                   p_nro_sol          IN NUMBER,
                                   p_nombre           IN VARCHAR2,
                                   p_apellido         IN VARCHAR2,
                                   p_nro_confirmacion IN NUMBER,
                                   p_nro_item_trabajo IN NUMBER);

  PROCEDURE pr_app_inserta_insitu_cultivo(p_login            IN sc_insitu_cultivo.usr_alta%TYPE DEFAULT ' ',
                                          p_serial_instal    IN NUMBER DEFAULT 0,
                                          p_nro_soli         IN sc_insitu_cultivo.nro_soli%TYPE DEFAULT 0,
                                          p_nro_sol          IN sc_insitu_cultivo.nro_sol%TYPE DEFAULT 0,
                                          p_nro_item_trabajo IN sc_insitu_cultivo.nro_item_trabajo%TYPE DEFAULT 0,
                                          p_cod_producto     IN sc_insitu_cultivo.cod_producto%TYPE DEFAULT 0,
                                          p_cantidad         IN sc_insitu_cultivo.cantidad%TYPE DEFAULT 0);

  PROCEDURE pr_app_inserta_insitu_ganado(p_login            IN sc_insitu_ganado.usr_alta%TYPE DEFAULT ' ',
                                         p_serial_instal    IN NUMBER DEFAULT 0,
                                         p_nro_soli         IN sc_insitu_ganado.nro_soli%TYPE DEFAULT 0,
                                         p_nro_sol          IN sc_insitu_ganado.nro_sol%TYPE DEFAULT 0,
                                         p_nro_item_trabajo IN sc_insitu_ganado.nro_item_trabajo%TYPE DEFAULT 0,
                                         p_cod_producto     IN sc_insitu_ganado.cod_producto%TYPE DEFAULT 0,
                                         p_cantidad         IN sc_insitu_ganado.cantidad%TYPE DEFAULT 0);

  PROCEDURE pr_app_inserta_insitu_derivado(p_login            IN sc_insitu_derivado.usr_alta%TYPE DEFAULT ' ',
                                           p_serial_instal    IN NUMBER DEFAULT 0,
                                           p_nro_soli         IN sc_insitu_derivado.nro_soli%TYPE DEFAULT 0,
                                           p_nro_sol          IN sc_insitu_derivado.nro_sol%TYPE DEFAULT 0,
                                           p_nro_item_trabajo IN sc_insitu_derivado.nro_item_trabajo%TYPE DEFAULT 0,
                                           p_cod_producto     IN sc_insitu_derivado.cod_producto%TYPE DEFAULT 0,
                                           p_cantidad         IN sc_insitu_derivado.cantidad%TYPE DEFAULT 0);

  PROCEDURE pr_app_sc_confirmacion_asig(p_login            VARCHAR2,
                                        p_nro_soli         NUMBER,
                                        p_nro_confirmacion NUMBER,
                                        p_resultado        OUT VARCHAR2);

  FUNCTION fn_in_situ_pendientes(p_usuario IN VARCHAR2) RETURN NUMBER;

  FUNCTION fn_mi_bandeja_in_situ(p_instancia IN VARCHAR2,
                                 p_usuario   IN VARCHAR2) RETURN NUMBER;

  FUNCTION fn_insitus_realizados(p_instancia IN VARCHAR2,
                                 p_usuario   IN VARCHAR2) RETURN NUMBER;

  PROCEDURE pr_app_asig_manual_insitu(p_login    VARCHAR2,
                                      p_nro_soli VARCHAR2,
                                      p_tipo_sol VARCHAR2,
                                      p_resultado OUT VARCHAR2);
                                      

END pkg_insitu;
/
create or replace PACKAGE BODY pkg_insitu IS

  /**
  * procedimiento para insertar / actualizar bandeja de analista
  * author  : hector segovia
  * created : 09/10/2024
  **/
  PROCEDURE pr_bandeja_analista(p_nro_soli      IN sc_sol_confirmacion.nro_soli%TYPE DEFAULT 0,
                                p_login         IN sc_sol_confirmacion.usr_alta%TYPE DEFAULT ' ',
                                p_origen        IN sc_sol_confirmacion.origen%TYPE DEFAULT ' ',
                                p_cod_resultado OUT NUMBER,
                                p_resultado     IN OUT VARCHAR2)

   IS
    v_nro_sol            sc_det.nro_sol%TYPE := 0;
    v_nro_item_trabajo   NUMBER := 0;
    v_row_count          NUMBER := 0;
    v_nro_confirmacion   sc_sol_confirmacion.nro_confirmacion%TYPE := 0;
    v_nro_referencia     sc_sol_confirmacion.nro_referencia%TYPE := 0;
    v_prioridad          sc_sol_confirmacion.prioridad%TYPE := 0;
    v_usr_proc           sc_sol_confirmacion.usr_proc%TYPE := ' ';
    v_usr_ana            sc.usr_ana%TYPE := ' ';
    v_ult_usr_ana        sc.usr_ana%TYPE := ' ';
    v_es_empleado_alex   sc_sol_confirmacion.es_empleado_alex%TYPE := 0;
    v_nro_cedula         sc_sol.nro_cedula%TYPE := 0;
    v_estado_soli        sc.estado_soli%TYPE := ' ';
    v_nro_confirm_prio   sc_sol_confirmacion.nro_confirmacion%TYPE := 0;
    v_viable_asig_auto   sc_sol_confirmacion.viable_asig_auto%TYPE := 0;
    v_tipo_asig          sc_sol_confirmacion.tipo_asig%TYPE := ' ';
    v_cod_tipo_mercadria sc_tipo_soli.cod_tipo_mercaderia%TYPE := ' ';
    v_cant_tarea_gen     NUMBER := 0;
    v_cant_tarea_pend    NUMBER := 0;
    v_fec_asignado_por   sc_sol_confirmacion.fec_asignado_por%TYPE;
    v_asignado_por       sc_sol_confirmacion.asignado_por%TYPE;
    v_analista_en_sesion NUMBER := 0;
    v_data_base          VARCHAR2(32) := ' ';
    v_analista_activo    sc_asig_analista.activo%TYPE := 0;
    v_en_sesion          sc_asig_analista.en_sesion%TYPE := 0;
    v_event_text         VARCHAR2(256) := ' ';
    v_en_cola            NUMBER := 0;
    v_cod_sucursal       sc.cod_sucursal%TYPE := 0;
    v_p_login            VARCHAR2(8);
    v_p_origen           VARCHAR2(3);
  BEGIN
    v_p_origen := p_origen;
    v_p_login  := p_login;

    v_event_text := 'nro_soli=' || p_nro_soli;
    v_prioridad  := 10;
    BEGIN
      SELECT prioridad, nro_confirmacion
        INTO v_prioridad, v_nro_confirm_prio
        FROM sc_sol_confirmacion
       WHERE nro_soli = p_nro_soli
       ORDER BY 2 ASC FETCH FIRST 1 rows ONLY;
    EXCEPTION
      WHEN no_data_found THEN
        NULL;
      WHEN OTHERS THEN
        p_cod_resultado := 101;
        p_resultado     := p_resultado ||
                           'Error al seleccionar prioridad...';
        raise_application_error(-20999, p_resultado || ' ' || SQLERRM);
    END;
    p_cod_resultado := 0;
    p_resultado     := 'dbp:bandeja_analista. ';
    IF (TRIM(v_p_login) = '') THEN
      BEGIN
        SELECT fn_user() INTO v_p_login FROM dual;
      EXCEPTION
        WHEN no_data_found THEN
          NULL;
        WHEN OTHERS THEN
          raise_application_error(-20999,
                                  'texto del error' || ' ' || SQLERRM);
      END;
    END IF;
    IF (TRIM(v_p_origen) = '') THEN
      v_p_origen := 'N/A';
    END IF;
    BEGIN
      SELECT usr_ana,
             usr_ana,
             estado_soli,
             sc_tipo_soli.cod_tipo_mercaderia,
             cod_sucursal
        INTO v_usr_ana,
             v_ult_usr_ana,
             v_estado_soli,
             v_cod_tipo_mercadria,
             v_cod_sucursal
        FROM sc, sc_tipo_soli
       WHERE nro_soli = p_nro_soli
         AND sc.cod_tipo_soli = sc_tipo_soli.cod_tipo_soli;
    EXCEPTION
      WHEN no_data_found THEN
        NULL;
      WHEN OTHERS THEN
        p_cod_resultado := 101;
        p_resultado     := p_resultado ||
                           'Error al seleccionar analista 1...';
        raise_application_error(-20999, p_resultado || ' ' || SQLERRM);
    END;
    IF v_ult_usr_ana = '--' OR TRIM(v_ult_usr_ana) = ' ' THEN
      v_ult_usr_ana := ' ';
    ELSE
      BEGIN
        SELECT en_sesion, activo
          INTO v_en_sesion, v_analista_activo
          FROM sc_asig_analista
         WHERE login = v_ult_usr_ana;
      EXCEPTION
        WHEN no_data_found THEN
          v_analista_en_sesion := 1;
        WHEN OTHERS THEN
          p_cod_resultado := 101;
          p_resultado     := p_resultado ||
                             'Error al seleccionar bandeja pendiente...';
          raise_application_error(-20999, p_resultado || ' ' || SQLERRM);
      END;
      IF v_analista_activo = 1 THEN
        v_analista_en_sesion := 1;
      ELSE
        v_analista_en_sesion := 0;
      END IF;
    END IF;
    BEGIN
      SELECT COUNT(*),
             MAX(usr_proc),
             MAX(cant_tarea_gen),
             MAX(nro_confirmacion)
        INTO v_row_count, v_usr_proc, v_cant_tarea_gen, v_nro_confirmacion
        FROM sc_sol_confirmacion
       WHERE nro_soli = p_nro_soli
         AND instancia = 'ANA'
         AND estado_confirmacion = 'PEND';
      v_usr_proc         := nvl(v_usr_proc, '');
      v_cant_tarea_gen   := nvl(v_cant_tarea_gen, 0);
      v_nro_confirmacion := nvl(v_nro_confirmacion, 0);
    EXCEPTION
      WHEN no_data_found THEN
        NULL;
      WHEN OTHERS THEN
        p_cod_resultado := 101;
        p_resultado     := p_resultado ||
                           'Error al seleccionar tarea de an?lisis...';
        raise_application_error(-20999, p_resultado || ' ' || SQLERRM);
    END;
    IF v_row_count > 1 THEN
      p_cod_resultado := 101;
      p_resultado     := p_resultado ||
                         'Existe m?s de una tarea de an?lisis...';
      raise_application_error(-20999, p_resultado || ' ' || SQLERRM);
    ELSIF v_row_count = 1 THEN
      BEGIN
        SELECT COUNT(*)
          INTO v_cant_tarea_pend
          FROM sc_sol_confirmacion
         WHERE nro_soli = p_nro_soli
           AND nro_confirmacion != v_nro_confirmacion
           AND estado_confirmacion = 'PEND';
      EXCEPTION
        WHEN no_data_found THEN
          NULL;
        WHEN OTHERS THEN
          p_cod_resultado := 101;
          p_resultado     := p_resultado ||
                             'Error al seleccionar cantidad tareas pendientes...';
          raise_application_error(-20999, p_resultado || ' ' || SQLERRM);
      END;
      IF (v_cant_tarea_pend > 0) THEN
        RETURN;
      ELSE
        DECLARE
          l_current_date DATE := current_date;
        BEGIN
          UPDATE sc_sol_confirmacion
             SET pend_fin_tarea = 0,
                 fec_cola       = l_current_date,
                 cant_tarea_fin = cant_tarea_gen
           WHERE nro_soli = p_nro_soli
             AND nro_confirmacion = v_nro_confirmacion
             AND estado_confirmacion = 'PEND';
        EXCEPTION
          WHEN OTHERS THEN
            p_cod_resultado := 101;
            p_resultado     := p_resultado ||
                               'Error al seleccionar bandeja pendiente...';
            raise_application_error(-20999, p_resultado || ' ' || SQLERRM);
        END;
        v_en_cola := 1;
      END IF;
      IF (v_usr_proc = '' AND v_ult_usr_ana != '' AND
         v_analista_en_sesion = 1) THEN
        DECLARE
          l_current_date DATE := current_date;
        BEGIN
          UPDATE sc_sol_confirmacion
             SET usr_proc         = v_ult_usr_ana,
                 asignado_por     = 'ingres',
                 fec_asignado_por = l_current_date,
                 tipo_asig        = 'E'
           WHERE nro_soli = p_nro_soli
             AND nro_confirmacion = v_nro_confirmacion
             AND usr_proc = ''
             AND estado_confirmacion = 'PEND';
        EXCEPTION
          WHEN OTHERS THEN
            p_cod_resultado := 101;
            p_resultado     := p_resultado ||
                               'Error al seleccionar bandeja pendiente...';
            raise_application_error(-20999, p_resultado || ' ' || SQLERRM);
        END;
        v_en_cola := 0;
      END IF;
      IF v_en_cola = 1 THEN
        v_event_text := 'cod_sucursal=' || v_cod_sucursal || ' ' ||
                        'nro_soli=' || p_nro_soli || ' ' ||
                        'nro_confirmacion=' || v_nro_confirmacion;
      END IF;
      RETURN;
    END IF;
    BEGIN
      SELECT nro_cedula, a.nro_sol
        INTO v_nro_cedula, v_nro_sol
        FROM sc_det a, sc_sol b
       WHERE a.nro_soli = p_nro_soli
         AND a.tipo_sol = 'SOL'
         AND a.nro_sol = b.nro_sol;
    EXCEPTION
      WHEN no_data_found THEN
        NULL;
      WHEN OTHERS THEN
        p_cod_resultado := 101;
        p_resultado     := p_resultado ||
                           'Error al seleccionar solicitante...';
        raise_application_error(-20999, p_resultado || ' ' || SQLERRM);
    END;
    BEGIN
      SELECT COUNT(a.cod_persona)
        INTO v_row_count
        FROM persona a, personal b
       WHERE a.nro_cedula_id = v_nro_cedula
         AND a.cod_persona = b.cod_persona
         AND b.estado_personal IN ('ACTI', 'SUSP', 'LICE', 'VACA');
      v_row_count := nvl(v_row_count, 0);
    EXCEPTION
      WHEN no_data_found THEN
        NULL;
      WHEN OTHERS THEN
        p_cod_resultado := 101;
        p_resultado     := p_resultado ||
                           'Error al verificar estado del personal.';
        raise_application_error(-20999, p_resultado || ' ' || SQLERRM);
    END;
    IF v_row_count > 0 THEN
      v_es_empleado_alex := 1;
    ELSE
      v_es_empleado_alex := 0;
    END IF;
    IF v_es_empleado_alex = 1 OR v_cod_tipo_mercadria = '4RUE' THEN
      v_viable_asig_auto := 0;
    ELSE
      v_viable_asig_auto := 1;
    END IF;
    v_usr_proc         := ' ';
    v_tipo_asig        := ' ';
    v_asignado_por     := ' ';
    v_fec_asignado_por := NULL;
    v_en_cola          := 1;
    IF (v_ult_usr_ana != '' AND v_analista_en_sesion = 1) THEN
      v_usr_proc         := v_ult_usr_ana;
      v_tipo_asig        := 'D';
      v_asignado_por     := 'ingres';
      v_fec_asignado_por := current_date;
      v_en_cola          := 0;
    END IF;
    BEGIN
      SELECT nvl(MAX(nro_confirmacion), 0) + 1
        INTO v_nro_confirmacion
        FROM sc_sol_confirmacion
       WHERE nro_soli = p_nro_soli;
    EXCEPTION
      WHEN no_data_found THEN
        NULL;
      WHEN OTHERS THEN
        p_cod_resultado := 101;
        p_resultado     := p_resultado ||
                           'Error al seleccionar sgte n?mero de confirmaci?n...';
        raise_application_error(-20999, p_resultado || ' ' || SQLERRM);
    END;
    BEGIN
      SELECT nvl(MAX(nro_referencia), 0) + 1
        INTO v_nro_referencia
        FROM sc_sol_confirmacion
       WHERE nro_soli = p_nro_soli
         AND instancia = 'ANA';
    EXCEPTION
      WHEN no_data_found THEN
        NULL;
      WHEN OTHERS THEN
        p_cod_resultado := 101;
        p_resultado     := p_resultado ||
                           'Error al seleccionar sgte n?mero de referencia...';
        raise_application_error(-20999, p_resultado || ' ' || SQLERRM);
    END;
    DECLARE
      l_current_date DATE := current_date;
    BEGIN
      INSERT INTO sc_sol_confirmacion
        (nro_soli,
         nro_confirmacion,
         nro_referencia,
         instancia,
         origen,
         nro_sol,
         fec_fin_proc,
         usr_proc,
         estado_confirmacion,
         asignado_por,
         fec_asignado_por,
         tipo_asig,
         cod_sucursal,
         prioridad,
         fec_alta,
         usr_alta,
         fec_proc,
         es_empleado_alex,
         nro_confirmacion_p,
         nivel,
         viable_asig_auto,
         pend_fin_tarea,
         fec_cola)
      VALUES
        (p_nro_soli,
         v_nro_confirmacion,
         v_nro_referencia,
         'ANA',
         v_p_origen,
         v_nro_sol,
         NULL,
         v_usr_proc,
         'PEND',
         v_asignado_por,
         v_fec_asignado_por,
         v_tipo_asig,
         v_cod_sucursal,
         v_prioridad,
         l_current_date,
         v_p_login,
         NULL,
         v_es_empleado_alex,
         0,
         0,
         v_viable_asig_auto,
         0,
         l_current_date);
    EXCEPTION
      WHEN OTHERS THEN
        p_cod_resultado := 101;
        p_resultado     := p_resultado ||
                           'Error al insertar confirmaci?n...';
        raise_application_error(-20999, p_resultado || ' ' || SQLERRM);
    END;
    IF v_en_cola = 1 AND v_viable_asig_auto = 1 THEN
      v_event_text := 'cod_sucursal=' || v_cod_sucursal || ' ' ||
                      'nro_soli=' || p_nro_soli || ' ' ||
                      'nro_confirmacion=' || v_nro_confirmacion;
    END IF;
  END pr_bandeja_analista;

  /**
  * procedimiento para confirmar solicitudes
  * author  : hector segovia
  * created : 09/10/2024
  **/

  PROCEDURE pr_app_confirm_proc(p_login            IN sc_sol_confirmacion.usr_proc%TYPE DEFAULT ' ',
                                p_nro_soli         IN sc.nro_soli%TYPE DEFAULT 0,
                                p_nro_confirmacion IN sc_sol_confirmacion.nro_confirmacion%TYPE DEFAULT 0,
                                p_cod_resultado    IN OUT NUMBER,
                                p_resultado        IN OUT VARCHAR2)

   IS
    v_count_confirm       NUMBER := 0;
    v_estado_confirmacion sc_sol_confirmacion.estado_confirmacion%TYPE := ' ';
    v_usr_proc            VARCHAR2(8) := ' ';
    v_instancia           sc_sol_confirmacion.instancia%TYPE := ' ';
    v_origen              sc_sol_confirmacion.origen%TYPE := ' ';
    v_estado_soli         sc.estado_soli%TYPE := ' ';
    v_usr_ana             sc.usr_ana%TYPE := ' ';
    v_referencia_pend     NUMBER := 0;
    v_observacion         sc_seguimiento.observacion%TYPE := ' ';
    v_estado_soli_aut     sc.estado_soli_aut%TYPE := 0;
    v_estado_scoring      VARCHAR2(4) := ' ';
    v_insitu_pend         NUMBER := 0;
    v_fec_fin_proc        DATE := NULL;
    v_usr_cancelacion     VARCHAR2(8) := ' ';
    v_fec_cancelacion     DATE := NULL;
    v_sql_rowcount        NUMBER;
  BEGIN
    p_resultado := 'dbp:app_confirm_proc. ';
    BEGIN
      SELECT estado_soli, usr_ana, estado_soli_aut
        INTO v_estado_soli, v_usr_ana, v_estado_soli_aut
        FROM sc
       WHERE nro_soli = p_nro_soli;
    EXCEPTION
      WHEN no_data_found THEN
        NULL;
      WHEN OTHERS THEN
        ROLLBACK;
        p_cod_resultado := 101;
        p_resultado     := p_resultado ||
                           'Error al seleccionar estado de la solicitud...';
        raise_application_error(-20999, p_resultado || ' ' || SQLERRM);
    END;
    BEGIN
      SELECT estado_confirmacion,
             usr_proc,
             instancia,
             origen,
             fec_fin_proc,
             usr_cancelacion,
             fec_cancelacion
        INTO v_estado_confirmacion,
             v_usr_proc,
             v_instancia,
             v_origen,
             v_fec_fin_proc,
             v_usr_cancelacion,
             v_fec_cancelacion
        FROM sc_sol_confirmacion
       WHERE nro_soli = p_nro_soli
         AND nro_confirmacion = p_nro_confirmacion;
      v_usr_proc        := nvl(v_usr_proc, '');
      v_fec_fin_proc    := nvl(v_fec_fin_proc, '');
      v_usr_cancelacion := nvl(v_usr_cancelacion, '');
      v_fec_cancelacion := nvl(v_fec_cancelacion, '');
    EXCEPTION
      WHEN no_data_found THEN
        ROLLBACK;
        p_cod_resultado := 101;
        p_resultado     := p_resultado || 'No existe el registro. ' ||
                           'Nro.Soli: ' || p_nro_soli || 'Nro.Confirm.: ' ||
                           p_nro_confirmacion;
        RETURN;
      WHEN OTHERS THEN
        ROLLBACK;
        p_cod_resultado := 101;
        p_resultado     := p_resultado ||
                           'Error al seleccionar confirmaci?n...';
        RETURN;
    END;
    IF v_estado_confirmacion != 'PEND' THEN
      ROLLBACK;
      p_cod_resultado := 101;
      IF v_estado_confirmacion = 'PROC' THEN
        p_resultado := p_resultado || 'Esta tarea ya fue procesada por ' ||
                       v_usr_proc || ' en fecha ' || v_fec_fin_proc;
      ELSIF v_estado_confirmacion = 'CANC' THEN
        p_resultado := p_resultado || 'Esta tarea fue cancelada por ' ||
                       v_usr_cancelacion || ' en fecha ' ||
                       v_fec_cancelacion;
      ELSE
        p_resultado := p_resultado ||
                       'La tarea debe estar en estado PEND...' ||
                       'Estado.Actual..: ' || v_estado_confirmacion;
      END IF;
      p_resultado := p_resultado || ' ' || 'Nro.Soli: ' || p_nro_soli ||
                     'Nro.Confirm.: ' || p_nro_confirmacion;
      RETURN;
    ELSIF (v_usr_proc != '' AND v_usr_proc != p_login) THEN
      ROLLBACK;
      p_cod_resultado := 101;
      p_resultado     := p_resultado ||
                         'Esta confirmaci?n ya fue asignado a otro usuario...';
      RETURN;
    ELSIF v_usr_proc = ' ' THEN
      DECLARE
        l_current_date DATE := current_date;
      BEGIN
        UPDATE sc_sol_confirmacion
           SET usr_proc = p_login, fec_proc = l_current_date
         WHERE nro_soli = p_nro_soli
           AND nro_confirmacion = p_nro_confirmacion;
        IF SQL%ROWCOUNT <= 0 THEN
          RAISE no_data_found;
        END IF;
      EXCEPTION
        WHEN no_data_found THEN
          ROLLBACK;
          p_cod_resultado := 101;
          p_resultado     := p_resultado || 'No existe el registro. ' ||
                             'Nro.Soli: ' || p_nro_soli || 'Nro.Confirm.: ' ||
                             p_nro_confirmacion;
          RETURN;
        WHEN OTHERS THEN
          ROLLBACK;
          p_cod_resultado := 101;
          p_resultado     := p_resultado ||
                             'Error al seleccionar confirmaci?n...';
          raise_application_error(-20999, p_resultado || ' ' || SQLERRM);
      END;
    END IF;
    DECLARE
      l_current_date DATE := current_date;
    BEGIN
      UPDATE sc_sol_confirmacion
         SET estado_confirmacion = 'PROC',
             usr_fin_proc        = p_login,
             fec_fin_proc        = l_current_date,
             row_version         = row_version + 1
       WHERE nro_soli = p_nro_soli
         AND nro_confirmacion = p_nro_confirmacion;
      IF SQL%ROWCOUNT <= 0 THEN
        RAISE no_data_found;
      END IF;
    EXCEPTION
      WHEN no_data_found THEN
        ROLLBACK;
        p_cod_resultado := 101;
        p_resultado     := p_resultado ||
                           'No se actualiz? el registro al es ' ||
                           'Nro.Soli: ' || p_nro_soli || 'Nro.Confirm.: ' ||
                           p_nro_confirmacion;
        RETURN;
      WHEN OTHERS THEN
        ROLLBACK;
        p_resultado := p_resultado ||
                       'Error al actualizar usuario asignaci?n..';
        raise_application_error(-20999, p_resultado || ' ' || SQLERRM);
    END;
    IF v_instancia = 'INSI' THEN
      DECLARE
        l_current_date DATE := current_date;
      BEGIN
        UPDATE sc_sol_confirmacion_telefonica
           SET estado_confirmacion = 'PROC',
               usr_confirmacion    = p_login,
               fec_confirmacion    = l_current_date
         WHERE nro_soli = p_nro_soli
           AND nro_confirmacion = p_nro_confirmacion;
        IF SQL%ROWCOUNT <= 0 THEN
          RAISE no_data_found;
        END IF;
      EXCEPTION
        WHEN no_data_found THEN
          ROLLBACK;
          p_cod_resultado := 101;
          p_resultado     := p_resultado ||
                             'No se actualiz? el registro al estado PROC. ' ||
                             'Nro.Soli: ' || p_nro_soli || 'Nro.Confirm.: ' ||
                             p_nro_confirmacion;
          raise_application_error(-20999, p_resultado || ' ' || SQLERRM);
        WHEN OTHERS THEN
          ROLLBACK;
          p_resultado := p_resultado ||
                         'Error al seleccionar confirmaci?n...';
          raise_application_error(-20999, p_resultado || ' ' || SQLERRM);
      END;
      BEGIN
        SELECT COUNT(*)
          INTO v_insitu_pend
          FROM sc_sol_confirmacion
         WHERE nro_soli = p_nro_soli
           AND instancia = 'INSI'
           AND estado_confirmacion = 'PEND';
      EXCEPTION
        WHEN no_data_found THEN
          NULL;
        WHEN OTHERS THEN
          ROLLBACK;
          p_resultado := p_resultado ||
                         'Error al seleccionar insitus pendientes...';
          raise_application_error(-20999, p_resultado || ' ' || SQLERRM);
      END;
      IF v_insitu_pend = 0 THEN
        IF v_origen = 'PDC' AND v_estado_soli_aut = 1 AND
           v_estado_soli = 'APRO' THEN
          BEGIN
            SELECT COUNT(*)
              INTO v_referencia_pend
              FROM sc_sol_confirmacion
             WHERE nro_soli = p_nro_soli
               AND instancia = 'REFE'
               AND estado_confirmacion = 'PEND';
          EXCEPTION
            WHEN no_data_found THEN
              NULL;
            WHEN OTHERS THEN
              ROLLBACK;
              p_resultado := p_resultado ||
                             'Error al seleccionar tareas refe pendientes...';
              raise_application_error(-20999,
                                      p_resultado || ' ' || SQLERRM);
          END;
          IF v_referencia_pend = 0 THEN
            BEGIN
              UPDATE sc_pdc
                 SET puede_facturar = 'PL'
               WHERE nro_soli = p_nro_soli;
            EXCEPTION
              WHEN OTHERS THEN
                ROLLBACK;
                p_resultado := p_resultado || 'Error al actualizar PL';
                raise_application_error(-20999,
                                        p_resultado || ' ' || SQLERRM);
            END;
          END IF;
        ELSE
          DECLARE
            l_current_date DATE := current_date;
          BEGIN
            UPDATE sc
               SET estado_soli = 'ANA',
                   fec_ult_act = l_current_date,
                   usr_ult_act = p_login
             WHERE nro_soli = p_nro_soli
               AND (estado_soli = 'INSI' OR estado_soli = 'ANA');
            IF SQL%ROWCOUNT <= 0 THEN
              RAISE no_data_found;
            END IF;
          EXCEPTION
            WHEN no_data_found THEN
              ROLLBACK;
              p_cod_resultado := 101;
              p_resultado     := p_resultado ||
                                 'No se pudo pasar al estado ANA la solicitud...' ||
                                 'Nro.Soli: ' || p_nro_soli ||
                                 'Nro.Confirm.: ' || p_nro_confirmacion;
              RETURN;
            WHEN OTHERS THEN
              ROLLBACK;
              p_resultado := p_resultado ||
                             'Error al actualizar estado solicitud a ANA...';
              raise_application_error(-20999,
                                      p_resultado || ' ' || SQLERRM);
          END;
          v_observacion := 'FIN CARGA INSITU DESDE APP';
          DECLARE
            l_current_date DATE := current_date;
          BEGIN
            INSERT INTO sc_seguimiento
              (nro_soli,
               fec_mov,
               estado_soli,
               tiempo,
               observacion,
               fec_ult_act,
               usr_ult_act)
            VALUES
              (p_nro_soli,
               l_current_date,
               'ANA',
               '0 00:00:00',
               v_observacion,
               l_current_date,
               p_login);
          EXCEPTION
            WHEN OTHERS THEN
              ROLLBACK;
              p_resultado := p_resultado ||
                             'Error al insertar seguimiento...';
              raise_application_error(-20999,
                                      p_resultado || ' ' || SQLERRM);
          END;

          pr_bandeja_analista(p_nro_soli      => p_nro_soli,
                              p_login         => p_login,
                              p_cod_resultado => p_cod_resultado,
                              p_resultado     => p_resultado);
          IF p_cod_resultado != 0 THEN
            RETURN;
          END IF;
        END IF;
      END IF;
    END IF;
    p_cod_resultado := 100;
    p_resultado     := 'Actualizaci?n exitosa...';
  END pr_app_confirm_proc;

  /**
  * procedimiento para crear in situ
  * author  : hector segovia
  * created : 15/10/2024
  **/


  PROCEDURE pr_app_crea_insitu(p_programa                 IN VARCHAR2 DEFAULT ' ',
                               p_cod_resultado            IN OUT NUMBER,
                               p_resultado                IN OUT VARCHAR2,
                               p_login                    IN sc_insitu.usr_alta%TYPE DEFAULT ' ',
                               p_serial_instal            IN app_sinc_sc_insitu.serial_instal%TYPE DEFAULT 0,
                               p_id_row_device            IN app_sinc_sc_insitu.id_row_device%TYPE DEFAULT 0,
                               p_nro_soli                 IN sc_insitu.nro_soli%TYPE DEFAULT 0,
                               p_nro_sol                  IN sc_insitu.nro_sol%TYPE DEFAULT 0,
                               p_nro_item_trabajo         IN sc_insitu.nro_item_trabajo%TYPE DEFAULT 0,
                               p_depend_indep_agrogan     IN sc_insitu.depend_indep_agrogan%TYPE DEFAULT ' ',
                               p_nombre                   IN sc_insitu.nombre%TYPE DEFAULT ' ',
                               p_apellido                 IN sc_insitu.apellido%TYPE DEFAULT ' ',
                               p_direccion_laboral        IN sc_insitu.direccion_laboral%TYPE DEFAULT ' ',
                               p_tipo_local               IN sc_insitu.tipo_local%TYPE DEFAULT ' ',
                               p_paga_patente             IN sc_insitu.paga_patente%TYPE DEFAULT ' ',
                               p_fecha_confirmacion       IN sc_insitu.fecha_confirmacion%TYPE DEFAULT NULL,
                               p_estado_civil             IN sc_insitu.estado_civil%TYPE DEFAULT ' ',
                               p_hijos                    IN sc_insitu.hijos%TYPE DEFAULT 0,
                               p_menores                  IN sc_insitu.menores%TYPE DEFAULT 0,
                               p_nombre_conyuge           IN sc_insitu.nombre_conyuge%TYPE DEFAULT ' ',
                               p_trabajo_conyuge          IN sc_insitu.trabajo_conyuge%TYPE DEFAULT ' ',
                               p_comentario               IN sc_insitu.comentario%TYPE DEFAULT ' ',
                               p_datos_proporcionados_por IN sc_insitu.datos_proporcionados_por%TYPE DEFAULT ' ',
                               p_nro_confirmacion         IN NUMBER DEFAULT 0,
                               p_croquis_hablado          IN sc_insitu.croquis_hablado%TYPE DEFAULT ' ',
                               p_visitador_aprueba        IN sc_insitu.visitador_aprueba%TYPE DEFAULT ' ',
                               p_visitador_comentario     IN sc_insitu.visitador_comentario%TYPE DEFAULT ' ')

   IS
    v_ya_existe    NUMBER := 0;
    v_success      NUMBER := 0;
    v_p_programa   VARCHAR2(500);
    v_p_nro_soli   sc_insitu.nro_soli%TYPE;
    v_sql_rowcount NUMBER := 0;
  BEGIN

    v_p_nro_soli := p_nro_soli;
    v_p_programa := p_programa;
    v_p_programa := v_p_programa || 'app_crea_insitu.->';
    v_ya_existe  := 500;
    v_success    := 100;
    IF p_comentario IS NULL OR p_comentario = ' ' THEN
      p_cod_resultado := 1;
      p_resultado     := 'No puede dejar el/los comentarios vac?os.';
      raise_application_error(-20999, p_resultado || ' ' || SQLERRM);
    END IF;
    BEGIN
      v_sql_rowcount := 0;
      SELECT nro_soli
        INTO v_p_nro_soli
        FROM sc_insitu
       WHERE nro_soli = v_p_nro_soli
         AND nro_sol = p_nro_sol
         AND nro_item_trabajo = p_nro_item_trabajo;
      v_sql_rowcount := SQL%ROWCOUNT;
    EXCEPTION
      WHEN no_data_found THEN
        NULL;
      WHEN OTHERS THEN
        p_cod_resultado := 1;
        p_resultado     := v_p_programa ||
                           'Error al verificar si ya existe insitu.';
        raise_application_error(-20999, p_resultado || ' ' || SQLERRM);
    END;

    IF v_sql_rowcount <= 0 THEN
      DECLARE
        l_current_date DATE := to_date(current_date, 'dd/mm/yyyy');
      BEGIN

        INSERT INTO sc_insitu
          (nro_soli,
           nro_sol,
           nro_item_trabajo,
           depend_indep_agrogan,
           nombre,
           apellido,
           direccion_laboral,
           tipo_local,
           paga_patente,
           fecha_confirmacion,
           estado_civil,
           hijos,
           menores,
           nombre_conyuge,
           trabajo_conyuge,
           comentario,
           datos_proporcionados_por,
           croquis_hablado,
           usr_alta,
           fec_alta,
           fec_ult_act,
           usr_ult_act,
           visitador_aprueba,
           visitador_comentario)
        VALUES
          (v_p_nro_soli,
           p_nro_sol,
           p_nro_item_trabajo,
           p_depend_indep_agrogan,
           p_nombre,
           p_apellido,
           p_direccion_laboral,
           p_tipo_local,
           p_paga_patente,
           p_fecha_confirmacion,
           p_estado_civil,
           p_hijos,
           p_menores,
           p_nombre_conyuge,
           p_trabajo_conyuge,
           p_comentario,
           p_datos_proporcionados_por,
           p_croquis_hablado,
           p_login,
           l_current_date,
           l_current_date,
           p_login,
           p_visitador_aprueba,
           p_visitador_comentario);
      EXCEPTION
        WHEN OTHERS THEN
          p_cod_resultado := 1;
          p_resultado     := v_p_programa ||
                             'Error al insertar en sc_insituuuu.';
          raise_application_error(-20999, p_resultado || ' ' || SQLERRM);
      END;

      DECLARE
        l_current_date DATE := current_date;
      BEGIN
        INSERT INTO app_sinc_sc_insitu
          (login,
           serial_instal,
           nro_soli,
           nro_sol,
           nro_item_trabajo,
           id_row_device,
           ingrid_row_version,
           app_row_version,
           sincronizado,
           fec_sincronizado,
           fec_alta)
        VALUES
          (p_login,
           p_serial_instal,
           v_p_nro_soli,
           p_nro_sol,
           p_nro_item_trabajo,
           p_id_row_device,
           1,
           1,
           0,
           NULL,
           l_current_date);
      EXCEPTION
        WHEN OTHERS THEN
          p_cod_resultado := 1;
          p_resultado     := v_p_programa ||
                             'Error al insertar en tabla de sincro.';
          raise_application_error(-20999, p_resultado || ' ' || SQLERRM);
      END;
    ELSE
      DECLARE
        l_current_date DATE := current_date;
      BEGIN
        UPDATE sc_insitu
           SET depend_indep_agrogan     = p_depend_indep_agrogan,
               nombre                   = p_nombre,
               apellido                 = p_apellido,
               direccion_laboral        = p_direccion_laboral,
               tipo_local               = p_tipo_local,
               paga_patente             = p_paga_patente,
               fecha_confirmacion       = p_fecha_confirmacion,
               estado_civil             = p_estado_civil,
               hijos                    = p_hijos,
               menores                  = p_menores,
               nombre_conyuge           = p_nombre_conyuge,
               trabajo_conyuge          = p_trabajo_conyuge,
               comentario               = p_comentario,
               datos_proporcionados_por = p_datos_proporcionados_por,
               croquis_hablado          = p_croquis_hablado,
               fec_ult_act              = l_current_date,
               usr_ult_act              = p_login
         WHERE nro_soli = v_p_nro_soli
           AND nro_sol = p_nro_sol
           AND nro_item_trabajo = p_nro_item_trabajo;
        IF SQL%ROWCOUNT <= 0 THEN
          RAISE no_data_found;
        END IF;
      EXCEPTION
        WHEN no_data_found THEN
          p_cod_resultado := 1;
          p_resultado     := v_p_programa ||
                             'No se pudo actualizar insitu.';
          raise_application_error(-20999, p_resultado || ' ' || SQLERRM);
        WHEN OTHERS THEN
          p_cod_resultado := 1;
          p_resultado     := v_p_programa || 'Error al actualizar insitu.';
          raise_application_error(-20999, p_resultado || ' ' || SQLERRM);
      END;
    END IF;

    BEGIN

      pr_app_confirm_proc(p_login            => p_login,
                          p_nro_soli         => v_p_nro_soli,
                          p_nro_confirmacion => p_nro_confirmacion,
                          p_cod_resultado    => p_cod_resultado,
                          p_resultado        => p_resultado);
    EXCEPTION
      WHEN OTHERS THEN
        raise_application_error(-20999,
                                'Error al invocar el procedimiento app_confirm_proc' || ' ' ||
                                SQLERRM);

    END;
    IF p_cod_resultado != v_success THEN
      p_resultado := v_p_programa || p_resultado;
      RETURN;
    END IF;
    p_cod_resultado := v_success;
    p_resultado     := v_p_programa || 'OK';
  END pr_app_crea_insitu;

  /**
  * procedimiento para crear in situ dependientes.
  * author  : hector segovia
  * created : 15/10/2024
  **/
  PROCEDURE pr_app_crea_insitu_depe(p_login                    IN sc_insitu_dependiente.usr_ult_act%TYPE DEFAULT ' ',
                                    p_serial_instal            IN NUMBER DEFAULT 0,
                                    p_id_row_device            IN NUMBER DEFAULT 0,
                                    p_nro_soli                 IN sc_insitu_dependiente.nro_soli%TYPE DEFAULT 0,
                                    p_nro_sol                  IN sc_insitu_dependiente.nro_sol%TYPE DEFAULT 0,
                                    p_nro_item_trabajo         IN sc_insitu_dependiente.nro_item_trabajo%TYPE DEFAULT 0,
                                    p_depend_indep_agrogan     IN VARCHAR2 DEFAULT ' ',
                                    p_nombre                   IN VARCHAR2 DEFAULT ' ',
                                    p_apellido                 IN VARCHAR2 DEFAULT ' ',
                                    p_direccion_laboral        IN VARCHAR2 DEFAULT ' ',
                                    p_tipo_local               IN VARCHAR2 DEFAULT ' ',
                                    p_paga_patente             IN VARCHAR2 DEFAULT ' ',
                                    p_fecha_confirmacion       IN DATE DEFAULT NULL,
                                    p_estado_civil             IN VARCHAR2 DEFAULT ' ',
                                    p_hijos                    IN NUMBER DEFAULT 0,
                                    p_menores                  IN NUMBER DEFAULT 0,
                                    p_nombre_conyuge           IN VARCHAR2 DEFAULT ' ',
                                    p_trabajo_conyuge          IN VARCHAR2 DEFAULT ' ',
                                    p_comentario               IN sc_insitu_dependiente.comentario%TYPE DEFAULT ' ',
                                    p_datos_proporcionados_por IN VARCHAR2 DEFAULT ' ',
                                    p_empresa                  IN sc_insitu_dependiente.empresa%TYPE DEFAULT ' ',
                                    p_antiguedad_anos          IN NUMBER DEFAULT 0,
                                    p_antiguedad_meses         IN NUMBER DEFAULT 0,
                                    p_cargo                    IN sc_insitu_dependiente.cargo%TYPE DEFAULT ' ',
                                    p_salario_mensual          IN sc_insitu_dependiente.salario_mensual%TYPE DEFAULT 0,
                                    p_salario_semanal          IN sc_insitu_dependiente.salario_semanal%TYPE DEFAULT 0,
                                    p_comision                 IN sc_insitu_dependiente.comision%TYPE DEFAULT 0,
                                    p_rubro_empresa            IN sc_insitu_dependiente.rubro_empresa%TYPE DEFAULT ' ',
                                    p_cantidad_funcionario     IN sc_insitu_dependiente.cantidad_funcionario%TYPE DEFAULT 0,
                                    p_cantidad_sucursal        IN sc_insitu_dependiente.cantidad_sucursal%TYPE DEFAULT 0,
                                    p_comentario_depe          IN sc_insitu_dependiente.comentario%TYPE DEFAULT ' ',
                                    p_nro_confirmacion         IN NUMBER DEFAULT 0,
                                    p_croquis_hablado          IN VARCHAR2 DEFAULT ' ',
                                    p_visitador_aprueba        IN VARCHAR2 DEFAULT ' ',
                                    p_visitador_comentario     IN VARCHAR2 DEFAULT ' ')

   IS
    v_programa             VARCHAR2(30) := ' ';
    v_cod_resultado        NUMBER := 0;
    v_resultado            VARCHAR2(256) := ' ';
    v_success              NUMBER := 0;
    v_ya_existe            NUMBER := 0;
    v_antiguedad           sc_insitu_dependiente.antiguedad%TYPE;
    v_str_antiguedad_anos  NUMBER := 0;
    v_str_antiguedad_meses NUMBER := 0;
    v_p_nro_soli           NUMBER;
    v_sql_rowcount         NUMBER;
    iierrornumber          NUMBER;
  BEGIN

    v_p_nro_soli := p_nro_soli;
    v_programa   := 'app_crea_insitu_depe.->';
    v_success    := 100;
    v_ya_existe  := 500;

    v_str_antiguedad_anos := p_antiguedad_anos;

    v_str_antiguedad_meses := p_antiguedad_meses;
   v_antiguedad :=  ADD_MONTHS(TRUNC(SYSDATE, 'MM'), -(v_str_antiguedad_anos * 12 + v_str_antiguedad_meses )); 
   
   /* v_antiguedad := trunc(current_date, 'dd') -
                    nvl(v_str_antiguedad_anos, 0) -
                    nvl(v_str_antiguedad_meses, 0);*/

    BEGIN
      pr_app_crea_insitu(p_programa                 => v_programa,
                         p_cod_resultado            => v_cod_resultado,
                         p_resultado                => v_resultado,
                         p_login                    => p_login,
                         p_serial_instal            => p_serial_instal,
                         p_id_row_device            => p_id_row_device,
                         p_nro_soli                 => v_p_nro_soli,
                         p_nro_sol                  => p_nro_sol,
                         p_nro_item_trabajo         => p_nro_item_trabajo,
                         p_depend_indep_agrogan     => p_depend_indep_agrogan,
                         p_nombre                   => p_nombre,
                         p_apellido                 => p_apellido,
                         p_direccion_laboral        => p_direccion_laboral,
                         p_tipo_local               => p_tipo_local,
                         p_paga_patente             => p_paga_patente,
                         p_fecha_confirmacion       => p_fecha_confirmacion,
                         p_estado_civil             => p_estado_civil,
                         p_hijos                    => p_hijos,
                         p_menores                  => p_menores,
                         p_nombre_conyuge           => p_nombre_conyuge,
                         p_trabajo_conyuge          => p_trabajo_conyuge,
                         p_comentario               => p_comentario,
                         p_datos_proporcionados_por => p_datos_proporcionados_por,
                         p_nro_confirmacion         => p_nro_confirmacion,
                         p_croquis_hablado          => p_croquis_hablado,
                         p_visitador_aprueba        => p_visitador_aprueba,
                         p_visitador_comentario     => p_visitador_comentario);
    EXCEPTION
      WHEN OTHERS THEN
        raise_application_error(-20999,
                                'Error al invocar el procedimiento app_crea_insitu' || ' ' ||
                                SQLERRM);

    END;

    IF iierrornumber != 0 THEN
      ROLLBACK;
      v_resultado := v_programa || 'Error al crear insitu.';
      raise_application_error(-20999, v_resultado || ' ' || SQLERRM);
    ELSIF v_cod_resultado != v_success AND v_cod_resultado != v_ya_existe THEN
      ROLLBACK;
      raise_application_error(-20999, v_resultado || ' ' || SQLERRM);
    END IF;
    IF v_cod_resultado = v_ya_existe THEN
      v_cod_resultado := v_ya_existe;
      v_resultado     := 'El insitu ya fu? creado...';
      RETURN;
    END IF;
    BEGIN
      v_sql_rowcount := 0;
      /*line:140003*/
      SELECT a.nro_soli
        INTO v_p_nro_soli
        FROM sc_insitu_dependiente a
       WHERE a.nro_soli = v_p_nro_soli
         AND a.nro_sol = p_nro_sol
         AND a.nro_item_trabajo = p_nro_item_trabajo;
      v_sql_rowcount := SQL%ROWCOUNT;
    EXCEPTION
      WHEN no_data_found THEN
        NULL;
      WHEN OTHERS THEN
        ROLLBACK;
        v_resultado := v_programa ||
                       'Error al verificar si ya existe insitu depe.';
        raise_application_error(-20999, v_resultado || ' ' || SQLERRM);
    END;
    IF v_sql_rowcount <= 0 THEN
      DECLARE
        l_current_date DATE := current_date;
      BEGIN
        /*line:140004*/
        INSERT INTO sc_insitu_dependiente
          (nro_soli,
           nro_sol,
           nro_item_trabajo,
           empresa,
           antiguedad,
           cargo,
           salario_mensual,
           salario_semanal,
           comision,
           rubro_empresa,
           antiguedad_empresa,
           cantidad_funcionario,
           cantidad_sucursal,
           comentario,
           fec_ult_act,
           usr_ult_act)
        VALUES
          (v_p_nro_soli,
           p_nro_sol,
           p_nro_item_trabajo,
           p_empresa,
           v_antiguedad,
           p_cargo,
           p_salario_mensual,
           p_salario_semanal,
           p_comision,
           p_rubro_empresa,
           v_antiguedad,
           p_cantidad_funcionario,
           p_cantidad_sucursal,
           p_comentario_depe,
           l_current_date,
           p_login);
      EXCEPTION
        WHEN OTHERS THEN
          ROLLBACK;
          v_resultado := v_programa ||
                         'Error al insertar en sc_insitu_dependiente.';
          raise_application_error(-20999, v_resultado || ' ' || SQLERRM);
      END;
    ELSE
      DECLARE
        l_current_date DATE := current_date;
      BEGIN
        /*line:140006*/
        UPDATE sc_insitu_dependiente
           SET empresa              = p_empresa,
               antiguedad           = v_antiguedad,
               cargo                = p_cargo,
               salario_mensual      = p_salario_mensual,
               salario_semanal      = p_salario_semanal,
               comision             = p_comision,
               rubro_empresa        = p_rubro_empresa,
               antiguedad_empresa   = v_antiguedad,
               cantidad_funcionario = p_cantidad_funcionario,
               cantidad_sucursal    = p_cantidad_sucursal,
               comentario           = p_comentario,
               fec_ult_act          = l_current_date,
               usr_ult_act          = p_login
         WHERE nro_soli = v_p_nro_soli
           AND nro_sol = p_nro_sol
           AND nro_item_trabajo = p_nro_item_trabajo;
        IF SQL%ROWCOUNT <= 0 THEN
          RAISE no_data_found;
        END IF;
      EXCEPTION
        WHEN no_data_found THEN
          ROLLBACK;
          v_resultado := v_programa || 'No se pudo actualizar insitu depe.';
          raise_application_error(-20999, v_resultado || ' ' || SQLERRM);
        WHEN OTHERS THEN
          ROLLBACK;
          v_resultado := v_programa || 'Error al actualizar insitu depe.';
          raise_application_error(-20999, v_resultado || ' ' || SQLERRM);
      END;
    END IF;
    v_cod_resultado := 100;
    v_resultado     := v_programa || 'OK';
  END pr_app_crea_insitu_depe;

  /**
  * procedimiento para llamar a los procedimientos de in situ dependiente
  * author  : hector segovia
  * created : 16/10/2024
  **/
  PROCEDURE pr_guarda_proceso_depe(p_nro_soli         IN NUMBER,
                                   p_nro_sol          IN NUMBER,
                                   p_nombre           IN VARCHAR2,
                                   p_apellido         IN VARCHAR2,
                                   p_nro_confirmacion IN NUMBER,
                                   p_nro_item_trabajo IN NUMBER) IS

    v_login                    sc_insitu_dependiente.usr_ult_act%TYPE := fn_user;
    v_serial_instal            NUMBER := 0;
    v_id_row_device            NUMBER := 0;
    v_nro_item_trabajo         NUMBER := p_nro_item_trabajo;
    v_depend_indep_agrogan     VARCHAR2(50) := 'DEPE';
    v_direccion_laboral        VARCHAR2(300);
    v_tipo_local               VARCHAR2(50) := ' ';
    v_paga_patente             VARCHAR2(50) := ' ';
    v_fecha_confirmacion       DATE := to_date(current_date, 'dd/mm/yyyy');
    v_estado_civil             VARCHAR2(50);
    v_hijos                    NUMBER;
    v_menores                  NUMBER;
    v_nombre_conyuge           VARCHAR2(100) := ' ';
    v_trabajo_conyuge          VARCHAR2(100) := ' ';
    v_comentario               VARCHAR2(500);
    v_datos_proporcionados_por VARCHAR2(100) := ' ';
    v_empresa                  sc_insitu_dependiente.empresa%TYPE;
    v_antiguedad_anos          NUMBER;
    v_antiguedad_meses         NUMBER;
    v_cargo                    sc_insitu_dependiente.cargo%TYPE;
    v_salario_mensual          sc_insitu_dependiente.salario_mensual%TYPE := 0;
    v_cobro_salario            sc_insitu_dependiente.salario_semanal%TYPE := 0;
    v_comision                 sc_insitu_dependiente.comision%TYPE := 0;
    v_rubro_empresa            sc_insitu_dependiente.rubro_empresa%TYPE := ' ';
    v_cantidad_funcionario     sc_insitu_dependiente.cantidad_funcionario%TYPE := 0;
    v_cantidad_sucursal        sc_insitu_dependiente.cantidad_sucursal%TYPE := 0;
    v_nro_confirmacion         NUMBER := p_nro_confirmacion;
    v_croquis_hablado          VARCHAR2(500) := ' ';
    v_visitador_aprueba        VARCHAR2(500) := ' ';
    v_visitador_comentario     VARCHAR2(500) := ' ';
    v_nro_sol                  NUMBER;
    v_ocupacion                VARCHAR2(200);
    v_tiene_ips                VARCHAR2(5);
  BEGIN

    BEGIN
      SELECT c001 empresa,
             c002 cargo_ocupa,
             to_number(c003) antiguedad,
             to_number(c004) antiguedad_meses,
             c005 direccion_laboral,
             c006 croquis_hablado,
             to_number(c007) nro_soli
        INTO v_empresa,
             v_cargo,
             v_antiguedad_anos,
             v_antiguedad_meses,
             v_direccion_laboral,
             v_croquis_hablado,
             v_nro_sol
        FROM apex_collections
       WHERE collection_name = 'TMP_ACTIVIDAD';

    END;

    BEGIN
      SELECT c001 estado_civil,
             to_number(c002) cantidad_hijos,
             to_number(c003) cantidad_hijos_menores,
             c004 ocupacion
        INTO v_estado_civil, v_hijos, v_menores, v_ocupacion
        FROM apex_collections
       WHERE collection_name = 'TMP_SOLICITANTE';

    END;

    BEGIN
      SELECT to_number(c001) cobro_salario,
             to_number(c002) salario,
             to_number(c003) comision_mensual,
             c004 tiene_ips,
             c005 comentario
        INTO v_cobro_salario,
             v_salario_mensual,
             v_comision,
             v_tiene_ips,
             v_comentario
        FROM apex_collections
       WHERE collection_name = 'TMP_INGRESOS';

    END;

    pkg_insitu.pr_app_crea_insitu_depe(p_login                    => v_login,
                                       p_serial_instal            => v_serial_instal,
                                       p_id_row_device            => v_id_row_device,
                                       p_nro_soli                 => p_nro_soli,
                                       p_nro_sol                  => p_nro_sol,
                                       p_nro_item_trabajo         => v_nro_item_trabajo,
                                       p_depend_indep_agrogan     => v_depend_indep_agrogan,
                                       p_nombre                   => p_nombre,
                                       p_apellido                 => p_apellido,
                                       p_direccion_laboral        => v_direccion_laboral,
                                       p_tipo_local               => v_tipo_local,
                                       p_paga_patente             => v_paga_patente,
                                       p_fecha_confirmacion       => v_fecha_confirmacion,
                                       p_estado_civil             => v_estado_civil,
                                       p_hijos                    => v_hijos,
                                       p_menores                  => v_menores,
                                       p_nombre_conyuge           => v_nombre_conyuge,
                                       p_trabajo_conyuge          => v_trabajo_conyuge,
                                       p_comentario               => v_comentario,
                                       p_datos_proporcionados_por => v_datos_proporcionados_por,
                                       p_empresa                  => v_empresa,
                                       p_antiguedad_anos          => v_antiguedad_anos,
                                       p_antiguedad_meses         => v_antiguedad_meses,
                                       p_cargo                    => v_cargo,
                                       p_salario_mensual          => v_salario_mensual,
                                       p_salario_semanal          => v_cobro_salario,
                                       p_comision                 => v_comision,
                                       p_rubro_empresa            => v_rubro_empresa,
                                       p_cantidad_funcionario     => v_cantidad_funcionario,
                                       p_cantidad_sucursal        => v_cantidad_sucursal,
                                       p_comentario_depe          => v_comentario,
                                       p_nro_confirmacion         => v_nro_confirmacion,
                                       p_croquis_hablado          => v_croquis_hablado,
                                       p_visitador_aprueba        => v_visitador_aprueba,
                                       p_visitador_comentario     => v_visitador_comentario);
  END;




/**
  * procedimiento para cargar articulos de inventarios
  * author  : hector segovia
  * created : 10/10/2024
  **/
  PROCEDURE pr_cargar_articulos_inventarios IS
    v_descrip  VARCHAR2(600);
    v_articulo VARCHAR2(600);

  BEGIN

    apex_collection.create_or_truncate_collection(p_collection_name => 'ARTICULOS');

    BEGIN
      FOR i IN (SELECT cod_articulo,
                       descripcion,
                       descripcion descripcion_fact,
                       descripcion cod_tipo_mercaderia,
                       descripcion cod_grupo,
                       descripcion vehiculo,
                       '#APP_FILES#ic_sinimagen.png' img_url,
                       '' iconos
                  FROM articulo_insitu) LOOP

        apex_collection.add_member(p_collection_name => 'ARTICULOS',
                                   p_c001            => i.cod_articulo,
                                   p_c002            => i.descripcion,
                                   p_c003            => i.descripcion_fact,
                                   p_c004            => i.cod_tipo_mercaderia,
                                   p_c005            => i.cod_grupo,
                                   p_c006            => i.vehiculo,
                                   p_c007            => i.img_url,
                                   p_c008            => i.iconos);
      END LOOP;
    END;
  END pr_cargar_articulos_inventarios;





/**
  * procedimiento para cargar productos correspondiente a cultivos
  * author  : hector segovia
  * created : 10/10/2024
  **/
  PROCEDURE pr_cargar_cultivos IS
    v_descrip  VARCHAR2(600);
    v_articulo VARCHAR2(600);

  BEGIN

    apex_collection.create_or_truncate_collection(p_collection_name => 'CULTIVOS');

    BEGIN
      FOR i IN (SELECT cod_producto,
                       descripcion,
                       descripcion descripcion_fact,
                       descripcion cod_tipo_mercaderia,
                       descripcion cod_grupo,
                       descripcion vehiculo,
                       '#APP_FILES#ic_sinimagen.png' img_url,
                       '' iconos
                  FROM producto_agropecuario
                 WHERE tipo_producto = 'AGRO'
                 ORDER BY descripcion) LOOP

        apex_collection.add_member(p_collection_name => 'CULTIVOS',
                                   p_c001            => i.cod_producto,
                                   p_c002            => i.descripcion,
                                   p_c003            => i.descripcion_fact,
                                   p_c004            => i.cod_tipo_mercaderia,
                                   p_c005            => i.cod_grupo,
                                   p_c006            => i.vehiculo,
                                   p_c007            => i.img_url,
                                   p_c008            => i.iconos);
      END LOOP;
    END;
  END pr_cargar_cultivos;




/**
  * procedimiento para cargar ganados
  * author  : hector segovia
  * created : 10/10/2024
  **/
  PROCEDURE pr_cargar_ganados IS
    v_descrip  VARCHAR2(600);
    v_articulo VARCHAR2(600);

  BEGIN

    apex_collection.create_or_truncate_collection(p_collection_name => 'GANADOS');

    BEGIN
      FOR i IN (SELECT cod_producto,
                       descripcion,
                       descripcion descripcion_fact,
                       descripcion cod_tipo_mercaderia,
                       descripcion cod_grupo,
                       descripcion vehiculo,
                       '#APP_FILES#ic_sinimagen.png' img_url,
                       '' iconos
                  FROM producto_agropecuario
                 WHERE tipo_producto = 'PECU'
                 ORDER BY descripcion) LOOP

        apex_collection.add_member(p_collection_name => 'GANADOS',
                                   p_c001            => i.cod_producto,
                                   p_c002            => i.descripcion,
                                   p_c003            => i.descripcion_fact,
                                   p_c004            => i.cod_tipo_mercaderia,
                                   p_c005            => i.cod_grupo,
                                   p_c006            => i.vehiculo,
                                   p_c007            => i.img_url,
                                   p_c008            => i.iconos);
      END LOOP;
    END;
  END pr_cargar_ganados;





/**
  * procedimiento para carga de derivados
  * author  : hector segovia
  * created : 10/10/2024
  **/
  PROCEDURE pr_cargar_derivados IS
    v_descrip  VARCHAR2(600);
    v_articulo VARCHAR2(600);

  BEGIN

    apex_collection.create_or_truncate_collection(p_collection_name => 'DERIVADOS');

    BEGIN
      FOR i IN (SELECT cod_producto,
                       descripcion,
                       descripcion descripcion_fact,
                       descripcion cod_tipo_mercaderia,
                       descripcion cod_grupo,
                       descripcion vehiculo,
                       '#APP_FILES#ic_sinimagen.png' img_url,
                       '' iconos
                  FROM producto_agropecuario
                 WHERE tipo_producto = 'DERI'
                 ORDER BY descripcion) LOOP

        apex_collection.add_member(p_collection_name => 'DERIVADOS',
                                   p_c001            => i.cod_producto,
                                   p_c002            => i.descripcion,
                                   p_c003            => i.descripcion_fact,
                                   p_c004            => i.cod_tipo_mercaderia,
                                   p_c005            => i.cod_grupo,
                                   p_c006            => i.vehiculo,
                                   p_c007            => i.img_url,
                                   p_c008            => i.iconos);
      END LOOP;
    END;
  END pr_cargar_derivados;

  /**
  * procedimiento para crear in situ independientes
  * author  : hector segovia
  * created : 22/10/2024
  **/
  PROCEDURE pr_app_crea_insitu_inde(p_login                     IN sc_insitu_independiente.usr_ult_act%TYPE DEFAULT ' ',
                                    p_serial_instal             IN NUMBER DEFAULT 0,
                                    p_id_row_device             IN NUMBER DEFAULT 0,
                                    p_nro_soli                  IN sc_insitu_independiente.nro_soli%TYPE DEFAULT 0,
                                    p_nro_sol                   IN sc_insitu_independiente.nro_sol%TYPE DEFAULT 0,
                                    p_nro_item_trabajo          IN sc_insitu_independiente.nro_item_trabajo%TYPE DEFAULT 0,
                                    p_depend_indep_agrogan      IN VARCHAR2 DEFAULT ' ',
                                    p_nombre                    IN VARCHAR2 DEFAULT ' ',
                                    p_apellido                  IN VARCHAR2 DEFAULT ' ',
                                    p_direccion_laboral         IN VARCHAR2 DEFAULT ' ',
                                    p_tipo_local                IN VARCHAR2 DEFAULT ' ',
                                    p_paga_patente              IN VARCHAR2 DEFAULT ' ',
                                    p_fecha_confirmacion        IN DATE DEFAULT NULL,
                                    p_estado_civil              IN VARCHAR2 DEFAULT ' ',
                                    p_hijos                     IN NUMBER DEFAULT 0,
                                    p_menores                   IN NUMBER DEFAULT 0,
                                    p_nombre_conyuge            IN VARCHAR2 DEFAULT ' ',
                                    p_trabajo_conyuge           IN VARCHAR2 DEFAULT ' ',
                                    p_comentario                IN sc_insitu_independiente.comentario%TYPE DEFAULT ' ',
                                    p_datos_proporcionados_por  IN VARCHAR2 DEFAULT ' ',
                                    p_actividad                 IN sc_insitu_independiente.actividad%TYPE DEFAULT ' ',
                                    p_antiguedad                IN sc_insitu_independiente.antiguedad%TYPE DEFAULT NULL,
                                    p_antiguedad_anos           IN NUMBER DEFAULT 0,
                                    p_antiguedad_meses          IN NUMBER DEFAULT 0,
                                    p_venta_semanal             IN sc_insitu_independiente.venta_semanal%TYPE DEFAULT 0,
                                    p_costo_semanal             IN sc_insitu_independiente.costo_semanal%TYPE DEFAULT 0,
                                    p_ganancia_semanal          IN sc_insitu_independiente.ganancia_semanal%TYPE DEFAULT 0,
                                    p_cantidad_mercaderia       IN sc_insitu_independiente.cantidad_mercaderia%TYPE DEFAULT 0,
                                    p_valor_aproximado          IN sc_insitu_independiente.valor_aproximado%TYPE DEFAULT 0,
                                    p_tiene_funcionario         IN sc_insitu_independiente.tiene_funcionario%TYPE DEFAULT ' ',
                                    p_cantidad_funcionario      IN sc_insitu_independiente.cantidad_funcionario%TYPE DEFAULT 0,
                                    p_sueldo                    IN sc_insitu_independiente.sueldo%TYPE DEFAULT 0,
                                    p_vehiculo                  IN sc_insitu_independiente.vehiculo%TYPE DEFAULT ' ',
                                    p_anho_vehiculo             IN sc_insitu_independiente.anho_vehiculo%TYPE DEFAULT 0,
                                    p_comentario_inde           IN sc_insitu_independiente.comentario%TYPE DEFAULT ' ',
                                    p_venta_mensual             IN sc_insitu_independiente.venta_mensual%TYPE DEFAULT 0,
                                    p_costo_mensual             IN sc_insitu_independiente.costo_mensual%TYPE DEFAULT 0,
                                    p_ganancia_mensual          IN sc_insitu_independiente.ganancia_mensual%TYPE DEFAULT 0,
                                    p_otra_act_economica        IN sc_insitu_independiente.otra_act_economica%TYPE DEFAULT ' ',
                                    p_otra_act_antiguedad_anho  IN sc_insitu_independiente.otra_act_antiguedad_anho%TYPE DEFAULT 0,
                                    p_otra_act_antiguedad_meses IN sc_insitu_independiente.otra_act_antiguedad_meses%TYPE DEFAULT 0,
                                    p_otra_act_ingreso          IN sc_insitu_independiente.otra_act_ingreso%TYPE DEFAULT 0,
                                    p_otra_act_comentario       IN sc_insitu_independiente.otra_act_comentario%TYPE DEFAULT ' ',
                                    p_descripcion_de            IN sc_insitu_independiente.descripcion_de%TYPE DEFAULT ' ',
                                    p_cod_localidad             IN sc_insitu_independiente.cod_localidad%TYPE DEFAULT 0,
                                    p_construccion_de           IN sc_insitu_independiente.construccion_de%TYPE DEFAULT ' ',
                                    p_muebles_vehiculos         IN sc_insitu_independiente.muebles_vehiculos%TYPE DEFAULT ' ',
                                    p_maquinarias_herramientas  IN sc_insitu_independiente.maquinarias_herramientas%TYPE DEFAULT ' ',
                                    p_nro_confirmacion          IN NUMBER DEFAULT 0,
                                    p_croquis_hablado           IN VARCHAR2 DEFAULT ' ',
                                    p_visitador_aprueba         IN VARCHAR2 DEFAULT ' ',
                                    p_visitador_comentario      IN VARCHAR2 DEFAULT ' ')

   IS
    v_programa      VARCHAR2(30) := ' ';
    v_cod_resultado NUMBER := 0;
    v_resultado     VARCHAR2(256) := ' ';
    v_success       NUMBER := 0;
    v_ya_existe     NUMBER := 0;
    v_anti_ano_str  NUMBER := 0;
    v_anti_mes_str  NUMBER := 0;
    v_p_nro_soli    NUMBER;
    v_p_antiguedad  DATE;
    v_sql_rowcount  NUMBER;
    iierrornumber   NUMBER := 0;
  BEGIN
    v_p_antiguedad := p_antiguedad;
    v_p_nro_soli   := p_nro_soli;
    v_programa     := 'app_crea_insitu_inde.->';
    v_success      := 100;
    v_ya_existe    := 500;
    v_anti_ano_str := p_antiguedad_anos;
    v_anti_mes_str := p_antiguedad_meses;
    
    v_p_antiguedad :=  ADD_MONTHS(TRUNC(SYSDATE, 'MM'), -(v_anti_ano_str * 12 + v_anti_mes_str )); 

    BEGIN

      pr_app_crea_insitu(p_programa                 => v_programa,
                         p_cod_resultado            => v_cod_resultado,
                         p_resultado                => v_resultado,
                         p_login                    => p_login,
                         p_serial_instal            => p_serial_instal,
                         p_id_row_device            => p_id_row_device,
                         p_nro_soli                 => v_p_nro_soli,
                         p_nro_sol                  => p_nro_sol,
                         p_nro_item_trabajo         => p_nro_item_trabajo,
                         p_depend_indep_agrogan     => p_depend_indep_agrogan,
                         p_nombre                   => p_nombre,
                         p_apellido                 => p_apellido,
                         p_direccion_laboral        => p_direccion_laboral,
                         p_tipo_local               => p_tipo_local,
                         p_paga_patente             => p_paga_patente,
                         p_fecha_confirmacion       => p_fecha_confirmacion,
                         p_estado_civil             => p_estado_civil,
                         p_hijos                    => p_hijos,
                         p_menores                  => p_menores,
                         p_nombre_conyuge           => p_nombre_conyuge,
                         p_trabajo_conyuge          => p_trabajo_conyuge,
                         p_comentario               => p_comentario,
                         p_datos_proporcionados_por => p_datos_proporcionados_por,
                         p_nro_confirmacion         => p_nro_confirmacion,
                         p_croquis_hablado          => p_croquis_hablado,
                         p_visitador_aprueba        => p_visitador_aprueba,
                         p_visitador_comentario     => p_visitador_comentario);
    EXCEPTION
      WHEN OTHERS THEN
        raise_application_error(-20999,
                                'Error al invocar el procedimiento app_crea_insitu' || ' ' ||
                                SQLERRM);

    END;
    IF iierrornumber != 0 THEN
      ROLLBACK;
      v_resultado := v_programa || 'Error al crear insitu.';
      raise_application_error(-20999, v_resultado || ' ' || SQLERRM);
    ELSIF v_cod_resultado != v_success AND v_cod_resultado != v_ya_existe THEN
      ROLLBACK;
      raise_application_error(-20999, v_resultado || ' ' || SQLERRM);
    END IF;
    BEGIN
      v_sql_rowcount := 0;
      /*line:140030*/
      SELECT a.nro_soli
        INTO v_p_nro_soli
        FROM sc_insitu_independiente a
       WHERE a.nro_soli = v_p_nro_soli
         AND a.nro_sol = p_nro_sol
         AND a.nro_item_trabajo = p_nro_item_trabajo;
      v_sql_rowcount := SQL%ROWCOUNT;
    EXCEPTION
      WHEN no_data_found THEN
        NULL;
      WHEN OTHERS THEN
        ROLLBACK;
        v_resultado := v_programa ||
                       'Error al verificar si ya existeinsitu depe.';
        raise_application_error(-20999, v_resultado || ' ' || SQLERRM);
    END;
    IF v_sql_rowcount <= 0 THEN
      DECLARE
        l_current_date DATE := current_date;
      BEGIN
        /*line:140031*/
        INSERT INTO sc_insitu_independiente
          (nro_soli,
           nro_sol,
           nro_item_trabajo,
           actividad,
           antiguedad,
           venta_semanal,
           costo_semanal,
           ganancia_semanal,
           cantidad_mercaderia,
           valor_aproximado,
           tiene_funcionario,
           cantidad_funcionario,
           sueldo,
           vehiculo,
           anho_vehiculo,
           comentario,
           venta_mensual,
           costo_mensual,
           ganancia_mensual,
           otra_act_economica,
           otra_act_antiguedad_anho,
           otra_act_antiguedad_meses,
           otra_act_ingreso,
           otra_act_comentario,
           descripcion_de,
           cod_localidad,
           construccion_de,
           muebles_vehiculos,
           maquinarias_herramientas,
           fec_ult_act,
           usr_ult_act)
        VALUES
          (v_p_nro_soli,
           p_nro_sol,
           p_nro_item_trabajo,
           p_actividad,
           v_p_antiguedad,
           p_venta_semanal,
           p_costo_semanal,
           p_ganancia_semanal,
           p_cantidad_mercaderia,
           p_valor_aproximado,
           p_tiene_funcionario,
           p_cantidad_funcionario,
           p_sueldo,
           p_vehiculo,
           p_anho_vehiculo,
           p_comentario_inde,
           p_venta_mensual,
           p_costo_mensual,
           p_ganancia_mensual,
           p_otra_act_economica,
           p_otra_act_antiguedad_anho,
           p_otra_act_antiguedad_meses,
           p_otra_act_ingreso,
           p_otra_act_comentario,
           p_descripcion_de,
           p_cod_localidad,
           p_construccion_de,
           p_muebles_vehiculos,
           p_maquinarias_herramientas,
           l_current_date,
           p_login);
      EXCEPTION
        WHEN OTHERS THEN
          ROLLBACK;
          v_resultado := v_programa ||
                         'Error al insertar ensc_insitu_independiente.';
          raise_application_error(-20999, v_resultado || ' ' || SQLERRM);
      END;
    ELSE
      DECLARE
        l_current_date DATE := current_date;
      BEGIN
        /*line:140035*/
        UPDATE sc_insitu_independiente
           SET actividad                 = p_actividad,
               antiguedad                = v_p_antiguedad,
               venta_semanal             = p_venta_semanal,
               costo_semanal             = p_costo_semanal,
               ganancia_semanal          = p_ganancia_semanal,
               cantidad_mercaderia       = p_cantidad_mercaderia,
               valor_aproximado          = p_valor_aproximado,
               tiene_funcionario         = p_tiene_funcionario,
               cantidad_funcionario      = p_cantidad_funcionario,
               sueldo                    = p_sueldo,
               vehiculo                  = p_vehiculo,
               anho_vehiculo             = p_anho_vehiculo,
               comentario                = p_comentario,
               venta_mensual             = p_venta_mensual,
               costo_mensual             = p_costo_mensual,
               ganancia_mensual          = p_ganancia_mensual,
               otra_act_economica        = p_otra_act_economica,
               otra_act_antiguedad_anho  = p_otra_act_antiguedad_anho,
               otra_act_antiguedad_meses = p_otra_act_antiguedad_meses,
               otra_act_ingreso          = p_otra_act_ingreso,
               otra_act_comentario       = p_otra_act_comentario,
               descripcion_de            = p_descripcion_de,
               cod_localidad             = p_cod_localidad,
               construccion_de           = p_construccion_de,
               muebles_vehiculos         = p_muebles_vehiculos,
               maquinarias_herramientas  = p_maquinarias_herramientas,
               fec_ult_act               = l_current_date,
               usr_ult_act               = p_login
         WHERE nro_soli = v_p_nro_soli
           AND nro_sol = p_nro_sol
           AND nro_item_trabajo = p_nro_item_trabajo;
        IF SQL%ROWCOUNT <= 0 THEN
          RAISE no_data_found;
        END IF;
      EXCEPTION
        WHEN no_data_found THEN
          ROLLBACK;
          v_resultado := v_programa || 'No se pudo actualizar insitu inde.';
          raise_application_error(-20999, v_resultado || ' ' || SQLERRM);
        WHEN OTHERS THEN
          ROLLBACK;
          v_resultado := v_programa || 'Error al actualizar insitu inde.';
          raise_application_error(-20999, v_resultado || ' ' || SQLERRM);
      END;
    END IF;
    v_cod_resultado := 100;
    v_resultado     := v_programa || 'OK';

  END pr_app_crea_insitu_inde;

  /**
  * procedimiento para guardar y llamar  a los procesos correspondiente a in situ independiente
  * author  : hector segovia
  * created : 22/10/2024
  **/
  PROCEDURE pr_guarda_proceso_inde(p_nro_soli         IN NUMBER,
                                   p_nro_sol          IN NUMBER,
                                   p_nombre           IN VARCHAR2,
                                   p_apellido         IN VARCHAR2,
                                   p_nro_confirmacion IN NUMBER,
                                   p_nro_item_trabajo IN NUMBER) IS

    v_login                    sc_insitu_independiente.usr_ult_act%TYPE := fn_user;
    v_serial_instal            NUMBER := 0;
    v_id_row_device            NUMBER := 0;
    v_nro_item_trabajo         NUMBER := p_nro_item_trabajo;
    v_depend_indep_agrogan     VARCHAR2(50) := 'INDE';
    v_fecha_confirmacion       DATE := to_date(current_date, 'dd/mm/yyyy');
    v_estado_civil             VARCHAR2(50);
    v_hijos                    NUMBER := 0;
    v_menores                  NUMBER := 0;
    v_nombre_conyuge           VARCHAR2(100) := ' ';
    v_trabajo_conyuge          VARCHAR2(100) := ' ';
    v_comentario               sc_insitu_independiente.comentario%TYPE := ' ';
    v_datos_proporcionados_por VARCHAR2(100) := ' ';
    v_empresa                  sc_insitu_dependiente.empresa%TYPE;
    v_antiguedad_anho          NUMBER := 0;
    v_antiguedad_meses         NUMBER := 0;
    v_cargo                    sc_insitu_dependiente.cargo%TYPE;
    v_salario_mensual          sc_insitu_dependiente.salario_mensual%TYPE := 0;
    v_cobro_salario            sc_insitu_dependiente.salario_semanal%TYPE := 0;
    v_comision                 sc_insitu_dependiente.comision%TYPE := 0;
    v_rubro_empresa            sc_insitu_dependiente.rubro_empresa%TYPE := ' ';
    v_cantidad_funcionario     sc_insitu_dependiente.cantidad_funcionario%TYPE := 0;
    v_cantidad_sucursal        sc_insitu_dependiente.cantidad_sucursal%TYPE := 0;
    v_nro_confirmacion         NUMBER := p_nro_confirmacion;
    v_croquis_hablado          VARCHAR2(500) := ' ';
    v_visitador_aprueba        VARCHAR2(500) := ' ';
    v_visitador_comentario     VARCHAR2(500) := ' ';
    v_nro_sol                  NUMBER := 0;
    v_ocupacion                VARCHAR2(200);
    v_tiene_ips                VARCHAR2(5);

    v_descripcion                 VARCHAR2(500);
    v_direccion_laboral           VARCHAR2(500);
    v_localidad                   VARCHAR2(500);
    v_paga_patente                VARCHAR2(500);
    v_local                       VARCHAR2(500);
    v_tipo_local                  VARCHAR2(500);
    v_constuccion                 VARCHAR2(500);
    v_otra_actividad_economica    VARCHAR2(500);
    v_antiguedad_anhos            NUMBER := 0;
    v_antiguedad_mese             NUMBER := 0;
    v_ingreso                     NUMBER := 0;
    v_actividad                   sc_insitu_independiente.actividad%TYPE DEFAULT ' ';
    v_actividad_economica         VARCHAR2(500);
    v_venta_semanal               NUMBER := 0;
    v_costo_semanal               NUMBER := 0;
    v_ganancia_semanal            NUMBER := 0;
    v_cantidad_mercaderia         sc_insitu_independiente.cantidad_mercaderia%TYPE DEFAULT 0;
    v_tiene_funcionario           VARCHAR2(50);
    v_cantidad_funcionarios       NUMBER := 0;
    v_salario_funcionario         NUMBER := 0;
    v_cantidad_hijos              NUMBER := 0;
    v_cantidad_hijos_menores      NUMBER;
    v_valor_aproximado            NUMBER := 0;
    v_vehiculo                    VARCHAR2(100) := ' ';
    v_anho_vehiculo               NUMBER := 0;
    v_venta_mensual               sc_insitu_independiente.venta_semanal%TYPE DEFAULT 0;
    v_ganancia_mensual            sc_insitu_independiente.ganancia_semanal%TYPE DEFAULT 0;
    v_comentario_otra_act         VARCHAR2(500) := ' ';
    v_descripcion_de              VARCHAR2(500) := ' ';
    v_muebles_vehiculos           VARCHAR2(500) := ' ';
    v_maquinarias_herramientas    VARCHAR2(500) := ' ';
    v_comentario_negocio          VARCHAR2(500) := ' ';
    v_comentario_inde             VARCHAR2(500) := ' ';
    v_antiguedad                  sc_insitu_independiente.antiguedad%TYPE DEFAULT NULL;
    v_valor_aproximado_mercaderia NUMBER := 0;
    v_valor_ingreso               NUMBER := 0;
    v_costo_mensual               NUMBER := 0;
    v_comentario_otra             VARCHAR2(500) := ' ';

    CURSOR cur_inventarios IS
      SELECT seq_id,
             c001 AS codigo,
             c002 AS descripcion,
             to_number(c003) AS cantidad,
             c004 AS eliminar
        FROM apex_collections
       WHERE collection_name = 'TMP_ARTIC_INVENTARIOS_INDE';
  BEGIN

    SELECT c001 descripcion,
           c002 direccion_laboral,
           c003 croquis_hablado,
           c004 localidad,
           c005 paga_patente,
           c006 LOCAL,
           c007 tipo_local,
           c008 constuccion
      INTO v_descripcion,
           v_direccion_laboral,
           v_croquis_hablado,
           v_localidad,
           v_paga_patente,
           v_local,
           v_tipo_local,
           v_constuccion
      FROM apex_collections
     WHERE collection_name = 'TMP_LABORAL_INDE';

    SELECT c001 estado_civil,
           to_number(c002) cantidad_hijos,
           to_number(c003) cantidad_hijos_menores,
           c004 ocupacion
      INTO v_estado_civil,
           v_cantidad_hijos,
           v_cantidad_hijos_menores,
           v_ocupacion
      FROM apex_collections
     WHERE collection_name = 'TMP_SOLICITANTE_INDE';

    SELECT c001 otra_actividad_economica,
           to_number(c002) antiguedad_anhos,
           to_number(c003) antiguedad_meses,
           to_number(c004) ingreso,
           c005 comentario
      INTO v_otra_actividad_economica,
           v_antiguedad_anho,
           v_antiguedad_meses,
           v_ingreso,
           v_comentario_otra_act
      FROM apex_collections
     WHERE collection_name = 'TMP_INGRESOS_OTRA';

    SELECT c001 actividad,
           c002 actividad_economica,
           to_number(c003) antiguedad_anho,
           to_number(c004) antiguedad_meses
      INTO v_actividad,
           v_actividad_economica,
           v_antiguedad_anhos,
           v_antiguedad_meses
      FROM apex_collections
     WHERE collection_name = 'TMP_ACTIVIDAD_INDE';

    SELECT c001 tiene_funcionario,
           to_number(c002) cantidad_funcionarios,
           to_number(c003) salario_funcionario
      INTO v_tiene_funcionario,
           v_cantidad_funcionarios,
           v_salario_funcionario
      FROM apex_collections
     WHERE collection_name = 'TMP_FUNCIONARIOS';

    SELECT c001 muebles_vehiculos,
           c002 maquinarias_herramientas,
           c003 comentario_negocio
      INTO v_muebles_vehiculos,
           v_maquinarias_herramientas,
           v_comentario_otra
      FROM apex_collections
     WHERE collection_name = 'TMP_INVENTARIO_INDE';

    SELECT to_number(c001) costo_mensual,
           to_number(c002) ganancia_mensual,
           to_number(c003) valor_aproximado_mercaderia,
           to_number(c004) valor_ingreso
      INTO v_costo_mensual,
           v_ganancia_mensual,
           v_valor_aproximado_mercaderia,
           v_valor_ingreso
      FROM apex_collections
     WHERE collection_name = 'TMP_INGRESOS_APEX';

    pkg_insitu.pr_app_crea_insitu_inde(p_login                     => v_login,
                                       p_serial_instal             => v_serial_instal,
                                       p_id_row_device             => v_id_row_device,
                                       p_nro_soli                  => p_nro_soli,
                                       p_nro_sol                   => p_nro_sol,
                                       p_nro_item_trabajo          => v_nro_item_trabajo,
                                       p_depend_indep_agrogan      => v_depend_indep_agrogan,
                                       p_nombre                    => p_nombre,
                                       p_apellido                  => p_apellido,
                                       p_direccion_laboral         => v_direccion_laboral,
                                       p_tipo_local                => v_tipo_local,
                                       p_paga_patente              => v_paga_patente,
                                       p_fecha_confirmacion        => v_fecha_confirmacion,
                                       p_estado_civil              => v_estado_civil,
                                       p_hijos                     => v_cantidad_hijos,
                                       p_menores                   => v_cantidad_hijos_menores,
                                       p_nombre_conyuge            => v_nombre_conyuge,
                                       p_trabajo_conyuge           => v_trabajo_conyuge,
                                       p_comentario                => v_comentario_otra_act,
                                       p_datos_proporcionados_por  => v_datos_proporcionados_por,
                                       p_actividad                 => v_actividad_economica,
                                       p_antiguedad                => v_antiguedad,
                                       p_antiguedad_anos           => v_antiguedad_anho,
                                       p_antiguedad_meses          => v_antiguedad_mese,
                                       p_venta_semanal             => v_venta_semanal,
                                       p_costo_semanal             => v_costo_semanal,
                                       p_ganancia_semanal          => v_ganancia_semanal,
                                       p_cantidad_mercaderia       => v_cantidad_mercaderia,
                                       p_valor_aproximado          => v_valor_aproximado,
                                       p_tiene_funcionario         => v_tiene_funcionario,
                                       p_cantidad_funcionario      => v_cantidad_funcionarios,
                                       p_sueldo                    => v_salario_funcionario,
                                       p_vehiculo                  => v_muebles_vehiculos,
                                       p_anho_vehiculo             => v_anho_vehiculo,
                                       p_comentario_inde           => v_comentario_otra,
                                       p_venta_mensual             => v_valor_ingreso,
                                       p_costo_mensual             => v_costo_mensual,
                                       p_ganancia_mensual          => v_ganancia_mensual,
                                       p_otra_act_economica        => v_otra_actividad_economica,
                                       p_otra_act_antiguedad_anho  => v_antiguedad_anhos,
                                       p_otra_act_antiguedad_meses => v_antiguedad_meses,
                                       p_otra_act_ingreso          => v_ingreso,
                                       p_otra_act_comentario       => v_comentario_otra_act,
                                       p_descripcion_de            => v_descripcion,
                                       p_cod_localidad             => v_localidad,
                                       p_construccion_de           => v_constuccion,
                                       p_muebles_vehiculos         => v_muebles_vehiculos,
                                       p_maquinarias_herramientas  => v_maquinarias_herramientas,
                                       p_nro_confirmacion          => v_nro_confirmacion,
                                       p_croquis_hablado           => v_croquis_hablado,
                                       p_visitador_aprueba         => v_visitador_aprueba,
                                       p_visitador_comentario      => v_visitador_comentario);

    FOR a IN cur_inventarios LOOP
      pkg_insitu.pr_app_inserta_insitu_inventario(p_login            => v_login,
                                                  p_serial_instal    => v_serial_instal,
                                                  p_nro_soli         => p_nro_soli,
                                                  p_nro_sol          => p_nro_sol,
                                                  p_nro_item_trabajo => v_nro_item_trabajo,
                                                  p_cod_producto     => a.codigo,
                                                  p_cantidad         => a.cantidad);
    END LOOP;

  END;

  /**
  * author  : hector segovia
  * created : 23/10/2024
  * procedimientopara insertar in situ de inventarios
  **/
  PROCEDURE pr_app_inserta_insitu_inventario(p_login            IN sc_insitu_inventario.usr_alta%TYPE DEFAULT ' ',
                                             p_serial_instal    IN NUMBER DEFAULT 0,
                                             p_nro_soli         IN sc_insitu_inventario.nro_soli%TYPE DEFAULT 0,
                                             p_nro_sol          IN sc_insitu_inventario.nro_sol%TYPE DEFAULT 0,
                                             p_nro_item_trabajo IN sc_insitu_inventario.nro_item_trabajo%TYPE DEFAULT 0,
                                             p_cod_producto     IN sc_insitu_inventario.cod_producto%TYPE DEFAULT ' ',
                                             p_cantidad         IN sc_insitu_inventario.cantidad%TYPE DEFAULT 0) IS
    v_programa      VARCHAR2(200) := ' ';
    v_success       NUMBER := 0;
    v_ya_existe     NUMBER := 0;
    v_resultado     VARCHAR2(200) := ' ';
    v_cod_resultado NUMBER := 0;
    v_p_login       VARCHAR2(100);
    v_sql_rowcount  NUMBER;
  BEGIN
    v_p_login   := p_login;
    v_programa  := 'app_inserta_insitu_inventario.->';
    v_success   := 100;
    v_ya_existe := 500;
    BEGIN
      v_sql_rowcount := 0;
      /*line:140815*/
      SELECT usr_alta
        INTO v_p_login
        FROM sc_insitu_inventario
       WHERE nro_soli = p_nro_soli
         AND nro_sol = p_nro_sol
         AND nro_item_trabajo = p_nro_item_trabajo
         AND cod_producto = p_cod_producto;
      v_sql_rowcount := SQL%ROWCOUNT;
    EXCEPTION
      WHEN no_data_found THEN
        NULL;
      WHEN OTHERS THEN
        v_resultado := v_programa || 'Error al verificar si ya existe.';
        raise_application_error(-20999, v_resultado || ' ' || SQLERRM);
    END;
    IF v_sql_rowcount <= 0 THEN
      DECLARE
        l_current_date DATE := to_date(current_date, 'dd/mm/yyyy');
      BEGIN
        /*line:140816*/
        INSERT INTO sc_insitu_inventario
          (nro_soli,
           nro_sol,
           nro_item_trabajo,
           cod_producto,
           cantidad,
           fec_alta,
           usr_alta,
           fec_ult_act,
           usr_ult_act)
        VALUES
          (p_nro_soli,
           p_nro_sol,
           p_nro_item_trabajo,
           p_cod_producto,
           p_cantidad,
           l_current_date,
           v_p_login,
           l_current_date,
           v_p_login);
      EXCEPTION
        WHEN OTHERS THEN
          v_resultado := v_programa ||
                         'Error al insertar en sc_insitu_inventario.';
          raise_application_error(-20999, v_resultado || ' ' || SQLERRM);
      END;
    ELSE
      v_cod_resultado := v_ya_existe;
      v_resultado     := v_programa ||
                         'Ya cre? este producto para este insitu...';
    END IF;
  END pr_app_inserta_insitu_inventario;





/**
  * procedimiento para  crear insitu agropecuarios
  * author  : hector segovia
  * created : 26/10/2024
  **/
  PROCEDURE pr_app_crea_insitu_agro(p_login                    IN sc_insitu_agrogana.usr_ult_act%TYPE DEFAULT ' ',
                                    p_serial_instal            IN NUMBER DEFAULT 0,
                                    p_id_row_device            IN NUMBER DEFAULT 0,
                                    p_nro_soli                 IN sc_insitu_agrogana.nro_soli%TYPE DEFAULT 0,
                                    p_nro_sol                  IN sc_insitu_agrogana.nro_sol%TYPE DEFAULT 0,
                                    p_nro_item_trabajo         IN sc_insitu_agrogana.nro_item_trabajo%TYPE DEFAULT 0,
                                    p_depend_indep_agrogan     IN VARCHAR2 DEFAULT ' ',
                                    p_nombre                   IN VARCHAR2 DEFAULT ' ',
                                    p_apellido                 IN VARCHAR2 DEFAULT ' ',
                                    p_direccion_laboral        IN VARCHAR2 DEFAULT ' ',
                                    p_tipo_local               IN VARCHAR2 DEFAULT ' ',
                                    p_paga_patente             IN VARCHAR2 DEFAULT ' ',
                                    p_fecha_confirmacion       IN DATE DEFAULT NULL,
                                    p_estado_civil             IN VARCHAR2 DEFAULT ' ',
                                    p_hijos                    IN NUMBER DEFAULT 0,
                                    p_menores                  IN NUMBER DEFAULT 0,
                                    p_nombre_conyuge           IN VARCHAR2 DEFAULT ' ',
                                    p_trabajo_conyuge          IN VARCHAR2 DEFAULT ' ',
                                    p_comentario               IN VARCHAR2 DEFAULT ' ',
                                    p_datos_proporcionados_por IN VARCHAR2 DEFAULT ' ',
                                    p_actividad_principal      IN sc_insitu_agrogana.actividad_principal%TYPE DEFAULT ' ',
                                    p_desc_actividad           IN sc_insitu_agrogana.desc_actividad%TYPE DEFAULT ' ',
                                    p_total_hectarea           IN sc_insitu_agrogana.total_hectarea%TYPE DEFAULT 0,
                                    p_total_plantado           IN sc_insitu_agrogana.total_plantado%TYPE DEFAULT 0,
                                    p_desc_plantacion          IN sc_insitu_agrogana.desc_plantacion%TYPE DEFAULT ' ',
                                    p_producto_derivado        IN sc_insitu_agrogana.producto_derivado%TYPE DEFAULT ' ',
                                    p_desc_derivado            IN sc_insitu_agrogana.desc_derivado%TYPE DEFAULT ' ',
                                    p_cantidad_por_semana      IN sc_insitu_agrogana.cantidad_por_semana%TYPE DEFAULT 0,
                                    p_precio_por_semana        IN sc_insitu_agrogana.precio_por_semana%TYPE DEFAULT 0,
                                    p_referencia_comercial     IN sc_insitu_agrogana.referencia_comercial%TYPE DEFAULT ' ',
                                    p_nombre_acopiador         IN sc_insitu_agrogana.nombre_acopiador%TYPE DEFAULT ' ',
                                    p_nombre_proveedor         IN sc_insitu_agrogana.nombre_proveedor%TYPE DEFAULT ' ',
                                    p_cant_electro             IN sc_insitu_agrogana.cant_electro%TYPE DEFAULT 0,
                                    p_cant_movil               IN sc_insitu_agrogana.cant_movil%TYPE DEFAULT 0,
                                    p_cant_maquinaria          IN sc_insitu_agrogana.cant_maquinaria%TYPE DEFAULT 0,
                                    p_ingreso_diario           IN sc_insitu_agrogana.ingreso_diario%TYPE DEFAULT 0,
                                    p_ingreso_semanal          IN sc_insitu_agrogana.ingreso_semanal%TYPE DEFAULT 0,
                                    p_ingreso_quincenal        IN sc_insitu_agrogana.ingreso_quincenal%TYPE DEFAULT 0,
                                    p_ingreso_mensual          IN sc_insitu_agrogana.ingreso_mensual%TYPE DEFAULT 0,
                                    p_ingreso_por_zafra        IN sc_insitu_agrogana.ingreso_por_zafra%TYPE DEFAULT 0,
                                    p_total_ingresos           IN sc_insitu_agrogana.total_ingresos%TYPE DEFAULT 0,
                                    p_otra_act_economica       IN sc_insitu_agrogana.otra_act_economica%TYPE DEFAULT ' ',
                                    p_otra_act_ingreso_mensual IN sc_insitu_agrogana.otra_act_ingreso_mensual%TYPE DEFAULT 0,
                                    p_otra_act_comentario      IN sc_insitu_agrogana.otra_act_comentario%TYPE DEFAULT ' ',
                                    p_descripcion_de           IN sc_insitu_agrogana.descripcion_de%TYPE DEFAULT ' ',
                                    p_cod_localidad            IN sc_insitu_agrogana.cod_localidad%TYPE DEFAULT 0,
                                    p_terreno                  IN sc_insitu_agrogana.terreno%TYPE DEFAULT ' ',
                                    p_muebles_vehiculos        IN sc_insitu_agrogana.muebles_vehiculos%TYPE DEFAULT ' ',
                                    p_maquinarias_herramientas IN sc_insitu_agrogana.maquinarias_herramientas%TYPE DEFAULT ' ',
                                    p_nro_confirmacion         IN NUMBER DEFAULT 0,
                                    p_croquis_hablado          IN VARCHAR2 DEFAULT ' ',
                                    p_visitador_aprueba        IN VARCHAR2 DEFAULT ' ',
                                    p_visitador_comentario     IN VARCHAR2 DEFAULT ' ')

   IS
    v_programa      VARCHAR2(30) := ' ';
    v_cod_resultado NUMBER := 0;
    v_resultado     VARCHAR2(256) := ' ';
    v_success       NUMBER := 0;
    v_ya_existe     NUMBER := 0;
    v_p_nro_soli    NUMBER;
    v_sql_rowcount  NUMBER;
  BEGIN
    v_p_nro_soli := p_nro_soli;
    v_programa   := 'app_crea_insitu_agro.->';
    v_success    := 100;
    v_ya_existe  := 500;

    BEGIN

      pr_app_crea_insitu(p_programa                 => v_programa,
                         p_cod_resultado            => v_cod_resultado,
                         p_resultado                => v_resultado,
                         p_login                    => p_login,
                         p_serial_instal            => p_serial_instal,
                         p_id_row_device            => p_id_row_device,
                         p_nro_soli                 => v_p_nro_soli,
                         p_nro_sol                  => p_nro_sol,
                         p_nro_item_trabajo         => p_nro_item_trabajo,
                         p_depend_indep_agrogan     => p_depend_indep_agrogan,
                         p_nombre                   => p_nombre,
                         p_apellido                 => p_apellido,
                         p_direccion_laboral        => p_direccion_laboral,
                         p_tipo_local               => p_tipo_local,
                         p_paga_patente             => p_paga_patente,
                         p_fecha_confirmacion       => p_fecha_confirmacion,
                         p_estado_civil             => p_estado_civil,
                         p_hijos                    => p_hijos,
                         p_menores                  => p_menores,
                         p_nombre_conyuge           => p_nombre_conyuge,
                         p_trabajo_conyuge          => p_trabajo_conyuge,
                         p_comentario               => p_comentario,
                         p_datos_proporcionados_por => p_datos_proporcionados_por,
                         p_nro_confirmacion         => p_nro_confirmacion,
                         p_croquis_hablado          => p_croquis_hablado,
                         p_visitador_aprueba        => p_visitador_aprueba,
                         p_visitador_comentario     => p_visitador_comentario);
    EXCEPTION
      WHEN OTHERS THEN
        raise_application_error(-20999,
                                'Error al invocar el procedimiento app_crea_insitu' || ' ' ||
                                SQLERRM);

    END;
    IF v_cod_resultado != v_success AND v_cod_resultado != v_ya_existe THEN
      ROLLBACK;
      v_resultado := v_programa || v_resultado;
      raise_application_error(-20999, v_resultado || ' ' || SQLERRM);
    END IF;
    BEGIN
      v_sql_rowcount := 0;
      /*line:139973*/
      SELECT a.nro_soli
        INTO v_p_nro_soli
        FROM sc_insitu_agrogana a
       WHERE a.nro_soli = v_p_nro_soli
         AND a.nro_sol = p_nro_sol
         AND a.nro_item_trabajo = p_nro_item_trabajo;
      v_sql_rowcount := SQL%ROWCOUNT;
    EXCEPTION
      WHEN no_data_found THEN
        NULL;
      WHEN OTHERS THEN
        ROLLBACK;
        v_resultado := v_programa ||
                       'Error al verificar si ya existe insitu depe.';
        raise_application_error(-20999, v_resultado || ' ' || SQLERRM);
    END;
    IF v_sql_rowcount <= 0 THEN
      DECLARE
        l_current_date DATE := current_date;
      BEGIN
        /*line:139974*/
        INSERT INTO sc_insitu_agrogana
          (nro_soli,
           nro_sol,
           nro_item_trabajo,
           actividad_principal,
           desc_actividad,
           total_hectarea,
           total_plantado,
           desc_plantacion,
           producto_derivado,
           desc_derivado,
           cantidad_por_semana,
           precio_por_semana,
           referencia_comercial,
           nombre_acopiador,
           nombre_proveedor,
           cant_electro,
           cant_movil,
           cant_maquinaria,
           ingreso_diario,
           ingreso_semanal,
           ingreso_quincenal,
           ingreso_mensual,
           ingreso_por_zafra,
           total_ingresos,
           otra_act_economica,
           otra_act_ingreso_mensual,
           otra_act_comentario,
           descripcion_de,
           cod_localidad,
           terreno,
           muebles_vehiculos,
           maquinarias_herramientas,
           fec_ult_act,
           usr_ult_act)
        VALUES
          (v_p_nro_soli,
           p_nro_sol,
           p_nro_item_trabajo,
           p_actividad_principal,
           p_desc_actividad,
           p_total_hectarea,
           p_total_plantado,
           p_desc_plantacion,
           p_producto_derivado,
           p_desc_derivado,
           p_cantidad_por_semana,
           p_precio_por_semana,
           p_referencia_comercial,
           p_nombre_acopiador,
           p_nombre_proveedor,
           p_cant_electro,
           p_cant_movil,
           p_cant_maquinaria,
           p_ingreso_diario,
           p_ingreso_semanal,
           p_ingreso_quincenal,
           p_ingreso_mensual,
           p_ingreso_por_zafra,
           p_total_ingresos,
           p_otra_act_economica,
           p_otra_act_ingreso_mensual,
           p_otra_act_comentario,
           p_descripcion_de,
           p_cod_localidad,
           p_terreno,
           p_muebles_vehiculos,
           p_maquinarias_herramientas,
           l_current_date,
           p_login);
      EXCEPTION
        WHEN OTHERS THEN
          ROLLBACK;
          v_resultado := v_programa ||
                         'Error al insertar en sc_insitu_agrogana.';
          raise_application_error(-20999, v_resultado || ' ' || SQLERRM);
      END;
    ELSE
      DECLARE
        l_current_date DATE := current_date;
      BEGIN
        UPDATE sc_insitu_agrogana
           SET actividad_principal      = p_actividad_principal,
               desc_actividad           = p_desc_actividad,
               total_hectarea           = p_total_hectarea,
               total_plantado           = p_total_plantado,
               desc_plantacion          = p_desc_plantacion,
               producto_derivado        = p_producto_derivado,
               desc_derivado            = p_desc_derivado,
               cantidad_por_semana      = p_cantidad_por_semana,
               precio_por_semana        = p_precio_por_semana,
               referencia_comercial     = p_referencia_comercial,
               nombre_acopiador         = p_nombre_acopiador,
               nombre_proveedor         = p_nombre_proveedor,
               cant_electro             = p_cant_electro,
               cant_movil               = p_cant_movil,
               cant_maquinaria          = p_cant_maquinaria,
               ingreso_diario           = p_ingreso_diario,
               ingreso_semanal          = p_ingreso_semanal,
               ingreso_quincenal        = p_ingreso_quincenal,
               ingreso_mensual          = p_ingreso_mensual,
               ingreso_por_zafra        = p_ingreso_por_zafra,
               total_ingresos           = p_total_ingresos,
               otra_act_economica       = p_otra_act_economica,
               otra_act_ingreso_mensual = p_otra_act_ingreso_mensual,
               otra_act_comentario      = p_otra_act_comentario,
               descripcion_de           = p_descripcion_de,
               cod_localidad            = p_cod_localidad,
               terreno                  = p_terreno,
               muebles_vehiculos        = p_muebles_vehiculos,
               maquinarias_herramientas = p_maquinarias_herramientas,
               fec_ult_act              = l_current_date,
               usr_ult_act              = p_login
         WHERE nro_soli = v_p_nro_soli
           AND nro_sol = p_nro_sol
           AND nro_item_trabajo = p_nro_item_trabajo;
        IF SQL%ROWCOUNT <= 0 THEN
          RAISE no_data_found;
        END IF;
      EXCEPTION
        WHEN no_data_found THEN
          ROLLBACK;
          v_resultado := v_programa || 'No se pudo actualizar insitu agro.';
          raise_application_error(-20999, v_resultado || ' ' || SQLERRM);
        WHEN OTHERS THEN
          ROLLBACK;
          v_resultado := v_programa || 'Error al actualizar insitu agro.';
          raise_application_error(-20999, v_resultado || ' ' || SQLERRM);
      END;
    END IF;
    v_cod_resultado := 100;
    v_resultado     := v_programa || 'OK';
  END pr_app_crea_insitu_agro;




  /**
  * procedimiento guardar procesos agropecuarios
  * author  : hector segovia
  * created : 09/10/2024
  **/

  PROCEDURE pr_guarda_proceso_agro(p_nro_soli         IN NUMBER,
                                   p_nro_sol          IN NUMBER,
                                   p_nombre           IN VARCHAR2,
                                   p_apellido         IN VARCHAR2,
                                   p_nro_confirmacion IN NUMBER,
                                   p_nro_item_trabajo IN NUMBER) IS

    v_login                          sc_insitu_independiente.usr_ult_act%TYPE := fn_user;
    v_serial_instal                  NUMBER := 0;
    v_id_row_device                  NUMBER := 0;
    v_nro_item_trabajo               NUMBER := p_nro_item_trabajo;
    v_depend_indep_agrogan           VARCHAR2(50) := 'AGRO';
    v_fecha_confirmacion             DATE := to_date(current_date,
                                                     'dd/mm/yyyy');
    v_estado_civil                   VARCHAR2(50);
    v_hijos                          NUMBER := 0;
    v_menores                        NUMBER := 0;
    v_nombre_conyuge                 VARCHAR2(100) := ' ';
    v_trabajo_conyuge                VARCHAR2(100) := ' ';
    v_comentario                     sc_insitu_independiente.comentario%TYPE := ' ';
    v_datos_proporcionados_por       VARCHAR2(100) := ' ';
    v_empresa                        sc_insitu_dependiente.empresa%TYPE;
    v_antiguedad_anho                NUMBER := 0;
    v_antiguedad_meses               NUMBER := 0;
    v_cargo                          sc_insitu_dependiente.cargo%TYPE;
    v_salario_mensual                sc_insitu_dependiente.salario_mensual%TYPE := 0;
    v_cobro_salario                  sc_insitu_dependiente.salario_semanal%TYPE := 0;
    v_comision                       sc_insitu_dependiente.comision%TYPE := 0;
    v_rubro_empresa                  sc_insitu_dependiente.rubro_empresa%TYPE := ' ';
    v_cantidad_funcionario           sc_insitu_dependiente.cantidad_funcionario%TYPE := 0;
    v_cantidad_sucursal              sc_insitu_dependiente.cantidad_sucursal%TYPE := 0;
    v_nro_confirmacion               NUMBER := p_nro_confirmacion;
    v_croquis_hablado                VARCHAR2(500) := ' ';
    v_visitador_aprueba              VARCHAR2(500) := ' ';
    v_visitador_comentario           VARCHAR2(500) := ' ';
    v_nro_sol                        NUMBER := 0;
    v_ocupacion                      VARCHAR2(200);
    v_tiene_ips                      VARCHAR2(5);
    v_descripcion                    VARCHAR2(500);
    v_direccion_laboral              VARCHAR2(500);
    v_localidad                      VARCHAR2(500);
    v_paga_patente                   VARCHAR2(500) := 'N';
    v_local                          VARCHAR2(500);
    v_tipo_local                     VARCHAR2(500);
    v_constuccion                    VARCHAR2(500);
    v_otra_actividad_economica       VARCHAR2(500);
    v_antiguedad_anhos               NUMBER := 0;
    v_antiguedad_mese                NUMBER := 0;
    v_ingreso                        NUMBER := 0;
    v_actividad                      sc_insitu_independiente.actividad%TYPE DEFAULT ' ';
    v_actividad_economica            VARCHAR2(500);
    v_venta_semanal                  NUMBER := 0;
    v_costo_semanal                  NUMBER := 0;
    v_ganancia_semanal               NUMBER := 0;
    v_cantidad_mercaderia            sc_insitu_independiente.cantidad_mercaderia%TYPE DEFAULT 0;
    v_tiene_funcionario              VARCHAR2(50);
    v_cantidad_funcionarios          NUMBER := 0;
    v_salario_funcionario            NUMBER := 0;
    v_cantidad_hijos                 NUMBER := 0;
    v_cantidad_hijos_menores         NUMBER;
    v_valor_aproximado               NUMBER := 0;
    v_vehiculo                       VARCHAR2(100) := ' ';
    v_anho_vehiculo                  NUMBER := 0;
    v_venta_mensual                  sc_insitu_independiente.venta_semanal%TYPE DEFAULT 0;
    v_ganancia_mensual               sc_insitu_independiente.ganancia_semanal%TYPE DEFAULT 0;
    v_comentario_otra_act            VARCHAR2(500) := ' ';
    v_descripcion_de                 VARCHAR2(500) := ' ';
    v_muebles_vehiculos              VARCHAR2(500) := ' ';
    v_maquinarias_herramientas       VARCHAR2(500) := ' ';
    v_comentario_negocio             VARCHAR2(500) := ' ';
    v_comentario_inde                VARCHAR2(500) := ' ';
    v_antiguedad                     sc_insitu_independiente.antiguedad%TYPE DEFAULT NULL;
    v_valor_aproximado_mercaderia    NUMBER := 0;
    v_valor_ingreso                  NUMBER := 0;
    v_costo_mensual                  NUMBER := 0;
    v_comentario_otra                VARCHAR2(500) := ' ';
    v_total_hectareas                NUMBER := 0;
    v_total_plantado                 NUMBER := 0;
    v_desc_plantacion                VARCHAR2(4000) := ' ';
    v_producto_derivado              VARCHAR2(50) := ' ';
    v_desc_derivado                  VARCHAR2(50) := ' ';
    v_cantidad_por_semana            NUMBER := 0;
    v_precio_por_semana              NUMBER := 0;
    v_referencia_comercial           VARCHAR2(100) := ' ';
    v_nombre_acopiador               VARCHAR2(100) := ' ';
    v_nombre_proveedor               VARCHAR2(100) := ' ';
    v_cant_electro                   NUMBER := 0;
    v_cant_movil                     NUMBER := 0;
    v_cant_maquinaria                NUMBER := 0;
    v_ingreso_diario                 NUMBER := 0;
    v_ingreso_semanal                NUMBER := 0;
    v_ingreso_quincenal              NUMBER := 0;
    v_ingreso_mensual                NUMBER := 0;
    v_ingreso_zafral                 NUMBER := 0;
    v_total_ingresos                 NUMBER := 0;
    v_otra_actividad                 VARCHAR2(100) := ' ';
    v_ingreso_mensual_otra_actividad NUMBER := 0;
    v_comentario_otra_actividad      VARCHAR2(4000) := ' ';
    v_cod_localidad                  NUMBER := 0;
    v_terreno                        VARCHAR2(4000) := ' ';
    v_planta                         VARCHAR2(4000) := ' ';
    v_comprador                      VARCHAR2(4000) := ' ';
  BEGIN


    SELECT c001 descripcion,
           c002 direccion_laboral,
           c003 croquis_hablado,
           c004 localidad,
           c005 total_hectareas,
           c006 total_plantado,
           c007 planta,
           c008 comprador,
           c010 terreno
      INTO v_descripcion,
           v_direccion_laboral,
           v_croquis_hablado,
           v_cod_localidad,
           v_total_hectareas,
           v_total_plantado,
           v_desc_plantacion,
           v_nombre_acopiador,
           v_terreno
      FROM apex_collections
     WHERE collection_name = 'TMP_SOLICITANTE_INDE'
       AND rownum = 1;

    SELECT c001 estado_civil,
           to_number(c002) cantidad_hijos,
           to_number(c003) cantidad_hijos_menores,
           c004 ocupacion
      INTO v_estado_civil,
           v_cantidad_hijos,
           v_cantidad_hijos_menores,
           v_ocupacion
      FROM apex_collections
     WHERE collection_name = 'TMP_SOLICITANTE_AGRO';

    SELECT c001 actividad_economica
      INTO v_actividad_economica
      FROM apex_collections
     WHERE collection_name = 'TMP_ACTIVIDAD_AGRO'
       AND rownum = 1;

    SELECT c001 descripcion,
           c002 direccion_laboral,
           c003 croquis_hablado,
           to_number(c004) localidad,
           to_number(c005) total_hectareas,
           to_number(c006) total_plantado
      INTO v_descripcion_de,
           v_direccion_laboral,
           v_croquis_hablado,
           v_localidad,
           v_total_hectareas,
           v_total_plantado
      FROM apex_collections
     WHERE collection_name = 'TMP_SOLICITANTE_INDE'
       AND rownum = 1;

    SELECT to_number(c001) ingreso_zafral,
           to_number(c002) ingreso_mensual,
           c003 otra_actividad,
           to_number(c004) ingreso_mensual_otra_actividad,
           c005 comentario_otra_actividad
      INTO v_ingreso_zafral,
           v_ingreso_mensual,
           v_otra_actividad,
           v_ingreso_mensual_otra_actividad,
           v_comentario_otra_actividad
      FROM apex_collections
     WHERE collection_name = 'TMP_INGRESOS_AGRO'
       AND rownum = 1;

    SELECT c001 muebles_vehiculos,
           c002 maquinarias_herramientas,
           c003 comentario_negocio
      INTO v_muebles_vehiculos,
           v_maquinarias_herramientas,
           v_comentario_negocio
      FROM apex_collections
     WHERE collection_name = 'TMP_OTRO_INVENTARIO'
       AND rownum = 1;

    pkg_insitu.pr_app_crea_insitu_agro(p_login                    => v_login,
                                       p_serial_instal            => v_serial_instal,
                                       p_id_row_device            => v_id_row_device,
                                       p_nro_soli                 => p_nro_soli,
                                       p_nro_sol                  => p_nro_sol,
                                       p_nro_item_trabajo         => p_nro_item_trabajo,
                                       p_depend_indep_agrogan     => v_depend_indep_agrogan,
                                       p_nombre                   => p_nombre,
                                       p_apellido                 => p_apellido,
                                       p_direccion_laboral        => v_direccion_laboral,
                                       p_tipo_local               => v_descripcion,
                                       p_paga_patente             => v_paga_patente,
                                       p_fecha_confirmacion       => v_fecha_confirmacion,
                                       p_estado_civil             => v_estado_civil,
                                       p_hijos                    => v_cantidad_hijos,
                                       p_menores                  => v_cantidad_hijos_menores,
                                       p_nombre_conyuge           => v_nombre_conyuge,
                                       p_trabajo_conyuge          => v_trabajo_conyuge,
                                       p_comentario               => v_comentario_negocio, --v_comentario,
                                       p_datos_proporcionados_por => v_datos_proporcionados_por,
                                       p_actividad_principal      => v_actividad_economica,
                                       p_desc_actividad           => v_actividad_economica,
                                       p_total_hectarea           => v_total_hectareas,
                                       p_total_plantado           => v_total_plantado,
                                       p_desc_plantacion          => v_desc_plantacion,
                                       p_producto_derivado        => v_producto_derivado,
                                       p_desc_derivado            => v_desc_derivado,
                                       p_cantidad_por_semana      => v_cantidad_por_semana,
                                       p_precio_por_semana        => v_precio_por_semana,
                                       p_referencia_comercial     => v_referencia_comercial,
                                       p_nombre_acopiador         => v_nombre_acopiador,
                                       p_nombre_proveedor         => v_nombre_proveedor,
                                       p_cant_electro             => v_cant_electro,
                                       p_cant_movil               => v_cant_movil,
                                       p_cant_maquinaria          => v_cant_maquinaria,
                                       p_ingreso_diario           => v_ingreso_diario,
                                       p_ingreso_semanal          => v_ingreso_semanal,
                                       p_ingreso_quincenal        => v_ingreso_quincenal,
                                       p_ingreso_mensual          => v_ingreso_mensual,
                                       p_ingreso_por_zafra        => v_ingreso_zafral,
                                       p_total_ingresos           => v_total_ingresos,
                                       p_otra_act_economica       => v_otra_actividad,
                                       p_otra_act_ingreso_mensual => v_ingreso_mensual_otra_actividad,
                                       p_otra_act_comentario      => v_comentario_otra_actividad,
                                       p_descripcion_de           => v_descripcion_de,
                                       p_cod_localidad            => v_cod_localidad,
                                       p_terreno                  => v_terreno,
                                       p_muebles_vehiculos        => v_muebles_vehiculos,
                                       p_maquinarias_herramientas => v_maquinarias_herramientas,
                                       p_nro_confirmacion         => p_nro_confirmacion,
                                       p_croquis_hablado          => v_croquis_hablado,
                                       p_visitador_aprueba        => v_visitador_aprueba,
                                       p_visitador_comentario     => v_visitador_comentario);

    FOR a IN (SELECT seq_id,
                     to_number(c001) AS codigo,
                     c002 AS cultivo,
                     to_number(c003) AS cantidad,
                     c004 AS eliminar
                FROM apex_collections
               WHERE collection_name = 'TMP_CULTIVO') LOOP

      pkg_insitu.pr_app_inserta_insitu_cultivo(p_login            => v_login,
                                               p_serial_instal    => v_serial_instal,
                                               p_nro_soli         => p_nro_soli,
                                               p_nro_sol          => p_nro_sol,
                                               p_nro_item_trabajo => p_nro_item_trabajo,
                                               p_cod_producto     => a.codigo,
                                               p_cantidad         => a.cantidad);

    END LOOP;

    FOR b IN (SELECT seq_id,
                     to_number(c001) AS codigo,
                     c002 AS ganado,
                     to_number(c003) AS cantidad,
                     c004 AS eliminar
                FROM apex_collections
               WHERE collection_name = 'TMP_GANADO') LOOP
      pkg_insitu.pr_app_inserta_insitu_ganado(p_login            => v_login,
                                              p_serial_instal    => v_serial_instal,
                                              p_nro_soli         => p_nro_soli,
                                              p_nro_sol          => p_nro_sol,
                                              p_nro_item_trabajo => p_nro_item_trabajo,
                                              p_cod_producto     => b.codigo,
                                              p_cantidad         => b.cantidad);
    END LOOP;

    FOR c IN (SELECT seq_id,
                     to_number(c001) AS codigo,
                     c002 AS ganado,
                     to_number(c003) AS cantidad,
                     c004 AS eliminar
                FROM apex_collections
               WHERE collection_name = 'TMP_DERIVADOS') LOOP
      pkg_insitu.pr_app_inserta_insitu_derivado(p_login            => v_login,
                                                p_serial_instal    => v_serial_instal,
                                                p_nro_soli         => p_nro_soli,
                                                p_nro_sol          => p_nro_sol,
                                                p_nro_item_trabajo => p_nro_item_trabajo,
                                                p_cod_producto     => c.codigo,
                                                p_cantidad         => c.cantidad);
    END LOOP;

    FOR d IN (SELECT seq_id,
                     to_number(c001) AS codigo,
                     c002 AS descripcion,
                     to_number(c003) AS cantidad,
                     c004 AS eliminar
                FROM apex_collections
               WHERE collection_name = 'TMP_ARTIC_INVENTARIOS_AGRO') LOOP
      pkg_insitu.pr_app_inserta_insitu_inventario(p_login            => v_login,
                                                  p_serial_instal    => v_serial_instal,
                                                  p_nro_soli         => p_nro_soli,
                                                  p_nro_sol          => p_nro_sol,
                                                  p_nro_item_trabajo => v_nro_item_trabajo,
                                                  p_cod_producto     => d.codigo,
                                                  p_cantidad         => d.cantidad);

    END LOOP;

  END;





  /**
  * procedimiento para insertar cultivos
  * author  : hector segovia
  * created : 26/10/2024
  **/
  PROCEDURE pr_app_inserta_insitu_cultivo(p_login            IN sc_insitu_cultivo.usr_alta%TYPE DEFAULT ' ',
                                          p_serial_instal    IN NUMBER DEFAULT 0,
                                          p_nro_soli         IN sc_insitu_cultivo.nro_soli%TYPE DEFAULT 0,
                                          p_nro_sol          IN sc_insitu_cultivo.nro_sol%TYPE DEFAULT 0,
                                          p_nro_item_trabajo IN sc_insitu_cultivo.nro_item_trabajo%TYPE DEFAULT 0,
                                          p_cod_producto     IN sc_insitu_cultivo.cod_producto%TYPE DEFAULT 0,
                                          p_cantidad         IN sc_insitu_cultivo.cantidad%TYPE DEFAULT 0)

   IS
    v_programa      VARCHAR2(30) := ' ';
    v_success       NUMBER := 0;
    v_ya_existe     NUMBER := 0;
    v_resultado     VARCHAR2(100) := ' ';
    v_cod_resultado NUMBER := 0;
    v_p_login       VARCHAR2(8);
    v_sql_rowcount  NUMBER;
  BEGIN
    v_p_login   := p_login;
    v_programa  := 'app_inserta_insitu_cultivo.->';
    v_success   := 100;
    v_ya_existe := 500;
    BEGIN
      v_sql_rowcount := 0;
      /*line:140776*/
      SELECT usr_alta
        INTO v_p_login
        FROM sc_insitu_cultivo
       WHERE nro_soli = p_nro_soli
         AND nro_sol = p_nro_sol
         AND nro_item_trabajo = p_nro_item_trabajo
         AND cod_producto = p_cod_producto;
      v_sql_rowcount := SQL%ROWCOUNT;
    EXCEPTION
      WHEN no_data_found THEN
        NULL;
      WHEN OTHERS THEN
        v_resultado := v_programa || 'Error al verificar si ya existe.';
        raise_application_error(-20999, v_resultado || ' ' || SQLERRM);
    END;
    IF v_sql_rowcount <= 0 THEN
      DECLARE
        l_current_date DATE := current_date;
      BEGIN
        /*line:140777*/
        INSERT INTO sc_insitu_cultivo
          (nro_soli,
           nro_sol,
           nro_item_trabajo,
           cod_producto,
           cantidad,
           fec_alta,
           usr_alta,
           fec_ult_act,
           usr_ult_act)
        VALUES
          (p_nro_soli,
           p_nro_sol,
           p_nro_item_trabajo,
           p_cod_producto,
           p_cantidad,
           l_current_date,
           v_p_login,
           l_current_date,
           v_p_login);
      EXCEPTION
        WHEN OTHERS THEN
          v_resultado := v_programa ||
                         'Error al insertar en sc_insitu_cultivo.';
          raise_application_error(-20999, v_resultado || ' ' || SQLERRM);
      END;
    ELSE
      DECLARE
        l_current_date DATE := current_date;
      BEGIN
        /*line:140779*/
        UPDATE sc_insitu_cultivo
           SET cantidad    = p_cantidad,
               fec_ult_act = l_current_date,
               usr_ult_act = v_p_login
         WHERE nro_soli = p_nro_soli
           AND nro_sol = p_nro_sol
           AND nro_item_trabajo = p_nro_item_trabajo
           AND cod_producto = p_cod_producto;
        IF SQL%ROWCOUNT <= 0 THEN
          RAISE no_data_found;
        END IF;
      EXCEPTION
        WHEN no_data_found THEN
          v_resultado := v_programa ||
                         'No se pudo actualizar sc_insitu_cultivo.';
          raise_application_error(-20999, v_resultado || ' ' || SQLERRM);
        WHEN OTHERS THEN
          v_resultado := v_programa ||
                         'Error al actualizar sc_insitu_cultivo.';
          raise_application_error(-20999, v_resultado || ' ' || SQLERRM);
      END;
    END IF;
    v_cod_resultado := 100;
    v_resultado     := v_programa || 'OK';
  END pr_app_inserta_insitu_cultivo;




/**
  * procedimiento para insertar insitu ganados
  * author  : hector segovia
  * created : 26/10/2024
  **/
  PROCEDURE pr_app_inserta_insitu_ganado(p_login            IN sc_insitu_ganado.usr_alta%TYPE DEFAULT ' ',
                                         p_serial_instal    IN NUMBER DEFAULT 0,
                                         p_nro_soli         IN sc_insitu_ganado.nro_soli%TYPE DEFAULT 0,
                                         p_nro_sol          IN sc_insitu_ganado.nro_sol%TYPE DEFAULT 0,
                                         p_nro_item_trabajo IN sc_insitu_ganado.nro_item_trabajo%TYPE DEFAULT 0,
                                         p_cod_producto     IN sc_insitu_ganado.cod_producto%TYPE DEFAULT 0,
                                         p_cantidad         IN sc_insitu_ganado.cantidad%TYPE DEFAULT 0)

   IS
    v_programa      VARCHAR2(30) := ' ';
    v_success       NUMBER := 0;
    v_ya_existe     NUMBER := 0;
    v_resultado     VARCHAR2(100) := ' ';
    v_cod_resultado NUMBER := 0;
    v_p_login       VARCHAR2(8);
    v_sql_rowcount  NUMBER;
  BEGIN
    v_p_login   := p_login;
    v_programa  := 'app_inserta_insitu_ganado.->';
    v_success   := 100;
    v_ya_existe := 500;
    BEGIN
      v_sql_rowcount := 0;
      /*line:140802*/
      SELECT usr_alta
        INTO v_p_login
        FROM sc_insitu_ganado
       WHERE nro_soli = p_nro_soli
         AND nro_sol = p_nro_sol
         AND nro_item_trabajo = p_nro_item_trabajo
         AND cod_producto = p_cod_producto;
      v_sql_rowcount := SQL%ROWCOUNT;
    EXCEPTION
      WHEN no_data_found THEN
        NULL;
      WHEN OTHERS THEN
        v_resultado := v_programa || 'Error al verificar si ya existe.';
        raise_application_error(-20999, v_resultado || ' ' || SQLERRM);
    END;
    IF v_sql_rowcount <= 0 THEN
      DECLARE
        l_current_date DATE := current_date;
      BEGIN
        /*line:140803*/
        INSERT INTO sc_insitu_ganado
          (nro_soli,
           nro_sol,
           nro_item_trabajo,
           cod_producto,
           cantidad,
           fec_alta,
           usr_alta,
           fec_ult_act,
           usr_ult_act)
        VALUES
          (p_nro_soli,
           p_nro_sol,
           p_nro_item_trabajo,
           p_cod_producto,
           p_cantidad,
           l_current_date,
           v_p_login,
           l_current_date,
           v_p_login);
      EXCEPTION
        WHEN OTHERS THEN
          v_resultado := v_programa ||
                         'Error al insertar en sc_insitu_ganado.';
          raise_application_error(-20999, v_resultado || ' ' || SQLERRM);
      END;
    ELSE
      DECLARE
        l_current_date DATE := current_date;
      BEGIN
        /*line:140805*/
        UPDATE sc_insitu_ganado
           SET cantidad    = p_cantidad,
               fec_ult_act = l_current_date,
               usr_ult_act = v_p_login
         WHERE nro_soli = p_nro_soli
           AND nro_sol = p_nro_sol
           AND nro_item_trabajo = p_nro_item_trabajo
           AND cod_producto = p_cod_producto;
        IF SQL%ROWCOUNT <= 0 THEN
          RAISE no_data_found;
        END IF;
      EXCEPTION
        WHEN no_data_found THEN
          v_resultado := v_programa || 'No se actualiz? sc_insitu_ganado.';
          raise_application_error(-20999, v_resultado || ' ' || SQLERRM);
        WHEN OTHERS THEN
          v_resultado := v_programa ||
                         'Error al actualizar sc_insitu_ganado.';
          raise_application_error(-20999, v_resultado || ' ' || SQLERRM);
      END;
    END IF;
    v_cod_resultado := 100;
    v_resultado     := v_programa || 'OK';
  END pr_app_inserta_insitu_ganado;





/**
  * procedimiento para insertar derivados del insitu
  * author  : hector segovia
  * created : 28/10/2024
  **/
  PROCEDURE pr_app_inserta_insitu_derivado(p_login            IN sc_insitu_derivado.usr_alta%TYPE DEFAULT ' ',
                                           p_serial_instal    IN NUMBER DEFAULT 0,
                                           p_nro_soli         IN sc_insitu_derivado.nro_soli%TYPE DEFAULT 0,
                                           p_nro_sol          IN sc_insitu_derivado.nro_sol%TYPE DEFAULT 0,
                                           p_nro_item_trabajo IN sc_insitu_derivado.nro_item_trabajo%TYPE DEFAULT 0,
                                           p_cod_producto     IN sc_insitu_derivado.cod_producto%TYPE DEFAULT 0,
                                           p_cantidad         IN sc_insitu_derivado.cantidad%TYPE DEFAULT 0)

   IS
    v_programa      VARCHAR2(30) := ' ';
    v_success       NUMBER := 0;
    v_ya_existe     NUMBER := 0;
    v_resultado     VARCHAR2(100) := ' ';
    v_cod_resultado NUMBER := 0;
    v_p_login       VARCHAR2(8);
    v_sql_rowcount  NUMBER;
  BEGIN
    v_p_login   := p_login;
    v_programa  := 'app_inserta_insitu_derivado.->';
    v_success   := 100;
    v_ya_existe := 500;
    BEGIN
      v_sql_rowcount := 0;
      /*line:140789*/
      SELECT usr_alta
        INTO v_p_login
        FROM sc_insitu_derivado
       WHERE nro_soli = p_nro_soli
         AND nro_sol = p_nro_sol
         AND nro_item_trabajo = p_nro_item_trabajo
         AND cod_producto = p_cod_producto;
      v_sql_rowcount := SQL%ROWCOUNT;
    EXCEPTION
      WHEN no_data_found THEN
        NULL;
      WHEN OTHERS THEN
        v_resultado := v_programa || 'Error al verificar si ya existe.';
        raise_application_error(-20999, v_resultado || ' ' || SQLERRM);
    END;
    IF v_sql_rowcount <= 0 THEN
      DECLARE
        l_current_date DATE := current_date;
      BEGIN
        /*line:140790*/
        INSERT INTO sc_insitu_derivado
          (nro_soli,
           nro_sol,
           nro_item_trabajo,
           cod_producto,
           cantidad,
           fec_alta,
           usr_alta,
           fec_ult_act,
           usr_ult_act)
        VALUES
          (p_nro_soli,
           p_nro_sol,
           p_nro_item_trabajo,
           p_cod_producto,
           p_cantidad,
           l_current_date,
           v_p_login,
           l_current_date,
           v_p_login);
      EXCEPTION
        WHEN OTHERS THEN
          v_resultado := v_programa ||
                         'Error al insertar en sc_insitu_derivado.';
          raise_application_error(-20999, v_resultado || ' ' || SQLERRM);
      END;
    ELSE
      DECLARE
        l_current_date DATE := current_date;
      BEGIN
        /*line:140792*/
        UPDATE sc_insitu_derivado
           SET cantidad    = p_cantidad,
               fec_ult_act = l_current_date,
               usr_ult_act = v_p_login
         WHERE nro_soli = p_nro_soli
           AND nro_sol = p_nro_sol
           AND nro_item_trabajo = p_nro_item_trabajo
           AND cod_producto = p_cod_producto;
        IF SQL%ROWCOUNT <= 0 THEN
          RAISE no_data_found;
        END IF;
      EXCEPTION
        WHEN no_data_found THEN
          v_resultado := v_programa ||
                         'No se pudo actualizar sc_insitu_derivado.';
          raise_application_error(-20999, v_resultado || ' ' || SQLERRM);
        WHEN OTHERS THEN
          v_resultado := v_programa ||
                         'Error al actualizar sc_insitu_derivado.';
          raise_application_error(-20999, v_resultado || ' ' || SQLERRM);
      END;
    END IF;
    v_cod_resultado := 100;
    v_resultado     := v_programa || 'OK';
  END pr_app_inserta_insitu_derivado;




/**
  * procedimiento para confirmaciones de asignacion de insitu
  * author  : hector segovia
  * created : 05/11/2024
  **/
PROCEDURE pr_app_sc_confirmacion_asig(p_login            VARCHAR2,
                                      p_nro_soli         NUMBER,
                                      p_nro_confirmacion NUMBER,
                                      p_resultado        OUT VARCHAR2) IS
  v_cod_resultado       NUMBER;
  v_resultado           VARCHAR2(256);
  v_estado_confirmacion VARCHAR2(100);
  v_usr_proc            VARCHAR2(100);
  v_instancia           VARCHAR2(100);
  v_error               NUMBER;
  v_errortext           VARCHAR2(256);
  v_fec_proc            DATE := current_date;
  v_sql_rowcount        NUMBER := 0;
BEGIN
  BEGIN
    SELECT estado_confirmacion, usr_proc, instancia
      INTO v_estado_confirmacion, v_usr_proc, v_instancia
      FROM sc_sol_confirmacion
     WHERE nro_soli = p_nro_soli
       AND nro_confirmacion = p_nro_confirmacion;
  EXCEPTION
    WHEN no_data_found THEN
      v_cod_resultado := 101;
      v_resultado     := 'No existe confirmaci?n...' || 'Nro.Soli=' ||
                         p_nro_soli || 'Nro.Confirm=' || p_nro_confirmacion;
    WHEN OTHERS THEN
      v_errortext := 'Error al seleccionar registro...';
      raise_application_error(-20001, v_errortext);
  END;

  IF v_estado_confirmacion != 'PEND' THEN
    v_cod_resultado := 101;
    v_resultado     := 'Esta confirmaci?n ya no est? pendiente....' ||
                       'Nro.Soli=' || p_nro_soli || ';' || 'Nro.Confirm=' ||
                       p_nro_confirmacion || ';' || 'Estado=' ||
                       v_estado_confirmacion;
    raise_application_error(-20001, v_resultado);
  END IF;

  IF nvl(v_usr_proc, '') != '' THEN
    IF (v_usr_proc = p_login) THEN
      v_cod_resultado := 100;
      v_resultado     := 'Asignacion exitosa...';
    ELSE
      v_cod_resultado := 101;
      v_resultado     := 'Esta Confirmaci?n ya fue Asignada por otro usuario...';
      raise_application_error(-20001, v_resultado);
    END IF;
  END IF;

  BEGIN
    UPDATE sc_sol_confirmacion
       SET usr_proc = p_login, fec_proc = v_fec_proc
     WHERE nro_soli = p_nro_soli
       AND nro_confirmacion = p_nro_confirmacion
       AND usr_proc = ''
       AND estado_confirmacion = 'PEND';

    v_sql_rowcount := SQL%ROWCOUNT;
  EXCEPTION
    WHEN OTHERS THEN
      v_errortext := 'Error al seleccionar actualizar confirmaci?n...';
      raise_application_error(-20001, v_errortext);
  END;
  IF v_sql_rowcount <= 0 THEN
    v_errortext := 'No se pudo actulizar la confirmaci?n...' ||
                   'Nro.Soli...: ' || p_nro_soli || 'Nro.Confirm: ' ||
                   p_nro_confirmacion;
    raise_application_error(-20001, v_errortext);
  END IF;

  v_cod_resultado := 100;
  v_resultado     := 'Asignacion exitosa....';
  p_resultado     := v_resultado;
END pr_app_sc_confirmacion_asig;






/**
  * funcion para obtener el listado de los insitu pendientes de asignacion
  * author  : hector segovia
  * created : 05/11/2024
  **/
FUNCTION fn_in_situ_pendientes(p_usuario IN VARCHAR2) RETURN NUMBER IS
  v_contador NUMBER := 0;
  v_usuario  VARCHAR2(100);
BEGIN
  v_usuario := lower(p_usuario);
  BEGIN
    SELECT COUNT(*)
      INTO v_contador
      FROM sc_sol_confirmacion_pend_vu m, sc_sol ml1, sc ml2
     WHERE ((m.instancia = 'INSI'))
       AND (m.login = v_usuario)
       AND m.nro_soli = ml2.nro_soli
       AND m.nro_sol = ml1.nro_sol;
  EXCEPTION
    WHEN no_data_found THEN
      v_contador := 0;
    WHEN OTHERS THEN
      v_contador := 0;
  END;
  RETURN v_contador;

END;



/**
  * funcion para obtener el contador de insitu correspondiente al usuario logueado
  * author  : hector segovia
  * created : 05/11/2024
  **/
FUNCTION fn_mi_bandeja_in_situ(p_instancia IN VARCHAR2,
                               p_usuario   IN VARCHAR2) RETURN NUMBER IS
  v_contador NUMBER := 0;
  v_usuario  VARCHAR2(100);
BEGIN
  v_usuario := lower(p_usuario);
  BEGIN
    SELECT COUNT(*)
      INTO v_contador
      FROM sc_sol_confirmacion m, sc_sol ml1, sc ml2
     WHERE ((m.instancia = p_instancia))
       AND ((m.usr_proc = v_usuario))
       AND ((m.estado_confirmacion = 'PEND'))
       AND m.nro_soli = ml2.nro_soli
       AND m.nro_sol = ml1.nro_sol
     ORDER BY fec_recordatorio ASC, fec_alta ASC;
  EXCEPTION
    WHEN no_data_found THEN
      v_contador := 0;
    WHEN OTHERS THEN
      v_contador := 0;
  END;
  RETURN v_contador;
END;



/**
  * funcion que retorna el contador de los insitu realizados del dia por el usuario logueado
  * author  : hector segovia
  * created : 05/11/2024
  **/
FUNCTION fn_insitus_realizados(p_instancia IN VARCHAR2,
                                  p_usuario IN VARCHAR2) RETURN NUMBER IS
  v_contador NUMBER := 0;
  v_usuario  VARCHAR2(100);
BEGIN
  v_usuario := lower(p_usuario);
  BEGIN
    SELECT COUNT(*)
    INTO v_contador
    FROM SC_SOL_CONFIRMACION S, SC_SOL ML1, SC ML2
 WHERE S.usr_PROC = v_usuario
   AND S.NRO_SOL = ML1.NRO_SOL
   AND S.NRO_SOLI =  ML2.NRO_SOLI
   AND TRUNC(fec_fin_proc) = TRUNC(CURRENT_DATE)
   AND s.instancia = 'INSI';
  EXCEPTION
    WHEN no_data_found THEN
      v_contador := 0;
    WHEN OTHERS THEN
      v_contador := 0;
  END;
  RETURN v_contador;
END;







/**
  * procedimiento para asignar insitu manualmente desde el menu de inicio
  * author  : hector segovia
  * created : 06/11/2024
  **/
PROCEDURE pr_app_asig_manual_insitu(p_login    VARCHAR2,
                                    p_nro_soli VARCHAR2,
                                    p_tipo_sol VARCHAR2,
                                    p_resultado OUT VARCHAR2) IS
  v_cod_resultado       NUMBER;
  v_resultado           VARCHAR2(2560);
  v_nro_confirmacion    NUMBER;
  v_nro_sol             NUMBER;
  v_nro_item_trabajo    NUMBER;
  v_estado_confirmacion VARCHAR2(400);
  v_usr_proc            VARCHAR2(800);
  v_instancia           VARCHAR2(400);
  v_estado_solli        VARCHAR2(400);
  v_error               NUMBER;
  v_errortext           VARCHAR2(4000);
  v_nivel               NUMBER;
  v_nro_confirmacion_p  NUMBER;
  v_estado_soli         VARCHAR2(400);
  v_nro_referencia      NUMBER;
  v_prioridad           NUMBER;
  v_estado_soli_aut     NUMBER;
  v_cod_sucursal        NUMBER;
  v_iirowcount          NUMBER := 0;
  v_fec_proc            DATE := current_date;
  v_sql_rowcount        NUMBER := 0;
BEGIN
  v_prioridad := 10;
  BEGIN
    SELECT a.estado_soli, b.nro_sol, estado_soli_aut
      INTO v_estado_soli, v_nro_sol, v_estado_soli_aut
      FROM sc a, sc_det b
     WHERE a.nro_soli = p_nro_soli
       AND a.nro_soli = b.nro_soli
       AND b.tipo_sol = p_tipo_sol;
  EXCEPTION
    WHEN no_data_found THEN
      v_cod_resultado := 101;
      v_resultado     := 'No existe registro de solicitud...' ||
                         'Nro.Soli=' || p_nro_soli || 'Tipo.sol=' ||
                         p_tipo_sol;
      raise_application_error(-20001, v_resultado);
    WHEN OTHERS THEN
      v_errortext := 'Error al seleccionar estado solicitud...';
      raise_application_error(-20001, v_errortext);
  END;

  IF v_estado_soli = 'APRO' AND v_estado_soli_aut = 1 THEN
    v_cod_resultado := 100;
  ELSIF v_estado_soli != 'REFE' AND v_estado_soli != 'INSI' THEN
    v_cod_resultado := 101;
    v_resultado     := 'No puede asignarse insitu sobre esta solicitud con estado ' ||
                       v_estado_soli;
    raise_application_error(-20001, v_resultado);
  END IF;

  /*insitu pendiente*/
  BEGIN
    SELECT usr_proc, a.nro_confirmacion, 1
      INTO v_usr_proc, v_nro_confirmacion, v_iirowcount
      FROM sc_sol_confirmacion a, sc_sol_confirmacion_telefonica b
     WHERE a.nro_soli = p_nro_soli
       AND a.instancia = 'INSI'
       AND a.estado_confirmacion = 'PEND'
       AND a.nro_soli = b.nro_soli
       AND a.nro_confirmacion = b.nro_confirmacion;
  EXCEPTION
    WHEN no_data_found THEN
      NULL;
    WHEN OTHERS THEN
      v_errortext := 'Error al seleccionar registro...'|| SQLERRM;
      raise_application_error(-20001, v_errortext);
  END;

  IF v_iirowcount = 1 THEN
    IF v_usr_proc = p_login THEN

      v_cod_resultado := 100;
      v_resultado     := 'Asignaci?n exitosa...';
    ELSIF nvl(v_usr_proc, '') = '' THEN
      BEGIN
        UPDATE sc_sol_confirmacion
           SET usr_proc         = p_login,
               fec_proc         = v_fec_proc,
               asignado_por     = p_login,
               fec_asignado_por = v_fec_proc
         WHERE nro_soli = p_nro_soli
           AND nro_confirmacion = v_nro_confirmacion
           AND usr_proc = ''
           AND estado_confirmacion = 'PEND';
        v_sql_rowcount := SQL%ROWCOUNT;
      EXCEPTION
        WHEN OTHERS THEN
          v_errortext := 'Error al seleccionar actualizar confirmaci?n...';
          raise_application_error(-20001, v_errortext);
      END;
      IF v_sql_rowcount <= 0 THEN
        ROLLBACK;
        v_errortext := 'No se pudo actulizar la confirmaci?n...' ||
                       'Nro.Soli...: ' || p_nro_soli || 'Nro.Confirm: ' ||
                       v_nro_confirmacion;
        raise_application_error(-20001, v_errortext);
      END IF;
      v_cod_resultado := 100;
      v_resultado     := 'Asignacion exitosa...';

    ELSE
      ROLLBACK;

      /*obtener la sucursal del visitador insuti*/
      SELECT cod_sucursal
        INTO v_cod_sucursal
        FROM ingrid_control_usuario
       WHERE login = v_usr_proc;

      v_cod_resultado := 101;
      v_resultado     := 'No puede asignarse. Esta tarea esta asignado al usuario ' ||
                         v_usr_proc || ' de la sucursal ' || v_cod_sucursal;
      raise_application_error(-20001, v_resultado);
    END IF;
  END IF;

  BEGIN
    SELECT m.nro_item
      INTO v_nro_item_trabajo
      FROM sc_sol_trabajo m
     WHERE m.nro_sol = v_nro_sol
       AND m.estado = 1
       AND m.nro_soli = p_nro_soli
       AND m.nro_item_p = 0
       AND NOT EXISTS (SELECT *
              FROM sc_insitu b
             WHERE m.nro_sol = b.nro_sol
               AND m.nro_item = b.nro_item_trabajo
               AND m.nro_soli = b.nro_soli);
  EXCEPTION
    WHEN no_data_found THEN
      v_cod_resultado := 101;
      v_resultado     := 'No existe ning?n laboral pendiente de insitu....';
      raise_application_error(-20001, v_resultado);
    WHEN OTHERS THEN
      v_errortext := 'Error al seleccionar laboral activo.';
      raise_application_error(-20001, v_errortext);
  END;

  BEGIN
    SELECT nvl(MAX(nro_confirmacion), 0) + 1
      INTO v_nro_confirmacion
      FROM sc_sol_confirmacion
     WHERE nro_soli = p_nro_soli;
  EXCEPTION
    WHEN OTHERS THEN
      v_errortext := 'Error al seleccionar sgte n?mero de confirmaci?n...';
      ROLLBACK;
      raise_application_error(-20001, v_errortext);
  END;

  BEGIN
    SELECT nvl(MAX(nro_referencia), 0) + 1
      INTO v_nro_referencia
      FROM sc_sol_confirmacion
     WHERE nro_soli = p_nro_soli
       AND instancia = 'INSI';
  EXCEPTION
    WHEN OTHERS THEN
      v_errortext := 'Error al seleccionar sgte n?mero de referencia...';
      raise_application_error(-20001, v_errortext);
  END;
  v_sql_rowcount := 0;
  BEGIN
    SELECT nro_confirmacion
      INTO v_nro_confirmacion_p
      FROM sc_sol_confirmacion
     WHERE nro_soli = p_nro_soli
       AND instancia = 'ANA'
       AND estado_confirmacion = 'PEND';
    v_sql_rowcount := SQL%ROWCOUNT;
  EXCEPTION
    WHEN no_data_found THEN
      v_sql_rowcount := 0;
    WHEN OTHERS THEN
      v_errortext := 'Error al seleccionar bandeja analista...';
      raise_application_error(-20001, v_errortext);
  END;
  IF v_sql_rowcount >= 1 THEN
    BEGIN
      UPDATE sc_sol_confirmacion
         SET cant_tarea_gen = cant_tarea_gen + 1
       WHERE nro_soli = p_nro_soli
         AND nro_confirmacion = v_nro_confirmacion_p;
    EXCEPTION
      WHEN OTHERS THEN
        raise_application_error(-20001,
                                'Error al actualizar cantidad de tarea...');
    END;
  END IF;

  BEGIN
    INSERT INTO sc_sol_confirmacion
      (nro_soli,
       nro_confirmacion,
       nro_referencia,
       instancia,
       origen,
       nro_sol,
       fec_fin_proc,
       usr_proc,
       estado_confirmacion,
       cod_sucursal,
       prioridad,
       fec_alta,
       usr_alta,
       fec_proc,
       es_empleado_alex,
       nro_confirmacion_p,
       nivel,
       asignado_por,
       fec_asignado_por)
    VALUES
      (p_nro_soli,
       v_nro_confirmacion,
       v_nro_referencia,
       'INSI',
       'ASM',
       v_nro_sol,
       NULL,
       p_login,
       'PEND',
       0,
       v_prioridad,
       v_fec_proc,
       p_login,
       NULL,
       0,
       v_nro_confirmacion_p,
       v_nivel + 1,
       p_login,
       v_fec_proc);
  EXCEPTION
    WHEN OTHERS THEN
      v_errortext := 'Error al insertar confirmaci?n...'|| SQLERRM;
      raise_application_error(-20001, v_errortext);
  END;

  BEGIN
    INSERT INTO sc_sol_confirmacion_telefonica
      (nro_soli,
       nro_confirmacion,
       nro_item_confirmacion,
       nro_referencia,
       nro_sol,
       id_telefono,
       nro_item,
       tipo_confirmacion,
       usr_alta,
       fec_alta,
       estado_confirmacion,
       nro_telefono,
       prioridad,
       tipo_sol,
       nro_item_trabajo)
    VALUES
      (p_nro_soli,
       v_nro_confirmacion,
       1,
       v_nro_referencia,
       v_nro_sol,
       0,
       0,
       'INS',
       p_login,
       v_fec_proc,
       'PEND',
       '',
       0,
       p_tipo_sol,
       v_nro_item_trabajo);
  EXCEPTION
    WHEN OTHERS THEN
      v_errortext := 'Error al insertar detalle confirmaci?n...';
      raise_application_error(-20001, v_errortext);
  END;

  v_cod_resultado := 100;
  v_resultado     := 'Asignaci?n exitosa....';
  p_resultado := v_resultado;
END;







END pkg_insitu;
/ 