alter table CON_LIBROMAYORDETALLE
add LMDE_NIVELCUENTA_N number(4) default 0 not null;

----------SCRIPT LIBRO MAYOR HISTORICO-----------------
CREATE TABLE CONTABILIDAD.CON_LIBROMAYOR_HISTORICO
(
  PERS_EMPRESAMAYOR_N_PK        NUMBER(7)       NOT NULL,
  CONT_PERIODOMAYOR_N           NUMBER(4)       NOT NULL,
  CONT_MESMAYOR_N               NUMBER(9)       NOT NULL,
  CONT_LIBROMAYOR_HIST_N_PK     NUMBER(7)       NOT NULL,
  LIMA_FECHAREGISTRO_D          TIMESTAMP(6)    NOT NULL,
  PARA_ESTADO_N_COD             NUMBER(3)       NOT NULL,
  PARA_ESTADOCIERRE_N_COD       NUMBER(3)       NOT NULL,
  PERS_EMPRESAUSUARIO_N_PK      NUMBER(7)       NOT NULL,
  PERS_PERSONAUSUARIO_N_PK      NUMBER(7)       NOT NULL,
  PERS_PERSUSUARIOELIMINA_N_PK  NUMBER(7),
  CONT_FECHA_ELIMINA_HIST_D     NUMBER(7),
  CONT_IP_ELIMINA_HIST_D        VARCHAR2(30 BYTE) NOT NULL
)
TABLESPACE SYSTEM
PCTUSED    40
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            FREELISTS        1
            FREELIST GROUPS  1
            BUFFER_POOL      DEFAULT
           )
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING;

COMMENT ON COLUMN CONTABILIDAD.CON_LIBROMAYOR_HISTORICO.PERS_EMPRESAMAYOR_N_PK IS 'Campo donde se almacena el ID de la tabla SEG_M_Empresa.';

COMMENT ON COLUMN CONTABILIDAD.CON_LIBROMAYOR_HISTORICO.CONT_PERIODOMAYOR_N IS 'Almacena el a?o de cada registro por empresa.';

COMMENT ON COLUMN CONTABILIDAD.CON_LIBROMAYOR_HISTORICO.CONT_MESMAYOR_N IS 'Almacena un valor del mes del que se esta cerrando por empresa y periodo.';

COMMENT ON COLUMN CONTABILIDAD.CON_LIBROMAYOR_HISTORICO.LIMA_FECHAREGISTRO_D IS 'Almacena la fecha en que se ejecuto la mayorizacion.';

COMMENT ON COLUMN CONTABILIDAD.CON_LIBROMAYOR_HISTORICO.PARA_ESTADOCIERRE_N_COD IS 'Almacena el estado del proceso de cierre puede ser pendiente (0) o cerrando (1).';



CREATE UNIQUE INDEX CONTABILIDAD.XPKCON_LIBROMAYOR_HISTORICO ON CONTABILIDAD.CON_LIBROMAYOR_HISTORICO
(CONT_LIBROMAYOR_HIST_N_PK)
LOGGING
TABLESPACE USERS
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL;


ALTER TABLE CONTABILIDAD.CON_LIBROMAYOR_HISTORICO ADD (
  CONSTRAINT XPKCON_LIBROMAYOR_HISTORICO
  PRIMARY KEY
  (CONT_LIBROMAYOR_HIST_N_PK)
  USING INDEX CONTABILIDAD.XPKCON_LIBROMAYOR_HISTORICO);


----------SCRIPT LIBRO MAYOR HISTORICO DETALLE---------------
  CREATE TABLE CONTABILIDAD.CON_LIBROMAYORDETALLE_HIST
(
  PERS_EMPRESAMAYOR_N_PK          NUMBER(7)     NOT NULL,
  CONT_PERIODOMAYOR_N             NUMBER(4)     NOT NULL,
  CONT_MESMAYOR_N                 NUMBER(9)     NOT NULL,
  CONT_LIBROMAYOR_HIST_N_PK       NUMBER(7)     NOT NULL,
  PERS_EMPRESACUENTA_N_PK         NUMBER(7)     NOT NULL,
  CONT_PERIODOCUENTA_N            NUMBER(4)     NOT NULL,
  CONT_NUMEROCUENTA_V             VARCHAR2(24 BYTE) NOT NULL,
  LMDE_DEBESOLESSALDO_N           NUMBER(12,2)  NOT NULL,
  LMDE_HABERSOLESSALDO_N          NUMBER(12,2)  NOT NULL,
  LMDE_DEBEEXTRANJEROSALDO_N      NUMBER(12,2)  NOT NULL,
  LMDE_HABEREXTRANJEROSALDO_N     NUMBER(12,2)  NOT NULL,
  LMDE_DEBESOLESSALDOFIN_N        NUMBER(12,2)  NOT NULL,
  LMDE_HABERSOLESSALDOFIN_N       NUMBER(12,2)  NOT NULL,
  LMDE_DEBEEXTRANJEROSALDOFIN_N   NUMBER(12,2)  NOT NULL,
  LMDE_HABEREXTRANJEROSALDOFIN_N  NUMBER(12,2)  NOT NULL,
  LMDE_DEBESOLES_N                NUMBER(12,2)  NOT NULL,
  LMDE_HABERSOLES_N               NUMBER(12,2)  NOT NULL,
  LMDE_DEBEEXTRANJERO_N           NUMBER(12,2)  NOT NULL,
  LMDE_HABEREXTRANJERO_N          NUMBER(12,2)  NOT NULL,
  PERS_EMPRESASUCURSAL_N_PK       NUMBER(7),
  SUCU_IDSUCURSAL_N_PK            NUMBER(7),
  SUDE_IDSUBSUCURSAL_N_PK         NUMBER(7)
)
TABLESPACE USERS
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING;

