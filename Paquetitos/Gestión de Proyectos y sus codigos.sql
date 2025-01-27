create or replace PACKAGE pkg_solicitud_creditos IS
  -- author  : user
  -- created : 18/04/2024 11:40:32
  -- purpose : pkg_solicitud_creditos
  PROCEDURE pr_devuelve_solicitante(p_nro_doc            IN sc_sol.nro_doc%TYPE,
                                    p_tipo_doc           IN sc_sol.tipo_doc%TYPE,
                                    p_nro_sol            OUT sc_sol.nro_sol%TYPE,
                                    p_ape_sol            OUT sc_sol.ape_sol%TYPE,
                                    p_nom_sol            OUT sc_sol.nom_sol%TYPE,
                                    p_cliente            OUT sc_sol.cliente%TYPE,
                                    p_cod_nacionalidad   OUT rua_nacionalidad.cod_nacionalidad%TYPE,
                                    p_nacionalidad       OUT rua_nacionalidad.nacionalidad%TYPE,
                                    p_tipo_personeria    OUT sc_sol.tipo_personeria%TYPE,
                                    p_contribuyente      OUT sc_sol.contribuyente%TYPE,
                                    p_nro_cedula_alfa    OUT sc_sol.nro_cedula_alfa%TYPE,
                                    p_apodo              OUT sc_sol.apodo%TYPE,
                                    p_nro_cedula         OUT sc_sol.nro_cedula%TYPE,
                                    p_ruc_sol            OUT sc_sol.ruc_sol%TYPE,
                                    p_ruc                OUT sc_sol.ruc%TYPE,
                                    p_ruc_dv             OUT sc_sol.ruc_dv%TYPE,
                                    p_fec_nacimiento     OUT sc_sol.fec_nacimiento%TYPE,
                                    p_estado_civil       OUT sc_sol.estado_civil%TYPE,
                                    p_sexo               OUT sc_sol.sexo%TYPE,
                                    p_id_telefono        OUT sc_sol.id_telefono%TYPE,
                                    p_cod_cliente        OUT sc_sol.cod_cliente%TYPE,
                                    p_w_cliente          OUT clientes.cliente%TYPE,
                                    p_cod_tipo_cliente   OUT clientes.cod_tipo_cliente%TYPE,
                                    p_sc_sol_activo      OUT sc_sol.activo%TYPE,
                                    p_correo             OUT clientes.email_facturacion_electronica%TYPE,
                                    p_cod_estado_cliente OUT clientes_estado.cod_estado_cliente%TYPE,
                                    p_mensaje_error      OUT VARCHAR2);
  PROCEDURE pr_inserta_solicitud(p_nro_sol          IN OUT sc_sol.nro_sol%TYPE,
                                 p_ape_sol          IN sc_sol.ape_sol%TYPE,
                                 p_nom_sol          IN sc_sol.nom_sol%TYPE,
                                 p_cliente          IN sc_sol.cliente%TYPE,
                                 p_cod_nacionalidad IN sc_sol.cod_nacionalidad%TYPE,
                                 p_tipo_personeria  IN sc_sol.tipo_personeria%TYPE,
                                 p_contribuyente    IN sc_sol.contribuyente%TYPE,
                                 p_nro_cedula_alfa  IN sc_sol.nro_cedula_alfa%TYPE,
                                 p_apodo            IN sc_sol.apodo%TYPE,
                                 p_tipo_doc         IN sc_sol.tipo_doc%TYPE,
                                 p_nro_doc          IN sc_sol.nro_doc%TYPE,
                                 p_nro_cedula       IN sc_sol.nro_cedula%TYPE,
                                 p_ruc_sol          IN sc_sol.ruc_sol%TYPE,
                                 p_ruc              IN OUT sc_sol.ruc%TYPE,
                                 p_ruc_dv           IN sc_sol.ruc_dv%TYPE,
                                 p_fec_nacimiento   IN sc_sol.fec_nacimiento%TYPE,
                                 p_estado_civil     IN sc_sol.estado_civil%TYPE,
                                 p_sexo             IN sc_sol.sexo%TYPE,
                                 p_correo           IN sc_sol.email%TYPE,
                                 p_id_telefono      IN OUT sc_sol.id_telefono%TYPE,
                                 p_cod_cliente      IN sc_sol.cod_cliente%TYPE,
                                 p_g_cod_sucursal   IN sc_sol.cod_suc_gestion%TYPE,
                                 p_g_usuario        IN sc_sol.usr_ult_act%TYPE,
                                 p_cod_telefonica   IN sc_telefono.cod_telefonica%TYPE,
                                 p_nro_telefono     IN sc_telefono.nro_telefono%TYPE,
                                 p_nro_soli         IN sc_det.nro_soli%TYPE,
                                 p_segundo_nro_tele IN VARCHAR2,
                                 p_actualizar       IN NUMBER,
                                 p_mensaje_error    OUT VARCHAR2);
  PROCEDURE pr_insert_telefonos(p_id_telefono    IN sc_telefono.id_telefono%TYPE,
                                p_cod_telefonica IN sc_telefono.cod_telefonica%TYPE,
                                p_nro_telefono   IN sc_telefono.nro_telefono%TYPE,
                                p_g_usuario      IN sc_telefono.usr_ult_act%TYPE,
                                p_fec_ult_act    IN sc_telefono.fec_ult_act%TYPE,
                                p_id_tel_seg     IN sc_telefono.id_telefono%TYPE,
                                p_cod_telef      IN sc_telefono.cod_telefonica%TYPE,
                                p_nro_telef      IN sc_telefono.nro_telefono%TYPE,
                                p_retorno_status OUT NUMBER,
                                p_mensaje_error  OUT VARCHAR2);
  PROCEDURE pr_sol01743(cod_vendedor        IN VARCHAR2,
                        tipo_personeria     IN VARCHAR2,
                        tipo_doc            IN VARCHAR2,
                        p_nro_doc           IN gv_contacto.nro_cedula%TYPE,
                        p_nro_cedula        IN gv_contacto.nro_cedula%TYPE,
                        p_nro_contacto      OUT gv_contacto.nro_contacto%TYPE,
                        p_w_cod_vendedor    OUT gv_contacto.cod_vendedor%TYPE,
                        p_cod_sucursal      OUT gv_contacto.cod_sucursal%TYPE,
                        p_w_vendedor        OUT vendedores.vendedor%TYPE,
                        p_cod_tipo_vendedor OUT vendedores.cod_tipo_vendedor%TYPE,
                        p_mensaje_error     OUT VARCHAR2);
  PROCEDURE pr_solicitud_enproceso(p_nro_sol       IN sc_det.nro_sol%TYPE,
                                   p_nro_soli      OUT sc.nro_soli%TYPE,
                                   p_estado_soli   OUT sc.estado_soli%TYPE,
                                   p_nro_pdp       OUT sc.nro_pdp%TYPE,
                                   p_mensaje_error OUT VARCHAR2,
                                   p_usr_ult_act   OUT sc_seguimiento.usr_ult_act%TYPE,
                                   p_fec_ult_act   OUT sc_seguimiento.fec_ult_act%TYPE);
  PROCEDURE pr_fecha_nacimiento(fecha_nacimiento_texto VARCHAR2,
                                fecha_nacimiento_date  DATE,
                                p_mensaje_error        OUT VARCHAR2);
  FUNCTION fn_calcular_dv_11_a(p_numero  IN VARCHAR2,
                               p_basemax IN NUMBER DEFAULT 11) RETURN NUMBER;
  /******************************formulario referencias personales **************/
  PROCEDURE pr_proc_incluir_ref(p_nro_soli          IN sc_rel_ref_personal.nro_soli%TYPE,
                                p_nro_sol_sol       IN sc_sol_ref_personal.nro_sol%TYPE,
                                p_ape_referente     IN sc_sol_ref_personal.ape_referente%TYPE,
                                p_nom_referente     IN sc_sol_ref_personal.nom_referente%TYPE,
                                p_nro_cedula        IN sc_sol_ref_personal.nro_cedula%TYPE,
                                p_cod_tipo_relacion IN sc_sol_ref_personal.cod_tipo_relacion%TYPE,
                                p_cod_telefonica    IN sc_telefono.cod_telefonica%TYPE,
                                p_nro_telefono      IN sc_telefono.nro_telefono%TYPE,
                                p_mensaje_error     OUT VARCHAR2);
  FUNCTION fn_obtiene_telefonos(p_id_telefono IN VARCHAR2,
                                p_nro_item    IN VARCHAR2) RETURN VARCHAR2;
  PROCEDURE pr_sol01737(p_nro_soli        IN OUT sc.nro_soli%TYPE,
                        p_nro_sol         IN OUT sc.nro_sol%TYPE,
                        p_tipo_personeria IN OUT sc_sol.tipo_personeria%TYPE,
                        p_cod_localidad   IN OUT sc_sol.cod_localidad%TYPE,
                        p_cod_barrio      IN OUT sc_sol.cod_barrio%TYPE,
                        p_domicilio       IN OUT sc_sol.domicilio%TYPE,
                        p_tipo_vivienda   IN OUT sc_sol.tipo_vivienda%TYPE,
                        p_croquis_hablado IN OUT sc_sol.croquis_hablado%TYPE,
                        p_nro_cedula      IN OUT persona.nro_cedula_id%TYPE,
                        p_ruc             IN OUT persona.ruc_persona%TYPE,
                        p_cod_sucursal    IN OUT NUMBER);
  /******************************formulario datos laborales **************/
  PROCEDURE pr_procesar_sol_trabajo(p_denominacion          IN sc_sol_trabajo.denominacion%TYPE,
                                    p_direccion             IN sc_sol_trabajo.direccion%TYPE,
                                    p_cod_actividad         IN sc_sol_trabajo.cod_actividad%TYPE,
                                    p_cod_ocupacion         IN sc_sol_trabajo.cod_ocupacion%TYPE,
                                    p_salario_ml            IN sc_sol_trabajo.salario_ml%TYPE,
                                    p_id_telefono           IN sc_telefono.id_telefono%TYPE,
                                    p_nro_telefono          IN sc_telefono.nro_telefono%TYPE,
                                    p_nro_telefono_opcional IN sc_telefono.nro_telefono%TYPE DEFAULT NULL,
                                    p_croquis_hablado       IN sc_sol_trabajo.croquis_hablado%TYPE DEFAULT NULL,
                                    p_nro_sol               IN sc_sol_trabajo.nro_sol%TYPE,
                                    p_nro_soli              IN sc_sol_trabajo.nro_soli%TYPE,
                                    p_nro_item              IN sc_sol_trabajo.nro_item%TYPE DEFAULT NULL);
  /***************** datos de credito************************/
  PROCEDURE solicitud_activa(p_nro_sol_sol         IN sc_det.nro_sol%TYPE,
                             p_cod_tipo_mercaderia IN sc_tipo_soli.cod_tipo_mercaderia%TYPE,
                             p_nro_soli            IN OUT sc.nro_soli%TYPE,
                             p_mensaje_error       OUT VARCHAR2);
  PROCEDURE pr_gestion_venta_cliente(p_cod_cliente             IN gestion_venta_cliente.cod_cliente%TYPE,
                                     p_periodo                 IN OUT gestion_venta_cliente.periodo%TYPE,
                                     p_estado_cliente          OUT gestion_venta_cliente.estado_cliente%TYPE,
                                     p_fase                    OUT gestion_venta_cliente.fase%TYPE,
                                     p_fase_inicial            OUT gestion_venta_cliente.fase_inicial%TYPE,
                                     p_tipo_comercio           IN OUT gestion_venta_cliente.tipo_comercio%TYPE,
                                     p_nro_cred_acti           OUT gestion_venta_cliente.nro_cred_acti%TYPE,
                                     p_nro_cuotas_pend         OUT gestion_venta_cliente.nro_cuotas_pend%TYPE,
                                     p_nro_cuotas_venc         OUT gestion_venta_cliente.nro_cuotas_venc%TYPE,
                                     p_nro_cuota_mayor         OUT gestion_venta_cliente.nro_cuota_mayor%TYPE,
                                     p_nro_dias_vencido        OUT gestion_venta_cliente.nro_dias_vencido%TYPE,
                                     p_nro_dias_vencido_actual OUT gestion_venta_cliente.nro_dias_vencido_actual%TYPE,
                                     p_cod_conducta            OUT gestion_venta_cliente.cod_conducta%TYPE,
                                     p_cod_tipo_mercaderia     IN OUT gestion_venta_cliente.cod_tipo_mercaderia%TYPE,
                                     p_fec_ult_vta             OUT gestion_venta_cliente.fec_ult_vta%TYPE,
                                     p_cod_vendedor_ult_vta    OUT gestion_venta_cliente.cod_vendedor_ult_vta%TYPE,
                                     p_cod_sucursal_vta        OUT gestion_venta_cliente.cod_sucursal_vta%TYPE,
                                     p_cod_region_venta        OUT gestion_venta_cliente.cod_region_venta%TYPE,
                                     p_cod_vendedor            OUT gestion_venta_cliente.cod_vendedor%TYPE,
                                     p_login                   OUT gestion_venta_cliente.login%TYPE,
                                     p_fec_ult_pago            OUT gestion_venta_cliente.fec_ult_pago%TYPE,
                                     p_ult_tipo_recibo         OUT gestion_venta_cliente.ult_tipo_recibo%TYPE,
                                     p_venta_periodo           OUT gestion_venta_cliente.venta_periodo%TYPE,
                                     p_cod_zona_cobranza       OUT gestion_venta_cliente.cod_zona_cobranza%TYPE,
                                     p_cod_subzona_cobranza    OUT gestion_venta_cliente.cod_subzona_cobranza%TYPE,
                                     p_cod_sucursal_plla       OUT gestion_venta_cliente.cod_sucursal_plla%TYPE,
                                     p_fec_planilla            OUT gestion_venta_cliente.fec_planilla%TYPE,
                                     p_nro_planilla            OUT gestion_venta_cliente.nro_planilla%TYPE,
                                     p_nro_item                OUT gestion_venta_cliente.nro_item%TYPE,
                                     p_cod_situ_ult            OUT gestion_venta_cliente.cod_situ_ult%TYPE,
                                     p_situacion               OUT gestion_venta_cliente.situacion%TYPE,
                                     p_fec_ult_situ            OUT gestion_venta_cliente.fec_ult_situ%TYPE,
                                     p_usr_ult_act             OUT gestion_venta_cliente.usr_ult_act%TYPE,
                                     p_fec_ult_act             OUT gestion_venta_cliente.fec_ult_act%TYPE,
                                     p_status                  OUT NUMBER,
                                     p_mensaje_error           OUT VARCHAR2);
  PROCEDURE pr_fase_de_venta(p_cod_cliente             IN OUT sc_sol.cod_cliente%TYPE,
                             p_nro_soli                IN sc_det.nro_soli%TYPE,
                             p_periodo                 IN OUT gestion_venta_cliente.periodo%TYPE,
                             p_estado_cliente          OUT gestion_venta_cliente.estado_cliente%TYPE,
                             p_fase_inicial            OUT gestion_venta_cliente.fase_inicial%TYPE,
                             p_tipo_comercio           IN OUT gestion_venta_cliente.tipo_comercio%TYPE,
                             p_nro_cred_acti           OUT gestion_venta_cliente.nro_cred_acti%TYPE,
                             p_nro_cuotas_pend         OUT gestion_venta_cliente.nro_cuotas_pend%TYPE,
                             p_nro_cuotas_venc         OUT gestion_venta_cliente.nro_cuotas_venc%TYPE,
                             p_nro_cuota_mayor         OUT gestion_venta_cliente.nro_cuota_mayor%TYPE,
                             p_nro_dias_vencido        OUT gestion_venta_cliente.nro_dias_vencido%TYPE,
                             p_nro_dias_vencido_actual OUT gestion_venta_cliente.nro_dias_vencido_actual%TYPE,
                             p_cod_conducta            OUT gestion_venta_cliente.cod_conducta%TYPE,
                             p_cod_tipo_mercaderia     IN OUT gestion_venta_cliente.cod_tipo_mercaderia%TYPE,
                             p_fec_ult_vta             OUT gestion_venta_cliente.fec_ult_vta%TYPE,
                             p_cod_vendedor_ult_vta    OUT gestion_venta_cliente.cod_vendedor_ult_vta%TYPE,
                             p_cod_sucursal_vta        OUT gestion_venta_cliente.cod_sucursal_vta%TYPE,
                             p_cod_region_venta        OUT gestion_venta_cliente.cod_region_venta%TYPE,
                             p_cod_vendedor            IN OUT gestion_venta_cliente.cod_vendedor%TYPE,
                             p_login                   OUT gestion_venta_cliente.login%TYPE,
                             p_fec_ult_pago            OUT gestion_venta_cliente.fec_ult_pago%TYPE,
                             p_ult_tipo_recibo         OUT gestion_venta_cliente.ult_tipo_recibo%TYPE,
                             p_venta_periodo           OUT gestion_venta_cliente.venta_periodo%TYPE,
                             p_cod_zona_cobranza       OUT gestion_venta_cliente.cod_zona_cobranza%TYPE,
                             p_cod_subzona_cobranza    OUT gestion_venta_cliente.cod_subzona_cobranza%TYPE,
                             p_cod_sucursal_plla       OUT gestion_venta_cliente.cod_sucursal_plla%TYPE,
                             p_fec_planilla            OUT gestion_venta_cliente.fec_planilla%TYPE,
                             p_nro_planilla            OUT gestion_venta_cliente.nro_planilla%TYPE,
                             p_nro_item                OUT gestion_venta_cliente.nro_item%TYPE,
                             p_cod_situ_ult            OUT gestion_venta_cliente.cod_situ_ult%TYPE,
                             p_situacion               OUT gestion_venta_cliente.situacion%TYPE,
                             p_fec_ult_situ            OUT gestion_venta_cliente.fec_ult_situ%TYPE,
                             p_usr_ult_act             OUT gestion_venta_cliente.usr_ult_act%TYPE,
                             p_fec_ult_act             OUT gestion_venta_cliente.fec_ult_act%TYPE,
                             p_mensaje_error           OUT VARCHAR2);
  PROCEDURE promo_cupon_banco_familiar(p_nro_sol_sol   IN sc_sol.nro_sol%TYPE,
                                       p_cod_tipo_soli IN sc.cod_tipo_soli%TYPE,
                                       p_nro_cedula    OUT sc_sol.nro_cedula%TYPE,
                                       p_nro_cupon_bf  OUT pg_cupon_banco_familiar.nro_cupon%TYPE,
                                       p_mensaje_error OUT VARCHAR2);
  PROCEDURE pr_validaciones_forma_pago(p_es_empleado_alex    IN NUMBER,
                                       p_forma_pago          IN sc.cod_forma_pago%TYPE,
                                       p_cod_tipo_soli       IN sc.cod_tipo_soli%TYPE,
                                       p_nro_soli            IN OUT sc.nro_soli%TYPE,
                                       p_w_cod_tipo_vendedor IN VARCHAR2,
                                       p_cod_origen_ges_crm  IN OUT VARCHAR2,
                                       p_cod_identificador   IN OUT VARCHAR2,
                                       p_w_cod_cliente       OUT VARCHAR2,
                                       p_mensaje_error       OUT VARCHAR2);
  PROCEDURE pr_insert_articulos(p_nro_soli      IN sc_articulo.nro_soli%TYPE,
                                p_cod_articulo  IN sc_articulo.cod_articulo%TYPE,
                                p_en_promo      IN sc_articulo.en_promo%TYPE DEFAULT 0,
                                p_nro_promo     IN sc_articulo.nro_promo%TYPE DEFAULT 0,
                                p_cantidad      IN sc_articulo.cantidad%TYPE,
                                p_mensaje_error OUT VARCHAR2);
  PROCEDURE pr_sol11863(p_cod_articulo    IN sc_detalle_cuotas.cod_articulo%TYPE,
                        p_nro_soli        IN sc_detalle_cuotas.nro_soli%TYPE,
                        p_cantidad        IN sc_detalle_cuotas.nro_soli%TYPE,
                        p_entrega_inicial IN sc_detalle_cuotas.monto_cuota%TYPE,
                        p_cant_cuotas_aux IN NUMBER,
                        p_precio_vta_unit IN NUMBER,
                        p_mensaje_error   OUT VARCHAR2);
  PROCEDURE pr_debito_auto_incl(p_nro_soli           IN sc_da.nro_soli%TYPE,
                                p_nro_sol_sol        IN sc_da.nro_sol%TYPE,
                                p_nro_cuenta         IN sc_da.nro_cuenta%TYPE,
                                p_nro_tarjeta_debito IN sc_da.nro_tarjeta_debito%TYPE,
                                p_nro_carnet         IN sc_da.nro_carnet%TYPE,
                                p_nro_orden_compra   IN sc_da.nro_orden_compra%TYPE,
                                p_debito_auto        IN NUMBER,
                                p_retorno            OUT NUMBER,
                                p_mensaje_error      OUT VARCHAR2);
  PROCEDURE pr_sgte_nro_soli(p_nro_soli      IN OUT NUMBER,
                             p_mensaje_error OUT VARCHAR2);
  PROCEDURE pr_proc_incluir(p_g_cod_vendedor  IN vendedores.cod_vendedor%TYPE,
                            p_nro_sol_sol     IN sc_sol.nro_sol%TYPE,
                            p_nro_soli        IN OUT sc_det.nro_soli%TYPE,
                            p_nro_sol_csol    IN sc_sol.nro_sol%TYPE,
                            p_g_fec_ingrid    IN sc.fec_soli%TYPE,
                            p_cod_sucursal    IN sc.cod_sucursal%TYPE,
                            p_cod_tipo_soli   IN sc.cod_tipo_soli%TYPE,
                            p_cod_forma_pago  IN sc.cod_forma_pago%TYPE,
                            p_ent_ini_soli    IN sc.ent_ini_soli%TYPE,
                            p_mon_cuota_soli  IN sc.mon_cuota_soli%TYPE,
                            p_mon_soli        IN sc.mon_soli%TYPE,
                            p_can_cuota_soli  IN sc.can_cuota_soli%TYPE,
                            p_nro_item_trab   IN sc_sol_trabajo.nro_item%TYPE,
                            p_cod_forma_vta_p IN sc.cod_forma_vta%TYPE,
                            p_id_carga_rapida IN NUMBER,
                            p_inserto         IN NUMBER,
                            p_mensaje_error   OUT VARCHAR2);
  PROCEDURE pr_proc_modificar(p_cod_tipo_soli  IN sc.cod_tipo_soli%TYPE,
                              p_dia_pago       IN sc.dia_pago%TYPE,
                              p_cod_forma_pago IN sc.cod_forma_pago%TYPE,
                              p_ent_ini_soli   IN sc.ent_ini_soli%TYPE,
                              p_mon_cuota_soli IN sc.mon_cuota_soli%TYPE,
                              p_mon_soli       IN sc.mon_soli%TYPE,
                              p_can_cuota_soli IN sc.can_cuota_soli%TYPE,
                              p_tipo_comercio  IN sc.tipo_comercio%TYPE,
                              p_con_garante    IN sc.con_garante%TYPE,
                              p_can_garante    IN sc.can_garante%TYPE,
                              p_cod_sucursal   IN sc.cod_sucursal%TYPE,
                              p_nro_soli       IN sc.nro_soli%TYPE,
                              p_inserto        IN NUMBER,
                              p_mensaje_error  OUT VARCHAR2);
  PROCEDURE pr_verifica_promos(p_g_fec_ingrid   IN promo_tipo_merc.fec_inicio%TYPE,
                               p_tipo_solicitud IN promo_tipo_merc.cod_tipo_soli_p%TYPE);
  PROCEDURE pr_solicitudes_en_proceso(p_estado_soli IN VARCHAR2 DEFAULT NULL);
  PROCEDURE pr_cargar_articulos(p_cod_tipo_mercaderia familias.cod_tipo_mercaderia%TYPE);
  PROCEDURE pr_enviar_mensaje(p_nro_soli     msi_mensaje.grupo_id%TYPE,
                              p_mensaje      msi_mensaje.mensaje%TYPE,
                              p_tipo_mensaje msi_mensaje.tipo_mensaje%TYPE);
  FUNCTION fn_sincronizar_chat(p_nro_soli msi_mensaje.grupo_id%TYPE)
    RETURN NUMBER;
  PROCEDURE pr_carga_conyuge(p_nro_soli IN sc_det.nro_soli%TYPE);
  PROCEDURE pr_carga_garante(p_nro_soli IN sc_det.nro_soli%TYPE);
  PROCEDURE pr_carga_conyuge_garante(p_nro_soli IN sc_det.nro_soli%TYPE);
  PROCEDURE pr_obtiene_ref_personales(p_nro_sol IN sc_sol_ref_personal.nro_sol%TYPE);
  PROCEDURE pr_obtiene_refe_personales(p_nro_sol  IN sc_sol_ref_personal.nro_sol%TYPE,
                                       p_nro_soli IN sc_sol_ref_personal.nro_sol%TYPE);
  FUNCTION fn_carga_promociones(p_message OUT VARCHAR2) RETURN BOOLEAN;
  FUNCTION fn_mensajes_no_leidos(p_grupo_id       msi_mensaje.grupo_id%TYPE,
                                 p_serial_install msi_mensaje_lectura.serial_instal%TYPE)
    RETURN NUMBER;
  FUNCTION fn_llamar_pdc(p_nro_soli     NUMBER,
                         p_nuevo_estado VARCHAR2,
                         p_observacion  VARCHAR2,
                         p_token        VARCHAR2,
                         p_message      OUT VARCHAR2) RETURN BOOLEAN;
  PROCEDURE pr_sol01511(p_nro_soli    IN NUMBER,
                        p_nro_sol     IN NUMBER,
                        p_enviar_link IN OUT VARCHAR2,
                        p_texto       IN VARCHAR2);
  PROCEDURE pr_sol01522(p_nro_soli      IN NUMBER,
                        p_nro_sol       IN NUMBER,
                        enviar_link     IN OUT VARCHAR2,
                        texto           IN VARCHAR2,
                        p_nro_documento OUT VARCHAR2);
  PROCEDURE pr_promo_limite_cred_validacion(p_cod_cliente     IN NUMBER,
                                            p_cuota_soli      IN NUMBER,
                                            p_cant_cuota_soli IN NUMBER,
                                            p_err_text        OUT VARCHAR2,
                                            p_en_promo        OUT NUMBER,
                                            p_id_cmd          OUT NUMBER,
                                            p_motivo          OUT VARCHAR2,
                                            p_status          OUT NUMBER);
  PROCEDURE pr_nat_clasif_cliente(p_cod_cliente           IN NUMBER,
                                  p_clasif_cliente        OUT VARCHAR2,
                                  p_nuevo_recurrente      IN OUT NUMBER,
                                  p_status                IN OUT NUMBER,
                                  p_g_cod_moneda_nacional IN OUT VARCHAR2,
                                  p_g_cod_moneda_ref      IN OUT VARCHAR2);
  PROCEDURE pr_deuda_total(p_cod_cliente           NUMBER,
                           p_deuda_cliente         IN OUT NUMBER,
                           p_cod_moneda            VARCHAR2,
                           p_g_status              OUT NUMBER,
                           p_g_cod_moneda_nacional VARCHAR2,
                           p_g_cod_moneda_ref      VARCHAR2);
  PROCEDURE pr_es_empleado_de_alex(p_nro_cedula       persona.nro_cedula_id%TYPE,
                                   p_es_empleado_alex OUT NUMBER);
  PROCEDURE pr_es_circuito_promo(p_promo       OUT NUMBER,
                                 p_cod_cliente IN NUMBER,
                                 p_mon_soli    IN NUMBER);
  PROCEDURE es_circuito_apro(p_circuito_apro OUT NUMBER,
                             p_cod_cliente   IN NUMBER);
  PROCEDURE pr_es_promo_pers(p_promo_pers OUT NUMBER, p_nro_soli IN NUMBER);
  PROCEDURE pr_app_event_cambio_est_soli(p_nro_soli IN INTEGER);
  PROCEDURE pr_solicitudes_en_procesos(p_estado_soli       IN VARCHAR2 DEFAULT NULL,
                                       p_periodo           IN VARCHAR2 DEFAULT NULL,
                                       p_cod_sucursal      IN NUMBER,
                                       p_cod_tipo_vendedor IN VARCHAR2);
  PROCEDURE pr_sol01737_ref(p_nro_soli        IN OUT sc.nro_soli%TYPE,
                            p_nro_sol         IN OUT sc.nro_sol%TYPE,
                            p_tipo_personeria IN OUT sc_sol.tipo_personeria%TYPE,
                            p_cod_localidad   IN OUT sc_sol.cod_localidad%TYPE,
                            p_cod_barrio      IN OUT sc_sol.cod_barrio%TYPE,
                            p_domicilio       IN OUT sc_sol.domicilio%TYPE,
                            p_tipo_vivienda   IN OUT sc_sol.tipo_vivienda%TYPE,
                            p_croquis_hablado IN OUT sc_sol.croquis_hablado%TYPE,
                            p_nro_cedula      IN OUT persona.nro_cedula_id%TYPE,
                            p_ruc             IN OUT persona.ruc_persona%TYPE);
  PROCEDURE pr_obtiene_cuota_max_vigente(p_cod_cliente       IN cm_scoring_mensual_ingrid.cod_cliente%TYPE,
                                         p_resultado_cm_disp OUT cm_scoring_mensual_ingrid.resultado_cm_disp%TYPE,
                                         p_periodo           OUT cm_scoring_mensual_ingrid.periodo%TYPE);
  FUNCTION fn_verifica_sucursal RETURN NUMBER;
  
  PROCEDURE pr_inserta_solicitud_conyuge(p_nro_sol          IN OUT sc_sol.nro_sol%TYPE,
                               p_ape_sol          IN sc_sol.ape_sol%TYPE,
                               p_nom_sol          IN sc_sol.nom_sol%TYPE,
                               p_cliente          IN sc_sol.cliente%TYPE,
                               p_cod_nacionalidad IN sc_sol.cod_nacionalidad%TYPE,
                               p_tipo_personeria  IN sc_sol.tipo_personeria%TYPE,
                               p_contribuyente    IN sc_sol.contribuyente%TYPE,
                               p_nro_cedula_alfa  IN sc_sol.nro_cedula_alfa%TYPE,
                               p_apodo            IN sc_sol.apodo%TYPE,
                               p_tipo_doc         IN sc_sol.tipo_doc%TYPE,
                               p_nro_doc          IN sc_sol.nro_doc%TYPE,
                               p_nro_cedula       IN sc_sol.nro_cedula%TYPE,
                               p_ruc_sol          IN sc_sol.ruc_sol%TYPE,
                               p_ruc              IN OUT sc_sol.ruc%TYPE,
                               p_ruc_dv           IN sc_sol.ruc_dv%TYPE,
                               p_fec_nacimiento   IN sc_sol.fec_nacimiento%TYPE,
                               p_estado_civil     IN sc_sol.estado_civil%TYPE,
                               p_sexo             IN sc_sol.sexo%TYPE,
                               p_correo           IN sc_sol.email%TYPE,
                               p_id_telefono      IN OUT sc_sol.id_telefono%TYPE,
                               p_cod_cliente      IN sc_sol.cod_cliente%TYPE,
                               p_g_cod_sucursal   IN sc_sol.cod_suc_gestion%TYPE,
                               p_g_usuario        IN sc_sol.usr_ult_act%TYPE,
                               p_cod_telefonica   IN sc_telefono.cod_telefonica%TYPE,
                               p_nro_telefono     IN sc_telefono.nro_telefono%TYPE,
                               p_nro_soli         IN sc_det.nro_soli%TYPE,
                               p_segundo_nro_tele IN VARCHAR2,
                               p_actualizar       IN NUMBER,
                               p_mensaje_error    OUT VARCHAR2);
                               
PROCEDURE pr_inserta_solicitud_garante(p_nro_sol          IN OUT sc_sol.nro_sol%TYPE,
                               p_ape_sol          IN sc_sol.ape_sol%TYPE,
                               p_nom_sol          IN sc_sol.nom_sol%TYPE,
                               p_cliente          IN sc_sol.cliente%TYPE,
                               p_cod_nacionalidad IN sc_sol.cod_nacionalidad%TYPE,
                               p_tipo_personeria  IN sc_sol.tipo_personeria%TYPE,
                               p_contribuyente    IN sc_sol.contribuyente%TYPE,
                               p_nro_cedula_alfa  IN sc_sol.nro_cedula_alfa%TYPE,
                               p_apodo            IN sc_sol.apodo%TYPE,
                               p_tipo_doc         IN sc_sol.tipo_doc%TYPE,
                               p_nro_doc          IN sc_sol.nro_doc%TYPE,
                               p_nro_cedula       IN sc_sol.nro_cedula%TYPE,
                               p_ruc_sol          IN sc_sol.ruc_sol%TYPE,
                               p_ruc              IN OUT sc_sol.ruc%TYPE,
                               p_ruc_dv           IN sc_sol.ruc_dv%TYPE,
                               p_fec_nacimiento   IN sc_sol.fec_nacimiento%TYPE,
                               p_estado_civil     IN sc_sol.estado_civil%TYPE,
                               p_sexo             IN sc_sol.sexo%TYPE,
                               p_correo           IN sc_sol.email%TYPE,
                               p_id_telefono      IN OUT sc_sol.id_telefono%TYPE,
                               p_cod_cliente      IN sc_sol.cod_cliente%TYPE,
                               p_g_cod_sucursal   IN sc_sol.cod_suc_gestion%TYPE,
                               p_g_usuario        IN sc_sol.usr_ult_act%TYPE,
                               p_cod_telefonica   IN sc_telefono.cod_telefonica%TYPE,
                               p_nro_telefono     IN sc_telefono.nro_telefono%TYPE,
                               p_nro_soli         IN sc_det.nro_soli%TYPE,
                               p_segundo_nro_tele IN VARCHAR2,
                               p_actualizar       IN NUMBER,
                               p_mensaje_error    OUT VARCHAR2);
                               
                               
                               
 PROCEDURE pr_inserta_solicitud_conyu_garante(p_nro_sol          IN OUT sc_sol.nro_sol%TYPE,
                               p_ape_sol          IN sc_sol.ape_sol%TYPE,
                               p_nom_sol          IN sc_sol.nom_sol%TYPE,
                               p_cliente          IN sc_sol.cliente%TYPE,
                               p_cod_nacionalidad IN sc_sol.cod_nacionalidad%TYPE,
                               p_tipo_personeria  IN sc_sol.tipo_personeria%TYPE,
                               p_contribuyente    IN sc_sol.contribuyente%TYPE,
                               p_nro_cedula_alfa  IN sc_sol.nro_cedula_alfa%TYPE,
                               p_apodo            IN sc_sol.apodo%TYPE,
                               p_tipo_doc         IN sc_sol.tipo_doc%TYPE,
                               p_nro_doc          IN sc_sol.nro_doc%TYPE,
                               p_nro_cedula       IN sc_sol.nro_cedula%TYPE,
                               p_ruc_sol          IN sc_sol.ruc_sol%TYPE,
                               p_ruc              IN OUT sc_sol.ruc%TYPE,
                               p_ruc_dv           IN sc_sol.ruc_dv%TYPE,
                               p_fec_nacimiento   IN sc_sol.fec_nacimiento%TYPE,
                               p_estado_civil     IN sc_sol.estado_civil%TYPE,
                               p_sexo             IN sc_sol.sexo%TYPE,
                               p_correo           IN sc_sol.email%TYPE,
                               p_id_telefono      IN OUT sc_sol.id_telefono%TYPE,
                               p_cod_cliente      IN sc_sol.cod_cliente%TYPE,
                               p_g_cod_sucursal   IN sc_sol.cod_suc_gestion%TYPE,
                               p_g_usuario        IN sc_sol.usr_ult_act%TYPE,
                               p_cod_telefonica   IN sc_telefono.cod_telefonica%TYPE,
                               p_nro_telefono     IN sc_telefono.nro_telefono%TYPE,
                               p_nro_soli         IN sc_det.nro_soli%TYPE,
                               p_segundo_nro_tele IN VARCHAR2,
                               p_actualizar       IN NUMBER,
                               p_mensaje_error    OUT VARCHAR2);
END pkg_solicitud_creditos;
/
create or replace PACKAGE BODY pkg_solicitud_creditos IS
g_nro_soli          sc.nro_soli%TYPE;
g_w_nro_soli        sc.nro_soli%TYPE;
g_barrio            barrio.barrio%TYPE;
g_nro_sol           sc_sol.nro_sol%TYPE;
g_cod_localidad     sc_sol.cod_localidad%TYPE;
g_cod_barrio        sc_sol.cod_barrio%TYPE;
g_domicilio         sc_sol.domicilio%TYPE;
g_tipo_vivienda     sc_sol.tipo_vivienda%TYPE;
g_croquis_hablado   sc_sol.croquis_hablado%TYPE;
g_nro_cedula        persona.nro_cedula_id%TYPE;
g_ruc               persona.ruc_persona%TYPE;
g_nro_ruc           persona.nro_cedula_id%TYPE;
g_tipo_personeria   sc_sol.tipo_personeria%TYPE;
g_es_empleado_alex  NUMBER := 0;
g_obs               sc_det.obs_estado%TYPE;
g_cod_vendedor      sc.cod_vendedor%TYPE;
g_nro_contacto      gv_contacto.nro_contacto%TYPE := 0;
g_w_cod_vendedor    gv_contacto.cod_vendedor%TYPE;
g_cod_sucursal      gv_contacto.cod_sucursal%TYPE;
g_w_vendedor        vendedores.vendedor%TYPE;
g_cod_tipo_vendedor vendedores.cod_tipo_vendedor%TYPE;
g_cod_resultado     INTEGER;
g_resultado         VARCHAR2(100);
g_vencido           INTEGER;
g_cod_identificador VARCHAR2(255) := 'INGRID';
PROCEDURE pr_devuelve_solicitante(p_nro_doc            IN sc_sol.nro_doc%TYPE,
                                  p_tipo_doc           IN sc_sol.tipo_doc%TYPE,
                                  p_nro_sol            OUT sc_sol.nro_sol%TYPE,
                                  p_ape_sol            OUT sc_sol.ape_sol%TYPE,
                                  p_nom_sol            OUT sc_sol.nom_sol%TYPE,
                                  p_cliente            OUT sc_sol.cliente%TYPE,
                                  p_cod_nacionalidad   OUT rua_nacionalidad.cod_nacionalidad%TYPE,
                                  p_nacionalidad       OUT rua_nacionalidad.nacionalidad%TYPE,
                                  p_tipo_personeria    OUT sc_sol.tipo_personeria%TYPE,
                                  p_contribuyente      OUT sc_sol.contribuyente%TYPE,
                                  p_nro_cedula_alfa    OUT sc_sol.nro_cedula_alfa%TYPE,
                                  p_apodo              OUT sc_sol.apodo%TYPE,
                                  p_nro_cedula         OUT sc_sol.nro_cedula%TYPE,
                                  p_ruc_sol            OUT sc_sol.ruc_sol%TYPE,
                                  p_ruc                OUT sc_sol.ruc%TYPE,
                                  p_ruc_dv             OUT sc_sol.ruc_dv%TYPE,
                                  p_fec_nacimiento     OUT sc_sol.fec_nacimiento%TYPE,
                                  p_estado_civil       OUT sc_sol.estado_civil%TYPE,
                                  p_sexo               OUT sc_sol.sexo%TYPE,
                                  p_id_telefono        OUT sc_sol.id_telefono%TYPE,
                                  p_cod_cliente        OUT sc_sol.cod_cliente%TYPE,
                                  p_w_cliente          OUT clientes.cliente%TYPE,
                                  p_cod_tipo_cliente   OUT clientes.cod_tipo_cliente%TYPE,
                                  p_sc_sol_activo      OUT sc_sol.activo%TYPE,
                                  p_correo             OUT clientes.email_facturacion_electronica%TYPE,
                                  p_cod_estado_cliente OUT clientes_estado.cod_estado_cliente%TYPE,
                                  p_mensaje_error      OUT VARCHAR2) IS
  g_rows    NUMBER := 0;
  v_nro_doc sc_sol.nro_doc%TYPE := p_nro_doc;
BEGIN
  BEGIN
    SELECT a.nro_sol AS nro_sol,
           a.ape_sol AS ape_sol,
           a.nom_sol AS nom_sol,
           a.cliente AS cliente,
           a.cod_nacionalidad AS cod_nacionalidad,
           b.nacionalidad AS nacionalidad,
           a.tipo_personeria p_tipo_personeria,
           CASE
             WHEN a.contribuyente = -1 THEN
              (0)
             ELSE
              a.contribuyente
           END AS contribuyente,
           nvl(a.nro_cedula_alfa, '') AS nro_cedula_alfa,
           nvl(a.apodo, '') AS apodo,
           a.nro_cedula AS nro_cedula,
           a.ruc_sol AS ruc_sol,
           a.ruc AS ruc,
           a.ruc_dv AS ruc_dv,
           a.fec_nacimiento AS fec_nacimiento,
           a.estado_civil estado_civil,
           a.sexo sexo,
           a.id_telefono AS id_telefono,
           a.cod_cliente AS cod_cliente,
           c.cliente AS p_w_cliente,
           c.cod_tipo_cliente AS cod_tipo_cliente,
           a.activo AS sc_sol_activo,
           NULL correo,
           10 correo
      INTO p_nro_sol,
           p_ape_sol,
           p_nom_sol,
           p_cliente,
           p_cod_nacionalidad,
           p_nacionalidad,
           p_tipo_personeria,
           p_contribuyente,
           p_nro_cedula_alfa,
           p_apodo,
           p_nro_cedula,
           p_ruc_sol,
           p_ruc,
           p_ruc_dv,
           p_fec_nacimiento,
           p_estado_civil,
           p_sexo,
           p_id_telefono,
           p_cod_cliente,
           p_w_cliente,
           p_cod_tipo_cliente,
           p_sc_sol_activo,
           p_correo,
           g_rows
      FROM sc_sol a, rua_nacionalidad b, clientes c
     WHERE TRIM(a.nro_doc) = TRIM(v_nro_doc)
       AND TRIM(a.tipo_doc) = TRIM(p_tipo_doc)
       AND a.cod_nacionalidad = b.cod_nacionalidad
       AND a.cod_cliente = c.cod_cliente
     ORDER BY 23 DESC;
    COMMIT;
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      p_mensaje_error := 'Error al verificar solicitante...' || SQLERRM;
      raise_application_error(-20001, p_mensaje_error);
  END;
  IF g_rows > 0 THEN
    IF p_cod_tipo_cliente = 'RECU' AND p_cod_cliente > 0 THEN
      p_mensaje_error := '0.No es posible crear la solicitud. Este cliente cuenta con articulos recuperados...';
      raise_application_error(-20001, p_mensaje_error);
    END IF;
    IF p_sc_sol_activo = 0 THEN
      p_mensaje_error := 'Verifique, No es posible continuar, Solicitante INACTIVO...';
      raise_application_error(-20001, p_mensaje_error);
    END IF;
    IF p_contribuyente = -1 THEN
      p_contribuyente := 0;
    END IF;
  END IF;
  IF p_cod_cliente > 0 THEN
    BEGIN
      SELECT cod_estado_cliente AS cod_estado_cliente
        INTO p_cod_estado_cliente
        FROM clientes_estado
       WHERE cod_cliente = p_cod_cliente;
    EXCEPTION
      WHEN OTHERS THEN
        p_mensaje_error := 'Error al seleccionar estado del cliente...';
        raise_application_error(-20001, p_mensaje_error);
    END;
    IF g_rows < 1 THEN
      p_mensaje_error := 'No se selecciono estado del cliente ' ||
                         p_cod_cliente;
      raise_application_error(-20001, p_mensaje_error);
    END IF;
    IF p_cod_estado_cliente = 'INCOBRABLE' OR
       p_cod_estado_cliente = 'JUDICIAL' OR
       p_cod_estado_cliente = 'INHIBIDO' OR
       p_cod_estado_cliente = 'VENDIDO' THEN
      p_mensaje_error := 'No puede generar una solicitud de credito ' ||
                         ' para un cliente en estado: ' ||
                         p_cod_estado_cliente;
      raise_application_error(-20001, p_mensaje_error);
    END IF;
  END IF;
END;
PROCEDURE pr_inserta_solicitud(p_nro_sol          IN OUT sc_sol.nro_sol%TYPE,
                               p_ape_sol          IN sc_sol.ape_sol%TYPE,
                               p_nom_sol          IN sc_sol.nom_sol%TYPE,
                               p_cliente          IN sc_sol.cliente%TYPE,
                               p_cod_nacionalidad IN sc_sol.cod_nacionalidad%TYPE,
                               p_tipo_personeria  IN sc_sol.tipo_personeria%TYPE,
                               p_contribuyente    IN sc_sol.contribuyente%TYPE,
                               p_nro_cedula_alfa  IN sc_sol.nro_cedula_alfa%TYPE,
                               p_apodo            IN sc_sol.apodo%TYPE,
                               p_tipo_doc         IN sc_sol.tipo_doc%TYPE,
                               p_nro_doc          IN sc_sol.nro_doc%TYPE,
                               p_nro_cedula       IN sc_sol.nro_cedula%TYPE,
                               p_ruc_sol          IN sc_sol.ruc_sol%TYPE,
                               p_ruc              IN OUT sc_sol.ruc%TYPE,
                               p_ruc_dv           IN sc_sol.ruc_dv%TYPE,
                               p_fec_nacimiento   IN sc_sol.fec_nacimiento%TYPE,
                               p_estado_civil     IN sc_sol.estado_civil%TYPE,
                               p_sexo             IN sc_sol.sexo%TYPE,
                               p_correo           IN sc_sol.email%TYPE,
                               p_id_telefono      IN OUT sc_sol.id_telefono%TYPE,
                               p_cod_cliente      IN sc_sol.cod_cliente%TYPE,
                               p_g_cod_sucursal   IN sc_sol.cod_suc_gestion%TYPE,
                               p_g_usuario        IN sc_sol.usr_ult_act%TYPE,
                               p_cod_telefonica   IN sc_telefono.cod_telefonica%TYPE,
                               p_nro_telefono     IN sc_telefono.nro_telefono%TYPE,
                               p_nro_soli         IN sc_det.nro_soli%TYPE,
                               p_segundo_nro_tele IN VARCHAR2,
                               p_actualizar       IN NUMBER,
                               p_mensaje_error    OUT VARCHAR2) IS
  v_retorno_status   NUMBER := 0;
  l_intento          NUMBER := 0;
  v_fecha_nacimiento sc_sol.fec_nacimiento%TYPE := to_date(p_fec_nacimiento,
                                                           'dd/mm/yyyy');
  v_fec_ult_act      sc_sol.fec_ult_act%TYPE := current_date;
  v_fec_ref          sc_sol.fec_ult_act%TYPE := current_date;
  v_cliente          sc_sol.cliente%TYPE;
  v_cedula           sc_sol.nro_cedula%TYPE;
  v_nro_cedula_alfa  sc_sol.nro_cedula_alfa%TYPE;
  v_apodo            VARCHAR2(300);
  v_contador_tel     NUMBER;
  v_id_telef_seg     sc_sol.id_telefono%TYPE;
  v_cod_telef_seg    sc_telefono.cod_telefonica%TYPE;
  v_nro_telef_seg    sc_telefono.nro_telefono%TYPE;
  v_prefijo_seg      VARCHAR2(10);
BEGIN
  
  v_contador_tel := length(p_segundo_nro_tele);
  IF v_contador_tel = 9 THEN
    v_prefijo_seg   := substr(p_segundo_nro_tele, 1, 3);
    v_nro_telef_seg := substr(p_segundo_nro_tele, 4);
  ELSIF v_contador_tel = 8 THEN
    v_prefijo_seg   := '0' || substr(p_segundo_nro_tele, 0, 2);
    v_nro_telef_seg := p_segundo_nro_tele;
  END IF;
  IF v_prefijo_seg <> '021' THEN
    BEGIN
      SELECT cod_telefonica
        INTO v_cod_telef_seg
        FROM sc_telefonica
       WHERE prefijo = v_prefijo_seg;
    EXCEPTION
      WHEN no_data_found THEN
        ROLLBACK;
        raise_application_error(-20001, 'Favor verificar cod_telefono');
    END;
  ELSE
    v_cod_telef_seg := '--';
  END IF;
  
  IF p_actualizar = 0 THEN
    --raise_application_error(-20001, 'llegue');
    --  begin
    l_intento := 0;
    
    BEGIN
      UPDATE sc_control
         SET ult_nro_sol     = ult_nro_sol + 1,
             ult_id_telefono = ult_id_telefono + 1
       WHERE dummy_key = 1;
    EXCEPTION
      WHEN OTHERS THEN
        ROLLBACK;
        p_mensaje_error := 'Error al actualizar nro.de solicitud...';
        raise_application_error(-20001, p_mensaje_error);
    END;
    
    BEGIN
      SELECT ult_nro_sol, ult_id_telefono
        INTO p_nro_sol, p_id_telefono
        FROM sc_control
       WHERE dummy_key = 1;
    EXCEPTION
      WHEN no_data_found THEN
        ROLLBACK;
      WHEN OTHERS THEN
        ROLLBACK;
        p_mensaje_error := 'Error al seleccionar nro. de solicitud...';
        raise_application_error(-20001, p_mensaje_error);
    END;
    
    BEGIN
      v_apodo := nvl(p_apodo, '-');
      
      IF p_tipo_doc = 'CIP' THEN
        v_cedula := p_nro_cedula;
      ELSE
        v_cedula          := p_nro_cedula;
        v_nro_cedula_alfa := p_nro_cedula;
      END IF;
      
      p_ruc             := v_cedula;
      v_nro_cedula_alfa := nvl(p_nro_cedula_alfa, v_cedula);
      INSERT INTO sc_sol
        (nro_sol,
         ape_sol,
         nom_sol,
         cliente,
         cod_nacionalidad,
         tipo_personeria,
         contribuyente,
         nro_cedula_alfa,
         apodo,
         tipo_doc,
         nro_doc,
         nro_cedula,
         cod_req_iden,
         req_iden,
         ruc_sol,
         ruc,
         ruc_dv,
         fec_nacimiento,
         estado_civil,
         sexo,
         email,
         id_telefono,
         domicilio,
         barrio,
         cod_barrio,
         cod_localidad,
         referencia_domicilio,
         cod_req_domi,
         req_domi,
         croquis_hablado,
         tipo_vivienda,
         locador,
         id_telefono_locador,
         nro_ult_soli,
         cod_cliente,
         cod_faja,
         fec_refe,
         cod_suc_gestion,
         fec_ult_act,
         usr_ult_act,
         activo,
         cod_zona_cobranza)
      VALUES
        (p_nro_sol,
         p_ape_sol,
         p_nom_sol,
         p_cliente,
         p_cod_nacionalidad,
         p_tipo_personeria,
         p_contribuyente,
         v_nro_cedula_alfa,
         v_apodo,
         p_tipo_doc,
         p_nro_doc,
         v_cedula,
         '--',
         'N/A',
         p_ruc_sol,
         p_ruc,
         p_ruc_dv,
         v_fecha_nacimiento,
         p_estado_civil,
         p_sexo,
         p_correo,
         p_id_telefono,
         '-',
         '-',
         '--',
         0,
         '-',
         '--',
         'N/A',
         '-',
         '-',
         '-',
         0,
         0,
         p_cod_cliente,
         '-',
         v_fec_ref,
         p_g_cod_sucursal,
         v_fec_ult_act,
         p_g_usuario,
         1,
         0);
      COMMIT;
    EXCEPTION
      WHEN OTHERS THEN
        ROLLBACK;
        p_mensaje_error := 'Error al registrar nuevo solicitante.' ||
                           SQLERRM;
        raise_application_error(-20001, p_mensaje_error || SQLERRM);
    END;
    BEGIN
      pr_insert_telefonos(p_id_telefono    => p_id_telefono,
                          p_cod_telefonica => p_cod_telefonica,
                          p_nro_telefono   => p_nro_telefono,
                          p_g_usuario      => p_g_usuario,
                          p_fec_ult_act    => v_fec_ult_act,
                          p_id_tel_seg     => v_id_telef_seg,
                          p_cod_telef      => v_cod_telef_seg,
                          p_nro_telef      => v_nro_telef_seg,
                          p_retorno_status => v_retorno_status,
                          p_mensaje_error  => p_mensaje_error);
    EXCEPTION
      WHEN OTHERS THEN
        ROLLBACK;
        raise_application_error(-20001,
                                'Error en la llamada al pr_insert_telefonos ' ||
                                SQLERRM);
    END;
    IF NOT (p_estado_civil = 'CASADO' OR p_estado_civil = 'PAREJA') THEN
      BEGIN
        DELETE FROM sc_det
         WHERE nro_soli = p_nro_soli
           AND tipo_sol = 'CSOL';
        COMMIT;
      EXCEPTION
        WHEN OTHERS THEN
          ROLLBACK;
          p_mensaje_error := 'Error al limpiar detalle solicitud: ';
          raise_application_error(-20001, p_mensaje_error || SQLERRM);
      END;
    END IF;
    --exception
    ---   when others then
    --     rollback;
    --  raise_application_error(-20001, 'Error ' || sqlerrm);
    
    --  end;
  ELSIF p_actualizar = 1 THEN
    BEGIN
      pr_insert_telefonos(p_id_telefono    => p_id_telefono,
                          p_cod_telefonica => p_cod_telefonica,
                          p_nro_telefono   => p_nro_telefono,
                          p_g_usuario      => p_g_usuario,
                          p_fec_ult_act    => v_fec_ult_act,
                          p_id_tel_seg     => v_id_telef_seg,
                          p_cod_telef      => v_cod_telef_seg,
                          p_nro_telef      => v_nro_telef_seg,
                          p_retorno_status => v_retorno_status,
                          p_mensaje_error  => p_mensaje_error);
      
      p_ruc := p_nro_cedula;
      
      UPDATE sc_sol
         SET ape_sol          = p_ape_sol,
             nom_sol          = p_nom_sol,
             cliente          = p_cliente,
             cod_nacionalidad = p_cod_nacionalidad,
             tipo_personeria  = p_tipo_personeria,
             contribuyente    = p_contribuyente,
             nro_cedula_alfa  = p_nro_cedula_alfa,
             apodo            = v_apodo,
             tipo_doc         = p_tipo_doc,
             nro_doc          = p_nro_doc,
             nro_cedula       = p_nro_cedula,
             ruc_sol          = p_ruc_sol,
             ruc              = p_ruc,
             ruc_dv           = p_ruc_dv,
             fec_nacimiento   = v_fecha_nacimiento,
             estado_civil     = p_estado_civil,
             sexo             = p_sexo,
             id_telefono      = p_id_telefono,
             cod_cliente      = p_cod_cliente,
             email            = p_correo, /*** vrojas 09.05.2023 ***/
             fec_ult_act      = v_fec_ult_act,
             usr_ult_act      = p_g_usuario
       WHERE nro_sol = p_nro_sol;
      COMMIT;
    EXCEPTION
      WHEN OTHERS THEN
        ROLLBACK;
        p_mensaje_error := 'Error al actualizar datos del solicitante. ' ||
                           SQLERRM;
        raise_application_error(-20001, p_mensaje_error, TRUE);
    END;
  END IF;
  COMMIT;
EXCEPTION
  WHEN OTHERS THEN
    ROLLBACK;
    raise_application_error(-20001, p_mensaje_error);
END;
PROCEDURE pr_insert_telefonos(p_id_telefono    IN sc_telefono.id_telefono%TYPE,
                              p_cod_telefonica IN sc_telefono.cod_telefonica%TYPE,
                              p_nro_telefono   IN sc_telefono.nro_telefono%TYPE,
                              p_g_usuario      IN sc_telefono.usr_ult_act%TYPE,
                              p_fec_ult_act    IN sc_telefono.fec_ult_act%TYPE,
                              p_id_tel_seg     IN sc_telefono.id_telefono%TYPE,
                              p_cod_telef      IN sc_telefono.cod_telefonica%TYPE,
                              p_nro_telef      IN sc_telefono.nro_telefono%TYPE,
                              p_retorno_status OUT NUMBER,
                              p_mensaje_error  OUT VARCHAR2) IS
  v_lconta NUMBER := 0;
BEGIN
  IF p_cod_telef IS NOT NULL AND p_nro_telef IS NOT NULL THEN
    BEGIN
      DELETE FROM sc_telefono
       WHERE id_telefono = p_id_telefono
         AND nro_item = 2;
      COMMIT;
    EXCEPTION
      WHEN OTHERS THEN
        ROLLBACK;
        p_retorno_status := 1;
        p_mensaje_error  := 'Error al eliminar nro.de telefonos...';
    END;
    v_lconta := 1;
    BEGIN
      v_lconta := v_lconta + 1;
      BEGIN
        INSERT INTO sc_telefono
          (cod_telefonica,
           nro_item,
           activo_msn,
           activo,
           tabla_origen,
           ultimo_intento,
           usr_ult_act,
           fec_ult_act,
           id_telefono,
           nro_telefono,
           ultimo_contacto,
           email_telefono)
        VALUES
          (p_cod_telef,
           v_lconta,
           1,
           1,
           'sc_sol',
           0,
           p_g_usuario,
           p_fec_ult_act,
           p_id_telefono,
           p_nro_telef,
           0,
           '-');
      EXCEPTION
        WHEN OTHERS THEN
          ROLLBACK;
          raise_application_error(-20001,
                                  'Error, al grabar telefonos...' ||
                                  SQLERRM,
                                  TRUE);
      END;
    END;
  END IF;
  BEGIN
    DELETE FROM sc_telefono
     WHERE id_telefono = p_id_telefono
       AND nro_item = 1;
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      p_retorno_status := 1;
      p_mensaje_error  := 'Error al eliminar nro.de telefonos...';
  END;
  v_lconta := 0;
  BEGIN
    v_lconta := v_lconta + 1;
    BEGIN
      INSERT INTO sc_telefono
        (cod_telefonica,
         nro_item,
         activo_msn,
         activo,
         tabla_origen,
         ultimo_intento,
         usr_ult_act,
         fec_ult_act,
         id_telefono,
         nro_telefono,
         ultimo_contacto,
         email_telefono)
      VALUES
        (p_cod_telefonica,
         v_lconta,
         1,
         1,
         'sc_sol',
         0,
         p_g_usuario,
         p_fec_ult_act,
         p_id_telefono,
         p_nro_telefono,
         0,
         '-');
      COMMIT;
    EXCEPTION
      WHEN OTHERS THEN
        ROLLBACK;
        raise_application_error(-20001,
                                'Error, al grabar telefonos...' ||
                                SQLERRM,
                                TRUE);
    END;
  END;
  COMMIT;
END;
PROCEDURE pr_sol01743(cod_vendedor        IN VARCHAR2,
                      tipo_personeria     IN VARCHAR2,
                      tipo_doc            IN VARCHAR2,
                      p_nro_doc           IN gv_contacto.nro_cedula%TYPE,
                      p_nro_cedula        IN gv_contacto.nro_cedula%TYPE,
                      p_nro_contacto      OUT gv_contacto.nro_contacto%TYPE,
                      p_w_cod_vendedor    OUT gv_contacto.cod_vendedor%TYPE,
                      p_cod_sucursal      OUT gv_contacto.cod_sucursal%TYPE,
                      p_w_vendedor        OUT vendedores.vendedor%TYPE,
                      p_cod_tipo_vendedor OUT vendedores.cod_tipo_vendedor%TYPE,
                      p_mensaje_error     OUT VARCHAR2) IS
  v_nro_cedula NUMBER := 0;
BEGIN
  pkg_ic.inicializar;
  
  IF tipo_doc = 'CIP' OR tipo_doc = 'DNI' OR tipo_doc = 'RG' THEN
    NULL;
  ELSIF tipo_doc = 'PASA' THEN
    v_nro_cedula := p_nro_doc;
  END IF;
  
  IF tipo_personeria = 'F' AND tipo_doc = 'CIP' THEN
    /*verifica si el contacto ya existe y si su vend.esta activo*/
    BEGIN
      SELECT a.nro_contacto,
             a.cod_vendedor,
             a.cod_sucursal,
             b.vendedor,
             b.cod_tipo_vendedor
        INTO p_nro_contacto,
             p_w_cod_vendedor,
             p_cod_sucursal,
             p_w_vendedor,
             p_cod_tipo_vendedor
        FROM gv_contacto a, vendedores b
       WHERE a.nro_cedula = p_nro_cedula
         AND a.estado_contacto IN ('PEND', 'ACTI', 'SOLI', 'AV', 'AS')
         AND a.cod_vendedor = b.cod_vendedor
         AND b.vend_activo = 1
         AND rownum = 1;
      COMMIT;
    EXCEPTION
      WHEN no_data_found THEN
        p_nro_contacto      := NULL;
        p_w_cod_vendedor    := NULL;
        p_cod_sucursal      := NULL;
        p_w_vendedor        := NULL;
        p_cod_tipo_vendedor := NULL;
        ROLLBACK;
      WHEN OTHERS THEN
        ROLLBACK;
        p_mensaje_error := 'Error al Verificar si ya Existe el Contacto...' ||
                           SQLERRM;
        raise_application_error(-20001, p_mensaje_error);
    END;
  ELSIF tipo_personeria = 'J' THEN
    BEGIN
      SELECT a.nro_contacto,
             a.cod_vendedor,
             a.cod_sucursal,
             b.vendedor,
             b.cod_tipo_vendedor
        INTO p_nro_contacto,
             p_w_cod_vendedor,
             p_cod_sucursal,
             p_w_vendedor,
             p_cod_tipo_vendedor
        FROM gv_contacto a, vendedores b
       WHERE a.nro_cedula = p_nro_doc
         AND a.estado_contacto IN ('PEND', 'ACTI', 'SOLI', 'AV', 'AS')
         AND a.cod_vendedor = b.cod_vendedor
         AND b.cod_tipo_vendedor != 'TSV'
         AND b.vend_activo = 1
         AND rownum = 1;
      COMMIT;
    EXCEPTION
      WHEN no_data_found THEN
        p_nro_contacto      := NULL;
        p_w_cod_vendedor    := NULL;
        p_cod_sucursal      := NULL;
        p_w_vendedor        := NULL;
        p_cod_tipo_vendedor := NULL;
        ROLLBACK;
      WHEN OTHERS THEN
        ROLLBACK;
        p_mensaje_error := 'Error al Verificar si ya Existe el Contacto...';
        raise_application_error(-20001, p_mensaje_error);
    END;
  END IF;
  p_cod_tipo_vendedor := pkg_ic.g_cod_tipo_vendedor;
EXCEPTION
  WHEN OTHERS THEN
    ROLLBACK;
    raise_application_error(-20001, p_mensaje_error);
END;
PROCEDURE pr_solicitud_enproceso(p_nro_sol       IN sc_det.nro_sol%TYPE,
                                 p_nro_soli      OUT sc.nro_soli%TYPE,
                                 p_estado_soli   OUT sc.estado_soli%TYPE,
                                 p_nro_pdp       OUT sc.nro_pdp%TYPE,
                                 p_mensaje_error OUT VARCHAR2,
                                 p_usr_ult_act   OUT sc_seguimiento.usr_ult_act%TYPE,
                                 p_fec_ult_act   OUT sc_seguimiento.fec_ult_act%TYPE) IS
  v_nro_sol     sc_det.nro_sol%TYPE;
  v_nro_soli    sc.nro_soli%TYPE;
  v_estado_soli sc.estado_soli%TYPE;
  v_nro_pdp     sc.nro_pdp%TYPE;
BEGIN
  pkg_ic.inicializar;
  BEGIN
    SELECT a.nro_soli, a.estado_soli, a.nro_pdp
      INTO v_nro_soli, v_estado_soli, v_nro_pdp
      FROM sc a, sc_det b
     WHERE a.nro_soli = b.nro_soli
       AND a.estado_soli IN
           ('DIGI', 'APRO', 'REVI', 'REFE', 'VERI', 'ANA', 'PROC')
       AND b.tipo_sol = 'SOL'
       AND b.nro_sol = p_nro_sol
       AND a.vencido = 0 FETCH FIRST 1 rows ONLY;
  EXCEPTION
    WHEN no_data_found THEN
      NULL;
      ROLLBACK;
    WHEN OTHERS THEN
      ROLLBACK;
      p_mensaje_error := 'Error al buscar solicitudes en proceso...' ||
                         SQLERRM;
      raise_application_error(-20001, p_mensaje_error);
  END;
  IF v_estado_soli != 'DIGI' THEN
    p_mensaje_error := 'Verifique, se encontro al solicitante en una' ||
                       ' solicitud en proceso. ' || ' Nro.Soli...: ' ||
                       v_nro_soli || ' Estado.....: ' || v_estado_soli;
    raise_application_error(-20001, p_mensaje_error);
  END IF;
  IF v_nro_soli IS NOT NULL THEN
    BEGIN
      SELECT usr_ult_act, fec_ult_act
        INTO p_usr_ult_act, p_fec_ult_act
        FROM sc_seguimiento
       WHERE nro_soli = v_nro_soli
         AND estado_soli = 'DIGI'
       ORDER BY fec_ult_act DESC FETCH FIRST 1 rows ONLY;
      COMMIT;
    EXCEPTION
      WHEN OTHERS THEN
        ROLLBACK;
        p_mensaje_error := 'Error al seleccionar sc seguimiento usuario...';
        raise_application_error(-20001, p_mensaje_error);
    END;
  END IF;
  IF p_usr_ult_act != pkg_ic.g_usuario THEN
    p_mensaje_error := 'Verifique, se encontro al solicitante en una' ||
                       ' solicitud en DIGITACION. ' ||
                       ' Nro.Soli.......: ' || v_nro_soli ||
                       ' Usuario Carga..: ' || p_usr_ult_act ||
                       ' Fecha Carga....: ' || p_fec_ult_act;
    raise_application_error(-20001, p_mensaje_error);
  END IF;
  p_nro_soli    := v_nro_soli;
  p_estado_soli := v_estado_soli;
  p_nro_pdp     := v_nro_pdp;
  
  COMMIT;
EXCEPTION
  WHEN OTHERS THEN
    ROLLBACK;
    raise_application_error(-20001, SQLERRM, TRUE);
END;
PROCEDURE pr_fecha_nacimiento(fecha_nacimiento_texto VARCHAR2,
                              fecha_nacimiento_date  DATE,
                              p_mensaje_error        OUT VARCHAR2) IS
  ano_nacimiento VARCHAR(12);
  mes_nacimiento VARCHAR(12);
  dia_nacimiento VARCHAR(12);
BEGIN
  ano_nacimiento := extract(YEAR FROM
                            to_date(fecha_nacimiento_texto, 'DD/MM/RR'));
  mes_nacimiento := to_char(to_date(fecha_nacimiento_texto, 'DD/MM/RR'),
                            'mm');
  dia_nacimiento := extract(DAY FROM
                            to_date(fecha_nacimiento_texto, 'DD/MM/RR'));
  IF fecha_nacimiento_date > to_date(SYSDATE, 'DD/MM/RR') THEN
    p_mensaje_error := 'Verifique, fecha de nacimiento superior a la actual...';
    raise_application_error(-20001, p_mensaje_error);
  ELSIF months_between(SYSDATE,
                       to_date(fecha_nacimiento_date, 'DD/MM/RR')) / 12 < 18 THEN
    raise_application_error(-20001,
                            'Aviso, la persona es menor de edad...');
  ELSIF to_date(fecha_nacimiento_date, 'DD/MM/RR') <=
        add_months(SYSDATE, -12 * 100) THEN
    raise_application_error(-20001,
                            'Aviso, la edad de la persona es igual o mayor a 100...');
  END IF;
END;
FUNCTION fn_calcular_dv_11_a(p_numero  IN VARCHAR2,
                             p_basemax IN NUMBER DEFAULT 11) RETURN NUMBER IS
  /*
   calcula digito verificador num?rico con entrada alfanum?rica y basemax 11
  */
  v_total      NUMBER(6);
  v_resto      NUMBER(2);
  k            NUMBER(2);
  v_numero_aux NUMBER(1);
  v_numero_al  VARCHAR2(255);
  v_caracter   VARCHAR2(1);
  v_digit      NUMBER;
BEGIN
  -- cambia la ultima letra por ascii en caso que la cedula termine en letra
  FOR i IN 1 .. length(p_numero) LOOP
    v_caracter := upper(substr(p_numero, i, 1));
    IF ascii(v_caracter) NOT BETWEEN 48 AND 57 THEN
      -- de 0 a 9
      v_numero_al := v_numero_al || ascii(v_caracter);
    ELSE
      v_numero_al := v_numero_al || v_caracter;
    END IF;
  END LOOP;
  -- calcula el dv
  k       := 2;
  v_total := 0;
  FOR i IN REVERSE 1 .. length(v_numero_al) LOOP
    IF k > p_basemax THEN
      k := 2;
    END IF;
    v_numero_aux := to_number(substr(v_numero_al, i, 1));
    v_total      := v_total + (v_numero_aux * k);
    k            := k + 1;
  END LOOP;
  v_resto := MOD(v_total, 11);
  IF v_resto > 1 THEN
    v_digit := 11 - v_resto;
  ELSE
    v_digit := 0;
  END IF;
  RETURN v_digit;
END;
/******************************formulario referencias personales **************/
PROCEDURE pr_proc_incluir_ref(p_nro_soli          IN sc_rel_ref_personal.nro_soli%TYPE,
                              p_nro_sol_sol       IN sc_sol_ref_personal.nro_sol%TYPE,
                              p_ape_referente     IN sc_sol_ref_personal.ape_referente%TYPE,
                              p_nom_referente     IN sc_sol_ref_personal.nom_referente%TYPE,
                              p_nro_cedula        IN sc_sol_ref_personal.nro_cedula%TYPE,
                              p_cod_tipo_relacion IN sc_sol_ref_personal.cod_tipo_relacion%TYPE,
                              p_cod_telefonica    IN sc_telefono.cod_telefonica%TYPE,
                              p_nro_telefono      IN sc_telefono.nro_telefono%TYPE,
                              p_mensaje_error     OUT VARCHAR2) IS
  v_id_telefono     sc_telefono.id_telefono%TYPE;
  v_nro_item        sc_telefono.nro_item%TYPE := 0;
  v_g_usuario       sc_telefono.usr_ult_act%TYPE;
  v_fec_ult_act     sc_sol_ref_personal.fec_ult_act%TYPE := current_date;
  v_con_id_telefono NUMBER := 0;
BEGIN
  pkg_ic.inicializar;
  v_g_usuario := pkg_ic.g_usuario;
  
  DECLARE 
       CURSOR CUR_REF_PERSONAL IS 
              SELECT * 
              FROM sc_rel_ref_personal
              WHERE  NRO_SOLI = p_nro_soli;
              
    BEGIN
      FOR A IN CUR_REF_PERSONAL LOOP
          BEGIN
             DELETE FROM sc_sol_ref_personal
             WHERE nro_sol = A.NRO_ITEM
             AND nro_sol = A.NRO_SOL;
          EXCEPTION
            WHEN no_data_found THEN
              NULL;
              ROLLBACK;
            WHEN OTHERS THEN
              ROLLBACK;
              p_mensaje_error := 'Error al eliminar relacion referencia personal... '|| SQLERRM;
          END;
      END LOOP;
    END;  
    /*  
  BEGIN
   DELETE FROM sc_sol_ref_personal REF
     WHERE EXISTS (SELECT *
              FROM sc_rel_ref_personal rel
             WHERE ref.nro_sol = rel.nro_sol
               AND ref.nro_item = rel.nro_item
               AND rel.nro_soli = p_nro_soli);
  

     COMMIT;          

  EXCEPTION
    WHEN no_data_found THEN
      NULL;
  --    ROLLBACK;
    WHEN OTHERS THEN
  --    ROLLBACK;
      p_mensaje_error := 'Error al eliminar relacion referencia personal... '|| SQLERRM;
  END;*/
 -- RAISE_APPLICATION_ERROR(-20001, p_nro_soli);
  BEGIN
    DELETE FROM sc_rel_ref_personal WHERE nro_soli = p_nro_soli;
    COMMIT;
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      p_mensaje_error := 'Error al eliminar sc_rel_ref_personal...';
  END;
  
  
  BEGIN
    SELECT nvl(MAX(nro_item), 0)
      INTO v_nro_item
      FROM sc_sol_ref_personal
     WHERE nro_sol = p_nro_sol_sol;
  EXCEPTION
    WHEN NO_DATA_FOUND THEN
         NULL;
    WHEN OTHERS THEN
      ROLLBACK;
      p_mensaje_error := 'Error al seleccionar maximo nro de item... ';
      raise_application_error(-20001, p_mensaje_error || SQLERRM);
  END;
  BEGIN
    v_nro_item := v_nro_item + 1;
    
   -- RAISE_APPLICATION_ERROR(-20001, v_nro_item);
    BEGIN
      SELECT MAX(id_telefono) INTO v_con_id_telefono FROM sc_telefono;
    END;
    BEGIN
      UPDATE sc_control
         SET ult_id_telefono = v_con_id_telefono + 1
       WHERE dummy_key = 1;
       COMMIT;
    EXCEPTION
      WHEN OTHERS THEN
        ROLLBACK;
        p_mensaje_error := 'Error al actualizar ultimo id telefono...';
        raise_application_error(-20001, p_mensaje_error || SQLERRM);
    END;
    BEGIN
      SELECT ult_id_telefono
        INTO v_id_telefono
        FROM sc_control
       WHERE dummy_key = 1;
    EXCEPTION
      WHEN OTHERS THEN
        ROLLBACK;
        p_mensaje_error := 'Error al seleccionar id tel?fono 1.... ';
        raise_application_error(-20001, p_mensaje_error || SQLERRM);
    END;
    
    
    BEGIN
     
      
      INSERT INTO sc_sol_ref_personal
        (nro_sol,
         nro_item,
         ape_referente,
         nom_referente,
         nro_cedula,
         id_telefono,
         cod_tipo_relacion,
         dejar_mensaje,
         domicilio_referenciado,
         observacion,
         fec_ult_act,
         usr_ult_act,
         estado,
         referencia_valida,
         datos_distintos,
         fec_alta,
         usr_alta)
      VALUES
        (p_nro_sol_sol,
         v_nro_item,
         p_ape_referente,
         p_nom_referente,
         p_nro_cedula,
         v_id_telefono,
         p_cod_tipo_relacion,
         '',
         NULL,
         NULL,
         v_fec_ult_act,
         v_g_usuario,
         1,
         '',
         '',
         v_fec_ult_act,
         v_g_usuario);
    EXCEPTION
      WHEN OTHERS THEN
        ROLLBACK;
        p_mensaje_error := 'Error al insertar referencia personal... '|| SQLERRM;
        raise_application_error(-20001, p_mensaje_error || SQLERRM);
    END;
     
    DECLARE
      v_ultimo_contacto sc_telefono.ultimo_contacto%TYPE := 0;
      v_ultimo_intento  sc_telefono.ultimo_intento%TYPE := 0;
      v_email_telefono  sc_telefono.email_telefono%TYPE := '-';
      v_activo          sc_telefono.activo%TYPE := 1;
      v_activo_msn      sc_telefono.activo_msn%TYPE := 1;
      v_tabla_origen    sc_telefono.tabla_origen%TYPE := 'sc_sol_ref_personal';
      v_item            sc_telefono.nro_item%TYPE := 1;
    BEGIN
      INSERT INTO sc_telefono
        (cod_telefonica,
         nro_item,
         activo_msn,
         activo,
         tabla_origen,
         ultimo_intento,
         usr_ult_act,
         fec_ult_act,
         id_telefono,
         nro_telefono,
         ultimo_contacto,
         email_telefono)
      VALUES
        (p_cod_telefonica,
         v_nro_item,
         v_activo_msn,
         v_activo,
         v_tabla_origen,
         v_ultimo_intento,
         v_g_usuario,
         v_fec_ult_act,
         v_id_telefono,
         p_nro_telefono,
         v_ultimo_contacto,
         v_email_telefono);
    EXCEPTION
      WHEN OTHERS THEN
        ROLLBACK;
        p_mensaje_error := 'Error al insertar sc_telefono...';
        raise_application_error(-20001, p_mensaje_error || SQLERRM);
    END;
    
    
    
    
    BEGIN
      INSERT INTO sc_rel_ref_personal
        (nro_sol,
         nro_item,
         nro_soli,
         fec_alta,
         usr_alta,
         fec_ult_act,
         usr_ult_act)
      VALUES
        (p_nro_sol_sol,
         v_nro_item,
         p_nro_soli,
         v_fec_ult_act,
         v_g_usuario,
         v_fec_ult_act,
         v_g_usuario);
    EXCEPTION
      WHEN OTHERS THEN
        ROLLBACK;
        p_mensaje_error := 'Error al insertar relaci?n referencia personal...';
        raise_application_error(-20001, p_mensaje_error || SQLERRM);
    END;
    
    
  END;
  COMMIT;
EXCEPTION
  WHEN OTHERS THEN
    ROLLBACK;
    raise_application_error(-20001, p_mensaje_error || SQLERRM);
END;


FUNCTION fn_obtiene_telefonos(p_id_telefono IN VARCHAR2,
                              p_nro_item    IN VARCHAR2) RETURN VARCHAR2 IS
  v_telefono    VARCHAR2(30);
  v_id_telefono sc_telefono.id_telefono%TYPE;
  v_nro_item    sc_telefono.nro_item%TYPE;
BEGIN
  BEGIN
    SELECT decode(s.cod_telefonica,
                  '--',
                  '0' || s.nro_telefono,
                  lpad(TRIM(sc.prefijo) || s.nro_telefono, 10, 0)) nro_telefono
      INTO v_telefono
      FROM sc_telefono s, sc_telefonica sc
     WHERE s.cod_telefonica = sc.cod_telefonica
       AND s.id_telefono = v_id_telefono
       AND s.nro_item = v_nro_item;
    COMMIT;
  EXCEPTION
    WHEN no_data_found THEN
      v_telefono := NULL;
      ROLLBACK;
    WHEN OTHERS THEN
      v_telefono := NULL;
      ROLLBACK;
  END;
  RETURN v_telefono;
END;
FUNCTION RIGHT(s VARCHAR2, r INTEGER) RETURN VARCHAR2 IS
BEGIN
  RETURN substr(s, length(s) - r + 1, r);
END;
FUNCTION LEFT(s VARCHAR2, l INTEGER) RETURN VARCHAR2 IS
BEGIN
  RETURN substr(s, 1, l);
END;


PROCEDURE pr_sol01113 IS
BEGIN
  BEGIN
  UPDATE gv_contacto_admin
     SET ult_nro_contacto = ult_nro_contacto + 1
   WHERE dummy_key = 1;
   COMMIT;
   EXCEPTION 
     WHEN OTHERS THEN 
       ROLLBACK;
   END;
   
  SELECT ult_nro_contacto
    INTO g_nro_contacto
    FROM gv_contacto_admin
   WHERE dummy_key = 1;
   
   
  BEGIN
    SELECT a.nro_contacto nro_contacto
      INTO g_nro_contacto
      FROM gv_contacto a, vendedores b
     WHERE a.nro_cedula = g_nro_cedula
       AND a.estado_contacto IN ('PEND', 'ACTI', 'SOLI', 'AV', 'AS')
       AND a.cod_vendedor = b.cod_vendedor
       AND b.vend_activo = 1 FETCH FIRST 1 rows ONLY;
  EXCEPTION
    WHEN no_data_found THEN
      g_nro_contacto := g_nro_contacto;
      ROLLBACK;
  END;
  
 
  DECLARE
    l_sysdate DATE := SYSDATE;
  BEGIN
  ---  RAISE_APPLICATION_ERROR(-20001, g_nro_soli);
    
    INSERT INTO gv_contacto
      (nro_contacto,
       cod_sucursal,
       fec_contacto,
       cod_vendedor,
       login,
       estado_contacto,
       cod_tipo_contacto,
       cod_situ,
       situacion,
       nro_cedula,
       apellido,
       nombre,
       cod_localidad,
       cod_barrio,
       domicilio,
       lugar_contacto,
       actividad_trabajo,
       cod_telefonica,
       nro_telefono,
       cod_articulo,
       cod_cliente,
       cod_cliente_tel,
       nro_soli,
       nro_sol,
       nro_sol_tel,
       cod_sucursal_vta,
       fec_presup,
       nro_presup,
       cod_vend_levantador,
       ingreso_desde,
       nro_telefono_ingreso,
       articulo_interes,
       fec_prox_contacto,
       fec_alta,
       usr_alta,
       fec_ult_act,
       usr_ult_act)
      SELECT g_nro_contacto,
             pkg_ic.g_cod_sucursal,
             pkg_ic.g_fec_ingrid,
             pkg_ic.g_cod_vendedor,
             pkg_ic.g_usuario,
             'PEND',
             '10',
             'SOLI',
             'SOLICITUD DE CREDITO',
             g_nro_cedula,
             a.ape_sol,
             a.nom_sol,
             a.cod_localidad,
             a.cod_barrio,
             a.domicilio,
             '--',
             '--',
             '--',
             0,
             '--',
             a.cod_cliente,
             a.cod_cliente,
             g_nro_soli,
             g_nro_sol,
             0,
             0,
             pkg_ic.g_fec_ingrid,
             0,
             '--',
             'I',
             '--',
             '--',
             NULL,
             l_sysdate,
             pkg_ic.g_usuario,
             l_sysdate,
             pkg_ic.g_usuario
        FROM sc_sol a
       WHERE a.nro_sol = g_nro_sol;
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      pr_capturar_error;
      RAISE;
  END;
  COMMIT;
  EXCEPTION
    WHEN OTHERS THEN 
      ROLLBACK;
      raise_application_error(-20001, SQLERRM);
END pr_sol01113;


PROCEDURE pr_sol01729(p_g_cod_sucursal IN OUT NUMBER) IS
  
BEGIN
  IF pkg_ic.g_vend_activo = 0 THEN
    raise_application_error(-20001,
                            'Verifique. Su codigo de vendedor ' ||
                            pkg_ic.g_cod_vendedor || ' no esta activo');
  END IF;
  
 
  
  BEGIN
    UPDATE sc_control
       SET ult_nro_soli = ult_nro_soli + 1
     WHERE dummy_key = 1;
   COMMIT;
   EXCEPTION 
     WHEN OTHERS THEN 
       ROLLBACK;
        raise_application_error(-20001, 'Error al actualizar sc_control ' || SQLERRM);
  END;
  
  
  

  SELECT ult_nro_soli
    INTO g_w_nro_soli
    FROM sc_control
   WHERE dummy_key = 1;
   
   
    

   
  BEGIN
    SELECT 1
      INTO g_es_empleado_alex
      FROM persona a, personal b
     WHERE a.nro_cedula_id = g_nro_cedula
       AND a.cod_persona = b.cod_persona
       AND b.estado_personal IN ('ACTI', 'SUSP', 'LICE', 'VACA');
  EXCEPTION
    WHEN no_data_found THEN
      NULL;
     ROLLBACK;
    WHEN OTHERS THEN 
         ROLLBACK;
  END;
  
  DECLARE
    l_rows NUMBER := 0;
  BEGIN
    FOR i IN (SELECT nro_soli FROM sc_det WHERE nro_sol = g_nro_sol) LOOP
      l_rows := l_rows + 1;
      IF i.nro_soli != g_nro_soli THEN
        g_obs := g_obs || i.nro_soli || '; ';
      END IF;
    END LOOP;
    
      

  
    IF l_rows > 0 THEN
      g_obs := 'PARTICIPO EN SC NRO: ' || g_obs;
    END IF;
    DECLARE
      l_sysdate DATE := SYSDATE;
    BEGIN
      INSERT INTO sc_det
        (nro_soli,
         nro_sol,
         tipo_sol,
         estado_item,
         firma_pagare,
         obs_estado,
         fec_ult_act,
         usr_ult_act)
      VALUES
        (g_w_nro_soli,
         g_nro_sol,
         'SOL',
         'EDIT',
         'S',
         g_obs,
         l_sysdate,
         pkg_ic.g_usuario);
    --  COMMIT;
    EXCEPTION
      WHEN OTHERS THEN
       ROLLBACK;
        pr_capturar_error;
        RAISE;
    END;
    g_nro_soli := g_w_nro_soli;
  END;
  IF g_tipo_personeria = 'F' AND g_nro_cedula > 0 THEN
    /*verifica si el contacto ya existe y si su vend.esta activo*/
    BEGIN
      SELECT a.nro_contacto,
             a.cod_vendedor,
             a.cod_sucursal,
             b.vendedor,
             b.cod_tipo_vendedor
        INTO g_nro_contacto,
             g_w_cod_vendedor,
             g_cod_sucursal,
             g_w_vendedor,
             g_cod_tipo_vendedor
        FROM gv_contacto a, vendedores b
       WHERE a.nro_cedula = g_nro_cedula
         AND a.estado_contacto IN ('PEND', 'ACTI', 'SOLI', 'AV', 'AS')
         AND a.cod_vendedor = b.cod_vendedor
         AND b.vend_activo = 1;
    EXCEPTION
      WHEN no_data_found THEN
        pr_sol01113;
      --  ROLLBACK;
    END;
  ELSIF g_tipo_personeria = 'J' AND g_nro_ruc > 0 THEN
    g_nro_ruc := LEFT(g_ruc, instr(g_ruc, '-') - 1);
    BEGIN
      SELECT a.nro_contacto,
             a.cod_vendedor,
             a.cod_sucursal,
             b.vendedor,
             b.cod_tipo_vendedor
        INTO g_nro_contacto,
             g_w_cod_vendedor,
             g_cod_sucursal,
             g_w_vendedor,
             g_cod_tipo_vendedor
        FROM gv_contacto a, vendedores b
       WHERE a.nro_cedula = g_nro_ruc
         AND a.estado_contacto IN ('PEND', 'ACTI', 'SOLI', 'AV', 'AS')
         AND a.cod_vendedor = b.cod_vendedor
         AND b.cod_tipo_vendedor != 'TSV'
         AND b.vend_activo = 1;
    EXCEPTION
      WHEN OTHERS THEN
       ROLLBACK;
        pr_capturar_error;
        RAISE;
    END;
  END IF;
  g_cod_vendedor := pkg_ic.g_cod_vendedor;
  IF g_es_empleado_alex = 1 THEN
    g_cod_vendedor := '727';
  END IF;
  DECLARE
    l_sysdate DATE := SYSDATE;
    v_funcionario NUMBER := 0;
    v_forma_pago sc.cod_forma_pago%TYPE;
  BEGIN
    
    BEGIN     
        SELECT 1 
        INTO v_funcionario
        FROM perspers a
        WHERE a.nro_cedula_id = g_nro_cedula; 
        EXCEPTION 
          WHEN no_data_found THEN 
               v_funcionario := 0; 
          WHEN OTHERS THEN 
             v_funcionario := 0; 
    END;
    IF v_funcionario = 1 THEN
      v_forma_pago := '07';
    ELSE 
       v_forma_pago := '01';
    END IF;
 --    RAISE_APPLICATION_ERROR(-20001, g_w_nro_soli);
    INSERT INTO sc
      (nro_soli,
       fec_soli,
       cod_sucursal,
       cod_tipo_soli,
       estado_soli,
       dia_pago,
       cod_vendedor,
       cod_moneda,
       cod_forma_pago,
       ent_ini_soli,
       mon_cuota_soli,
       mon_soli,
       can_cuota_soli,
       ent_ini_apro,
       mon_cuota_apro,
       mon_apro,
       can_cuota_apro,
       limite_credito,
       tipo_comercio,
       con_garante,
       can_garante,
       fec_hor_digi,
       fec_hor_refe,
       fec_hor_ana,
       fec_hor_apro,
       cod_forma_vta,
       nro_sol,
       nro_cedula,
       nro_contacto,
       cod_riesgo,
       puntuacion,
       estado_scoring,
       usr_refe,
       usr_ana,
       nro_pdp,
       tipo_pdp,
       doble_apro,
       fec_vencimiento,
       vencido,
       estado_soli_aut,
       pasa_a_estado,
       estado_politica_alex,
       scoring_automatico,
       nro_sol_pagador,
       fec_ult_act,
       usr_ult_act)
    VALUES
      (g_w_nro_soli,
       pkg_ic.g_fec_ingrid,
       p_g_cod_sucursal,
       '--',
       'DIGI',
       0,
       g_cod_vendedor,
       '01',
       v_forma_pago,
       0,
       0,
       0,
       0,
       0,
       0,
       0,
       0,
       0,
       'MINORISTA',
       0,
       0,
       l_sysdate,
       NULL,
       NULL,
       NULL,
       '--',
       g_nro_sol,
       g_nro_cedula,
       g_nro_contacto,
       '',
       0,
       '',
       '--',
       '--',
       0,
       0,
       0,
       NULL,
       0,
       0,
       '',
       '',
       0,
       g_nro_sol,
       l_sysdate,
       pkg_ic.g_usuario);
   -- COMMIT;
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      pr_capturar_error;
      RAISE;
  END;
  
   
  DECLARE
    l_sysdate DATE := SYSDATE;
  BEGIN
    INSERT INTO sc_seguimiento
      (nro_soli,
       fec_mov,
       estado_soli,
       observacion,
       fec_ult_act,
       usr_ult_act)
    VALUES
      (g_w_nro_soli, l_sysdate, 'DIGI', '', l_sysdate, pkg_ic.g_usuario);
    --COMMIT;
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      pr_capturar_error;
      RAISE;
  END;
  
  DECLARE
    l_sysdate DATE := SYSDATE;
  BEGIN
    UPDATE gv_contacto
       SET estado_contacto = 'SOLI',
           nro_soli        = g_w_nro_soli,
           nro_sol         = g_nro_sol,
           fec_ult_act     = l_sysdate,
           usr_ult_act     = pkg_ic.g_usuario
     WHERE nro_contacto = g_nro_contacto;
   
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      pr_capturar_error;
      RAISE;
  END;
  pr_sc_crm(p_nro_soli          => g_nro_soli,
            p_nro_sol           => g_nro_sol,
            p_estado_soli       => 'DIGI',
            p_programa          => 'apex_sol01729.->',
            p_cod_resultado     => g_cod_resultado,
            p_resultado         => g_resultado,
            p_cod_identificador => g_cod_identificador,
            p_nro_contacto      => g_nro_contacto,
            p_vencido           => g_vencido);
  
  COMMIT;
EXCEPTION
  WHEN OTHERS THEN
    ROLLBACK;
    pr_capturar_error;
     RAISE;
END pr_sol01729;


PROCEDURE pr_sol01737(p_nro_soli        IN OUT sc.nro_soli%TYPE,
                      p_nro_sol         IN OUT sc.nro_sol%TYPE,
                      p_tipo_personeria IN OUT sc_sol.tipo_personeria%TYPE,
                      p_cod_localidad   IN OUT sc_sol.cod_localidad%TYPE,
                      p_cod_barrio      IN OUT sc_sol.cod_barrio%TYPE,
                      p_domicilio       IN OUT sc_sol.domicilio%TYPE,
                      p_tipo_vivienda   IN OUT sc_sol.tipo_vivienda%TYPE,
                      p_croquis_hablado IN OUT sc_sol.croquis_hablado%TYPE,
                      p_nro_cedula      IN OUT persona.nro_cedula_id%TYPE,
                      p_ruc             IN OUT persona.ruc_persona%TYPE,
                      p_cod_sucursal    IN OUT NUMBER) IS
BEGIN
  pkg_ic.inicializar;
  g_nro_soli        := p_nro_soli;
  g_nro_sol         := p_nro_sol;
  g_tipo_personeria := TRIM(p_tipo_personeria);
  g_cod_localidad   := p_cod_localidad;
  g_cod_barrio      := p_cod_barrio;
  g_domicilio       := p_domicilio;
  g_tipo_vivienda   := p_tipo_vivienda;
  g_croquis_hablado := p_croquis_hablado;
  g_nro_cedula      := p_nro_cedula;
  g_ruc             := p_ruc;
  BEGIN
    SELECT barrio
      INTO g_barrio
      FROM barrio
     WHERE cod_localidad = g_cod_localidad
       AND cod_barrio = g_cod_barrio;
  EXCEPTION
    WHEN no_data_found THEN
      ROLLBACK;
  END;
  UPDATE sc_sol
     SET cod_localidad   = g_cod_localidad,
         cod_barrio      = g_cod_barrio,
         barrio          = g_barrio,
         domicilio       = g_domicilio,
         tipo_vivienda   = g_tipo_vivienda,
         croquis_hablado = g_croquis_hablado
   WHERE nro_sol = g_nro_sol;
  
  IF SQL%ROWCOUNT < 1 THEN
    ROLLBACK;
    raise_application_error(-20999,
                            'No se actualizo la direccion del solicitante Nro.: ' ||
                            p_nro_sol);
  END IF;
 -- 
  IF g_nro_soli IS NULL THEN
   pr_sol01729(p_g_cod_sucursal => p_cod_sucursal);
  END IF;
  
  
  
  p_nro_soli        := g_nro_soli;
  p_nro_sol         := g_nro_sol;
  p_tipo_personeria := g_tipo_personeria;
  p_cod_localidad   := g_cod_localidad;
  p_cod_barrio      := g_cod_barrio;
  p_domicilio       := g_domicilio;
  p_tipo_vivienda   := g_tipo_vivienda;
  p_croquis_hablado := g_croquis_hablado;
  p_nro_cedula      := g_nro_cedula;
  p_ruc             := g_ruc;
  COMMIT;
EXCEPTION
  WHEN OTHERS THEN
    ROLLBACK;
    pr_capturar_error('p_nro_soli: ' || p_nro_soli || chr(10) ||
                      'p_nro_sol: ' || p_nro_sol || chr(10) ||
                      'p_tipo_personeria: ' || p_tipo_personeria ||
                      chr(10) || 'p_cod_localidad: ' || p_cod_localidad ||
                      chr(10) || 'p_cod_barrio: ' || p_cod_barrio ||
                      chr(10) || 'p_domicilio: ' || p_domicilio ||
                      chr(10) || 'p_tipo_vivienda: ' || p_tipo_vivienda ||
                      chr(10) || 'p_croquis_hablado: ' ||
                      p_croquis_hablado || chr(10) || 'p_nro_cedula: ' ||
                      p_nro_cedula || chr(10) || 'p_ruc: ' || p_ruc);
    RAISE;
END pr_sol01737;

FUNCTION fn_obtener_cod_telefonica(p_nro_telefono sc_telefono.nro_telefono%TYPE)
  RETURN sc_telefonica.cod_telefonica%TYPE IS
  l_cod_telefonica sc_telefonica.cod_telefonica%TYPE;
  l_prefijo        sc_telefonica.prefijo%TYPE;
  l_contador       NUMBER := 0;
BEGIN
  l_contador := length(p_nro_telefono);
  IF l_contador = 9 THEN
    l_prefijo := substr(p_nro_telefono, 1, 3);
  ELSIF l_contador = 8 THEN
    l_prefijo := '0' || substr(p_nro_telefono, 0, 2);
  ELSIF l_contador NOT IN (9, 8) THEN
    raise_application_error(-20001,
                            'Corregir el numero de telefono ingresado');
  END IF;
  IF l_prefijo <> '021' THEN
    BEGIN
      SELECT cod_telefonica
        INTO l_cod_telefonica
        FROM sc_telefonica
       WHERE prefijo = l_prefijo;
    EXCEPTION
      WHEN no_data_found THEN
        raise_application_error(-20001, 'Favor verificar cod_telefono');
    END;
  ELSE
    l_cod_telefonica := '--';
  END IF;
  RETURN l_cod_telefonica;
END fn_obtener_cod_telefonica;
PROCEDURE pr_procesar_sol_trabajo(p_denominacion          IN sc_sol_trabajo.denominacion%TYPE,
                                  p_direccion             IN sc_sol_trabajo.direccion%TYPE,
                                  p_cod_actividad         IN sc_sol_trabajo.cod_actividad%TYPE,
                                  p_cod_ocupacion         IN sc_sol_trabajo.cod_ocupacion%TYPE,
                                  p_salario_ml            IN sc_sol_trabajo.salario_ml%TYPE,
                                  p_id_telefono           IN sc_telefono.id_telefono%TYPE,
                                  p_nro_telefono          IN sc_telefono.nro_telefono%TYPE,
                                  p_nro_telefono_opcional IN sc_telefono.nro_telefono%TYPE DEFAULT NULL,
                                  p_croquis_hablado       IN sc_sol_trabajo.croquis_hablado%TYPE DEFAULT NULL,
                                  p_nro_sol               IN sc_sol_trabajo.nro_sol%TYPE,
                                  p_nro_soli              IN sc_sol_trabajo.nro_soli%TYPE,
                                  p_nro_item              IN sc_sol_trabajo.nro_item%TYPE DEFAULT NULL) IS
  l_id_telefono               sc_telefono.id_telefono%TYPE;
  l_nro_item                  sc_sol_trabajo.nro_item%TYPE;
  l_relacion_laboral          sc_respuestas.relacion_laboral%TYPE;
  l_paga_ips                  sc_sol_trabajo.paga_ips%TYPE := ' ';
  l_es_empleado               CHAR(1) := 'N';
  l_es_funcionario_publico    CHAR(1) := 'N';
  l_es_jubilado               CHAR(1) := 'N';
  l_es_comer_duenho_indep     CHAR(1) := 'N';
  l_trabaja_inde              CHAR(1) := 'N';
  l_es_profesional            CHAR(1) := 'N';
  l_es_productor_agropecuario CHAR(1) := 'N';
  l_empleada_domestica        CHAR(1) := 'N';
  l_actualizar                BOOLEAN;
  l_estado                    NUMBER := 0;
  PROCEDURE pr_procesar_telefono(p_desde VARCHAR2) IS
    l_nro_telefono   sc_telefono.nro_telefono%TYPE;
    l_cod_telefonica sc_telefonica.cod_telefonica%TYPE;
    l_operacion      NUMBER;
    l_desde          sc_telefono.tabla_origen%TYPE := p_desde;
    l_nro_item_num   sc_telefono.nro_item%TYPE;
  BEGIN

    FOR item_tel IN 1 .. 2 LOOP
      l_operacion    := NULL;
      l_nro_telefono := CASE
                          WHEN item_tel = 1 THEN
                           p_nro_telefono
                          ELSE
                           p_nro_telefono_opcional
                        END;
      IF l_nro_telefono IS NOT NULL OR item_tel = 1 THEN
        l_cod_telefonica := fn_obtener_cod_telefonica(l_nro_telefono);
      END IF;
      DECLARE
        l_nro_telefono_tab sc_telefono.nro_telefono%TYPE;
      BEGIN
        SELECT nro_telefono
          INTO l_nro_telefono_tab
          FROM sc_telefono
         WHERE id_telefono = l_id_telefono
           AND nro_item = item_tel;
        IF l_nro_telefono_tab != l_nro_telefono THEN
          l_operacion := 2;
        ELSIF l_nro_telefono IS NULL THEN
          l_operacion := 3;
        END IF;
      EXCEPTION
        WHEN no_data_found THEN
          IF l_nro_telefono IS NOT NULL THEN
            l_operacion := 1;
          END IF;
      END;
      DECLARE
        l_sysdate sc_telefono.fec_ult_act%TYPE := SYSDATE;
      BEGIN
        IF l_operacion = 1 THEN
          BEGIN
            INSERT INTO sc_telefono
              (id_telefono,
               nro_item,
               cod_telefonica,
               nro_telefono,
               email_telefono,
               tabla_origen,
               ultimo_contacto,
               ultimo_intento,
               activo,
               activo_msn,
               fec_ult_act,
               usr_ult_act)
            VALUES
              (l_id_telefono,
               item_tel,
               l_cod_telefonica,
               l_nro_telefono,
               'N/A',
               l_desde,
               '0',
               '0',
               '1',
               '0',
               l_sysdate,
               pkg_ic.g_usuario);
            
          EXCEPTION
            WHEN OTHERS THEN
              ROLLBACK;
              pr_capturar_error;
              raise_application_error(-20001, 'Error al insertar sc_telefono '|| SQLERRM );
          END;
        ELSIF l_operacion = 2 THEN
          BEGIN
            UPDATE sc_telefono
               SET cod_telefonica = l_cod_telefonica,
                   nro_telefono   = l_nro_telefono,
                   activo         = 1,
                   fec_ult_act    = l_sysdate,
                   usr_ult_act    = pkg_ic.g_usuario
             WHERE id_telefono = l_id_telefono
               AND nro_item = item_tel;
          EXCEPTION
            WHEN OTHERS THEN
              ROLLBACK;
              pr_capturar_error;
              raise_application_error(-20001, 'Error al actualizar sc_telefono '|| SQLERRM );
          END;
        ELSIF l_operacion = 3 THEN
          BEGIN
            DELETE FROM sc_telefono
             WHERE id_telefono = l_id_telefono
               AND nro_item = item_tel;
          EXCEPTION
            WHEN OTHERS THEN
              ROLLBACK;
              pr_capturar_error;
              raise_application_error(-20001, 'Error al eliminar sc_telefono '|| SQLERRM );
          END;
        END IF;
      END;
    END LOOP;
    COMMIT;
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      pr_capturar_error;
      raise_application_error(-20001, SQLERRM );
  END pr_procesar_telefono;
  
  
  
  
  PROCEDURE pr_procesar_independiente IS
    --sol01142
    l_sysdate DATE := SYSDATE;
  BEGIN
    pr_procesar_telefono('sc_sol_trabajo_independiente');
    IF l_actualizar THEN
      BEGIN
        UPDATE sc_sol_trabajo_independiente
           SET actividad_economica    = p_denominacion,
               empresa                = p_denominacion,
               direccion              = p_direccion,
               venta_promedio_mensual = p_salario_ml,
               fec_ult_act            = l_sysdate,
               usr_ult_act            = pkg_ic.g_usuario
         WHERE nro_sol = p_nro_sol
           AND nro_item = l_nro_item;
      EXCEPTION
        WHEN OTHERS THEN
          ROLLBACK;
          pr_capturar_error;
          RAISE;
      END;
    ELSE
      BEGIN
        INSERT INTO sc_sol_trabajo_independiente
          (nro_sol,
           nro_item,
           actividad_economica,
           empresa,
           direccion,
           cod_localidad,
           tipo_local,
           pago_importe_alquiler,
           cantidad_sucursales,
           cantidad_empleados,
           sueldo_promedio_empleados,
           tiene_patente,
           otro_documento,
           venta_promedio_mensual,
           realiza_actividad_adicional,
           ingreso_actividad_adicional,
           contrato_alquiler,
           observacion,
           cobro_importe_alquiler,
           tiene_empleados,
           tiene_sucursales,
           fec_alta,
           usr_alta,
           fec_ult_act,
           usr_ult_act)
        VALUES
          (p_nro_sol,
           l_nro_item,
           p_denominacion,
           p_denominacion,
           p_direccion,
           0,
           '',
           0,
           0,
           0,
           0,
           0,
           '',
           p_salario_ml,
           0,
           0,
           0,
           '',
           0,
           0,
           0,
           l_sysdate,
           pkg_ic.g_usuario,
           l_sysdate,
           pkg_ic.g_usuario);
      EXCEPTION
        WHEN OTHERS THEN
          ROLLBACK;
          pr_capturar_error;
          RAISE;
      END;
    END IF;
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      pr_capturar_error;
      RAISE;
  END pr_procesar_independiente;
  
  PROCEDURE pr_procesar_dependiente IS
    --sol01141
    l_sysdate DATE := SYSDATE;
  BEGIN
    pr_procesar_telefono('sc_sol_trabajo_dependiente');
    IF l_actualizar THEN
      BEGIN
        UPDATE sc_sol_trabajo_dependiente
           SET empresa     = p_denominacion,
               direccion   = p_direccion,
               id_telefono = l_id_telefono,
               salario_ml  = p_salario_ml,
               fec_ult_act = l_sysdate,
               usr_ult_act = pkg_ic.g_usuario
         WHERE nro_sol = p_nro_sol
           AND nro_item = l_nro_item;
      EXCEPTION
        WHEN OTHERS THEN
          ROLLBACK;
          pr_capturar_error;
          RAISE;
      END;
    ELSE
      BEGIN
        INSERT INTO sc_sol_trabajo_dependiente
          (nro_sol,
           nro_item,
           empresa,
           direccion,
           id_telefono,
           cod_localidad,
           cargo,
           salario_ml,
           comision_ml,
           cobro_salario,
           prestamo_interno,
           monto_descontado,
           datos_contacto,
           observacion,
           fec_alta,
           usr_alta,
           fec_ult_act,
           usr_ult_act)
        VALUES
          (p_nro_sol,
           l_nro_item,
           p_denominacion,
           p_direccion,
           l_id_telefono,
           0,
           ' ',
           p_salario_ml,
           1,
           ' ',
           0,
           0,
           0,
           NULL,
           l_sysdate,
           pkg_ic.g_usuario,
           l_sysdate,
           pkg_ic.g_usuario);
      EXCEPTION
        WHEN OTHERS THEN
          ROLLBACK;
          pr_capturar_error;
          RAISE;
      END;
    END IF;
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      pr_capturar_error;
      RAISE;
      
  END pr_procesar_dependiente;
  
  PROCEDURE pr_procesar_agropecuario IS --sol01005
  BEGIN
    pr_procesar_telefono('sc_sol_trabajo_agropecuaria');
    BEGIN
      DELETE FROM sc_sol_trabajo_agropecuaria
       WHERE nro_sol = p_nro_sol
         AND nro_item = l_nro_item;
    EXCEPTION
      WHEN OTHERS THEN
        ROLLBACK;
        pr_capturar_error;
        RAISE;
    END;
    
    BEGIN
      -- cultivo
      DELETE FROM agropecuaria_agricola
       WHERE nro_sol = p_nro_sol
         AND nro_item = l_nro_item;
    EXCEPTION
      WHEN OTHERS THEN
        ROLLBACK;
        pr_capturar_error;
        RAISE;
    END;
    
    FOR iitf_cultivo IN (SELECT c001 nro_sol,
                                c002 nro_item,
                                c003 cod_producto,
                                c004 nro_hectarea
                           FROM apex_collections
                          WHERE collection_name = 'CULTIVO') LOOP
      IF iitf_cultivo.nro_hectarea > 0 THEN
        DECLARE
          l_count                 NUMBER := 0;
          l_cultivo_total_ingreso NUMBER;
          l_cultivo_ingreso_neto  NUMBER;
        BEGIN
          FOR i IN (SELECT b.rendimiento_hectarea cultivo_rendimiento_hectarea,
                           b.cosecha_anual        cultivo_cosecha_anual,
                           b.costo_hectarea       cultivo_total_costo,
                           b.precio_esperado      cultivo_precio_esperado
                      FROM producto_agropecuario a, producto_agricola b
                     WHERE a.tipo_producto = 'AGRO'
                       AND a.cod_producto = b.cod_producto
                       AND a.cod_producto = iitf_cultivo.cod_producto) LOOP
            l_count := l_count + 1;
            --no se para que se usan estos calculos!!
            l_cultivo_total_ingreso := iitf_cultivo.nro_hectarea *
                                       i.cultivo_rendimiento_hectarea *
                                       i.cultivo_precio_esperado *
                                       i.cultivo_cosecha_anual;
            l_cultivo_ingreso_neto  := l_cultivo_total_ingreso -
                                       (i.cultivo_total_costo *
                                       iitf_cultivo.nro_hectarea *
                                       i.cultivo_cosecha_anual);
            BEGIN
              INSERT INTO sc_sol_trabajo_agropecuaria
                (nro_sol, nro_item, cod_producto, nro_orden)
              VALUES
                (p_nro_sol,
                 l_nro_item,
                 iitf_cultivo.cod_producto,
                 l_count);
            EXCEPTION
              WHEN OTHERS THEN
                ROLLBACK;
                pr_capturar_error;
                RAISE;
            END;
            
            BEGIN
              INSERT INTO agropecuaria_agricola
                (nro_sol,
                 nro_item,
                 cod_producto,
                 rendimiento_hectarea,
                 cosecha_anual,
                 costo_hectarea,
                 precio_esperado,
                 cant_hectarea)
              VALUES
                (p_nro_sol,
                 l_nro_item,
                 iitf_cultivo.cod_producto,
                 i.cultivo_rendimiento_hectarea,
                 i.cultivo_cosecha_anual,
                 i.cultivo_total_costo,
                 i.cultivo_precio_esperado,
                 iitf_cultivo.nro_hectarea);
            EXCEPTION
              WHEN OTHERS THEN
                ROLLBACK;
                pr_capturar_error;
                RAISE;
            END;
            
          END LOOP;
          IF l_count < 1 THEN
            ROLLBACK;
            raise_application_error(-20999,
                                    'No se encontro datos del producto ' ||
                                    iitf_cultivo.cod_producto);
          END IF;
        END;
      END IF;
    END LOOP;
    
    BEGIN
      -- ganado
      DELETE FROM agropecuaria_pecuario
       WHERE nro_sol = p_nro_sol
         AND nro_item = l_nro_item;
    EXCEPTION
      WHEN OTHERS THEN
        ROLLBACK;
        pr_capturar_error;
        RAISE;
    END;
    
    FOR iitf_ganado IN (SELECT c001 nro_sol,
                               c002 nro_item,
                               c003 cod_producto,
                               c004 cant_venta_mensual
                          FROM apex_collections
                         WHERE collection_name = 'GANADO') LOOP
      IF iitf_ganado.cant_venta_mensual > 0 THEN
        DECLARE
          l_count                NUMBER := 0;
          l_ganado_ingreso_total NUMBER;
          l_ganado_costo_total   NUMBER;
          l_ganado_ingreso_neto  NUMBER;
        BEGIN
          FOR i IN (SELECT porcentaje_costo ganado_porcentaje_costo,
                           peso_promedio    ganado_peso_promedio,
                           precio_promedio  ganado_precio_promedio
                      FROM producto_pecuario
                     WHERE cod_producto = iitf_ganado.cod_producto) LOOP
            l_count                := l_count + 1;
            l_ganado_ingreso_total := iitf_ganado.cant_venta_mensual *
                                      i.ganado_peso_promedio *
                                      i.ganado_precio_promedio;
            l_ganado_costo_total   := (l_ganado_ingreso_total *
                                      i.ganado_porcentaje_costo) / 100;
            l_ganado_ingreso_neto  := l_ganado_ingreso_total -
                                      l_ganado_costo_total;
            BEGIN
              INSERT INTO sc_sol_trabajo_agropecuaria
                (nro_sol, nro_item, cod_producto, nro_orden)
              VALUES
                (p_nro_sol,
                 l_nro_item,
                 iitf_ganado.cod_producto,
                 l_count);
              
            EXCEPTION
              WHEN OTHERS THEN
                ROLLBACK;
                pr_capturar_error;
                RAISE;
            END;
            
            BEGIN
              INSERT INTO agropecuaria_pecuario
                (nro_sol,
                 nro_item,
                 cod_producto,
                 peso_promedio,
                 porcentaje_costo,
                 precio_promedio,
                 cant_venta_mensual)
              VALUES
                (p_nro_sol,
                 l_nro_item,
                 iitf_ganado.cod_producto,
                 i.ganado_peso_promedio,
                 i.ganado_porcentaje_costo,
                 i.ganado_precio_promedio,
                 iitf_ganado.cant_venta_mensual);
            EXCEPTION
              WHEN OTHERS THEN
                ROLLBACK;
                pr_capturar_error;
                RAISE;
            END;
            
          END LOOP;
          IF l_count < 1 THEN
            raise_application_error(-20999,
                                    'No se encontro datos del producto ' ||
                                    iitf_ganado.cod_producto);
          END IF;
        END;
      END IF;
    END LOOP;
    
    BEGIN
      -- derivado
      DELETE FROM agropecuaria_derivado
       WHERE nro_sol = p_nro_sol
         AND nro_item = l_nro_item;
    EXCEPTION
      WHEN OTHERS THEN
        ROLLBACK;
        pr_capturar_error;
        RAISE;
    END;
    
    FOR iitf_derivado IN (SELECT c001 nro_sol,
                                 c002 nro_item,
                                 c003 cod_producto,
                                 c004 cant_venta_mensual
                            FROM apex_collections
                           WHERE collection_name = 'DERIVADO') LOOP
      IF iitf_derivado.cant_venta_mensual > 0 THEN
        DECLARE
          l_count NUMBER := 0;
        BEGIN
          FOR i IN (SELECT precio_venta derivado_precio_venta
                      FROM producto_derivado
                     WHERE cod_producto = iitf_derivado.cod_producto) LOOP
            l_count := l_count + 1;
            BEGIN
              INSERT INTO sc_sol_trabajo_agropecuaria
                (nro_sol, nro_item, cod_producto, nro_orden)
              VALUES
                (p_nro_sol,
                 l_nro_item,
                 iitf_derivado.cod_producto,
                 l_count);
            EXCEPTION
              WHEN OTHERS THEN
                ROLLBACK;
                pr_capturar_error;
                RAISE;
            END;
            BEGIN
              INSERT INTO agropecuaria_derivado
                (nro_sol, nro_item, cod_producto, cantidad, precio_venta)
              VALUES
                (p_nro_sol,
                 l_nro_item,
                 iitf_derivado.cod_producto,
                 iitf_derivado.cant_venta_mensual,
                 i.derivado_precio_venta);
            EXCEPTION
              WHEN OTHERS THEN
                ROLLBACK;
                pr_capturar_error;
                RAISE;
            END;
            
          END LOOP;
        END;
      END IF;
    END LOOP;
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      pr_capturar_error;
      RAISE;
  END pr_procesar_agropecuario;
  
BEGIN
  pkg_ic.inicializar;
  --sc_telefono
  BEGIN
    IF p_id_telefono = 0 THEN
      DECLARE
        l_sysdate DATE := SYSDATE;
      BEGIN
        UPDATE sc_control
           SET ult_id_telefono = ult_id_telefono + 1,
               fec_ult_act     = l_sysdate,
               usr_ult_act     = pkg_ic.g_usuario
         WHERE dummy_key = 1;
        IF SQL%ROWCOUNT < 1 THEN
          ROLLBACK;
          raise_application_error(-20999, 'No se actualizo sc_control');
        END IF;
      END;
      SELECT ult_id_telefono
        INTO l_id_telefono
        FROM sc_control
       WHERE dummy_key = 1;
    ELSE
      l_id_telefono := p_id_telefono;
    END IF;
  END;
  --sc_sol_trabajo
  BEGIN
    IF p_nro_item IS NULL THEN
      SELECT nvl(MAX(nro_item), 0) + 1
        INTO l_nro_item
        FROM sc_sol_trabajo
       WHERE nro_sol = p_nro_sol;
      l_actualizar := FALSE;
    ELSE
      l_nro_item := p_nro_item;
      BEGIN
        SELECT es_empleado,
               es_funcionario_publico,
               es_jubilado,
               es_comer_duenho_indep,
               trabaja_inde,
               es_profesional,
               es_productor_agropecuario,
               empleada_domestica
          INTO l_es_empleado,
               l_es_funcionario_publico,
               l_es_jubilado,
               l_es_comer_duenho_indep,
               l_trabaja_inde,
               l_es_profesional,
               l_es_productor_agropecuario,
               l_empleada_domestica
          FROM sc_sol_trabajo
         WHERE nro_sol = p_nro_sol
           AND nro_item = p_nro_item;
      EXCEPTION
        WHEN no_data_found THEN
          ROLLBACK;
        WHEN OTHERS THEN
          ROLLBACK;
          pr_capturar_error;
          RAISE;
      END;
      
      l_actualizar := TRUE;
    END IF;
    IF p_cod_actividad = '11' THEN
      l_es_empleado := 'S';
    ELSIF p_cod_actividad = '12' THEN
      l_es_funcionario_publico := 'S';
    ELSIF p_cod_actividad = '13' THEN
      l_es_jubilado := 'S';
    ELSIF p_cod_actividad = '14' THEN
      l_es_comer_duenho_indep := 'S';
    ELSIF p_cod_actividad = '15' THEN
      l_trabaja_inde := 'S';
    ELSIF p_cod_actividad = '16' THEN
      l_es_profesional := 'S';
    ELSIF p_cod_actividad = '17' THEN
      l_es_productor_agropecuario := 'S';
    ELSIF p_cod_actividad = '18' THEN
      l_empleada_domestica := 'S';
    END IF;
    BEGIN
      SELECT relacion_laboral
        INTO l_relacion_laboral
        FROM sc_respuestas
       WHERE es_funcionario_publico = l_es_funcionario_publico
         AND es_empleado = l_es_empleado
         AND es_comer_duenho_indep = l_es_comer_duenho_indep
         AND es_productor_agropecuario = l_es_productor_agropecuario
         AND es_profesional = l_es_profesional
         AND trabaja_inde = l_trabaja_inde
         AND empleada_domestica = l_empleada_domestica
         AND es_jubilado = l_es_jubilado
         AND estado = 1 FETCH FIRST 1 rows ONLY;
    EXCEPTION
      WHEN no_data_found THEN
        l_relacion_laboral := 'N/A';
        ROLLBACK;
    END;
    IF l_actualizar THEN
      DECLARE
        l_sysdate DATE := SYSDATE;
      BEGIN
        UPDATE sc_sol_trabajo
           SET denominacion              = p_denominacion,
               direccion                 = p_direccion,
               es_funcionario_publico    = l_es_funcionario_publico,
               es_empleado               = l_es_empleado,
               es_comer_duenho_indep     = l_es_comer_duenho_indep,
               es_productor_agropecuario = l_es_productor_agropecuario,
               es_profesional            = l_es_profesional,
               salario_ml                = p_salario_ml,
               trabaja_inde              = l_trabaja_inde,
               empleada_domestica        = l_empleada_domestica,
               es_jubilado               = l_es_jubilado,
               cod_ocupacion             = p_cod_ocupacion,
               fec_ult_act               = l_sysdate,
               croquis_hablado           = p_croquis_hablado,
               relacion_laboral          = l_relacion_laboral,
               usr_ult_act               = pkg_ic.g_usuario
         WHERE nro_sol = p_nro_sol
           AND nro_item = l_nro_item;
      EXCEPTION
        WHEN OTHERS THEN
          ROLLBACK;
          pr_capturar_error;
          RAISE;
      END;
    ELSE
      DECLARE
        l_sysdate DATE := SYSDATE;
      BEGIN
        INSERT INTO sc_sol_trabajo
          (nro_sol,
           nro_item,
           cod_proveedor,
           denominacion,
           cod_actividad_emp,
           direccion,
           cod_ciudad,
           cod_localidad,
           id_telefono,
           cod_actividad,
           cod_profesion,
           cod_oficio,
           cod_ocupacion,
           cargo,
           salario_ml,
           comision_ml,
           anticipo_ml,
           otros_ing_ml,
           dia_cobro1,
           dia_cobro2,
           estado,
           paga_ips,
           contacto,
           cargo_contacto,
           contacto_llamada,
           datos_obtenidos,
           observacion,
           cod_req_ing,
           req_ing,
           conf_ingreso_laboral,
           es_funcionario_publico,
           es_empleado,
           es_comer_duenho_indep,
           es_productor_agropecuario,
           es_profesional,
           trabaja_inde,
           empleada_domestica,
           croquis_hablado,
           es_jubilado,
           nro_soli,
           vigente,
           relacion_laboral,
           momento_de_carga,
           nro_item_p,
           nuevo_laboral,
           conf_comision,
           conf_otros_ingresos,
           fec_ult_act,
           usr_ult_act)
        VALUES
          (p_nro_sol,
           l_nro_item,
           0,
           p_denominacion,
           '--',
           p_direccion,
           0,
           0,
           l_id_telefono,
           p_cod_actividad,
           '--',
           '--',
           p_cod_ocupacion,
           ' ',
           p_salario_ml,
           0,
           0,
           0,
           0,
           0,
           1,
           l_paga_ips,
           NULL,
           NULL,
           NULL,
           NULL,
           NULL,
           '--',
           '--',
           0,
           l_es_funcionario_publico,
           l_es_empleado,
           l_es_comer_duenho_indep,
           l_es_productor_agropecuario,
           l_es_profesional,
           l_trabaja_inde,
           l_empleada_domestica,
           p_croquis_hablado,
           l_es_jubilado,
           p_nro_soli,
           0,
           l_relacion_laboral,
           'DIGI',
           0,
           0,
           0,
           0,
           l_sysdate,
           pkg_ic.g_usuario);
      EXCEPTION
        WHEN OTHERS THEN
          ROLLBACK;
          pr_capturar_error;
          RAISE;
      END;
    END IF;
  END;
  --independiente / dependiente / agropecuario
  IF l_relacion_laboral = 'INDE' THEN
    pr_procesar_independiente;
  ELSIF l_relacion_laboral = 'DEPE' THEN
    pr_procesar_dependiente;
  ELSIF l_relacion_laboral = 'AGRO' THEN
    pr_procesar_agropecuario;
  END IF;
  COMMIT;
EXCEPTION
  WHEN OTHERS THEN
    pr_capturar_error;
    ROLLBACK;
    RAISE;
END pr_procesar_sol_trabajo;
/***************** datos de credito************************/
PROCEDURE solicitud_activa(p_nro_sol_sol         sc_det.nro_sol%TYPE,
                           p_cod_tipo_mercaderia IN sc_tipo_soli.cod_tipo_mercaderia%TYPE,
                           p_nro_soli            IN OUT sc.nro_soli%TYPE,
                           p_mensaje_error       OUT VARCHAR2) IS
  v_estado_soli sc.estado_soli%TYPE;
BEGIN
  /* verifica que solo haya un solicitud para
  el solicitante por tipo de mercaderia */
  BEGIN
    SELECT estado_soli
      INTO v_estado_soli
      FROM sc a, sc_det b, sc_tipo_soli c
     WHERE a.nro_soli = b.nro_soli
       AND a.estado_soli IN
           ('APRO', 'DIGI', 'REVI', 'REFE', 'VERI', 'ANA')
       AND b.tipo_sol = 'SOL'
       AND b.nro_sol = p_nro_sol_sol
       AND a.cod_tipo_soli = c.cod_tipo_soli
       AND c.cod_tipo_mercaderia = p_cod_tipo_mercaderia
       AND a.vencido = 0
       AND a.nro_soli != p_nro_soli FETCH FIRST 1 rows ONLY;
    p_mensaje_error := 'Verifique, se encontr? al solicitante en la' ||
                       ' solicitud nro.' || p_nro_soli || ' en estado ' ||
                       v_estado_soli;
    raise_application_error(-20001, p_mensaje_error);
  EXCEPTION
    WHEN no_data_found THEN
      NULL;
      ROLLBACK;
    WHEN OTHERS THEN
      ROLLBACK;
      p_mensaje_error := 'Error al verificar la participaci?n del solicitante.' ||
                         SQLERRM;
      raise_application_error(-20001, p_mensaje_error);
  END;
END;
PROCEDURE pr_gestion_venta_cliente(p_cod_cliente             IN gestion_venta_cliente.cod_cliente%TYPE,
                                   p_periodo                 IN OUT gestion_venta_cliente.periodo%TYPE,
                                   p_estado_cliente          OUT gestion_venta_cliente.estado_cliente%TYPE,
                                   p_fase                    OUT gestion_venta_cliente.fase%TYPE,
                                   p_fase_inicial            OUT gestion_venta_cliente.fase_inicial%TYPE,
                                   p_tipo_comercio           IN OUT gestion_venta_cliente.tipo_comercio%TYPE,
                                   p_nro_cred_acti           OUT gestion_venta_cliente.nro_cred_acti%TYPE,
                                   p_nro_cuotas_pend         OUT gestion_venta_cliente.nro_cuotas_pend%TYPE,
                                   p_nro_cuotas_venc         OUT gestion_venta_cliente.nro_cuotas_venc%TYPE,
                                   p_nro_cuota_mayor         OUT gestion_venta_cliente.nro_cuota_mayor%TYPE,
                                   p_nro_dias_vencido        OUT gestion_venta_cliente.nro_dias_vencido%TYPE,
                                   p_nro_dias_vencido_actual OUT gestion_venta_cliente.nro_dias_vencido_actual%TYPE,
                                   p_cod_conducta            OUT gestion_venta_cliente.cod_conducta%TYPE,
                                   p_cod_tipo_mercaderia     IN OUT gestion_venta_cliente.cod_tipo_mercaderia%TYPE,
                                   p_fec_ult_vta             OUT gestion_venta_cliente.fec_ult_vta%TYPE,
                                   p_cod_vendedor_ult_vta    OUT gestion_venta_cliente.cod_vendedor_ult_vta%TYPE,
                                   p_cod_sucursal_vta        OUT gestion_venta_cliente.cod_sucursal_vta%TYPE,
                                   p_cod_region_venta        OUT gestion_venta_cliente.cod_region_venta%TYPE,
                                   p_cod_vendedor            OUT gestion_venta_cliente.cod_vendedor%TYPE,
                                   p_login                   OUT gestion_venta_cliente.login%TYPE,
                                   p_fec_ult_pago            OUT gestion_venta_cliente.fec_ult_pago%TYPE,
                                   p_ult_tipo_recibo         OUT gestion_venta_cliente.ult_tipo_recibo%TYPE,
                                   p_venta_periodo           OUT gestion_venta_cliente.venta_periodo%TYPE,
                                   p_cod_zona_cobranza       OUT gestion_venta_cliente.cod_zona_cobranza%TYPE,
                                   p_cod_subzona_cobranza    OUT gestion_venta_cliente.cod_subzona_cobranza%TYPE,
                                   p_cod_sucursal_plla       OUT gestion_venta_cliente.cod_sucursal_plla%TYPE,
                                   p_fec_planilla            OUT gestion_venta_cliente.fec_planilla%TYPE,
                                   p_nro_planilla            OUT gestion_venta_cliente.nro_planilla%TYPE,
                                   p_nro_item                OUT gestion_venta_cliente.nro_item%TYPE,
                                   p_cod_situ_ult            OUT gestion_venta_cliente.cod_situ_ult%TYPE,
                                   p_situacion               OUT gestion_venta_cliente.situacion%TYPE,
                                   p_fec_ult_situ            OUT gestion_venta_cliente.fec_ult_situ%TYPE,
                                   p_usr_ult_act             OUT gestion_venta_cliente.usr_ult_act%TYPE,
                                   p_fec_ult_act             OUT gestion_venta_cliente.fec_ult_act%TYPE,
                                   p_status                  OUT NUMBER,
                                   p_mensaje_error           OUT VARCHAR2) IS
  v_texto VARCHAR2(100);
BEGIN
  p_periodo := trunc(p_periodo);
  BEGIN
    SELECT a.estado_cliente,
           a.fase,
           a.fase_inicial,
           a.tipo_comercio,
           a.nro_cred_acti,
           a.nro_cuotas_pend,
           a.nro_cuotas_venc,
           a.nro_cuota_mayor,
           a.nro_dias_vencido,
           a.nro_dias_vencido_actual,
           a.cod_conducta,
           a.cod_tipo_mercaderia,
           a.fec_ult_vta,
           a.cod_vendedor_ult_vta,
           a.cod_sucursal_vta,
           a.cod_region_venta,
           a.cod_vendedor,
           a.login,
           a.fec_ult_pago,
           a.ult_tipo_recibo,
           a.venta_periodo,
           a.cod_zona_cobranza,
           a.cod_subzona_cobranza,
           a.cod_sucursal_plla,
           a.fec_planilla,
           a.nro_planilla,
           a.nro_item,
           a.cod_situ_ult,
           a.situacion,
           a.fec_ult_situ,
           a.usr_ult_act,
           a.fec_ult_act
      INTO p_estado_cliente,
           p_fase,
           p_fase_inicial,
           p_tipo_comercio,
           p_nro_cred_acti,
           p_nro_cuotas_pend,
           p_nro_cuotas_venc,
           p_nro_cuota_mayor,
           p_nro_dias_vencido,
           p_nro_dias_vencido_actual,
           p_cod_conducta,
           p_cod_tipo_mercaderia,
           p_fec_ult_vta,
           p_cod_vendedor_ult_vta,
           p_cod_sucursal_vta,
           p_cod_region_venta,
           p_cod_vendedor,
           p_login,
           p_fec_ult_pago,
           p_ult_tipo_recibo,
           p_venta_periodo,
           p_cod_zona_cobranza,
           p_cod_subzona_cobranza,
           p_cod_sucursal_plla,
           p_fec_planilla,
           p_nro_planilla,
           p_nro_item,
           p_cod_situ_ult,
           p_situacion,
           p_fec_ult_situ,
           p_usr_ult_act,
           p_fec_ult_act
      FROM gestion_venta_cliente a
     WHERE a.cod_cliente = p_cod_cliente
       AND a.periodo = p_periodo;
  EXCEPTION
    WHEN no_data_found THEN
      NULL;
      ROLLBACK;
    WHEN OTHERS THEN
      ROLLBACK;
      p_mensaje_error := 'Error al Recuperar Datos del Cliente: ' ||
                         p_cod_cliente || '. ' || 'Del periodo: ' ||
                         p_periodo;
  END;
  /* select count(distinct a.nro_comprobante),
          count(a.nro_cuota),
          sum(case when a.fec_vencimiento < date('today') then
                                        1 else 0 end),
          interval('day',date('today')
                            - ifnull(min(a.fec_vencimiento),'')),
          max(nro_cuota)
       into p_nro_cred_acti,
            p_nro_cuotas_pend,
            p_nro_cuotas_venc,
            p_nro_dias_vencido,
            p_nro_cuota_mayor
       from clientes_movs a
       join clientes b
         on a.cod_cliente = b.cod_cliente
   where b.cod_tipo_cliente != 'EMPL'
     and b.tipo_comercio     = 'MINORISTA'
     and a.dc          = 1
     and a.importe_dc  > ifnull(a.importe_cobrado,0)
     and a.cod_cliente = p_cod_cliente
   group by a.cod_cliente;
  if iierrornumber != 0 then
      texto = 'Trigger: Error al seleccionar nro_creditos_activos';
      raise error 1 texto with destination=(session);
      return 1;
  elseif iirowcount <= 0 then
      nro_cred_acti = 0;
      nro_cuotas_pend = 0;
      nro_cuotas_venc = 0;
      nro_dias_vencido = 0;
      nro_cuota_mayor = 0;
  endif;
  commit;
  if (fase = 'FASE3' or fase = 'CALL ') and nro_cred_acti > 0 then
      fase = ''; \*no esta en fase 3  ni fase call*\
  elseif nro_cred_acti > 1 then
      fase = ''; \* no esta mas en fase ya que sac? nuevos creditos *\
  endif;
  \* fin diana *\
  return 0;*/
END;
PROCEDURE pr_fase_de_venta(p_cod_cliente             IN OUT sc_sol.cod_cliente%TYPE,
                           p_nro_soli                IN sc_det.nro_soli%TYPE,
                           p_periodo                 IN OUT gestion_venta_cliente.periodo%TYPE,
                           p_estado_cliente          OUT gestion_venta_cliente.estado_cliente%TYPE,
                           p_fase_inicial            OUT gestion_venta_cliente.fase_inicial%TYPE,
                           p_tipo_comercio           IN OUT gestion_venta_cliente.tipo_comercio%TYPE,
                           p_nro_cred_acti           OUT gestion_venta_cliente.nro_cred_acti%TYPE,
                           p_nro_cuotas_pend         OUT gestion_venta_cliente.nro_cuotas_pend%TYPE,
                           p_nro_cuotas_venc         OUT gestion_venta_cliente.nro_cuotas_venc%TYPE,
                           p_nro_cuota_mayor         OUT gestion_venta_cliente.nro_cuota_mayor%TYPE,
                           p_nro_dias_vencido        OUT gestion_venta_cliente.nro_dias_vencido%TYPE,
                           p_nro_dias_vencido_actual OUT gestion_venta_cliente.nro_dias_vencido_actual%TYPE,
                           p_cod_conducta            OUT gestion_venta_cliente.cod_conducta%TYPE,
                           p_cod_tipo_mercaderia     IN OUT gestion_venta_cliente.cod_tipo_mercaderia%TYPE,
                           p_fec_ult_vta             OUT gestion_venta_cliente.fec_ult_vta%TYPE,
                           p_cod_vendedor_ult_vta    OUT gestion_venta_cliente.cod_vendedor_ult_vta%TYPE,
                           p_cod_sucursal_vta        OUT gestion_venta_cliente.cod_sucursal_vta%TYPE,
                           p_cod_region_venta        OUT gestion_venta_cliente.cod_region_venta%TYPE,
                           p_cod_vendedor            IN OUT gestion_venta_cliente.cod_vendedor%TYPE,
                           p_login                   OUT gestion_venta_cliente.login%TYPE,
                           p_fec_ult_pago            OUT gestion_venta_cliente.fec_ult_pago%TYPE,
                           p_ult_tipo_recibo         OUT gestion_venta_cliente.ult_tipo_recibo%TYPE,
                           p_venta_periodo           OUT gestion_venta_cliente.venta_periodo%TYPE,
                           p_cod_zona_cobranza       OUT gestion_venta_cliente.cod_zona_cobranza%TYPE,
                           p_cod_subzona_cobranza    OUT gestion_venta_cliente.cod_subzona_cobranza%TYPE,
                           p_cod_sucursal_plla       OUT gestion_venta_cliente.cod_sucursal_plla%TYPE,
                           p_fec_planilla            OUT gestion_venta_cliente.fec_planilla%TYPE,
                           p_nro_planilla            OUT gestion_venta_cliente.nro_planilla%TYPE,
                           p_nro_item                OUT gestion_venta_cliente.nro_item%TYPE,
                           p_cod_situ_ult            OUT gestion_venta_cliente.cod_situ_ult%TYPE,
                           p_situacion               OUT gestion_venta_cliente.situacion%TYPE,
                           p_fec_ult_situ            OUT gestion_venta_cliente.fec_ult_situ%TYPE,
                           p_usr_ult_act             OUT gestion_venta_cliente.usr_ult_act%TYPE,
                           p_fec_ult_act             OUT gestion_venta_cliente.fec_ult_act%TYPE,
                           p_mensaje_error           OUT VARCHAR2) IS
  v_fase   VARCHAR2(5);
  v_status NUMBER;
BEGIN
  /*est? en fase ?*/
  BEGIN
    SELECT cod_cliente
      INTO p_cod_cliente
      FROM sc_det, sc_sol
     WHERE sc_det.nro_soli = p_nro_soli
       AND sc_det.tipo_sol = 'SOL'
       AND sc_det.nro_sol = sc_sol.nro_sol;
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      p_mensaje_error := 'Error al seleccionar codigo cliente.';
      raise_application_error(-20001, p_mensaje_error, TRUE);
  END;
  IF p_cod_cliente > 0 THEN
    v_fase := '';
    BEGIN
      pkg_solicitud_creditos.pr_gestion_venta_cliente(p_cod_cliente             => p_cod_cliente,
                                                      p_periodo                 => p_periodo,
                                                      p_estado_cliente          => p_estado_cliente,
                                                      p_fase                    => v_fase,
                                                      p_fase_inicial            => p_fase_inicial,
                                                      p_tipo_comercio           => p_tipo_comercio,
                                                      p_nro_cred_acti           => p_nro_cred_acti,
                                                      p_nro_cuotas_pend         => p_nro_cuotas_pend,
                                                      p_nro_cuotas_venc         => p_nro_cuotas_venc,
                                                      p_nro_cuota_mayor         => p_nro_cuota_mayor,
                                                      p_nro_dias_vencido        => p_nro_dias_vencido,
                                                      p_nro_dias_vencido_actual => p_nro_dias_vencido_actual,
                                                      p_cod_conducta            => p_cod_conducta,
                                                      p_cod_tipo_mercaderia     => p_cod_tipo_mercaderia,
                                                      p_fec_ult_vta             => p_fec_ult_vta,
                                                      p_cod_vendedor_ult_vta    => p_cod_vendedor_ult_vta,
                                                      p_cod_sucursal_vta        => p_cod_sucursal_vta,
                                                      p_cod_region_venta        => p_cod_region_venta,
                                                      p_cod_vendedor            => p_cod_vendedor,
                                                      p_login                   => p_login,
                                                      p_fec_ult_pago            => p_fec_ult_pago,
                                                      p_ult_tipo_recibo         => p_ult_tipo_recibo,
                                                      p_venta_periodo           => p_venta_periodo,
                                                      p_cod_zona_cobranza       => p_cod_zona_cobranza,
                                                      p_cod_subzona_cobranza    => p_cod_subzona_cobranza,
                                                      p_cod_sucursal_plla       => p_cod_sucursal_plla,
                                                      p_fec_planilla            => p_fec_planilla,
                                                      p_nro_planilla            => p_nro_planilla,
                                                      p_nro_item                => p_nro_item,
                                                      p_cod_situ_ult            => p_cod_situ_ult,
                                                      p_situacion               => p_situacion,
                                                      p_fec_ult_situ            => p_fec_ult_situ,
                                                      p_usr_ult_act             => p_usr_ult_act,
                                                      p_fec_ult_act             => p_fec_ult_act,
                                                      p_status                  => v_status,
                                                      p_mensaje_error           => p_mensaje_error);
    EXCEPTION
      WHEN OTHERS THEN
        ROLLBACK;
        p_mensaje_error := 'Error al seleccionar fase cliente...';
        raise_application_error(-20001, p_mensaje_error);
    END;
    IF (v_fase = 'FASE2' OR v_fase = 'FASE3' OR v_fase = 'FASE4') THEN
      NULL;
      /*callframe sol01857(cod_cliente = cod_cliente,
      cod_tipo_mercaderia = cod_tipo_mercaderia);*/
    END IF;
  END IF;
EXCEPTION
  WHEN OTHERS THEN
    ROLLBACK;
    raise_application_error(-20001, p_mensaje_error);
END;
PROCEDURE promo_cupon_banco_familiar(p_nro_sol_sol   IN sc_sol.nro_sol%TYPE,
                                     p_cod_tipo_soli IN sc.cod_tipo_soli%TYPE,
                                     p_nro_cedula    OUT sc_sol.nro_cedula%TYPE,
                                     p_nro_cupon_bf  OUT pg_cupon_banco_familiar.nro_cupon%TYPE,
                                     p_mensaje_error OUT VARCHAR2) IS
BEGIN
  IF p_cod_tipo_soli IN ('02', '03') THEN
    BEGIN
      SELECT nro_cedula
        INTO p_nro_cedula
        FROM sc_sol
       WHERE nro_sol = p_nro_sol_sol;
    EXCEPTION
      WHEN no_data_found THEN
        ROLLBACK;
        p_mensaje_error := 'No existe solicitante con el nro de sol: ' ||
                           p_nro_sol_sol;
        raise_application_error(-20001, p_mensaje_error);
      WHEN OTHERS THEN
        ROLLBACK;
        p_mensaje_error := 'Error al seleccionar n?mero de c?dula...';
        raise_application_error(-20001, p_mensaje_error);
    END;
    BEGIN
      SELECT nro_cupon
        INTO p_nro_cupon_bf
        FROM pg_cupon_banco_familiar
       WHERE nro_cedula = p_nro_cedula
         AND estado_cupon = 'PEND'
       ORDER BY nro_cupon ASC;
    EXCEPTION
      WHEN no_data_found THEN
        ROLLBACK;
        p_mensaje_error := 'Verifique!! No se encuentra cupon de pago Banco Familiar' || ' ' ||
                           'para la utilizacion de este Tipo Soli...' ||
                           'Nro.Cedula:' || p_nro_cedula;
        raise_application_error(-20001, p_mensaje_error);
      WHEN OTHERS THEN
        ROLLBACK;
        p_mensaje_error := 'Error al seleccionar cupones de pago de Banco Familiar...';
        raise_application_error(-20001, p_mensaje_error);
    END;
  END IF;
  COMMIT;
END;
PROCEDURE pr_validaciones_forma_pago(p_es_empleado_alex    IN NUMBER,
                                     p_forma_pago          IN sc.cod_forma_pago%TYPE,
                                     p_cod_tipo_soli       IN sc.cod_tipo_soli%TYPE,
                                     p_nro_soli            IN OUT sc.nro_soli%TYPE,
                                     p_w_cod_tipo_vendedor IN VARCHAR2,
                                     p_cod_origen_ges_crm  IN OUT VARCHAR2,
                                     p_cod_identificador   IN OUT VARCHAR2,
                                     p_w_cod_cliente       OUT VARCHAR2,
                                     p_mensaje_error       OUT VARCHAR2) IS
  v_fec_ult_act sc_sol.fec_ult_act%TYPE := current_date;
  v_g_usuario   VARCHAR2(50);
  v_forma_pago  sc.cod_forma_pago%TYPE;
BEGIN
  pkg_ic.inicializar;
  v_g_usuario := pkg_ic.g_usuario;
  IF nvl(p_es_empleado_alex, 0) = 1 THEN
    v_forma_pago := '07';
  END IF;
  BEGIN
    UPDATE sc
       SET cod_tipo_soli  = p_cod_tipo_soli,
           cod_forma_pago = p_forma_pago,
           usr_ult_act    = v_g_usuario,
           fec_ult_act    = v_fec_ult_act
     WHERE nro_soli = p_nro_soli;
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      raise_application_error(-20001, 'Error al actualizar SC...');
  END;
  IF p_w_cod_tipo_vendedor = 'ECOMERCE' OR
     p_w_cod_tipo_vendedor = 'TELEMKT' THEN
    BEGIN
      SELECT cod_cliente
        INTO p_w_cod_cliente
        FROM sc_det, sc_sol
       WHERE sc_det.nro_soli = p_nro_soli
         AND sc_det.tipo_sol = 'SOL'
         AND sc_det.nro_sol = sc_sol.nro_sol;
    EXCEPTION
      WHEN no_data_found THEN
        ROLLBACK;
        p_mensaje_error := 'No se selecciono cliente en la solicitud nro: ';
        raise_application_error(-20001, p_mensaje_error);
      WHEN OTHERS THEN
        ROLLBACK;
        p_mensaje_error := 'Error al seleccionar codigo cliente.';
        raise_application_error(-20001, p_mensaje_error);
    END;
  END IF;
  IF p_cod_origen_ges_crm IS NULL THEN
    p_cod_origen_ges_crm := 'SOLICITUD';
  END IF;
  IF p_cod_identificador = ' ' THEN
    p_cod_identificador := '--';
  END IF;
  IF p_w_cod_tipo_vendedor = 'VENINDEP' THEN
    p_cod_origen_ges_crm := 'VENINDEP';
    p_cod_identificador  := '--';
  END IF;
  COMMIT;
EXCEPTION
  WHEN OTHERS THEN
    ROLLBACK;
    raise_application_error(-20001, p_mensaje_error || SQLERRM, TRUE);
END;
PROCEDURE pr_insert_articulos(p_nro_soli      IN sc_articulo.nro_soli%TYPE,
                              p_cod_articulo  IN sc_articulo.cod_articulo%TYPE,
                              p_en_promo      IN sc_articulo.en_promo%TYPE DEFAULT 0,
                              p_nro_promo     IN sc_articulo.nro_promo%TYPE DEFAULT 0,
                              p_cantidad      IN sc_articulo.cantidad%TYPE,
                              p_mensaje_error OUT VARCHAR2) IS
  l_en_promo    sc_articulo.en_promo%TYPE := nvl(p_en_promo, 0);
  l_nro_promo   sc_articulo.nro_promo%TYPE := nvl(p_nro_promo, 0);
  v_fec_ult_act sc_articulo.fec_ult_act%TYPE := current_date;
BEGIN
  pkg_ic.inicializar;
  BEGIN
    INSERT INTO sc_articulo
      (nro_soli,
       cod_articulo,
       en_promo,
       nro_promo,
       cantidad,
       fec_ult_act,
       usr_ult_act)
    VALUES
      (p_nro_soli,
       p_cod_articulo,
       l_en_promo,
       l_nro_promo,
       p_cantidad,
       v_fec_ult_act,
       pkg_ic.g_usuario);
    COMMIT;
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      pr_capturar_error(p_nro_soli || ',' || p_cod_articulo || ',' ||
                        p_en_promo || ',' || p_nro_promo || ',' ||
                        p_cantidad || ',' || p_mensaje_error);
      raise_application_error(-20001,
                              'Error al insertar sc articulo... ',
                              TRUE);
  END;
END;
PROCEDURE pr_sol11863(p_cod_articulo    IN sc_detalle_cuotas.cod_articulo%TYPE,
                      p_nro_soli        IN sc_detalle_cuotas.nro_soli%TYPE,
                      p_cantidad        IN sc_detalle_cuotas.nro_soli%TYPE,
                      p_entrega_inicial IN sc_detalle_cuotas.monto_cuota%TYPE,
                      p_cant_cuotas_aux IN NUMBER,
                      p_precio_vta_unit IN NUMBER,
                      p_mensaje_error   OUT VARCHAR2) IS
  v_en_promo            NUMBER;
  v_cod_articulo_w      VARCHAR2(15);
  v_precio              NUMBER;
  v_precio_ml           NUMBER;
  v_nro_orden           NUMBER;
  v_vehiculo            NUMBER;
  v_monto_cuota         NUMBER;
  v_descripcion         VARCHAR2(60);
  v_tipo_promo          VARCHAR2(60);
  v_cod_grupo           VARCHAR2(60);
  v_ent_ini_soli        NUMBER;
  v_mon_cuota_soli      NUMBER;
  v_can_cuota_soli      NUMBER;
  v_nro_cuota           NUMBER;
  v_cantidad_w          NUMBER;
  v_mon_soli            NUMBER;
  v_entrega_ini_ori     NUMBER;
  v_aux                 NUMBER;
  v_precio_vta_unit_aux NUMBER;
  v_fecha               DATE;
  v_g_usuario           sc_detalle_cuotas.usr_alta%TYPE;
BEGIN
  pkg_ic.inicializar;
  v_g_usuario := pkg_ic.g_usuario;
  IF v_can_cuota_soli <= 0 THEN
    v_can_cuota_soli := p_cant_cuotas_aux;
  END IF;
  v_mon_cuota_soli      := p_precio_vta_unit / v_can_cuota_soli;
  v_mon_cuota_soli      := v_mon_cuota_soli * p_cantidad;
  v_precio_vta_unit_aux := p_precio_vta_unit * p_cantidad;
  v_nro_cuota           := 1;
  v_aux                 := 0;
  FOR nro_cuota IN 1 .. v_can_cuota_soli LOOP
    IF nro_cuota = v_can_cuota_soli THEN
      v_mon_cuota_soli := v_precio_vta_unit_aux - v_aux;
    END IF;
    IF v_mon_cuota_soli >= 1001 AND v_mon_cuota_soli <= 10000 THEN
      /* +- 100  */
      v_mon_cuota_soli := v_mon_cuota_soli / 100 * 100;
    ELSIF v_mon_cuota_soli > 10000 THEN
      v_mon_cuota_soli := v_mon_cuota_soli / 1000 * 1000;
    END IF;
    DECLARE
      l_sysdate DATE := SYSDATE;
    BEGIN
      INSERT INTO sc_detalle_cuotas
        (nro_soli,
         cod_articulo,
         nro_cuota,
         monto_cuota,
         fec_alta,
         usr_alta,
         fec_ult_act,
         usr_ult_act)
      VALUES
        (p_nro_soli,
         p_cod_articulo,
         v_nro_cuota,
         v_mon_cuota_soli,
         l_sysdate,
         v_g_usuario,
         l_sysdate,
         v_g_usuario);
    EXCEPTION
      WHEN OTHERS THEN
        ROLLBACK;
        p_mensaje_error := 'Error al insertar detalle cuotas...';
        raise_application_error(-20001, p_mensaje_error);
    END;
    v_aux       := v_aux + v_mon_cuota_soli;
    v_nro_cuota := nro_cuota + 1;
  END LOOP;
  BEGIN
    UPDATE sc_detalle_cuotas
       SET monto_cuota = p_entrega_inicial
     WHERE nro_soli = p_nro_soli
       AND nro_cuota = 0;
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      p_mensaje_error := 'Error al actualizar entrega inicial sc_detalle_cuota...';
  END;
  --if g_rows <= 0 then
  DECLARE
    l_sysdate DATE := SYSDATE;
  BEGIN
    INSERT INTO sc_detalle_cuotas
      (nro_soli,
       cod_articulo,
       nro_cuota,
       monto_cuota,
       fec_alta,
       usr_alta,
       fec_ult_act,
       usr_ult_act)
    VALUES
      (p_nro_soli,
       p_cod_articulo,
       0,
       p_entrega_inicial,
       l_sysdate,
       v_g_usuario,
       l_sysdate,
       v_g_usuario);
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      p_mensaje_error := 'Error al insertar entrega inicial sc_detalle_cuota...';
  END;
  --end if;
  BEGIN
    UPDATE sc
       SET ent_ini_soli = p_entrega_inicial
     WHERE nro_soli = p_nro_soli;
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      p_mensaje_error := 'Error al actualizar entrega inicial de la solicitud...';
  END;
  BEGIN
    DELETE FROM sc_cuotas WHERE nro_soli = p_nro_soli;
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      p_mensaje_error := 'Error al eliminar cuotas de la solicitud...';
  END;
  BEGIN
    SELECT nro_cuota, SUM(monto_cuota)
      INTO v_nro_cuota, v_monto_cuota
      FROM sc_detalle_cuotas
     WHERE nro_soli = p_nro_soli
     GROUP BY nro_cuota;
  EXCEPTION
    WHEN no_data_found THEN
      ROLLBACK;
    WHEN OTHERS THEN
      ROLLBACK;
  END;
  
  BEGIN
    IF v_monto_cuota >= 1001 AND v_monto_cuota <= 10000 THEN
      /* +- 100  */
      v_monto_cuota := v_monto_cuota / 100 * 100;
    ELSIF v_monto_cuota > 10000 THEN
      v_monto_cuota := v_monto_cuota / 1000 * 1000; /* +- 1000 */
    END IF;
    DECLARE
      l_sysdate DATE := SYSDATE;
    BEGIN
      INSERT INTO sc_cuotas
        (usr_apro,
         monto_cuota_apro,
         nro_soli,
         nro_cuota,
         usr_ult_act,
         fec_ult_act,
         usr_alta,
         fec_alta,
         fec_hor_apro,
         monto_cuota)
      VALUES
        ('--',
         0,
         p_nro_soli,
         v_nro_cuota,
         v_g_usuario,
         l_sysdate,
         v_g_usuario,
         l_sysdate,
         l_sysdate,
         v_monto_cuota);
    EXCEPTION
      WHEN OTHERS THEN
        ROLLBACK;
        p_mensaje_error := 'Error al insertar cuotas de la solicitud...';
    END;
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      p_mensaje_error := 'Error al seleccionar cuotas de los art?culos...';
  END;
  BEGIN
    SELECT nvl(SUM(monto_cuota), 0)
      INTO v_mon_soli
      FROM sc_detalle_cuotas
     WHERE nro_soli = p_nro_soli;
  EXCEPTION
    WHEN no_data_found THEN
      NULL;
      ROLLBACK;
    WHEN OTHERS THEN
      p_mensaje_error := 'Error al seleccionar monto soli...';
      ROLLBACK;
  END;
  -- if g_rows <= 0 then
  BEGIN
    SELECT mon_soli INTO v_mon_soli FROM sc WHERE nro_soli = p_nro_soli;
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      p_mensaje_error := 'Error al actualizar datos de la Solicitud...';
  END;
  BEGIN
    SELECT nvl(SUM(monto_cuota), 0), nvl(nro_cuota, 0)
      INTO v_mon_cuota_soli, v_nro_cuota
      FROM sc_detalle_cuotas
     WHERE nro_soli = p_nro_soli
     GROUP BY nro_cuota
     ORDER BY 1 DESC;
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      p_mensaje_error := 'Error al seleccionar monto cuota...';
  END;
  -- if g_rows <= 0 then
  BEGIN
    SELECT mon_cuota_soli
      INTO v_mon_cuota_soli
      FROM sc
     WHERE nro_soli = p_nro_soli;
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      p_mensaje_error := 'Error al actualizar datos de la Solicitud...';
  END;
  --  end if;
  BEGIN
    SELECT nvl(MAX(nro_cuota), 0)
      INTO v_can_cuota_soli
      FROM sc_detalle_cuotas
     WHERE nro_soli = p_nro_soli;
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      p_mensaje_error := 'Error al seleccionar cuota...';
  END;
  --end if;
  -- if g_rows <= 0 then
  BEGIN
    SELECT can_cuota_soli
      INTO v_can_cuota_soli
      FROM sc
     WHERE nro_soli = p_nro_soli;
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      p_mensaje_error := 'Error al actualizar datos de la Solicitud...';
  END;
  --  end if;
  BEGIN
    UPDATE sc
       SET mon_cuota_soli = v_mon_cuota_soli,
           mon_soli       = v_mon_soli,
           can_cuota_soli = v_can_cuota_soli
     WHERE nro_soli = p_nro_soli;
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      p_mensaje_error := 'Error al actualizar datos de la Solicitud...';
  END;
  COMMIT;
END;
PROCEDURE pr_debito_auto_incl(p_nro_soli           IN sc_da.nro_soli%TYPE,
                              p_nro_sol_sol        IN sc_da.nro_sol%TYPE,
                              p_nro_cuenta         IN sc_da.nro_cuenta%TYPE,
                              p_nro_tarjeta_debito IN sc_da.nro_tarjeta_debito%TYPE,
                              p_nro_carnet         IN sc_da.nro_carnet%TYPE,
                              p_nro_orden_compra   IN sc_da.nro_orden_compra%TYPE,
                              p_debito_auto        IN NUMBER,
                              p_retorno            OUT NUMBER,
                              p_mensaje_error      OUT VARCHAR2) IS
  v_fec_ult_act sc_sol.fec_ult_act%TYPE := current_date;
BEGIN
  pkg_ic.inicializar;
  BEGIN
    DELETE FROM sc_da
     WHERE nro_soli = p_nro_soli
       AND nro_sol = p_nro_sol_sol;
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      p_mensaje_error := 'Error al eliminar d?bito autom?tico... ' ||
                         SQLERRM;
  END;
  IF p_debito_auto = 0 THEN
    p_retorno := 0;
  ELSE
    BEGIN
      INSERT INTO sc_da
        (nro_soli,
         nro_sol,
         nro_cuenta,
         nro_tarjeta_debito,
         nro_carnet,
         nro_orden_compra,
         fec_ult_act,
         usr_ult_act)
      VALUES
        (p_nro_soli,
         p_nro_sol_sol,
         p_nro_cuenta,
         p_nro_tarjeta_debito,
         p_nro_carnet,
         p_nro_orden_compra,
         v_fec_ult_act,
         pkg_ic.g_usuario);
      COMMIT;
    EXCEPTION
      WHEN OTHERS THEN
        ROLLBACK;
        p_mensaje_error := 'Error al insertar d?bito autom?tico... ' ||
                           SQLERRM;
        raise_application_error(-20001, p_mensaje_error);
    END;
  END IF;
  COMMIT;
END;
PROCEDURE pr_sgte_nro_soli(p_nro_soli      IN OUT NUMBER,
                           p_mensaje_error OUT VARCHAR2) IS
  v_ult_nro_soli sc_control.ult_nro_soli%TYPE := 0;
BEGIN
  BEGIN
    UPDATE sc_control
       SET ult_nro_soli = v_ult_nro_soli + 1
     WHERE dummy_key = 1;
  EXCEPTION
    WHEN no_data_found THEN
      ROLLBACK;
      p_mensaje_error := 'No se actualizo el ult nro soli.';
    WHEN OTHERS THEN
      ROLLBACK;
      p_mensaje_error := 'Error al actualizar ult nro soli';
  END;
  BEGIN
    SELECT ult_nro_soli
      INTO v_ult_nro_soli
      FROM sc_control
     WHERE dummy_key = 1;
  EXCEPTION
    WHEN no_data_found THEN
      ROLLBACK;
      p_mensaje_error := 'No se seleccion? el ult nro soli.';
    WHEN OTHERS THEN
      ROLLBACK;
      p_mensaje_error := 'Error al seleccionar ult nro soli';
  END;
  COMMIT;
  p_nro_soli := v_ult_nro_soli;
END;
PROCEDURE pr_proc_incluir(p_g_cod_vendedor  IN vendedores.cod_vendedor%TYPE,
                          p_nro_sol_sol     IN sc_sol.nro_sol%TYPE,
                          p_nro_soli        IN OUT sc_det.nro_soli%TYPE,
                          p_nro_sol_csol    IN sc_sol.nro_sol%TYPE,
                          p_g_fec_ingrid    IN sc.fec_soli%TYPE,
                          p_cod_sucursal    IN sc.cod_sucursal%TYPE,
                          p_cod_tipo_soli   IN sc.cod_tipo_soli%TYPE,
                          p_cod_forma_pago  IN sc.cod_forma_pago%TYPE,
                          p_ent_ini_soli    IN sc.ent_ini_soli%TYPE,
                          p_mon_cuota_soli  IN sc.mon_cuota_soli%TYPE,
                          p_mon_soli        IN sc.mon_soli%TYPE,
                          p_can_cuota_soli  IN sc.can_cuota_soli%TYPE,
                          p_nro_item_trab   IN sc_sol_trabajo.nro_item%TYPE,
                          p_cod_forma_vta_p IN sc.cod_forma_vta%TYPE,
                          p_id_carga_rapida IN NUMBER,
                          p_inserto         IN NUMBER,
                          p_mensaje_error   OUT VARCHAR2) IS
  v_nro_cedula        NUMBER;
  v_vend_activo       NUMBER;
  v_cod_tipo_vendedor VARCHAR2(50);
  v_fec_ult_act       sc_det.fec_ult_act%TYPE := current_date;
  v_usuario           VARCHAR2(50);
  v_fec_hor_digi      sc.fec_hor_digi%TYPE := current_date;
  v_fec_mov           sc_seguimiento.fec_mov%TYPE := current_date;
  --l_intento         = i1     not null,
  v_lnro_soli NUMBER;
  v_l_obs     VARCHAR2(100);
  --   nro_soli        = i4         not null
BEGIN
  pkg_ic.inicializar;
  v_usuario := pkg_ic.g_usuario;
  IF p_g_cod_vendedor = 'N/A' THEN
    p_mensaje_error := 'Para crear una solicitud su usuario debe estar asociado ' ||
                       'a su codigo de vendedor.';
    raise_application_error(-20001, p_mensaje_error);
  END IF;
  BEGIN
    SELECT a.vend_activo, a.cod_tipo_vendedor
      INTO v_vend_activo, v_cod_tipo_vendedor
      FROM vendedores a
     WHERE a.cod_vendedor = p_g_cod_vendedor;
  EXCEPTION
    WHEN no_data_found THEN
      ROLLBACK;
      p_mensaje_error := 'Verifique.No se selecciono un vendedor con el codigo.: ';
      raise_application_error(-20001, p_mensaje_error);
    WHEN OTHERS THEN
      ROLLBACK;
      p_mensaje_error := 'Error al seleccionar datos del vendedor.';
      raise_application_error(-20001, p_mensaje_error);
  END;
  IF v_vend_activo = 0 THEN
    ROLLBACK;
    p_mensaje_error := 'Verifique, su c?digo de vendedor ' ||
                       p_g_cod_vendedor || ' no est? activo...';
    raise_application_error(-20001, p_mensaje_error);
  END IF;
  IF v_cod_tipo_vendedor = 'TSV' THEN
    ROLLBACK;
    p_mensaje_error := 'Verifique. Un vendedor TSV no puede cargar Solicitud de Credito' ||
                       'Nro.Soli...: ' || p_nro_soli;
    raise_application_error(-20001, p_mensaje_error);
  END IF;
  BEGIN
    pkg_solicitud_creditos.pr_sgte_nro_soli(p_nro_soli      => p_nro_soli,
                                            p_mensaje_error => p_mensaje_error);
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      p_mensaje_error := 'Error al seleccionar ult nro soli. ';
      raise_application_error(-20001, p_mensaje_error);
  END;
  IF p_nro_sol_sol > 0 THEN
    BEGIN
      SELECT nro_cedula
        INTO v_nro_cedula
        FROM sc_sol
       WHERE nro_sol = p_nro_sol_sol;
    EXCEPTION
      WHEN no_data_found THEN
        ROLLBACK;
        p_mensaje_error := 'No se selecciono el numero de cedula del solicitante nro: ' ||
                           p_nro_sol_sol;
        raise_application_error(-20001, p_mensaje_error);
      WHEN OTHERS THEN
        ROLLBACK;
        p_mensaje_error := 'Error al seleccionar numero de cedula del solicitante..';
        raise_application_error(-20001, p_mensaje_error);
    END;
    BEGIN
      SELECT nro_soli
        INTO v_lnro_soli
        FROM sc_det
       WHERE nro_sol = p_nro_sol_sol;
    EXCEPTION
      WHEN OTHERS THEN
        ROLLBACK;
        p_mensaje_error := 'Error al seleccionar detalle de solicitudes...';
        raise_application_error(-20001, p_mensaje_error);
    END;
    IF v_lnro_soli != p_nro_sol_sol THEN
      v_l_obs := v_l_obs || v_lnro_soli || '; ';
    END IF;
    IF v_lnro_soli IS NOT NULL THEN
      v_l_obs := 'PARTICIPO EN SC NRO: ' + v_l_obs;
    ELSE
      v_l_obs := '';
    END IF;
    BEGIN
      INSERT INTO sc_det
        (nro_soli,
         nro_sol,
         tipo_sol,
         estado_item,
         firma_pagare,
         obs_estado,
         cod_faja,
         fec_refe,
         fec_ult_act,
         usr_ult_act)
      VALUES
        (p_nro_soli,
         p_nro_sol_sol,
         'SOL',
         'EDIT',
         'S',
         v_l_obs,
         '',
         '',
         v_fec_ult_act,
         v_usuario);
    EXCEPTION
      WHEN OTHERS THEN
        ROLLBACK;
        p_mensaje_error := 'Error al grabar solicitante...';
        raise_application_error(-20001, p_mensaje_error);
    END;
  END IF;
  IF p_nro_sol_csol > 0 THEN
    BEGIN
      INSERT INTO sc_det
        (nro_sol,
         nro_soli,
         estado_item,
         tipo_sol,
         obs_estado,
         cod_faja,
         fec_refe,
         fec_ult_act,
         firma_pagare,
         usr_ult_act)
      VALUES
        (p_nro_sol_csol,
         p_nro_soli,
         'EDIT',
         'CSOL',
         '',
         '',
         '',
         v_fec_ult_act,
         'N',
         v_usuario);
    EXCEPTION
      WHEN OTHERS THEN
        ROLLBACK;
        p_mensaje_error := 'Error al insertar conyuge...';
        raise_application_error(-20001, p_mensaje_error);
    END;
  END IF;
  BEGIN
    INSERT INTO sc
      (nro_soli,
       fec_soli,
       cod_sucursal,
       cod_tipo_soli,
       estado_soli,
       dia_pago,
       cod_vendedor,
       cod_moneda,
       cod_forma_pago,
       ent_ini_soli,
       mon_cuota_soli,
       mon_soli,
       can_cuota_soli,
       ent_ini_apro,
       mon_cuota_apro,
       mon_apro,
       can_cuota_apro,
       limite_credito,
       tipo_comercio,
       con_garante,
       can_garante,
       fec_hor_digi,
       fec_hor_refe,
       fec_hor_ana,
       fec_hor_apro,
       cod_forma_vta,
       nro_sol,
       nro_cedula,
       nro_contacto,
       cod_riesgo,
       puntuacion,
       estado_scoring,
       usr_refe,
       usr_ana,
       nro_pdp,
       tipo_pdp,
       doble_apro,
       fec_vencimiento,
       vencido,
       estado_soli_aut,
       pasa_a_estado,
       estado_politica_alex,
       scoring_automatico,
       nro_sol_pagador,
       fec_ult_act,
       usr_ult_act)
    VALUES
      (p_nro_soli,
       p_g_fec_ingrid,
       p_cod_sucursal,
       p_cod_tipo_soli,
       'DIGI',
       0,
       p_g_cod_vendedor,
       '01',
       p_cod_forma_pago,
       p_ent_ini_soli,
       p_mon_cuota_soli,
       p_mon_soli,
       p_can_cuota_soli,
       0,
       0,
       0,
       0,
       0,
       'MINORISTA',
       0,
       0,
       v_fec_hor_digi,
       NULL,
       NULL,
       NULL,
       '--',
       p_nro_sol_sol,
       v_nro_cedula,
       0,
       '',
       0,
       '',
       '--',
       '--',
       0,
       0,
       0,
       NULL,
       0,
       0,
       '',
       '',
       '',
       p_nro_sol_sol,
       v_fec_ult_act,
       v_usuario);
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      p_mensaje_error := 'Error al insertar datos en solicitud de credito.';
      raise_application_error(-20001, p_mensaje_error);
  END;
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
       v_fec_mov,
       'DIGI',
       '0 00:00:00',
       ' ',
       v_fec_ult_act,
       v_usuario);
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      p_mensaje_error := 'Error al insertar seguimiento...';
      raise_application_error(-20001, p_mensaje_error);
  END;
  IF p_nro_item_trab > 0 THEN
    BEGIN
      UPDATE sc_sol_trabajo
         SET nro_soli = p_nro_soli, estado = 1
       WHERE nro_sol = p_nro_sol_sol
         AND nro_item = p_nro_item_trab;
    EXCEPTION
      WHEN OTHERS THEN
        ROLLBACK;
        p_mensaje_error := 'Error al actualizar laboral...';
        raise_application_error(-20001, p_mensaje_error);
    END;
  END IF;
  DECLARE
    CURSOR cur_articulos IS
      SELECT seq_id,
             c001   AS cod_articulo,
             c002   AS descripcion,
             c003   AS cantidad,
             c004   AS en_promo,
             c005   AS nro_promo
        FROM apex_collections
       WHERE collection_name = 'TMP_ARTICULO';
    v_cod_articulo promo_tipo_merc_presups_sc.cod_articulo%TYPE;
  BEGIN
    BEGIN
      DELETE FROM sc_articulo WHERE nro_soli = p_nro_soli;
    EXCEPTION
      WHEN OTHERS THEN
        ROLLBACK;
        p_mensaje_error := 'Error al eliminar articulos';
        raise_application_error(-20001, p_mensaje_error);
    END;
    FOR a IN cur_articulos LOOP
      BEGIN
        v_cod_articulo := a.cod_articulo;
        pr_insert_articulos(p_nro_soli      => p_nro_soli,
                            p_cod_articulo  => v_cod_articulo,
                            p_en_promo      => a.en_promo,
                            p_nro_promo     => a.nro_promo,
                            p_cantidad      => a.cantidad,
                            p_mensaje_error => p_mensaje_error);
      EXCEPTION
        WHEN OTHERS THEN
          ROLLBACK;
          p_mensaje_error := 'Error al insertar articulos';
          raise_application_error(-20001, p_mensaje_error);
      END;
    END LOOP;
    COMMIT;
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      p_mensaje_error := 'Error...';
      raise_application_error(-20001, p_mensaje_error);
  END;
  /* g_status = insert_articulos();
     if g_status != 0 then return g_status; endif;
  */
  /*l.b 07.07.2020 promo moto-electro*/
  IF p_inserto = 1 THEN
    DECLARE
      CURSOR cur_articulos IS
        SELECT seq_id,
               c001   AS cod_articulo,
               c002   AS descripcion,
               c003   AS cantidad,
               c004   AS opcion,
               c005   AS eliminar
          FROM apex_collections
         WHERE collection_name = 'TMP_ARTICULO';
      v_cod_articulo promo_tipo_merc_presups_sc.cod_articulo%TYPE;
    BEGIN
      FOR a IN cur_articulos LOOP
        BEGIN
          v_cod_articulo := a.cod_articulo;
          INSERT INTO promo_tipo_merc_presups_sc
            (nro_soli_p, cod_articulo)
          VALUES
            (p_nro_soli, v_cod_articulo);
        EXCEPTION
          WHEN OTHERS THEN
            ROLLBACK;
            p_mensaje_error := 'Error al insertar el articulo en promocion...' ||
                               SQLERRM;
            raise_application_error(-20001, p_mensaje_error);
        END;
      END LOOP;
    END;
    BEGIN
      UPDATE sc
         SET cod_forma_vta = p_cod_forma_vta_p
       WHERE nro_soli = p_nro_soli;
    EXCEPTION
      WHEN OTHERS THEN
        ROLLBACK;
        p_mensaje_error := 'Error al actualizar Forma de Venta...';
        raise_application_error(-20001, p_mensaje_error);
    END;
  END IF;
  
  IF nvl(p_id_carga_rapida, 0) > 0 THEN
    BEGIN
      UPDATE sc_carga
         SET nro_soli = p_nro_soli
       WHERE id = p_id_carga_rapida;
    EXCEPTION
      WHEN OTHERS THEN
        p_mensaje_error := 'Error al actualizar Nro. solicitud de credito en carga rapida.';
        raise_application_error(-20001, p_mensaje_error);
    END;
  END IF;
  p_nro_soli := p_nro_soli;
  COMMIT;
EXCEPTION
  WHEN OTHERS THEN
    ROLLBACK;
    pr_capturar_error();
    RAISE;
END pr_proc_incluir;
PROCEDURE pr_proc_modificar(p_cod_tipo_soli  IN sc.cod_tipo_soli%TYPE,
                            p_dia_pago       IN sc.dia_pago%TYPE,
                            p_cod_forma_pago IN sc.cod_forma_pago%TYPE,
                            p_ent_ini_soli   IN sc.ent_ini_soli%TYPE,
                            p_mon_cuota_soli IN sc.mon_cuota_soli%TYPE,
                            p_mon_soli       IN sc.mon_soli%TYPE,
                            p_can_cuota_soli IN sc.can_cuota_soli%TYPE,
                            p_tipo_comercio  IN sc.tipo_comercio%TYPE,
                            p_con_garante    IN sc.con_garante%TYPE,
                            p_can_garante    IN sc.can_garante%TYPE,
                            p_cod_sucursal   IN sc.cod_sucursal%TYPE,
                            p_nro_soli       IN sc.nro_soli%TYPE,
                            p_inserto        IN NUMBER,
                            p_mensaje_error  OUT VARCHAR2) IS
BEGIN
  BEGIN
    UPDATE sc
       SET cod_tipo_soli  = p_cod_tipo_soli,
           dia_pago       = p_dia_pago,
           cod_forma_pago = p_cod_forma_pago,
           ent_ini_soli   = p_ent_ini_soli,
           mon_cuota_soli = p_mon_cuota_soli,
           mon_soli       = p_mon_soli,
           can_cuota_soli = p_can_cuota_soli,
           tipo_comercio  = p_tipo_comercio,
           con_garante    = p_con_garante,
           can_garante    = p_can_garante,
           cod_sucursal   = p_cod_sucursal
     WHERE nro_soli = p_nro_soli
       AND estado_soli IN ('DIGI', 'REVI');
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      pr_capturar_error();
      RAISE;
  END;
  DECLARE
    CURSOR cur_articulos IS
      SELECT seq_id,
             c001   AS cod_articulo,
             c002   AS descripcion,
             c003   AS cantidad,
             c004   AS en_promo,
             c005   AS nro_promo
        FROM apex_collections
       WHERE collection_name = 'TMP_ARTICULO';
    v_cod_articulo promo_tipo_merc_presups_sc.cod_articulo%TYPE;
  BEGIN
    BEGIN
      DELETE FROM sc_articulo WHERE nro_soli = p_nro_soli;
      COMMIT;
    EXCEPTION
      WHEN OTHERS THEN
        ROLLBACK;
        pr_capturar_error();
        RAISE;
    END;
    FOR a IN cur_articulos LOOP
      v_cod_articulo := a.cod_articulo;
      pr_insert_articulos(p_nro_soli      => p_nro_soli,
                          p_cod_articulo  => v_cod_articulo,
                          p_en_promo      => a.en_promo,
                          p_nro_promo     => a.nro_promo,
                          p_cantidad      => a.cantidad,
                          p_mensaje_error => p_mensaje_error);
    END LOOP;
  END;
  /* g_status = insert_articulos();
     if g_status != 0 then return g_status; endif;
  */
  /*l.b 07.07.2020 promo moto-electro*/
  IF p_inserto = 1 THEN
    DECLARE
      CURSOR cur_articulos IS
        SELECT seq_id,
               c001   AS cod_articulo,
               c002   AS descripcion,
               c003   AS cantidad,
               c004   AS opcion,
               c005   AS eliminar
          FROM apex_collections
         WHERE collection_name = 'TMP_ARTICULO';
      v_cod_articulo promo_tipo_merc_presups_sc.cod_articulo%TYPE;
    BEGIN
      FOR a IN cur_articulos LOOP
        BEGIN
          v_cod_articulo := a.cod_articulo;
          DELETE FROM promo_tipo_merc_presups_sc
           WHERE nro_soli_p = p_nro_soli
             AND cod_articulo = v_cod_articulo;
          INSERT INTO promo_tipo_merc_presups_sc
            (nro_soli_p, cod_articulo)
          VALUES
            (p_nro_soli, v_cod_articulo);
        EXCEPTION
          WHEN OTHERS THEN
            ROLLBACK;
            pr_capturar_error();
            RAISE;
        END;
      END LOOP;
    END;
  END IF;
  COMMIT;
EXCEPTION
  WHEN OTHERS THEN
    ROLLBACK;
    pr_capturar_error(p_obs => p_cod_tipo_soli || ',' || p_dia_pago || ',' ||
                               p_cod_forma_pago || ',' || p_ent_ini_soli || ',' ||
                               p_mon_cuota_soli || ',' || p_mon_soli || ',' ||
                               p_can_cuota_soli || ',' || p_tipo_comercio || ',' ||
                               p_con_garante || ',' || p_can_garante || ',' ||
                               p_cod_sucursal || ',' || p_nro_soli);
    p_mensaje_error := 'Error en pr_proc_modificar ' || chr(10) ||
                       dbms_utility.format_error_stack ||
                       dbms_utility.format_error_backtrace;
    RETURN;
END;
PROCEDURE pr_verifica_promos(p_g_fec_ingrid   IN promo_tipo_merc.fec_inicio%TYPE,
                             p_tipo_solicitud IN promo_tipo_merc.cod_tipo_soli_p%TYPE) IS
  CURSOR cur_promos IS
    SELECT m.nro_promo,
           m.descripcion,
           m.cod_forma_vta_p,
           ml1.cod_articulo
      FROM promo_tipo_merc m, promo_tipo_merc_art ml1
     WHERE ((m.cod_tipo_soli_p = p_tipo_solicitud))
       AND ((m.fec_inicio <= p_g_fec_ingrid))
       AND ((m.fec_fin > p_g_fec_ingrid))
       AND ((m.estado = 'ACTI'))
       AND m.nro_promo = ml1.nro_promo
    /* and
    qualification(m.nro_promo = iitf.nro_promo,
      m.descripcion = iitf.descripcion,
      m.cod_forma_vta_p = iitf.cod_forma_vta_p,
      ml1.cod_articulo = iitf.cod_articulo)*/
    ;
  v_desc_articulo VARCHAR2(300);
BEGIN
  apex_collection.create_or_truncate_collection(p_collection_name => 'TMP_PROMOS');
  FOR a IN cur_promos LOOP
    BEGIN
      SELECT descripcion_fact
        INTO v_desc_articulo
        FROM articulos
       WHERE cod_articulo = a.cod_articulo;
    EXCEPTION
      WHEN no_data_found THEN
        v_desc_articulo := NULL;
        ROLLBACK;
      WHEN OTHERS THEN
        v_desc_articulo := NULL;
        ROLLBACK;
    END;
    apex_collection.add_member(p_collection_name => 'TMP_PROMOS',
                               p_c001            => a.nro_promo,
                               p_c002            => a.descripcion,
                               p_c003            => a.cod_forma_vta_p,
                               p_c004            => a.cod_articulo,
                               p_c005            => v_desc_articulo);
  END LOOP;
  COMMIT;
END;
PROCEDURE pr_solicitudes_en_proceso(p_estado_soli IN VARCHAR2 DEFAULT NULL) IS
  l_query               VARCHAR2(4000);
  l_cursor              BINARY_INTEGER;
  l_nr                  NUMBER := 0;
  l_login               VARCHAR2(8) := fn_user;
  l_acciones            VARCHAR2(1);
  l_nro_soli            sc.nro_soli%TYPE;
  l_fec_soli            sc.fec_soli%TYPE;
  l_tipo_doc            sc_sol.tipo_doc%TYPE;
  l_nro_doc             sc_sol.nro_doc%TYPE;
  l_estado_soli         sc.estado_soli%TYPE;
  l_mon_soli            sc.mon_soli%TYPE;
  l_cod_tipo_soli       sc.cod_tipo_soli%TYPE;
  l_cod_sucursal        sc.cod_sucursal%TYPE;
  l_usr_refe            sc.usr_refe%TYPE;
  l_cod_vendedor        sc.cod_vendedor%TYPE;
  l_nro_sol             sc.nro_sol%TYPE;
  l_solicitante         VARCHAR2(100);
  l_vendedor            vendedores.vendedor%TYPE;
  l_tipo_soli           sc_tipo_soli.tipo_soli%TYPE;
  l_ctrl_tabla          sc_tipo_soli.ctrl_tabla%TYPE;
  l_tipo_personeria     sc_sol.tipo_personeria%TYPE;
  l_arr_acciones        apex_application_global.vc_arr2;
  l_arr_nro_soli        apex_application_global.vc_arr2;
  l_arr_fec_soli        apex_application_global.d_arr;
  l_arr_tipo_doc        apex_application_global.vc_arr2;
  l_arr_nro_doc         apex_application_global.vc_arr2;
  l_arr_estado_soli     apex_application_global.vc_arr2;
  l_arr_mon_soli        apex_application_global.vc_arr2;
  l_arr_cod_tipo_soli   apex_application_global.vc_arr2;
  l_arr_cod_sucursal    apex_application_global.vc_arr2;
  l_arr_usr_refe        apex_application_global.vc_arr2;
  l_arr_cod_vendedor    apex_application_global.vc_arr2;
  l_arr_nro_sol         apex_application_global.vc_arr2;
  l_arr_solicitante     apex_application_global.vc_arr2;
  l_arr_vendedor        apex_application_global.vc_arr2;
  l_arr_tipo_soli       apex_application_global.vc_arr2;
  l_arr_ctrl_tabla      apex_application_global.vc_arr2;
  l_arr_tipo_personeria apex_application_global.vc_arr2;
  l_where               VARCHAR2(4000);
  l_count               NUMBER := 0;
BEGIN
  IF p_estado_soli IS NOT NULL THEN
    l_where := 'AND estado_soli IN (' || CASE p_estado_soli
                 WHEN 'DIGI,REVI' THEN
                  '''DIGI'',''REVI'''
                 WHEN 'REFE,VERI' THEN
                  '''REFE'',''VERI'''
                 WHEN 'APRO,PROC' THEN
                  '''APRO'',''PROC'''
                 WHEN 'DIGI,APRO' THEN
                  '''DIGI'',''APRO'''
                 WHEN 'RECH' THEN
                  '''RECH'''
                 ELSE
                  '''' || p_estado_soli || ''''
               END || ')';
  END IF;
  pkg_ic.inicializar;
  apex_collection.create_or_truncate_collection(p_collection_name => 'SOLICITUDES_EN_PROCESO');
  IF fn_bandera THEN
    l_query  := 'SELECT null       acciones,
    a.nro_soli nro_soli,
    a.fec_soli fec_soli,
    sol.tipo_doc tipo_doc,
    sol.nro_doc nro_doc,
    a.estado_soli estado_soli,
    a.mon_soli mon_soli,
    a.cod_tipo_soli cod_tipo_soli,
    a.cod_sucursal cod_sucursal,
    a.usr_refe usr_refe,
    a.cod_vendedor cod_vendedor,
    a.nro_sol nro_sol,
    sol.ape_sol || '', '' || sol.nom_sol solicitante,
    b.vendedor vendedor,
    d.tipo_soli tipo_soli,
    d.ctrl_tabla ctrl_tabla,
    sol.tipo_personeria tipo_personeria
FROM sc a
JOIN vendedores b      ON a.cod_Vendedor = b.cod_Vendedor
JOIN sc_forma_pago c   ON a.cod_Forma_Pago = c.cod_Forma_Pago
JOIN sc_tipo_soli d    ON a.cod_Tipo_Soli = d.cod_Tipo_Soli
JOIN tipo_mercaderia t ON d.cod_Tipo_Mercaderia = t.cod_Tipo_Mercaderia
JOIN sucursal s        ON a.cod_Sucursal = s.cod_Sucursal
LEFT JOIN sc_det det   ON a.nro_Soli = det.nro_Soli and det.tipo_Sol = ''SOL''
LEFT JOIN sc_sol sol   ON det.nro_Sol = sol.nro_Sol
JOIN sc_usr_suc usr    ON a.cod_Sucursal = usr.cod_Sucursal and usr.login = ?
WHERE a.vencido = 0
' || l_where || '
AND (
(
  ? = 1
  AND  a.cod_Vendedor = ?
) OR ? != 1
)
AND a.estado_soli NOT IN (''FACT'',''CANC'')
ORDER BY a.fec_soli desc';
    l_cursor := dbms_hs_passthrough.open_cursor@wrk1;
    dbms_hs_passthrough.parse@wrk1(l_cursor, l_query);
    dbms_hs_passthrough.bind_variable@wrk1(l_cursor, 1, l_login);
    dbms_hs_passthrough.bind_variable@wrk1(l_cursor,
                                           2,
                                           pkg_ic.g_sc_nivel_permiso);
    dbms_hs_passthrough.bind_variable@wrk1(l_cursor,
                                           3,
                                           pkg_ic.g_cod_vendedor);
    dbms_hs_passthrough.bind_variable@wrk1(l_cursor,
                                           4,
                                           pkg_ic.g_sc_nivel_permiso);
    LOOP
      l_count := l_count + 1;
      l_nr    := dbms_hs_passthrough.fetch_row@wrk1(l_cursor, FALSE);
      EXIT WHEN l_nr = 0;
      dbms_hs_passthrough.get_value@wrk1(l_cursor, 1, l_acciones);
      dbms_hs_passthrough.get_value@wrk1(l_cursor, 2, l_nro_soli);
      dbms_hs_passthrough.get_value@wrk1(l_cursor, 3, l_fec_soli);
      dbms_hs_passthrough.get_value@wrk1(l_cursor, 4, l_tipo_doc);
      dbms_hs_passthrough.get_value@wrk1(l_cursor, 5, l_nro_doc);
      dbms_hs_passthrough.get_value@wrk1(l_cursor, 6, l_estado_soli);
      dbms_hs_passthrough.get_value@wrk1(l_cursor, 7, l_mon_soli);
      dbms_hs_passthrough.get_value@wrk1(l_cursor, 8, l_cod_tipo_soli);
      dbms_hs_passthrough.get_value@wrk1(l_cursor, 9, l_cod_sucursal);
      dbms_hs_passthrough.get_value@wrk1(l_cursor, 10, l_usr_refe);
      dbms_hs_passthrough.get_value@wrk1(l_cursor, 11, l_cod_vendedor);
      dbms_hs_passthrough.get_value@wrk1(l_cursor, 12, l_nro_sol);
      dbms_hs_passthrough.get_value@wrk1(l_cursor, 13, l_solicitante);
      dbms_hs_passthrough.get_value@wrk1(l_cursor, 14, l_vendedor);
      dbms_hs_passthrough.get_value@wrk1(l_cursor, 15, l_tipo_soli);
      dbms_hs_passthrough.get_value@wrk1(l_cursor, 16, l_ctrl_tabla);
      dbms_hs_passthrough.get_value@wrk1(l_cursor, 17, l_tipo_personeria);
      l_arr_acciones(l_count) := l_acciones;
      l_arr_nro_soli(l_count) := l_nro_soli;
      l_arr_fec_soli(l_count) := l_fec_soli;
      l_arr_tipo_doc(l_count) := l_tipo_doc;
      l_arr_nro_doc(l_count) := l_nro_doc;
      l_arr_estado_soli(l_count) := l_estado_soli;
      l_arr_mon_soli(l_count) := l_mon_soli;
      l_arr_cod_tipo_soli(l_count) := l_cod_tipo_soli;
      l_arr_cod_sucursal(l_count) := l_cod_sucursal;
      l_arr_usr_refe(l_count) := l_usr_refe;
      l_arr_cod_vendedor(l_count) := l_cod_vendedor;
      l_arr_nro_sol(l_count) := l_nro_sol;
      l_arr_solicitante(l_count) := l_solicitante;
      l_arr_vendedor(l_count) := l_vendedor;
      l_arr_tipo_soli(l_count) := l_tipo_soli;
      l_arr_ctrl_tabla(l_count) := l_ctrl_tabla;
      l_arr_tipo_personeria(l_count) := l_tipo_personeria;
    END LOOP;
    apex_collection.add_members(p_collection_name => 'SOLICITUDES_EN_PROCESO',
                                p_c001            => l_arr_acciones,
                                p_c002            => l_arr_nro_soli,
                                p_c003            => l_arr_tipo_doc,
                                p_c004            => l_arr_nro_doc,
                                p_c005            => l_arr_estado_soli,
                                p_c006            => l_arr_mon_soli,
                                p_c007            => l_arr_cod_tipo_soli,
                                p_c008            => l_arr_cod_sucursal,
                                p_c009            => l_arr_usr_refe,
                                p_c010            => l_arr_cod_vendedor,
                                p_c011            => l_arr_nro_sol,
                                p_c012            => l_arr_solicitante,
                                p_c013            => l_arr_vendedor,
                                p_c014            => l_arr_tipo_soli,
                                p_c015            => l_arr_ctrl_tabla,
                                p_c016            => l_arr_tipo_personeria,
                                p_d001            => l_arr_fec_soli);
    dbms_hs_passthrough.close_cursor@wrk1(l_cursor);
  ELSE
    FOR i IN (SELECT NULL acciones,
                     a.nro_soli nro_soli,
                     a.fec_soli fec_soli,
                     sol.tipo_doc tipo_doc,
                     sol.nro_doc nro_doc,
                     a.estado_soli estado_soli,
                     a.mon_soli mon_soli,
                     a.cod_tipo_soli cod_tipo_soli,
                     a.cod_sucursal cod_sucursal,
                     a.usr_refe usr_refe,
                     a.cod_vendedor cod_vendedor,
                     a.nro_sol nro_sol,
                     sol.ape_sol || ', ' || sol.nom_sol solicitante,
                     b.vendedor vendedor,
                     d.tipo_soli tipo_soli,
                     d.ctrl_tabla ctrl_tabla,
                     sol.tipo_personeria tipo_personeria
                FROM sc a
                JOIN vendedores b
                  ON a.cod_vendedor = b.cod_vendedor
                JOIN sc_forma_pago c
                  ON a.cod_forma_pago = c.cod_forma_pago
                JOIN sc_tipo_soli d
                  ON a.cod_tipo_soli = d.cod_tipo_soli
                JOIN tipo_mercaderia t
                  ON d.cod_tipo_mercaderia = t.cod_tipo_mercaderia
                JOIN sucursal s
                  ON a.cod_sucursal = s.cod_sucursal
                LEFT JOIN sc_det det
                  ON a.nro_soli = det.nro_soli
                 AND det.tipo_sol = 'SOL'
                LEFT JOIN sc_sol sol
                  ON det.nro_sol = sol.nro_sol
                JOIN sc_usr_suc usr
                  ON a.cod_sucursal = usr.cod_sucursal
                 AND usr.login = fn_user
                 AND (estado_soli IN
                     (SELECT column_value
                         FROM TABLE(apex_string.split(p_estado_soli, ','))) OR
                     p_estado_soli IS NULL)
               WHERE a.vencido = 0
                 AND ((pkg_ic.g_sc_nivel_permiso = 1 AND
                     a.cod_vendedor = pkg_ic.g_cod_vendedor) OR
                     pkg_ic.g_sc_nivel_permiso != 1)
                 AND a.estado_soli NOT IN ('FACT', 'CANC', 'RECH')
               ORDER BY a.fec_soli DESC) LOOP
      apex_collection.add_member(p_collection_name => 'SOLICITUDES_EN_PROCESO',
                                 p_c001            => i.acciones,
                                 p_c002            => i.nro_soli,
                                 p_c003            => i.tipo_doc,
                                 p_c004            => i.nro_doc,
                                 p_c005            => i.estado_soli,
                                 p_c006            => i.mon_soli,
                                 p_c007            => i.cod_tipo_soli,
                                 p_c008            => i.cod_sucursal,
                                 p_c009            => i.usr_refe,
                                 p_c010            => i.cod_vendedor,
                                 p_c011            => i.nro_sol,
                                 p_c012            => i.solicitante,
                                 p_c013            => i.vendedor,
                                 p_c014            => i.tipo_soli,
                                 p_c015            => i.ctrl_tabla,
                                 p_c016            => i.tipo_personeria,
                                 p_d001            => i.fec_soli);
    END LOOP;
  END IF;
EXCEPTION
  WHEN dup_val_on_index THEN
    NULL;
    ROLLBACK;
  WHEN OTHERS THEN
    ROLLBACK;
    pr_capturar_error;
    RAISE;
END pr_solicitudes_en_proceso;
PROCEDURE pr_cargar_articulos(p_cod_tipo_mercaderia familias.cod_tipo_mercaderia%TYPE) IS
BEGIN
  BEGIN
    apex_collection.create_or_truncate_collection(p_collection_name => 'ARTICULOS');
  EXCEPTION
    WHEN dup_val_on_index THEN
      NULL;
      ROLLBACK;
  END;
  
  IF fn_bandera THEN
    DECLARE
      l_query                   VARCHAR2(4000) := '
SELECT *
FROM (
SELECT a.cod_articulo,
      a.descripcion,
      a.descripcion_fact,
      b.cod_tipo_mercaderia,
      a.cod_grupo,
      a.vehiculo,
      NVL(''https://lb.alexsa.com.py:8443/api/'' || c.url, ''#APP_FILES#icons/ic_sinimagen.png'') url
FROM articulos a
     left JOIN pg_articulos_imagen_url c ON a.cod_articulo = c.cod_articulo
      AND c.item = (SELECT MAX(x.item) AS item
                    FROM pg_articulos_imagen_url x
                    WHERE a.cod_Articulo = x.cod_Articulo
                    AND x.activo = 1
                    AND x.tipo = ''PRIN'' ) ,
     familias b
WHERE a.cod_familia = b.cod_familia
AND a.activo = 1
AND a.mueve_stock = 1
AND b.cod_tipo_mercaderia = ?
AND a.cod_grupo NOT IN (''MAPF'', ''KIT-CKD'')
and a.articulo_usado != 1
and ( ( a.vehiculo = 1 and a.cod_marca in (''AUTOSTAR'',''STAR'') )
  OR a.vehiculo = 0 )
UNION
SELECT a.cod_articulo,
      a.descripcion,
      a.descripcion_fact,
      b.cod_tipo_mercaderia,
      a.cod_grupo,
      a.vehiculo,
      NVL(''https://lb.alexsa.com.py:8443/api/'' || c.url, ''#APP_FILES#icons/ic_sinimagen.png'') url
FROM articulos a
    left JOIN pg_articulos_imagen_url c ON a.cod_articulo = c.cod_articulo
      AND c.item = (select MAX(x.item) AS item
                          from pg_articulos_imagen_url x
                          where a.cod_Articulo = x.cod_Articulo
                          and x.activo = 1
                          and x.tipo = ''PRIN'' ) ,
    familias                b
WHERE a.cod_familia = b.cod_familia
AND a.activo = 1
AND a.articulo_usado != 1
AND b.cod_tipo_mercaderia = ?
AND a.cod_articulo IN (''SERV.INSTALAC.1'',''SERV.INSTALAC.2'',''SERV.INSTALAC.3'')) AS ARTICULOS
ORDER BY descripcion;
';
      l_cursor                  BINARY_INTEGER;
      l_nr                      NUMBER;
      l_cod_articulo            articulos.cod_articulo%TYPE;
      l_descripcion             articulos.descripcion%TYPE;
      l_descripcion_fact        articulos.descripcion_fact%TYPE;
      l_cod_tipo_mercaderia     familias.cod_tipo_mercaderia%TYPE;
      l_cod_grupo               articulos.cod_grupo%TYPE;
      l_vehiculo                articulos.vehiculo%TYPE;
      l_img_url                 VARCHAR2(200);
      l_arr_cod_articulo        apex_application_global.vc_arr2;
      l_arr_descripcion         apex_application_global.vc_arr2;
      l_arr_descripcion_fact    apex_application_global.vc_arr2;
      l_arr_cod_tipo_mercaderia apex_application_global.vc_arr2;
      l_arr_cod_grupo           apex_application_global.vc_arr2;
      l_arr_vehiculo            apex_application_global.vc_arr2;
      l_arr_img_url             apex_application_global.vc_arr2;
      l_count                   NUMBER := 0;
    BEGIN
      l_cursor := dbms_hs_passthrough.open_cursor@wrk1;
      dbms_hs_passthrough.parse@wrk1(l_cursor, l_query);
      dbms_hs_passthrough.bind_variable@wrk1(l_cursor,
                                             1,
                                             p_cod_tipo_mercaderia);
      dbms_hs_passthrough.bind_variable@wrk1(l_cursor,
                                             2,
                                             p_cod_tipo_mercaderia);
      LOOP
        l_count := l_count + 1;
        l_nr    := dbms_hs_passthrough.fetch_row@wrk1(l_cursor, FALSE);
        EXIT WHEN l_nr = 0;
        dbms_hs_passthrough.get_value@wrk1(l_cursor, 1, l_cod_articulo);
        dbms_hs_passthrough.get_value@wrk1(l_cursor, 2, l_descripcion);
        dbms_hs_passthrough.get_value@wrk1(l_cursor,
                                           3,
                                           l_descripcion_fact);
        dbms_hs_passthrough.get_value@wrk1(l_cursor,
                                           4,
                                           l_cod_tipo_mercaderia);
        dbms_hs_passthrough.get_value@wrk1(l_cursor, 5, l_cod_grupo);
        dbms_hs_passthrough.get_value@wrk1(l_cursor, 6, l_vehiculo);
        dbms_hs_passthrough.get_value@wrk1(l_cursor, 7, l_img_url);
        l_arr_cod_articulo(l_count) := l_cod_articulo;
        l_arr_descripcion(l_count) := l_descripcion;
        l_arr_descripcion_fact(l_count) := l_descripcion_fact;
        l_arr_cod_tipo_mercaderia(l_count) := l_cod_tipo_mercaderia;
        l_arr_cod_grupo(l_count) := l_cod_grupo;
        l_arr_vehiculo(l_count) := l_vehiculo;
        l_arr_img_url(l_count) := l_img_url;
      END LOOP;
      apex_collection.add_members(p_collection_name => 'ARTICULOS',
                                  p_c001            => l_arr_cod_articulo,
                                  p_c002            => l_arr_descripcion,
                                  p_c003            => l_arr_descripcion_fact,
                                  p_c004            => l_arr_cod_tipo_mercaderia,
                                  p_c005            => l_arr_cod_grupo,
                                  p_c006            => l_arr_vehiculo,
                                  p_c007            => l_arr_img_url);
    END;
  ELSE
    BEGIN
      FOR i IN (SELECT a.cod_articulo,
                       a.descripcion,
                       a.descripcion_fact,
                       b.cod_tipo_mercaderia,
                       a.cod_grupo,
                       a.vehiculo,
                       nvl('https://lb.alexsa.com.py:8443/api/' || c.url,
                           '#APP_FILES#icons/ic_sinimagen.png') img_url
                  FROM articulos a, familias b, pg_articulos_imagen_url c
                 WHERE a.cod_familia = b.cod_familia
                   AND a.cod_articulo = c.cod_articulo(+)
                   AND a.activo = 1
                   AND a.mueve_stock = 1
                   AND b.cod_tipo_mercaderia IN ('MOTO', 'ELEC', '4RUE')
                   AND a.cod_grupo NOT IN ('MAPF')
                /*and not exists (select 1
                from app_articulo_conf x
                where trim(x.login) = l_login
                and x.confirmado = 1
                and x.cod_articulo = a.cod_articulo)*/
                 ORDER BY a.descripcion) LOOP
        apex_collection.add_member(p_collection_name => 'ARTICULOS',
                                   p_c001            => i.cod_articulo,
                                   p_c002            => i.descripcion,
                                   p_c003            => i.descripcion_fact,
                                   p_c004            => i.cod_tipo_mercaderia,
                                   p_c005            => i.cod_grupo,
                                   p_c006            => i.vehiculo,
                                   p_c007            => i.img_url);
      END LOOP;
    END;
  END IF;
  COMMIT;
END pr_cargar_articulos;
PROCEDURE pr_enviar_mensaje(p_nro_soli     msi_mensaje.grupo_id%TYPE,
                            p_mensaje      msi_mensaje.mensaje%TYPE,
                            p_tipo_mensaje msi_mensaje.tipo_mensaje%TYPE) IS
  l_id_mensaje           msi_mensaje.id_mensaje%TYPE;
  l_serial_instal        msi_mensaje.serial_instal%TYPE := 0;
  l_de                   msi_mensaje.de%TYPE := fn_user;
  l_para                 msi_mensaje.para%TYPE := 'APPVENTA';
  l_tipo_mensaje         msi_mensaje.tipo_mensaje%TYPE := p_tipo_mensaje;
  l_grupo_id             msi_mensaje.grupo_id%TYPE := p_nro_soli;
  l_mensaje              msi_mensaje.mensaje%TYPE := p_mensaje;
  l_estado_msj           msi_mensaje.estado_msj%TYPE := 1;
  l_id_remoto            msi_mensaje.id_remoto%TYPE := 0;
  l_fec_alta_disp        msi_mensaje.fec_alta_disp%TYPE := NULL;
  l_fec_disp             msi_mensaje.fec_disp%TYPE := NULL;
  l_fec_confirm_envio    msi_mensaje.fec_confirm_envio%TYPE := NULL;
  l_q_confirm_envio      msi_mensaje.q_confirm_envio%TYPE := 0;
  l_fec_recepcion_server msi_mensaje.fec_recepcion_server%TYPE := SYSDATE;
  l_fec_alta             msi_mensaje.fec_alta%TYPE := SYSDATE;
  l_usr_alta             msi_mensaje.usr_alta%TYPE := fn_user;
BEGIN
  l_id_mensaje := fn_seq_nextval('seq_msi');
  COMMIT;
  INSERT INTO msi_mensaje
    (id_mensaje,
     serial_instal,
     de,
     para,
     tipo_mensaje,
     grupo_id,
     mensaje,
     estado_msj,
     id_remoto,
     fec_alta_disp,
     fec_disp,
     fec_confirm_envio,
     q_confirm_envio,
     fec_recepcion_server,
     fec_alta,
     usr_alta)
  VALUES
    (l_id_mensaje,
     l_serial_instal,
     l_de,
     l_para,
     l_tipo_mensaje,
     l_grupo_id,
     l_mensaje,
     l_estado_msj,
     l_id_remoto,
     l_fec_alta_disp,
     l_fec_disp,
     l_fec_confirm_envio,
     l_q_confirm_envio,
     l_fec_recepcion_server,
     l_fec_alta,
     l_usr_alta);
  COMMIT;
EXCEPTION
  WHEN OTHERS THEN
    ROLLBACK;
    pr_capturar_error(p_obs => p_nro_soli || ',' || p_mensaje);
    RAISE;
END pr_enviar_mensaje;
FUNCTION fn_sincronizar_chat(p_nro_soli msi_mensaje.grupo_id%TYPE)
  RETURN NUMBER IS
  l_usuario msi_mensaje_lectura.leido_por%TYPE := fn_user;
  l_retorno NUMBER := NULL;
  CURSOR cur_chat IS
    SELECT m.id_mensaje,
           m.de,
           m.grupo_id,
           m.mensaje,
           to_char(m.fec_recepcion_server, 'dd/mm/rrrr hh24:mi') fec_server,
           CASE
             WHEN de = 'ingres' THEN
              ''
             ELSE
              rh.puesto
           END AS puesto,
           tipo_mensaje
      FROM msi_mensaje m
      LEFT JOIN ingrid_control_usuario usu
        ON m.de = usu.login
      LEFT JOIN personal per
        ON usu.cod_personal = per.cod_personal
      LEFT JOIN rh_puesto rh
        ON per.cod_puesto = rh.cod_puesto
     WHERE m.grupo_id = p_nro_soli
       AND m.id_mensaje NOT IN
           (SELECT c001
              FROM apex_collections
             WHERE collection_name = 'CHAT')
     ORDER BY m.fec_recepcion_server;
BEGIN
  FOR mensaje IN cur_chat LOOP
    apex_collection.add_member(p_collection_name => 'CHAT',
                               p_c001            => mensaje.id_mensaje,
                               p_c002            => mensaje.de,
                               p_c003            => mensaje.grupo_id,
                               p_c004            => mensaje.mensaje,
                               p_c005            => mensaje.fec_server,
                               p_c006            => mensaje.puesto,
                               p_c007            => mensaje.tipo_mensaje);
    l_retorno := 1;
  END LOOP;
  COMMIT;
  FOR mensaje IN (SELECT c001 id_mensaje
                    FROM apex_collections
                   WHERE collection_name = 'CHAT') LOOP
    DECLARE
      dummy CHAR(1);
    BEGIN
      SELECT 1
        INTO dummy
        FROM msi_mensaje_lectura
       WHERE id_mensaje = mensaje.id_mensaje
         AND leido_por = l_usuario;
    EXCEPTION
      WHEN no_data_found THEN
        ROLLBACK;
        DECLARE
          l_sysdate       DATE := SYSDATE;
          l_sysdate_epoch NUMBER := to_epoch(l_sysdate);
        BEGIN
          INSERT INTO msi_mensaje_lectura
            (leido_por,
             fec_lectura,
             fec_lectura_epoch,
             id_mensaje,
             serial_instal,
             usr_alta,
             fec_alta)
          VALUES
            (l_usuario,
             l_sysdate,
             l_sysdate_epoch,
             mensaje.id_mensaje,
             0,
             l_usuario,
             l_sysdate);
        EXCEPTION
          WHEN OTHERS THEN
            ROLLBACK;
        END;
    END;
  END LOOP;
  COMMIT;
  RETURN l_retorno;
END fn_sincronizar_chat;
PROCEDURE pr_carga_conyuge(p_nro_soli IN sc_det.nro_soli%TYPE) IS
  CURSOR cur_conyuges IS
    SELECT s.nro_soli,
           s.nro_sol,
           sol.nom_sol,
           sol.ape_sol,
           sol.nro_cedula,
           sol.tipo_doc,
           sol.nro_doc
      FROM sc_det s, sc_sol sol
     WHERE s.nro_soli = p_nro_soli
       AND tipo_sol = 'CSOL'
       AND sol.nro_sol = s.nro_sol;
BEGIN
  apex_collection.create_or_truncate_collection(p_collection_name => 'TMP_CONYUGE');
  FOR a IN cur_conyuges LOOP
    apex_collection.add_member(p_collection_name => 'TMP_CONYUGE',
                               p_c001            => a.nro_soli,
                               p_c002            => a.nro_sol,
                               p_c003            => a.nom_sol,
                               p_c004            => a.ape_sol,
                               p_c005            => a.nro_cedula,
                               p_c007            => a.tipo_doc,
                               p_c008            => a.nro_doc);
  END LOOP;
EXCEPTION
  WHEN OTHERS THEN
    ROLLBACK;
END pr_carga_conyuge;
PROCEDURE pr_carga_garante(p_nro_soli IN sc_det.nro_soli%TYPE) IS
  v_tipo_sol sc_det.tipo_sol%TYPE := 'GAR';
  CURSOR cur_conyuges IS
    SELECT s.nro_soli,
           s.nro_sol,
           sol.nom_sol,
           sol.ape_sol,
           sol.nro_cedula,
           sol.tipo_doc,
           sol.nro_doc
      FROM sc_det s, sc_sol sol
     WHERE s.nro_soli = p_nro_soli
       AND s.tipo_sol = v_tipo_sol
       AND sol.nro_sol = s.nro_sol;
BEGIN
  apex_collection.create_or_truncate_collection(p_collection_name => 'TMP_GARANTE');
  FOR a IN cur_conyuges LOOP
    apex_collection.add_member(p_collection_name => 'TMP_GARANTE',
                               p_c001            => a.nro_soli,
                               p_c002            => a.nro_sol,
                               p_c003            => a.nom_sol,
                               p_c004            => a.ape_sol,
                               p_c005            => a.nro_cedula,
                               p_c007            => a.tipo_doc,
                               p_c008            => a.nro_doc);
  END LOOP;
  COMMIT;
EXCEPTION
  WHEN OTHERS THEN
    ROLLBACK;
END pr_carga_garante;
PROCEDURE pr_carga_conyuge_garante(p_nro_soli IN sc_det.nro_soli%TYPE) IS
  CURSOR cur_conyuges IS
    SELECT s.nro_soli,
           s.nro_sol,
           sol.nom_sol,
           sol.ape_sol,
           sol.nro_cedula,
           sol.tipo_doc,
           sol.nro_doc
      FROM sc_det s, sc_sol sol
     WHERE s.nro_soli = p_nro_soli
       AND tipo_sol = 'CGAR'
       AND sol.nro_sol = s.nro_sol;
BEGIN
  apex_collection.create_or_truncate_collection(p_collection_name => 'TMP_CONYUGE_GARANTE');
  FOR a IN cur_conyuges LOOP
    apex_collection.add_member(p_collection_name => 'TMP_CONYUGE_GARANTE',
                               p_c001            => a.nro_soli,
                               p_c002            => a.nro_sol,
                               p_c003            => a.nom_sol,
                               p_c004            => a.ape_sol,
                               p_c005            => a.nro_cedula,
                               p_c007            => a.tipo_doc,
                               p_c008            => a.nro_doc);
  END LOOP;
  
  COMMIT;
EXCEPTION
  WHEN OTHERS THEN
    ROLLBACK;
END pr_carga_conyuge_garante;
PROCEDURE pr_obtiene_ref_personales(p_nro_sol IN sc_sol_ref_personal.nro_sol%TYPE) IS
  CURSOR cur_personales IS
    SELECT b.nom_referente || ' ' || b.ape_referente nombres,
           'Relacion: ' || r.tipo_relacion tipo_relacion,
           'Nro. Documento: ' || b.nro_cedula nro_cedula,
           b.nro_item,
           b.id_telefono,
           b.nro_sol
      FROM sc_sol_ref_personal b, sc_tipo_relacion r
     WHERE b.cod_tipo_relacion = r.cod_tipo_relacion
       AND b.nro_sol = p_nro_sol;
  
  v_nro_telefono VARCHAR2(50);
BEGIN
  apex_collection.create_or_truncate_collection(p_collection_name => 'TMP_REF_PERSONALES');
  FOR a IN cur_personales LOOP
    
    BEGIN
      SELECT decode(s.cod_telefonica,
                    '--',
                    '0' || s.nro_telefono,
                    lpad(TRIM(sc.prefijo) || s.nro_telefono, 10, 0)) nro_telefono
        INTO v_nro_telefono
        FROM sc_telefono s, sc_telefonica sc
       WHERE s.cod_telefonica = sc.cod_telefonica
         AND s.id_telefono = a.id_telefono
         AND s.nro_item = a.nro_item;
    EXCEPTION
      WHEN no_data_found THEN
        ROLLBACK;
        v_nro_telefono := 0;
      WHEN OTHERS THEN
        v_nro_telefono := 0;
        ROLLBACK;
        
    END;
    apex_collection.add_member(p_collection_name => 'TMP_REF_PERSONALES',
                               p_c001            => a.nombres,
                               p_c002            => a.tipo_relacion,
                               p_c003            => a.nro_cedula,
                               p_c004            => a.nro_item,
                               p_c005            => a.nro_sol,
                               p_c006            => 'Telefono: ' ||
                                                    v_nro_telefono,
                               p_c030            => '1');
  END LOOP;
  COMMIT;
EXCEPTION
  WHEN OTHERS THEN
    ROLLBACK;
END pr_obtiene_ref_personales;
PROCEDURE pr_obtiene_refe_personales(p_nro_sol  IN sc_sol_ref_personal.nro_sol%TYPE,
                                     p_nro_soli IN sc_sol_ref_personal.nro_sol%TYPE) IS
  CURSOR cur_personales IS
  /*select b.nom_referente || ' ' || b.ape_referente nombres,
                       'Relacion: ' || r.tipo_relacion tipo_relacion,
                       'Nro. Documento: ' || b.nro_cedula nro_cedula,
                       b.nro_item,
                       b.id_telefono,
                       b.nro_sol
                  from sc_sol_ref_personal b, sc_tipo_relacion r, sc_rel_ref_personal p
                 where b.cod_tipo_relacion = r.cod_tipo_relacion
                   and b.nro_item = p.nro_item
                   and b.nro_sol = p_nro_sol
                   and p.nro_soli = p_nro_soli;*/
    
  /*
                 select b.nom_referente || ' ' || b.ape_referente nombres,
                       'Relacion: ' || r.tipo_relacion tipo_relacion,
                       'Nro. Documento: ' || b.nro_cedula nro_cedula,
                       b.nro_item,
                       b.id_telefono,
                       b.nro_sol
                  from sc_sol_ref_personal b, sc_tipo_relacion r, sc s
                 where b.cod_tipo_relacion = r.cod_tipo_relacion
                   and b.nro_sol = p_nro_sol
                   and b.nro_sol = s.nro_sol
                   and s.nro_soli = ;*/
    
    SELECT b.nom_referente || ' ' || b.ape_referente nombres,
           'Relacion: ' || r.tipo_relacion tipo_relacion,
           'Nro. Documento: ' || b.nro_cedula nro_cedula,
           b.nro_item,
           b.id_telefono,
           b.nro_sol
      FROM sc_sol_ref_personal b, sc_tipo_relacion r
     WHERE b.cod_tipo_relacion = r.cod_tipo_relacion
       AND b.nro_sol = p_nro_sol;
  
  v_nro_telefono VARCHAR2(50);
BEGIN
  apex_collection.create_or_truncate_collection(p_collection_name => 'TMP_REF_PERSONALES');
  FOR a IN cur_personales LOOP
    
    BEGIN
      SELECT decode(s.cod_telefonica,
                    '--',
                    '0' || s.nro_telefono,
                    lpad(TRIM(sc.prefijo) || s.nro_telefono, 10, 0)) nro_telefono
        INTO v_nro_telefono
        FROM sc_telefono s, sc_telefonica sc
       WHERE s.cod_telefonica = sc.cod_telefonica
         AND s.id_telefono = a.id_telefono
         AND s.nro_item = 1;
    EXCEPTION
      WHEN no_data_found THEN
        v_nro_telefono := 0;
        ROLLBACK;
      WHEN OTHERS THEN
        v_nro_telefono := 0;
        ROLLBACK;
        
    END;
    apex_collection.add_member(p_collection_name => 'TMP_REF_PERSONALES',
                               p_c001            => a.nombres,
                               p_c002            => a.tipo_relacion,
                               p_c003            => a.nro_cedula,
                               p_c004            => a.nro_item,
                               p_c005            => a.nro_sol,
                               p_c006            => 'Telefono: ' ||
                                                    v_nro_telefono);
  END LOOP;
  COMMIT;
EXCEPTION
  WHEN OTHERS THEN
    ROLLBACK;
END pr_obtiene_refe_personales;
FUNCTION fn_carga_promociones(p_message OUT VARCHAR2) RETURN BOOLEAN IS
  l_sysdate DATE := SYSDATE;
BEGIN
  pkg_ic.inicializar;
  l_sysdate := pkg_ic.g_fec_ingrid;
  apex_collection.create_or_truncate_collection(p_collection_name => 'PROMOCIONES');
  FOR i IN (SELECT a.nro_promo AS nro_promo,
                   a.descripcion AS descripcion,
                   a.id_promo AS id_promo,
                   a.cod_articulo AS cod_articulo,
                   b.descripcion AS articulo_descripcion,
                   a.cod_lista_prec_vta AS cod_lista_prec_vta,
                   lp.lista_prec_vta AS lista_prec_vta,
                   a.vigencia_desde AS vigencia_desde,
                   a.vigencia_hasta AS vigencia_hasta,
                   a.promo_stock AS promo_stock,
                   a.cant_cuotas AS cant_cuotas,
                   a.entrega_inicial AS entrega_inicial,
                   a.monto_cuota AS monto_cuota,
                   a.regalo AS regalo,
                   a.cod_grupo AS cod_grupo,
                   g.grupo AS grupo,
                   a.cod_tipo_mercaderia AS cod_tipo_mercaderia,
                   tm.tipo_mercaderia AS tipo_mercaderia,
                   a.en_promo AS en_promo,
                   coalesce(pg.url, '') AS url,
                   coalesce(a.url, '') AS url_promo
              FROM promo_precio_articulo a
              JOIN articulos b
                ON a.cod_articulo = b.cod_articulo
              LEFT JOIN pg_articulos_imagen_url pg
                ON a.cod_articulo = pg.cod_articulo
               AND pg.item = (SELECT MAX(x.item) AS item
                                FROM pg_articulos_imagen_url x
                               WHERE a.cod_articulo = x.cod_articulo
                                 AND x.activo = 1)
              LEFT JOIN listas_precios_vta lp
                ON a.cod_lista_prec_vta = lp.cod_lista_prec_vta
              LEFT JOIN grupos g
                ON a.cod_grupo = g.cod_grupo
              LEFT JOIN tipo_mercaderia tm
                ON a.cod_tipo_mercaderia = tm.cod_tipo_mercaderia
             WHERE a.vigencia_desde <= l_sysdate
               AND a.vigencia_hasta >= l_sysdate
               AND a.activo = 1
             ORDER BY a.id_promo) LOOP
    apex_collection.add_member(p_collection_name => 'PROMOCIONES',
                               p_c001            => i.nro_promo,
                               p_c002            => i.descripcion,
                               p_c003            => i.id_promo,
                               p_c004            => i.cod_articulo,
                               p_c005            => i.articulo_descripcion,
                               p_c006            => i.cod_lista_prec_vta,
                               p_c007            => i.lista_prec_vta,
                               p_c008            => to_char(i.vigencia_desde,
                                                            'DD/MM/RRRR'),
                               p_c009            => to_char(i.vigencia_hasta,
                                                            'DD/MM/RRRR'),
                               p_c010            => i.promo_stock,
                               p_c011            => i.cant_cuotas,
                               p_c012            => i.entrega_inicial,
                               p_c013            => i.monto_cuota,
                               p_c014            => i.regalo,
                               p_c015            => i.cod_grupo,
                               p_c016            => i.grupo,
                               p_c017            => i.cod_tipo_mercaderia,
                               p_c018            => i.tipo_mercaderia,
                               p_c019            => i.en_promo,
                               p_c020            => i.url,
                               p_c021            => i.url_promo);
  END LOOP;
  RETURN TRUE;
EXCEPTION
  WHEN OTHERS THEN
    ROLLBACK;
    p_message := dbms_utility.format_error_stack || ' ' ||
                 dbms_utility.format_error_backtrace;
    pr_capturar_error();
    RETURN FALSE;
END fn_carga_promociones;
FUNCTION fn_mensajes_no_leidos(p_grupo_id       msi_mensaje.grupo_id%TYPE,
                               p_serial_install msi_mensaje_lectura.serial_instal%TYPE)
  RETURN NUMBER IS
  l_fec_lectura        DATE;
  l_mensajes_no_leidos NUMBER := 0;
  l_usuario            msi_mensaje_lectura.leido_por%TYPE := fn_user;
BEGIN
  FOR i IN (SELECT id_mensaje
              FROM msi_mensaje m
              LEFT JOIN ingrid_control_usuario usu
                ON m.de = usu.login
              LEFT JOIN personal per
                ON usu.cod_personal = per.cod_personal
              LEFT JOIN rh_puesto rh
                ON per.cod_puesto = rh.cod_puesto
             WHERE m.grupo_id = p_grupo_id
             ORDER BY m.fec_recepcion_server, m.id_mensaje) LOOP
    BEGIN
      SELECT fec_lectura
        INTO l_fec_lectura
        FROM msi_mensaje_lectura
       WHERE serial_instal = 0
         AND id_mensaje = i.id_mensaje
         AND leido_por = l_usuario;
    EXCEPTION
      WHEN no_data_found THEN
        ROLLBACK;
        l_mensajes_no_leidos := l_mensajes_no_leidos + 1;
    END;
  END LOOP;
  RETURN l_mensajes_no_leidos;
EXCEPTION
  WHEN OTHERS THEN
    ROLLBACK;
    pr_capturar_error(p_obs => p_grupo_id || ',' || p_serial_install);
    RETURN l_mensajes_no_leidos;
END fn_mensajes_no_leidos;
FUNCTION fn_llamar_pdc(p_nro_soli     NUMBER,
                       p_nuevo_estado VARCHAR2,
                       p_observacion  VARCHAR2,
                       p_token        VARCHAR2,
                       p_message      OUT VARCHAR2) RETURN BOOLEAN IS
  l_observacion VARCHAR2(4000) := CASE
                                    WHEN p_observacion IS NULL THEN
                                     'PASA A ' || p_nuevo_estado
                                    ELSE
                                     p_observacion
                                  END;
  l_body        CLOB;
  l_response    CLOB;
  l_url         VARCHAR2(256) := fn_api_url ||
                                 '/solicitud-app/proceso-credito';
  l_wallet_path VARCHAR2(256) := CASE
                                   WHEN l_url LIKE '%https%' THEN
                                    fn_api_wallet
                                 END;
  request_error EXCEPTION;
BEGIN
  l_body := json_object('idRowDevice' VALUE 0,
                        'nroSoli' VALUE p_nro_soli,
                        'nuevoEstado' VALUE p_nuevo_estado,
                        'observacion' VALUE l_observacion,
                        'serialInstal' VALUE 0);
  apex_web_service.set_request_headers(p_name_01  => 'Authorization',
                                       p_value_01 => 'Bearer ' || p_token,
                                       p_name_02  => 'Content-Type',
                                       p_value_02 => 'application/json');
  l_response := apex_web_service.make_rest_request(p_url         => l_url,
                                                   p_http_method => 'PUT',
                                                   p_body        => l_body,
                                                   p_wallet_path => l_wallet_path);
  IF apex_web_service.g_status_code != 200 THEN
    RAISE request_error;
  END IF;
  RETURN TRUE;
EXCEPTION
  WHEN request_error THEN
    ROLLBACK;
    pr_capturar_error('ws ' || l_response || chr(10) || 'return,' ||
                      p_nro_soli || ',' || p_nuevo_estado || ',' ||
                      p_observacion || ',' || p_token || ',' ||
                      p_message);
    /*p_message := 'Status_Code: ' || apex_web_service.g_status_code || ' | Reason_Phrase: ' ||
    apex_web_service.g_reason_phrase || ' | Response: ' || l_response;*/
    
    p_message := 'Status_Code: ' || apex_web_service.g_status_code ||
                 ' | Reason_Phrase: ' || apex_web_service.g_reason_phrase || CASE
                   WHEN l_response IS json THEN
                    ' | Response: ' || json_object_t(l_response)
                   .get_string('message')
                   ELSE
                    NULL
                 END;
    
    RETURN FALSE;
  WHEN OTHERS THEN
    ROLLBACK;
    p_message := 'Error Inesperado: ' || SQLERRM;
    RETURN FALSE;
END fn_llamar_pdc;
PROCEDURE pr_sol01511(p_nro_soli    IN NUMBER,
                      p_nro_sol     IN NUMBER,
                      p_enviar_link IN OUT VARCHAR2,
                      p_texto       IN VARCHAR2) IS
  v_cod_resultado     NUMBER;
  v_resultado         VARCHAR2(500);
  v_cod_tipo_vendedor vendedores.cod_tipo_vendedor%TYPE;
  v_id_telefono       sc_sol.id_telefono%TYPE;
  v_nro_telefono      VARCHAR2(50);
  v_nro_item          NUMBER;
  v_nombre            VARCHAR2(300);
  v_nro_documento     NUMBER;
  v_request_text      VARCHAR2(4000);
  v_result            CLOB;
  v_json_table        CLOB;
  v_status_code       NUMBER;
  v_gpt_api_url       VARCHAR2(4000) := fn_api_url ||
                                        '/nota-autorizacion/firmas';
  v_wallet_path VARCHAR2(50) := CASE
                                  WHEN v_gpt_api_url LIKE '%https%' THEN
                                   fn_api_wallet
                                END;
  v_code_error        CLOB;
  v_mensaje           VARCHAR2(500);
BEGIN
  pkg_ic.inicializar;
  BEGIN
    pkg_solicitud_creditos.pr_sol01522(p_nro_soli      => p_nro_soli,
                                       p_nro_sol       => p_nro_sol,
                                       enviar_link     => p_enviar_link,
                                       texto           => p_texto,
                                       p_nro_documento => v_nro_documento);
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      raise_application_error(-20001, SQLERRM);
  END;
  IF p_enviar_link = 'S' THEN
    /*agregar sucursales para  implementar o quitar este if y el else*/
    BEGIN
      SELECT v.cod_tipo_vendedor
        INTO v_cod_tipo_vendedor
        FROM sc a
        JOIN vendedores v
          ON a.cod_vendedor = v.cod_vendedor
       WHERE a.nro_soli = p_nro_soli;
    EXCEPTION
      WHEN no_data_found THEN
        ROLLBACK;
        raise_application_error(-20001,
                                'No se pudo obtener tipo vendedor de la solicitud. ' ||
                                p_nro_soli);
      WHEN OTHERS THEN
        ROLLBACK;
        raise_application_error(-20001,
                                'Error al intentar seleccionar tipo vendedor de la solicitud. ' ||
                                p_nro_soli);
    END;
    /* habilitado a todos pabloj 19.06.2023
        if cod_tipo_vendedor = 'TELEMKT' then
    */
    BEGIN
      SELECT id_telefono
        INTO v_id_telefono
        FROM sc_sol
       WHERE nro_sol = p_nro_sol;
    EXCEPTION
      WHEN no_data_found THEN
        ROLLBACK;
        raise_application_error(-20001,
                                'No se pudo obtener id telefono para envio de mensaje.' ||
                                ' Nro_sol:' || p_nro_sol);
      WHEN OTHERS THEN
        ROLLBACK;
        raise_application_error(-20001,
                                'Error al obtener id telefono para envio de mensaje.' ||
                                ' Nro_sol:' || p_nro_sol);
    END;
    BEGIN
      SELECT '0' || TRIM(coalesce(tf.prefijo, '')) ||
             coalesce(t.nro_telefono, ''),
             t.nro_item
        INTO v_nro_telefono, v_nro_item
        FROM sc_telefono t
        JOIN sc_telefonica tf
          ON t.cod_telefonica = tf.cod_telefonica
       WHERE t.id_telefono = v_id_telefono
         AND t.activo = 1
         AND tf.tipo_linea = 'MOVI'
         AND rownum = 1
       ORDER BY nro_item DESC;
    EXCEPTION
      WHEN no_data_found THEN
        ROLLBACK;
        raise_application_error(-20001,
                                'No se pudo obtener numero de telef. para envio de mensaje.' ||
                                ' idTelef:' || v_id_telefono);
      WHEN OTHERS THEN
        ROLLBACK;
        raise_application_error(-20001,
                                'Error al obtener numero de telefono para envio de mensaje.' ||
                                ' idTelef:' || v_id_telefono);
    END;
    --    v_nro_telefono := '0991304445';
    /*proceso llamada api */
    v_request_text := '{"nombre": "' || v_nombre || '",
                     "nroDocumento": "' || v_nro_documento || '",
                     "nroSoli": "' || p_nro_soli || '",
                     "nroSol": "' || p_nro_sol || '",
                     "nroTelefono": "' || v_nro_telefono || '"}';
    BEGIN
      apex_web_service.g_request_headers.delete(); -- borra datos de cabecera
      apex_web_service.g_request_headers(1).name := 'Content-Type';
      apex_web_service.g_request_headers(1).value := 'application/json';
      v_result := apex_web_service.make_rest_request(p_url         => v_gpt_api_url,
                                                     p_http_method => 'POST',
                                                     p_body        => v_request_text,
                                                     p_wallet_path => v_wallet_path);
      v_status_code := apex_web_service.g_status_code;
      v_code_error := apex_web_service.g_reason_phrase;
      
      IF v_status_code != 200 THEN
        raise_application_error(-20000,
                                'La solicitud de API fall? con el c?digo de estado: ' ||
                                v_status_code || v_code_error || chr(10) ||
                                v_result);
      END IF;
    END;
    
    DECLARE
      CURSOR cur_telefonos IS
        SELECT (SELECT decode(ss.cod_telefonica,
                              '--',
                              '0' || ss.nro_telefono,
                              lpad(TRIM(sc.prefijo) || ss.nro_telefono,
                                   10,
                                   0))
                  FROM sc_telefono ss, sc_telefonica sc
                 WHERE ss.cod_telefonica = sc.cod_telefonica
                   AND ss.id_telefono = s.id_telefono
                   AND ss.nro_item = 1) nro_telefono,
               s.nro_sol
          FROM sc_det d, sc_sol s
         WHERE s.nro_sol = d.nro_sol
           AND d.nro_soli = p_nro_soli
           AND d.firma_pagare = 'S'
           AND d.tipo_sol <> 'SOL';
    BEGIN
      FOR a IN cur_telefonos LOOP
        v_request_text := '{"nombre": "' || v_nombre || '",
                         "nroDocumento": "' ||
                          v_nro_documento || '",
                         "nroSoli": "' || p_nro_soli || '",
                         "nroSol": "' || a.nro_sol || '",
                         "nroTelefono": "' ||
                          a.nro_telefono || '"}';
        BEGIN
          apex_web_service.g_request_headers.delete(); -- borra datos de cabecera
          apex_web_service.g_request_headers(1).name := 'Content-Type';
          apex_web_service.g_request_headers(1).value := 'application/json';
          v_result := apex_web_service.make_rest_request(p_url         => v_gpt_api_url,
                                                         p_http_method => 'POST',
                                                         p_body        => v_request_text,
                                                         p_wallet_path => v_wallet_path);
          v_status_code := apex_web_service.g_status_code;
          v_code_error := apex_web_service.g_reason_phrase;
          
          IF v_status_code != 200 THEN
            raise_application_error(-20000,
                                    'La solicitud de API fallo con el codigo de estado: ' ||
                                    v_status_code || v_code_error ||
                                    chr(10) || v_result);
          END IF;
        END;
      END LOOP;
    END;
    
  ELSE
    v_cod_resultado := 100;
    v_resultado     := 'No corresponde enviar link para ' || 'Nro.soli: ' ||
                       p_nro_soli || '.' || ' Nro.Sol: ' || p_nro_sol || '.';
    -- raise_application_error(-20001, v_resultado);
  END IF;
END;
PROCEDURE pr_sol01522(p_nro_soli      IN NUMBER,
                      p_nro_sol       IN NUMBER,
                      enviar_link     IN OUT VARCHAR2,
                      texto           IN VARCHAR2,
                      p_nro_documento OUT VARCHAR2) IS
  nro_sol_sol             NUMBER;
  nro_sol_aux             NUMBER;
  cod_circuito            NUMBER;
  cod_tipo_soli           VARCHAR2(8);
  cod_tipo_cliente        VARCHAR2(8);
  firma_pagare            VARCHAR2(1);
  id_carga_rapida         NUMBER;
  nuevo_recurrente        NUMBER;
  fase                    VARCHAR2(5);
  prioridad               NUMBER;
  promo                   NUMBER;
  circuito_apro           NUMBER;
  gen_tarea_promo_pers    NUMBER;
  es_empleado_alex        NUMBER;
  cod_tipo_mercaderia     VARCHAR2(4);
  tipo_sol                VARCHAR2(4);
  en_promo                NUMBER;
  v_nro_sol_sol           NUMBER;
  v_id_cmd                NUMBER;
  v_motivo                VARCHAR2(400);
  v_g_status              NUMBER;
  v_cod_tipo_mercaderia   VARCHAR2(40);
  v_cod_tipo_cliente      VARCHAR2(40);
  v_nro_soli              NUMBER;
  v_cod_cliente           NUMBER;
  v_mon_cuota_soli        NUMBER;
  v_can_cuota_soli        NUMBER;
  v_cod_tipo_soli         VARCHAR2(40);
  v_circuito              VARCHAR2(50);
  v_g_err_text            VARCHAR2(400);
  v_clasif_cliente        VARCHAR2(400);
  deuda_actual            NUMBER;
  v_g_cod_moneda_nacional VARCHAR2(200);
  v_g_cod_moneda_ref      VARCHAR2(200);
  v_fase                  BOOLEAN;
  g_fec_ingrid            DATE;
  circuito                VARCHAR2(50);
  nro_campanha            NUMBER;
  v_nro_cedula            NUMBER;
  v_cod_vendedor          NUMBER;
  v_mon_soli              NUMBER;
  promo_pers              NUMBER;
BEGIN
  pkg_ic.inicializar;
  g_fec_ingrid  := pkg_ic.g_fec_ingrid;
  v_nro_sol_sol := p_nro_sol;
  BEGIN
    SELECT nro_soli,
           cod_tipo_soli,
           can_cuota_soli,
           mon_cuota_soli,
           nro_cedula,
           cod_vendedor,
           mon_soli
      INTO v_nro_soli,
           v_cod_tipo_soli,
           v_can_cuota_soli,
           v_mon_cuota_soli,
           v_nro_cedula,
           v_cod_vendedor,
           v_mon_soli
      FROM sc
     WHERE nro_soli = p_nro_soli;
  EXCEPTION
    WHEN no_data_found THEN
      ROLLBACK;
    WHEN OTHERS THEN
      ROLLBACK;
  END;
  
  BEGIN
    SELECT cod_cliente, nro_cedula, nro_doc
      INTO v_cod_cliente, v_nro_cedula, p_nro_documento
      FROM sc_sol
     WHERE nro_sol = v_nro_sol_sol;
  EXCEPTION
    WHEN no_data_found THEN
      ROLLBACK;
    WHEN OTHERS THEN
      ROLLBACK;
  END;
  
  BEGIN
    SELECT nro_sol
      INTO v_nro_sol_sol
      FROM sc_det
     WHERE nro_soli = v_nro_soli
       AND tipo_sol = 'SOL';
  EXCEPTION
    WHEN no_data_found THEN
      ROLLBACK;
    WHEN OTHERS THEN
      ROLLBACK;
  END;
  
  /*inicio verifico si esta en promo el solicitante*/
  pkg_solicitud_creditos.pr_promo_limite_cred_validacion(p_cod_cliente     => v_cod_cliente,
                                                         p_cuota_soli      => v_mon_cuota_soli,
                                                         p_cant_cuota_soli => v_can_cuota_soli,
                                                         p_err_text        => v_g_err_text,
                                                         p_en_promo        => en_promo,
                                                         p_id_cmd          => v_id_cmd,
                                                         p_motivo          => v_motivo,
                                                         p_status          => v_g_status);
  IF v_g_status != 0 OR v_g_err_text != '' THEN
    ROLLBACK;
    raise_application_error(-20001,
                            'No se envi? link para ' || 'Nro.soli: ' ||
                            p_nro_soli || '.' || ' Nro.Sol: ' ||
                            p_nro_sol || '.' || v_g_err_text);
    RETURN;
  END IF;
  IF en_promo = 1 THEN
    enviar_link := 'N';
    RETURN;
  END IF;
  /*fin verifico si esta en promo solicitante*/
  BEGIN
    SELECT cod_tipo_mercaderia, cod_tipo_cliente
      INTO v_cod_tipo_mercaderia, v_cod_tipo_cliente
      FROM sc_tipo_soli
     WHERE cod_tipo_soli = v_cod_tipo_soli;
  EXCEPTION
    WHEN no_data_found THEN
      ROLLBACK;
      raise_application_error(-20001,
                              'No se encontr? tipo mercader?a.' ||
                              ' Cod.Tipo.Merc.: ' || v_cod_tipo_soli);
    WHEN OTHERS THEN
      ROLLBACK;
      raise_application_error(-20001,
                              'Error al recuperar tipo mercader?a.');
  END;
  BEGIN
    SELECT firma_pagare, tipo_sol
      INTO firma_pagare, tipo_sol
      FROM sc_det
     WHERE nro_soli = p_nro_soli
       AND nro_sol = p_nro_sol;
  EXCEPTION
    WHEN no_data_found THEN
      ROLLBACK;
      raise_application_error(-20001,
                              'No se selecciono participante nro_soli/nro_sol ' ||
                              p_nro_soli || '/' || p_nro_sol || '...');
    WHEN OTHERS THEN
      ROLLBACK;
      raise_application_error(-20001,
                              'Error al seleccionar participante...');
  END;
  enviar_link  := 'N';
  firma_pagare := 'S';
  
  IF firma_pagare = 'S' THEN
    BEGIN
      SELECT nro_sol
        INTO nro_sol_aux
        FROM inf_nota_autorizacion
       WHERE nro_soli = p_nro_soli
         AND nro_sol = p_nro_sol
         AND estado IN ('PEND', 'AUTO');
    EXCEPTION
      WHEN no_data_found THEN
        enviar_link := 'S';
        ROLLBACK;
      WHEN OTHERS THEN
        ROLLBACK;
        raise_application_error(-20001,
                                'Error al seleccionar nota autorizacion para ' ||
                                'nro_soli/nro_sol ' || p_nro_soli || '/' ||
                                p_nro_sol || '...');
    END;
  ELSE
    BEGIN
      SELECT id
        INTO id_carga_rapida
        FROM sc_carga
       WHERE nro_soli = p_nro_soli
         AND aplica = 1;
      v_circuito := 'CARGARAPI';
    EXCEPTION
      WHEN OTHERS THEN
        ROLLBACK;
        raise_application_error(-20001,
                                'Error al Seleccionar carga rapida...');
    END;
    pkg_solicitud_creditos.pr_nat_clasif_cliente(p_cod_cliente           => v_cod_cliente,
                                                 p_clasif_cliente        => v_clasif_cliente,
                                                 p_nuevo_recurrente      => nuevo_recurrente,
                                                 p_status                => v_g_status,
                                                 p_g_cod_moneda_nacional => v_g_cod_moneda_nacional,
                                                 p_g_cod_moneda_ref      => v_g_cod_moneda_ref);
    /*1=nuevo;2=recurrente;0=indefinido*/
    IF v_g_status != 0 THEN
      ROLLBACK;
      raise_application_error(-20001,
                              'Error al recuperar clasificacion cliente');
    END IF;
    IF (v_cod_cliente > 0) THEN
      v_g_status := 0;
      pkg_solicitud_creditos.pr_deuda_total(p_cod_cliente           => v_cod_cliente,
                                            p_deuda_cliente         => deuda_actual,
                                            p_cod_moneda            => v_g_cod_moneda_nacional,
                                            p_g_status              => v_g_status,
                                            p_g_cod_moneda_nacional => v_g_cod_moneda_nacional,
                                            p_g_cod_moneda_ref      => v_g_cod_moneda_ref);
      v_fase := FALSE;
      /* pkg_solicitud_creditos.pr_gestion_venta_cliente(p_cod_cliente             => v_cod_cliente,
                                                                p_periodo                 => g_fec_ingrid,
                                                                p_estado_cliente          => p_estado_cliente,
                                                                p_fase                    => v_fase,
                                                                p_fase_inicial            => p_fase_inicial,
                                                                p_tipo_comercio           => p_tipo_comercio,
                                                                p_nro_cred_acti           => p_nro_cred_acti,
                                                                p_nro_cuotas_pend         => p_nro_cuotas_pend,
                                                                p_nro_cuotas_venc         => p_nro_cuotas_venc,
                                                                p_nro_cuota_mayor         => p_nro_cuota_mayor,
                                                                p_nro_dias_vencido        => p_nro_dias_vencido,
                                                                p_nro_dias_vencido_actual => p_nro_dias_vencido_actual,
                                                                p_cod_conducta            => p_cod_conducta,
                                                                p_cod_tipo_mercaderia     => p_cod_tipo_mercaderia,
                                                                p_fec_ult_vta             => p_fec_ult_vta,
                                                                p_cod_vendedor_ult_vta    => p_cod_vendedor_ult_vta,
                                                                p_cod_sucursal_vta        => p_cod_sucursal_vta,
                                                                p_cod_region_venta        => p_cod_region_venta,
                                                                p_cod_vendedor            => p_cod_vendedor,
                                                                p_login                   => p_login,
                                                                p_fec_ult_pago            => p_fec_ult_pago,
                                                                p_ult_tipo_recibo         => p_ult_tipo_recibo,
                                                                p_venta_periodo           => p_venta_periodo,
                                                                p_cod_zona_cobranza       => p_cod_zona_cobranza,
                                                                p_cod_subzona_cobranza    => p_cod_subzona_cobranza,
                                                                p_cod_sucursal_plla       => p_cod_sucursal_plla,
                                                                p_fec_planilla            => p_fec_planilla,
                                                                p_nro_planilla            => p_nro_planilla,
                                                                p_nro_item                => p_nro_item,
                                                                p_cod_situ_ult            => p_cod_situ_ult,
                                                                p_situacion               => p_situacion,
                                                                p_fec_ult_situ            => p_fec_ult_situ,
                                                                p_usr_ult_act             => p_usr_ult_act,
                                                                p_fec_ult_act             => p_fec_ult_act,
                                                                p_status                  => v_status,
                                                                p_mensaje_error           => p_mensaje_error);
      end if;*/
      /* pkg_solicitud_creditos.pr_set_campana_call(p_cod_vendedor => v_cod_vendedor,
      p_nro_campanha => nro_campanha,
      p_cod_cliente  => v_cod_cliente);*/
      pkg_solicitud_creditos.pr_es_empleado_de_alex(p_nro_cedula       => v_nro_cedula,
                                                    p_es_empleado_alex => es_empleado_alex);
      pkg_solicitud_creditos.pr_es_circuito_promo(p_promo       => promo,
                                                  p_cod_cliente => v_cod_cliente,
                                                  p_mon_soli    => v_mon_soli);
      pkg_solicitud_creditos.es_circuito_apro(p_circuito_apro => circuito_apro,
                                              p_cod_cliente   => v_cod_cliente);
      pkg_solicitud_creditos.pr_es_promo_pers(p_promo_pers => promo_pers,
                                              p_nro_soli   => p_nro_soli);
      /*selector de circuito*/
      IF es_empleado_alex = 1 THEN
        circuito     := 'RRHH';
        cod_circuito := 4;
      ELSIF v_cod_tipo_soli = 'LS' THEN
        circuito     := 'ABREV';
        cod_circuito := 9;
      ELSIF nro_campanha > 0 THEN
        circuito     := 'CALL_CENTER';
        cod_circuito := 3;
      ELSIF circuito_apro = 1 THEN
        circuito     := 'APRO';
        cod_circuito := 7;
      ELSIF (fase = 'FASE2' OR fase = 'FASE3' OR fase = 'CALL') THEN
        circuito     := 'FASE';
        cod_circuito := 5;
      ELSIF (nuevo_recurrente = 1) THEN
        circuito     := 'NUEVO';
        cod_circuito := 1;
      ELSIF (promo = 1) THEN
        cod_circuito := 6;
        circuito     := 'PROMO';
      ELSE
        circuito     := 'RECURRENTE';
        cod_circuito := 2;
      END IF;
      IF v_nro_cedula = 5510874 THEN
        cod_circuito := 8;
        circuito     := 'RECH';
      END IF;
      IF v_cod_tipo_soli = '17' THEN
        RETURN;
      END IF;
      IF cod_tipo_mercaderia = 'MOTO' AND cod_circuito = 1 THEN
        /*motos nuevos: consultar al 100% para cgar y csol, firmen o no el pagare  (marcado como fp en la solicitud).*/
        IF tipo_sol = 'CGAR' OR tipo_sol = 'CSOL' THEN
          BEGIN
            SELECT nro_sol
              INTO nro_sol_aux
              FROM inf_nota_autorizacion
             WHERE nro_soli = p_nro_soli
               AND nro_sol = p_nro_sol
               AND estado IN ('PEND', 'AUTO');
          EXCEPTION
            WHEN no_data_found THEN
              ROLLBACK;
              enviar_link := 'S';
            WHEN OTHERS THEN
              ROLLBACK;
              raise_application_error(-20001,
                                      'Error al seleccionar nota autorizacion para ');
          END;
        END IF;
      ELSIF cod_tipo_mercaderia = 'MOTO' AND cod_circuito = 2 THEN
        /* motos recurrentes:  consultar cgar y csol solo si firman pagare (fp)*/
        NULL;
      ELSIF cod_tipo_mercaderia = 'ELEC' AND
            (cod_circuito = 1 OR cod_circuito = 2) THEN
        /*electro nuevos/recurrentes:  consultar cgar y csol  solo si firman pagare (fp).*/
        NULL;
      ELSE
        /*todos los firmantes o que sea csol*/
        IF tipo_sol = 'CSOL' THEN
          BEGIN
            SELECT nro_sol
              INTO nro_sol_aux
              FROM inf_nota_autorizacion
             WHERE nro_soli = p_nro_soli
               AND nro_sol = p_nro_sol
               AND estado IN ('PEND', 'AUTO');
          EXCEPTION
            WHEN OTHERS THEN
              ROLLBACK;
              raise_application_error(-20001,
                                      'Error al seleccionar nota autorizacion para ' ||
                                      'nro_soli/nro_sol ' || p_nro_soli || '/' ||
                                      p_nro_sol);
          END;
        END IF;
      END IF;
    END IF;
  END IF;
  COMMIT;
EXCEPTION
  WHEN OTHERS THEN
    ROLLBACK;
END;
PROCEDURE pr_promo_limite_cred_validacion(p_cod_cliente     IN NUMBER,
                                          p_cuota_soli      IN NUMBER,
                                          p_cant_cuota_soli IN NUMBER,
                                          p_err_text        OUT VARCHAR2,
                                          p_en_promo        OUT NUMBER,
                                          p_id_cmd          OUT NUMBER,
                                          p_motivo          OUT VARCHAR2,
                                          p_status          OUT NUMBER) IS
  v_cuota_maxima_disp NUMBER;
  v_g_fec_ingrid      cuota_maxima_disp.fec_inicio_vigencia%TYPE;
BEGIN
  pkg_ic.inicializar;
  v_g_fec_ingrid := pkg_ic.g_fec_ingrid;
  p_en_promo     := 0;
  BEGIN
    SELECT id_cmd, cuota_maxima_disp
      INTO p_id_cmd, v_cuota_maxima_disp
      FROM cuota_maxima_disp
     WHERE cod_cliente = p_cod_cliente
       AND fec_inicio_vigencia <= v_g_fec_ingrid
       AND fec_fin_vigencia >= v_g_fec_ingrid;
  EXCEPTION
    WHEN no_data_found THEN
      ROLLBACK;
      p_motivo := 'No est? vigente';
      p_status := 0;
      RETURN;
      --raise_application_error(-20001, p_motivo);
    WHEN OTHERS THEN
      ROLLBACK;
      raise_application_error(-20001,
                              'Error al seleccionar cuota m?xima disponible...');
  END;
  IF p_id_cmd <= 0 THEN
    p_status := 0;
    p_motivo := 'No est? ne la lista.';
    p_status := 0;
    RETURN;
  END IF;
  IF p_cuota_soli > v_cuota_maxima_disp THEN
    p_motivo := 'Monto cuota ' || p_cuota_soli || ' al disponible ' ||
                v_cuota_maxima_disp;
    p_status := 0;
    RETURN;
  END IF;
  IF p_cant_cuota_soli > 18 THEN
    p_motivo := 'Cantidad cuota ' || p_cant_cuota_soli ||
                ' mayor a 18...';
    p_status := 0;
    RETURN;
  END IF;
  p_en_promo := 1;
  COMMIT;
END;
PROCEDURE pr_deuda_total(p_cod_cliente           NUMBER,
                         p_deuda_cliente         IN OUT NUMBER,
                         p_cod_moneda            VARCHAR2,
                         p_g_status              OUT NUMBER,
                         p_g_cod_moneda_nacional VARCHAR2,
                         p_g_cod_moneda_ref      VARCHAR2) IS
  cod_moneda_orig    VARCHAR2(50);
  cotizacion_inf     FLOAT;
  cotizacion_orig    FLOAT;
  cotizacion_mon_ref FLOAT;
  fec_cotizacion     DATE;
  saldo              NUMBER;
  saldo_cliente      NUMBER;
  saldo_inf          NUMBER;
  g_fec_ingrid       DATE;
BEGIN
  pkg_ic.inicializar;
  g_fec_ingrid    := pkg_ic.g_fec_ingrid;
  p_deuda_cliente := 0;
  IF p_cod_moneda = p_g_cod_moneda_nacional THEN
    cotizacion_inf := 0;
  ELSE
    BEGIN
      SELECT nvl(cotiz_compra, 0), fecha_cotizacion
        INTO cotizacion_inf, fec_cotizacion
        FROM cotizaciones_monedas
       WHERE cod_moneda = p_cod_moneda
         AND fecha_cotizacion <= g_fec_ingrid
       ORDER BY fec_cotizacion DESC;
    EXCEPTION
      WHEN no_data_found THEN
        ROLLBACK;
        raise_application_error(-20001,
                                'No se encontro cotizacion para la moneda');
      WHEN OTHERS THEN
        ROLLBACK;
        raise_application_error(-20001,
                                'Error al seleccionar cotizaciones...');
    END;
  END IF;
  BEGIN
    SELECT nvl(cotiz_compra, 0), fecha_cotizacion
      INTO cotizacion_mon_ref, fec_cotizacion
      FROM cotizaciones_monedas
     WHERE cod_moneda = p_g_cod_moneda_ref
       AND fecha_cotizacion <= g_fec_ingrid
     ORDER BY fec_cotizacion DESC;
  EXCEPTION
    WHEN no_data_found THEN
      ROLLBACK;
      raise_application_error(-20001,
                              'No se encontro cotizacion para la moneda de referencia...');
    WHEN OTHERS THEN
      ROLLBACK;
      raise_application_error(-20001,
                              'Error al seleccionar cotizaciones...');
  END;
  BEGIN
    SELECT SUM(importe_dc - nvl(importe_cobrado, 0)), cod_moneda
      INTO saldo, cod_moneda_orig
      FROM clientes_movs
     WHERE nvl(importe_cobrado, 0) < importe_dc
       AND dc = 1
       AND cod_cliente = p_cod_cliente
     GROUP BY cod_moneda;
  EXCEPTION
    WHEN no_data_found THEN
      ROLLBACK;
    WHEN OTHERS THEN
      ROLLBACK;
  END;
  
  BEGIN
    IF p_cod_moneda = cod_moneda_orig THEN
      saldo_inf := saldo;
    ELSE
      IF cod_moneda_orig = p_g_cod_moneda_nacional THEN
        cotizacion_orig := 0;
      ELSE
        IF cod_moneda_orig = p_g_cod_moneda_ref THEN
          cotizacion_orig := cotizacion_mon_ref;
        ELSE
          BEGIN
            SELECT nvl(cotiz_compra, 0), fecha_cotizacion
              INTO cotizacion_orig, fec_cotizacion
              FROM cotizaciones_monedas
             WHERE cod_moneda = cod_moneda_orig
               AND fecha_cotizacion <= g_fec_ingrid
             ORDER BY fec_cotizacion DESC;
          EXCEPTION
            WHEN no_data_found THEN
              ROLLBACK;
              raise_application_error(-20001,
                                      'No se encontro cotizacion para la moneda');
            WHEN OTHERS THEN
              ROLLBACK;
              raise_application_error(-20001,
                                      'Error al seleccionar cotizaciones...');
          END;
        END IF;
      END IF;
      IF p_cod_moneda = p_g_cod_moneda_nacional THEN
        IF cod_moneda_orig = p_g_cod_moneda_nacional THEN
          saldo_inf := saldo;
        ELSE
          saldo_inf := to_number(saldo * cotizacion_orig);
        END IF;
      ELSIF p_cod_moneda != p_g_cod_moneda_nacional THEN
        IF cod_moneda_orig = p_g_cod_moneda_nacional THEN
          saldo_inf := saldo / cotizacion_inf;
        ELSE
          saldo_inf := (saldo / (cotizacion_inf / cotizacion_orig));
        END IF;
      END IF;
    END IF;
    saldo_cliente := saldo_cliente + saldo_inf;
  END;
  BEGIN
    SELECT SUM(importe), cod_moneda
      INTO saldo, cod_moneda_orig
      FROM cheques
     WHERE estado_cheque IN
           ('CAJA', 'RETE', 'NEGO', 'RECH', 'GEST', 'INCO', 'JUDI')
       AND cod_cliente = p_cod_cliente
     GROUP BY cod_moneda;
  EXCEPTION
    WHEN no_data_found THEN
      ROLLBACK;
    WHEN OTHERS THEN
      ROLLBACK;
  END;
  
  BEGIN
    IF p_cod_moneda = cod_moneda_orig THEN
      saldo_inf := saldo;
    ELSE
      IF cod_moneda_orig = p_g_cod_moneda_nacional THEN
        cotizacion_orig := 0;
      ELSE
        IF cod_moneda_orig = p_g_cod_moneda_ref THEN
          cotizacion_orig := cotizacion_mon_ref;
        ELSE
          BEGIN
            SELECT nvl(cotiz_compra, 0), fecha_cotizacion
              INTO cotizacion_orig, fec_cotizacion
              FROM cotizaciones_monedas
             WHERE cod_moneda = cod_moneda_orig
               AND fecha_cotizacion <= g_fec_ingrid
             ORDER BY fec_cotizacion DESC;
          EXCEPTION
            WHEN no_data_found THEN
              ROLLBACK;
              raise_application_error(-20001,
                                      'No se encontro cotizacion para la moneda.');
            WHEN OTHERS THEN
              ROLLBACK;
              raise_application_error(-20001,
                                      'Error al seleccionar cotizaciones...');
          END;
        END IF;
      END IF;
      IF p_cod_moneda = p_g_cod_moneda_nacional THEN
        IF cod_moneda_orig = p_g_cod_moneda_nacional THEN
          saldo_inf := saldo;
        ELSE
          saldo_inf := to_number(saldo * cotizacion_orig);
        END IF;
      ELSIF p_cod_moneda != p_g_cod_moneda_nacional THEN
        IF cod_moneda_orig = p_g_cod_moneda_nacional THEN
          saldo_inf := saldo / cotizacion_inf;
        ELSE
          saldo_inf := (saldo / (cotizacion_inf / cotizacion_orig));
        END IF;
      END IF;
    END IF;
    saldo_cliente := saldo_cliente + saldo_inf;
  END;
  p_deuda_cliente := saldo_cliente;
  COMMIT;
END;
PROCEDURE pr_nat_clasif_cliente(p_cod_cliente           IN NUMBER,
                                p_clasif_cliente        OUT VARCHAR2,
                                p_nuevo_recurrente      IN OUT NUMBER,
                                p_status                IN OUT NUMBER,
                                p_g_cod_moneda_nacional IN OUT VARCHAR2,
                                p_g_cod_moneda_ref      IN OUT VARCHAR2) IS
  deuda_cliente NUMBER;
  fec_ult_pago  DATE;
  cod_conducta  VARCHAR2(40);
  meses         NUMBER;
BEGIN
  p_nuevo_recurrente := 0;
  IF p_cod_cliente <= 0 THEN
    p_nuevo_recurrente := 1;
    p_clasif_cliente   := 'NUEVO';
    RETURN;
  END IF;
  p_clasif_cliente := 'INDEF';
  IF p_cod_cliente = 0 THEN
    p_clasif_cliente := 'NUEVO';
  ELSE
    p_status := 0;
    pkg_solicitud_creditos.pr_deuda_total(p_cod_cliente           => p_cod_cliente,
                                          p_deuda_cliente         => deuda_cliente,
                                          p_cod_moneda            => p_g_cod_moneda_nacional,
                                          p_g_status              => p_status,
                                          p_g_cod_moneda_nacional => p_g_cod_moneda_nacional,
                                          p_g_cod_moneda_ref      => p_g_cod_moneda_ref);
    IF p_status != 0 THEN
      RETURN;
    END IF;
    BEGIN
      SELECT cod_conducta
        INTO cod_conducta
        FROM clientes_conducta_pago
       WHERE cod_cliente = p_cod_cliente
       ORDER BY fec_ult_act DESC;
    EXCEPTION
      WHEN no_data_found THEN
        ROLLBACK;
        cod_conducta := '--';
      WHEN OTHERS THEN
        ROLLBACK;
        raise_application_error(-20001,
                                'Error al recuperar la conducta de pago...');
    END;
  END IF;
  /*los clientes sin calificaci?n se consideran nuevo.*/
  IF cod_conducta = '--' THEN
    p_clasif_cliente := 'NUEVO';
  END IF;
  /*recurrente*/
  IF p_clasif_cliente != 'NUEVO' THEN
    IF deuda_cliente > 0 THEN
      p_clasif_cliente := 'REACTI';
    ELSE
      p_clasif_cliente := 'REINAC';
      BEGIN
        SELECT nvl(MAX(fec_recibo), '')
          INTO fec_ult_pago
          FROM cobranzas_items
         WHERE cod_cliente = p_cod_cliente;
      EXCEPTION
        WHEN no_data_found THEN
          ROLLBACK;
          meses := months_between(SYSDATE, fec_ult_pago) + 0.5;
          IF meses > 12 THEN
            p_clasif_cliente := 'RENUE';
          END IF;
        WHEN OTHERS THEN
          ROLLBACK;
          raise_application_error(-20001,
                                  'Error al seleccionar ?ltima fecha de pago...');
      END;
    END IF;
  END IF;
  IF p_clasif_cliente = 'REACT' THEN
    p_nuevo_recurrente := 2;
  ELSE
    p_nuevo_recurrente := 1;
  END IF;
  COMMIT;
END;
PROCEDURE pr_set_campana_call(p_cod_vendedor IN vendedores.cod_vendedor%TYPE,
                              p_nro_campanha OUT NUMBER,
                              p_cod_cliente  sc_sol.cod_cliente%TYPE) IS
  cod_tipo_vendedor VARCHAR(8);
  q_aire            NUMBER;
  cod_articulo      VARCHAR(15);
  campana_aire      NUMBER;
  id_lista_var      NUMBER;
  nro_campana       NUMBER;
BEGIN
  BEGIN
    SELECT cod_tipo_vendedor
      INTO cod_tipo_vendedor
      FROM vendedores
     WHERE cod_vendedor = p_cod_vendedor;
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      raise_application_error(-20001,
                              'Error al seleccionar tipo vendedor...');
  END;
  p_nro_campanha := 0;
  /* begin
  select c."NRO_CAMPA?A"
    into p_nro_campanha
    from gv_planilla c, gv_planilla_det d
   where  c.cod_sucursal = d.cod_sucursal
     and  c.fec_planilla = d.fec_planilla
     and  c.nro_planilla = d.nro_planilla
     and  c."NRO_CAMPA?A"  in (10699, 10923,11120)
     and  c.estado_gestion = 'EDIT'
     and  d.cod_cliente  = p_cod_cliente;
   exception
     when others then
       raise_application_error(-20001, 'Error al seleccionar planilla de campa?a...');
    end;*/
  COMMIT;
END;
PROCEDURE pr_es_empleado_de_alex(p_nro_cedula       persona.nro_cedula_id%TYPE,
                                 p_es_empleado_alex OUT NUMBER) IS
  nro_cedula NUMBER;
  cnt        NUMBER;
  empleado   VARCHAR2(2);
BEGIN
  cnt := 0;
  BEGIN
    SELECT nvl(COUNT(a.cod_persona), 0)
      INTO cnt
      FROM persona a, personal b
     WHERE a.nro_cedula_id = p_nro_cedula
       AND a.cod_persona = b.cod_persona
       AND b.estado_personal IN ('ACTI', 'SUSP', 'LICE', 'VACA');
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      raise_application_error(-20001,
                              'Error al seleccionar solicitante...');
  END;
  IF cnt > 0 THEN
    p_es_empleado_alex := 1;
  ELSE
    p_es_empleado_alex := 0;
  END IF;
END;
PROCEDURE pr_es_circuito_promo(p_promo       OUT NUMBER,
                               p_cod_cliente IN NUMBER,
                               p_mon_soli    IN NUMBER) IS
  q_grupo_aire      NUMBER;
  cod_familia       VARCHAR2(8);
  cod_grupo         VARCHAR2(8);
  cantidad          NUMBER;
  periodo           DATE;
  nro_gestion       NUMBER;
  nro_item_bandeja  NUMBER;
  cod_identificador VARCHAR2(10);
BEGIN
  p_promo := 0;
  IF p_cod_cliente <= 0 THEN
    /* callproc trace( texto = 'PROMO AIRE. ES CLIENTE NUEVO ');*/
    p_promo := 0;
    RETURN;
  END IF;
  IF p_mon_soli > 3000000 THEN
    /*
    callproc trace( texto = 'PROMO AIRE. EL MONTO ES MAYOR A 3 MILLONES--> '
               + varchar(sc.mon_soli));
    */
    p_promo := 0;
    RETURN;
  END IF;
  periodo           := trunc(SYSDATE, 'MM');
  nro_item_bandeja  := 0;
  cod_identificador := 'C6CFEB2018';
  cod_identificador := 'CAMP MAYO';
  BEGIN
    SELECT nro_item_bandeja
      INTO nro_item_bandeja
      FROM crm_bandeja_ingreso
     WHERE periodo = periodo
       AND cod_origen_gestion = 'CAMPVTA'
       AND cod_identificador = cod_identificador
       AND cod_cliente = p_cod_cliente;
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      raise_application_error(-20001,
                              'Error al seleccionar bandeja crm...');
  END;
  
  IF nro_item_bandeja <= 0 THEN
    /*
    callproc trace( texto = 'PROMO AIRE. SIN GESTION EN CRM-->' + varchar(nro_gestion));
    */
    p_promo := 0;
    RETURN;
  END IF;
  /* g_status = callproc pdc_variable (variable = 'COD_IDENTIFICADOR_CRM', valor = cod_identificador );
  if g_status != 0 then return g_status; endif;
  g_status = callproc pdc_variable (variable = 'NRO_ITEM_BANDEJA', valor = varchar(nro_item_bandeja));
  if g_status != 0 then return g_status; endif;*/
  p_promo := 1;
  COMMIT;
END;
PROCEDURE es_circuito_apro(p_circuito_apro OUT NUMBER,
                           p_cod_cliente   IN NUMBER) IS
  nro_lista          NUMBER;
  nro_item_lista     NUMBER;
  estado_item        VARCHAR2(4);
  fec_ini_vige       DATE;
  cod_origen_gestion VARCHAR2(10);
  cod_identificador  VARCHAR2(10);
  g_fec_ingrid       DATE;
BEGIN
  pkg_ic.inicializar;
  g_fec_ingrid    := pkg_ic.g_fec_ingrid;
  p_circuito_apro := 0;
  IF p_cod_cliente <= 0 THEN
    RETURN;
  END IF;
  BEGIN
    SELECT a.nro_lista,
           a.nro_item,
           b.fec_ini_vige,
           b.cod_origen_gestion,
           b.cod_identificador
      INTO nro_lista,
           nro_item_lista,
           fec_ini_vige,
           cod_origen_gestion,
           cod_identificador
      FROM filtro_lista_det a, crm_origen_ident b
     WHERE a.cod_cliente = p_cod_cliente
       AND a.nro_lista IN (230,
                           231,
                           234,
                           235,
                           239,
                           240,
                           257 /*l.b 12.03.2019*/,
                           258,
                           259, /*l.b 21.03.2019*/
                           264,
                           /*l.b  27.05.2019*/
                           261, /*l.b 14.06.2019*/
                           267, /*l.b 14.08.2019*/
                           266, /*l.b 23.08.2019*/
                           268,
                           /*l.b 23.08.2019*/
                           269,
                           272,
                           271,
                           270, /*l.b 16.10.2019*/
                           273,
                           275, /*l.b 09.12.2019*/
                           290,
                           292,
                           /*l.b 22.09.2020*/
                           305, /*l.b 04.03.2021*/
                           372,
                           /*l.b 20.10.2021*/
                           /*414        l.b 04.03.2022*/
                           418, /*l.b 08.03.2022*/
                           432,
                           433, /*l.b 06.04.2022*/
                           451 /*l.b 26.05.2022*/)
       AND a.nro_lista = b.nro_lista
       AND b.fec_ini_vige <= g_fec_ingrid
       AND b.fec_fin_vige >= g_fec_ingrid
       AND a.estado_item = 'OK'
     ORDER BY 4 ASC;
    COMMIT;
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      raise_application_error(-20001,
                              'Error al seleccionar nro lista...');
  END;
  p_circuito_apro := 1;
END;
PROCEDURE pr_es_promo_pers(p_promo_pers OUT NUMBER, p_nro_soli IN NUMBER) IS
  row_count NUMBER;
  row_cel   NUMBER;
BEGIN
  p_promo_pers := 0;
  BEGIN
    SELECT COUNT(*)
      INTO row_count
      FROM personal_cel_sc
     WHERE nro_soli = p_nro_soli
       AND estado_item IN ('ACTI', 'PEND');
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      raise_application_error(-20001,
                              'Error al seleccionar promo personal celular.');
  END;
  
  BEGIN
    SELECT COUNT(*)
      INTO row_cel
      FROM sc_articulo a, articulos b
     WHERE a.nro_soli = p_nro_soli
       AND a.cod_articulo = b.cod_articulo
       AND b.cod_grupo = 'CELU'
       AND b.cod_articulo NOT IN ('7362', '7362-US');
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      raise_application_error(-20001,
                              'Error al seleccionar articulo celular.');
  END;
  p_promo_pers := 1;
END pr_es_promo_pers;
PROCEDURE pr_app_event_cambio_est_soli(p_nro_soli IN INTEGER) IS
  l_nro_soli         INTEGER := p_nro_soli;
  l_evento           VARCHAR2(1024) := ' ';
  l_login            VARCHAR2(8) := ' ';
  l_estado_soli      VARCHAR2(4) := ' ';
  l_ingrid_wrk       VARCHAR2(8) := ' ';
  l_cod_evento       INTEGER := 1001;
  l_mensaje          VARCHAR2(250) := ' ';
  l_fec_mov          DATE := to_date('01-01-9999', 'dd-mm-rrrr');
  l_de               VARCHAR2(8) := ' ';
  l_nro_item_mensaje INTEGER := 0;
  l_nro_referencia   INTEGER := 0;
  l_cambio_est       VARCHAR2(32) := ' ';
  l_origen           CHAR(3) := ' ';
  l_id_mensaje       INTEGER := 0;
  l_p                VARCHAR2(12) := ' ';
  l_tipo_mensaje     INTEGER := 0;
  l_cod_app          VARCHAR2(40) := ' ';
BEGIN
  FOR i IN (SELECT fec_mov AS fec_mov,
                   usr_ult_act AS de,
                   observacion AS mensaje,
                   estado_soli AS estado_soli,
                   0 AS nro_item_mensaje,
                   0 AS nro_referencia,
                   'SEG' AS origen
              FROM sc_seguimiento s
             WHERE nro_soli = l_nro_soli
               AND NOT EXISTS (SELECT *
                      FROM app_sc_seguimiento app
                     WHERE app.nro_soli = l_nro_soli
                       AND app.fec_mov = s.fec_mov)
            UNION ALL
            SELECT fec_alta AS fec_mov,
                   usr_alta AS de,
                   mensaje AS mensaje,
                   ' ' AS estado_soli,
                   nro_item_mensaje AS nro_item_mensaje,
                   nro_referencia AS nro_referencia,
                   'MSG' AS origen
              FROM sc_sol_confirmacion_mensaje confirm
             WHERE nro_soli = l_nro_soli
               AND NOT EXISTS
             (SELECT *
                      FROM app_sc_confirm_mensaje app
                     WHERE confirm.nro_soli = l_nro_soli
                       AND confirm.nro_referencia = app.nro_referencia
                       AND confirm.nro_item_mensaje = app.nro_item_mensaje)
             ORDER BY fec_mov) LOOP
    l_fec_mov          := i.fec_mov;
    l_de               := i.de;
    l_mensaje          := i.mensaje;
    l_estado_soli      := i.estado_soli;
    l_nro_item_mensaje := i.nro_item_mensaje;
    l_nro_referencia   := i.nro_referencia;
    l_origen           := i.origen;
    IF TRIM(l_estado_soli) IS NOT NULL THEN
      IF length(l_estado_soli) = 3 THEN
        l_estado_soli := ' ' || l_estado_soli;
      END IF;
      l_tipo_mensaje := 2;
      l_cambio_est   := 'CAMBIO DE ESTADO A ' || l_estado_soli;
      l_mensaje      := l_cambio_est || ' ' || l_mensaje;
    ELSE
      l_tipo_mensaje := 1;
    END IF;
    DECLARE
      l_fec_alta_disp INTEGER;
      l_fec_disp      INTEGER;
      l_serial_instal INTEGER;
      l_id_remoto     INTEGER;
      l_estado_msj    INTEGER := 1;
      l_para          VARCHAR2(256) := 'GRUPO';
    BEGIN
      pr_msi_mensaje(p_de                   => l_de,
                     p_para                 => l_para,
                     p_tipo_mensaje         => l_tipo_mensaje,
                     p_grupo_id             => l_nro_soli,
                     p_mensaje              => l_mensaje,
                     p_estado_msj           => l_estado_msj,
                     p_fec_alta_disp        => l_fec_alta_disp,
                     p_fec_disp             => l_fec_disp,
                     p_serial_instal        => l_serial_instal,
                     p_id_remoto            => l_id_remoto,
                     p_id_mensaje           => l_id_mensaje,
                     p_fec_recepcion_server => l_fec_mov,
                     p_fec_alta             => l_fec_mov);
    END;
    IF l_origen = 'SEG' THEN
      DECLARE
        l_sysdate DATE := SYSDATE;
        l_user    VARCHAR2(8) := fn_user;
      BEGIN
        INSERT INTO app_sc_seguimiento
          (nro_soli, fec_mov, id_mensaje, fec_alta, usr_alta)
        VALUES
          (l_nro_soli, l_fec_mov, l_id_mensaje, l_sysdate, l_user);
      EXCEPTION
        WHEN OTHERS THEN
          ROLLBACK;
      END;
      
    ELSIF l_origen = 'MSG' THEN
      DECLARE
        l_sysdate DATE := SYSDATE;
        l_user    VARCHAR2(8) := fn_user;
      BEGIN
        INSERT INTO app_sc_confirm_mensaje
          (nro_soli,
           nro_referencia,
           nro_item_mensaje,
           id_mensaje,
           fec_alta,
           usr_alta)
        VALUES
          (l_nro_soli,
           l_nro_referencia,
           l_nro_item_mensaje,
           l_id_mensaje,
           l_sysdate,
           l_user);
      EXCEPTION
        WHEN OTHERS THEN
          ROLLBACK;
      END;
    END IF;
    COMMIT;
  END LOOP;
  FOR i IN (SELECT TRIM(a.login) login, b.cod_app cod_app
              FROM app_sc a, app_login_acceso b
             WHERE a.nro_soli = l_nro_soli
               AND a.login = b.login
               AND a.serial_instal = b.serial_instal) LOOP
    DECLARE
      l_id_event app_server_event.id_event%TYPE := fn_seq_nextval('seq_app_event');
      l_sysdate  DATE := SYSDATE;
      l_user     VARCHAR2(8) := fn_user;
    BEGIN
      INSERT INTO app_server_event
        (id_event,
         item_event,
         cod_tipo_event,
         event,
         usr_destino,
         cod_app,
         fec_alta,
         usr_alta)
      VALUES
        (l_id_event,
         0,
         l_cod_evento,
         ' ',
         l_login,
         l_cod_app,
         l_sysdate,
         l_user);
    EXCEPTION
      WHEN OTHERS THEN
        ROLLBACK;
    END;
  END LOOP;
  COMMIT;
EXCEPTION
  WHEN OTHERS THEN
    ROLLBACK;
    pr_capturar_error(p_obs => to_char(l_nro_soli));
    RAISE;
END pr_app_event_cambio_est_soli;
PROCEDURE pr_solicitudes_en_procesos(p_estado_soli       IN VARCHAR2 DEFAULT NULL,
                                     p_periodo           IN VARCHAR2 DEFAULT NULL,
                                     p_cod_sucursal      IN NUMBER,
                                     p_cod_tipo_vendedor IN VARCHAR2) IS
  l_query               VARCHAR2(4000);
  l_cursor              BINARY_INTEGER;
  l_nr                  NUMBER := 0;
  l_login               VARCHAR2(8) := fn_user;
  l_acciones            VARCHAR2(1);
  l_nro_soli            sc.nro_soli%TYPE;
  l_fec_soli            sc.fec_soli%TYPE;
  l_tipo_doc            sc_sol.tipo_doc%TYPE;
  l_nro_doc             sc_sol.nro_doc%TYPE;
  l_estado_soli         sc.estado_soli%TYPE;
  l_mon_soli            sc.mon_soli%TYPE;
  l_cod_tipo_soli       sc.cod_tipo_soli%TYPE;
  l_cod_sucursal        sc.cod_sucursal%TYPE;
  l_usr_refe            sc.usr_refe%TYPE;
  l_cod_vendedor        sc.cod_vendedor%TYPE;
  l_nro_sol             sc.nro_sol%TYPE;
  l_solicitante         VARCHAR2(100);
  l_vendedor            vendedores.vendedor%TYPE;
  l_tipo_soli           sc_tipo_soli.tipo_soli%TYPE;
  l_ctrl_tabla          sc_tipo_soli.ctrl_tabla%TYPE;
  l_tipo_personeria     sc_sol.tipo_personeria%TYPE;
  l_arr_acciones        apex_application_global.vc_arr2;
  l_arr_nro_soli        apex_application_global.vc_arr2;
  l_arr_fec_soli        apex_application_global.d_arr;
  l_arr_tipo_doc        apex_application_global.vc_arr2;
  l_arr_nro_doc         apex_application_global.vc_arr2;
  l_arr_estado_soli     apex_application_global.vc_arr2;
  l_arr_mon_soli        apex_application_global.vc_arr2;
  l_arr_cod_tipo_soli   apex_application_global.vc_arr2;
  l_arr_cod_sucursal    apex_application_global.vc_arr2;
  l_arr_usr_refe        apex_application_global.vc_arr2;
  l_arr_cod_vendedor    apex_application_global.vc_arr2;
  l_arr_nro_sol         apex_application_global.vc_arr2;
  l_arr_solicitante     apex_application_global.vc_arr2;
  l_arr_vendedor        apex_application_global.vc_arr2;
  l_arr_tipo_soli       apex_application_global.vc_arr2;
  l_arr_ctrl_tabla      apex_application_global.vc_arr2;
  l_arr_tipo_personeria apex_application_global.vc_arr2;
  l_where               VARCHAR2(4000) := '';
  l_count               NUMBER := 0;
  l_cod_tipo_vendedor   vendedores.cod_tipo_vendedor%TYPE := p_cod_tipo_vendedor;
  l_cod_vendedores      VARCHAR2(4000);
  l_cod_personal        vendedores.cod_personal%TYPE;
  l_personal_cargo      NUMBER := 0;
  l_cod_vendedor_user   VARCHAR2(50);
  v_usuario             ingrid_control_usuario.login%TYPE := fn_user;
  l_cod_perso           personal_a_cargo.cod_personal%TYPE;
BEGIN
  BEGIN
    SELECT cod_personal
      INTO l_cod_personal
      FROM ingrid_control_usuario
     WHERE login = v_usuario;
  EXCEPTION
    WHEN no_data_found THEN
      ROLLBACK;
    WHEN OTHERS THEN
      ROLLBACK;
      l_cod_personal := NULL;
  END;
  BEGIN
    SELECT a.cod_vendedor
      INTO l_cod_vendedor_user
      FROM vendedores a
     WHERE a.cod_personal = l_cod_personal;
  EXCEPTION
    WHEN no_data_found THEN
      ROLLBACK;
    WHEN OTHERS THEN
      l_cod_vendedor_user := NULL;
  END;
  
  l_cod_perso := l_cod_personal;
  BEGIN
    SELECT 1
      INTO l_personal_cargo
      FROM personal_a_cargo p
     WHERE cod_personal = l_cod_perso
       AND rownum = 1;
  EXCEPTION
    WHEN no_data_found THEN
      l_personal_cargo := 0;
      ROLLBACK;
    WHEN OTHERS THEN
      l_personal_cargo := 0;
      ROLLBACK;
  END;
  
  IF l_personal_cargo = 1 THEN
    BEGIN
      SELECT listagg(quoted_cod_personal_a_cargo, ',') within GROUP(ORDER BY quoted_cod_personal_a_cargo) AS cod_personal_a_cargo
        INTO l_cod_vendedores
        FROM (SELECT DISTINCT '''' || a.cod_personal_a_cargo || '''' AS quoted_cod_personal_a_cargo
                FROM personal_a_cargo a
               WHERE a.cod_personal = l_cod_perso
              --   and a.periodo = to_date('01/05/2019', 'dd/mm/yyyy')
              );
    EXCEPTION
      WHEN no_data_found THEN
        l_cod_vendedores := l_cod_vendedor_user;
        ROLLBACK;
      WHEN OTHERS THEN
        l_cod_vendedores := l_cod_vendedor_user;
        ROLLBACK;
    END;
  ELSE
    
    l_cod_vendedores := l_cod_vendedor_user;
  END IF;
  
  /* if p_estado_soli is not null then
   l_where := 'AND estado_soli IN (' || case p_estado_soli
                 when 'DIGI,REVI' then
                  '''DIGI'',''REVI'''
                 when 'REFE,VERI' then
                  '''REFE'',''VERI'''
                 when 'APRO,PROC' then
                  '''APRO'',''PROC'''
                 when 'DIGI,APRO' then
                  '''DIGI'',''APRO'''
                 else
                  '''' || p_estado_soli || ''''
               end || ')';
  end if;*/
  
  /* if p_periodo is not null then
       l_where :=  l_where || chr(10)
                   || 'AND TRUNC(a.fec_soli, ''MM'') = TRUNC(TO_DATE(''' ||p_periodo ||''', ''DD/MM/YYYY''), ''MM'')';
  end if;*/
  pkg_ic.inicializar;
  apex_collection.create_or_truncate_collection(p_collection_name => 'SOLICITUDES_EN_PROCESO');
  
  IF fn_bandera THEN
    l_query  := 'SELECT null       acciones,
    a.nro_soli nro_soli,
    a.fec_soli fec_soli,
    sol.tipo_doc tipo_doc,
    sol.nro_doc nro_doc,
    a.estado_soli estado_soli,
    a.mon_soli mon_soli,
    a.cod_tipo_soli cod_tipo_soli,
    a.cod_sucursal cod_sucursal,
    a.usr_refe usr_refe,
    a.cod_vendedor cod_vendedor,
    a.nro_sol nro_sol,
    sol.ape_sol || '', '' || sol.nom_sol solicitante,
    b.vendedor vendedor,
    d.tipo_soli tipo_soli,
    d.ctrl_tabla ctrl_tabla,
    sol.tipo_personeria tipo_personeria
FROM sc a
JOIN vendedores b      ON a.cod_Vendedor = b.cod_Vendedor
JOIN sc_forma_pago c   ON a.cod_Forma_Pago = c.cod_Forma_Pago
JOIN sc_tipo_soli d    ON a.cod_Tipo_Soli = d.cod_Tipo_Soli
JOIN tipo_mercaderia t ON d.cod_Tipo_Mercaderia = t.cod_Tipo_Mercaderia
JOIN sucursal s        ON a.cod_Sucursal = s.cod_Sucursal
LEFT JOIN sc_det det   ON a.nro_Soli = det.nro_Soli and det.tipo_Sol = ''SOL''
LEFT JOIN sc_sol sol   ON det.nro_Sol = sol.nro_Sol
JOIN sc_usr_suc usr    ON a.cod_Sucursal = usr.cod_Sucursal and usr.login = ?
WHERE a.vencido = 0
' || l_where || '
AND (
(
  ? = 1
  AND a.cod_Vendedor = ?
) OR ? != 1
)
AND (? IS NULL OR A.COD_SUCURSAL = ?)
and (? IS NULL OR b.cod_tipo_vendedor = ?)
AND a.estado_soli NOT IN (''FACT'',''CANC'',''RECH'')
ORDER BY a.fec_soli desc';
    l_cursor := dbms_hs_passthrough.open_cursor@wrk1;
    dbms_hs_passthrough.parse@wrk1(l_cursor, l_query);
    
    dbms_hs_passthrough.bind_variable@wrk1(l_cursor, 1, l_login);
    dbms_hs_passthrough.bind_variable@wrk1(l_cursor,
                                           2,
                                           pkg_ic.g_sc_nivel_permiso);
    dbms_hs_passthrough.bind_variable@wrk1(l_cursor,
                                           3,
                                           pkg_ic.g_cod_vendedor);
    dbms_hs_passthrough.bind_variable@wrk1(l_cursor,
                                           4,
                                           pkg_ic.g_sc_nivel_permiso);
    dbms_hs_passthrough.bind_variable@wrk1(l_cursor, 5, p_cod_sucursal);
    dbms_hs_passthrough.bind_variable@wrk1(l_cursor, 6, p_cod_sucursal);
    dbms_hs_passthrough.bind_variable@wrk1(l_cursor,
                                           7,
                                           l_cod_tipo_vendedor);
    dbms_hs_passthrough.bind_variable@wrk1(l_cursor,
                                           8,
                                           l_cod_tipo_vendedor);
    LOOP
      
      l_count := l_count + 1;
      l_nr    := dbms_hs_passthrough.fetch_row@wrk1(l_cursor, FALSE);
      
      EXIT WHEN l_nr = 0;
      dbms_hs_passthrough.get_value@wrk1(l_cursor, 1, l_acciones);
      dbms_hs_passthrough.get_value@wrk1(l_cursor, 2, l_nro_soli);
      dbms_hs_passthrough.get_value@wrk1(l_cursor, 3, l_fec_soli);
      dbms_hs_passthrough.get_value@wrk1(l_cursor, 4, l_tipo_doc);
      dbms_hs_passthrough.get_value@wrk1(l_cursor, 5, l_nro_doc);
      dbms_hs_passthrough.get_value@wrk1(l_cursor, 6, l_estado_soli);
      dbms_hs_passthrough.get_value@wrk1(l_cursor, 7, l_mon_soli);
      dbms_hs_passthrough.get_value@wrk1(l_cursor, 8, l_cod_tipo_soli);
      dbms_hs_passthrough.get_value@wrk1(l_cursor, 9, l_cod_sucursal);
      dbms_hs_passthrough.get_value@wrk1(l_cursor, 10, l_usr_refe);
      dbms_hs_passthrough.get_value@wrk1(l_cursor, 11, l_cod_vendedor);
      dbms_hs_passthrough.get_value@wrk1(l_cursor, 12, l_nro_sol);
      dbms_hs_passthrough.get_value@wrk1(l_cursor, 13, l_solicitante);
      dbms_hs_passthrough.get_value@wrk1(l_cursor, 14, l_vendedor);
      dbms_hs_passthrough.get_value@wrk1(l_cursor, 15, l_tipo_soli);
      dbms_hs_passthrough.get_value@wrk1(l_cursor, 16, l_ctrl_tabla);
      dbms_hs_passthrough.get_value@wrk1(l_cursor, 17, l_tipo_personeria);
      l_arr_acciones(l_count) := l_acciones;
      l_arr_nro_soli(l_count) := l_nro_soli;
      l_arr_fec_soli(l_count) := l_fec_soli;
      l_arr_tipo_doc(l_count) := l_tipo_doc;
      l_arr_nro_doc(l_count) := l_nro_doc;
      l_arr_estado_soli(l_count) := l_estado_soli;
      l_arr_mon_soli(l_count) := l_mon_soli;
      l_arr_cod_tipo_soli(l_count) := l_cod_tipo_soli;
      l_arr_cod_sucursal(l_count) := l_cod_sucursal;
      l_arr_usr_refe(l_count) := l_usr_refe;
      l_arr_cod_vendedor(l_count) := l_cod_vendedor;
      l_arr_nro_sol(l_count) := l_nro_sol;
      l_arr_solicitante(l_count) := l_solicitante;
      l_arr_vendedor(l_count) := l_vendedor;
      l_arr_tipo_soli(l_count) := l_tipo_soli;
      l_arr_ctrl_tabla(l_count) := l_ctrl_tabla;
      l_arr_tipo_personeria(l_count) := l_tipo_personeria;
    END LOOP;
    apex_collection.add_members(p_collection_name => 'SOLICITUDES_EN_PROCESO',
                                p_c001            => l_arr_acciones,
                                p_c002            => l_arr_nro_soli,
                                p_c003            => l_arr_tipo_doc,
                                p_c004            => l_arr_nro_doc,
                                p_c005            => l_arr_estado_soli,
                                p_c006            => l_arr_mon_soli,
                                p_c007            => l_arr_cod_tipo_soli,
                                p_c008            => l_arr_cod_sucursal,
                                p_c009            => l_arr_usr_refe,
                                p_c010            => l_arr_cod_vendedor,
                                p_c011            => l_arr_nro_sol,
                                p_c012            => l_arr_solicitante,
                                p_c013            => l_arr_vendedor,
                                p_c014            => l_arr_tipo_soli,
                                p_c015            => l_arr_ctrl_tabla,
                                p_c016            => l_arr_tipo_personeria,
                                p_d001            => l_arr_fec_soli);
    dbms_hs_passthrough.close_cursor@wrk1(l_cursor);
  ELSE
    FOR i IN (SELECT NULL acciones,
                     a.nro_soli nro_soli,
                     a.fec_soli fec_soli,
                     sol.tipo_doc tipo_doc,
                     sol.nro_doc nro_doc,
                     a.estado_soli estado_soli,
                     a.mon_soli mon_soli,
                     a.cod_tipo_soli cod_tipo_soli,
                     a.cod_sucursal cod_sucursal,
                     a.usr_refe usr_refe,
                     a.cod_vendedor cod_vendedor,
                     a.nro_sol nro_sol,
                     sol.ape_sol || ', ' || sol.nom_sol solicitante,
                     b.vendedor vendedor,
                     d.tipo_soli tipo_soli,
                     d.ctrl_tabla ctrl_tabla,
                     sol.tipo_personeria tipo_personeria
                FROM sc a
                JOIN vendedores b
                  ON a.cod_vendedor = b.cod_vendedor
                JOIN sc_forma_pago c
                  ON a.cod_forma_pago = c.cod_forma_pago
                JOIN sc_tipo_soli d
                  ON a.cod_tipo_soli = d.cod_tipo_soli
                JOIN tipo_mercaderia t
                  ON d.cod_tipo_mercaderia = t.cod_tipo_mercaderia
                JOIN sucursal s
                  ON a.cod_sucursal = s.cod_sucursal
                LEFT JOIN sc_det det
                  ON a.nro_soli = det.nro_soli
                 AND det.tipo_sol = 'SOL'
                LEFT JOIN sc_sol sol
                  ON det.nro_sol = sol.nro_sol
                JOIN sc_usr_suc usr
                  ON a.cod_sucursal = usr.cod_sucursal
                 AND usr.login = fn_user
              /*and (estado_soli in (select column_value from table(apex_string.split(p_estado_soli, ','))) or
              p_estado_soli is null)*/
               WHERE a.vencido = 0
                 AND ((pkg_ic.g_sc_nivel_permiso = 1 AND
                     a.cod_vendedor = pkg_ic.g_cod_vendedor) OR
                     pkg_ic.g_sc_nivel_permiso != 1)
                 AND (p_cod_sucursal IS NULL OR
                     a.cod_sucursal = p_cod_sucursal)
                 AND (p_cod_tipo_vendedor IS NULL OR
                     b.cod_tipo_vendedor = p_cod_tipo_vendedor)
                 AND a.estado_soli NOT IN ('FACT', 'CANC', 'RECH')
               ORDER BY a.fec_soli DESC) LOOP
      apex_collection.add_member(p_collection_name => 'SOLICITUDES_EN_PROCESO',
                                 p_c001            => i.acciones,
                                 p_c002            => i.nro_soli,
                                 p_c003            => i.tipo_doc,
                                 p_c004            => i.nro_doc,
                                 p_c005            => i.estado_soli,
                                 p_c006            => i.mon_soli,
                                 p_c007            => i.cod_tipo_soli,
                                 p_c008            => i.cod_sucursal,
                                 p_c009            => i.usr_refe,
                                 p_c010            => i.cod_vendedor,
                                 p_c011            => i.nro_sol,
                                 p_c012            => i.solicitante,
                                 p_c013            => i.vendedor,
                                 p_c014            => i.tipo_soli,
                                 p_c015            => i.ctrl_tabla,
                                 p_c016            => i.tipo_personeria,
                                 p_d001            => i.fec_soli);
    END LOOP;
  END IF;
  COMMIT;
EXCEPTION
  WHEN dup_val_on_index THEN
    NULL;
    ROLLBACK;
  WHEN OTHERS THEN
    pr_capturar_error;
    ROLLBACK;
    RAISE;
END pr_solicitudes_en_procesos;




PROCEDURE pr_sol01737_ref(p_nro_soli        IN OUT sc.nro_soli%TYPE,
                          p_nro_sol         IN OUT sc.nro_sol%TYPE,
                          p_tipo_personeria IN OUT sc_sol.tipo_personeria%TYPE,
                          p_cod_localidad   IN OUT sc_sol.cod_localidad%TYPE,
                          p_cod_barrio      IN OUT sc_sol.cod_barrio%TYPE,
                          p_domicilio       IN OUT sc_sol.domicilio%TYPE,
                          p_tipo_vivienda   IN OUT sc_sol.tipo_vivienda%TYPE,
                          p_croquis_hablado IN OUT sc_sol.croquis_hablado%TYPE,
                          p_nro_cedula      IN OUT persona.nro_cedula_id%TYPE,
                          p_ruc             IN OUT persona.ruc_persona%TYPE) IS
BEGIN
  pkg_ic.inicializar;
  g_nro_soli        := p_nro_soli;
  g_nro_sol         := p_nro_sol;
  g_tipo_personeria := TRIM(p_tipo_personeria);
  g_cod_localidad   := p_cod_localidad;
  g_cod_barrio      := p_cod_barrio;
  g_domicilio       := p_domicilio;
  g_tipo_vivienda   := p_tipo_vivienda;
  g_croquis_hablado := p_croquis_hablado;
  g_nro_cedula      := p_nro_cedula;
  g_ruc             := p_ruc;
  BEGIN
    SELECT barrio
      INTO g_barrio
      FROM barrio
     WHERE cod_localidad = g_cod_localidad
       AND cod_barrio = g_cod_barrio;
  EXCEPTION
    WHEN no_data_found THEN
      NULL;
      ROLLBACK;
  END;
  
  UPDATE sc_sol
     SET cod_localidad   = g_cod_localidad,
         cod_barrio      = g_cod_barrio,
         barrio          = g_barrio,
         domicilio       = g_domicilio,
         tipo_vivienda   = g_tipo_vivienda,
         croquis_hablado = g_croquis_hablado
   WHERE nro_sol = g_nro_sol;
  IF SQL%ROWCOUNT < 1 THEN
    ROLLBACK;
    raise_application_error(-20999,
                            'No se actualizo la direccion del solicitante Nro.: ' ||
                            p_nro_sol);
  END IF;
  p_nro_soli        := g_nro_soli;
  p_nro_sol         := g_nro_sol;
  p_tipo_personeria := g_tipo_personeria;
  p_cod_localidad   := g_cod_localidad;
  p_cod_barrio      := g_cod_barrio;
  p_domicilio       := g_domicilio;
  p_tipo_vivienda   := g_tipo_vivienda;
  p_croquis_hablado := g_croquis_hablado;
  p_nro_cedula      := g_nro_cedula;
  p_ruc             := g_ruc;
  COMMIT;
EXCEPTION
  WHEN OTHERS THEN
    ROLLBACK;
    pr_capturar_error('p_nro_soli: ' || p_nro_soli || chr(10) ||
                      'p_nro_sol: ' || p_nro_sol || chr(10) ||
                      'p_tipo_personeria: ' || p_tipo_personeria ||
                      chr(10) || 'p_cod_localidad: ' || p_cod_localidad ||
                      chr(10) || 'p_cod_barrio: ' || p_cod_barrio ||
                      chr(10) || 'p_domicilio: ' || p_domicilio ||
                      chr(10) || 'p_tipo_vivienda: ' || p_tipo_vivienda ||
                      chr(10) || 'p_croquis_hablado: ' ||
                      p_croquis_hablado || chr(10) || 'p_nro_cedula: ' ||
                      p_nro_cedula || chr(10) || 'p_ruc: ' || p_ruc);
    RAISE;
END pr_sol01737_ref;

PROCEDURE pr_obtiene_cuota_max_vigente(p_cod_cliente       IN cm_scoring_mensual_ingrid.cod_cliente%TYPE,
                                       p_resultado_cm_disp OUT cm_scoring_mensual_ingrid.resultado_cm_disp%TYPE,
                                       p_periodo           OUT cm_scoring_mensual_ingrid.periodo%TYPE) IS
BEGIN
  IF p_cod_cliente IS NOT NULL AND p_cod_cliente <> 0 THEN
    BEGIN
      SELECT a.resultado_cm_disp, a.periodo
        INTO p_resultado_cm_disp, p_periodo
        FROM cm_scoring_mensual_ingrid a
       WHERE a.cod_cliente = p_cod_cliente
       ORDER BY a.periodo DESC FETCH FIRST 1 ROW ONLY;
    EXCEPTION
      WHEN no_data_found THEN
        ROLLBACK;
        BEGIN
          SELECT a.resultado_cm_disp, a.fec_hor_generacion
            INTO p_resultado_cm_disp, p_periodo
            FROM cm_scoring a
           WHERE a.cod_cliente = p_cod_cliente
            
           ORDER BY a.nro_soli DESC FETCH FIRST 1 ROW ONLY;
        EXCEPTION
          WHEN no_data_found THEN
            ROLLBACK;
        END;
    END;
  END IF;
  COMMIT;
END pr_obtiene_cuota_max_vigente;
FUNCTION fn_verifica_sucursal RETURN NUMBER IS
  v_w_cod_tipo_vendedor vendedores.cod_tipo_vendedor%TYPE;
  v_retorno             NUMBER := 0;
  v_es_jefe_sucursal    NUMBER := 0;
  v_usuario             personal.login%TYPE;
BEGIN
  pkg_ic.inicializar;
  v_usuario := pkg_ic.g_usuario;
  BEGIN
    SELECT nvl(a.cod_tipo_vendedor, '')
      INTO v_w_cod_tipo_vendedor
      FROM vendedores a
      JOIN personal b
        ON a.cod_personal = b.cod_personal
     WHERE b.login = v_usuario
       AND a.vend_activo = 1;
  EXCEPTION
    WHEN no_data_found THEN
      ROLLBACK;
      v_w_cod_tipo_vendedor := '';
    WHEN OTHERS THEN
      ROLLBACK;
      v_w_cod_tipo_vendedor := '';
  END;
  
  IF v_w_cod_tipo_vendedor = 'TELEMKT' THEN
    v_retorno := 0;
  ELSE
    v_retorno := 1;
  END IF;
  
  /*
     if cod_tipo_vendedor_soli = 'VENINDEP' then
        begin
       select  count(*)
       into v_es_jefe_sucursal
         from sucursal a, ingrid_control_usuario b
       where a.cod_sucursal      = pkg_ic.g_cod_sucursal
         and a.cod_jefe_sucursal = b.cod_personal
         and b.login             = fn_user;
      exception
        when others then
          raise_application_error(-20001, 'Error al seleccionar c?digo jefe de sucursal...');
        end;
    
        if v_es_jefe_sucursal > 0 then
           v_retorno := 0;
        end if;
    end if;
  */
  
  RETURN v_retorno;
  COMMIT;
END;






PROCEDURE pr_inserta_solicitud_conyuge(p_nro_sol          IN OUT sc_sol.nro_sol%TYPE,
                               p_ape_sol          IN sc_sol.ape_sol%TYPE,
                               p_nom_sol          IN sc_sol.nom_sol%TYPE,
                               p_cliente          IN sc_sol.cliente%TYPE,
                               p_cod_nacionalidad IN sc_sol.cod_nacionalidad%TYPE,
                               p_tipo_personeria  IN sc_sol.tipo_personeria%TYPE,
                               p_contribuyente    IN sc_sol.contribuyente%TYPE,
                               p_nro_cedula_alfa  IN sc_sol.nro_cedula_alfa%TYPE,
                               p_apodo            IN sc_sol.apodo%TYPE,
                               p_tipo_doc         IN sc_sol.tipo_doc%TYPE,
                               p_nro_doc          IN sc_sol.nro_doc%TYPE,
                               p_nro_cedula       IN sc_sol.nro_cedula%TYPE,
                               p_ruc_sol          IN sc_sol.ruc_sol%TYPE,
                               p_ruc              IN OUT sc_sol.ruc%TYPE,
                               p_ruc_dv           IN sc_sol.ruc_dv%TYPE,
                               p_fec_nacimiento   IN sc_sol.fec_nacimiento%TYPE,
                               p_estado_civil     IN sc_sol.estado_civil%TYPE,
                               p_sexo             IN sc_sol.sexo%TYPE,
                               p_correo           IN sc_sol.email%TYPE,
                               p_id_telefono      IN OUT sc_sol.id_telefono%TYPE,
                               p_cod_cliente      IN sc_sol.cod_cliente%TYPE,
                               p_g_cod_sucursal   IN sc_sol.cod_suc_gestion%TYPE,
                               p_g_usuario        IN sc_sol.usr_ult_act%TYPE,
                               p_cod_telefonica   IN sc_telefono.cod_telefonica%TYPE,
                               p_nro_telefono     IN sc_telefono.nro_telefono%TYPE,
                               p_nro_soli         IN sc_det.nro_soli%TYPE,
                               p_segundo_nro_tele IN VARCHAR2,
                               p_actualizar       IN NUMBER,
                               p_mensaje_error    OUT VARCHAR2) IS
  v_retorno_status   NUMBER := 0;
  l_intento          NUMBER := 0;
  v_fecha_nacimiento sc_sol.fec_nacimiento%TYPE := to_date(p_fec_nacimiento,
                                                           'dd/mm/yyyy');
  v_fec_ult_act      sc_sol.fec_ult_act%TYPE := current_date;
  v_fec_ref          sc_sol.fec_ult_act%TYPE := current_date;
  v_cliente          sc_sol.cliente%TYPE;
  v_cedula           sc_sol.nro_cedula%TYPE;
  v_nro_cedula_alfa  sc_sol.nro_cedula_alfa%TYPE;
  v_apodo            VARCHAR2(300);
  v_contador_tel     NUMBER;
  v_id_telef_seg     sc_sol.id_telefono%TYPE;
  v_cod_telef_seg    sc_telefono.cod_telefonica%TYPE;
  v_nro_telef_seg    sc_telefono.nro_telefono%TYPE;
  v_prefijo_seg      VARCHAR2(10);
BEGIN
  
  v_contador_tel := length(p_segundo_nro_tele);
  IF v_contador_tel = 9 THEN
    v_prefijo_seg   := substr(p_segundo_nro_tele, 1, 3);
    v_nro_telef_seg := substr(p_segundo_nro_tele, 4);
  ELSIF v_contador_tel = 8 THEN
    v_prefijo_seg   := '0' || substr(p_segundo_nro_tele, 0, 2);
    v_nro_telef_seg := p_segundo_nro_tele;
  END IF;
  IF v_prefijo_seg <> '021' THEN
    BEGIN
      SELECT cod_telefonica
        INTO v_cod_telef_seg
        FROM sc_telefonica
       WHERE prefijo = v_prefijo_seg;
    EXCEPTION
      WHEN no_data_found THEN
        ROLLBACK;
        raise_application_error(-20001, 'Favor verificar cod_telefono');
    END;
  ELSE
    v_cod_telef_seg := '--';
  END IF;
  
  IF p_actualizar = 0 THEN
    --raise_application_error(-20001, 'llegue');
    --  begin
    l_intento := 0;
    
    BEGIN
      UPDATE sc_control
         SET ult_nro_sol     = ult_nro_sol + 1,
             ult_id_telefono = ult_id_telefono + 1
       WHERE dummy_key = 1;
    EXCEPTION
      WHEN OTHERS THEN
        ROLLBACK;
        p_mensaje_error := 'Error al actualizar nro.de solicitud...';
        raise_application_error(-20001, p_mensaje_error);
    END;
    
    BEGIN
      SELECT ult_nro_sol, ult_id_telefono
        INTO p_nro_sol, p_id_telefono
        FROM sc_control
       WHERE dummy_key = 1;
    EXCEPTION
      WHEN no_data_found THEN
        ROLLBACK;
      WHEN OTHERS THEN
        ROLLBACK;
        p_mensaje_error := 'Error al seleccionar nro. de solicitud...';
        raise_application_error(-20001, p_mensaje_error);
    END;
    
    BEGIN
      v_apodo := nvl(p_apodo, '-');
      
      IF p_tipo_doc = 'CIP' THEN
        v_cedula := p_nro_cedula;
      ELSE
        v_cedula          := p_nro_cedula;
        v_nro_cedula_alfa := p_nro_cedula;
      END IF;
      
      p_ruc             := v_cedula;
      v_nro_cedula_alfa := nvl(p_nro_cedula_alfa, v_cedula);
      INSERT INTO sc_sol
        (nro_sol,
         ape_sol,
         nom_sol,
         cliente,
         cod_nacionalidad,
         tipo_personeria,
         contribuyente,
         nro_cedula_alfa,
         apodo,
         tipo_doc,
         nro_doc,
         nro_cedula,
         cod_req_iden,
         req_iden,
         ruc_sol,
         ruc,
         ruc_dv,
         fec_nacimiento,
         estado_civil,
         sexo,
         email,
         id_telefono,
         domicilio,
         barrio,
         cod_barrio,
         cod_localidad,
         referencia_domicilio,
         cod_req_domi,
         req_domi,
         croquis_hablado,
         tipo_vivienda,
         locador,
         id_telefono_locador,
         nro_ult_soli,
         cod_cliente,
         cod_faja,
         fec_refe,
         cod_suc_gestion,
         fec_ult_act,
         usr_ult_act,
         activo,
         cod_zona_cobranza)
      VALUES
        (p_nro_sol,
         p_ape_sol,
         p_nom_sol,
         p_cliente,
         p_cod_nacionalidad,
         p_tipo_personeria,
         p_contribuyente,
         v_nro_cedula_alfa,
         v_apodo,
         p_tipo_doc,
         p_nro_doc,
         v_cedula,
         '--',
         'N/A',
         p_ruc_sol,
         p_ruc,
         p_ruc_dv,
         v_fecha_nacimiento,
         p_estado_civil,
         p_sexo,
         p_correo,
         p_id_telefono,
         '-',
         '-',
         '--',
         0,
         '-',
         '--',
         'N/A',
         '-',
         '-',
         '-',
         0,
         0,
         p_cod_cliente,
         '-',
         v_fec_ref,
         p_g_cod_sucursal,
         v_fec_ult_act,
         p_g_usuario,
         1,
         0);
      --COMMIT;
    EXCEPTION
      WHEN OTHERS THEN
        ROLLBACK;
        p_mensaje_error := 'Error al registrar nuevo solicitante.' ||
                           SQLERRM;
        raise_application_error(-20001, p_mensaje_error || SQLERRM);
    END;
    BEGIN
      pr_insert_telefonos(p_id_telefono    => p_id_telefono,
                          p_cod_telefonica => p_cod_telefonica,
                          p_nro_telefono   => p_nro_telefono,
                          p_g_usuario      => p_g_usuario,
                          p_fec_ult_act    => v_fec_ult_act,
                          p_id_tel_seg     => v_id_telef_seg,
                          p_cod_telef      => v_cod_telef_seg,
                          p_nro_telef      => v_nro_telef_seg,
                          p_retorno_status => v_retorno_status,
                          p_mensaje_error  => p_mensaje_error);
    EXCEPTION
      WHEN OTHERS THEN
        ROLLBACK;
        raise_application_error(-20001,
                                'Error en la llamada al pr_insert_telefonos ' ||
                                SQLERRM);
    END;
    IF NOT (p_estado_civil = 'CASADO' OR p_estado_civil = 'PAREJA') THEN
      BEGIN
        DELETE FROM sc_det
         WHERE nro_soli = p_nro_soli
           AND tipo_sol = 'CSOL';
      --  COMMIT;
      EXCEPTION
        WHEN OTHERS THEN
          ROLLBACK;
          p_mensaje_error := 'Error al limpiar detalle solicitud: ';
          raise_application_error(-20001, p_mensaje_error || SQLERRM);
      END;
    END IF;
    --exception
    ---   when others then
    --     rollback;
    --  raise_application_error(-20001, 'Error ' || sqlerrm);
    
    --  end;
  ELSIF p_actualizar = 1 THEN
    BEGIN
      pr_insert_telefonos(p_id_telefono    => p_id_telefono,
                          p_cod_telefonica => p_cod_telefonica,
                          p_nro_telefono   => p_nro_telefono,
                          p_g_usuario      => p_g_usuario,
                          p_fec_ult_act    => v_fec_ult_act,
                          p_id_tel_seg     => v_id_telef_seg,
                          p_cod_telef      => v_cod_telef_seg,
                          p_nro_telef      => v_nro_telef_seg,
                          p_retorno_status => v_retorno_status,
                          p_mensaje_error  => p_mensaje_error);
      
      p_ruc := p_nro_cedula;
      
      UPDATE sc_sol
         SET ape_sol          = p_ape_sol,
             nom_sol          = p_nom_sol,
             cliente          = p_cliente,
             cod_nacionalidad = p_cod_nacionalidad,
             tipo_personeria  = p_tipo_personeria,
             contribuyente    = p_contribuyente,
             nro_cedula_alfa  = p_nro_cedula_alfa,
             apodo            = v_apodo,
             tipo_doc         = p_tipo_doc,
             nro_doc          = p_nro_doc,
             nro_cedula       = p_nro_cedula,
             ruc_sol          = p_ruc_sol,
             ruc              = p_ruc,
             ruc_dv           = p_ruc_dv,
             fec_nacimiento   = v_fecha_nacimiento,
             estado_civil     = p_estado_civil,
             sexo             = p_sexo,
             id_telefono      = p_id_telefono,
             cod_cliente      = p_cod_cliente,
             email            = p_correo, /*** vrojas 09.05.2023 ***/
             fec_ult_act      = v_fec_ult_act,
             usr_ult_act      = p_g_usuario
       WHERE nro_sol = p_nro_sol;
     -- COMMIT;
    EXCEPTION
      WHEN OTHERS THEN
        ROLLBACK;
        p_mensaje_error := 'Error al actualizar datos del solicitante. ' ||
                           SQLERRM;
        raise_application_error(-20001, p_mensaje_error, TRUE);
    END;
  END IF;
  COMMIT;
EXCEPTION
  WHEN OTHERS THEN
    ROLLBACK;
    raise_application_error(-20001, p_mensaje_error);
END;




PROCEDURE pr_inserta_solicitud_garante(p_nro_sol          IN OUT sc_sol.nro_sol%TYPE,
                               p_ape_sol          IN sc_sol.ape_sol%TYPE,
                               p_nom_sol          IN sc_sol.nom_sol%TYPE,
                               p_cliente          IN sc_sol.cliente%TYPE,
                               p_cod_nacionalidad IN sc_sol.cod_nacionalidad%TYPE,
                               p_tipo_personeria  IN sc_sol.tipo_personeria%TYPE,
                               p_contribuyente    IN sc_sol.contribuyente%TYPE,
                               p_nro_cedula_alfa  IN sc_sol.nro_cedula_alfa%TYPE,
                               p_apodo            IN sc_sol.apodo%TYPE,
                               p_tipo_doc         IN sc_sol.tipo_doc%TYPE,
                               p_nro_doc          IN sc_sol.nro_doc%TYPE,
                               p_nro_cedula       IN sc_sol.nro_cedula%TYPE,
                               p_ruc_sol          IN sc_sol.ruc_sol%TYPE,
                               p_ruc              IN OUT sc_sol.ruc%TYPE,
                               p_ruc_dv           IN sc_sol.ruc_dv%TYPE,
                               p_fec_nacimiento   IN sc_sol.fec_nacimiento%TYPE,
                               p_estado_civil     IN sc_sol.estado_civil%TYPE,
                               p_sexo             IN sc_sol.sexo%TYPE,
                               p_correo           IN sc_sol.email%TYPE,
                               p_id_telefono      IN OUT sc_sol.id_telefono%TYPE,
                               p_cod_cliente      IN sc_sol.cod_cliente%TYPE,
                               p_g_cod_sucursal   IN sc_sol.cod_suc_gestion%TYPE,
                               p_g_usuario        IN sc_sol.usr_ult_act%TYPE,
                               p_cod_telefonica   IN sc_telefono.cod_telefonica%TYPE,
                               p_nro_telefono     IN sc_telefono.nro_telefono%TYPE,
                               p_nro_soli         IN sc_det.nro_soli%TYPE,
                               p_segundo_nro_tele IN VARCHAR2,
                               p_actualizar       IN NUMBER,
                               p_mensaje_error    OUT VARCHAR2) IS
  v_retorno_status   NUMBER := 0;
  l_intento          NUMBER := 0;
  v_fecha_nacimiento sc_sol.fec_nacimiento%TYPE := to_date(p_fec_nacimiento,
                                                           'dd/mm/yyyy');
  v_fec_ult_act      sc_sol.fec_ult_act%TYPE := current_date;
  v_fec_ref          sc_sol.fec_ult_act%TYPE := current_date;
  v_cliente          sc_sol.cliente%TYPE;
  v_cedula           sc_sol.nro_cedula%TYPE;
  v_nro_cedula_alfa  sc_sol.nro_cedula_alfa%TYPE;
  v_apodo            VARCHAR2(300);
  v_contador_tel     NUMBER;
  v_id_telef_seg     sc_sol.id_telefono%TYPE;
  v_cod_telef_seg    sc_telefono.cod_telefonica%TYPE;
  v_nro_telef_seg    sc_telefono.nro_telefono%TYPE;
  v_prefijo_seg      VARCHAR2(10);
BEGIN
  
  v_contador_tel := length(p_segundo_nro_tele);
  IF v_contador_tel = 9 THEN
    v_prefijo_seg   := substr(p_segundo_nro_tele, 1, 3);
    v_nro_telef_seg := substr(p_segundo_nro_tele, 4);
  ELSIF v_contador_tel = 8 THEN
    v_prefijo_seg   := '0' || substr(p_segundo_nro_tele, 0, 2);
    v_nro_telef_seg := p_segundo_nro_tele;
  END IF;
  IF v_prefijo_seg <> '021' THEN
    BEGIN
      SELECT cod_telefonica
        INTO v_cod_telef_seg
        FROM sc_telefonica
       WHERE prefijo = v_prefijo_seg;
    EXCEPTION
      WHEN no_data_found THEN
        ROLLBACK;
        raise_application_error(-20001, 'Favor verificar cod_telefono');
    END;
  ELSE
    v_cod_telef_seg := '--';
  END IF;
  
  IF p_actualizar = 0 THEN
    --raise_application_error(-20001, 'llegue');
    --  begin
    l_intento := 0;
    
    BEGIN
      UPDATE sc_control
         SET ult_nro_sol     = ult_nro_sol + 1,
             ult_id_telefono = ult_id_telefono + 1
       WHERE dummy_key = 1;
    EXCEPTION
      WHEN OTHERS THEN
        ROLLBACK;
        p_mensaje_error := 'Error al actualizar nro.de solicitud...';
        raise_application_error(-20001, p_mensaje_error);
    END;
    
    BEGIN
      SELECT ult_nro_sol, ult_id_telefono
        INTO p_nro_sol, p_id_telefono
        FROM sc_control
       WHERE dummy_key = 1;
    EXCEPTION
      WHEN no_data_found THEN
        ROLLBACK;
      WHEN OTHERS THEN
        ROLLBACK;
        p_mensaje_error := 'Error al seleccionar nro. de solicitud...';
        raise_application_error(-20001, p_mensaje_error);
    END;
    
    BEGIN
      v_apodo := nvl(p_apodo, '-');
      
      IF p_tipo_doc = 'CIP' THEN
        v_cedula := p_nro_cedula;
      ELSE
        v_cedula          := p_nro_cedula;
        v_nro_cedula_alfa := p_nro_cedula;
      END IF;
      
      p_ruc             := v_cedula;
      v_nro_cedula_alfa := nvl(p_nro_cedula_alfa, v_cedula);
      INSERT INTO sc_sol
        (nro_sol,
         ape_sol,
         nom_sol,
         cliente,
         cod_nacionalidad,
         tipo_personeria,
         contribuyente,
         nro_cedula_alfa,
         apodo,
         tipo_doc,
         nro_doc,
         nro_cedula,
         cod_req_iden,
         req_iden,
         ruc_sol,
         ruc,
         ruc_dv,
         fec_nacimiento,
         estado_civil,
         sexo,
         email,
         id_telefono,
         domicilio,
         barrio,
         cod_barrio,
         cod_localidad,
         referencia_domicilio,
         cod_req_domi,
         req_domi,
         croquis_hablado,
         tipo_vivienda,
         locador,
         id_telefono_locador,
         nro_ult_soli,
         cod_cliente,
         cod_faja,
         fec_refe,
         cod_suc_gestion,
         fec_ult_act,
         usr_ult_act,
         activo,
         cod_zona_cobranza)
      VALUES
        (p_nro_sol,
         p_ape_sol,
         p_nom_sol,
         p_cliente,
         p_cod_nacionalidad,
         p_tipo_personeria,
         p_contribuyente,
         v_nro_cedula_alfa,
         v_apodo,
         p_tipo_doc,
         p_nro_doc,
         v_cedula,
         '--',
         'N/A',
         p_ruc_sol,
         p_ruc,
         p_ruc_dv,
         v_fecha_nacimiento,
         p_estado_civil,
         p_sexo,
         p_correo,
         p_id_telefono,
         '-',
         '-',
         '--',
         0,
         '-',
         '--',
         'N/A',
         '-',
         '-',
         '-',
         0,
         0,
         p_cod_cliente,
         '-',
         v_fec_ref,
         p_g_cod_sucursal,
         v_fec_ult_act,
         p_g_usuario,
         1,
         0);
      --COMMIT;
    EXCEPTION
      WHEN OTHERS THEN
        ROLLBACK;
        p_mensaje_error := 'Error al registrar nuevo solicitante.' ||
                           SQLERRM;
        raise_application_error(-20001, p_mensaje_error || SQLERRM);
    END;
    BEGIN
      pr_insert_telefonos(p_id_telefono    => p_id_telefono,
                          p_cod_telefonica => p_cod_telefonica,
                          p_nro_telefono   => p_nro_telefono,
                          p_g_usuario      => p_g_usuario,
                          p_fec_ult_act    => v_fec_ult_act,
                          p_id_tel_seg     => v_id_telef_seg,
                          p_cod_telef      => v_cod_telef_seg,
                          p_nro_telef      => v_nro_telef_seg,
                          p_retorno_status => v_retorno_status,
                          p_mensaje_error  => p_mensaje_error);
    EXCEPTION
      WHEN OTHERS THEN
        ROLLBACK;
        raise_application_error(-20001,
                                'Error en la llamada al pr_insert_telefonos ' ||
                                SQLERRM);
    END;
    IF NOT (p_estado_civil = 'CASADO' OR p_estado_civil = 'PAREJA') THEN
      BEGIN
        DELETE FROM sc_det
         WHERE nro_soli = p_nro_soli
           AND tipo_sol = 'GAR';
      --  COMMIT;
      EXCEPTION
        WHEN OTHERS THEN
          ROLLBACK;
          p_mensaje_error := 'Error al limpiar detalle solicitud: ';
          raise_application_error(-20001, p_mensaje_error || SQLERRM);
      END;
    END IF;
    --exception
    ---   when others then
    --     rollback;
    --  raise_application_error(-20001, 'Error ' || sqlerrm);
    
    --  end;
  ELSIF p_actualizar = 1 THEN
    BEGIN
      pr_insert_telefonos(p_id_telefono    => p_id_telefono,
                          p_cod_telefonica => p_cod_telefonica,
                          p_nro_telefono   => p_nro_telefono,
                          p_g_usuario      => p_g_usuario,
                          p_fec_ult_act    => v_fec_ult_act,
                          p_id_tel_seg     => v_id_telef_seg,
                          p_cod_telef      => v_cod_telef_seg,
                          p_nro_telef      => v_nro_telef_seg,
                          p_retorno_status => v_retorno_status,
                          p_mensaje_error  => p_mensaje_error);
      
      p_ruc := p_nro_cedula;
      
      UPDATE sc_sol
         SET ape_sol          = p_ape_sol,
             nom_sol          = p_nom_sol,
             cliente          = p_cliente,
             cod_nacionalidad = p_cod_nacionalidad,
             tipo_personeria  = p_tipo_personeria,
             contribuyente    = p_contribuyente,
             nro_cedula_alfa  = p_nro_cedula_alfa,
             apodo            = v_apodo,
             tipo_doc         = p_tipo_doc,
             nro_doc          = p_nro_doc,
             nro_cedula       = p_nro_cedula,
             ruc_sol          = p_ruc_sol,
             ruc              = p_ruc,
             ruc_dv           = p_ruc_dv,
             fec_nacimiento   = v_fecha_nacimiento,
             estado_civil     = p_estado_civil,
             sexo             = p_sexo,
             id_telefono      = p_id_telefono,
             cod_cliente      = p_cod_cliente,
             email            = p_correo, /*** vrojas 09.05.2023 ***/
             fec_ult_act      = v_fec_ult_act,
             usr_ult_act      = p_g_usuario
       WHERE nro_sol = p_nro_sol;
     -- COMMIT;
    EXCEPTION
      WHEN OTHERS THEN
        ROLLBACK;
        p_mensaje_error := 'Error al actualizar datos del solicitante. ' ||
                           SQLERRM;
        raise_application_error(-20001, p_mensaje_error, TRUE);
    END;
  END IF;
  COMMIT;
EXCEPTION
  WHEN OTHERS THEN
    ROLLBACK;
    raise_application_error(-20001, p_mensaje_error);
END;



PROCEDURE pr_inserta_solicitud_conyu_garante(p_nro_sol          IN OUT sc_sol.nro_sol%TYPE,
                               p_ape_sol          IN sc_sol.ape_sol%TYPE,
                               p_nom_sol          IN sc_sol.nom_sol%TYPE,
                               p_cliente          IN sc_sol.cliente%TYPE,
                               p_cod_nacionalidad IN sc_sol.cod_nacionalidad%TYPE,
                               p_tipo_personeria  IN sc_sol.tipo_personeria%TYPE,
                               p_contribuyente    IN sc_sol.contribuyente%TYPE,
                               p_nro_cedula_alfa  IN sc_sol.nro_cedula_alfa%TYPE,
                               p_apodo            IN sc_sol.apodo%TYPE,
                               p_tipo_doc         IN sc_sol.tipo_doc%TYPE,
                               p_nro_doc          IN sc_sol.nro_doc%TYPE,
                               p_nro_cedula       IN sc_sol.nro_cedula%TYPE,
                               p_ruc_sol          IN sc_sol.ruc_sol%TYPE,
                               p_ruc              IN OUT sc_sol.ruc%TYPE,
                               p_ruc_dv           IN sc_sol.ruc_dv%TYPE,
                               p_fec_nacimiento   IN sc_sol.fec_nacimiento%TYPE,
                               p_estado_civil     IN sc_sol.estado_civil%TYPE,
                               p_sexo             IN sc_sol.sexo%TYPE,
                               p_correo           IN sc_sol.email%TYPE,
                               p_id_telefono      IN OUT sc_sol.id_telefono%TYPE,
                               p_cod_cliente      IN sc_sol.cod_cliente%TYPE,
                               p_g_cod_sucursal   IN sc_sol.cod_suc_gestion%TYPE,
                               p_g_usuario        IN sc_sol.usr_ult_act%TYPE,
                               p_cod_telefonica   IN sc_telefono.cod_telefonica%TYPE,
                               p_nro_telefono     IN sc_telefono.nro_telefono%TYPE,
                               p_nro_soli         IN sc_det.nro_soli%TYPE,
                               p_segundo_nro_tele IN VARCHAR2,
                               p_actualizar       IN NUMBER,
                               p_mensaje_error    OUT VARCHAR2) IS
  v_retorno_status   NUMBER := 0;
  l_intento          NUMBER := 0;
  v_fecha_nacimiento sc_sol.fec_nacimiento%TYPE := to_date(p_fec_nacimiento,
                                                           'dd/mm/yyyy');
  v_fec_ult_act      sc_sol.fec_ult_act%TYPE := current_date;
  v_fec_ref          sc_sol.fec_ult_act%TYPE := current_date;
  v_cliente          sc_sol.cliente%TYPE;
  v_cedula           sc_sol.nro_cedula%TYPE;
  v_nro_cedula_alfa  sc_sol.nro_cedula_alfa%TYPE;
  v_apodo            VARCHAR2(300);
  v_contador_tel     NUMBER;
  v_id_telef_seg     sc_sol.id_telefono%TYPE;
  v_cod_telef_seg    sc_telefono.cod_telefonica%TYPE;
  v_nro_telef_seg    sc_telefono.nro_telefono%TYPE;
  v_prefijo_seg      VARCHAR2(10);
BEGIN
  
  v_contador_tel := length(p_segundo_nro_tele);
  IF v_contador_tel = 9 THEN
    v_prefijo_seg   := substr(p_segundo_nro_tele, 1, 3);
    v_nro_telef_seg := substr(p_segundo_nro_tele, 4);
  ELSIF v_contador_tel = 8 THEN
    v_prefijo_seg   := '0' || substr(p_segundo_nro_tele, 0, 2);
    v_nro_telef_seg := p_segundo_nro_tele;
  END IF;
  IF v_prefijo_seg <> '021' THEN
    BEGIN
      SELECT cod_telefonica
        INTO v_cod_telef_seg
        FROM sc_telefonica
       WHERE prefijo = v_prefijo_seg;
    EXCEPTION
      WHEN no_data_found THEN
        ROLLBACK;
        raise_application_error(-20001, 'Favor verificar cod_telefono');
    END;
  ELSE
    v_cod_telef_seg := '--';
  END IF;
  
  IF p_actualizar = 0 THEN
    --raise_application_error(-20001, 'llegue');
    --  begin
    l_intento := 0;
    
    BEGIN
      UPDATE sc_control
         SET ult_nro_sol     = ult_nro_sol + 1,
             ult_id_telefono = ult_id_telefono + 1
       WHERE dummy_key = 1;
    EXCEPTION
      WHEN OTHERS THEN
        ROLLBACK;
        p_mensaje_error := 'Error al actualizar nro.de solicitud...';
        raise_application_error(-20001, p_mensaje_error);
    END;
    
    BEGIN
      SELECT ult_nro_sol, ult_id_telefono
        INTO p_nro_sol, p_id_telefono
        FROM sc_control
       WHERE dummy_key = 1;
    EXCEPTION
      WHEN no_data_found THEN
        ROLLBACK;
      WHEN OTHERS THEN
        ROLLBACK;
        p_mensaje_error := 'Error al seleccionar nro. de solicitud...';
        raise_application_error(-20001, p_mensaje_error);
    END;
    
    BEGIN
      v_apodo := nvl(p_apodo, '-');
      
      IF p_tipo_doc = 'CIP' THEN
        v_cedula := p_nro_cedula;
      ELSE
        v_cedula          := p_nro_cedula;
        v_nro_cedula_alfa := p_nro_cedula;
      END IF;
      
      p_ruc             := v_cedula;
      v_nro_cedula_alfa := nvl(p_nro_cedula_alfa, v_cedula);
      INSERT INTO sc_sol
        (nro_sol,
         ape_sol,
         nom_sol,
         cliente,
         cod_nacionalidad,
         tipo_personeria,
         contribuyente,
         nro_cedula_alfa,
         apodo,
         tipo_doc,
         nro_doc,
         nro_cedula,
         cod_req_iden,
         req_iden,
         ruc_sol,
         ruc,
         ruc_dv,
         fec_nacimiento,
         estado_civil,
         sexo,
         email,
         id_telefono,
         domicilio,
         barrio,
         cod_barrio,
         cod_localidad,
         referencia_domicilio,
         cod_req_domi,
         req_domi,
         croquis_hablado,
         tipo_vivienda,
         locador,
         id_telefono_locador,
         nro_ult_soli,
         cod_cliente,
         cod_faja,
         fec_refe,
         cod_suc_gestion,
         fec_ult_act,
         usr_ult_act,
         activo,
         cod_zona_cobranza)
      VALUES
        (p_nro_sol,
         p_ape_sol,
         p_nom_sol,
         p_cliente,
         p_cod_nacionalidad,
         p_tipo_personeria,
         p_contribuyente,
         v_nro_cedula_alfa,
         v_apodo,
         p_tipo_doc,
         p_nro_doc,
         v_cedula,
         '--',
         'N/A',
         p_ruc_sol,
         p_ruc,
         p_ruc_dv,
         v_fecha_nacimiento,
         p_estado_civil,
         p_sexo,
         p_correo,
         p_id_telefono,
         '-',
         '-',
         '--',
         0,
         '-',
         '--',
         'N/A',
         '-',
         '-',
         '-',
         0,
         0,
         p_cod_cliente,
         '-',
         v_fec_ref,
         p_g_cod_sucursal,
         v_fec_ult_act,
         p_g_usuario,
         1,
         0);
      --COMMIT;
    EXCEPTION
      WHEN OTHERS THEN
        ROLLBACK;
        p_mensaje_error := 'Error al registrar nuevo solicitante.' ||
                           SQLERRM;
        raise_application_error(-20001, p_mensaje_error || SQLERRM);
    END;
    BEGIN
      pr_insert_telefonos(p_id_telefono    => p_id_telefono,
                          p_cod_telefonica => p_cod_telefonica,
                          p_nro_telefono   => p_nro_telefono,
                          p_g_usuario      => p_g_usuario,
                          p_fec_ult_act    => v_fec_ult_act,
                          p_id_tel_seg     => v_id_telef_seg,
                          p_cod_telef      => v_cod_telef_seg,
                          p_nro_telef      => v_nro_telef_seg,
                          p_retorno_status => v_retorno_status,
                          p_mensaje_error  => p_mensaje_error);
    EXCEPTION
      WHEN OTHERS THEN
        ROLLBACK;
        raise_application_error(-20001,
                                'Error en la llamada al pr_insert_telefonos ' ||
                                SQLERRM);
    END;
    IF NOT (p_estado_civil = 'CASADO' OR p_estado_civil = 'PAREJA') THEN
      BEGIN
        DELETE FROM sc_det
         WHERE nro_soli = p_nro_soli
           AND tipo_sol = 'CGAR';
      --  COMMIT;
      EXCEPTION
        WHEN OTHERS THEN
          ROLLBACK;
          p_mensaje_error := 'Error al limpiar detalle solicitud: ';
          raise_application_error(-20001, p_mensaje_error || SQLERRM);
      END;
    END IF;
    --exception
    ---   when others then
    --     rollback;
    --  raise_application_error(-20001, 'Error ' || sqlerrm);
    
    --  end;
  ELSIF p_actualizar = 1 THEN
    BEGIN
      pr_insert_telefonos(p_id_telefono    => p_id_telefono,
                          p_cod_telefonica => p_cod_telefonica,
                          p_nro_telefono   => p_nro_telefono,
                          p_g_usuario      => p_g_usuario,
                          p_fec_ult_act    => v_fec_ult_act,
                          p_id_tel_seg     => v_id_telef_seg,
                          p_cod_telef      => v_cod_telef_seg,
                          p_nro_telef      => v_nro_telef_seg,
                          p_retorno_status => v_retorno_status,
                          p_mensaje_error  => p_mensaje_error);
      
      p_ruc := p_nro_cedula;
      
      UPDATE sc_sol
         SET ape_sol          = p_ape_sol,
             nom_sol          = p_nom_sol,
             cliente          = p_cliente,
             cod_nacionalidad = p_cod_nacionalidad,
             tipo_personeria  = p_tipo_personeria,
             contribuyente    = p_contribuyente,
             nro_cedula_alfa  = p_nro_cedula_alfa,
             apodo            = v_apodo,
             tipo_doc         = p_tipo_doc,
             nro_doc          = p_nro_doc,
             nro_cedula       = p_nro_cedula,
             ruc_sol          = p_ruc_sol,
             ruc              = p_ruc,
             ruc_dv           = p_ruc_dv,
             fec_nacimiento   = v_fecha_nacimiento,
             estado_civil     = p_estado_civil,
             sexo             = p_sexo,
             id_telefono      = p_id_telefono,
             cod_cliente      = p_cod_cliente,
             email            = p_correo, /*** vrojas 09.05.2023 ***/
             fec_ult_act      = v_fec_ult_act,
             usr_ult_act      = p_g_usuario
       WHERE nro_sol = p_nro_sol;
     -- COMMIT;
    EXCEPTION
      WHEN OTHERS THEN
        ROLLBACK;
        p_mensaje_error := 'Error al actualizar datos del solicitante. ' ||
                           SQLERRM;
        raise_application_error(-20001, p_mensaje_error, TRUE);
    END;
  END IF;
  COMMIT;
EXCEPTION
  WHEN OTHERS THEN
    ROLLBACK;
    raise_application_error(-20001, p_mensaje_error);
END;
END pkg_solicitud_creditos;
/


---------------------------------------------------------------------------
create or replace PROCEDURE pr_sc_crm (
  p_nro_soli          IN OUT INTEGER,
  p_nro_sol           IN OUT INTEGER,
  p_estado_soli       IN VARCHAR2,
  p_programa          IN VARCHAR2,
  p_cod_resultado     IN OUT VARCHAR2,
  p_resultado         IN OUT VARCHAR2,
  p_cod_identificador IN OUT VARCHAR2,
  p_nro_contacto      IN OUT INTEGER,
  p_vencido           IN OUT INTEGER
) IS
  l_cod_tipo_soli         sc.cod_tipo_soli%TYPE;
  l_cod_vendedor          sc.cod_vendedor%TYPE;
  l_nro_cedula            sc_sol.nro_cedula%TYPE;
  l_cod_cliente           sc_sol.cod_cliente%TYPE := 0;
  l_cod_tipo_mercaderia   sc_tipo_soli.cod_tipo_mercaderia%TYPE;
  l_cod_personal          vendedores.cod_personal%TYPE;
  l_cod_tipo_vendedor     vendedores.cod_tipo_vendedor%TYPE;
  l_login                 personal.login%TYPE;
  l_cod_origen_gestion    VARCHAR2(255);
  l_cod_gestion           VARCHAR2(255);
  l_cod_tipo_gestion      VARCHAR2(255);
  l_ult_nro_x             crm_cliente_ult_nro_x.ult_nro_x%TYPE := 0;
  l_fec_hora_prox_gestion DATE;
  l_cod_punto_venta       INTEGER;
  l_nro_gestion           INTEGER := 0;
  l_cod_motivo            VARCHAR2(255);
  l_comentario_gestion    VARCHAR2(255);
  l_nro_item_bandeja      INTEGER;
  l_nuevo_item            INTEGER;
  l_periodo               DATE;
BEGIN
  IF p_cod_identificador = 'APP' THEN
    p_nro_contacto := 0;
  END IF;
  BEGIN
    SELECT b.nro_cedula,
           b.cod_cliente,
           a.cod_tipo_soli,
           a.cod_vendedor
    INTO l_nro_cedula,
         l_cod_cliente,
         l_cod_tipo_soli,
         l_cod_vendedor
    FROM sc a, sc_sol b
    WHERE a.nro_soli = p_nro_soli
    AND a.nro_sol = b.nro_sol
    AND b.nro_sol = p_nro_sol;
    COMMIT;
  EXCEPTION
    WHEN No_Data_Found THEN
      ROLLBACK;
      Raise_Application_Error(
        -20999,
        'No se encontro cedula ni cod.cliente del solicitante. Soli: '||p_nro_soli||', Sol: '||p_nro_sol
      );
    WHEN OTHERS THEN 
        ROLLBACK; 
  END;
  
  
  BEGIN
    SELECT cod_tipo_mercaderia
    INTO l_cod_tipo_mercaderia
    FROM sc_tipo_soli
    WHERE cod_tipo_soli = l_cod_tipo_soli;
    COMMIT;
  EXCEPTION
    WHEN No_Data_Found THEN
      ROLLBACK;
      Raise_Application_Error(
        -20999,
        'No se encontro cod_tipo_mercaderia para cod_tipo_soli: '||l_cod_tipo_soli);
  WHEN OTHERS THEN
    ROLLBACK;
  END;
  
  
  BEGIN
    SELECT a.cod_personal,
           a.cod_tipo_vendedor,
           b.login
    INTO l_cod_personal,
         l_cod_tipo_vendedor,
         l_login
     
    FROM vendedores a, personal b
    WHERE a.cod_personal = b.cod_personal
    AND a.cod_vendedor = l_cod_vendedor;
    COMMIT;
  EXCEPTION
    WHEN No_Data_Found THEN
      ROLLBACK;
      Raise_Application_Error(
        -20999,
        'No se encontro login ni cod_personal para cod_vendedor: '||l_cod_vendedor
      );
  WHEN OTHERS THEN 
    ROLLBACK;
  END;
  
  
  l_cod_origen_gestion := 'SOLICITUD';  /* fijo */
  l_cod_gestion        := 'SOLI';       /* fijo */
  l_cod_tipo_gestion   := 'AUTOMATICA'; /* fijo */
  /*Si el estado de la Solicitud es RECH/CANC o vencido es igual a 1
    debe cambiar el codigo de gestion*/
  IF p_estado_soli = 'RECH' THEN
    l_cod_gestion := 'RECH';
  ELSIF p_estado_soli = 'CANC' THEN
    l_cod_gestion := 'CANC';
  END IF;
  IF p_vencido = 1 THEN
    l_cod_gestion := 'VENC';
  END IF;
  /* genera numero de transaccion */
  IF l_cod_cliente != 0 THEN
    BEGIN
    SELECT nvl(Max(ult_nro_x),0) + 1
    INTO l_ult_nro_x
    FROM crm_cliente_ult_nro_x
    WHERE cod_cliente = l_cod_cliente;
    COMMIT;
    EXCEPTION 
      WHEN NO_DATA_FOUND THEN 
        ROLLBACK;
      WHEN OTHERS THEN 
        ROLLBACK;
    END;
    DECLARE
      l_sysdate DATE := SYSDATE;
    BEGIN
      INSERT INTO crm_cliente_x VALUES (
        l_cod_cliente, l_ult_nro_x, 'SOLI',
        l_sysdate, l_login, p_nro_soli
      );
      COMMIT;
      EXCEPTION 
        WHEN OTHERS THEN 
          ROLLBACK;
    END;
    
    BEGIN
    UPDATE crm_cliente_ult_nro_x
    SET ult_nro_x = l_ult_nro_x
    WHERE cod_cliente = l_cod_cliente;
    IF sql%rowcount = 0 THEN
      INSERT INTO crm_cliente_ult_nro_x
      VALUES (l_cod_cliente, 1);
    END IF;
    EXCEPTION 
      WHEN OTHERS THEN 
        ROLLBACK;
     END;
  END IF;            
  IF l_cod_personal != 0 THEN
    pr_inserta_gestion_crm(
      p_nro_contacto          => p_nro_contacto,
      p_cod_cliente           => l_cod_cliente,
      p_nro_sol               => p_nro_sol,
      p_cod_origen_gestion    => l_cod_origen_gestion,
      p_cod_identificador     => p_cod_identificador,
      p_nro_x                 => l_ult_nro_x,
      p_cod_resultado         => p_cod_resultado,
      p_resultado             => p_resultado,
      p_periodo               => l_periodo,
      p_login                 => l_login,
      p_cod_personal          => l_cod_personal,
      p_cod_gestion           => l_cod_gestion,
      p_cod_tipo_gestion      => l_cod_tipo_gestion,
      p_cod_motivo            => l_cod_motivo,
      p_fec_hora_prox_gestion => l_fec_hora_prox_gestion,
      p_cod_tipo_mercaderia   => l_cod_tipo_mercaderia,
      p_cod_punto_venta       => l_cod_punto_venta,
      p_comentario_gestion    => l_comentario_gestion,
      p_cod_tipo_vendedor     => l_cod_tipo_vendedor,
      p_nro_item_bandeja      => l_nro_item_bandeja,
      p_nro_gestion           => l_nro_gestion,
      p_nuevo_item            => l_nuevo_item
    );
    IF p_cod_resultado != 100 THEN
      Raise_Application_Error(-20999, p_resultado);
    END IF;
  END IF;   
  
  BEGIN                            
  INSERT INTO crm_gestion_sc (nro_sol, cod_cliente, nro_gestion, nro_soli)
  VALUES (p_nro_sol, l_cod_cliente, l_nro_gestion, p_nro_soli);
  EXCEPTION
    WHEN OTHERS THEN 
      ROLLBACK;
  END;
  COMMIT;
EXCEPTION
  WHEN OTHERS THEN
    ROLLBACK;
    pr_capturar_error('p_nro_sol:'||p_nro_sol||chr(10)||
'l_cod_cliente:'||l_cod_cliente||chr(10)||
'l_nro_gestion:'||l_nro_gestion||chr(10)||
'p_nro_soli:'||p_nro_soli);
    RAISE;
END;
/
----------------------------------------------------------------
create or replace PROCEDURE pr_inserta_gestion_crm(
  p_nro_contacto          IN OUT INTEGER,
  p_cod_cliente           IN OUT INTEGER,
  p_nro_sol               IN OUT INTEGER,
  p_cod_origen_gestion    IN OUT VARCHAR2,
  p_cod_identificador     IN OUT VARCHAR2,
  p_nro_x                 IN OUT INTEGER,
  p_cod_resultado         IN OUT INTEGER,
  p_resultado             IN OUT VARCHAR2,
  p_periodo               IN OUT DATE,
  p_login                 IN OUT VARCHAR2,
  p_cod_personal          IN OUT VARCHAR2,
  p_cod_gestion           IN OUT VARCHAR2,
  p_cod_tipo_gestion      IN OUT VARCHAR2,
  p_cod_motivo            IN OUT VARCHAR2,
  p_fec_hora_prox_gestion IN OUT DATE,
  p_cod_tipo_mercaderia   IN OUT VARCHAR2,
  p_cod_punto_venta       IN OUT INTEGER,
  p_comentario_gestion    IN OUT VARCHAR2,
  p_cod_tipo_vendedor     IN OUT VARCHAR2,
  p_nro_item_bandeja      IN OUT INTEGER,
  p_nro_gestion           IN OUT INTEGER,
  p_nuevo_item            IN OUT INTEGER
)IS
  l_cod_estado_gestion      VARCHAR2(10) := ' ';
  l_w_cod_estado_gestion    VARCHAR2(10);
  l_w_cod_origen_gestion    VARCHAR2(10);
  l_w_cod_identificador     VARCHAR2(10);
  l_w_nro_x                 INTEGER;
  l_cod_sucursal            INTEGER;
  l_ingresa                 VARCHAR2(1);
  l_ult_cod_gestion         VARCHAR2(8);
  l_soli_en_proceso         INTEGER;
  l_w_cod_personal          VARCHAR2(8);
  l_w_nro_contacto          INTEGER := 0;
  l_w_cod_cliente           INTEGER := 0;
  l_w_nro_sol               INTEGER := 0;
  l_query                   VARCHAR2(2048);
  l_upd_gestiones           INTEGER ;
  l_encontrado              INTEGER ;
  l_cod_personal_x          VARCHAR2(8);
  l_usuario                 VARCHAR2(8);
  l_nro_item_bandeja        NUMBER := 0;
  l_cod_motivo              VARCHAR2(10);
  l_ult_nro_gestion         NUMBER := 0;
  l_fec_hora_inicio_gestion DATE;
  l_fec_hora_prox_gestion   DATE;
  l_fec_agenda              DATE;
BEGIN
  l_upd_gestiones := 0;/*si se cumple que se debe actualizar algun dato de algun item de la bandeja
                      tambien corro para actulizar todas las gestiones de ese cliente/prospecto*/
  /* NO HAGO COMMIT NI ROLLBACK PARA MANEJAR LA
  ** TRANSACCIONABILIDAD DESDE EL PROGRAMA QUE LO EJECUTA
  */
  IF p_periodo IS NULL THEN
    BEGIN
    SELECT trunc(fecha_virtual,'mm')
    INTO p_periodo
    FROM ingrid_control
    WHERE dummy_key = 1;
    EXCEPTION
      WHEN NO_DATA_FOUND THEN 
        ROLLBACK;
       WHEN OTHERS THEN 
         ROLLBACK;
    END;
  END IF;
  IF p_cod_tipo_vendedor = 'VENINDEP' THEN
    p_cod_origen_gestion := 'VENINDEP';
  END IF;
  -- para los casos en que es llamado desde el ws, le pasa login en vez de cod_personal
  IF p_cod_gestion NOT IN ('VTACONTA', 'VTACREDI', 'VTACOMPL') THEN
    IF p_login != '' THEN
      l_usuario := p_login;
      BEGIN
        SELECT cod_personal,
               cod_sucursal
        INTO p_cod_personal,
             l_cod_sucursal
        FROM ingrid_control_usuario
        WHERE login = p_login;
      EXCEPTION
        WHEN No_Data_Found THEN
          ROLLBACK;
          Raise_Application_Error(
            -20999,
            'No se encontro cod_personal para login: '||p_login
          );
          WHEN OTHERS THEN 
            ROLLBACK;
      END;
    ELSE
      BEGIN
      SELECT Nvl(login, fn_user), nvl(cod_sucursal, 0)
      INTO l_usuario, l_cod_sucursal
      FROM personal
      WHERE cod_personal = p_cod_personal;
      EXCEPTION 
        WHEN NO_DATA_FOUND THEN 
          ROLLBACK;
        WHEN OTHERS THEN
            ROLLBACK;
       END;
    END IF;
  END IF;
  /*
  ** Verifica si ya existe en la bandeja
  */
  l_encontrado := 0;
  p_nro_item_bandeja := 0;
  l_w_cod_identificador := '';
  IF p_cod_cliente != 0 THEN
    BEGIN
      SELECT a.nro_item_bandeja,
            a.cod_origen_gestion,
            a.cod_estado_gestion,
            a.cod_identificador,
            a.nro_x,
            b.cod_gestion,
            a.nro_contacto,
            a.cod_cliente,
            a.nro_sol
      INTO p_nro_item_bandeja,
          l_w_cod_origen_gestion,
          l_w_cod_estado_gestion,
          l_w_cod_identificador,
          l_w_nro_x,
          l_ult_cod_gestion,
          l_w_nro_contacto,
          l_w_cod_cliente,
          l_w_nro_sol
      FROM crm_bandeja a, crm_cliente_gestiones b, crm_gestion c
      WHERE a.ult_nro_gestion = b.nro_gestion (+)
      AND b.cod_gestion = c.cod_gestion (+)
      AND a.periodo = p_periodo
      AND a.cod_personal = p_cod_personal
      AND a.cod_cliente = p_cod_cliente
      AND (
        c.fin_gestion = 'N'
        OR a.cod_estado_gestion NOT IN ('FINGESTION ','FACTURADO')
      )
      ORDER BY fec_hora_asignado DESC
      FETCH FIRST '1' ROWS ONLY;
      l_encontrado := 1;
    EXCEPTION
      WHEN No_Data_Found THEN
        l_encontrado := 0;
        ROLLBACK;
       WHEN OTHERS THEN 
         ROLLBACK;
    END;
  END IF;
  IF p_nro_sol != 0 AND l_encontrado = 0 THEN
    BEGIN
      SELECT a.nro_item_bandeja,
              a.cod_origen_gestion,
              a.cod_estado_gestion,
              a.cod_identificador,
              a.nro_x,
              b.cod_gestion,
              a.nro_contacto,
              a.cod_cliente,
              a.nro_sol
      INTO l_nro_item_bandeja,
            l_w_cod_origen_gestion,
            l_w_cod_estado_gestion,
            l_w_cod_identificador,
            l_w_nro_x,
            l_ult_cod_gestion,
            l_w_nro_contacto,
            l_w_cod_cliente,
            l_w_nro_sol
      FROM crm_bandeja a, crm_cliente_gestiones b, crm_gestion c
      WHERE a.ult_nro_gestion = b.nro_gestion (+)
      AND b.cod_gestion = c.cod_gestion (+)
      AND a.periodo = p_periodo
      AND a.cod_personal = p_cod_personal
      AND a.nro_sol = p_nro_sol
      AND (
        c.fin_gestion = 'N'
        OR a.cod_estado_gestion NOT IN ('FINGESTION ','FACTURADO')
      )
      ORDER BY fec_hora_asignado DESC
      FETCH FIRST 1 ROWS ONLY;
      l_encontrado := 1;
    EXCEPTION
      WHEN No_Data_Found THEN
        
        l_encontrado := 0;
        ROLLBACK;
       WHEN OTHERS THEN 
         ROLLBACK;
    END;
  END IF;
  IF p_nro_contacto != 0  AND l_encontrado = 0 THEN
    BEGIN
      SELECT  a.nro_item_bandeja,
              a.cod_origen_gestion,
              a.cod_estado_gestion,
              a.cod_identificador,
              a.nro_x,
              b.cod_gestion,
              a.nro_contacto,
              a.cod_cliente,
              a.nro_sol
      INTO l_nro_item_bandeja,
          l_w_cod_origen_gestion,
          l_w_cod_estado_gestion,
          l_w_cod_identificador,
          l_w_nro_x,
          l_ult_cod_gestion,
          l_w_nro_contacto,
          l_w_cod_cliente,
          l_w_nro_sol
      FROM crm_bandeja a, crm_cliente_gestiones b, crm_gestion c
      WHERE a.ult_nro_gestion = b.nro_gestion (+)
      AND b.cod_gestion = c.cod_gestion (+)
      AND a.periodo = p_periodo
      AND a.cod_personal = p_cod_personal
      AND a.nro_contacto = p_nro_contacto
      AND (
        c.fin_gestion = 'N'
        OR a.cod_estado_gestion NOT IN ('FINGESTION ','FACTURADO')
      )
      ORDER BY fec_hora_asignado DESC
      FETCH FIRST 1 ROWS ONLY;
      l_encontrado := 1;
    EXCEPTION
      WHEN No_Data_Found THEN
        l_encontrado := 0;
        ROLLBACK;
       WHEN OTHERS THEN 
         ROLLBACK;
    END;
  END IF;
  IF p_cod_cliente = 0 AND p_nro_sol = 0 AND p_nro_contacto = 0 THEN
    l_encontrado := 0;
  END IF;
  IF l_encontrado = 0 THEN
    pr_inserta_bandeja_crm(
      p_cod_cliente             => p_cod_cliente,
      p_nro_contacto            => p_nro_contacto,
      p_nro_sol                 => p_nro_sol,
      p_cod_personal            => p_cod_personal,
      p_cod_origen_gestion      => p_cod_origen_gestion,
      p_cod_identificador       => p_cod_identificador,
      p_nro_x                   => p_nro_x,
      p_cod_estado_gestion      => l_cod_estado_gestion,
      p_ult_nro_gestion         => l_ult_nro_gestion,
      p_fec_hora_inicio_gestion => l_fec_hora_inicio_gestion, /* si no ingresa por algun motivo */
      p_fec_hora_prox_gestion   => l_fec_hora_prox_gestion,
      p_fec_agenda              => l_fec_agenda,
      p_login                   => p_login,
      p_cod_resultado           => p_cod_resultado,
      p_resultado               => p_resultado,
      p_ingresa                 => l_ingresa,
      p_nro_item_bandeja        => p_nro_item_bandeja,
      p_periodo                 => p_periodo,
      p_desde_ingrid            => 0
    );
    IF p_cod_resultado = 100 AND l_ingresa = 'N' THEN
      p_resultado := 'El cliente/contacto/solicitante: '
          ||p_cod_cliente||'/'||p_nro_contacto
          ||'/'||p_nro_sol
          ||' no pudo ser insertado en la bandeja de '||p_login||';ingresa= '||l_ingresa;
      RETURN;
    ELSIF p_cod_resultado != 100 THEN
      p_resultado := p_resultado + 'Error al insertar una gestion...';
      RETURN;
    END IF;
    p_nuevo_item := 1;
  ELSE
    p_cod_origen_gestion := l_w_cod_origen_gestion; /* no cambia origen */
    p_cod_identificador := l_w_cod_identificador; /* no cambia identif. de origen */
    p_nuevo_item := 0;
  END IF;
  BEGIN
    SELECT cod_estado_gestion
    INTO l_cod_estado_gestion
    FROM crm_gestion
    WHERE cod_gestion = p_cod_gestion;
    IF l_cod_estado_gestion = '--' THEN
      l_cod_estado_gestion := l_w_cod_estado_gestion; /* no cambia estado */
    END IF;
  EXCEPTION
    WHEN No_Data_Found THEN
      ROLLBACK;
      Raise_Application_Error(
        -20999,
        'Error al seleccionar cod_estado_gestion para '
        ||'p_cod_gestion: '||p_cod_gestion
      );
      WHEN OTHERS THEN 
        ROLLBACK;
  END;
  /* inserta seguimiento */
  
  pr_crm_max_nro_gestion(
    p_nro_gestion   => p_nro_gestion,
    p_accion        => 1,
    p_cod_resultado => p_cod_resultado
  );
  
 -- raise_application_error(-20001, 'pr_crm_max_nro_gestion' || p_nro_gestion);
  IF p_cod_tipo_mercaderia = '' THEN p_cod_tipo_mercaderia := '--'; END IF;
  IF p_comentario_gestion = '' OR p_comentario_gestion IS NULL THEN
      p_comentario_gestion := 'GENERADO AUTOMATICAMENTE';
  END IF;
/* SI ES UNA VENTA RECIVIRA EL CODIGO DE PERSONAL DEL VENDEDOR Y EL LOGIN DEL
** QUIEN REALIZO LA FACTURA POR ESA RAZON LA GESTION SE DEBE CREAR CON EL CODIGO
** DE PERSONAL DEL LOGIN Y NO DEL VENDEDOR
*/
  IF p_cod_gestion IN ('VTACONTA', 'VTACREDI', 'VTACOMPL') THEN
    l_usuario := p_login;
    l_w_cod_personal := p_cod_personal;
    BEGIN
    SELECT cod_sucursal,
           cod_personal
    INTO l_cod_sucursal,
         p_cod_personal
    FROM ingrid_control_usuario
    WHERE login = p_login;
    EXCEPTION 
      WHEN NO_DATA_FOUND THEN 
        ROLLBACK;
      WHEN OTHERS THEN 
        ROLLBACK;
     END;
  END IF;
    l_cod_personal_x := p_cod_personal;
    /*** vrojas 07.06.2023 ***/
    IF p_cod_tipo_gestion = 'AUTOMATICA'
      AND p_cod_gestion NOT IN ('SOLI','VTACONTA','VTACREDI') THEN
      p_cod_personal := 45;
    END IF;
  /*** fin vrojas ***/
  DECLARE
    l_sysdate DATE := SYSDATE;
  BEGIN
  --  RAISE_APPLICATION_ERROR(-20001, 'INSERT crm_cliente_gestiones');
    
    INSERT INTO crm_cliente_gestiones(
      nro_gestion,          nro_item_bandeja,      cod_cliente,
      nro_contacto,         nro_sol, cod_personal, periodo,
      cod_gestion,          cod_tipo_gestion,      cod_motivo,
      fec_hora_gestion,
      cod_sucursal,         comentario_gestion,  fec_hora_prox_gestion,
      cod_tipo_mercaderia,  nro_item_coordenada, cod_punto_venta,
      nro_x_crm
    ) VALUES (
      p_nro_gestion,        p_nro_item_bandeja,    p_cod_cliente,
      p_nro_contacto,       p_nro_sol, p_cod_personal, p_periodo,
      p_cod_gestion,        p_cod_tipo_gestion,    l_cod_motivo,
      l_sysdate,
      l_cod_sucursal,       p_comentario_gestion, p_fec_hora_prox_gestion,
      p_cod_tipo_mercaderia, 0,                   p_cod_punto_venta,
      p_nro_x
    );
    EXCEPTION 
      WHEN OTHERS THEN 
        ROLLBACK;
  END;
  p_cod_personal := l_cod_personal_x;
  IF p_cod_gestion IN ('VTACONTA','VTACREDI','VTACOMPL') THEN
      p_cod_personal := l_w_cod_personal;
  END IF;
  /* actualiza bandeja */
  /*Si es una gestion del tipo de PUNTOSALEX le vamos a cambiar el estado a SINGESTION
  **para que el vendedor TSV entienda que todavia no se le gestiono a su cliente*/
  IF p_cod_origen_gestion = 'PUNTOSALEX' AND p_cod_identificador = 'APP-RECH'
  AND p_cod_gestion = 'INTESG' THEN
      l_cod_estado_gestion := 'FINGESTION';
  END IF;
  IF p_cod_cliente != 0 AND p_cod_cliente != l_w_cod_cliente THEN
      l_upd_gestiones := 1;
  ELSE
      p_cod_cliente := l_w_cod_cliente;
  END IF;                                                                                                       
  IF p_nro_sol != 0 AND p_nro_sol != l_w_nro_sol THEN     
      l_upd_gestiones := 1;
  ELSE
      p_nro_sol := l_w_nro_sol;
  END IF;                                              
  IF p_nro_contacto != 0 AND l_w_nro_contacto != p_nro_contacto
  AND l_w_nro_contacto != 0 THEN
      p_nro_contacto := l_w_nro_contacto;
  END IF;
  DECLARE
    l_sysdate DATE := SYSDATE;
  BEGIN
    UPDATE crm_bandeja
    SET cod_estado_gestion    = l_cod_estado_gestion,
        cod_origen_gestion    = p_cod_origen_gestion,
        cod_identificador     = cod_identificador,
        nro_x                 = nro_x,
        fec_hora_prox_gestion = fec_hora_prox_gestion,
        ult_nro_gestion       = p_nro_gestion,
        usr_ult_act           = l_usuario,
        fec_ult_act           = l_sysdate,
        nro_sol               = nro_sol,
        cod_cliente           = cod_cliente,
        nro_contacto          = nro_contacto
    WHERE periodo = p_periodo
    AND cod_personal = p_cod_personal
    AND nro_item_bandeja = p_nro_item_bandeja;
    IF sql%rowcount <= 0 THEN
      Raise_Application_Error(
        -20999,
        'No existe bandeja de cod.pers: '
        ||p_cod_personal||', p_periodo: '||p_periodo
        ||', item: '||p_nro_item_bandeja
      );
    END IF;
   EXCEPTION 
     WHEN OTHERS THEN 
       ROLLBACK;
  END;
  IF l_upd_gestiones = 1 THEN
    UPDATE crm_cliente_gestiones
    SET cod_cliente = p_cod_cliente,
        nro_sol = p_nro_sol
    WHERE periodo = p_periodo
    AND cod_personal = p_cod_personal
    AND nro_item_bandeja = p_nro_item_bandeja;
  END IF;
  
  COMMIT;
EXCEPTION
  WHEN OTHERS THEN
    ROLLBACK;
    pr_capturar_error;
    RAISE;
END;
/
----------------------------------------------------
create or replace PROCEDURE pr_crm_max_nro_gestion(
  p_nro_gestion   IN OUT INTEGER,
  p_accion        INTEGER,
  p_cod_resultado IN OUT INTEGER
) IS
BEGIN
  IF p_accion = 1 THEN
    p_nro_gestion := fn_seq_nextval('crm_nro_gestion');
  ELSIF p_accion = 2 THEN
    p_nro_gestion := fn_seq_currval('crm_nro_gestion');
  END IF;
  p_cod_resultado := 100;
END;
/
--------------------------------
create or replace PROCEDURE pr_inserta_bandeja_crm(
  p_cod_cliente             IN OUT INTEGER,
  p_nro_contacto            IN OUT INTEGER,
  p_nro_sol                 IN OUT INTEGER,
  p_cod_personal            IN OUT VARCHAR2,
  p_cod_origen_gestion      IN OUT VARCHAR2,
  p_cod_identificador       IN OUT VARCHAR2,
  p_nro_x                   IN OUT INTEGER,
  p_cod_estado_gestion      IN OUT VARCHAR2,
  p_ult_nro_gestion         IN OUT INTEGER,
  p_fec_hora_inicio_gestion IN OUT DATE,
  p_fec_hora_prox_gestion   IN OUT DATE,
  p_fec_agenda              IN OUT DATE,
  p_login                   IN OUT VARCHAR2,
  p_cod_resultado           IN OUT INTEGER,
  p_resultado               IN OUT VARCHAR2,
  p_ingresa                 IN OUT VARCHAR2,
  p_nro_item_bandeja        IN OUT INTEGER,
  p_periodo                 IN OUT DATE,
  p_desde_ingrid            INTEGER
) IS
  l_hora_ini           DATE;
  l_hora_fin           DATE;
  l_motivo             VARCHAR2(100) := ' ';
  l_usuario            VARCHAR2(8);
  l_w_nro_item_bandeja INTEGER;
  l_cod_tipo_vendedor  VARCHAR2(8);
BEGIN
  IF p_periodo = '' THEN
    BEGIN
    SELECT trunc(fecha_virtual,'mm')
    INTO p_periodo
    FROM ingrid_control
    WHERE dummy_key = 1;
    EXCEPTION 
      WHEN NO_DATA_FOUND THEN 
        ROLLBACK;
      WHEN OTHERS THEN 
        ROLLBACK;
     END;
  END IF;
  IF (p_cod_origen_gestion != 'SOLICITUD' AND p_cod_identificador != 'CREDITO')
  OR (p_cod_origen_gestion != 'SALON'     AND p_cod_identificador != 'CONTADO') THEN
    IF p_login != '' THEN
      l_usuario := p_login;
      BEGIN
        SELECT cod_personal
        INTO p_cod_personal
        FROM ingrid_control_usuario
        WHERE login = p_login;
      EXCEPTION
        WHEN No_Data_Found THEN
          p_cod_resultado := 101;
          p_resultado := ' No se encontro cod_personal para login: ' || p_login;
          ROLLBACK;
          RETURN;
        WHEN OTHERS THEN 
          ROLLBACK;
      END;
    ELSE
      BEGIN
      SELECT nvl(login,fn_user)
      INTO l_usuario
      FROM personal
      WHERE cod_personal = p_cod_personal;
      EXCEPTION 
        WHEN NO_DATA_FOUND THEN 
          ROLLBACK;
        WHEN OTHERS THEN 
          ROLLBACK;
      END;
    END IF;
    IF p_desde_ingrid = 1 THEN
        l_usuario := fn_user;
    END IF;
  END IF;
  p_ingresa := 'S';
  IF p_cod_cliente != 0 THEN
    BEGIN
      SELECT NVL(a.nro_item_bandeja,0)
      INTO l_w_nro_item_bandeja
      FROM crm_bandeja a
      WHERE a.periodo = p_periodo
      AND a.cod_personal = p_cod_personal
      AND a.cod_cliente = p_cod_cliente
      AND a.cod_estado_gestion NOT IN ('FINGESTION ','FACTURADO')
      ORDER BY fec_hora_asignado DESC;
      p_ingresa := 'N';
    EXCEPTION
      WHEN No_Data_Found THEN
        p_ingresa := 'S';
        ROLLBACK;
      WHEN OTHERS THEN 
        ROLLBACK;
    END;
  END IF;
  IF p_nro_sol != 0 AND p_ingresa = 'S' THEN
    BEGIN
      SELECT NVL(a.nro_item_bandeja,0)
      INTO l_w_nro_item_bandeja
      FROM crm_bandeja a
      WHERE a.periodo      = p_periodo
      AND a.cod_personal = p_cod_personal
      AND a.nro_sol = p_nro_sol
      AND a.cod_estado_gestion NOT IN ('FINGESTION ','FACTURADO')
      ORDER BY fec_hora_asignado DESC;
      p_ingresa := 'N';
    EXCEPTION
      WHEN No_Data_Found THEN
        p_ingresa := 'S';
        ROLLBACK;
      WHEN OTHERS THEN 
        ROLLBACK;
    END;
  END IF;
  IF p_nro_contacto != 0 AND p_ingresa = 'S' THEN
    BEGIN
      SELECT NVL(a.nro_item_bandeja,0)
      INTO l_w_nro_item_bandeja
      FROM crm_bandeja a
      WHERE a.periodo      = p_periodo
      AND a.cod_personal = p_cod_personal
      AND a.nro_contacto = p_nro_contacto
      AND a.cod_estado_gestion NOT IN ('FINGESTION ','FACTURADO')
      ORDER BY fec_hora_asignado DESC;
      p_ingresa := 'N';
    EXCEPTION
      WHEN No_Data_Found THEN
        p_ingresa := 'S';
        ROLLBACK;
      WHEN OTHERS THEN 
        ROLLBACK;
    END;
  END IF;
  IF p_cod_cliente = 0 AND p_nro_sol = 0 AND p_nro_contacto = 0 THEN
    p_ingresa := 'S';
  END IF;
  IF p_ingresa = 'S' THEN
    BEGIN
    SELECT NVL(MAX(nro_item_bandeja),0) + 1
    INTO p_nro_item_bandeja
    FROM crm_bandeja
    WHERE periodo = p_periodo
    AND cod_personal = p_cod_personal;
    EXCEPTION 
      WHEN NO_DATA_FOUND THEN 
        ROLLBACK;
      WHEN OTHERS THEN 
        ROLLBACK;
     END;
    /* vrojas 01.02.2022 */
    BEGIN
      SELECT NVL(cod_tipo_vendedor,'--')
      INTO l_cod_tipo_vendedor
      FROM vendedores
      WHERE cod_personal = p_cod_personal;
    EXCEPTION
      WHEN No_Data_Found THEN
        l_cod_tipo_vendedor := '--';
        ROLLBACK;
      WHEN OTHERS THEN 
        ROLLBACK;
    END;
    IF l_cod_tipo_vendedor = 'VENINDEP' THEN
        p_cod_origen_gestion := 'VENINDEP';
    END IF;
    /* fin vrojas */
    DECLARE
      l_sysdate DATE := SYSDATE;
    BEGIN
      INSERT INTO crm_bandeja(
        periodo,                   cod_personal,              nro_item_bandeja,
        cod_cliente,               nro_contacto, nro_sol,     cod_estado_gestion,
        cod_origen_gestion,        cod_identificador,         nro_x,
        asignado_por,              fec_hora_asignado,
        fec_hora_inicio_gestion,   fec_hora_prox_gestion,     fec_agenda,
        ult_nro_gestion,           fec_ult_act,               usr_ult_act
      ) VALUES (
        p_periodo,                 p_cod_personal,            p_nro_item_bandeja,
        p_cod_cliente,             p_nro_contacto, p_nro_sol, p_cod_estado_gestion,
        p_cod_origen_gestion,      p_cod_identificador,       p_nro_x,
        l_usuario,                 l_sysdate,
        p_fec_hora_inicio_gestion, p_fec_hora_prox_gestion,   p_fec_agenda,
        p_ult_nro_gestion,         l_sysdate,                 l_usuario
      );
      EXCEPTION 
     WHEN OTHERS THEN 
       ROLLBACK;
    END;
    DECLARE
      l_sysdate DATE := SYSDATE;
    BEGIN
      INSERT INTO crm_bandeja_ingreso (
        periodo,              cod_personal,         nro_item_bandeja,
        cod_cliente,          nro_contacto,         nro_sol,    cod_estado_gestion,
        cod_origen_gestion,   cod_identificador,    nro_x,
        ingreso,              motivo,
        fec_ult_act,          usr_ult_act
      ) VALUES (
        p_periodo,            p_cod_personal,       p_nro_item_bandeja,
        p_cod_cliente,        p_nro_contacto,       p_nro_sol,  p_cod_estado_gestion,
        p_cod_origen_gestion, p_cod_identificador,  p_nro_x,
        p_ingresa,            l_motivo,
        l_sysdate,            l_usuario
      );
    EXCEPTION 
     WHEN OTHERS THEN 
       ROLLBACK;
    END;
  END IF;
  p_cod_resultado := 100; /* OK EN LA EJECUCION DEL PROGRAMA */
  p_resultado := l_motivo;
  
 COMMIT;
EXCEPTION
  WHEN OTHERS THEN
    ROLLBACK;
    pr_capturar_error('p_periodo:'||p_periodo||chr(10)||
'p_cod_personal:'||p_cod_personal||chr(10)||
'p_nro_item_bandeja:'||p_nro_item_bandeja||chr(10)||
'p_cod_cliente:'||p_cod_cliente||chr(10)||
'p_nro_contacto:'||p_nro_contacto||chr(10)||
'p_nro_sol:'||p_nro_sol||chr(10)||
'p_cod_estado_gestion:'||p_cod_estado_gestion||chr(10)||
'p_cod_origen_gestion:'||p_cod_origen_gestion||chr(10)||
'p_cod_identificador:'||p_cod_identificador||chr(10)||
'p_nro_x:'||p_nro_x||chr(10)||
'p_ingresa:'||p_ingresa||chr(10)||
'l_motivo:'||l_motivo||chr(10)|| 
'l_usuario:'||l_usuario);
    RAISE;
END;
/
-----------------------------------------------
create or replace FUNCTION fn_seq_currval(
  p_sequence VARCHAR2
) RETURN INTEGER IS
  l_query VARCHAR2(4000) := 'SELECT '||p_sequence||'.currval;';
  l_cursor BINARY_INTEGER;
  l_nr NUMBER := 0;
  l_value INTEGER;
BEGIN
  l_cursor := DBMS_HS_PASSTHROUGH.OPEN_CURSOR@WRK1;
  DBMS_HS_PASSTHROUGH.PARSE@WRK1(l_cursor, l_query);
  LOOP
    l_nr := DBMS_HS_PASSTHROUGH.FETCH_ROW@WRK1(l_cursor, FALSE);
    EXIT WHEN l_nr = 0;
    DBMS_HS_PASSTHROUGH.GET_VALUE@WRK1(l_cursor, 1, l_value);
  END LOOP;
  DBMS_HS_PASSTHROUGH.CLOSE_CURSOR@WRK1(l_cursor);
  RETURN l_value;
END;
/
-------------------------------------------------------------
create or replace PACKAGE pkg_calprec IS
	PROCEDURE CALL(p_cod_articulo          IN articulos_prec_vta.cod_articulo%TYPE,
								 p_cod_familia           IN articulos_prec_vta.cod_articulo%TYPE DEFAULT '',
								 p_porc_iva              IN devoluciones_art.porc_iva%TYPE,
								 p_porc_aplic_iva        IN presups_vta_art.porc_aplic_iva%TYPE,
								 p_coef_rentab           IN NUMBER DEFAULT 0,
								 p_coef_rentab_empresa   IN coef_rent.coeficiente%TYPE DEFAULT 0,
								 p_coef_rentab_flia      IN coef_rent_flia.coeficiente%TYPE DEFAULT 0,
								 p_coef_rentab_art       IN coef_rent_art.coeficiente%TYPE DEFAULT 0,
								 p_iva_exento            IN NUMBER,
								 p_vehiculo              IN articulos.vehiculo%TYPE,
								 p_cod_lista_prec_vta    IN articulos_prec_vta_veh.cod_lista_prec_vta%TYPE,
								 p_cod_sucursal          IN presups_vta.cod_sucursal%TYPE DEFAULT 0,
								 p_fec_vigencia          IN DATE DEFAULT to_date('01/01/2000', 'dd/mm/yyyy'),
								 p_fec_inicio_vigencia   IN DATE DEFAULT to_date('01/01/2000', 'dd/mm/yyyy'),
								 p_fec_fin_vigencia      IN DATE DEFAULT to_date('01/01/2000', 'dd/mm/yyyy'),
								 p_nro_cuota             IN articulos_prec_vta_veh_cuo.nro_cuota%TYPE DEFAULT 0,
								 p_selec_precio          IN NUMBER,
								 p_selec_coef            IN NUMBER DEFAULT 0,
								 p_oferta                IN articulos_prec_vta.oferta%TYPE DEFAULT 0,
								 p_costo_unit            IN OUT articulos_suc.costo_unit%TYPE,
								 p_costo_unit_mr         IN OUT articulos_suc.costo_unit_mr%TYPE,
								 p_cant_pedida           IN articulos_suc.cant_pedida%TYPE DEFAULT 0,
								 p_cotiz_venta           IN OUT cotizaciones_monedas.cotiz_venta%TYPE,
								 p_coef_prec_vta         IN OUT coef_calc_prec_vta.coeficiente%TYPE,
								 p_nro_orden             IN articulos_prec_vta.nro_orden%TYPE DEFAULT 0,
								 p_tipo_interes_precio   IN NUMBER DEFAULT 0,
								 p_precio_vta_mr_sin_iva IN OUT NUMBER,
								 p_precio_vta_mr_con_iva IN OUT NUMBER,
								 p_precio_vta_ml_sin_iva IN OUT NUMBER,
								 p_precio_vta_ml_con_iva IN OUT NUMBER,
								 p_coef_mr               IN OUT NUMBER,
								 p_coef_ml               IN OUT NUMBER,
								 p_coef_mr_real          IN OUT NUMBER,
								 p_cod_moneda_ref        IN cotizaciones_monedas.cod_moneda%TYPE DEFAULT '',
								 p_cant_minima           IN articulos_prec_vta.cant_minima%TYPE DEFAULT 0,
								 p_no_hace_commit        IN NUMBER DEFAULT 0);
  PROCEDURE CALL(p_cod_articulo          IN articulos_prec_vta.cod_articulo%TYPE,
								 p_cod_familia           IN articulos_prec_vta.cod_articulo%TYPE DEFAULT '',
								 p_porc_iva              IN devoluciones_art.porc_iva%TYPE,
								 p_porc_aplic_iva        IN presups_vta_art.porc_aplic_iva%TYPE,
								 p_coef_rentab           IN NUMBER DEFAULT 0,
								 p_coef_rentab_empresa   IN coef_rent.coeficiente%TYPE DEFAULT 0,
								 p_coef_rentab_flia      IN coef_rent_flia.coeficiente%TYPE DEFAULT 0,
								 p_coef_rentab_art       IN coef_rent_art.coeficiente%TYPE DEFAULT 0,
								 p_iva_exento            IN NUMBER,
								 p_vehiculo              IN articulos.vehiculo%TYPE,
								 p_cod_lista_prec_vta    IN articulos_prec_vta_veh.cod_lista_prec_vta%TYPE,
								 p_cod_sucursal          IN presups_vta.cod_sucursal%TYPE DEFAULT 0,
								 p_fec_vigencia          IN DATE DEFAULT to_date('01/01/2000', 'dd/mm/yyyy'),
								 p_fec_inicio_vigencia   IN DATE DEFAULT to_date('01/01/2000', 'dd/mm/yyyy'),
								 p_fec_fin_vigencia      IN DATE DEFAULT to_date('01/01/2000', 'dd/mm/yyyy'),
								 p_nro_cuota             IN articulos_prec_vta_veh_cuo.nro_cuota%TYPE DEFAULT 0,
								 p_selec_precio          IN NUMBER,
								 p_selec_coef            IN NUMBER DEFAULT 0,
								 p_oferta                IN articulos_prec_vta.oferta%TYPE DEFAULT 0,
								 p_costo_unit            IN OUT articulos_suc.costo_unit%TYPE,
								 p_costo_unit_mr         IN OUT articulos_suc.costo_unit_mr%TYPE,
								 p_cant_pedida           IN articulos_suc.cant_pedida%TYPE DEFAULT 0,
								 p_cotiz_venta           IN OUT cotizaciones_monedas.cotiz_venta%TYPE,
								 p_coef_prec_vta         IN OUT coef_calc_prec_vta.coeficiente%TYPE,
								 p_nro_orden             IN articulos_prec_vta.nro_orden%TYPE DEFAULT 0,
								 p_tipo_interes_precio   IN NUMBER DEFAULT 0,
								 p_precio_vta_mr_sin_iva IN OUT NUMBER,
								 p_cod_moneda_ref        IN cotizaciones_monedas.cod_moneda%TYPE DEFAULT '',
								 p_cant_minima           IN articulos_prec_vta.cant_minima%TYPE DEFAULT 0,
								 p_no_hace_commit        IN NUMBER DEFAULT 0);
END pkg_calprec;
/
create or replace PACKAGE BODY pkg_calprec IS
  PROCEDURE calprec(p_cod_articulo          IN OUT articulos_prec_vta.cod_articulo%TYPE,
										p_cod_familia           IN OUT articulos_prec_vta.cod_articulo%TYPE,
										p_porc_iva              IN OUT devoluciones_art.porc_iva%TYPE,
										p_porc_aplic_iva        IN OUT presups_vta_art.porc_aplic_iva%TYPE,
										p_coef_rentab           IN OUT NUMBER,
										p_coef_rentab_empresa   IN OUT coef_rent.coeficiente%TYPE,
										p_coef_rentab_flia      IN OUT coef_rent_flia.coeficiente%TYPE,
										p_coef_rentab_art       IN OUT coef_rent_art.coeficiente%TYPE,
										p_iva_exento            IN OUT NUMBER,
										p_vehiculo              IN OUT articulos.vehiculo%TYPE,
										p_cod_lista_prec_vta    IN OUT articulos_prec_vta_veh.cod_lista_prec_vta%TYPE,
										p_cod_sucursal          IN OUT presups_vta.cod_sucursal%TYPE,
										p_fec_vigencia          IN OUT DATE,
										p_fec_inicio_vigencia   IN OUT DATE,
										p_fec_fin_vigencia      IN OUT DATE,
										p_nro_cuota             IN OUT articulos_prec_vta_veh_cuo.nro_cuota%TYPE,
										p_selec_precio          IN OUT NUMBER,
										p_selec_coef            IN OUT NUMBER,
										p_oferta                IN OUT articulos_prec_vta.oferta%TYPE,
										p_costo_unit            IN OUT articulos_suc.costo_unit%TYPE,
										p_costo_unit_mr         IN OUT articulos_suc.costo_unit_mr%TYPE,
										p_cant_pedida           IN OUT articulos_suc.cant_pedida%TYPE,
										p_cotiz_venta           IN OUT cotizaciones_monedas.cotiz_venta%TYPE,
										p_coef_prec_vta         IN OUT coef_calc_prec_vta.coeficiente%TYPE,
										p_nro_orden             IN OUT articulos_prec_vta.nro_orden%TYPE,
										p_tipo_interes_precio   IN OUT NUMBER,
										p_precio_vta_mr_sin_iva IN OUT NUMBER,
										p_precio_vta_mr_con_iva IN OUT NUMBER,
										p_precio_vta_ml_sin_iva IN OUT NUMBER,
										p_precio_vta_ml_con_iva IN OUT NUMBER,
										p_coef_mr               IN OUT NUMBER,
										p_coef_ml               IN OUT NUMBER,
										p_coef_mr_real          IN OUT NUMBER,
										p_cod_moneda_ref        IN OUT cotizaciones_monedas.cod_moneda%TYPE,
										p_cant_minima           IN OUT articulos_prec_vta.cant_minima%TYPE,
										p_no_hace_commit        IN OUT NUMBER)
  IS
		/***Se declara una variable para los parametros donde los datos son manipulados***/
		v_cant_minima           articulos_prec_vta.cant_minima%TYPE := p_cant_minima;
		v_coef_prec_vta         coef_calc_prec_vta.coeficiente%TYPE := p_coef_prec_vta;
		v_nro_orden             articulos_prec_vta.nro_orden%TYPE := p_nro_orden;
		v_oferta                articulos_prec_vta.oferta%TYPE := p_oferta;
		v_fec_vigencia          DATE := p_fec_vigencia;
		v_fec_inicio_vigencia   DATE := p_fec_inicio_vigencia;
		v_fec_fin_vigencia      DATE := p_fec_fin_vigencia;
		v_precio_vta_mr_sin_iva NUMBER(10, 3) := p_precio_vta_mr_sin_iva;
		v_precio_vta_mr_con_iva NUMBER(10, 3) := p_precio_vta_mr_con_iva;
		v_precio_vta_ml_sin_iva NUMBER := p_precio_vta_ml_sin_iva;
		v_precio_vta_ml_con_iva NUMBER := p_precio_vta_ml_con_iva;
		v_coef_mr               NUMBER(10, 3) := p_coef_mr;
		v_coef_ml               NUMBER(10, 3) := p_coef_ml;
		v_coef_mr_real          NUMBER(10, 3) := p_coef_mr_real;
		v_coef_rentab_art       coef_rent_art.coeficiente%TYPE := p_coef_rentab_art;
		v_coef_rentab           NUMBER(10, 3) := p_coef_rentab;
		v_coef_rentab_flia      coef_rent_flia.coeficiente%TYPE := p_coef_rentab_flia;
		v_coef_rentab_empresa   coef_rent.coeficiente%TYPE := p_coef_rentab_empresa;
		v_costo_unit            articulos_suc.costo_unit%TYPE := p_costo_unit;
		v_cant_pedida           articulos_suc.cant_pedida%TYPE := p_cant_pedida;
		v_cotiz_venta           cotizaciones_monedas.cotiz_venta%TYPE := p_cotiz_venta;
		/***fin***/
		v_texto               VARCHAR(100);
		v_h_fiv               coef_calc_prec_vta.fec_inicio_vigencia%TYPE;
		v_fec_cotizacion      DATE;
		v_precio_vta          NUMBER;
		v_h_pv                NUMBER;
		v_h_pv_exen           NUMBER;
		v_h_pv_grav           NUMBER;
		v_h_pvd               NUMBER;
		v_retorno             NUMBER;
		v_calcula_prec        NUMBER;
		v_cod_tipo_mercaderia familias.cod_tipo_mercaderia%TYPE;
		v_l_orden             VARCHAR(40);
		v_lcant_minima        NUMBER;
		g_rows                NUMBER;
	BEGIN
		--DBMS_OUTPUT.PUT_LINE('p_cod_articulo: ' || p_cod_articulo);
		--DBMS_OUTPUT.PUT_LINE('p_porc_iva 1: ' || p_porc_iva);
		--DBMS_OUTPUT.PUT_LINE('p_porc_aplic_iva 1: ' || p_porc_aplic_iva);
		--DBMS_OUTPUT.PUT_LINE('p_iva_exento 1: ' || p_iva_exento);
		--DBMS_OUTPUT.PUT_LINE('p_vehiculo 1: ' || p_vehiculo);
		--DBMS_OUTPUT.PUT_LINE('p_cod_lista_prec_vta 1: ' || p_cod_lista_prec_vta);
		--DBMS_OUTPUT.PUT_LINE('v_fec_vigencia 1: ' || v_fec_vigencia);
		--DBMS_OUTPUT.PUT_LINE('p_selec_precio 1: ' || p_selec_precio);
		--DBMS_OUTPUT.PUT_LINE('v_precio_vta_ml_sin_iva 1: ' || v_precio_vta_ml_sin_iva);
		v_calcula_prec := 0; /* DEBE SER IGUAL A 2 PARA HACER LOS CALCULOS */
		IF v_cant_minima = 0 THEN
			v_cant_minima := 1;
		END IF;
		BEGIN
			SELECT coeficiente,
						 fec_inicio_vigencia
			INTO v_coef_prec_vta,
					 v_h_fiv
			FROM coef_calc_prec_vta
			WHERE cod_lista_prec_vta = p_cod_lista_prec_vta
			AND fec_inicio_vigencia <= v_fec_vigencia
			ORDER BY fec_inicio_vigencia DESC
			FETCH FIRST 1 rows ONLY;
			--AND ROWNUM = 1;
			g_rows := 1; --SQL%ROWCOUNT;
		EXCEPTION
			WHEN No_Data_Found THEN
				g_rows := 0;
			WHEN Others THEN
				raise_application_error(-20999, 'Error al seleccionar coeficiente.');
		END;
		IF g_rows <= 0 THEN
			v_retorno       := 1; /* SIN COEFICIENTE VIGENTE */
			v_coef_prec_vta := 1;
		ELSE
			v_calcula_prec := v_calcula_prec + 1; /* CON COEFICIENTE VIGENTE */
			IF p_tipo_interes_precio = 0 AND p_selec_precio = 1 THEN
				BEGIN
					SELECT b.cod_tipo_mercaderia
					INTO v_cod_tipo_mercaderia
					FROM articulos a,
							 familias  b
					WHERE a.cod_articulo = p_cod_articulo
					AND b.cod_tipo_mercaderia = 'REPU'
					AND a.cod_familia = b.cod_familia;
					g_rows := 1; --SQL%ROWCOUNT;
				EXCEPTION
					WHEN No_Data_Found THEN
						g_rows := 0;
				END;
				IF g_rows > 0 THEN
					BEGIN
						SELECT precio_vta,
									 nro_orden,
									 oferta,
									 fec_inicio_vigencia,
									 fec_fin_vigencia,
									 cant_minima
						INTO v_precio_vta,
								 v_nro_orden,
								 v_oferta,
								 v_fec_inicio_vigencia,
								 v_fec_fin_vigencia,
								 v_lcant_minima
						FROM articulos_prec_vta
						WHERE cod_articulo = p_cod_articulo
						AND cod_lista_prec_vta = p_cod_lista_prec_vta
						AND v_fec_vigencia >= fec_inicio_vigencia
						AND v_fec_vigencia <= fec_fin_vigencia
						AND orden_aprobada = 1
						AND cant_minima <= v_cant_minima
						ORDER BY cant_minima DESC,
										 nro_orden   DESC
						FETCH FIRST 1 rows ONLY;
						g_rows := 1; --SQL%ROWCOUNT;
					END;
				ELSE
					BEGIN
						SELECT precio_vta,
									 nro_orden,
									 oferta,
									 fec_inicio_vigencia,
									 fec_fin_vigencia
						INTO v_precio_vta,
								 v_nro_orden,
								 v_oferta,
								 v_fec_inicio_vigencia,
								 v_fec_fin_vigencia
						FROM articulos_prec_vta
						WHERE cod_articulo = p_cod_articulo
						AND cod_lista_prec_vta = p_cod_lista_prec_vta
						AND v_fec_vigencia >= fec_inicio_vigencia
						AND v_fec_vigencia <= fec_fin_vigencia
						AND orden_aprobada = 1
						ORDER BY nro_orden DESC
						FETCH FIRST 1 rows ONLY;
						g_rows := 1; --SQL%ROWCOUNT;
					END;
				END IF;
				IF g_rows <= 0 THEN
					/* SIN PRECIO VIGENTE */
					v_retorno    := 2;
					v_precio_vta := 0;
				ELSE
					/* CON PRECIO VIGENTE */
					v_calcula_prec := v_calcula_prec + 1;
				END IF;
			ELSIF p_tipo_interes_precio = 1 AND p_selec_precio = 1 THEN
				BEGIN
					SELECT precio_vta,
								 nro_orden,
								 oferta,
								 fec_inicio_vigencia,
								 fec_fin_vigencia
					INTO v_precio_vta,
							 v_nro_orden,
							 v_oferta,
							 v_fec_inicio_vigencia,
							 v_fec_fin_vigencia
					FROM articulos_prec_vta_veh
					WHERE cod_articulo = p_cod_articulo
					AND cod_lista_prec_vta = p_cod_lista_prec_vta
					AND v_fec_vigencia >= fec_inicio_vigencia
					AND v_fec_vigencia <= fec_fin_vigencia
					AND orden_aprobada = 1
					ORDER BY nro_orden DESC;
					g_rows := 1; --SQL%ROWCOUNT;
				EXCEPTION
					WHEN No_Data_Found THEN
						g_rows := 0;
				END;
				IF g_rows <= 0 THEN
					/* SIN PRECIO VIGENTE */
					v_retorno    := 2;
					v_precio_vta := 0;
				ELSIF g_rows > 0 AND p_nro_cuota = 0 THEN
					/* CON PRECIO VIGENTE */
					v_calcula_prec := v_calcula_prec + 1;
				ELSIF g_rows > 0 AND p_nro_cuota > 0 THEN
					/* OPERACION EN CUOTAS */
					BEGIN
						SELECT precio_vta,
									 oferta
						INTO v_precio_vta,
								 v_oferta
						FROM articulos_prec_vta_veh_cuo
						WHERE cod_articulo = p_cod_articulo
						AND nro_cuota = p_nro_cuota
						AND nro_orden = v_nro_orden;
						g_rows := 1; --SQL%ROWCOUNT;
					EXCEPTION
						WHEN No_Data_Found THEN
							g_rows := 0;
					END;
					IF g_rows <= 0 THEN
						v_retorno    := 3; /* LA CUOTA NO TIENE PRECIO */
						v_precio_vta := 0;
					ELSIF g_rows > 0 THEN
						/* CON PRECIO VIGENTE */
						v_calcula_prec := v_calcula_prec + 1;
					END IF;
				END IF;
			ELSIF p_selec_precio = 0 AND v_precio_vta_mr_sin_iva > 0 THEN
				/* EL PRECIO YA VIENE COMO PARAMETRO */
				v_calcula_prec := v_calcula_prec + 1;
				v_precio_vta   := v_precio_vta_mr_sin_iva;
			END IF;
		END IF;
		IF v_calcula_prec = 2 THEN
			/* QUIERE DECIR QUE TIENE COEF.VIGENTE Y QUE SELECCIONO EL
      PRECIO OK O VIENE COMO PARAMETRO EL PRECIO EN DOLARES*/
			/* Precio en dolares */
			v_precio_vta_mr_sin_iva := v_precio_vta;
			/* Precio en dolares con iva */
			v_h_pv := v_precio_vta;
			/* solo se aplica el iva sobre h_pv_grav */
			IF p_porc_aplic_iva < 100 THEN
				v_h_pv_grav := v_h_pv * (p_porc_aplic_iva / 100);
				v_h_pv_exen := v_h_pv - v_h_pv_grav;
				v_h_pv      := v_h_pv_grav;
			ELSE
				v_h_pv_exen := 0;
			END IF;
			v_h_pvd                 := v_h_pv * (1 + (p_porc_iva / 100) * (1 - p_iva_exento));
			v_h_pvd                 := v_h_pvd + v_h_pv_exen;
			v_precio_vta_mr_con_iva := v_h_pvd;
			/* Calculo de precio en gs */
			v_h_pv := v_precio_vta * v_coef_prec_vta;
			/* solo se aplica el iva sobre h_pv_grav */
			IF p_porc_aplic_iva < 100 THEN
				v_h_pv_grav := v_h_pv * (p_porc_aplic_iva / 100);
				v_h_pv_exen := v_h_pv - v_h_pv_grav;
				v_h_pv      := v_h_pv_grav;
			ELSE
				v_h_pv_exen := 0;
			END IF;
			v_h_pvd := v_h_pv * (1 + (p_porc_iva / 100) * (1 - p_iva_exento));
			v_h_pvd := v_h_pvd + v_h_pv_exen; /* NUEVO */
			--CALLPROC redondea (precio = byref(h_pvd));     ****** LLAMA AL PROCEDIMIENTO PR_REDONDEA *****
			BEGIN
				pr_redondea(p_precio => v_h_pvd);
			END;
			v_precio_vta_ml_con_iva := v_h_pvd;
			p_precio_vta_ml_con_iva := v_h_pvd;
			v_precio_vta_ml_sin_iva := v_precio_vta_ml_con_iva - v_h_pv_exen;
			v_precio_vta_ml_sin_iva := trunc(v_precio_vta_ml_sin_iva / (1 + (p_porc_iva / 100) * (1 - p_iva_exento)));
			v_precio_vta_ml_sin_iva := v_precio_vta_ml_sin_iva + v_h_pv_exen;
		ELSE
			v_precio_vta_mr_sin_iva := 0;
			v_precio_vta_mr_con_iva := 0;
			v_precio_vta_ml_sin_iva := 0;
			v_precio_vta_ml_con_iva := 0;
		END IF;
		/* FIN CALCULO PRECIO */
		/* CALCULO DE COEFICIENTES DE RENTABILIDAD */
		v_coef_ml      := 0;
		v_coef_mr      := 0;
		v_coef_mr_real := 0;
		IF p_selec_coef = 1 AND v_calcula_prec = 2 THEN
			BEGIN
				SELECT coeficiente,
							 fec_inicio_vigencia
				INTO v_coef_rentab_art,
						 v_fec_inicio_vigencia
				FROM coef_rent_art
				WHERE fec_inicio_vigencia <= v_fec_vigencia
				AND cod_articulo = p_cod_articulo
				ORDER BY fec_inicio_vigencia DESC;
				g_rows := 1; --SQL%ROWCOUNT;
			EXCEPTION
				WHEN No_Data_Found THEN
					g_rows := 0;
			END;
			IF g_rows > 0 THEN
				v_coef_rentab := v_coef_rentab_art;
			ELSE
				BEGIN
					SELECT coeficiente,
								 fec_inicio_vigencia
					INTO v_coef_rentab_flia,
							 v_fec_inicio_vigencia
					FROM coef_rent_flia a,
							 articulos      b
					WHERE a.fec_inicio_vigencia <= v_fec_vigencia
					AND a.cod_familia = b.cod_familia
					AND b.cod_articulo = p_cod_articulo
					ORDER BY fec_inicio_vigencia DESC;
					g_rows := 1; --SQL%ROWCOUNT;
				END;
				IF g_rows > 0 THEN
					v_coef_rentab := v_coef_rentab_flia;
				ELSE
					BEGIN
						SELECT coeficiente,
									 fec_inicio_vigencia
						INTO v_coef_rentab_empresa,
								 v_fec_inicio_vigencia
						FROM coef_rent
						WHERE fec_inicio_vigencia <= v_fec_vigencia
						ORDER BY fec_inicio_vigencia DESC;
						g_rows := 1; --SQL%ROWCOUNT;
					EXCEPTION
						WHEN No_Data_Found THEN
							g_rows := 0;
					END;
					IF g_rows > 0 THEN
						v_coef_rentab := p_coef_rentab_empresa;
					END IF;
				END IF;
			END IF;
			BEGIN
				SELECT costo_unit,
							 nvl(costo_unit_mr, 0),
							 cant_pedida
				INTO v_costo_unit,
						 v_costo_unit,
						 v_cant_pedida
				FROM articulos_suc
				WHERE cod_articulo = p_cod_articulo
				AND cod_sucursal = p_cod_sucursal;
				g_rows := 1; --SQL%ROWCOUNT;
			EXCEPTION
				WHEN No_Data_Found THEN
					g_rows := 0;
			END;
			IF g_rows > 0 THEN
				IF p_costo_unit_mr > 0 AND v_costo_unit > 0 THEN
					IF v_precio_vta_ml_sin_iva > 0 THEN
						v_coef_ml := (((trunc(v_precio_vta_ml_sin_iva) * v_coef_rentab) - trunc(v_costo_unit)) /
												 trunc(v_precio_vta_ml_sin_iva) * 100); /*******CONSULTAR float8******/
					ELSE
						v_coef_ml := 0;
					END IF;
					IF v_precio_vta_mr_sin_iva > 0 THEN
						v_coef_mr := (((v_precio_vta_mr_sin_iva * v_coef_rentab) - nvl(p_costo_unit_mr, 0)) /
												 v_precio_vta_mr_sin_iva * 100);
					ELSE
						v_coef_mr := 0;
					END IF;
					/* para coef_mr_real usa cotiz.venta del dia */
					BEGIN
						SELECT nvl(cotiz_venta, 0),
									 fecha_cotizacion
						INTO v_cotiz_venta,
								 v_fec_cotizacion
						FROM cotizaciones_monedas
						WHERE cod_moneda = p_cod_moneda_ref
						AND fecha_cotizacion <= v_fec_vigencia
						ORDER BY fecha_cotizacion DESC;
					END;
					IF v_cotiz_venta > 0 THEN
						IF v_precio_vta_ml_sin_iva > 0 THEN
							v_coef_mr_real := ((((trunc(v_precio_vta_ml_sin_iva) / v_cotiz_venta) * v_coef_rentab) -
																trunc(nvl(p_costo_unit_mr, 0)))
																/*(float8(costo_unit)/cotiz_venta)) */
																/ (trunc(v_precio_vta_ml_sin_iva) / v_cotiz_venta) * 100);
						ELSE
							v_coef_mr_real := 0;
						END IF;
					END IF;
				ELSE
					v_retorno := 4; /* ARTICULOS SIN COSTO */
				END IF;
			ELSE
				v_retorno := 5; /* SIN REGISTRO EN SUCURSAL */
			END IF;
		END IF;
		-- Raise_Application_Error(-20999,'Error captura');
		IF p_no_hace_commit = 0 THEN
			COMMIT;
		END IF;
		-- RETURN v_retorno;
		p_precio_vta_mr_sin_iva := v_precio_vta_mr_sin_iva;
		p_precio_vta_mr_con_iva := v_precio_vta_mr_con_iva;
		p_precio_vta_ml_sin_iva := v_precio_vta_ml_sin_iva;
		p_precio_vta_ml_con_iva := v_precio_vta_ml_con_iva;
		p_coef_mr               := v_coef_mr;
		p_coef_ml               := v_coef_ml;
		p_coef_mr_real          := v_coef_mr_real;
		p_costo_unit            := v_costo_unit;
    COMMIT;
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      pr_capturar_error;
      RAISE;
	END calprec;
	PROCEDURE CALL(p_cod_articulo          IN articulos_prec_vta.cod_articulo%TYPE,
								 p_cod_familia           IN articulos_prec_vta.cod_articulo%TYPE DEFAULT '',
								 p_porc_iva              IN devoluciones_art.porc_iva%TYPE,
								 p_porc_aplic_iva        IN presups_vta_art.porc_aplic_iva%TYPE,
								 p_coef_rentab           IN NUMBER DEFAULT 0,
								 p_coef_rentab_empresa   IN coef_rent.coeficiente%TYPE DEFAULT 0,
								 p_coef_rentab_flia      IN coef_rent_flia.coeficiente%TYPE DEFAULT 0,
								 p_coef_rentab_art       IN coef_rent_art.coeficiente%TYPE DEFAULT 0,
								 p_iva_exento            IN NUMBER,
								 p_vehiculo              IN articulos.vehiculo%TYPE,
								 p_cod_lista_prec_vta    IN articulos_prec_vta_veh.cod_lista_prec_vta%TYPE,
								 p_cod_sucursal          IN presups_vta.cod_sucursal%TYPE DEFAULT 0,
								 p_fec_vigencia          IN DATE DEFAULT to_date('01/01/2000', 'dd/mm/yyyy'),
								 p_fec_inicio_vigencia   IN DATE DEFAULT to_date('01/01/2000', 'dd/mm/yyyy'),
								 p_fec_fin_vigencia      IN DATE DEFAULT to_date('01/01/2000', 'dd/mm/yyyy'),
								 p_nro_cuota             IN articulos_prec_vta_veh_cuo.nro_cuota%TYPE DEFAULT 0,
								 p_selec_precio          IN NUMBER,
								 p_selec_coef            IN NUMBER DEFAULT 0,
								 p_oferta                IN articulos_prec_vta.oferta%TYPE DEFAULT 0,
								 p_costo_unit            IN OUT articulos_suc.costo_unit%TYPE,
								 p_costo_unit_mr         IN OUT articulos_suc.costo_unit_mr%TYPE,
								 p_cant_pedida           IN articulos_suc.cant_pedida%TYPE DEFAULT 0,
								 p_cotiz_venta           IN OUT cotizaciones_monedas.cotiz_venta%TYPE,
								 p_coef_prec_vta         IN OUT coef_calc_prec_vta.coeficiente%TYPE,
								 p_nro_orden             IN articulos_prec_vta.nro_orden%TYPE DEFAULT 0,
								 p_tipo_interes_precio   IN NUMBER DEFAULT 0,
								 p_precio_vta_mr_sin_iva IN OUT NUMBER,
								 p_precio_vta_mr_con_iva IN OUT NUMBER,
								 p_precio_vta_ml_sin_iva IN OUT NUMBER,
								 p_precio_vta_ml_con_iva IN OUT NUMBER,
								 p_coef_mr               IN OUT NUMBER,
								 p_coef_ml               IN OUT NUMBER,
								 p_coef_mr_real          IN OUT NUMBER,
								 p_cod_moneda_ref        IN cotizaciones_monedas.cod_moneda%TYPE DEFAULT '',
								 p_cant_minima           IN articulos_prec_vta.cant_minima%TYPE DEFAULT 0,
								 p_no_hace_commit        IN NUMBER DEFAULT 0)
  IS
		v_cod_articulo          articulos_prec_vta.cod_articulo%TYPE := p_cod_articulo;
		v_cod_familia           articulos_prec_vta.cod_articulo%TYPE := p_cod_familia;
		v_porc_iva              devoluciones_art.porc_iva%TYPE := p_porc_iva;
		v_porc_aplic_iva        presups_vta_art.porc_aplic_iva%TYPE := p_porc_aplic_iva;
		v_coef_rentab           NUMBER := p_coef_rentab;
		v_coef_rentab_empresa   coef_rent.coeficiente%TYPE := p_coef_rentab_empresa;
		v_coef_rentab_flia      coef_rent_flia.coeficiente%TYPE := p_coef_rentab_flia;
		v_coef_rentab_art       coef_rent_art.coeficiente%TYPE := p_coef_rentab_art;
		v_iva_exento            NUMBER := p_iva_exento;
		v_vehiculo              articulos.vehiculo%TYPE := p_vehiculo;
		v_cod_lista_prec_vta    articulos_prec_vta_veh.cod_lista_prec_vta%TYPE := p_cod_lista_prec_vta;
		v_cod_sucursal          presups_vta.cod_sucursal%TYPE := p_cod_sucursal;
		v_fec_vigencia          DATE := p_fec_vigencia;
		v_fec_inicio_vigencia   DATE := p_fec_inicio_vigencia;
		v_fec_fin_vigencia      DATE := p_fec_fin_vigencia;
		v_nro_cuota             articulos_prec_vta_veh_cuo.nro_cuota%TYPE := p_nro_cuota;
		v_selec_precio          NUMBER := p_selec_precio;
		v_selec_coef            NUMBER := p_selec_coef;
		v_oferta                articulos_prec_vta.oferta%TYPE := p_oferta;
		v_costo_unit            articulos_suc.costo_unit%TYPE := p_costo_unit;
		v_costo_unit_mr         articulos_suc.costo_unit_mr%TYPE := p_costo_unit_mr;
		v_cant_pedida           articulos_suc.cant_pedida%TYPE := p_cant_pedida;
		v_cotiz_venta           cotizaciones_monedas.cotiz_venta%TYPE := p_cotiz_venta;
		v_coef_prec_vta         coef_calc_prec_vta.coeficiente%TYPE := p_coef_prec_vta;
		v_nro_orden             articulos_prec_vta.nro_orden%TYPE := p_nro_orden;
		v_tipo_interes_precio   NUMBER := p_tipo_interes_precio;
		v_precio_vta_mr_sin_iva NUMBER := p_precio_vta_mr_sin_iva;
		v_precio_vta_mr_con_iva NUMBER := p_precio_vta_mr_con_iva;
		v_precio_vta_ml_sin_iva NUMBER := p_precio_vta_ml_sin_iva;
		v_precio_vta_ml_con_iva NUMBER := p_precio_vta_ml_con_iva;
		v_coef_mr               NUMBER := p_coef_mr;
		v_coef_ml               NUMBER := p_coef_ml;
		v_coef_mr_real          NUMBER := p_coef_mr_real;
		v_cod_moneda_ref        cotizaciones_monedas.cod_moneda%TYPE := p_cod_moneda_ref;
		v_cant_minima           articulos_prec_vta.cant_minima%TYPE := p_cant_minima;
		v_no_hace_commit        NUMBER := p_no_hace_commit;
	BEGIN
		calprec(p_cod_articulo => v_cod_articulo, p_cod_familia => v_cod_familia, p_porc_iva => v_porc_iva,
						p_porc_aplic_iva => v_porc_aplic_iva, p_coef_rentab => v_coef_rentab,
						p_coef_rentab_empresa => v_coef_rentab_empresa, p_coef_rentab_flia => v_coef_rentab_flia,
						p_coef_rentab_art => v_coef_rentab_art, p_iva_exento => v_iva_exento, p_vehiculo => v_vehiculo,
						p_cod_lista_prec_vta => v_cod_lista_prec_vta, p_cod_sucursal => v_cod_sucursal,
						p_fec_vigencia => v_fec_vigencia, p_fec_inicio_vigencia => v_fec_inicio_vigencia,
						p_fec_fin_vigencia => v_fec_fin_vigencia, p_nro_cuota => v_nro_cuota, p_selec_precio => v_selec_precio,
						p_selec_coef => v_selec_coef, p_oferta => v_oferta, p_costo_unit => v_costo_unit,
						p_costo_unit_mr => v_costo_unit_mr, p_cant_pedida => v_cant_pedida, p_cotiz_venta => v_cotiz_venta,
						p_coef_prec_vta => v_coef_prec_vta, p_nro_orden => v_nro_orden,
						p_tipo_interes_precio => v_tipo_interes_precio, p_precio_vta_mr_sin_iva => v_precio_vta_mr_sin_iva,
						p_precio_vta_mr_con_iva => v_precio_vta_mr_con_iva, p_precio_vta_ml_sin_iva => v_precio_vta_ml_sin_iva,
						p_precio_vta_ml_con_iva => v_precio_vta_ml_con_iva, p_coef_mr => v_coef_mr, p_coef_ml => v_coef_ml,
						p_coef_mr_real => v_coef_mr_real, p_cod_moneda_ref => v_cod_moneda_ref, p_cant_minima => v_cant_minima,
						p_no_hace_commit => v_no_hace_commit);
		p_costo_unit            := v_costo_unit;
		p_costo_unit_mr         := v_costo_unit_mr;
		p_cotiz_venta           := v_cotiz_venta;
		p_coef_prec_vta         := v_coef_prec_vta;
		p_precio_vta_mr_sin_iva := v_precio_vta_mr_sin_iva;
		p_precio_vta_mr_con_iva := v_precio_vta_mr_con_iva;
		p_precio_vta_ml_sin_iva := v_precio_vta_ml_sin_iva;
		p_precio_vta_ml_con_iva := v_precio_vta_ml_con_iva;
		p_coef_mr               := v_coef_mr;
		p_coef_ml               := v_coef_ml;
		p_coef_mr_real          := v_coef_mr_real;
	END CALL;
  PROCEDURE CALL(p_cod_articulo          IN articulos_prec_vta.cod_articulo%TYPE,
								 p_cod_familia           IN articulos_prec_vta.cod_articulo%TYPE DEFAULT '',
								 p_porc_iva              IN devoluciones_art.porc_iva%TYPE,
								 p_porc_aplic_iva        IN presups_vta_art.porc_aplic_iva%TYPE,
								 p_coef_rentab           IN NUMBER DEFAULT 0,
								 p_coef_rentab_empresa   IN coef_rent.coeficiente%TYPE DEFAULT 0,
								 p_coef_rentab_flia      IN coef_rent_flia.coeficiente%TYPE DEFAULT 0,
								 p_coef_rentab_art       IN coef_rent_art.coeficiente%TYPE DEFAULT 0,
								 p_iva_exento            IN NUMBER,
								 p_vehiculo              IN articulos.vehiculo%TYPE,
								 p_cod_lista_prec_vta    IN articulos_prec_vta_veh.cod_lista_prec_vta%TYPE,
								 p_cod_sucursal          IN presups_vta.cod_sucursal%TYPE DEFAULT 0,
								 p_fec_vigencia          IN DATE DEFAULT to_date('01/01/2000', 'dd/mm/yyyy'),
								 p_fec_inicio_vigencia   IN DATE DEFAULT to_date('01/01/2000', 'dd/mm/yyyy'),
								 p_fec_fin_vigencia      IN DATE DEFAULT to_date('01/01/2000', 'dd/mm/yyyy'),
								 p_nro_cuota             IN articulos_prec_vta_veh_cuo.nro_cuota%TYPE DEFAULT 0,
								 p_selec_precio          IN NUMBER,
								 p_selec_coef            IN NUMBER DEFAULT 0,
								 p_oferta                IN articulos_prec_vta.oferta%TYPE DEFAULT 0,
								 p_costo_unit            IN OUT articulos_suc.costo_unit%TYPE,
								 p_costo_unit_mr         IN OUT articulos_suc.costo_unit_mr%TYPE,
								 p_cant_pedida           IN articulos_suc.cant_pedida%TYPE DEFAULT 0,
								 p_cotiz_venta           IN OUT cotizaciones_monedas.cotiz_venta%TYPE,
								 p_coef_prec_vta         IN OUT coef_calc_prec_vta.coeficiente%TYPE,
								 p_nro_orden             IN articulos_prec_vta.nro_orden%TYPE DEFAULT 0,
								 p_tipo_interes_precio   IN NUMBER DEFAULT 0,
								 p_precio_vta_mr_sin_iva IN OUT NUMBER,
								 p_cod_moneda_ref        IN cotizaciones_monedas.cod_moneda%TYPE DEFAULT '',
								 p_cant_minima           IN articulos_prec_vta.cant_minima%TYPE DEFAULT 0,
								 p_no_hace_commit        IN NUMBER DEFAULT 0)
  IS
		v_cod_articulo          articulos_prec_vta.cod_articulo%TYPE := p_cod_articulo;
		v_cod_familia           articulos_prec_vta.cod_articulo%TYPE := p_cod_familia;
		v_porc_iva              devoluciones_art.porc_iva%TYPE := p_porc_iva;
		v_porc_aplic_iva        presups_vta_art.porc_aplic_iva%TYPE := p_porc_aplic_iva;
		v_coef_rentab           NUMBER := p_coef_rentab;
		v_coef_rentab_empresa   coef_rent.coeficiente%TYPE := p_coef_rentab_empresa;
		v_coef_rentab_flia      coef_rent_flia.coeficiente%TYPE := p_coef_rentab_flia;
		v_coef_rentab_art       coef_rent_art.coeficiente%TYPE := p_coef_rentab_art;
		v_iva_exento            NUMBER := p_iva_exento;
		v_vehiculo              articulos.vehiculo%TYPE := p_vehiculo;
		v_cod_lista_prec_vta    articulos_prec_vta_veh.cod_lista_prec_vta%TYPE := p_cod_lista_prec_vta;
		v_cod_sucursal          presups_vta.cod_sucursal%TYPE := p_cod_sucursal;
		v_fec_vigencia          DATE := p_fec_vigencia;
		v_fec_inicio_vigencia   DATE := p_fec_inicio_vigencia;
		v_fec_fin_vigencia      DATE := p_fec_fin_vigencia;
		v_nro_cuota             articulos_prec_vta_veh_cuo.nro_cuota%TYPE := p_nro_cuota;
		v_selec_precio          NUMBER := p_selec_precio;
		v_selec_coef            NUMBER := p_selec_coef;
		v_oferta                articulos_prec_vta.oferta%TYPE := p_oferta;
		v_costo_unit            articulos_suc.costo_unit%TYPE := p_costo_unit;
		v_costo_unit_mr         articulos_suc.costo_unit_mr%TYPE := p_costo_unit_mr;
		v_cant_pedida           articulos_suc.cant_pedida%TYPE := p_cant_pedida;
		v_cotiz_venta           cotizaciones_monedas.cotiz_venta%TYPE := p_cotiz_venta;
		v_coef_prec_vta         coef_calc_prec_vta.coeficiente%TYPE := p_coef_prec_vta;
		v_nro_orden             articulos_prec_vta.nro_orden%TYPE := p_nro_orden;
		v_tipo_interes_precio   NUMBER := p_tipo_interes_precio;
		v_precio_vta_mr_sin_iva NUMBER := p_precio_vta_mr_sin_iva;
		v_precio_vta_mr_con_iva NUMBER;
		v_precio_vta_ml_sin_iva NUMBER;
		v_precio_vta_ml_con_iva NUMBER;
		v_coef_mr               NUMBER;
		v_coef_ml               NUMBER;
		v_coef_mr_real          NUMBER;
		v_cod_moneda_ref        cotizaciones_monedas.cod_moneda%TYPE := p_cod_moneda_ref;
		v_cant_minima           articulos_prec_vta.cant_minima%TYPE := p_cant_minima;
		v_no_hace_commit        NUMBER := p_no_hace_commit;
	BEGIN
		calprec(p_cod_articulo => v_cod_articulo, p_cod_familia => v_cod_familia, p_porc_iva => v_porc_iva,
						p_porc_aplic_iva => v_porc_aplic_iva, p_coef_rentab => v_coef_rentab,
						p_coef_rentab_empresa => v_coef_rentab_empresa, p_coef_rentab_flia => v_coef_rentab_flia,
						p_coef_rentab_art => v_coef_rentab_art, p_iva_exento => v_iva_exento, p_vehiculo => v_vehiculo,
						p_cod_lista_prec_vta => v_cod_lista_prec_vta, p_cod_sucursal => v_cod_sucursal,
						p_fec_vigencia => v_fec_vigencia, p_fec_inicio_vigencia => v_fec_inicio_vigencia,
						p_fec_fin_vigencia => v_fec_fin_vigencia, p_nro_cuota => v_nro_cuota, p_selec_precio => v_selec_precio,
						p_selec_coef => v_selec_coef, p_oferta => v_oferta, p_costo_unit => v_costo_unit,
						p_costo_unit_mr => v_costo_unit_mr, p_cant_pedida => v_cant_pedida, p_cotiz_venta => v_cotiz_venta,
						p_coef_prec_vta => v_coef_prec_vta, p_nro_orden => v_nro_orden,
						p_tipo_interes_precio => v_tipo_interes_precio, p_precio_vta_mr_sin_iva => v_precio_vta_mr_sin_iva,
						p_precio_vta_mr_con_iva => v_precio_vta_mr_con_iva, p_precio_vta_ml_sin_iva => v_precio_vta_ml_sin_iva,
						p_precio_vta_ml_con_iva => v_precio_vta_ml_con_iva, p_coef_mr => v_coef_mr, p_coef_ml => v_coef_ml,
						p_coef_mr_real => v_coef_mr_real, p_cod_moneda_ref => v_cod_moneda_ref, p_cant_minima => v_cant_minima,
						p_no_hace_commit => v_no_hace_commit);
		p_costo_unit            := v_costo_unit;
		p_costo_unit_mr         := v_costo_unit_mr;
		p_cotiz_venta           := v_cotiz_venta;
		p_coef_prec_vta         := v_coef_prec_vta;
		p_precio_vta_mr_sin_iva := v_precio_vta_mr_sin_iva;
	END CALL;
END pkg_calprec;
/
-----------------------------------------------------------------
create or replace FUNCTION fn_obtener_importe_dc(p_cod_articulo        VARCHAR2,
																								 p_cod_tipo_mercaderia VARCHAR2,
																								 p_cod_lista_prec_vta  VARCHAR2,
																								 p_cant_cuota          INTEGER,
																								 p_fecha               DATE,
																								 p_entrega_inicial     NUMBER) RETURN NUMBER IS
	l_precio_vta_ml_sin_iva NUMBER;
	l_importe_dc            NUMBER := 0;
	l_importe_dc_el         NUMBER;
	l_importe_dc_al         NUMBER;
	l_importe_dc_ex         NUMBER;
	l_importe_dc_nm         NUMBER;
	l_articulo_info_el      articulo_con_prec_vta_type;
	l_articulo_info_al      articulo_con_prec_vta_type;
	l_articulo_info_ex      articulo_con_prec_vta_type;
	l_articulo_info_nm      articulo_con_prec_vta_type;
	l_articulo_info         articulo_con_prec_vta_type;
	v_costo_unit            articulos_suc.costo_unit%TYPE;
	v_costo_unit_mr         articulos_suc.costo_unit_mr%TYPE;
	v_cotiz_venta           cotizaciones_monedas.cotiz_venta%TYPE; --f4
	v_coef_prec_vta         coef_calc_prec_vta.coeficiente%TYPE;
	v_precio_vta_mr_sin_iva NUMBER; --f8
	v_precio_vta_mr_con_iva NUMBER; --f8
	v_precio_vta_ml_con_iva NUMBER; --money,
	v_coef_mr               NUMBER; --f8
	v_coef_ml               NUMBER; --f4
	v_coef_mr_real          NUMBER; --f4
BEGIN
	IF p_cod_tipo_mercaderia = 'ELEC' AND p_cant_cuota = 18 AND p_entrega_inicial = 1000 THEN
		l_importe_dc_el    := 0;
		l_importe_dc_al    := 0;
		l_articulo_info_el := fn_obtener_articulo_con_precio_vta(p_cod_articulo, p_fecha, 'EL');
		IF l_articulo_info_el IS NOT NULL THEN
			pkg_calprec.call(p_cod_articulo => p_cod_articulo, p_porc_iva => l_articulo_info_el.porc_iva,
											 p_porc_aplic_iva => l_articulo_info_el.porc_aplic_iva,
											 p_iva_exento => l_articulo_info_el.iva_exento, p_vehiculo => l_articulo_info_el.vehiculo,
											 p_cod_lista_prec_vta => l_articulo_info_el.cod_lista_prec_vta, p_fec_vigencia => p_fecha,
											 p_selec_precio => 1, p_precio_vta_ml_sin_iva => l_precio_vta_ml_sin_iva,
											 p_precio_vta_ml_con_iva => l_importe_dc_el, p_costo_unit => v_costo_unit,
											 p_costo_unit_mr => v_costo_unit_mr, p_cotiz_venta => v_cotiz_venta,
											 p_coef_prec_vta => v_coef_prec_vta, p_precio_vta_mr_sin_iva => v_precio_vta_mr_sin_iva,
											 p_precio_vta_mr_con_iva => v_precio_vta_mr_con_iva, p_coef_mr => v_coef_mr,
											 p_coef_ml => v_coef_ml, p_coef_mr_real => v_coef_mr_real);
		END IF;
		l_articulo_info_al := fn_obtener_articulo_con_precio_vta(p_cod_articulo, p_fecha, 'AL');
		IF l_articulo_info_al IS NOT NULL THEN
			pkg_calprec.call(p_cod_articulo => p_cod_articulo, p_porc_iva => l_articulo_info_al.porc_iva,
											 p_porc_aplic_iva => l_articulo_info_al.porc_aplic_iva,
											 p_iva_exento => l_articulo_info_al.iva_exento, p_vehiculo => l_articulo_info_al.vehiculo,
											 p_cod_lista_prec_vta => l_articulo_info_al.cod_lista_prec_vta, p_fec_vigencia => p_fecha,
											 p_selec_precio => 1, p_precio_vta_ml_sin_iva => l_precio_vta_ml_sin_iva,
											 p_precio_vta_ml_con_iva => l_importe_dc_al, p_costo_unit => v_costo_unit,
											 p_costo_unit_mr => v_costo_unit_mr, p_cotiz_venta => v_cotiz_venta,
											 p_coef_prec_vta => v_coef_prec_vta, p_precio_vta_mr_sin_iva => v_precio_vta_mr_sin_iva,
											 p_precio_vta_mr_con_iva => v_precio_vta_mr_con_iva, p_coef_mr => v_coef_mr,
											 p_coef_ml => v_coef_ml, p_coef_mr_real => v_coef_mr_real);
		END IF;
		IF l_importe_dc_el <= l_importe_dc_al THEN
			l_importe_dc := l_importe_dc_el;
		ELSIF l_importe_dc_al > 0 THEN
			l_importe_dc := l_importe_dc_al;
		ELSE
			l_importe_dc := l_importe_dc_el;
		END IF;
	ELSIF p_cod_lista_prec_vta = 'EX' THEN
		l_importe_dc_ex := 0;
		l_importe_dc_nm := 0;
		l_articulo_info_ex := fn_obtener_articulo_con_precio_vta(p_cod_articulo, p_fecha, 'EX');
		IF l_articulo_info_ex IS NOT NULL THEN
			pkg_calprec.call(p_cod_articulo => p_cod_articulo, p_porc_iva => l_articulo_info_ex.porc_iva,
											 p_porc_aplic_iva => l_articulo_info_ex.porc_aplic_iva,
											 p_iva_exento => l_articulo_info_ex.iva_exento, p_vehiculo => l_articulo_info_ex.vehiculo,
											 p_cod_lista_prec_vta => l_articulo_info_ex.cod_lista_prec_vta, p_fec_vigencia => p_fecha,
											 p_selec_precio => 1, p_precio_vta_ml_sin_iva => l_precio_vta_ml_sin_iva,
											 p_precio_vta_ml_con_iva => l_importe_dc_ex, p_costo_unit => v_costo_unit,
											 p_costo_unit_mr => v_costo_unit_mr, p_cotiz_venta => v_cotiz_venta,
											 p_coef_prec_vta => v_coef_prec_vta, p_precio_vta_mr_sin_iva => v_precio_vta_mr_sin_iva,
											 p_precio_vta_mr_con_iva => v_precio_vta_mr_con_iva, p_coef_mr => v_coef_mr,
											 p_coef_ml => v_coef_ml, p_coef_mr_real => v_coef_mr_real);
		END IF;
		l_articulo_info_nm := fn_obtener_articulo_con_precio_vta(p_cod_articulo, p_fecha, 'NM');
		IF l_articulo_info_nm IS NOT NULL THEN
			pkg_calprec.call(p_cod_articulo => p_cod_articulo, p_porc_iva => l_articulo_info_nm.porc_iva,
											 p_porc_aplic_iva => l_articulo_info_nm.porc_aplic_iva,
											 p_iva_exento => l_articulo_info_nm.iva_exento, p_vehiculo => l_articulo_info_nm.vehiculo,
											 p_cod_lista_prec_vta => l_articulo_info_nm.cod_lista_prec_vta, p_fec_vigencia => p_fecha,
											 p_selec_precio => 1, p_precio_vta_ml_sin_iva => l_precio_vta_ml_sin_iva,
											 p_precio_vta_ml_con_iva => l_importe_dc_nm, p_costo_unit => v_costo_unit,
											 p_costo_unit_mr => v_costo_unit_mr, p_cotiz_venta => v_cotiz_venta,
											 p_coef_prec_vta => v_coef_prec_vta, p_precio_vta_mr_sin_iva => v_precio_vta_mr_sin_iva,
											 p_precio_vta_mr_con_iva => v_precio_vta_mr_con_iva, p_coef_mr => v_coef_mr,
											 p_coef_ml => v_coef_ml, p_coef_mr_real => v_coef_mr_real);
		END IF;
		IF l_importe_dc_ex <= l_importe_dc_nm THEN
			l_importe_dc := l_importe_dc_ex;
		ELSIF l_importe_dc_ex > 0 THEN
			l_importe_dc := l_importe_dc_ex;
		ELSE
			l_importe_dc := l_importe_dc_nm;
		END IF;
	ELSE
		l_articulo_info := fn_obtener_articulo_con_precio_vta(p_cod_articulo, p_fecha, p_cod_lista_prec_vta);
		IF l_articulo_info IS NULL THEN
      ROLLBACK;
			raise_application_error(-20999,
															'El articulo ' || p_cod_articulo || ' no tiene lista de precio ' || p_cod_lista_prec_vta ||
															 ' vigente.');
		END IF;
		pkg_calprec.call(p_cod_articulo => p_cod_articulo, p_porc_iva => l_articulo_info.porc_iva,
										 p_porc_aplic_iva => l_articulo_info.porc_aplic_iva, p_iva_exento => l_articulo_info.iva_exento,
										 p_vehiculo => l_articulo_info.vehiculo, p_cod_lista_prec_vta => l_articulo_info.cod_lista_prec_vta,
										 p_fec_vigencia => p_fecha, p_selec_precio => 1, p_precio_vta_ml_sin_iva => l_precio_vta_ml_sin_iva,
										 p_precio_vta_ml_con_iva => l_importe_dc, p_costo_unit => v_costo_unit,
										 p_costo_unit_mr => v_costo_unit_mr, p_cotiz_venta => v_cotiz_venta,
										 p_coef_prec_vta => v_coef_prec_vta, p_precio_vta_mr_sin_iva => v_precio_vta_mr_sin_iva,
										 p_precio_vta_mr_con_iva => v_precio_vta_mr_con_iva, p_coef_mr => v_coef_mr, p_coef_ml => v_coef_ml,
										 p_coef_mr_real => v_coef_mr_real);
	END IF;
  
	RETURN l_importe_dc;
/* EXCEPTION 
   WHEN OTHERS THEN 
     ROLLBACK;*/
END;
/
----------------------------------------------
create or replace PACKAGE pkg_cuotero IS
  FUNCTION fn_art_cuota_max(
    p_cod_articulo articulos.cod_articulo%TYPE
  ) RETURN NUMBER;
END;
/
create or replace PACKAGE BODY pkg_cuotero IS
  FUNCTION fn_art_cuota_max(p_cod_articulo articulos.cod_articulo%TYPE) RETURN NUMBER AS
    l_cuota_max app_cuotero_detalle.cuota_max%TYPE;
    l_cod_tipo_mercaderia familias.cod_tipo_mercaderia%TYPE;
  BEGIN  
  
    SELECT b.cod_tipo_mercaderia
    INTO l_cod_tipo_mercaderia
    FROM articulos a, familias b
    WHERE a.cod_articulo = p_cod_articulo
	  AND a.cod_familia = b.cod_familia;
  
    SELECT b.cuota_max
    INTO l_cuota_max
    FROM app_cuotero a, app_cuotero_detalle b   
    WHERE a.cod_app = 'APPCUOTERO'  
    AND a.cod_app = b.cod_app   
    AND b.cod_tipo_mercaderia = l_cod_tipo_mercaderia   
    AND 0 between b.cuota_desde   
    AND b.cuota_hasta;    
  
    RETURN l_cuota_max;
  EXCEPTION
    WHEN OTHERS THEN
      PR_CAPTURAR_ERROR;                                                                                              
      RAISE;
  END fn_art_cuota_max;
END;
/
--------------------------------------------
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "SC_SOL_TRABAJO" ("NRO_SOL", "NRO_ITEM", "COD_PROVEEDOR", "DENOMINACION", "COD_ACTIVIDAD_EMP", "DIRECCION", "COD_CIUDAD", "COD_LOCALIDAD", "ID_TELEFONO", "COD_ACTIVIDAD", "COD_PROFESION", "COD_OFICIO", "COD_OCUPACION", "CARGO", "ANTIGUEDAD", "SALARIO_ML", "COMISION_ML", "ANTICIPO_ML", "OTROS_ING_ML", "DIA_COBRO1", "DIA_COBRO2", "ESTADO", "PAGA_IPS", "CONTACTO", "CARGO_CONTACTO", "CONTACTO_LLAMADA", "DATOS_OBTENIDOS", "OBSERVACION", "COD_REQ_ING", "REQ_ING", "CONF_INGRESO_LABORAL", "ES_FUNCIONARIO_PUBLICO", "ES_EMPLEADO", "ES_COMER_DUENHO_INDEP", "ES_PRODUCTOR_AGROPECUARIO", "ES_POLICIA_MILITAR", "ES_GUARDIA", "ES_AMA_DE_CASA", "ES_PADRE_PASTOR_RELIG", "NRO_SOLI", "VIGENTE", "NUEVO_LABORAL", "CONF_COMISION", "CONF_OTROS_INGRESOS", "INSITU", "NRO_ITEM_P", "MOMENTO_DE_CARGA", "RELACION_LABORAL", "USR_CONF", "FEC_CONF", "FEC_ULT_ACT", "USR_ULT_ACT", "CROQUIS_HABLADO", "COORDENADA", "ES_PROFESIONAL", "ES_JUBILADO", "TRABAJA_INDE", "EMPLEADA_DOMESTICA") AS 
  SELECT "nro_sol" nro_sol,
       "nro_item" nro_item,
       "cod_proveedor" cod_proveedor,
       "denominacion" denominacion,
       "cod_actividad_emp" cod_actividad_emp,
       "direccion" direccion,
       "cod_ciudad" cod_ciudad,
       "cod_localidad" cod_localidad,
       "id_telefono" id_telefono,
       "cod_actividad" cod_actividad,
       "cod_profesion" cod_profesion,
       "cod_oficio" cod_oficio,
       "cod_ocupacion" cod_ocupacion,
       "cargo" cargo,
       "antiguedad" antiguedad,
       "salario_ml" salario_ml,
       "comision_ml" comision_ml,
       "anticipo_ml" anticipo_ml,
       "otros_ing_ml" otros_ing_ml,
       "dia_cobro1" dia_cobro1,
       "dia_cobro2" dia_cobro2,
       "estado" estado,
       "paga_ips" paga_ips,
       "contacto" contacto,
       "cargo_contacto" cargo_contacto,
       "contacto_llamada" contacto_llamada,
       "datos_obtenidos" datos_obtenidos,
       "observacion" observacion,
       "cod_req_ing" cod_req_ing,
       "req_ing" req_ing,
       "conf_ingreso_laboral" conf_ingreso_laboral,
       "es_funcionario_publico" es_funcionario_publico,
       "es_empleado" es_empleado,
       "es_comer_duenho_indep" es_comer_duenho_indep,
       "es_productor_agropecuario" es_productor_agropecuario,
       "es_policia_militar" es_policia_militar,
       "es_guardia" es_guardia,
       "es_ama_de_casa" es_ama_de_casa,
       "es_padre_pastor_relig" es_padre_pastor_relig,
       "nro_soli" nro_soli,
       "vigente" vigente,
       "nuevo_laboral" nuevo_laboral,
       "conf_comision" conf_comision,
       "conf_otros_ingresos" conf_otros_ingresos,
       "insitu" insitu,
       "nro_item_p" nro_item_p,
       "momento_de_carga" momento_de_carga,
       "relacion_laboral" relacion_laboral,
       "usr_conf" usr_conf,
       "fec_conf" fec_conf,
       "fec_ult_act" fec_ult_act,
       "usr_ult_act" usr_ult_act,
       "croquis_hablado" croquis_hablado,
       "coordenada" coordenada,
       "es_profesional" es_profesional,
       "es_jubilado" es_jubilado,
       "trabaja_inde" trabaja_inde,
       "empleada_domestica" empleada_domestica
FROM sc_sol_trabajo@wrk1
;

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "SC_SOL_TRABAJO_DEPENDIENTE" ("NRO_SOL", "NRO_ITEM", "EMPRESA", "DIRECCION", "ID_TELEFONO", "COD_LOCALIDAD", "CARGO", "SALARIO_ML", "COMISION_ML", "COBRO_SALARIO", "ANTIGUEDAD", "PRESTAMO_INTERNO", "MONTO_DESCONTADO", "DATOS_CONTACTO", "OBSERVACION", "FEC_ALTA", "USR_ALTA", "FEC_ULT_ACT", "USR_ULT_ACT") AS 
  SELECT "nro_sol" nro_sol,
       "nro_item" nro_item,
       "empresa" empresa,
       "direccion" direccion,
       "id_telefono" id_telefono,
       "cod_localidad" cod_localidad,
       "cargo" cargo,
       "salario_ml" salario_ml,
       "comision_ml" comision_ml,
       "cobro_salario" cobro_salario,
       "antiguedad" antiguedad,
       "prestamo_interno" prestamo_interno,
       "monto_descontado" monto_descontado,
       "datos_contacto" datos_contacto,
       "observacion" observacion,
       "fec_alta" fec_alta,
       "usr_alta" usr_alta,
       "fec_ult_act" fec_ult_act,
       "usr_ult_act" usr_ult_act
FROM sc_sol_trabajo_dependiente@wrk1
;

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "SC_SOL_TRABAJO_INDEPENDIENTE" ("NRO_SOL", "NRO_ITEM", "ACTIVIDAD_ECONOMICA", "EMPRESA", "DIRECCION", "COD_LOCALIDAD", "ANTIGUEDAD", "TIPO_LOCAL", "PAGO_IMPORTE_ALQUILER", "CANTIDAD_SUCURSALES", "CANTIDAD_EMPLEADOS", "SUELDO_PROMEDIO_EMPLEADOS", "TIENE_PATENTE", "OTRO_DOCUMENTO", "VENTA_PROMEDIO_MENSUAL", "REALIZA_ACTIVIDAD_ADICIONAL", "INGRESO_ACTIVIDAD_ADICIONAL", "CONTRATO_ALQUILER", "OBSERVACION", "COBRO_IMPORTE_ALQUILER", "TIENE_EMPLEADOS", "TIENE_SUCURSALES", "FEC_ALTA", "USR_ALTA", "FEC_ULT_ACT", "USR_ULT_ACT") AS 
  SELECT "nro_sol" nro_sol,
       "nro_item" nro_item,
       "actividad_economica" actividad_economica,
       "empresa" empresa,
       "direccion" direccion,
       "cod_localidad" cod_localidad,
       "antiguedad" antiguedad,
       "tipo_local" tipo_local,
       "pago_importe_alquiler" pago_importe_alquiler,
       "cantidad_sucursales" cantidad_sucursales,
       "cantidad_empleados" cantidad_empleados,
       "sueldo_promedio_empleados" sueldo_promedio_empleados,
       "tiene_patente" tiene_patente,
       "otro_documento" otro_documento,
       "venta_promedio_mensual" venta_promedio_mensual,
       "realiza_actividad_adicional" realiza_actividad_adicional,
       "ingreso_actividad_adicional" ingreso_actividad_adicional,
       "contrato_alquiler" contrato_alquiler,
       "observacion" observacion,
       "cobro_importe_alquiler" cobro_importe_alquiler,
       "tiene_empleados" tiene_empleados,
       "tiene_sucursales" tiene_sucursales,
       "fec_alta" fec_alta,
       "usr_alta" usr_alta,
       "fec_ult_act" fec_ult_act,
       "usr_ult_act" usr_ult_act
FROM sc_sol_trabajo_independiente@wrk1
;
-----------------------------------------------------------
create or replace FUNCTION ldap_login(p_user     VARCHAR2,
																			p_password VARCHAR2) RETURN VARCHAR2 IS
	v_url       VARCHAR2(200) := fn_api_url || '/auth/';
	v_body      CLOB;
	v_resp      CLOB;
	v_json_resp json_object_t;
BEGIN
	v_body := json_object('username' VALUE p_user, 'password' VALUE p_password);
	apex_web_service.set_request_headers(p_name_01 => 'Content-Type', p_value_01 => 'application/json');
	v_resp := apex_web_service.make_rest_request(p_url => v_url, p_http_method => 'POST', p_body => v_body,
																							 p_wallet_path => fn_api_wallet);
	Dbms_Output.Put_Line(apex_web_service.g_status_code);
  IF apex_web_service.g_status_code = 401 THEN
		Raise_Application_Error(-20999, 'Credenciales incorrectas!');
	END IF;
	v_json_resp := json_object_t(v_resp);
	RETURN v_json_resp.get_string('access_token');
EXCEPTION
	WHEN Others THEN
		pr_capturar_error(p_obs => p_user || ',' || '"contraseña"');
		RAISE;
END ldap_login;
/
------------------------------
create or replace FUNCTION fn_api_wallet RETURN VARCHAR2 IS
  g_base_de_datos VARCHAR2(4000);
  l_bd VARCHAR2(4);
BEGIN
  SELECT global_name INTO g_base_de_datos FROM global_name;
  l_bd := CASE g_base_de_datos
            WHEN 'DESA' THEN
              'desa'
            WHEN 'QAI' THEN
              'QAI'
            WHEN 'PROD' THEN
              'prod'
          END;
  RETURN 'file:/u01/app/oracle/admin/'||l_bd||'/api_wallets/alexsa';
END fn_api_wallet;
/
---------------------------------------
create or replace FUNCTION fn_api_url RETURN VARCHAR2 IS
  g_base_de_datos VARCHAR2(4000);
BEGIN
  SELECT global_name INTO g_base_de_datos FROM global_name;
  IF g_base_de_datos NOT IN ('PROD')  THEN
    RETURN 'http://ingrid-desa.alexsa.com.py/api';
  ELSE
    RETURN 'https://ingrid.alexsa.com.py/api';
  END IF;
END;
/
-----------------------------------
create or replace PACKAGE pkg_documentos IS
	FUNCTION guardar
	(
		p_cod_tipo_doc_cliente   archivo_dig.tipo_doc%TYPE,
		p_cod_tipo_documento_dig archivo_dig.cod_tipo_documento_dig%TYPE,
		p_nro_documento_cliente  archivo_dig.nro_doc%TYPE,
		p_file_content           BLOB,
		p_file_name              VARCHAR2,
		p_file_mime_type         VARCHAR2,
		p_token                  VARCHAR2,
		p_message                OUT VARCHAR2
	) RETURN BOOLEAN;
END pkg_documentos;
/
create or replace PACKAGE BODY pkg_documentos IS
	FUNCTION guardar
	(
		p_cod_tipo_doc_cliente   archivo_dig.tipo_doc%TYPE,
		p_cod_tipo_documento_dig archivo_dig.cod_tipo_documento_dig%TYPE,
		p_nro_documento_cliente  archivo_dig.nro_doc%TYPE,
		p_file_content           BLOB,
		p_file_name              VARCHAR2,
		p_file_mime_type         VARCHAR2,
		p_token                  VARCHAR2,
		p_message                OUT VARCHAR2
	) RETURN BOOLEAN IS
		l_file_name      VARCHAR2(200) := substr(p_file_name,
																						 0,
																						 instr(p_file_name, '.', 1, regexp_count(p_file_name, '\.')) - 1);
		l_file_size      NUMBER := dbms_lob.getlength(p_file_content);
		l_tipo_arch      archivo_dig.tipo_arch%TYPE;
		l_url            VARCHAR2(200) := fn_api_url || '/file-storage/upload/legacy/v1';
		l_http_method    VARCHAR2(8) := 'POST';
		l_wallet_path    VARCHAR2(50) := CASE WHEN l_url LIKE '%https%' THEN fn_api_wallet END;
		l_multipart      apex_web_service.t_multipart_parts;
		l_multipart_blob BLOB;
		l_resp           CLOB;
		l_resp_json      json_object_t;
		request_error    EXCEPTION;
	BEGIN
		l_tipo_arch := substr(p_file_mime_type, instr(p_file_mime_type, '/') + 1);
		IF l_tipo_arch NOT IN ('jpeg', 'png', 'jpg', 'pdf') THEN
			raise_application_error(-20999, 'No se permite levantar el tipo de archivo ' || p_file_mime_type);
		END IF;
		apex_web_service.oauth_set_token(p_token => p_token);
		apex_web_service.append_to_multipart(p_multipart    => l_multipart,
																				 p_name         => 'file',
																				 p_filename     => REPLACE(l_file_name, ''),
																				 p_content_type => p_file_mime_type,
																				 p_body_blob    => p_file_content);
		l_multipart_blob := apex_web_service.generate_request_body(p_multipart => l_multipart);
		l_resp := apex_web_service.make_rest_request(p_url         => l_url,
																								 p_http_method => l_http_method,
																								 p_body_blob   => l_multipart_blob,
                                                 p_wallet_path => l_wallet_path);
		IF apex_web_service.g_status_code != 200 THEN
			RAISE request_error;
		END IF;
		l_resp_json := json_object_t(l_resp);
		DECLARE
			l_id_archivo     archivo_dig.id_archivo%TYPE := l_resp_json.get_number('idArch');
			l_nombre_archivo archivo_dig.nombre_archivo%TYPE := l_resp_json.get_string('name');
			l_path           archivo_dig.path%TYPE := l_resp_json.get_string('path');
			l_size           archivo_dig.csize%TYPE := l_resp_json.get_number('size');
			l_sysdate        DATE := SYSDATE;
			l_usr_alta       archivo_dig.usr_alta%TYPE := fn_user;
			l_tipo_doc       archivo_dig.tipo_doc%TYPE := p_cod_tipo_doc_cliente;
			l_nro_doc        archivo_dig.nro_doc%TYPE := p_nro_documento_cliente;
			l_origen_alta    archivo_dig.origen_alta%TYPE := 'APE';
			l_fec_captura    DATE := to_date('01-01-9999', 'dd-mm-rrrr');
		BEGIN
			INSERT INTO archivo_dig
				(id_archivo, cod_tipo_documento_dig, path, nro_sol, cod_cliente, nro_soli, nombre_archivo, csize, tipo_arch,
				 HASH, fec_captura, usr_captura, id_remoto, fec_alta, usr_alta, nombre_fisico, fec_modificacion_so, usr_elim,
				 usr_cert, tipo_doc, nro_doc, origen_alta, serial_instal)
			VALUES
				(l_id_archivo, p_cod_tipo_documento_dig, l_path, 0, 0, 0, l_nombre_archivo, l_size, l_tipo_arch, ' ',
				 l_fec_captura, ' ', 0, l_sysdate, l_usr_alta, ' ', 0, ' ', ' ', l_tipo_doc, l_nro_doc, l_origen_alta, 0);
    END;
		RETURN TRUE;
	EXCEPTION
		WHEN request_error THEN
			pr_capturar_error('ws ' || l_resp || chr(10) || p_cod_tipo_doc_cliente || ',' || p_cod_tipo_documento_dig || ',' ||
												p_nro_documento_cliente || ',' || '|blob_content|' || ',' || p_file_name || ',' ||
												p_file_mime_type || ',' || p_token);
			p_message := 'status_code: ' || apex_web_service.g_status_code || chr(10) || 'reason: ' ||
									 apex_web_service.g_reason_phrase;
			RETURN FALSE;
		WHEN Others THEN
			pr_capturar_error(p_cod_tipo_doc_cliente || ',' || p_cod_tipo_documento_dig || ',' || p_nro_documento_cliente || ',' ||
												p_token);
			p_message := dbms_utility.format_error_stack || dbms_utility.format_error_backtrace;
			RETURN FALSE;
	END guardar;
END pkg_documentos;
/
--------------------------------
create or replace PACKAGE pkg_ic IS
  g_inicializado        NUMBER := 0;
  g_fec_ingrid          ingrid_control.fecha_virtual%TYPE;
  g_nombre_sistema      ingrid_control.nombre_sistema%TYPE;
  g_nombre_empresa      ingrid_control.nombre_empresa%TYPE;
  g_nombre_fantasia     ingrid_control.nombre_fantasia%TYPE;
  g_version_sistema     ingrid_control.version_sistema%TYPE;
  g_cod_moneda_nacional ingrid_control.cod_moneda_nacional%TYPE;
  g_cod_moneda_ref      ingrid_control.cod_moneda_ref%TYPE;
  g_cod_pais            ingrid_control.cod_pais%TYPE;
  g_usuario             VARCHAR2(8);
  g_terminal            VARCHAR2(8);
  g_remitente           VARCHAR2(4000);
  g_dominio             VARCHAR2(4000);
  g_correo              VARCHAR2(4000);
  g_cod_puesto          perspers.cod_puesto%TYPE;
  g_cod_sucursal        ingrid_control_usuario.cod_sucursal%TYPE;
  g_activo              ingrid_control_usuario.activo%TYPE;
  g_cod_personal        ingrid_control_usuario.cod_personal%TYPE;
  g_sc_nivel_permiso    ingrid_control_usuario.sc_nivel_permiso%TYPE;
  g_cola_impresion      ingrid_suc_cola.cola_impresion%TYPE;
  g_cod_local           cpbte_local.cod_local%TYPE;
  g_cod_vendedor        vendedores.cod_vendedor%TYPE;
  g_vend_activo         vendedores.vend_activo%TYPE;
  g_prefijo_tel         paises.prefijo_tel%TYPE;
  g_cod_punto_exp       cpbte_usuario_exp.cod_punto_exp%TYPE;
  g_tipo_formulario     cpbte_punto_exp.tipo_formulario%TYPE;
  g_cod_region_venta    sucursal.cod_region_venta%TYPE;
  g_status              NUMBER := 0;
  g_err_text            VARCHAR2(4000);
  g_base_de_datos       VARCHAR2(8);
  g_cod_tipo_vendedor   VARCHAR2(200);
  PROCEDURE inicializar;
END;
/
create or replace PACKAGE BODY pkg_ic IS
	/**
  * Autor: Rodrigo Avalos
  * Creado el: 16.04.2024 07:59
  * Proposito: variables globales de uso frecuente
  * Modificado por: Rodrigo Avalos
  * Modificado el: 07.05.2024 08:33
  * Modificado por: Victor Rojas
  * Modificado el: 17.06.2024 agregue variable g_status, g_err_tex
  * Modificado por: Rodrigo Avalos
  * Modificado el: 27.06.2024 agregue variable g_base_de_datos
  * Modificado por: Rodrigo Avalos
  * Modificado el: 29.07.2024 agregue clausula no_data_found linea 78
  * Modificado por: Rodrigo Avalos
  * Modificado el: 16.08.2024 14:49 agregados Commit y Rollback al final del proceso
  */
	PROCEDURE inicializar IS
	BEGIN
		IF g_inicializado = 1 THEN
			RETURN;
		END IF;

    SELECT global_name INTO g_base_de_datos FROM global_name;

    SELECT nvl(fecha_virtual, trunc(SYSDATE)), nombre_sistema, nombre_empresa, nombre_fantasia, version_sistema,
					 nvl(cod_moneda_nacional, '01'), nvl(cod_moneda_ref, '02'), fn_user, cod_pais
		INTO   g_fec_ingrid, g_nombre_sistema, g_nombre_empresa, g_nombre_fantasia, g_version_sistema, g_cod_moneda_nacional,
					 g_cod_moneda_ref, g_usuario, g_cod_pais
		FROM   ingrid_control
		WHERE  dummy_key = 1;

    IF g_usuario IN ('nobody', 'apex_pub', 'ords_pu', 'admin') THEN
			RETURN;
		END IF;

    BEGIN
			SELECT a.cod_puesto
			INTO   g_cod_puesto
			FROM   perspers a, vendedores b
			WHERE  a.cod_personal = b.cod_personal
			AND    b.cod_tipo_vendedor IN ('SALON', 'EXTERNO')
			AND    b.vend_activo = 1
			AND    a.login != '--'
			AND    a.estado_personal IN ('ACTI', 'VACA', 'LICE', 'PEND')
			AND    a.login = g_usuario;
		EXCEPTION
			WHEN No_Data_Found THEN
				NULL;
		END;

		BEGIN
			SELECT cod_sucursal, activo, cod_personal, sc_nivel_permiso
			INTO   g_cod_sucursal, g_activo, g_cod_personal, g_sc_nivel_permiso
			FROM   ingrid_control_usuario
			WHERE  login = g_usuario;
		EXCEPTION
			WHEN No_Data_Found THEN
				raise_application_error(-20999, 'No esta asignado a ninguna sucursal...');
		END;

    IF g_activo = 0 THEN
			raise_application_error(-20999, 'Verifique. Este usuario no esta activo...');
		END IF;

    SELECT cod_local
		INTO   g_cod_local
		FROM   cpbte_local
		WHERE  cod_sucursal = g_cod_sucursal
		AND    activo = 1;
		SELECT nvl(prefijo_tel, '--') INTO g_prefijo_tel FROM paises WHERE cod_pais = g_cod_pais;

    BEGIN
			SELECT cola_impresion INTO g_cola_impresion FROM ingrid_suc_cola WHERE cod_sucursal = g_cod_sucursal;
		EXCEPTION
			WHEN No_Data_Found THEN
				g_cola_impresion := '--';
		END;

    BEGIN
    	SELECT a.cod_punto_exp, b.tipo_formulario
			INTO   g_cod_punto_exp, g_tipo_formulario
			FROM   cpbte_usuario_exp a, cpbte_punto_exp b
			WHERE  a.login = g_usuario
			AND    a.cod_local = g_cod_local
			AND    a.activo = 1
			AND    a.cod_local = b.cod_local
			AND    a.cod_punto_exp = b.cod_punto_exp;
		EXCEPTION
			WHEN No_Data_Found THEN
				g_cod_punto_exp := '--';
		END;

    BEGIN
			SELECT a.cod_vendedor, a.vend_activo
			INTO   g_cod_vendedor, g_vend_activo
			FROM   vendedores a
			WHERE  a.cod_personal = g_cod_personal
			AND    rownum = 1;
		EXCEPTION
			WHEN No_Data_Found THEN
				g_cod_vendedor := 'N/A';
				g_vend_activo  := 0;
		END;

		BEGIN
			SELECT cod_tipo_vendedor INTO g_cod_tipo_vendedor FROM vendedores v WHERE v.cod_vendedor = g_cod_vendedor;
		EXCEPTION
			WHEN No_Data_Found THEN
				g_cod_tipo_vendedor := NULL;
			WHEN Others THEN
				g_cod_tipo_vendedor := NULL;
		END;

		SELECT cod_region_venta INTO g_cod_region_venta FROM sucursal WHERE cod_sucursal = g_cod_sucursal;
		SELECT TRIM(parametro) INTO g_remitente FROM parametro WHERE nro_parametro = 12;
		SELECT TRIM(parametro) INTO g_dominio FROM parametro WHERE nro_parametro = 13;
		SELECT TRIM(parametro) INTO g_correo FROM parametro WHERE nro_parametro = 14;
		g_inicializado := 1;
    COMMIT;
	EXCEPTION
		WHEN Others THEN
      ROLLBACK;
			g_inicializado := 0;
			pr_capturar_error;
			RAISE;
	END inicializar;
END pkg_ic;
/
-------------------------------------
BEGIN
  pr_iitab_to_oraview('cpbte_usuario_exp');
  pr_iitab_to_oraview('cpbte_punto_exp');
  pr_iitab_to_oraview('cuota_maxima_disp');
EXCEPTION
  WHEN OTHERS THEN
    pr_capturar_error;
    RAISE;
END;
------------------------------------
create or replace PROCEDURE pr_iitab_to_oraview (
	p_table VARCHAR2
) AUTHID CURRENT_USER AS
	l_table   VARCHAR2(50) := Lower(p_table);
	l_query   VARCHAR2(1500);
	l_ddl     VARCHAR2(4000);
	l_columns VARCHAR2(4000);
BEGIN
--  l_query := q'!
--SELECT Listagg(
--  '"'||Trim("column_name")||'" '||Trim("column_name")
--  ,','||chr(10)||'       '
--) WITHIN GROUP (
--  Order By "column_sequence"
--)
--FROM iicolumns@wrk1
--WHERE trim("table_name") = :l_table
--!';
  l_query := q'!
  SELECT rtrim(xmlcast(xmlagg(xmlelement(e, '"' || TRIM("column_name") || '" ' || TRIM("column_name"), ', ') ORDER BY
														"column_sequence") AS CLOB), ', ')
  FROM iicolumns@wrk1
  WHERE TRIM("table_name") = :l_table
  !';
  EXECUTE IMMEDIATE l_query INTO l_columns USING l_table;
	l_ddl := 'CREATE OR REPLACE VIEW '
	      || l_table
	      || ' AS ' || Chr(10)
        || 'SELECT ' || l_columns || Chr(10)
	      || 'FROM ' || lower(l_table) || '@wrk1';
	EXECUTE IMMEDIATE l_ddl;
EXCEPTION
  WHEN OTHERS THEN
    pr_capturar_error(
      p_obs => p_table||','||l_table||','||l_query||','||l_ddl||','||l_columns
    );
    RAISE;
END;
/
----------------------------------------------------
create or replace PROCEDURE pr_obtener_escala_por_interes( 
  p_cod_escala_pi   IN  escala_porc_interes_cuo.cod_escala_pi%TYPE, 
  p_nro_cuota       IN  escala_porc_interes_cuo.nro_cuota%TYPE, 
  p_coef_calc_cuota OUT escala_porc_interes_cuo.coef_calc_cuota%TYPE, 
  p_porc_interes    OUT escala_porc_interes_cuo.porc_interes%TYPE 
) IS 
BEGIN 
  SELECT coef_calc_cuota, porc_interes 
  INTO p_coef_calc_cuota, p_porc_interes 
  FROM escala_porc_interes_cuo    
  WHERE cod_escala_pi = p_cod_escala_pi 
  AND nro_cuota       = p_nro_cuota; 
EXCEPTION 
  WHEN No_Data_Found THEN 
    Raise_Application_Error(-20999,'No existe coeficiente para la cant.cuotas: ' || p_nro_cuota); 
END; 
/
create or replace PROCEDURE pr_generar_plan  
(  
	p_importe_dc_cuota    IN OUT NUMBER,  
	p_nro_cuota           IN INTEGER,  
	p_total_credito       IN OUT NUMBER,  
	p_entrega_inicial     IN OUT NUMBER,  
	p_cant_cuotas         IN OUT INTEGER,  
	p_cuotas_iguales      IN INTEGER,  
	p_cod_moneda          IN VARCHAR2,  
	p_cod_moneda_nacional IN VARCHAR2,  
	p_fec_vencimiento     IN DATE,  
	p_nro_cuota_dc        IN OUT INTEGER,  
	p_fec_venc_cuota      IN OUT DATE,  
	p_importe_dc          IN NUMBER,  
	p_importe_interes     IN OUT NUMBER  
) IS  
	l_importe_credito NUMBER;  
	l_nro_cuota       INTEGER := 1;  
BEGIN  
	p_total_credito := CASE  
											 WHEN p_total_credito IS NULL THEN  
												0.0  
											 ELSE  
												p_total_credito  
										 END;  
	l_importe_credito := p_total_credito - p_entrega_inicial;  
	p_cant_cuotas := CASE  
										 WHEN p_cant_cuotas IS NULL THEN  
											1  
										 ELSE  
											p_cant_cuotas  
									 END;  
	IF p_cant_cuotas = 1 THEN  
		p_importe_dc_cuota := l_importe_credito;  
	ELSIF p_cant_cuotas > 0 THEN  
		p_importe_dc_cuota := l_importe_credito / p_cant_cuotas;  
		IF p_cod_moneda = p_cod_moneda_nacional THEN  
			p_importe_dc_cuota := fn_redondea_imp_cuota(p_importe_dc_cuota);  
		END IF;  
  
		l_importe_credito := l_importe_credito - (p_importe_dc_cuota * (l_nro_cuota - 1));  
	END IF;  
	p_nro_cuota_dc   := 0;  
	p_fec_venc_cuota := NULL;  
	p_total_credito  := p_importe_dc + p_importe_interes;  
END;  
/
create or replace PROCEDURE pr_buscar_lista_precio(  
  p_cod_tipo_mercaderia   IN VARCHAR2,  
  p_cant_cuota            IN OUT INTEGER,  
  p_entrega_inicial       IN OUT NUMBER,  
  p_inicial               IN INTEGER,  
  p_cod_lista_prec_vta    OUT VARCHAR2  
) IS                         
  l_cant_max_cuo_moto    INTEGER := 30;  
  l_cant_max_cuo_electro INTEGER := 18;  
BEGIN		  
	IF p_cod_tipo_mercaderia = 'MOTO' THEN  
		IF p_inicial = 1 THEN  
			p_cant_cuota := l_cant_max_cuo_moto;  
			p_entrega_inicial := 1000;  
    END IF;  
		IF p_cant_cuota <= 6 THEN  
			p_cod_lista_prec_vta := 'CM';  
		ELSIF p_cant_cuota = 30 AND p_entrega_inicial = 1000 THEN  
			p_cod_lista_prec_vta := 'EX';  
		ELSE   
			p_cod_lista_prec_vta := 'NM';  
		END IF;  
		IF p_cant_cuota > l_cant_max_cuo_moto THEN  
			Raise_Application_Error(-20999,'La cantidad máxima para una moto es de ' || l_cant_max_cuo_moto);  
		END IF;  
	ELSIF p_cod_tipo_mercaderia = 'ELEC' THEN  
		IF p_inicial = 1 THEN  
			p_cant_cuota := l_cant_max_cuo_electro;  
			p_entrega_inicial := 1000;  
		END IF;  
		IF p_cant_cuota <= 6 THEN  
			p_cod_lista_prec_vta := 'EC';  
		ELSIF p_cant_cuota > 6 AND p_cant_cuota <= 17 THEN  
			p_cod_lista_prec_vta := 'EL';  
		ELSIF p_cant_cuota > 17 AND p_entrega_inicial > 1000 THEN  
			p_cod_lista_prec_vta := 'EL';  
		ELSE  
			p_cod_lista_prec_vta := 'AL';  
		END IF;  
		IF p_cant_cuota > l_cant_max_cuo_electro THEN  
			Raise_Application_Error(-20999,'La cantidad máxima para un electro es de ' || l_cant_max_cuo_moto);  
		END IF;  
	ELSE  
		Raise_Application_Error(-20999,'Tipo de mercadería no válida...');  
	END IF;  
END;  
/
create or replace PROCEDURE pr_calcular_interes  
(  
	p_base_calculo_ori    IN NUMBER,  
	p_entrega_inicial     IN OUT NUMBER,  
	p_interes_calculado   IN INTEGER,  
	p_importe_interes     IN OUT NUMBER,  
	p_porc_interes        IN NUMBER,  
	p_cod_moneda_nacional IN VARCHAR2,  
	p_cod_moneda          IN VARCHAR2,  
	p_total_credito       IN OUT NUMBER,  
	p_importe_dc          IN NUMBER  
) IS  
	l_base_calculo NUMBER := p_base_calculo_ori - p_entrega_inicial;  
BEGIN  
	IF p_interes_calculado = 0 THEN  
		p_importe_interes := l_base_calculo * (1.0 + p_porc_interes / 100.0) - l_base_calculo;  
		IF p_cod_moneda_nacional = p_cod_moneda THEN  
			p_importe_interes := trunc(p_importe_interes + 0.5);  
		END IF;  
	END IF;  
  
	IF p_cod_moneda = p_cod_moneda_nacional THEN  
		p_importe_interes := fn_redondea_imp_cuota(p_importe_interes);  
	END IF;  
  
	p_total_credito := p_importe_dc + p_importe_interes;  
END;  
/
create or replace PROCEDURE pr_calcular_monto_cuota_articulo
(
	p_cod_articulo     IN VARCHAR2,
	p_cant_cuota       IN OUT INTEGER,
	p_entrega_inicial  IN OUT NUMBER,
	p_inicial          IN INTEGER,
	p_cod_app          IN VARCHAR2 DEFAULT NULL,
	p_importe_dc_cuota OUT NUMBER
) IS
	l_cuotas_iguales           INTEGER := 1;
	l_intervalo                INTEGER := 1;
	l_porc_intereses_adicional INTEGER := 0;
	l_cod_escala_pi            parametro.parametro%TYPE;
	l_total_credito            NUMBER := 0;
	l_importe_interes          NUMBER := 0;
	l_cod_lista_prec_vta       CHAR(2) := '';
	l_importe_dc               NUMBER := 0;
	l_cod_moneda_nacional      ingrid_control.cod_moneda_nacional%TYPE;
	l_fecha                    DATE;
	l_parametro_escala_pi      INTEGER := 0;
	l_cod_tipo_mercaderia      CHAR(4);
	l_param                    INTEGER;
	l_fec_vencimiento          DATE;
	l_cuotas                   INTEGER;
	l_porc_interes             NUMBER;
	l_coef_cal_cuota           NUMBER;
	l_base_calculo_orig        NUMBER;
	l_interes_calculado        INTEGER;
	l_regenera_cuotas          INTEGER;
	l_nro_cuota_dc             INTEGER;
	l_fec_venc_cuota           DATE;
BEGIN
	p_importe_dc_cuota := 0;
	pkg_ic.inicializar;
	l_cod_moneda_nacional := pkg_ic.g_cod_moneda_nacional;
	l_fecha               := pkg_ic.g_fec_ingrid;
	IF p_cod_articulo IS NULL THEN
		raise_application_error(-20999, 'Debe cargar el código de artículo.');
	END IF;
	IF p_inicial = 0 THEN
		IF p_cant_cuota <= 0 THEN
			raise_application_error(-20999, 'La cantidad de cuotas debe ser mayor a 0.');
		END IF;
		IF p_entrega_inicial <= 0 THEN
			raise_application_error(-20999, 'La entrega inicial debe ser mayor a 0.');
		END IF;
	END IF;
	l_cod_tipo_mercaderia := fn_obtener_cod_tipo_mercaderia(p_cod_articulo);
	pr_buscar_lista_precio(p_cod_tipo_mercaderia => l_cod_tipo_mercaderia,
												 p_cant_cuota          => p_cant_cuota,
												 p_entrega_inicial     => p_entrega_inicial,
												 p_inicial             => p_inicial,
												 p_cod_lista_prec_vta  => l_cod_lista_prec_vta);
	l_importe_dc := fn_obtener_importe_dc(p_cod_articulo        => p_cod_articulo,
																				p_cod_tipo_mercaderia => l_cod_tipo_mercaderia,
																				p_cod_lista_prec_vta  => l_cod_lista_prec_vta,
																				p_cant_cuota          => p_cant_cuota,
																				p_fecha               => l_fecha,
																				p_entrega_inicial     => p_entrega_inicial);
	IF l_cod_tipo_mercaderia = 'ELEC' AND p_cant_cuota = 18 THEN
		NULL;
	ELSIF l_cod_lista_prec_vta = 'EX' THEN
		NULL;
	ELSE
		IF p_cant_cuota <= 6 THEN
			p_importe_dc_cuota := fn_redondea_imp_cuota((l_importe_dc - p_entrega_inicial) / p_cant_cuota);
			RETURN;
		END IF;
	END IF;
	IF (l_cod_tipo_mercaderia = 'MOTO') THEN
		l_porc_intereses_adicional := 2;
	END IF;
	IF (l_cod_tipo_mercaderia = 'MOTO') THEN
		l_parametro_escala_pi := 40;
	ELSIF (l_cod_tipo_mercaderia = 'ELEC') THEN
		l_parametro_escala_pi := 43;
	ELSIF (l_cod_tipo_mercaderia = '4RUE') THEN
		l_parametro_escala_pi := 76;
	ELSE
		raise_application_error(-20999,
														'Verifíque, No existe cuotero para el tipo de mercaderia: ' + l_cod_tipo_mercaderia);
	END IF;
	l_param           := l_parametro_escala_pi;
	l_cod_escala_pi   := fn_obtener_parametro(l_parametro_escala_pi);
	l_fec_vencimiento := l_fecha + INTERVAL '1' MONTH;
	l_cuotas          := p_cant_cuota;
	pr_obtener_escala_por_interes(p_cod_escala_pi   => l_cod_escala_pi,
																p_nro_cuota       => p_cant_cuota,
																p_coef_calc_cuota => l_coef_cal_cuota,
																p_porc_interes    => l_porc_interes);
	l_porc_interes      := l_porc_interes + l_porc_intereses_adicional;
	l_base_calculo_orig := l_total_credito - l_importe_interes;
	l_interes_calculado := 0;
	l_regenera_cuotas   := 1;
	IF l_cod_tipo_mercaderia = 'ELEC' THEN
		l_importe_interes   := 0;
		l_base_calculo_orig := l_importe_dc - l_importe_interes;
		l_total_credito     := l_importe_dc;
	END IF;
	IF l_porc_interes > 0 THEN
		pr_calcular_interes(p_base_calculo_ori    => l_base_calculo_orig,
												p_entrega_inicial     => p_entrega_inicial,
												p_interes_calculado   => l_interes_calculado,
												p_importe_interes     => l_importe_interes,
												p_porc_interes        => l_porc_interes,
												p_cod_moneda_nacional => l_cod_moneda_nacional,
												p_cod_moneda          => l_cod_moneda_nacional,
												p_total_credito       => l_total_credito,
												p_importe_dc          => l_importe_dc);
	END IF;
	pr_plan_de_pago_coef(p_entrega_inicial     => p_entrega_inicial,
											 p_cant_cuotas         => p_cant_cuota,
											 p_total_credito       => l_total_credito,
											 p_cuotas_iguales      => l_cuotas_iguales,
											 p_importe_interes     => l_importe_interes,
											 p_coef_calc_cuota     => l_coef_cal_cuota,
											 p_regenera_cuotas     => l_regenera_cuotas,
											 p_importe_dc_cuota    => p_importe_dc_cuota,
											 p_cod_moneda          => l_cod_moneda_nacional,
											 p_cod_moneda_nacional => l_cod_moneda_nacional,
											 p_nro_cuota_dc        => l_nro_cuota_dc,
											 p_fec_venc_cuota      => l_fec_venc_cuota,
											 p_interes_calculado   => l_interes_calculado,
											 p_importe_dc          => l_importe_dc,
											 p_fec_vencimiento     => l_fec_vencimiento,
											 p_base_calculo_ori    => l_base_calculo_orig,
											 p_porc_interes        => l_porc_interes,
											 p_inicial             => p_inicial);
END;
/
create or replace PROCEDURE pr_calcular_monto_cuota_lista  
(  
	p_importe_dc          IN NUMBER,  
	p_cant_cuota          IN OUT INTEGER,  
	p_entrega_inicial     IN OUT NUMBER,  
	p_cod_tipo_mercaderia IN VARCHAR2,  
	p_importe_dc_cuota    OUT NUMBER  
) IS  
	l_total_credito            NUMBER := 0;  
	l_cuotas_iguales           INTEGER := 1;  
	l_intervalo                INTEGER := 1;  
	l_porc_intereses_adicional INTEGER := 0;  
	l_cod_escala_pi            NUMBER := '';  
	l_importe_interes          NUMBER := 0;  
	l_porc_interes             NUMBER;  
	l_parametro_escala_pi      INTEGER := 0;  
	l_param                    INTEGER;  
	l_fec_vencimiento          DATE;  
	l_coef_calc_cuota          NUMBER;  
	l_base_calculo_orig        NUMBER;  
	l_interes_calculado        INTEGER := 0;  
	l_regenera_cuotas          INTEGER := 1;  
	l_nro_cuota_dc             INTEGER;  
	l_fec_venc_cuota           DATE;  
BEGIN  
	pkg_ic.inicializar;  
  
	IF p_importe_dc < 1 THEN  
		raise_application_error(-20999, 'El monto que quiere calcular debe ser mayor a 0 (cero).');  
	END IF;  
  
	IF p_cant_cuota < 1 THEN  
		raise_application_error(-20999, 'La cantidad de cuotas debe ser mayor a 0.');  
	END IF;  
  
	IF p_entrega_inicial < 1 THEN  
		raise_application_error(-20999, 'La entrega inicial debe ser mayor a 0.');  
	END IF;  
  
	IF p_cant_cuota < 1 THEN  
		p_importe_dc_cuota := fn_redondea_imp_cuota((p_importe_dc - p_entrega_inicial) / p_cant_cuota);  
		RETURN;  
	END IF;  
  
	IF p_cod_tipo_mercaderia = 'MOTO' THEN  
		l_porc_intereses_adicional := 2;  
	END IF;  
  
	IF p_cod_tipo_mercaderia = 'MOTO' THEN  
		l_parametro_escala_pi := 40;  
	ELSIF p_cod_tipo_mercaderia = 'ELEC' THEN  
		l_parametro_escala_pi := 43;  
	ELSIF p_cod_tipo_mercaderia = '4RUE' THEN  
		l_parametro_escala_pi := 76;  
	ELSE  
		raise_application_error(-20999,  
														'Verifíque, No existe cuotero para el tipo de mercaderia: ' || p_cod_tipo_mercaderia);  
	END IF;  
  
	l_cod_escala_pi   := fn_obtener_parametro(l_parametro_escala_pi);  
	l_fec_vencimiento := pkg_ic.g_fec_ingrid + INTERVAL '1' MONTH;  
  
	pr_obtener_escala_por_interes(p_cod_escala_pi   => l_cod_escala_pi,  
																p_nro_cuota       => p_cant_cuota,  
																p_coef_calc_cuota => l_coef_calc_cuota,  
																p_porc_interes    => l_porc_interes);  
  
	l_porc_interes := l_porc_interes + l_porc_intereses_adicional;  
  
	l_base_calculo_orig := l_total_credito - l_importe_interes;  
  
	IF p_cod_tipo_mercaderia = 'ELEC' THEN  
		l_importe_interes   := 0;  
		l_base_calculo_orig := p_importe_dc - l_importe_interes;  
		l_total_credito     := p_importe_dc;  
	END IF;  
	IF l_porc_interes > 0 THEN  
		pr_calcular_interes(p_base_calculo_ori    => l_base_calculo_orig,  
												p_entrega_inicial     => p_entrega_inicial,  
												p_interes_calculado   => l_interes_calculado,  
												p_importe_interes     => l_importe_interes,  
												p_porc_interes        => l_porc_interes,  
												p_cod_moneda_nacional => pkg_ic.g_cod_moneda_nacional,  
												p_cod_moneda          => pkg_ic.g_cod_moneda_nacional,  
												p_total_credito       => l_total_credito,  
												p_importe_dc          => p_importe_dc);  
	END IF;  
  
	pr_plan_de_pago_coef(p_entrega_inicial     => p_entrega_inicial,  
											 p_cant_cuotas         => p_cant_cuota,  
											 p_total_credito       => l_total_credito,  
											 p_cuotas_iguales      => l_cuotas_iguales,  
											 p_importe_interes     => l_importe_interes,  
											 p_coef_calc_cuota     => l_coef_calc_cuota,  
											 p_regenera_cuotas     => l_regenera_cuotas,  
											 p_importe_dc_cuota    => p_importe_dc_cuota,  
											 p_cod_moneda          => pkg_ic.g_cod_moneda_nacional,  
											 p_cod_moneda_nacional => pkg_ic.g_cod_moneda_nacional,  
											 p_nro_cuota_dc        => l_nro_cuota_dc,  
											 p_fec_venc_cuota      => l_fec_venc_cuota,  
											 p_interes_calculado   => l_interes_calculado,  
											 p_importe_dc          => p_importe_dc,  
											 p_fec_vencimiento     => l_fec_vencimiento,  
											 p_base_calculo_ori    => l_base_calculo_orig,  
											 p_porc_interes        => l_porc_interes,  
											 p_inicial             => 0);  
END;  
/
create or replace PROCEDURE pr_plan_de_pago_coef  
(  
	p_entrega_inicial     IN OUT NUMBER,  
	p_cant_cuotas         IN OUT INTEGER,  
	p_total_credito       IN OUT NUMBER,  
	p_cuotas_iguales      IN INTEGER,  
	p_importe_interes     IN OUT NUMBER,  
	p_coef_calc_cuota     IN FLOAT,  
	p_regenera_cuotas     IN OUT INTEGER,  
	p_importe_dc_cuota    IN OUT NUMBER,  
	p_cod_moneda          IN VARCHAR2,  
	p_cod_moneda_nacional IN VARCHAR2,  
	p_nro_cuota_dc        IN OUT INTEGER,  
	p_fec_venc_cuota      IN OUT DATE,  
	p_interes_calculado   IN OUT INTEGER,  
	p_importe_dc          IN NUMBER,  
	p_fec_vencimiento     IN DATE,  
	p_base_calculo_ori    IN NUMBER,  
	p_porc_interes        IN FLOAT,  
	p_inicial             IN INTEGER  
) IS  
	l_cuotas             INTEGER;  
	l_neto_sin_interes   FLOAT;  
	l_coef_ei            FLOAT;  
	l_base_calculo_cuota FLOAT;  
	l_entrega_default    NUMBER;  
BEGIN  
	l_cuotas := CASE  
								WHEN p_cant_cuotas IS NULL THEN  
								 0  
								ELSE  
								 p_cant_cuotas  
							END;  
	p_total_credito := CASE  
											 WHEN p_total_credito IS NULL THEN  
												0.0  
											 ELSE  
												p_total_credito  
										 END;  
	l_neto_sin_interes := p_total_credito - p_importe_interes;  
	IF l_cuotas > 1 AND p_cuotas_iguales != 0 AND NOT p_coef_calc_cuota <= 0.0 THEN  
		p_regenera_cuotas := 0;  
  
		l_coef_ei            := 1 / (l_cuotas + 1);  
		l_base_calculo_cuota := l_neto_sin_interes - l_neto_sin_interes * l_coef_ei;  
		l_entrega_default    := fn_redondea_imp_cuota(l_base_calculo_cuota * p_coef_calc_cuota);  
  
		IF l_entrega_default = p_entrega_inicial THEN  
			p_importe_dc_cuota := l_entrega_default;  
		ELSE  
			p_importe_dc_cuota := (l_neto_sin_interes - p_entrega_inicial) * p_coef_calc_cuota;  
		END IF;  
  
		IF p_cod_moneda = p_cod_moneda_nacional THEN  
			p_importe_dc_cuota := fn_redondea_imp_cuota(p_importe_dc_cuota);  
		END IF;  
  
		IF p_inicial = 1 THEN  
			p_importe_interes := (p_importe_dc_cuota * (l_cuotas + 1)) - l_neto_sin_interes;  
		ELSE  
			p_importe_interes := (p_importe_dc_cuota * l_cuotas) + p_entrega_inicial - l_neto_sin_interes;  
		END IF;  
  
		p_nro_cuota_dc      := 0;  
		p_fec_venc_cuota    := NULL;  
		p_interes_calculado := 1;  
  
		pr_calcular_interes(p_base_calculo_ori    => p_base_calculo_ori,  
												p_entrega_inicial     => p_entrega_inicial,  
												p_interes_calculado   => p_interes_calculado,  
												p_importe_interes     => p_importe_interes,  
												p_porc_interes        => p_porc_interes,  
												p_cod_moneda_nacional => p_cod_moneda_nacional,  
												p_cod_moneda          => p_cod_moneda,  
												p_total_credito       => p_total_credito,  
												p_importe_dc          => p_importe_dc);  
	ELSE  
		pr_generar_plan(p_importe_dc_cuota    => p_importe_dc_cuota,  
										p_nro_cuota           => 1,  
										p_total_credito       => p_total_credito,  
										p_entrega_inicial     => p_entrega_inicial,  
										p_cant_cuotas         => p_cant_cuotas,  
										p_cuotas_iguales      => p_cuotas_iguales,  
										p_cod_moneda          => p_cod_moneda,  
										p_cod_moneda_nacional => p_cod_moneda_nacional,  
										p_fec_vencimiento     => p_fec_vencimiento,  
										p_nro_cuota_dc        => p_nro_cuota_dc,  
										p_fec_venc_cuota      => p_fec_venc_cuota,  
										p_importe_dc          => p_importe_dc,  
										p_importe_interes     => p_importe_interes);  
	END IF;  
END;  
/
--------------------------------------------
create or replace FUNCTION fn_redondea_imp_cuota(p_valor NUMBER) RETURN NUMBER IS  
	l_valor NUMBER;  
BEGIN  
	l_valor := trunc(p_valor + 0.5);  
	IF l_valor > 1000.0 AND l_valor <= 10000.0 THEN  
		l_valor := (trunc((l_valor + 50.0) / 100.0) * 100);  
	ELSIF l_valor > 10000.0 THEN  
		l_valor := (trunc((l_valor + 500.0) / 1000.0) * 1000);  
	END IF;  
	RETURN l_valor;  
END;  
/
create or replace FUNCTION fn_buscar_lista_precio(  
  p_cod_tipo_mercaderia   IN VARCHAR2,  
  p_cant_cuota            IN INTEGER,  
  p_entrega_inicial       IN NUMBER,  
  p_inicial               IN INTEGER    
) RETURN VARCHAR2 IS  
  l_cant_cuota           INTEGER := p_cant_cuota;  
  l_entrega_inicial      NUMBER := p_entrega_inicial;  
  l_cod_lista_prec_vta   CHAR(2);  
  l_cant_max_cuo_moto    INTEGER := 30;  
  l_cant_max_cuo_electro INTEGER := 18;  
BEGIN  
	IF p_cod_tipo_mercaderia = 'MOTO' THEN  
		IF p_inicial = 1 THEN  
			l_cant_cuota := l_cant_max_cuo_moto;  
			l_entrega_inicial := 1000;  
    END IF;  
		IF l_cant_cuota <= 6 THEN  
			l_cod_lista_prec_vta := 'CM';  
		ELSIF l_cant_cuota = 30 AND l_entrega_inicial = 1000 THEN  
			l_cod_lista_prec_vta := 'EX';  
		ELSE  
			l_cod_lista_prec_vta := 'NM';  
		END IF;  
		IF l_cant_cuota > l_cant_max_cuo_moto THEN  
			Raise_Application_Error(-20999,'La cantidad máxima para una moto es de ' || l_cant_max_cuo_moto);  
		END IF;  
	ELSIF p_cod_tipo_mercaderia = 'ELEC' THEN  
		IF p_inicial = 1 THEN  
			l_cant_cuota := l_cant_max_cuo_electro;  
			l_entrega_inicial := 1000;  
		END IF;  
		IF l_cant_cuota <= 6 THEN  
			l_cod_lista_prec_vta := 'EC';  
		ELSIF l_cant_cuota > 6 AND l_cant_cuota <= 17 THEN  
			l_cod_lista_prec_vta := 'EL';  
		ELSIF l_cant_cuota > 17 AND l_entrega_inicial > 1000 THEN  
			l_cod_lista_prec_vta := 'EL';  
		ELSE  
			l_cod_lista_prec_vta := 'AL';  
		END IF;  
		IF l_cant_cuota > l_cant_max_cuo_electro THEN  
			Raise_Application_Error(-20999,'La cantidad máxima para un electro es de ' || l_cant_max_cuo_moto);  
		END IF;  
	ELSE  
		Raise_Application_Error(-20999,'Tipo de mercadería no válida...');  
	END IF;  
  RETURN l_cod_lista_prec_vta;  
END;  
/
create or replace FUNCTION fn_calcular_monto_cuota_articulo
(
	p_cod_articulo     VARCHAR2,
	p_cant_cuota       INTEGER,
	p_entrega_inicial  NUMBER,
	p_inicial          INTEGER,
	p_cod_app          VARCHAR2 DEFAULT NULL
) RETURN NUMBER IS
	l_entrega_inicial          NUMBER := p_entrega_inicial;
  l_cant_cuota               INTEGER := p_cant_cuota;
  l_cuotas_iguales           INTEGER := 1;
	l_intervalo                INTEGER := 1;
	l_porc_intereses_adicional INTEGER := 0;
	l_cod_escala_pi            parametro.parametro%TYPE;
	l_total_credito            NUMBER := 0;
	l_importe_interes          NUMBER := 0;
	l_cod_lista_prec_vta       CHAR(2) := '';
	l_importe_dc               NUMBER := 0;
	l_cod_moneda_nacional      ingrid_control.cod_moneda_nacional%TYPE;
	l_fecha                    DATE;
	l_parametro_escala_pi      INTEGER := 0;
	l_cod_tipo_mercaderia      CHAR(4);
	l_fec_vencimiento          DATE;
	l_porc_interes             NUMBER;
	l_coef_cal_cuota           NUMBER;
	l_base_calculo_orig        NUMBER;
	l_interes_calculado        INTEGER;
	l_regenera_cuotas          INTEGER;
	l_nro_cuota_dc             INTEGER;
	l_fec_venc_cuota           DATE;
  l_importe_dc_cuota         NUMBER;
BEGIN
	l_importe_dc_cuota := 0;
	pkg_ic.inicializar;
	l_cod_moneda_nacional := pkg_ic.g_cod_moneda_nacional;
	l_fecha               := pkg_ic.g_fec_ingrid;
	IF p_inicial = 0 THEN
		IF l_cant_cuota <= 0 THEN
			raise_application_error(-20999, 'La cantidad de cuotas debe ser mayor a 0.');
		END IF;
		IF l_entrega_inicial <= 0 THEN
			raise_application_error(-20999, 'La entrega inicial debe ser mayor a 0.');
		END IF;
	END IF;
	l_cod_tipo_mercaderia := fn_obtener_cod_tipo_mercaderia(p_cod_articulo);
	l_cod_lista_prec_vta := fn_buscar_lista_precio(p_cod_tipo_mercaderia => l_cod_tipo_mercaderia,
												                         p_cant_cuota          => l_cant_cuota,
												                         p_entrega_inicial     => l_entrega_inicial,
												                         p_inicial             => p_inicial);
	l_importe_dc := fn_obtener_importe_dc(p_cod_articulo        => p_cod_articulo,
																				p_cod_tipo_mercaderia => l_cod_tipo_mercaderia,
																				p_cod_lista_prec_vta  => l_cod_lista_prec_vta,
																				p_cant_cuota          => l_cant_cuota,
																				p_fecha               => l_fecha,
																				p_entrega_inicial     => l_entrega_inicial);
	IF l_cod_tipo_mercaderia = 'ELEC' AND l_cant_cuota = 18 THEN
		NULL;
	ELSIF l_cod_lista_prec_vta = 'EX' THEN
		NULL;
	ELSE
		IF l_cant_cuota <= 6 THEN
			l_importe_dc_cuota := fn_redondea_imp_cuota((l_importe_dc - l_entrega_inicial) / l_cant_cuota);
			RETURN l_importe_dc_cuota;
		END IF;
	END IF;
	IF (l_cod_tipo_mercaderia = 'MOTO') THEN
		l_porc_intereses_adicional := 2;
	END IF;
	IF (l_cod_tipo_mercaderia = 'MOTO') THEN
		l_parametro_escala_pi := 40;
	ELSIF (l_cod_tipo_mercaderia = 'ELEC') THEN
		l_parametro_escala_pi := 43;
	ELSIF (l_cod_tipo_mercaderia = '4RUE') THEN
		l_parametro_escala_pi := 76;
	ELSE
		raise_application_error(-20999,
														'Verifíque, No existe cuotero para el tipo de mercaderia: ' + l_cod_tipo_mercaderia);
	END IF;
	l_cod_escala_pi   := fn_obtener_parametro(l_parametro_escala_pi);
	l_fec_vencimiento := add_months(l_fecha, l_intervalo);
	pr_obtener_escala_por_interes(p_cod_escala_pi   => l_cod_escala_pi,
																p_nro_cuota       => l_cant_cuota,
																p_coef_calc_cuota => l_coef_cal_cuota,
																p_porc_interes    => l_porc_interes);
	l_porc_interes      := l_porc_interes + l_porc_intereses_adicional;
	l_base_calculo_orig := l_total_credito - l_importe_interes;
	l_interes_calculado := 0;
	l_regenera_cuotas   := 1;
	IF l_cod_tipo_mercaderia = 'ELEC' THEN
		l_importe_interes   := 0;
		l_base_calculo_orig := l_importe_dc - l_importe_interes;
		l_total_credito     := l_importe_dc;
	END IF;
	IF l_porc_interes > 0 THEN
		pr_calcular_interes(p_base_calculo_ori    => l_base_calculo_orig,
												p_entrega_inicial     => l_entrega_inicial,
												p_interes_calculado   => l_interes_calculado,
												p_importe_interes     => l_importe_interes,
												p_porc_interes        => l_porc_interes,
												p_cod_moneda_nacional => l_cod_moneda_nacional,
												p_cod_moneda          => l_cod_moneda_nacional,
												p_total_credito       => l_total_credito,
												p_importe_dc          => l_importe_dc);
	END IF;
	pr_plan_de_pago_coef(p_entrega_inicial     => l_entrega_inicial,
											 p_cant_cuotas         => l_cant_cuota,
											 p_total_credito       => l_total_credito,
											 p_cuotas_iguales      => l_cuotas_iguales,
											 p_importe_interes     => l_importe_interes,
											 p_coef_calc_cuota     => l_coef_cal_cuota,
											 p_regenera_cuotas     => l_regenera_cuotas,
											 p_importe_dc_cuota    => l_importe_dc_cuota,
											 p_cod_moneda          => l_cod_moneda_nacional,
											 p_cod_moneda_nacional => l_cod_moneda_nacional,
											 p_nro_cuota_dc        => l_nro_cuota_dc,
											 p_fec_venc_cuota      => l_fec_venc_cuota,
											 p_interes_calculado   => l_interes_calculado,
											 p_importe_dc          => l_importe_dc,
											 p_fec_vencimiento     => l_fec_vencimiento,
											 p_base_calculo_ori    => l_base_calculo_orig,
											 p_porc_interes        => l_porc_interes,
											 p_inicial             => p_inicial);
  RETURN l_importe_dc_cuota;
END;
/
create or replace FUNCTION fn_calcular_monto_cuota_lista  
(  
	p_importe_dc          NUMBER,  
	p_cant_cuota          INTEGER,  
	p_entrega_inicial     NUMBER,  
	p_cod_tipo_mercaderia VARCHAR2  
) RETURN NUMBER IS  
	l_entrega_inicial          NUMBER := p_entrega_inicial;  
	l_cant_cuota               INTEGER := p_cant_cuota;  
	l_cod_moneda_nacional      ingrid_control.cod_moneda_nacional%TYPE;  
	l_fecha                    DATE;  
	l_importe_dc_cuota         NUMBER := 0;  
	l_cuotas_iguales           INTEGER := 1;  
	l_intervalo                INTEGER := 1;  
	l_porc_intereses_adicional INTEGER := 0;  
	l_cod_escala_pi            parametro.parametro%TYPE := '';  
	l_total_credito            NUMBER := 0;  
	l_importe_interes          NUMBER := 0;  
	l_parametro_escala_pi      INTEGER := 0;  
	l_fec_vencimiento          DATE;  
	l_porc_interes             NUMBER;  
	l_base_calculo_orig        NUMBER;  
	l_interes_calculado        INTEGER;  
	l_regenera_cuotas          INTEGER;  
	l_coef_cal_cuota           NUMBER;  
	l_nro_cuota_dc             INTEGER;  
	l_fec_venc_cuota           DATE;  
BEGIN  
	pkg_ic.inicializar;  
	l_cod_moneda_nacional := pkg_ic.g_cod_moneda_nacional;  
	l_fecha               := pkg_ic.g_fec_ingrid;  
  
	IF (p_importe_dc <= 0) THEN  
		raise_application_error(-20999, 'El monto que quiere calcular debe ser mayor a 0 (cero).');  
	END IF;  
	IF (l_cant_cuota <= 0) THEN  
		raise_application_error(-20999, 'La cantidad de cuotas debe ser mayor a 0.');  
	END IF;  
	IF (l_entrega_inicial <= 0) THEN  
		raise_application_error(-20999, 'La entrega inicial debe ser mayor a 0.');  
	END IF;  
  
	IF (l_cant_cuota <= 6) THEN  
		l_importe_dc_cuota := fn_redondea_imp_cuota((p_importe_dc - l_entrega_inicial) / l_cant_cuota);  
		RETURN l_importe_dc_cuota;  
	END IF;  
  
	IF (p_cod_tipo_mercaderia = ('MOTO')) THEN  
		l_porc_intereses_adicional := 2;  
	END IF;  
  
	IF (p_cod_tipo_mercaderia = ('MOTO')) THEN  
		l_parametro_escala_pi := 40;  
	ELSIF (p_cod_tipo_mercaderia = ('ELEC')) THEN  
		l_parametro_escala_pi := 43;  
	ELSIF (p_cod_tipo_mercaderia = ('4RUE')) THEN  
		l_parametro_escala_pi := 76;  
	ELSE  
		raise_application_error(-20999,  
														'Verifíque, No existe cuotero para el tipo de mercaderia: ' || p_cod_tipo_mercaderia);  
	END IF;  
  
	l_cod_escala_pi   := fn_obtener_parametro(p_nro_parametro => l_parametro_escala_pi);  
	l_fec_vencimiento := add_months(l_fecha, l_intervalo);  
  
	pr_obtener_escala_por_interes(p_cod_escala_pi   => l_cod_escala_pi,  
																p_nro_cuota       => l_cant_cuota,  
																p_coef_calc_cuota => l_coef_cal_cuota,  
																p_porc_interes    => l_porc_interes);  
  
	l_porc_interes      := l_porc_interes + l_porc_intereses_adicional;  
	l_base_calculo_orig := l_total_credito - l_importe_interes;  
	l_interes_calculado := 0;  
	l_regenera_cuotas   := 1;  
  
	IF (p_cod_tipo_mercaderia = ('ELEC')) THEN  
		l_importe_interes   := 0;  
		l_base_calculo_orig := p_importe_dc - l_importe_interes;  
		l_total_credito     := p_importe_dc;  
	END IF;  
  
	IF (l_porc_interes > 0) THEN  
		pr_calcular_interes(p_base_calculo_ori    => l_base_calculo_orig,  
												p_entrega_inicial     => l_entrega_inicial,  
												p_interes_calculado   => l_interes_calculado,  
												p_importe_interes     => l_importe_interes,  
												p_porc_interes        => l_porc_interes,  
												p_cod_moneda_nacional => l_cod_moneda_nacional,  
												p_cod_moneda          => l_cod_moneda_nacional,  
												p_total_credito       => l_total_credito,  
												p_importe_dc          => p_importe_dc);  
	END IF;  
  
	pr_plan_de_pago_coef(p_entrega_inicial     => l_entrega_inicial,  
											 p_cant_cuotas         => l_cant_cuota,  
											 p_total_credito       => l_total_credito,  
											 p_cuotas_iguales      => l_cuotas_iguales,  
											 p_importe_interes     => l_importe_interes,  
											 p_coef_calc_cuota     => l_coef_cal_cuota,  
											 p_regenera_cuotas     => l_regenera_cuotas,  
											 p_importe_dc_cuota    => l_importe_dc_cuota,  
											 p_cod_moneda          => l_cod_moneda_nacional,  
											 p_cod_moneda_nacional => l_cod_moneda_nacional,  
											 p_nro_cuota_dc        => l_nro_cuota_dc,  
											 p_fec_venc_cuota      => l_fec_venc_cuota,  
											 p_interes_calculado   => l_interes_calculado,  
											 p_importe_dc          => p_importe_dc,  
											 p_fec_vencimiento     => l_fec_vencimiento,  
											 p_base_calculo_ori    => l_base_calculo_orig,  
											 p_porc_interes        => l_porc_interes,  
											 p_inicial             => 0);  
	RETURN l_importe_dc_cuota;  
END;  
/
create or replace FUNCTION fn_redondea(p_precio NUMBER) RETURN NUMBER IS  
	l_precio NUMBER;  
BEGIN  
	IF p_precio IS NULL THEN  
		l_precio := 0;  
	END IF;  
	IF p_precio > 0 AND p_precio <= 500 THEN  
		/*   1 */  
		l_precio := trunc((p_precio + 0.99) / 1);  
	ELSIF p_precio > 500 AND p_precio <= 1000 THEN  
		/*  10 */  
		l_precio := trunc((p_precio + 9.99) / 10) * 10;  
	ELSIF p_precio > 1000 AND p_precio <= 2000 THEN  
		/*  25 */  
		l_precio := trunc((p_precio + 24.99) / 25) * 25;  
	ELSIF p_precio > 2000 AND p_precio <= 5000 THEN  
		/*  50 */  
		l_precio := trunc((p_precio + 49.99) / 50) * 50;  
	ELSIF p_precio > 5000 AND p_precio <= 100000 THEN  
		/* 100 */  
		l_precio := trunc((p_precio + 99.99) / 100) * 100;  
	ELSIF p_precio > 100000 THEN  
		/* 1000 */  
		l_precio := trunc((p_precio + 999.99) / 1000) * 1000;  
	END IF;  
	RETURN l_precio;  
END;  
/
create or replace FUNCTION fn_obtener_articulo_con_precio_vta(p_cod_articulo       articulos.cod_articulo%TYPE,
																															p_fecha              DATE,
																															p_cod_lista_prec_vta articulos_prec_vta.cod_lista_prec_vta%TYPE)
	RETURN articulo_con_prec_vta_type IS
	l_articulo articulo_con_prec_vta_type;
BEGIN
	SELECT articulo_con_prec_vta_type(a.cod_familia, a.cod_grupo, a.cod_subgrupo, a.descripcion, a.iva_exento, a.vehiculo,
																		a.porc_iva, a.porc_aplic_iva, a.procedencia,
																		CASE
																			 WHEN a.iva_exento = 1 THEN
																				('EXENTO')
																			 ELSE
																				('GRAVADO')
																		 END, b.cod_tipo_mercaderia, c.cod_lista_prec_vta, MAX(c.nro_orden))
	INTO l_articulo
	FROM articulos          a,
			 familias           b,
			 articulos_prec_vta c
	WHERE a.cod_articulo = p_cod_articulo
	AND a.cod_familia = b.cod_familia
	AND a.cod_articulo = c.cod_articulo
	AND c.fec_inicio_vigencia <= p_fecha
	AND c.fec_fin_vigencia >= p_fecha
	AND c.cod_lista_prec_vta = p_cod_lista_prec_vta
	GROUP BY a.cod_familia,
					 a.cod_grupo,
					 a.cod_subgrupo,
					 a.descripcion,
					 a.iva_exento,
					 a.vehiculo,
					 a.porc_iva,
					 a.porc_aplic_iva,
					 a.procedencia,
					 CASE
						 WHEN a.iva_exento = 1 THEN
							('EXENTO')
						 ELSE
							('GRAVADO')
					 END,
					 b.cod_tipo_mercaderia,
					 c.cod_lista_prec_vta;
	RETURN l_articulo;
EXCEPTION
	WHEN No_Data_Found THEN
		RETURN l_articulo;
END;
/
create or replace FUNCTION fn_obtener_cod_tipo_mercaderia ( 
  p_cod_articulo articulos.cod_articulo%TYPE 
) RETURN tipo_mercaderia.cod_tipo_mercaderia%TYPE IS 
  l_cod_tipo_mercaderia tipo_mercaderia.cod_tipo_mercaderia%TYPE; 
BEGIN 
  SELECT trim(c.cod_tipo_mercaderia) 
  INTO l_cod_tipo_mercaderia 
  FROM articulos a, familias b, tipo_mercaderia c 
  WHERE a.cod_familia = b.cod_familia 
  AND b.cod_tipo_mercaderia = c.cod_tipo_mercaderia 
  AND a.cod_articulo = p_cod_articulo; 
  RETURN l_cod_tipo_mercaderia; 
EXCEPTION 
  WHEN No_Data_Found THEN 
    Raise_Application_Error(-20999,'No se encontró tipo de mercadería del artículo ' || p_cod_articulo); 
END; 
/
create or replace FUNCTION fn_obtener_importe_dc(p_cod_articulo        VARCHAR2,
																								 p_cod_tipo_mercaderia VARCHAR2,
																								 p_cod_lista_prec_vta  VARCHAR2,
																								 p_cant_cuota          INTEGER,
																								 p_fecha               DATE,
																								 p_entrega_inicial     NUMBER) RETURN NUMBER IS
	l_precio_vta_ml_sin_iva NUMBER;
	l_importe_dc            NUMBER := 0;
	l_importe_dc_el         NUMBER;
	l_importe_dc_al         NUMBER;
	l_importe_dc_ex         NUMBER;
	l_importe_dc_nm         NUMBER;
	l_articulo_info_el      articulo_con_prec_vta_type;
	l_articulo_info_al      articulo_con_prec_vta_type;
	l_articulo_info_ex      articulo_con_prec_vta_type;
	l_articulo_info_nm      articulo_con_prec_vta_type;
	l_articulo_info         articulo_con_prec_vta_type;
	v_costo_unit            articulos_suc.costo_unit%TYPE;
	v_costo_unit_mr         articulos_suc.costo_unit_mr%TYPE;
	v_cotiz_venta           cotizaciones_monedas.cotiz_venta%TYPE; --f4
	v_coef_prec_vta         coef_calc_prec_vta.coeficiente%TYPE;
	v_precio_vta_mr_sin_iva NUMBER; --f8
	v_precio_vta_mr_con_iva NUMBER; --f8
	v_precio_vta_ml_con_iva NUMBER; --money,
	v_coef_mr               NUMBER; --f8
	v_coef_ml               NUMBER; --f4
	v_coef_mr_real          NUMBER; --f4
BEGIN
	IF p_cod_tipo_mercaderia = 'ELEC' AND p_cant_cuota = 18 AND p_entrega_inicial = 1000 THEN
		l_importe_dc_el    := 0;
		l_importe_dc_al    := 0;
		l_articulo_info_el := fn_obtener_articulo_con_precio_vta(p_cod_articulo, p_fecha, 'EL');
		IF l_articulo_info_el IS NOT NULL THEN
			pkg_calprec.call(p_cod_articulo => p_cod_articulo, p_porc_iva => l_articulo_info_el.porc_iva,
											 p_porc_aplic_iva => l_articulo_info_el.porc_aplic_iva,
											 p_iva_exento => l_articulo_info_el.iva_exento, p_vehiculo => l_articulo_info_el.vehiculo,
											 p_cod_lista_prec_vta => l_articulo_info_el.cod_lista_prec_vta, p_fec_vigencia => p_fecha,
											 p_selec_precio => 1, p_precio_vta_ml_sin_iva => l_precio_vta_ml_sin_iva,
											 p_precio_vta_ml_con_iva => l_importe_dc_el, p_costo_unit => v_costo_unit,
											 p_costo_unit_mr => v_costo_unit_mr, p_cotiz_venta => v_cotiz_venta,
											 p_coef_prec_vta => v_coef_prec_vta, p_precio_vta_mr_sin_iva => v_precio_vta_mr_sin_iva,
											 p_precio_vta_mr_con_iva => v_precio_vta_mr_con_iva, p_coef_mr => v_coef_mr,
											 p_coef_ml => v_coef_ml, p_coef_mr_real => v_coef_mr_real);
		END IF;
		l_articulo_info_al := fn_obtener_articulo_con_precio_vta(p_cod_articulo, p_fecha, 'AL');
		IF l_articulo_info_al IS NOT NULL THEN
			pkg_calprec.call(p_cod_articulo => p_cod_articulo, p_porc_iva => l_articulo_info_al.porc_iva,
											 p_porc_aplic_iva => l_articulo_info_al.porc_aplic_iva,
											 p_iva_exento => l_articulo_info_al.iva_exento, p_vehiculo => l_articulo_info_al.vehiculo,
											 p_cod_lista_prec_vta => l_articulo_info_al.cod_lista_prec_vta, p_fec_vigencia => p_fecha,
											 p_selec_precio => 1, p_precio_vta_ml_sin_iva => l_precio_vta_ml_sin_iva,
											 p_precio_vta_ml_con_iva => l_importe_dc_al, p_costo_unit => v_costo_unit,
											 p_costo_unit_mr => v_costo_unit_mr, p_cotiz_venta => v_cotiz_venta,
											 p_coef_prec_vta => v_coef_prec_vta, p_precio_vta_mr_sin_iva => v_precio_vta_mr_sin_iva,
											 p_precio_vta_mr_con_iva => v_precio_vta_mr_con_iva, p_coef_mr => v_coef_mr,
											 p_coef_ml => v_coef_ml, p_coef_mr_real => v_coef_mr_real);
		END IF;
		IF l_importe_dc_el <= l_importe_dc_al THEN
			l_importe_dc := l_importe_dc_el;
		ELSIF l_importe_dc_al > 0 THEN
			l_importe_dc := l_importe_dc_al;
		ELSE
			l_importe_dc := l_importe_dc_el;
		END IF;
	ELSIF p_cod_lista_prec_vta = 'EX' THEN
		l_importe_dc_ex := 0;
		l_importe_dc_nm := 0;
		l_articulo_info_ex := fn_obtener_articulo_con_precio_vta(p_cod_articulo, p_fecha, 'EX');
		IF l_articulo_info_ex IS NOT NULL THEN
			pkg_calprec.call(p_cod_articulo => p_cod_articulo, p_porc_iva => l_articulo_info_ex.porc_iva,
											 p_porc_aplic_iva => l_articulo_info_ex.porc_aplic_iva,
											 p_iva_exento => l_articulo_info_ex.iva_exento, p_vehiculo => l_articulo_info_ex.vehiculo,
											 p_cod_lista_prec_vta => l_articulo_info_ex.cod_lista_prec_vta, p_fec_vigencia => p_fecha,
											 p_selec_precio => 1, p_precio_vta_ml_sin_iva => l_precio_vta_ml_sin_iva,
											 p_precio_vta_ml_con_iva => l_importe_dc_ex, p_costo_unit => v_costo_unit,
											 p_costo_unit_mr => v_costo_unit_mr, p_cotiz_venta => v_cotiz_venta,
											 p_coef_prec_vta => v_coef_prec_vta, p_precio_vta_mr_sin_iva => v_precio_vta_mr_sin_iva,
											 p_precio_vta_mr_con_iva => v_precio_vta_mr_con_iva, p_coef_mr => v_coef_mr,
											 p_coef_ml => v_coef_ml, p_coef_mr_real => v_coef_mr_real);
		END IF;
		l_articulo_info_nm := fn_obtener_articulo_con_precio_vta(p_cod_articulo, p_fecha, 'NM');
		IF l_articulo_info_nm IS NOT NULL THEN
			pkg_calprec.call(p_cod_articulo => p_cod_articulo, p_porc_iva => l_articulo_info_nm.porc_iva,
											 p_porc_aplic_iva => l_articulo_info_nm.porc_aplic_iva,
											 p_iva_exento => l_articulo_info_nm.iva_exento, p_vehiculo => l_articulo_info_nm.vehiculo,
											 p_cod_lista_prec_vta => l_articulo_info_nm.cod_lista_prec_vta, p_fec_vigencia => p_fecha,
											 p_selec_precio => 1, p_precio_vta_ml_sin_iva => l_precio_vta_ml_sin_iva,
											 p_precio_vta_ml_con_iva => l_importe_dc_nm, p_costo_unit => v_costo_unit,
											 p_costo_unit_mr => v_costo_unit_mr, p_cotiz_venta => v_cotiz_venta,
											 p_coef_prec_vta => v_coef_prec_vta, p_precio_vta_mr_sin_iva => v_precio_vta_mr_sin_iva,
											 p_precio_vta_mr_con_iva => v_precio_vta_mr_con_iva, p_coef_mr => v_coef_mr,
											 p_coef_ml => v_coef_ml, p_coef_mr_real => v_coef_mr_real);
		END IF;
		IF l_importe_dc_ex <= l_importe_dc_nm THEN
			l_importe_dc := l_importe_dc_ex;
		ELSIF l_importe_dc_ex > 0 THEN
			l_importe_dc := l_importe_dc_ex;
		ELSE
			l_importe_dc := l_importe_dc_nm;
		END IF;
	ELSE
		l_articulo_info := fn_obtener_articulo_con_precio_vta(p_cod_articulo, p_fecha, p_cod_lista_prec_vta);
		IF l_articulo_info IS NULL THEN
      ROLLBACK;
			raise_application_error(-20999,
															'El articulo ' || p_cod_articulo || ' no tiene lista de precio ' || p_cod_lista_prec_vta ||
															 ' vigente.');
		END IF;
		pkg_calprec.call(p_cod_articulo => p_cod_articulo, p_porc_iva => l_articulo_info.porc_iva,
										 p_porc_aplic_iva => l_articulo_info.porc_aplic_iva, p_iva_exento => l_articulo_info.iva_exento,
										 p_vehiculo => l_articulo_info.vehiculo, p_cod_lista_prec_vta => l_articulo_info.cod_lista_prec_vta,
										 p_fec_vigencia => p_fecha, p_selec_precio => 1, p_precio_vta_ml_sin_iva => l_precio_vta_ml_sin_iva,
										 p_precio_vta_ml_con_iva => l_importe_dc, p_costo_unit => v_costo_unit,
										 p_costo_unit_mr => v_costo_unit_mr, p_cotiz_venta => v_cotiz_venta,
										 p_coef_prec_vta => v_coef_prec_vta, p_precio_vta_mr_sin_iva => v_precio_vta_mr_sin_iva,
										 p_precio_vta_mr_con_iva => v_precio_vta_mr_con_iva, p_coef_mr => v_coef_mr, p_coef_ml => v_coef_ml,
										 p_coef_mr_real => v_coef_mr_real);
	END IF;
  
	RETURN l_importe_dc;
/* EXCEPTION 
   WHEN OTHERS THEN 
     ROLLBACK;*/
END;
/
create or replace FUNCTION fn_obtener_parametro( 
  p_nro_parametro parametro.nro_parametro%TYPE 
) RETURN parametro.parametro%TYPE IS 
  l_parametro parametro.parametro%TYPE; 
BEGIN 
  SELECT trim(parametro) 
  INTO l_parametro 
  FROM parametro 
  WHERE nro_parametro = p_nro_parametro; 
  RETURN l_parametro; 
END; 
/
---------------------------------------
create or replace FUNCTION to_epoch(
  p_timestamp TIMESTAMP DEFAULT systimestamp
) RETURN NUMBER AS
BEGIN
  RETURN Floor((cast(sys_extract_utc(p_timestamp) as date) - TO_DATE('1970-01-01 00:00:00','YYYY-MM-DD HH24:MI:SS')) * 86400);
END;
/
-----------------------------------------
create or replace PROCEDURE pr_msi_mensaje(p_de                    IN OUT CHAR,
                                           p_para                  IN OUT CHAR,
                                           p_tipo_mensaje          IN OUT INTEGER,
                                           p_grupo_id              IN OUT INTEGER,
                                           p_mensaje               IN OUT VARCHAR2,
                                           p_estado_msj            IN OUT INTEGER,
                                           p_fec_alta_disp         IN OUT INTEGER,
                                           p_fec_disp              IN OUT INTEGER,
                                           p_serial_instal         IN OUT INTEGER,
                                           p_id_remoto             IN OUT INTEGER,
                                           p_id_mensaje            IN OUT INTEGER,
                                           p_fec_recepcion_server  IN OUT DATE,
                                           p_fec_alta              IN OUT DATE)
IS
BEGIN
  IF p_de IS NULL THEN p_de := ' '; END IF;
  IF p_para IS NULL THEN p_para := ' '; END IF;
  IF p_tipo_mensaje IS NULL THEN p_tipo_mensaje := 0; END IF;
  IF p_grupo_id IS NULL THEN p_grupo_id := 0; END IF;
  IF p_mensaje IS NULL THEN p_mensaje := ' '; END IF;
  IF p_estado_msj IS NULL THEN p_estado_msj := 0; END IF;
  IF p_fec_alta_disp IS NULL THEN p_fec_alta_disp := 0; END IF;
  IF p_fec_disp IS NULL THEN p_fec_disp := 0; END IF;
  IF p_serial_instal IS NULL THEN p_serial_instal := 0; END IF;
  IF p_id_remoto IS NULL THEN p_id_remoto := 0; END IF;
  IF p_fec_alta IS NULL THEN p_fec_alta := SYSDATE; END IF;
  IF p_fec_recepcion_server IS NULL THEN p_fec_recepcion_server := p_fec_alta; END IF;
  IF p_tipo_mensaje = 0 THEN
    p_tipo_mensaje := 1;
  END IF;
  p_mensaje := REPLACE(p_mensaje,'''', '`');
  p_id_mensaje := fn_seq_nextval('seq_msi');
  INSERT INTO msi_mensaje (
    id_mensaje,             de,
    tipo_mensaje,
    serial_instal,          id_remoto,
    para,                   grupo_id,
    mensaje,                estado_msj,
    fec_alta_disp,          fec_disp,
    fec_confirm_envio,      q_confirm_envio,
    fec_recepcion_server,
    fec_alta,               usr_alta
  ) VALUES (
    p_id_mensaje,           p_de,
    p_tipo_mensaje,
    p_serial_instal,        p_id_remoto,
    p_para,                 p_grupo_id,
    p_mensaje,              p_estado_msj,
    p_fec_alta_disp,        p_fec_disp,
    NULL,                   0,
    p_fec_recepcion_server,
    p_fec_alta,             p_de
  );
END;
/
-----------------------------------
create or replace FUNCTION fn_seq_nextval( 
  p_sequence VARCHAR2 
) RETURN INTEGER IS 
  l_value INTEGER; 
BEGIN 
  IF fn_bandera THEN 
    DECLARE 
      l_query VARCHAR2(255) := 'SELECT '||p_sequence||'.nextval;'; 
      l_cursor BINARY_INTEGER; 
      l_nr NUMBER := 0; 
    BEGIN 
      l_cursor := DBMS_HS_PASSTHROUGH.OPEN_CURSOR@WRK1; 
      DBMS_HS_PASSTHROUGH.PARSE@WRK1(l_cursor, l_query); 
      LOOP 
        l_nr := DBMS_HS_PASSTHROUGH.FETCH_ROW@WRK1(l_cursor, FALSE); 
        EXIT WHEN l_nr = 0; 
        DBMS_HS_PASSTHROUGH.GET_VALUE@WRK1(l_cursor, 1, l_value); 
      END LOOP; 
      DBMS_HS_PASSTHROUGH.CLOSE_CURSOR@WRK1(l_cursor); 
      RETURN l_value; 
    END; 
  ELSE 
    DECLARE 
      dummy CHAR(1); 
    BEGIN 
      SELECT 1 
      INTO dummy 
      FROM all_sequences 
      WHERE sequence_owner = USER 
      AND Lower(sequence_name) = Lower(Trim(p_sequence)); 
       
      DECLARE 
        l_statement VARCHAR2(255) := 'BEGIN :value := '||Trim(p_sequence)||'.nextval(); END;'; 
      BEGIN 
        EXECUTE IMMEDIATE l_statement USING OUT l_value; 
        RETURN l_value; 
      END; 
    EXCEPTION 
      WHEN No_Data_Found THEN 
        Raise_Application_Error(-20999,'Secuencia '||Trim(p_sequence)||' no existe!'); 
    END; 
  END IF; 
END; 
/
--------------------------------------
create or replace PROCEDURE pr_capturar_error (
  p_obs CLOB DEFAULT NULL
)IS
  PRAGMA AUTONOMOUS_TRANSACTION;
  v_error CLOB := Dbms_Utility.format_error_stack||Dbms_Utility.format_error_backtrace;
  v_procedimiento VARCHAR2(4000) := substr( utl_call_stack.concatenate_subprogram( utl_call_stack.subprogram(2) ), 1, 386 );
  v_obs CLOB;
  l_headers json_array_t := json_array_t('[]');
  l_headers_string CLOB;
  l_resp CLOB;
BEGIN
  IF p_obs LIKE 'ws %' THEN
    l_resp := SubStr(p_obs,3,InStr(p_obs,Chr(10), 1, 1) - 3);
    SELECT json_objectagg(name Value value PRETTY)
    INTO l_headers_string
    FROM TABLE(apex_web_service.g_headers);
    WITH param_values AS (SELECT rownum ind,
                                 column_value
                          FROM TABLE(apex_string.SPLIT(p_str => SubStr(p_obs,
                                                                       InStr(p_obs,
                                                                             Chr(10),
                                                                             1,
                                                                             1) + 1),
                                                       p_sep => ',')))
    SELECT json_object('status_code' value To_Number(apex_web_service.g_status_code),
                       'reason'      value apex_web_service.g_reason_phrase,
                       'headers'     value l_headers_string FORMAT JSON,
                       'resp'        value json_serialize(l_resp PRETTY) FORMAT JSON,
                       'proc_params' value json_objectagg(a.argument_name Value b.column_value PRETTY) FORMAT JSON
                       RETURNING CLOB PRETTY)
    INTO v_obs
    FROM all_arguments a, param_values b, all_objects p
    WHERE p.object_name = a.object_name
    AND b.ind (+) = CASE WHEN p.object_type = 'FUNCTION' THEN a.sequence - 1 ELSE a.SEQUENCE END
    AND (a.package_name = left(v_procedimiento, instr(v_procedimiento, '.') - 1)
      OR left(v_procedimiento, instr(v_procedimiento,'.') - 1) IS NULL)
    AND a.object_name = right(v_procedimiento,
                              CASE
                                WHEN InStr(v_procedimiento,'.') = 0 THEN
                                  length(v_procedimiento)
                                ELSE
                                  length(v_procedimiento) - InStr(v_procedimiento,'.')
                              END)
    AND a.argument_name IS NOT NULL
    ORDER BY a.SEQUENCE;
  ELSIF p_obs LIKE 'obs %' THEN
    v_obs := p_obs;
    v_error := ' ';
  ELSIF p_obs IS NOT NULL THEN
    DECLARE
      l_param_values_table apex_t_clob := apex_string.SPLIT_clobs(p_str => p_obs,
                                                         p_sep => ',');
    BEGIN
      WITH param_values AS (SELECT rownum ind,
                                   column_value
                            FROM TABLE(l_param_values_table))
      SELECT json_arrayagg(json_object(a.argument_name Value b.column_value RETURNING CLOB) ORDER BY a.SEQUENCE RETURNING CLOB PRETTY)
      INTO v_obs
      FROM all_arguments a, param_values b, all_objects p
      WHERE p.object_name = a.object_name
      AND b.ind (+) = CASE WHEN p.object_type = 'FUNCTION' THEN a.sequence - 1 ELSE a.SEQUENCE END
      AND (a.package_name = left(v_procedimiento, instr(v_procedimiento, '.') - 1)
        OR left(v_procedimiento, instr(v_procedimiento,'.') - 1) IS NULL)
      AND a.object_name = right(v_procedimiento,
                              CASE
                                WHEN InStr(v_procedimiento,'.') = 0 THEN
                                  length(v_procedimiento)
                                ELSE
                                  length(v_procedimiento) - InStr(v_procedimiento,'.')
                              END)
      AND a.argument_name IS NOT NULL
      ORDER BY a.SEQUENCE;
    END;
  ELSE
    v_obs := Trim(p_obs);
  END IF;
  INSERT INTO dato_error(
    procedimiento,
    error,
    obs
  )VALUES(
    v_procedimiento,
    v_error,
    v_obs
  );
  COMMIT;
  EXCEPTION
    WHEN OTHERS THEN 
      ROLLBACK;
END;
/
------------------------------------------------------------------
create or replace TYPE articulo_con_prec_vta_type AS OBJECT ( 
  cod_familia         VARCHAR2(8), 
  cod_grupo           VARCHAR2(8), 
  cod_subgrupo        VARCHAR2(8), 
  descripcion         VARCHAR2(60),                            
  iva_exento          NUMBER, 
  vehiculo            NUMBER, 
  porc_iva            NUMBER, 
  porc_aplic_iva      NUMBER, 
  procedencia         NUMBER, 
  exento_grabado      VARCHAR2(7), 
  cod_tipo_mercaderia CHAR(4), 
  cod_lista_prec_vta  CHAR(2), 
  nro_orden           NUMBER 
); 
/

-----------------------------------------------
create or replace FUNCTION right(p_string VARCHAR2, p_position_from_right INTEGER) RETURN VARCHAR2 IS
BEGIN
  RETURN SUBSTR(p_string, LENGTH(p_string) - p_position_from_right + 1, p_position_from_right);
END;
/
-----------------------------------------------
create or replace FUNCTION left( 
  p_string VARCHAR2, 
  p_position_from_left INTEGER 
) RETURN VARCHAR2 IS 
BEGIN 
  RETURN SUBSTR(p_string, 1, p_position_from_left); 
END; 
/
-----------------------------------------------
  CREATE TABLE "DATO_ERROR" 
   (	"ORACLE_USER" VARCHAR2(30) DEFAULT USER, 
	"APEX_USER" VARCHAR2(30) DEFAULT SYS_CONTEXT('APEX$SESSION','APP_USER'), 
	"DATETIME" DATE DEFAULT SYSDATE NOT NULL ENABLE, 
	"SESSIONID" NUMBER(38,0) DEFAULT SYS_CONTEXT('USERENV', 'SESSIONID') NOT NULL ENABLE, 
	"PROCEDIMIENTO" CLOB NOT NULL ENABLE, 
	"ERROR" CLOB NOT NULL ENABLE, 
	"OBS" CLOB
   ) ;