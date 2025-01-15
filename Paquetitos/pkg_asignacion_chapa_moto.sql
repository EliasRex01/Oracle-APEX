create or replace package pkg_asignacion_motos_chapas as
PROCEDURE PR_MOD_CHAPA(
                p_nro_chapa         IN  pedidos_art_vehiculo.nro_chapa_definitiva%TYPE,
                p_nro_pedido        IN  pedidos_art_vehiculo.nro_pedido%TYPE,
                p_item_art          IN  pedidos_art_vehiculo.item_art%TYPE,
                p_nro_item_vehiculo IN  pedidos_art_vehiculo.nro_item_vehiculo%TYPE
);
PROCEDURE PR_DESTRUIR_CHAPA(
                p_nro_vehiculo         IN  pedidos_art_vehiculo.nro_vehiculo%TYPE,
                p_nro_chapa_definitiva IN  pedidos_art_vehiculo.nro_chapa_definitiva%TYPE
);
PROCEDURE PR_AUDITORIA_CHAPAS(
        p_desde        IN pedidos_art_vehiculo_audi.fecha%type,
        p_hasta        IN pedidos_art_vehiculo_audi.fecha%type,
        p_nro_vehiculo IN pedidos_art_vehiculo_audi.nro_vehiculo%type,
        p_anterior     IN pedidos_art_vehiculo_audi.nro_chapa_anterior%type,
        p_nueva        IN pedidos_art_vehiculo_audi.nro_chapa_nueva%type,
        p_usuario      IN pedidos_art_vehiculo_audi.usuario%type
);
PROCEDURE imprimir(
          p_nro_chapa       IN VARCHAR2,
          p_g_impresora     IN VARCHAR2
    );
    procedure pr_trace_log_imp_etiqchapa_web(
      p_texto in varchar2,
      p_activado in number default null
   );
  procedure pr_trace_log_client_http(
      p_texto in clob
   );
    procedure pr_rhu_alerta(
      p_mensaje in varchar2,
      p_codOrigen in varchar2
   );
   PROCEDURE pr_client_http_2(p_method        IN VARCHAR2,
													 p_url           IN VARCHAR2,
													 p_body          IN VARCHAR2,
													 p_response      OUT CLOB,
													 p_response_size OUT INTEGER,
													 p_http_code     OUT INTEGER) ;
   procedure pr_rhu_imp_etiqchapa_web(
      p_nro_chapa in varchar2,
      p_impresora in varchar2
   );
end "PKG_ASIGNACION_MOTOS_CHAPAS";
/
create or replace package body pkg_asignacion_motos_chapas as
-- Autor: Matheo Maidana
-- Paquete para la aplicación cha01000: Asignación de chapa para las motos
---------------------------
------MODIFICAR CHAPA------
PROCEDURE PR_MOD_CHAPA(
                p_nro_chapa         IN  pedidos_art_vehiculo.nro_chapa_definitiva%TYPE,
                p_nro_pedido        IN  pedidos_art_vehiculo.nro_pedido%TYPE,
                p_item_art          IN  pedidos_art_vehiculo.item_art%TYPE,
                p_nro_item_vehiculo IN  pedidos_art_vehiculo.nro_item_vehiculo%TYPE
)
IS
    v_fecha_ult_modif DATE  := CURRENT_DATE ;
    v_usuario VARCHAR2(8)   := fn_user;
BEGIN
    BEGIN
        UPDATE pedidos_art_vehiculo SET
                	nro_chapa_definitiva    = p_nro_chapa,
                	fec_ult_mod             = v_fecha_ult_modif,
                	usr_ult_mod             = v_usuario
        WHERE nro_pedido            = p_nro_pedido
        	AND item_art      	    = p_item_art
        	AND nro_item_vehiculo 	= p_nro_item_vehiculo ;
        EXCEPTION
            WHEN OTHERS THEN
                RAISE_APPLICATION_ERROR(-20001, 'No se pudo modificar la tabla pedidos_art_vehiculo : ' || SQLERRM, TRUE);
    END;
    BEGIN
        ---UPDATE de lotes_chapas_suc a estado = 'ASIG'
        UPDATE lotes_chapas_suc SET
                    estado = 'ASIG'
        WHERE nro_chapa = p_nro_chapa;
        EXCEPTION
            WHEN NO_DATA_FOUND THEN
                RAISE_APPLICATION_ERROR(-20002, 'No se encontro chapa seleccionada para actualizar el estado... ' || SQLERRM, TRUE);
            WHEN OTHERS THEN
                ROLLBACK;
                RAISE_APPLICATION_ERROR(-20001, 'No se pudo modificar la tabla lotes_chapas_suc : ' || SQLERRM, TRUE);
    END;
