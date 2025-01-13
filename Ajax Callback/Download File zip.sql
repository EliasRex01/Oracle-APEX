-- Example 1
-- Application 229853 / Shared Components / Application Processes / Edit
-- Procces point: Ajax callback: Run this application proccess when requested by a page proccess.
-- Name: COMPROBANTES_COMPRAS_R90

-- Authorization Scheme: Must Not Be Public User

DECLARE
  L_BLOB                BLOB;
  L_CLOB                CLOB;
  L_DEST_OFFSET         INTEGER := 1;
  L_SRC_OFFSET          INTEGER := 1;
  L_LANG_CONTEXT        INTEGER := DBMS_LOB.DEFAULT_LANG_CTX;
  L_WARNING             INTEGER;
  L_LENGTH              INTEGER;
  v_nombre_archivo      VARCHAR2(200);
  v_nombre_archivo_zip  VARCHAR2(200);
  v_id_empresa          ctb_empresa.id_empresa%TYPE;
  v_iteracion           number := 0;
  v_count               number ;
  g_zipped_blob         blob;
  
  cursor c is 
    select  *   --TMP_DESCARGA_ARCHIVO
    from    ctb_tmp_descarga_archivo;  
BEGIN

  -- create new temporary BLOB
  DBMS_LOB.CREATETEMPORARY(g_zipped_blob, FALSE);

  select  count (*)
  into    v_count 
  from   ctb_tmp_descarga_archivo; --tmp_descarga_archivo
                                    
  --obtiene id_empresa  
  BEGIN

    SELECT id_empresa
    INTO   v_id_empresa
    FROM   ctb_empresa  
    WHERE  id_empresa = ctb_pkg_adm.fn_id_empresa ;                                   
  EXCEPTION             --kove.devuelve_id_empresa
    WHEN No_Data_Found THEN 
      Raise_Application_Error(-20999,'No se ha encontrado empresa asignada');
  END;

  --get CLOB
  --kove.p_genera_archivo_comprobante_compras
  p_ctb_genera_archivo_comprobante_compras( P_FECHA_DESDE     =>  :P98_FECHA_DESDE  ,
                                            P_FECHA_HASTA     =>  :P98_FECHA_HASTA  ,
                                            P_ID_EMPRESA      =>  v_id_empresa      ,
                                            P_ARCHIVO         =>  L_CLOB            ,
                                            p_nombre_archivo  =>  v_nombre_archivo  );  
                                            


  v_nombre_archivo_zip := v_nombre_archivo||'.zip'; 
                                                                                        
  for reg in c 
  loop  
  declare 
    L_BLOB_2 blob;
    begin 
        v_iteracion := v_iteracion + 1;
        DBMS_LOB.CREATETEMPORARY(L_BLOB_2, FALSE);

        L_BLOB_2 := clob_to_blob2 (reg.archivo );

        L_DEST_OFFSET := L_DEST_OFFSET +1;
        L_SRC_OFFSET  := L_SRC_OFFSET  +1;                 
        
        as_zip.add1file( g_zipped_blob, replace (v_nombre_archivo,'0001',lpad(v_iteracion,4,'0'))||'.txt', L_BLOB_2 );
        DBMS_LOB.FREETEMPORARY(L_BLOB_2);
        
    end ;
  end loop;
  as_zip.finish_zip( g_zipped_blob );
  -- determine length for header
  L_LENGTH := DBMS_LOB.GETLENGTH(g_zipped_blob);  

  -- first clear the header
  HTP.FLUSH;
  HTP.INIT;

  -- create response header
  OWA_UTIL.MIME_HEADER( 'text/plain', FALSE);

  HTP.P('Content-length: ' || L_LENGTH);
  HTP.P('Content-Disposition: attachment; filename="'||v_nombre_archivo_zip||'"');
  HTP.P('Set-Cookie: fileDownload=true; path=/');

  OWA_UTIL.HTTP_HEADER_CLOSE;

  -- download the BLOB
  WPG_DOCLOAD.DOWNLOAD_FILE( g_zipped_blob );  
  -- stop APEX
  -- APEX_APPLICATION.STOP_APEX_ENGINE;
