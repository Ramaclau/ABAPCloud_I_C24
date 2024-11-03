CLASS zcl_cp08_new DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    DATA: lv_name TYPE string,
          lv_age  TYPE i.

    METHODS: constructor IMPORTING iv_name TYPE string
                                   iv_age  TYPE i.

    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_cp08_new IMPLEMENTATION.

  METHOD constructor.

        lv_name = iv_name.
        lv_age  = iv_age.

  ENDMETHOD.

  METHOD if_oo_adt_classrun~main.
*    out->write( data = lo_data2 name = 'lo_data2' ).


  ENDMETHOD.

ENDCLASS.
