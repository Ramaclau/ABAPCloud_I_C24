CLASS zcl_cp01_types DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

  INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_cp01_types IMPLEMENTATION.

METHOD  if_oo_adt_classrun~main.
  DATA: lv_string TYPE string,
        lv_int    TYPE i VALUE 09061966,
        lv_fec    TYPE d,
        lv_dec    TYPE P LENGTH 8 DECIMALS 2 VALUE '9.6',
        lv_car    TYPE c LENGTH 10 VALUE 'claudio'.

  lv_string = '09061966'.
  lv_fec    = '20241001'.
  out->write( lv_string ).
  out->write( lv_int ).
  out->write( lv_fec ).
  out->write( lv_dec ).
  out->write( lv_car ).

ENDMETHOD.

ENDCLASS.