END PR_MOD_CHAPA;
-------------------------------------
------DESTRUIR ASIGNACION CHAPA------
PROCEDURE PR_DESTRUIR_CHAPA(
                p_nro_vehiculo         IN  pedidos_art_vehiculo.nro_vehiculo%TYPE,
                p_nro_chapa_definitiva IN  pedidos_art_vehiculo.nro_chapa_definitiva%TYPE
)
IS
    v_fecha_ult_modif DATE  := CURRENT_DATE ;
    v_usuario VARCHAR2(8)   := fn_user;
BEGIN
        IF (
            (p_nro_chapa_definitiva = '--')    OR
            (p_nro_chapa_definitiva = '-')     OR
            (p_nro_chapa_definitiva = '')      OR
            (p_nro_chapa_definitiva IS NULL)
        ) THEN
            raise_application_error(-20001, 'Verifique. Este vehículo se encuentra sin chapa ');
        ELSE
            BEGIN
            UPDATE pedidos_art_vehiculo
                SET nro_chapa_definitiva = '--'
                WHERE nro_vehiculo = p_nro_vehiculo;
            EXCEPTION
                WHEN OTHERS THEN
                    ROLLBACK;
                    RAISE_APPLICATION_ERROR(-20001, 'No se pudo modificar la tabla pedidos_art_vehiculo : ' || SQLERRM, TRUE);
            END;
            BEGIN
                ---UPDATE de lotes_chapas_suc a estado = 'DEST'
                UPDATE lotes_chapas_suc
                    SET estado = 'DEST'
                    WHERE nro_chapa = p_nro_chapa_definitiva;
                EXCEPTION
                    WHEN NO_DATA_FOUND THEN
                        RAISE_APPLICATION_ERROR(-20002, 'No se encontro chapa seleccionada para actualizar el estado... ' || SQLERRM, TRUE);
                    WHEN OTHERS THEN
                        ROLLBACK;
                        RAISE_APPLICATION_ERROR(-20001, 'No se pudo modificar la tabla lotes_chapas_suc : ' || SQLERRM, TRUE);
            END;
        END IF;
END PR_DESTRUIR_CHAPA;
---------------------------
-----AUDITORIA CHAPAS------
PROCEDURE PR_AUDITORIA_CHAPAS(
        p_desde        IN pedidos_art_vehiculo_audi.fecha%type,
        p_hasta        IN pedidos_art_vehiculo_audi.fecha%type,
        p_nro_vehiculo IN pedidos_art_vehiculo_audi.nro_vehiculo%type,
        p_anterior     IN pedidos_art_vehiculo_audi.nro_chapa_anterior%type,
        p_nueva        IN pedidos_art_vehiculo_audi.nro_chapa_nueva%type,
        p_usuario      IN pedidos_art_vehiculo_audi.usuario%type
)
IS
begin
    apex_collection.create_or_truncate_collection(p_collection_name => 'TMT_VEHICULOS_AUDI');
    FOR A IN (
                SELECT m.fecha,
                       m.usuario,
                       m.nro_vehiculo,
                       m.nro_chapa_anterior AS anterior,
                       m.nro_chapa_nueva    AS nueva
                FROM pedidos_art_vehiculo_audi m
                WHERE   (p_desde        is null OR m.fecha  >=  p_desde)
                    AND (p_hasta        is null OR m.fecha  <=  p_hasta)
                    AND (p_nro_vehiculo is null OR m.nro_vehiculo       = p_nro_vehiculo)
                    AND (p_anterior     is null OR m.nro_chapa_anterior = p_anterior)
                    AND (p_nueva        is null OR m.nro_chapa_nueva    = p_nueva)
                    AND (p_usuario      is null OR m.usuario            = p_usuario)
            ) LOOP
        APEX_COLLECTION.ADD_MEMBER(P_COLLECTION_NAME => 'TMT_VEHICULOS_AUDI',
                                   P_d001            => A.fecha,
                                   P_C002            => A.usuario,
                                   P_C003            => A.nro_vehiculo,
                                   P_C004            => A.anterior,
                                   P_C005            => A.nueva
                               );
    END LOOP;