EXCEPTION
  WHEN OTHERS THEN
    DBMS_LOB.FREETEMPORARY(L_BLOB);
    raise_application_error (-20000,sqlerrm||'LINEA'||dbms_utility.format_error_backtrace);
END;


-- COMPROBANTES_VENTAS_R90
DECLARE
  L_BLOB                BLOB;
  L_CLOB                CLOB;
  L_DEST_OFFSET         INTEGER := 1;
  L_SRC_OFFSET          INTEGER := 1;
  L_LANG_CONTEXT        INTEGER := DBMS_LOB.DEFAULT_LANG_CTX;
  L_WARNING             INTEGER;
  L_LENGTH              INTEGER;
  v_nombre_archivo      VARCHAR2(200);
  v_nombre_archivo_zip  VARCHAR2(200);
  v_id_empresa          empresa.id_empresa%TYPE;
  v_iteracion           number := 0;
  v_count               number ;
  g_zipped_blob         blob;
  cursor c is 
    select  *
    from    TMP_DESCARGA_ARCHIVO;
BEGIN
  -- create new temporary BLOB
  DBMS_LOB.CREATETEMPORARY(g_zipped_blob, FALSE);

  select  count (*)
  into    v_count 
  from   TMP_DESCARGA_ARCHIVO;

  --obtiene id_empresa
  BEGIN 
    SELECT id_empresa
    INTO   v_id_empresa
    FROM   empresa
    WHERE  id_empresa = devuelve_id_empresa(p_usuario => Nvl(V('APP_USER'),USER) );
  EXCEPTION
    WHEN No_Data_Found THEN 
      Raise_Application_Error(-20999,'No se ha encontrado empresa asignada');
  END;

  --get CLOB
  p_genera_archivo_comprobante_ventas(
                                      P_FECHA_DESDE     =>  :P1903_FECHA_DESDE  ,
                                      P_FECHA_HASTA     =>  :P1903_FECHA_HASTA  ,
                                      P_ID_EMPRESA      =>  v_id_empresa      ,
                                      P_ARCHIVO         =>  L_CLOB            ,
                                      p_nombre_archivo  =>  v_nombre_archivo  );  

  v_nombre_archivo_zip := v_nombre_archivo||'.zip'; 
                                                                                        
  for reg in c 
  loop  
  declare 
    L_BLOB_2 blob;
    begin 
        v_iteracion := v_iteracion + 1;
        DBMS_LOB.CREATETEMPORARY(L_BLOB_2, FALSE);

        L_BLOB_2 := clob_to_blob2 (reg.archivo );

        L_DEST_OFFSET := L_DEST_OFFSET +1;
        L_SRC_OFFSET  := L_SRC_OFFSET  +1;                 
        
       as_zip.add1file( g_zipped_blob, replace (v_nombre_archivo,'0001',lpad(v_iteracion,4,'0'))||'.txt', L_BLOB_2 );
          DBMS_LOB.FREETEMPORARY(L_BLOB_2);
        
    end ;
  end loop;
  as_zip.finish_zip( g_zipped_blob );
  -- determine length for header
  L_LENGTH := DBMS_LOB.GETLENGTH(g_zipped_blob);  

  -- first clear the header
  HTP.FLUSH;
  HTP.INIT;

  -- create response header
  OWA_UTIL.MIME_HEADER( 'text/plain', FALSE);

  HTP.P('Content-length: ' || L_LENGTH);
  HTP.P('Content-Disposition: attachment; filename="'||v_nombre_archivo_zip||'"');
  HTP.P('Set-Cookie: fileDownload=true; path=/');

  OWA_UTIL.HTTP_HEADER_CLOSE;

  -- download the BLOB
  WPG_DOCLOAD.DOWNLOAD_FILE( g_zipped_blob );  
  -- stop APEX
  -- APEX_APPLICATION.STOP_APEX_ENGINE;
EXCEPTION
  WHEN OTHERS THEN
    DBMS_LOB.FREETEMPORARY(L_BLOB);
    raise_application_error (-20000,sqlerrm||'LINEA'||dbms_utility.format_error_backtrace);
END;