COMMENT ON COLUMN CONTABILIDAD.CON_LIBROMAYORDETALLE_HIST.PERS_EMPRESAMAYOR_N_PK IS 'Campo donde se almacena el ID de la tabla SEG_M_Empresa.';

COMMENT ON COLUMN CONTABILIDAD.CON_LIBROMAYORDETALLE_HIST.CONT_PERIODOMAYOR_N IS 'Almacena el a?o de cada registro por empresa.';

COMMENT ON COLUMN CONTABILIDAD.CON_LIBROMAYORDETALLE_HIST.CONT_MESMAYOR_N IS 'Almacena un valor del mes del que se esta cerrando por empresa y periodo.';

COMMENT ON COLUMN CONTABILIDAD.CON_LIBROMAYORDETALLE_HIST.PERS_EMPRESACUENTA_N_PK IS 'Campo donde se almacena el ID de la tabla SEG_M_Empresa.';

COMMENT ON COLUMN CONTABILIDAD.CON_LIBROMAYORDETALLE_HIST.CONT_PERIODOCUENTA_N IS 'Almacena el a?o de cada plan de cuenta.';

COMMENT ON COLUMN CONTABILIDAD.CON_LIBROMAYORDETALLE_HIST.CONT_NUMEROCUENTA_V IS 'Almacena la cuenta del plan dependiendo del Periodo.';

COMMENT ON COLUMN CONTABILIDAD.CON_LIBROMAYORDETALLE_HIST.LMDE_DEBESOLESSALDO_N IS 'Almacena el valor del debe en su monera soles del mes anterior.';

COMMENT ON COLUMN CONTABILIDAD.CON_LIBROMAYORDETALLE_HIST.LMDE_HABERSOLESSALDO_N IS 'Almacena el valor del haber en su monera soles del mes anterior.';

COMMENT ON COLUMN CONTABILIDAD.CON_LIBROMAYORDETALLE_HIST.LMDE_DEBEEXTRANJEROSALDO_N IS 'Almacena el valor del haber en su monera soles del mes anterior.';

COMMENT ON COLUMN CONTABILIDAD.CON_LIBROMAYORDETALLE_HIST.LMDE_HABEREXTRANJEROSALDO_N IS 'Almacena el valor del haber en su monera soles del mes anterior.';

COMMENT ON COLUMN CONTABILIDAD.CON_LIBROMAYORDETALLE_HIST.LMDE_DEBESOLES_N IS 'Almacena el valor del debe en su monera soles de los movimientos del mes.';

COMMENT ON COLUMN CONTABILIDAD.CON_LIBROMAYORDETALLE_HIST.LMDE_HABERSOLES_N IS 'Almacena el valor del haber en su monera soles de los movimientos del mes.';

COMMENT ON COLUMN CONTABILIDAD.CON_LIBROMAYORDETALLE_HIST.LMDE_DEBEEXTRANJERO_N IS 'Almacena el valor del haber en su monera soles de los movimientos del mes.';

COMMENT ON COLUMN CONTABILIDAD.CON_LIBROMAYORDETALLE_HIST.LMDE_HABEREXTRANJERO_N IS 'Almacena el valor del haber en su monera soles de los movimientos del mes.';



--  There is no statement for index CONTABILIDAD.SYS_C0042230.
--  The object is created automatically by Oracle when the parent object is created.

CREATE UNIQUE INDEX CONTABILIDAD.XPKCON_LIBROMAYORDETALLE_HIST ON CONTABILIDAD.CON_LIBROMAYORDETALLE_HIST
(PERS_EMPRESAMAYOR_N_PK, CONT_PERIODOMAYOR_N, CONT_MESMAYOR_N, PERS_EMPRESACUENTA_N_PK, CONT_PERIODOCUENTA_N, 
CONT_NUMEROCUENTA_V, PERS_EMPRESASUCURSAL_N_PK, SUCU_IDSUCURSAL_N_PK, SUDE_IDSUBSUCURSAL_N_PK)
LOGGING
TABLESPACE USERS
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL;


ALTER TABLE CONTABILIDAD.CON_LIBROMAYORDETALLE_HIST ADD (
  PRIMARY KEY
  (PERS_EMPRESAMAYOR_N_PK, CONT_PERIODOMAYOR_N, CONT_MESMAYOR_N, CONT_LIBROMAYOR_HIST_N_PK, PERS_EMPRESACUENTA_N_PK, CONT_PERIODOCUENTA_N, CONT_NUMEROCUENTA_V, PERS_EMPRESASUCURSAL_N_PK, SUCU_IDSUCURSAL_N_PK, SUDE_IDSUBSUCURSAL_N_PK)
  USING INDEX
    TABLESPACE SYSTEM
    PCTFREE    10
    INITRANS   2
    MAXTRANS   255
    STORAGE    (
                INITIAL          64K
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       UNLIMITED
                PCTINCREASE      0
                FREELISTS        1
                FREELIST GROUPS  1
               ));

ALTER TABLE CONTABILIDAD.CON_LIBROMAYORDETALLE_HIST ADD (
  CONSTRAINT CON_LIBROMAYORDETALLE_HIST_R01 
  FOREIGN KEY (CONT_LIBROMAYOR_HIST_N_PK) 
  REFERENCES CONTABILIDAD.CON_LIBROMAYOR_HISTORICO (CONT_LIBROMAYOR_HIST_N_PK));
