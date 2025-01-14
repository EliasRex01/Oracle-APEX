PROMPT CREATE OR REPLACE PACKAGE pkg_carga_inicial_activo_fijo
CREATE OR REPLACE PACKAGE pkg_carga_inicial_activo_fijo AS
    -- Creado por Elias Zaracho, Octubre del 2024
    -- pkg para afj02000, ult mod: 30/10/2024


    -- procedimiento para modificar planillas
    PROCEDURE pr_actualizar_datos_planilla(
	    p_af_id              IN af_activo_fijo.af_id%TYPE,
	    p_descripcion        IN af_activo_fijo.descripcion%TYPE,
	    p_fec_adquisicion    IN af_activo_fijo.fec_adquisicion%TYPE,
	    p_ahno_vida_util     IN af_activo_fijo.ahno_vida_util%TYPE,
	    p_precio_compra      IN af_activo_fijo.precio_compra%TYPE,
	    p_af_codigo          IN af_activo_fijo.af_codigo%TYPE,
	    p_af_rubro_id        IN af_activo_fijo.af_rubro_id%TYPE,
	    p_valor_neto_fiscal  IN af_activo_fijo.valor_neto_fiscal%TYPE,
	    p_revaluo_deprec     IN af_activo_fijo.revaluo_deprec%TYPE,
	    p_vida_util_rest     IN af_activo_fijo.vida_util_rest%TYPE
    );
    -- procedimiento para eliminar planillas
    PROCEDURE pr_eliminar_planilla(
       P_AF_ID           IN AF_ACTIVO_FIJO.AF_ID%TYPE
    );
    -- procedimiento para borrar detalles de planilla en edicion
    PROCEDURE pr_eliminar_detalle_planilla(
      p_af_cms_id          IN af_movs.af_cms_id%TYPE,
      p_af_id              IN af_movs.AF_ID%TYPE
    );
    -- procedimiento para actualizar detalle de planilla en edicion
    PROCEDURE pr_actualizar_datos_detalle_planilla (
      p_af_id              IN af_activo_fijo.af_id%TYPE,
      p_descripcion        IN af_activo_fijo.descripcion%TYPE,
      p_ahno_vida_util     IN af_activo_fijo.ahno_vida_util%TYPE,
      p_cod_sucursal       IN af_activo_fijo.cod_sucursal%TYPE,
      p_cod_oficina        IN af_activo_fijo.cod_oficina%TYPE,
      p_cod_persona        IN af_activo_fijo.cod_persona%TYPE,
      p_af_obs             IN af_activo_fijo.af_obs%TYPE
    );
    -- procedimiento para pasar al siguiente codigo de af_codigo (viene de ingrid)
    PROCEDURE pr_sgte_af_codigo(
      p_af_rubro_id          IN  af_subrubro.af_rubro_id%TYPE,
      p_af_subrubro_id       IN  af_subrubro.af_subrubro_id%TYPE,
      p_af_codigo            OUT CHAR
    );
    -- procedimiento para cerrar una planilla en edicion (4gl)
    PROCEDURE pr_afj02045(
      p_af_cms_id            IN AF_CABMOVS.af_cms_id%TYPE
    );
    -- procedimiento para cancelar una planilla en edicion (4gl)
    PROCEDURE pr_afj02055(
      p_af_cms_id           IN AF_CABMOVS.af_cms_id%TYPE
    );
    -- procedimiento para crear siguiente codigo a insertar
    PROCEDURE pr_sgteAfCodigo (
      p_af_subrubro_id            IN NUMBER,
      p_af_rubro_id               IN NUMBER,
      p_af_codigo                 OUT VARCHAR2
    );
    -- procedimiento para insertar activo fijo (planilla en edicion)
  PROCEDURE pr_insertarActivoFijo(
    p_af_cms_id                     IN OUT NUMBER,
    p_af_rubro_id                   IN af_activo_fijo.af_rubro_id%TYPE,
    p_af_subrubro_id                IN af_activo_fijo.af_subrubro_id%TYPE,
    p_cod_temporal                  IN af_activo_fijo.af_cod_temporal%TYPE,
    p_descripcion                   IN af_activo_fijo.descripcion%TYPE,
    p_cod_sucursal                  IN af_activo_fijo.cod_sucursal%TYPE,
    p_cod_oficina                   IN af_activo_fijo.cod_oficina%TYPE,
    --p_cod_departamento              IN af_activo_fijo.cod_departamento%TYPE,
    --p_cod_organizacion              IN af_activo_fijo.cod_organizacion%TYPE,
    p_cod_persona                   IN af_activo_fijo.cod_persona%TYPE,
    p_af_obs                        IN af_activo_fijo.af_obs%TYPE
  );
  -- procedimiento parar agregar a planilla
  PROCEDURE pr_agregarAPlanilla (
    p_af_id                 IN OUT NUMBER,
    p_af_cms_id             IN OUT NUMBER,
    p_cod_sucursal                  IN number,
    p_cod_oficina                   IN VARCHAR2,
    --p_cod_departamento              IN VARCHAR2,
    --p_cod_organizacion              IN VARCHAR2,
    p_cod_persona                   IN VARCHAR2
  );
  PROCEDURE pr_listar_activo_por_responsable(
      P_COD_SUCURSAL af_activo_fijo.cod_sucursal%TYPE,
      P_COD_RESPONSABLE perspers.cod_persona%TYPE
  );
