/* Formatted on 10/08/2014 07:30:13 p.m. (QP5 v5.163.1008.3004) */
CREATE OR REPLACE PACKAGE BODY SEGURIDAD.PKG_SESSION
AS
   PROCEDURE getListaSession (v_LISTA OUT cursorlista)
   IS
      var_lista   cursorlista;
   BEGIN
      OPEN var_lista FOR
         SELECT PERS_EMPRESA_N_PK pPers_empresa_n_pk,
                PERS_PERSONA_N_PK pPers_persona_n_pk,
                SESS_IDSESSION_N_PK pSess_idsession_n_pk,
                SESS_FECHAREGISTRO_D pSess_fecharegistro_d,
                SESS_FECHATERMINO_D pSess_fechatermino_d,
                SUCU_IDSUCURSAL_N pSess_idsucursal_n,
                SESS_ACCESOREMOTO_N pSess_accesoremoto_n,
                SESS_IDESTADOSESSION_N pSess_idestadosession_n,
                SESS_IDWEBSESSION_N pSess_idwebsession_n,
                SESS_SID_N pSess_sid_v,
                SESS_MACADDRESS_V pSess_macaddress_v,
                SESS_INDCABINA_N pSess_indcabina_n
           FROM SEG_V_SESSION;

      v_LISTA := var_lista;
   END getListaSession;

   PROCEDURE getListaPorPk (
      v_LISTA             OUT cursorlista,
      --V_PERS_EMPRESA_N_PK   IN     SEG_V_SESSION.PERS_EMPRESA_N_PK%TYPE,
      --V_PERSONA_N_PK        IN     SEG_V_SESSION.PERS_PERSONA_N_PK%TYPE,
      V_SESSION_N_PK   IN     SEG_V_SESSION.SESS_IDSESSION_N_PK%TYPE)
   IS
      var_lista   cursorlista;
   BEGIN
      OPEN var_lista FOR
         SELECT PERS_EMPRESA_N_PK pPers_empresa_n_pk,
                PERS_PERSONA_N_PK pPers_persona_n_pk,
                SESS_IDSESSION_N_PK pSess_idsession_n_pk,
                SESS_FECHAREGISTRO_D pSess_fecharegistro_d,
                SESS_FECHATERMINO_D pSess_fechatermino_d,
                SUCU_IDSUCURSAL_N pSess_idsucursal_n,
                SESS_ACCESOREMOTO_N pSess_accesoremoto_n,
                SESS_IDESTADOSESSION_N pSess_idestadosession_n,
                SESS_IDWEBSESSION_N pSess_idwebsession_n,
                SESS_SID_N pSess_sid_v,
                SESS_MACADDRESS_V pSess_macaddress_v,
                SESS_INDCABINA_N pSess_indcabina_n
           FROM SEG_V_SESSION SES
          WHERE /*SES.PERS_EMPRESA_N_PK = V_PERS_EMPRESA_N_PK
            AND SES.PERS_PERSONA_N_PK = V_PERSONA_N_PK
            AND */
               SES.SESS_IDSESSION_N_PK = V_SESSION_N_PK;

      v_LISTA := var_lista;
   END getListaPorPk;

   PROCEDURE grabar (
      V_PERS_EMPRESA_N_PK   IN OUT SEG_V_SESSION.PERS_EMPRESA_N_PK%TYPE,
      V_PERSONA_N_PK        IN OUT SEG_V_SESSION.PERS_PERSONA_N_PK%TYPE,
      V_SESSION_N_PK        IN OUT SEG_V_SESSION.SESS_IDSESSION_N_PK%TYPE,
      V_FECHAREGISTRO_D     IN OUT SEG_V_SESSION.SESS_FECHAREGISTRO_D%TYPE,
      V_FECHATERMINO_D      IN OUT SEG_V_SESSION.SESS_FECHATERMINO_D%TYPE,
      V_SUCURSAL_N          IN OUT SEG_V_SESSION.SUCU_IDSUCURSAL_N%TYPE,
      V_ACCESO_REMOTO_N     IN OUT SEG_V_SESSION.SESS_ACCESOREMOTO_N%TYPE,
      V_ID_ESTADOSESION_N   IN OUT SEG_V_SESSION.SESS_IDESTADOSESSION_N%TYPE,
      V_ID_WEBSESSION_N     IN OUT SEG_V_SESSION.SESS_IDWEBSESSION_N%TYPE,
      V_ID_SID_N            IN OUT SEG_V_SESSION.SESS_SID_N%TYPE,
      V_MACADDRESS_V        IN OUT SEG_V_SESSION.SESS_MACADDRESS_V%TYPE,
      V_INDCABINA_N         IN OUT SEG_V_SESSION.SESS_INDCABINA_N%TYPE)
   IS
   BEGIN
      SELECT SEQ_SEG_V_SESSION.NEXTVAL INTO V_SESSION_N_PK FROM DUAL;

      INSERT INTO SEG_V_SESSION (PERS_EMPRESA_N_PK,
                                 PERS_PERSONA_N_PK,
                                 SESS_IDSESSION_N_PK,
                                 SESS_FECHAREGISTRO_D,
                                 SESS_FECHATERMINO_D,
                                 SUCU_IDSUCURSAL_N,
                                 SESS_ACCESOREMOTO_N,
                                 SESS_IDESTADOSESSION_N,
                                 SESS_IDWEBSESSION_N,
                                 SESS_SID_N,
                                 SESS_MACADDRESS_V,
                                 SESS_INDCABINA_N)
           VALUES (V_PERS_EMPRESA_N_PK,
                   V_PERSONA_N_PK,
                   V_SESSION_N_PK,
                   V_FECHAREGISTRO_D,
                   V_FECHATERMINO_D,
                   V_SUCURSAL_N,
                   V_ACCESO_REMOTO_N,
                   V_ID_ESTADOSESION_N,
                   V_ID_WEBSESSION_N,
                   V_ID_SID_N,
                   V_MACADDRESS_V,
                   V_INDCABINA_N);
   END grabar;

   PROCEDURE modificar (
      V_PERS_EMPRESA_N_PK   IN OUT SEG_V_SESSION.PERS_EMPRESA_N_PK%TYPE,
      V_PERSONA_N_PK        IN OUT SEG_V_SESSION.PERS_PERSONA_N_PK%TYPE,
      V_SESSION_N_PK        IN OUT SEG_V_SESSION.SESS_IDSESSION_N_PK%TYPE,
      V_FECHAREGISTRO_D     IN OUT SEG_V_SESSION.SESS_FECHAREGISTRO_D%TYPE,
      V_FECHATERMINO_D      IN OUT SEG_V_SESSION.SESS_FECHATERMINO_D%TYPE,
      V_SUCURSAL_N          IN OUT SEG_V_SESSION.SUCU_IDSUCURSAL_N%TYPE,
      V_ACCESO_REMOTO_N     IN OUT SEG_V_SESSION.SESS_ACCESOREMOTO_N%TYPE,
      V_ID_ESTADOSESION_N   IN OUT SEG_V_SESSION.SESS_IDESTADOSESSION_N%TYPE,
      V_ID_WEBSESSION_N     IN OUT SEG_V_SESSION.SESS_IDWEBSESSION_N%TYPE,
      V_ID_SID_N            IN OUT SEG_V_SESSION.SESS_SID_N%TYPE,
      V_MACADDRESS_V        IN OUT SEG_V_SESSION.SESS_MACADDRESS_V%TYPE,
      V_INDCABINA_N         IN OUT SEG_V_SESSION.SESS_INDCABINA_N%TYPE)
   IS
   BEGIN
      UPDATE SEG_V_SESSION
         SET SESS_FECHAREGISTRO_D = V_FECHAREGISTRO_D,
             SESS_FECHATERMINO_D = V_FECHATERMINO_D,
             SUCU_IDSUCURSAL_N = V_SUCURSAL_N,
             SESS_ACCESOREMOTO_N = V_ACCESO_REMOTO_N,
             SESS_IDESTADOSESSION_N = V_ID_ESTADOSESION_N,
             SESS_IDWEBSESSION_N = V_ID_WEBSESSION_N,
             SESS_SID_N = V_ID_SID_N,
             SESS_MACADDRESS_V = V_MACADDRESS_V,
             SESS_INDCABINA_N = V_INDCABINA_N
       WHERE     PERS_EMPRESA_N_PK = V_PERS_EMPRESA_N_PK
             AND PERS_PERSONA_N_PK = V_PERSONA_N_PK
             AND SESS_IDSESSION_N_PK = V_SESSION_N_PK;
   END modificar;

   PROCEDURE getValidSessionByUser (
      V_PERSONA_N_PK   IN     SEG_V_SESSION.PERS_PERSONA_N_PK%TYPE,
      V_ACTSESSION_N      OUT NUMBER)
   IS
   BEGIN
      SELECT COUNT (1)
        INTO V_ACTSESSION_N
        FROM SEG_V_SESSION SES
       WHERE                     --SES.PERS_EMPRESA_N_PK = V_PERS_EMPRESA_N_PK
            SES.PERS_PERSONA_N_PK = V_PERSONA_N_PK
             AND SES.SESS_IDESTADOSESSION_N = PKG_CONSTANTE.C_ESTADO_ACTIVO;
   END getValidSessionByUser;

   PROCEDURE getListByUser (
      v_LISTA             OUT cursorlista,
      V_PERSONA_N_PK   IN     SEG_V_SESSION.PERS_PERSONA_N_PK%TYPE)
   IS
      var_lista   cursorlista;
   BEGIN
      OPEN var_lista FOR
         SELECT PERS_EMPRESA_N_PK pPers_empresa_n_pk,
                PERS_PERSONA_N_PK pPers_persona_n_pk,
                SESS_IDSESSION_N_PK pSess_idsession_n_pk,
                SESS_FECHAREGISTRO_D pSess_fecharegistro_d,
                SESS_FECHATERMINO_D pSess_fechatermino_d,
                SUCU_IDSUCURSAL_N pSess_idsucursal_n,
                SESS_ACCESOREMOTO_N pSess_accesoremoto_n,
                SESS_IDESTADOSESSION_N pSess_idestadosession_n,
                SESS_IDWEBSESSION_N pSess_idwebsession_n,
                SESS_SID_N pSess_sid_v,
                SESS_MACADDRESS_V pSess_macaddress_v,
                SESS_INDCABINA_N pSess_indcabina_n
           FROM SEG_V_SESSION SES
          WHERE SES.PERS_PERSONA_N_PK = V_PERSONA_N_PK
                AND SES.SESS_IDESTADOSESSION_N =
                       PKG_CONSTANTE.C_ESTADO_ACTIVO;

      v_LISTA := var_lista;
   END getListByUser;

   -------------------------------------------------------------------------------------------------------------------------
   PROCEDURE getListSessionWeb (
      v_LISTA                       OUT cursorlista,
      v_pers_empresa_n_pk        IN     seg_v_session.pers_empresa_n_pk%TYPE,
      v_sucu_idsucursal_n        IN     SEG_V_SESSION.SUCU_IDSUCURSAL_N%TYPE,
      v_pers_natu_nombres        IN     persona.per_natural.natu_nombres_v%TYPE,
      v_sess_fecharegistro_d     IN     seg_v_session.sess_fecharegistro_d%TYPE,
      v_sess_fechatermino_d      IN     seg_v_session.sess_fechatermino_d%TYPE,
      v_sess_idestadosession_n   IN     seg_v_session.sess_idestadosession_n%TYPE)
   IS
      var_lista   cursorlista;
   BEGIN
      OPEN var_lista FOR
           SELECT SV.PERS_EMPRESA_N_PK pPers_empresa_n_pk,
                  SV.PERS_PERSONA_N_PK pPers_persona_n_pk,
                  SV.SESS_IDSESSION_N_PK pSess_idsession_n_pk,
                  SV.SESS_FECHAREGISTRO_D pSess_fecharegistro_d,
                  SV.SESS_FECHATERMINO_D pSess_fechatermino_d,
                  SV.SUCU_IDSUCURSAL_N pSess_idsucursal_n,
                  SV.SESS_ACCESOREMOTO_N pSess_accesoremoto_n,
                  SV.SESS_IDESTADOSESSION_N pSess_idestadosession_n,
                  SV.SESS_IDWEBSESSION_N pSess_idwebsession_n,
                  SV.SESS_SID_N pSess_sid_v,
                  SV.SESS_MACADDRESS_V pSess_macaddress_v,
                  SV.SESS_INDCABINA_N pSess_indcabina_n
             /*SELECT sv.sess_idsession_n_pk,
                    sv.pers_persona_n_pk AS cod_persona,
                    (   pn0.natu_nombres_v
                     || '-'
                     || pn0.natu_apellidopaterno_v
                     || '-'
                     || pn0.natu_apellidopaterno_v)
                       AS pFullName_v,
                    sv.sess_idestadosession_n pSess_idestadosession_n,
                    sv.pers_empresa_n_pk pPers_empresa_n_pk,
                    pj0.juri_razonsocial_v pPers_razonsocial_v,
                    pj0.juri_siglas_v pPers_siglas_v,
                    sc.pers_persona_n_pk pPers_sucursal_n_pk,
                    pj1.juri_razonsocial_v pSucursal_v,
                    pj1.juri_siglas_v pSiglasSucursal_v,
                    sv.sess_fecharegistro_d pSess_fecharegistro_d,
                    sv.sess_fechatermino_d pSess_fechatermino_d,
                    sv.sess_macaddress_v pSess_macaddress_v*/
             FROM seg_v_session sv
                  LEFT JOIN persona.per_juridica pj0
                     ON sv.pers_empresa_n_pk = pj0.pers_persona_n
                  LEFT JOIN persona.per_natural pn0
                     ON sv.pers_persona_n_pk = pn0.pers_persona_n
                  LEFT JOIN seg_m_sucursal sc
                     ON sc.sucu_idsucursal_n = sv.sucu_idsucursal_n
                  LEFT JOIN persona.per_juridica pj1
                     ON sc.pers_persona_n_pk = pj1.pers_persona_n
            WHERE (v_pers_empresa_n_pk IS NULL
                   OR sv.pers_empresa_n_pk = v_pers_empresa_n_pk) /*AND v_sucu_idsucursal_n IS NULL
                                                              OR sc.pers_persona_n_pk = v_sucu_idsucursal_n*/
                  AND (v_sucu_idsucursal_n IS NULL
                       OR SC.SUCU_IDSUCURSAL_N = v_sucu_idsucursal_n)
                  AND v_pers_natu_nombres IS NULL
                  OR UPPER (
                           pn0.natu_nombres_v
                        || '-'
                        || pn0.natu_apellidopaterno_v
                        || '-'
                        || pn0.natu_apellidopaterno_v) LIKE
                        '%' || UPPER (v_pers_natu_nombres) || '%'
                     AND v_sess_fecharegistro_d IS NULL
                  OR sv.sess_fecharegistro_d <= v_sess_fecharegistro_d
                     AND v_sess_fechatermino_d IS NULL
                  OR sv.sess_fechatermino_d <= v_sess_fechatermino_d
                     AND v_sess_idestadosession_n IS NULL
                  OR sv.sess_idestadosession_n <= v_sess_idestadosession_n
         ORDER BY 1 ASC;

      v_LISTA := var_lista;
   END getListSessionWeb;

   PROCEDURE getListBlockDB (v_LISTA        OUT cursorlista,
                             v_schema    IN     VARCHAR2,
                             v_program   IN     VARCHAR2,
                             v_object    IN     VARCHAR2)
   IS
      var_lista   cursorlista;
   BEGIN
      OPEN var_lista FOR
         SELECT s.SID pSID_V,
                s.SERIAL# pSERIAL_V,
                S.OSUSER pPCUSER_V,
                S.USERNAME pBDUSER_V,
                DECODE (L.TYPE,  'TM', 'TABLE',  'TX', 'RECORDS') pTYPELOCK_V,
                S.PROCESS pPROCESS_LOCKER_V,
                s.schemaname pSCHEMA_V,
                O.OBJECT_NAME pOBJECT_NAME_V,
                O.OBJECT_TYPE pOBJECT_TYPE_V,
                DECODE (CONCAT ('', S.PROGRAM),
                        'JDBC Thin Client', 'ERP TUMI',
                        CONCAT ('', S.PROGRAM))
                   pPROGRAM_V,
                O.OWNER pOWNER_V,
                vs.sql_text pSQL_QUERY_V,
                NULL pMACHINE_V,
                NULL pSQLID_V
           FROM v$lock l,
                dba_objects o,
                v$session s,
                v$sqlarea vs
          WHERE     l.ID1 = o.OBJECT_ID
                AND s.SID = l.SID
                AND l.TYPE IN ('TM', 'TX')
                AND s.sql_id = vs.sql_id
                AND (v_schema IS NULL
                     OR s.schemaname LIKE '%' || v_schema || '%')
                AND (v_program IS NULL
                     OR (DECODE (CONCAT ('', S.PROGRAM),
                                 'JDBC Thin Client', 'ERP TUMI',
                                 CONCAT ('', S.PROGRAM))) LIKE
                           '%' || v_program || '%')
                AND (v_object IS NULL
                     OR (O.OBJECT_NAME) LIKE '%' || v_object || '%');

      v_LISTA := var_lista;
   END getListBlockDB;

   PROCEDURE getListSessionDB (v_LISTA        OUT cursorlista,
                               v_schema    IN     VARCHAR2,
                               v_program   IN     VARCHAR2)
   IS
      var_lista   cursorlista;
   BEGIN
      OPEN var_lista FOR
           SELECT S.SID pSID_V,
                  S.SERIAL# AS pSERIAL_V,
                  S.OSUSER AS pPCUSER_V,
                  S.USERNAME pBDUSER_V,
                  DECODE (CONCAT ('', S.PROGRAM),
                          'JDBC Thin Client', 'ERP TUMI',
                          CONCAT ('', S.PROGRAM))
                     pPROGRAM_V,
                  S.PROCESS pPROCESS_LOCKER_V,
                  S.MACHINE pMACHINE_V,
                  s.schemaname pSCHEMA_V,
                  S.SQL_ID pSQLID_V,
                  VS.SQL_TEXT pSQL_QUERY_V
             FROM V$SESSION S LEFT JOIN V$SQLAREA VS ON S.SQL_ID = VS.SQL_ID
            WHERE S.OSUSER <> 'SYSTEM' AND S.OSUSER <> 'SYS'
                  AND (v_schema IS NULL
                       OR s.schemaname LIKE '%' || v_schema || '%')
                  AND (v_program IS NULL
                       OR DECODE (CONCAT ('', S.PROGRAM),
                                  'JDBC Thin Client', 'ERP TUMI',
                                  CONCAT ('', S.PROGRAM)) LIKE
                             '%' || v_program || '%')
         --AND S.SQL_ID is not null
         ORDER BY S.OSUSER ASC;

      v_LISTA := var_lista;
   END getListSessionDB;

   PROCEDURE killBlockDB (
      V_SID            IN     SEG_V_SESSION.PERS_PERSONA_N_PK%TYPE,
      V_NROSESSION     IN     SEG_V_SESSION.PERS_PERSONA_N_PK%TYPE,
      V_ACTSESSION_N      OUT NUMBER)
   IS
   BEGIN
      EXECUTE IMMEDIATE
            'ALTER SYSTEM KILL SESSION '''
         || v_sid
         || ','
         || V_NROSESSION
         || '''';

      V_ACTSESSION_N := 1;
   END killBlockDB;

   PROCEDURE killSessionDB (
      V_SID            IN     SEG_V_SESSION.PERS_PERSONA_N_PK%TYPE,
      V_NROSESSION     IN     SEG_V_SESSION.PERS_PERSONA_N_PK%TYPE,
      V_ACTSESSION_N      OUT NUMBER)
   IS
   BEGIN
      EXECUTE IMMEDIATE
            'ALTER SYSTEM KILL SESSION '''
         || v_sid
         || ','
         || V_NROSESSION
         || '''';

      V_ACTSESSION_N := 1;
   END killSessionDB;
-------------------------------------------------------------------------------------------------------------------------
END PKG_SESSION;
/