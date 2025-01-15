CREATE OR REPLACE procedure pr_actualiza_fecha_sistema(P_DUMMY_KEY     IN INGRID_CONTROL.DUMMY_KEY%TYPE,
                                                       P_FECHA_VIRTUAL IN INGRID_CONTROL.FECHA_VIRTUAL%TYPE,
                                                       P_USR_ULT_MOD   IN INGRID_CONTROL.USR_ULT_MOD%TYPE)

IS
V_FEC_ULT_MOD INGRID_CONTROL.FEC_ULT_MOD%TYPE = CURRENT_DATE;
BEGIN
  --RAISE_APPLICATION_ERROR (-20000, 'V_FEC_ULT_MOD ' V_FEC_ULT_MOD);
   UPDATE INGRID_CONTROL
     SET FECHA_VIRTUAL = P_FECHA_VIRTUAL,
           FEC_ULT_MOD = V_FEC_ULT_MOD,
           USR_ULT_MOD = P_USR_ULT_MOD
   WHERE DUMMY_KEY   = P_DUMMY_KEY;
EXCEPTION
    WHEN OTHERS THEN
       RAISE_APPLICATION_ERROR(-20002,'Se ha producido un error al actualizar la fecha del sistema...');


END;