END "PKG_CARGA_INICIAL_ACTIVO_FIJO";
/

PROMPT CREATE OR REPLACE PACKAGE BODY pkg_carga_inicial_activo_fijo
CREATE OR REPLACE PACKAGE BODY pkg_carga_inicial_activo_fijo AS
    ----------------- procedimiento para actualizar los datos de una planilla -------------------
    PROCEDURE pr_actualizar_datos_planilla (
      p_af_id              IN af_activo_fijo.af_id%TYPE,
      p_descripcion        IN af_activo_fijo.descripcion%TYPE,
      p_fec_adquisicion    IN af_activo_fijo.fec_adquisicion%TYPE,
      p_ahno_vida_util     IN af_activo_fijo.ahno_vida_util%TYPE,
      p_precio_compra      IN af_activo_fijo.precio_compra%TYPE,
      p_af_codigo          IN af_activo_fijo.af_codigo%TYPE,
      p_af_rubro_id        IN af_activo_fijo.af_rubro_id%TYPE,
      p_valor_neto_fiscal  IN af_activo_fijo.valor_neto_fiscal%TYPE,
      p_revaluo_deprec     IN af_activo_fijo.revaluo_deprec%TYPE,
      p_vida_util_rest     IN af_activo_fijo.vida_util_rest%TYPE
    )
    IS
      v_count NUMBER;
    BEGIN
      UPDATE af_activo_fijo
      SET
        descripcion = p_descripcion,
        fec_adquisicion = p_fec_adquisicion,
        ahno_vida_util = p_ahno_vida_util,
        precio_compra = p_precio_compra,
        af_codigo = p_af_codigo,
        af_rubro_id = p_af_rubro_id,
        valor_neto_fiscal = p_valor_neto_fiscal,
        revaluo_deprec = p_revaluo_deprec,
        vida_util_rest = p_vida_util_rest
      WHERE af_id = p_af_id;
      COMMIT;
    EXCEPTION
      WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(-20007, 'Error al actualizar los datos: ' || SQLERRM);
    END pr_actualizar_datos_planilla;
    ------------------ procedimiento para borrar una actualizacion de Datos --------------------
    PROCEDURE pr_eliminar_planilla(
      P_AF_ID          IN AF_ACTIVO_FIJO.AF_ID%TYPE
    )
    IS
      v_contador INTEGER := 0;
    BEGIN
        WHILE v_contador <= 2 LOOP
            BEGIN
                DELETE FROM af_activo_fijo
                WHERE af_id = P_AF_ID;
                COMMIT;
                EXIT;
            EXCEPTION
                WHEN OTHERS THEN
                    IF SQLCODE = -60 THEN
                        v_contador := v_contador + 1;
                        IF v_contador > 2 THEN
                            RAISE_APPLICATION_ERROR(-20008, 'Error de deadlock al borrar el activo.');
                        END IF;
                    ELSE
                        RAISE_APPLICATION_ERROR(-20009, 'Error al borrar los datos: ' || SQLERRM);
                    END IF;
            END;
        END LOOP;
    END pr_eliminar_planilla;
    ------------------ procedimiento para actualizar detalle de planilla en edicion -------------------
    PROCEDURE pr_actualizar_datos_detalle_planilla (
      p_af_id              IN af_activo_fijo.af_id%TYPE,
      p_descripcion        IN af_activo_fijo.descripcion%TYPE,
      p_ahno_vida_util     IN af_activo_fijo.ahno_vida_util%TYPE,
      p_cod_sucursal       IN af_activo_fijo.cod_sucursal%TYPE,
      p_cod_oficina        IN af_activo_fijo.cod_oficina%TYPE,
      p_cod_persona        IN af_activo_fijo.cod_persona%TYPE,
      p_af_obs             IN af_activo_fijo.af_obs%TYPE
    )
    IS
      V_USER  VARCHAR2(8) := FN_USER;
      V_FECHA DATE := CURRENT_DATE;
      v_count NUMBER;
    BEGIN
      SELECT COUNT(*)
      INTO v_count
      FROM af_activo_fijo
      WHERE af_id = p_af_id
      AND ROWNUM = 1;
      IF v_count > 1 THEN
        RAISE_APPLICATION_ERROR(-20011, 'El código AF_ID ya está en uso.');
      END IF;
      UPDATE af_activo_fijo
      SET  af_id = p_af_id,
        descripcion = p_descripcion,
        fec_ult_act = V_FECHA,
        usr_ult_act =  V_USER,
        ahno_vida_util = p_ahno_vida_util,
        cod_sucursal = p_cod_sucursal,
        cod_oficina = p_cod_oficina,
        cod_persona = p_cod_persona,
        af_obs = p_af_obs
      WHERE af_id = p_af_id;
      COMMIT;
    EXCEPTION
      WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(-20010, 'Error al actualizar los datos: ' || SQLERRM);
    END pr_actualizar_datos_detalle_planilla;
    -------------------- proceso para borrar un detalle de planilla en edicion ------------------------
    PROCEDURE pr_eliminar_detalle_planilla(
      p_af_cms_id          IN af_movs.af_cms_id%TYPE,
      p_af_id              IN af_movs.AF_ID%TYPE
    )
    IS
        v_contador INTEGER := 0;
    BEGIN
        WHILE v_contador <= 2
        LOOP
            BEGIN
                DELETE FROM af_movs
                WHERE af_cms_id = p_af_cms_id
                AND af_id = p_af_id;
                COMMIT;
                EXIT;
            EXCEPTION
                WHEN OTHERS THEN
                    IF SQLCODE = -60 THEN
                        v_contador := v_contador + 1;
                        IF v_contador > 2 THEN
                            RAISE_APPLICATION_ERROR(-20011, 'Error de deadlock al borrar el activo.');
                        END IF;
                    ELSE
                        RAISE_APPLICATION_ERROR(-20012, 'Error al borrar los datos: ' || SQLERRM);
                    END IF;
            END;
        END LOOP;
    END pr_eliminar_detalle_planilla;
    ----------------- procedimiento para pasar al siguiente codigo af_codigo ---------------------
    PROCEDURE pr_sgte_af_codigo(
      p_af_rubro_id          IN  af_subrubro.af_rubro_id%TYPE,
      p_af_subrubro_id       IN  af_subrubro.af_subrubro_id%TYPE,
      p_af_codigo            OUT CHAR
    ) AS
        l_ult_codigo  INTEGER;
        l_srubro      VARCHAR2(10);
        l_ssubrubro   VARCHAR2(10);
        l_snro        VARCHAR2(10);
        l_ceros       CHAR(12) := '000000000000';
        l_err_text    VARCHAR2(4000);
    BEGIN
        BEGIN
            SELECT NVL(MAX(ult_codigo), 0) + 1
            INTO l_ult_codigo
            FROM af_subrubro
            WHERE af_subrubro_id = p_af_subrubro_id
              AND af_rubro_id = p_af_rubro_id;
        EXCEPTION
            WHEN NO_DATA_FOUND THEN
                DBMS_OUTPUT.PUT_LINE('No se encontró el Sub Rubro con el código ingresado: ' || p_af_subrubro_id);
                RETURN;
            WHEN OTHERS THEN
                l_err_text := SQLERRM;
                DBMS_OUTPUT.PUT_LINE('Error al obtener el último código: ' || l_err_text);
                RAISE_APPLICATION_ERROR(-20013, 'Error en pr_sgte_af_codigo: ' || l_err_text);
                RETURN;
        END;
        UPDATE af_subrubro
        SET ult_codigo = l_ult_codigo
        WHERE af_rubro_id = p_af_rubro_id
          AND af_subrubro_id = p_af_subrubro_id;
        IF SQL%ROWCOUNT = 0 THEN
            DBMS_OUTPUT.PUT_LINE('No se pudo actualizar el último código.');
            RETURN;
        END IF;
        l_srubro := LPAD(TO_CHAR(p_af_rubro_id), 3, '0');
        l_ssubrubro := LPAD(TO_CHAR(p_af_subrubro_id), 3, '0');
        l_snro := LPAD(TO_CHAR(l_ult_codigo), 4, '0');
        p_af_codigo := l_srubro || '-' || l_ssubrubro || '-' || l_snro;
        DBMS_OUTPUT.PUT_LINE('Nuevo Código Generado: ' || p_af_codigo);
    EXCEPTION
        WHEN OTHERS THEN
            l_err_text := SQLERRM;
            DBMS_OUTPUT.PUT_LINE('Error: ' || l_err_text);
            RAISE_APPLICATION_ERROR(-20014, 'Error en pr_sgte_af_codigo: ' || l_err_text);
    END pr_sgte_af_codigo;
    --------------------- procedimiento para cerrar una planilla en edicion ----------------------
      PROCEDURE pr_afj02045(
        p_af_cms_id             IN AF_CABMOVS.af_cms_id%TYPE
    ) IS
        l_estado              AF_ACTIVO_FIJO.af_estado%TYPE;
        l_af_id               AF_MOVS.af_id%TYPE;
        l_af_subrubro_id      AF_ACTIVO_FIJO.af_subrubro_id%TYPE;
        l_af_codigo           AF_ACTIVO_FIJO.af_codigo%TYPE;
        l_af_rubro_id         AF_ACTIVO_FIJO.af_rubro_id%TYPE;
        CURSOR c_af_activos IS
          SELECT af.af_id, af.af_subrubro_id, af.af_rubro_id
          FROM af_activo_fijo af
          JOIN af_movs afm ON af.af_id = afm.af_id
          WHERE afm.af_cms_id = p_af_cms_id;
    BEGIN
        pkg_ic.inicializar;
        BEGIN
            SELECT estado_movs INTO l_estado
            FROM af_CabMovs
            WHERE af_cms_id = p_af_cms_id;
        EXCEPTION
            WHEN NO_DATA_FOUND THEN
               RAISE_APPLICATION_ERROR(-20015, 'Error al ejecutar: ' || SQLERRM);
        END;
        IF l_estado != 'EDIT' THEN
            RAISE_APPLICATION_ERROR(-20016, 'Error al ejecutar: ' || SQLERRM);
        END IF;
        FOR r IN c_af_activos LOOP
            l_af_id := r.af_id;
            l_af_subrubro_id := r.af_subrubro_id;
            l_af_rubro_id := r.af_rubro_id;
            pr_sgte_Af_Codigo(
                p_af_rubro_id => l_af_rubro_id,
                p_af_subrubro_id => l_af_subrubro_id,
                p_af_codigo => l_af_codigo
            );
            UPDATE af_activo_fijo
            SET af_codigo = l_af_codigo,
                fec_alta = current_date,
                usr_alta = pkg_ic.g_usuario,
                fec_ult_act = current_date,
                usr_ult_act = pkg_ic.g_usuario,
                af_estado = 'ACTI'
            WHERE af_id = l_af_id;
            IF SQL%ROWCOUNT = 0 THEN
                RAISE_APPLICATION_ERROR(-20017, 'Error al ejecutar: ' || SQLERRM);
            END IF;
        END LOOP;
        UPDATE af_CabMovs
        SET estado_movs = 'CERR'
        WHERE af_cms_id = p_af_cms_id
        AND estado_movs = 'EDIT';
        IF SQL%ROWCOUNT = 0 THEN
            RAISE_APPLICATION_ERROR(-20018, 'Error al ejecutar: ' || SQLERRM);
        END IF;
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            RAISE_APPLICATION_ERROR(-20019, 'Error al ejecutar: ' || SQLERRM);
    END pr_afj02045;
    ----------------------- procedimiento para cancelar planillas con estado edit -------------------
    PROCEDURE pr_afj02055(
      p_af_cms_id         IN AF_CABMOVS.af_cms_id%TYPE
    ) AS
        l_estado          CHAR(4);
        l_af_id           INTEGER;
    BEGIN
        pkg_ic.inicializar;
        SELECT estado_movs INTO l_estado
        FROM af_CabMovs
        WHERE af_cms_id = p_af_cms_id;
        IF SQL%NOTFOUND THEN
            ROLLBACK;
            DBMS_OUTPUT.PUT_LINE('No se encontró la planilla Nro. ' || p_af_cms_id);
            RETURN;
        ELSIF l_estado != 'EDIT' THEN
            ROLLBACK;
            DBMS_OUTPUT.PUT_LINE('Esta planilla no se encuentra en estado EDIT');
            RETURN;
        END IF;
        SELECT af_id INTO l_af_id
        FROM af_Movs
        WHERE af_cms_id = p_af_cms_id;
          LOOP
            UPDATE af_activo_fijo
            SET af_estado = 'CANC'
            WHERE af_id = l_af_id;
            IF SQL%NOTFOUND THEN
                ROLLBACK;
                DBMS_OUTPUT.PUT_LINE('No se encontró el Activo Fijo para actualizar');
                RETURN;
            END IF;
          END LOOP;
        UPDATE af_CabMovs
        SET estado_movs = 'CANC'
        WHERE af_cms_id = p_af_cms_id
          AND estado_movs = 'EDIT';
        IF SQL%NOTFOUND THEN
            ROLLBACK;
            DBMS_OUTPUT.PUT_LINE('No se actualizó el estado de la Planilla');
            RETURN;
        END IF;
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20020, 'Error al ejecutar: ' || SQLERRM);
    END pr_afj02055;
   --------------------------- procedimientos para el user incluir (afj02020) -------------------------------------
  PROCEDURE pr_sgteAfCodigo (
    p_af_subrubro_id IN NUMBER,
    p_af_rubro_id IN NUMBER,
    p_af_codigo OUT VARCHAR2
  ) IS
    v_ult_codigo NUMBER;
    v_srubro VARCHAR2(10);
    v_ssubrubro VARCHAR2(10);
    v_snro VARCHAR2(10);
    v_ceros VARCHAR2(4) := '0000';
  BEGIN
    BEGIN
      SELECT NVL(ult_codigo, 0) + 1
      INTO v_ult_codigo
      FROM af_subrubro
      WHERE af_subrubro_id = p_af_subrubro_id
        AND af_rubro_id = p_af_rubro_id;
    EXCEPTION
      WHEN NO_DATA_FOUND THEN
        RAISE_APPLICATION_ERROR(-20021, 'No se encontró el Sub Rubro con el código ingresado...');
    END;
    UPDATE af_subrubro
    SET ult_codigo = v_ult_codigo
    WHERE af_subrubro_id = p_af_subrubro_id
      AND af_rubro_id = p_af_rubro_id;
    IF SQL%ROWCOUNT = 0 THEN
      RAISE_APPLICATION_ERROR(-20022, 'No se pudo actualizar el último código.');
    END IF;
    v_srubro := LPAD(p_af_rubro_id, 3, '0');
    v_ssubrubro := LPAD(p_af_subrubro_id, 3, '0');
    v_snro := LPAD(v_ult_codigo, 4, '0');
    p_af_codigo := v_srubro || '-' || v_ssubrubro || '-' || v_snro;
  EXCEPTION
    WHEN OTHERS THEN
      RAISE_APPLICATION_ERROR(-20023, SQLERRM);
  END pr_sgteAfCodigo;
  -- procedimiento parar agregar a planilla
  PROCEDURE pr_agregarAPlanilla (
    p_af_id                 IN OUT NUMBER,
    p_af_cms_id             IN OUT NUMBER,
    p_cod_sucursal                  IN number,
    p_cod_oficina                   IN VARCHAR2,
    --p_cod_departamento              IN VARCHAR2,
    --p_cod_organizacion              IN VARCHAR2,
    p_cod_persona                   IN VARCHAR2
  ) IS
    v_item NUMBER;
  BEGIN
    BEGIN
      SELECT NVL(MAX(item), 0) + 1
      INTO v_item
      FROM af_movs
      WHERE af_cms_id = p_af_cms_id;
    EXCEPTION
      WHEN NO_DATA_FOUND THEN
        RAISE_APPLICATION_ERROR(-20024, 'Ocurrió un error al recuperar el número de item. Proc.: agregarAPlanilla');
    END;
    --RAISE_APPLICATION_ERROR(-20033, 'Error ' || 'p_af_cms_id: ' || p_af_cms_id);
    INSERT INTO af_movs (
      af_cms_id,
      af_id,
      item,
      cod_sucursal,
      --cod_organizacion,
      --cod_departamento,
      cod_oficina,
      cod_persona
    ) VALUES (
      p_af_cms_id,
      p_af_id,
      v_item,
      p_cod_sucursal,
      --p_cod_organizacion,
      --p_cod_departamento,
      p_cod_oficina,
      p_cod_persona
    );
    IF SQL%ROWCOUNT = 0 THEN
      RAISE_APPLICATION_ERROR(-20025, 'Ocurrió un error al insertar el detalle del movimiento. Proc.: agregarAPlanilla');
    END IF;
    COMMIT;
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      RAISE;
  END pr_agregarAPlanilla;
  PROCEDURE pr_insertarActivoFijo(
    p_af_cms_id                     IN OUT NUMBER,
    p_af_rubro_id                   IN af_activo_fijo.af_rubro_id%TYPE,
    p_af_subrubro_id                IN af_activo_fijo.af_subrubro_id%TYPE,
    p_cod_temporal                  IN af_activo_fijo.af_cod_temporal%TYPE,
    p_descripcion                   IN af_activo_fijo.descripcion%TYPE,
    p_cod_sucursal                  IN af_activo_fijo.cod_sucursal%TYPE,
    p_cod_oficina                   IN af_activo_fijo.cod_oficina%TYPE,
    --p_cod_departamento              IN af_activo_fijo.cod_departamento%TYPE,
    --p_cod_organizacion              IN af_activo_fijo.cod_organizacion%TYPE,
    p_cod_persona                   IN af_activo_fijo.cod_persona%TYPE,
    p_af_obs                        IN af_activo_fijo.af_obs%TYPE
  ) IS
    v_af_id       number;
    v_af_codigo   VARCHAR2(12);
    v_g_status    number;
    v_fec_ult_act DATE := CURRENT_DATE;
    v_usr_ult_act VARCHAR2(8) := FN_USER;
    v_desc_duplicada VARCHAR2(255);
    v_cod_persona_duplicada af_activo_fijo.cod_persona%TYPE;
  BEGIN
    BEGIN
      SELECT descripcion, cod_persona
      INTO v_desc_duplicada, v_cod_persona_duplicada
      FROM af_activo_fijo
      WHERE af_cod_temporal = p_cod_temporal;
      RAISE_APPLICATION_ERROR(
        -20026,
        ' El Código temporal ' || p_cod_temporal ||
        ' ya fue utilizado con el activo ' || v_desc_duplicada ||
        ' relacionado al código de persona Nº ' || v_cod_persona_duplicada
      );
    EXCEPTION
      WHEN NO_DATA_FOUND THEN
        NULL;
    END;
    pr_sgteAfCodigo(
      p_af_subrubro_id => p_af_subrubro_id,
      p_af_rubro_id => p_af_rubro_id,
      p_af_codigo => v_af_codigo
    );
    IF v_g_status != 0 THEN
      RAISE_APPLICATION_ERROR(-20027, 'Error al obtener el siguiente código.');
    END IF;
    BEGIN
      SELECT NVL(MAX(af_id), 0) + 1
      INTO v_af_id
      FROM af_activo_fijo;
    EXCEPTION
      WHEN OTHERS THEN
        Raise_Application_Error(-20028, 'Error al generar el id de la tabla af_activo_fijo...' || SQLERRM, TRUE);
    END;
    INSERT INTO af_activo_fijo (
      af_id,
      af_codigo,
      af_cod_temporal,
      descripcion,
      af_subrubro_id,
      af_rubro_id,
      fec_alta,
      usr_alta,
      fec_ult_act,
      usr_ult_act,
      cod_sucursal,
      cod_oficina,
      --cod_departamento,
      --cod_organizacion,
      cod_persona,
      af_estado,
      af_obs
    ) VALUES (
      v_af_id,
      v_af_codigo,
      p_cod_temporal,
      p_descripcion,
      p_af_subrubro_id,
      p_af_rubro_id,
      v_fec_ult_act,
      v_usr_ult_act,
      v_fec_ult_act,
      v_usr_ult_act,
      p_cod_sucursal,
      p_cod_oficina,
      --p_cod_departamento,
      --p_cod_organizacion,
      p_cod_persona,
      'EDIT',
      p_af_obs
    );
    IF SQL%ROWCOUNT = 0 THEN
      RAISE_APPLICATION_ERROR(-20029, 'Ocurrió un error al insertar el Activo.' || SQLERRM);
    END IF;
    BEGIN
      pr_agregarAPlanilla(v_af_id, p_af_cms_id, p_cod_sucursal, p_cod_oficina,  p_cod_persona);
      -- p_cod_departamento, p_cod_organizacion
    EXCEPTION
      WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(-20030, 'Error al agregar a la planilla: ' || SQLERRM);
    END;
    COMMIT;
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      RAISE;
  END pr_insertarActivoFijo;
  ------------------- procedimiento para listar activos por responsable ----------------------
  PROCEDURE pr_listar_activo_por_responsable(
      P_COD_SUCURSAL            af_activo_fijo.cod_sucursal%TYPE,
      P_COD_RESPONSABLE         perspers.cod_persona%TYPE
  )
  IS
  BEGIN
      apex_collection.create_or_truncate_collection(p_collection_name => 'TMP_ACRES');
      -- Insertar los registros en la coleccion
      FOR rec IN (
          SELECT
          af.af_id,
          af.af_codigo,
          af.af_cod_temporal,
          af.descripcion,
          (SELECT pers.nro_cedula_id FROM persona pers WHERE af.cod_persona = pers.cod_persona) AS nro_cedula_id,
          (SELECT pers.cod_persona FROM persona pers WHERE af.cod_persona = pers.cod_persona) AS cod_persona,
          (SELECT pers.nombre FROM persona pers WHERE af.cod_persona = pers.cod_persona) AS nombre,
          (SELECT org.cod_organizacion FROM organizacion org WHERE af.cod_organizacion = org.cod_organizacion) AS cod_organizacion,
          (SELECT org.organizacion FROM organizacion org WHERE af.cod_organizacion = org.cod_organizacion) AS organizacion,
          af.cod_oficina,
          af.cod_departamento,
          (SELECT o.descripcion FROM oficina o WHERE af.cod_oficina = o.cod_oficina) AS oficina
      FROM
          af_activo_fijo af
      WHERE
          (P_COD_SUCURSAL = -1 OR af.cod_sucursal = P_COD_SUCURSAL)
          AND (P_COD_RESPONSABLE = -1 OR af.cod_persona = P_COD_RESPONSABLE  )
      ORDER BY
          af.af_id
      )
      LOOP
          apex_collection.add_member(
              p_collection_name => 'TMP_ACRES',
              p_c001 => rec.af_id,
              p_c002 => rec.af_codigo,
              p_c003 => rec.af_cod_temporal,
              p_c004 => rec.descripcion,
              p_c005 => rec.nro_cedula_id,
              p_c006 => rec.cod_persona,
              p_c007 => rec.nombre,
              p_c008 => rec.cod_organizacion,
              p_c009 => rec.organizacion,
              p_c010 => rec.cod_oficina,
              p_c011 => rec.cod_departamento,
              p_c012 => rec.oficina
          );
      END LOOP;
  END pr_listar_activo_por_responsable;
END "PKG_CARGA_INICIAL_ACTIVO_FIJO";
/