END PR_AUDITORIA_CHAPAS;
---------------------------
---------IMPRIMIR----------
    PROCEDURE imprimir(
          p_nro_chapa       IN VARCHAR2,
          p_g_impresora     IN VARCHAR2
    )
    IS
    BEGIN
           pr_rhu_imp_etiqchapa_web(
                      p_nro_chapa => p_nro_chapa,
                      p_impresora => p_g_impresora
                  );
    END;
   procedure pr_trace_log_imp_etiqchapa_web(
      p_texto in varchar2,
      p_activado in number default null
   ) is
      v_hora         timestamp      := to_char(current_timestamp, 'DD/MM/YYYY HH24:MI:SS');
      v_text         varchar2(512);
      v_directorio   varchar2(60)   := 'ARCHIVOS';
      v_file_handle  utl_file.file_type;
   begin
      v_text := 'v2;'||p_activado||';'||v_hora||';'||p_texto||chr(10);
      begin
         v_file_handle := utl_file.fopen('ARCHIVOS', 'imp_notarenu_web.log', 'A');
         utl_file.put_line(v_file_handle, v_text);
         utl_file.fclose(v_file_handle);
      exception
         when others then
            if utl_file.is_open(v_file_handle) then
               utl_file.fclose(v_file_handle);
            end if;
            Raise_Application_Error(-20999, 'Ha ocurrido un error al escribir el log: imp_notarenu_web.log '||sqlerrm);
      end;
   END pr_trace_log_imp_etiqchapa_web;
   procedure pr_trace_log_client_http(
      p_texto in clob
   ) is
      v_hora         timestamp      := current_timestamp;
      v_text         clob;
      v_directorio   varchar2(60)   := 'ARCHIVOS';
      v_file_handle  utl_file.file_type;
   begin
      v_text := to_char(v_hora, 'DD/MM/YYYY HH24:MI:SS')||';'||p_texto;
      begin
      v_file_handle := utl_file.fopen('ARCHIVOS', 'client_http.log', 'A');
      utl_file.put_line(v_file_handle, v_text);
      utl_file.fclose(v_file_handle);
    exception
      when others then
        if utl_file.is_open(v_file_handle) then
          utl_file.fclose(v_file_handle);
        end if;
        Raise_Application_Error(-20999, 'Ha ocurrido un error al escribir el log: client_http.log '||sqlerrm);
    end;
  end;
   procedure pr_rhu_alerta(
      p_mensaje in varchar2,
      p_codOrigen in varchar2
   ) is
      v_mensaje            varchar2(512);
      v_url                varchar2(128);
      v_msg_parte1         varchar2(160);
      v_msg_parte2         varchar2(160);
      v_en_linea           admin_java.en_linea%type;
      v_json_body          clob;
      v_body_length        number;
      v_resp               utl_http.resp;
      v_req                utl_http.req;
      v_status_code        number;
      v_response_headers   varchar2(4000);
      v_response           varchar2(32767);
      v_buffer             varchar2(32767);
      v_error              number := 0;
   begin
      v_mensaje := 'ALERTA CLIENT HTTP: '||p_mensaje;
      v_mensaje := REPLACE(v_mensaje, '"', '');
      v_mensaje := replace(v_mensaje, '{', '');
      v_mensaje := replace(v_mensaje, '}', '');
      v_mensaje := replace(v_mensaje, 'http://ingrid-desa.alexsa.com.py', '');
      v_msg_parte1 := substr(v_mensaje, 1, 160);
      begin
         select
            valor
         into
            v_url
         from apx_parametros
         where descripcion = 'ALERTA_URL';
      exception
         when no_data_found then
            raise_application_Error(-20999, 'Error al momento de recuperar la URL de alerta...');
      end;
      if length(v_mensaje) > 160 then
         v_msg_parte2 := substr(v_mensaje, length(v_mensaje) - 160 + 1);
      end if;
      begin
         select
            en_linea
         into
            v_en_linea
         from admin_java
         where cod_servicio = '';
      exception
         when no_data_found then
            return;
         when others then
            return;
      end;
      if v_en_linea = 0 then
         return;
      end if;
      begin
         for reg in (
            select
               valor
            from admin_java_variables
            where cod_servicio = 'CLIHTTP'
               and variable like 'NRO_TELEFONO_%'
         ) loop
            apex_json.initialize_clob_output;
            apex_json.open_object;
            apex_json.write('codOrigenEnvio' , p_codOrigen);
            apex_json.write('mensaje'        , v_msg_parte1);
            apex_json.write('nroTelefono'    , trim(reg.valor));
            apex_json.close_object;
            v_json_body := apex_json.get_clob_output;
            apex_json.free_output();
            pr_trace_log_client_http('MENSAJE--> POST '||v_url||' '||v_json_body);
            v_body_length := length(v_json_body);
            utl_http.set_body_charset('UTF-8');
            v_req := utl_http.begin_request(v_url, 'POST', UTL_HTTP.HTTP_VERSION_1_1);
            utl_http.set_header(v_req, 'Content-Type'    , 'application/json');
            utl_http.set_header(v_req, 'Content-Length'  , v_body_length);
            utl_http.set_header(v_req, 'Accept'          , '*/*');
            utl_http.write_text(v_req, v_json_body);
            v_resp         := utl_http.get_response(v_req);
            v_status_code  := v_resp.status_code;
            begin
               loop
                  utl_http.read_text(v_resp, v_buffer);
                  v_response := v_response || v_buffer;
               end loop;
            exception
               when utl_http.end_of_body then
                  utl_http.end_response(v_resp);
               when others then
                  v_error := 1;
                  pr_trace_log_client_http('Error envio mensaje: '||sqlerrm);
            end;
            utl_http.end_response(v_resp);
            if v_error = 0 then
               -- Si no hubo errores...
               pr_trace_log_client_http('Mensaje response: '||v_response);
            end if;
            if v_msg_parte2 != '' or v_msg_parte2 is not null then
               apex_json.initialize_clob_output;
               apex_json.open_object;
               apex_json.write('codOrigenEnvio' , p_codOrigen);
               apex_json.write('mensaje'        , v_msg_parte2);
               apex_json.write('nroTelefono'    , reg.valor);
               apex_json.close_object;
               v_json_body := apex_json.get_clob_output;
               apex_json.free_output();
               pr_trace_log_client_http('MENSAJE--> POST '||v_url||' '||v_json_body);
               begin
                  v_body_length := length(v_json_body);
                  utl_http.set_body_charset('UTF-8');
                  v_req := utl_http.begin_request(v_url, 'POST', UTL_HTTP.HTTP_VERSION_1_1);
                  utl_http.set_header(v_req, 'Content-Type'    , 'application/json');
                  utl_http.set_header(v_req, 'Content-Length'  , v_body_length);
                  utl_http.set_header(v_req, 'Accept'          , '*/*');
                  utl_http.write_text(v_req, v_json_body);
                  v_resp         := utl_http.get_response(v_req);
                  v_status_code  := v_resp.status_code;
                  begin
                     loop
                        utl_http.read_text(v_resp, v_buffer);
                        v_response := v_response || v_buffer;
                     end loop;
                  exception
                     when utl_http.end_of_body then
                        utl_http.end_response(v_resp);
                     when others then
                        v_error := 1;
                        pr_trace_log_client_http('Error envio mensaje: '||sqlerrm);
                  end;
                  utl_http.end_response(v_resp);
               exception
                  when others then
                     v_error := 1;
                     pr_trace_log_client_http('Error envio mensaje: '||sqlerrm);
               end;
               if v_error = 0 then
                  -- Si no hubo errores...
                  pr_trace_log_client_http('Mensaje response: '||v_response);
               end if;
            end if;
         end loop;
      end;
   end;
  procedure pr_rhu_imp_etiqchapa_web(
      p_nro_chapa in varchar2,
      p_impresora in varchar2
   ) is
      v_en_linea        admin_java.en_linea%type;
      v_err_text        varchar2(256);
      v_activado        number;
      v_entra           number         := 0;
      v_servidor_cups   varchar2(32);
      v_body            varchar2(1024);
      v_json_body       clob;
      v_url             varchar2(128);
      v_response        varchar2(32767);
      v_response_size   NUMBER;
      v_http_code       VARCHAR2(8);
   BEGIN
      begin
         select
            en_linea
         into
            v_en_linea
         from admin_java
         where cod_servicio = 'ETICHAPA';
      exception
         when no_data_found then
            v_err_text := 'imp_etiqchapa_web. No existe configuración para impresión Chapa web.';
            pr_trace_log_imp_etiqchapa_web(v_err_text, v_activado);
            raise_application_error(-20999, v_err_text);
         when others then
            v_err_text := 'imp_etiqchapa_web. No existe configuración para el codigo Chapa '||sqlerrm||' '||dbms_utility.format_error_backtrace;
            pr_trace_log_imp_etiqchapa_web(v_err_text, v_activado);
            raise_application_error(-20999, v_err_text);
      end;
      if v_en_linea = 0 then
         v_err_text := 'imp_etiqchapa_web. No existe configuración para el codigo Chapa';
         pr_trace_log_imp_etiqchapa_web(v_err_text, v_activado);
         raise_application_error(-20999, v_err_text);
      end if;
      begin
         for reg in (
            select
               variable,
               valor
            from admin_java_variables
            where cod_servicio = 'ETICHAPA'
         ) loop
            v_entra := 1;
            if reg.variable = 'URL_IMPRESION_ETIQCHAPA' THEN
             -- raise_application_error(-20001, 'Error al seleccionar datos del personal '|| v_url);
               --v_url := 'http://ingrid-desa.alexsa.com.py/api/planetpress-jasper/notadesp/imprimir';
               v_url := reg.valor;
            elsif reg.variable = 'ACTIVADO' then
               v_activado := reg.valor;
            elsif reg.variable = 'SERVIDOR_CUPS' then
               v_servidor_cups := reg.valor;
            end if;
         end loop;
      exception
         when others then
            v_err_text := 'imp_etiqchapa_web. '||sqlerrm||' '||dbms_utility.format_error_backtrace;
            pr_trace_log_imp_etiqchapa_web(v_err_text, v_activado);
            raise_application_error(-20999, v_err_text);
      end;
      if v_entra = 0 then
         v_err_text := 'imp_etiqchapa_web. No existe la url en la configuración.';
         pr_trace_log_imp_etiqchapa_web(v_err_text, v_activado);
         raise_application_error(-20999, v_err_text);
      end if;
      if v_url is null then
         v_err_text := 'imp_etiqchapa_web. Falta configurar la URL.';
         pr_trace_log_imp_etiqchapa_web(v_err_text, v_activado);
         raise_application_error(-20999, v_err_text);
      end if;
      if v_servidor_cups is null then
         v_err_text := 'imp_etiqchapa_web. Falta configurar el servidor cups.';
         pr_trace_log_imp_etiqchapa_web(v_err_text, v_activado);
         raise_application_error(-20999, v_err_text);
      end if;
    --  raise_application_error(-20001,   p_impresora ||' '||  p_nro_chapa ||' '||   v_servidor_cups);
      apex_json.initialize_clob_output;
      apex_json.open_object;
      apex_json.write('nombreImpresora', p_impresora);
      apex_json.write('nroChapa'    , to_char(p_nro_chapa));
      apex_json.write('servidorCups'   , v_servidor_cups);
      apex_json.close_object;
      v_json_body := apex_json.get_clob_output;
      apex_json.free_output();
      v_json_body := replace(v_json_body, '\', '');
      BEGIN
      --raise_application_error(-20001, 'Error al seleccionar datos del personal '|| v_json_body);
          pr_client_http_2('POST', v_url, v_json_body, v_response, v_response_size, v_http_code);
      exception
        when others THEN
          ROLLBACK;
          pr_capturar_error();
           raise_application_error(-20999, 'Error al imprimir nro_chapa web.'||sqlerrm||dbms_utility.format_error_backtrace);
      end;
   END pr_rhu_imp_etiqchapa_web;
   PROCEDURE pr_client_http_2(p_method        IN VARCHAR2,
													    p_url           IN VARCHAR2,
													    p_body          IN VARCHAR2,
													    p_response      OUT CLOB,
													    p_response_size OUT INTEGER,
													    p_http_code     OUT INTEGER) IS
		response_aux    VARCHAR2(2048) NOT NULL := ' ';
		response_header VARCHAR2(256) NOT NULL := ' ';
		size_download   VARCHAR2(32) NOT NULL := ' ';
		i               INTEGER NOT NULL := 0;
		file_no         INTEGER NOT NULL := 0;
		status          INTEGER NOT NULL := 0;
		body_length     INTEGER NOT NULL := 0;
		PROCEDURE alerta(mensaje IN VARCHAR2) IS
			v_mensaje       VARCHAR2(4000);
			body_alerta     VARCHAR2(4000) NOT NULL := ' ';
			response_alerta VARCHAR2(4000) NOT NULL := ' ';
			mensaje_160     VARCHAR2(160) NOT NULL := ' ';
			parte_1         VARCHAR2(160) NOT NULL := ' ';
			parte_2         VARCHAR2(160) NOT NULL := ' ';
			url_alerta      VARCHAR2(128) NOT NULL := ' ';
			nro_telefono    VARCHAR2(32) NOT NULL := ' ';
			data_base       VARCHAR2(32) NOT NULL := ' ';
			en_linea        INTEGER NOT NULL := 0;
			l_err           INTEGER NOT NULL := 0;
		BEGIN
			v_mensaje := 'ALERTA CLIENT HTTP: ' || v_mensaje;
			data_base := pkg_ic.g_base_de_datos;
			IF data_base NOT IN ('PROD') THEN
				url_alerta := 'http://ingrid-desa.alexsa.com.py/api/mensajeria/mensajes/envio';
			ELSE
				url_alerta := 'https://ingrid.alexsa.com.py/api/mensajeria/mensajes/envio';
			END IF;
			v_mensaje := REPLACE(v_mensaje, '"', '');
			v_mensaje := REPLACE(v_mensaje, '{', '');
			v_mensaje := REPLACE(v_mensaje, '}', '');
			v_mensaje := REPLACE(v_mensaje, 'https://ingrid.alexsa.com.py', '');
			mensaje_160 := v_mensaje;
			parte_1     := v_mensaje;
			IF length(v_mensaje) > 160 THEN
				parte_2 := RIGHT(v_mensaje, length(v_mensaje) - 160);
			END IF;
			BEGIN
				SELECT en_linea
				INTO   en_linea
				FROM   admin_java
				WHERE  cod_servicio = 'ETICHAPA'
				FETCH  FIRST 1 rows ONLY;
				COMMIT;
				IF en_linea = 0 THEN
					RETURN;
				END IF;
			EXCEPTION
				WHEN No_Data_Found THEN
					RETURN;
			END;
			DECLARE
				l_rows NUMBER := 0;
			BEGIN
				FOR i IN (SELECT TRIM(valor)
									INTO   nro_telefono
									FROM   admin_java_variables
									WHERE  cod_servicio = 'ETICHAPA'
									AND    VARIABLE LIKE 'NRO_TELEFONO_%')
				LOOP
					l_rows := l_rows + 1;
					COMMIT;
					body_alerta := '{' || '"codOrigenEnvio":"' || 'client_http' || '"' || ',' || '"mensaje":"' || parte_1 || '"' || ',' ||
												 '"nroTelefono":"' || nro_telefono || '"' || '}';
          apex_web_service.set_request_headers(p_name_01        => 'Content-Type',
                                               p_value_01       => 'application/json',
                                               p_reset          => TRUE);
					response_alerta := apex_web_service.make_rest_request(p_http_method => 'POST',
																																p_url         => url_alerta,
																																p_body        => body_alerta,
                                                                p_wallet_path => fn_api_wallet);
					IF parte_2 != '' THEN
						body_alerta := '{' || '"codOrigenEnvio":"' || 'client_http' || '"' || ',' || '"mensaje":"' || parte_2 || '"' || ',' ||
													 '"nroTelefono":"' || nro_telefono || '"' || '}';
						apex_web_service.set_request_headers(p_name_01        => 'Content-Type',
                                                 p_value_01       => 'application/json',
                                                 p_reset          => TRUE);
            response_alerta := apex_web_service.make_rest_request(p_http_method => 'POST',
																																	p_url         => url_alerta,
																																	p_body        => body_alerta,
                                                                  p_wallet_path => fn_api_wallet);
					END IF;
				END LOOP;
				COMMIT;
				IF l_rows <= 0 THEN
					RETURN;
				END IF;
			END;
		END alerta;
	BEGIN
		pkg_ic.inicializar;
		IF p_method NOT IN ('POST', 'GET') THEN
			p_http_code := 0;
			p_response  := 'El metodo debe ser POST o GET';
			raise_application_error(-20000, p_response);
		END IF;
		IF p_method = 'POST' THEN
			BEGIN
				body_length := length(p_body);
        apex_web_service.set_request_headers(p_name_01        => 'Content-Type',
                                             p_value_01       => 'application/json',
                                             p_reset          => TRUE);
				p_response  := apex_web_service.make_rest_request(p_http_method => 'POST',
																													p_url         => p_url,
																													p_body        => p_body,
                                                          p_wallet_path => fn_api_wallet);
      EXCEPTION
				WHEN Others THEN
          alerta(mensaje => p_method || ' ' || p_url || ' ' || p_body || ' ' || SQLERRM);
					RAISE;
			END;
		ELSIF p_method = 'GET' THEN
			BEGIN
				apex_web_service.set_request_headers(p_name_01        => 'Content-Type',
                                             p_value_01       => 'application/json',
                                             p_reset          => TRUE);
        p_response := apex_web_service.make_rest_request(p_url         => p_url,
																												 p_http_method => 'GET',
                                                         p_wallet_path => fn_api_wallet);
			EXCEPTION
				WHEN Others THEN
					alerta(mensaje => p_method || ' ' || p_url || ' ' || p_body || ' ' || SQLERRM);
					RAISE;
			END;
		END IF;
		p_http_code     := apex_web_service.g_status_code;
		p_response_size := dbms_lob.getlength(p_response);
		IF p_http_code = 0 THEN
			alerta(mensaje => p_method || ' ' || p_url || ' ' || 'p_response: ' || p_response);
			raise_application_error(-20999, 'p_http_code: 0 ' || p_response);
		ELSIF p_http_code = 400 THEN
			p_response := json_object_t(p_response).get_string('message');
			alerta(mensaje => p_method || ' ' || p_url || ' ' || p_response);
		ELSIF p_http_code != 200 THEN
			alerta(mensaje => p_method || p_url || ' ' || p_response);
		END IF;
		COMMIT;
  EXCEPTION
    WHEN OTHERS THEN
      pr_capturar_error('ws ' || p_response );
      pr_capturar_error(p_method       ||','||
                        p_url          ||','||
                        p_body         ||','||
                        p_response     ||','||
                        p_response_size||','||
                        p_http_code);
	END pr_client_http_2;
end "PKG_ASIGNACION_MOTOS_CHAPAS";
/