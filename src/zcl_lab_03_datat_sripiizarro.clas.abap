CLASS zcl_lab_03_datat_sripiizarro DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_LAB_03_DATAT_SRIPIIZARRO IMPLEMENTATION.


METHOD if_oo_adt_classrun~main.

DATA: MV_CHAR  TYPE c LENGTH 10 VALUE '12345',
      MV_NUM   TYPE i,
      MV_FLOAT TYPE f.

MV_NUM   = MV_CHAR.
MV_FLOAT = MV_CHAR.

*2) TRUNCAMIENTO
DATA: MV_TRUNC TYPE i,
      MV_ROUND TYPE i.

MV_FLOAT = '123.45'.

MV_TRUNC = MV_FLOAT.
out->write( MV_TRUNC ).

MV_ROUND = MV_FLOAT.
out->write( MV_ROUND ).

*3) DECLARACION EN LINEA
DATA(lv_en_linea) = 'ABAP'.

*4) CONVERSION FORZADO
MV_CHAR = CONV i( MV_CHAR ).
out->write( MV_CHAR ).

*5) Cálculo de Fecha y Hora

DATA: MV_DATE_1 TYPE d,
      MV_DATE_2 TYPE d,
      MV_DAYS   TYPE i,
      MV_TIME   TYPE t.

MV_DATE_1 = cl_abap_context_info=>get_system_date(  ).
MV_DATE_2 = cl_abap_context_info=>get_system_date(  ).
MV_DAYS   = MV_DATE_1 - MV_DATE_2.
out->write( MV_DAYS ).

out->write( MV_DATE_1  ).

*6) Campos Timestamp

DATA MV_TIMESTAMP TYPE UTCLONG.

MV_TIMESTAMP = UTCLONG_CURRENT( ).



















ENDMETHOD.
ENDCLASS.
