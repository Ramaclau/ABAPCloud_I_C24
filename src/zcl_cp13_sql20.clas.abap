CLASS zcl_cp13_sql20 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_cp13_sql20 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    select from zflight_957
        FIELDS *
        where airlineid = 'LH'
        into table @data(lt_airline)
        up to 3 rows.

    if sy-subrc = 0.
        out->write( lt_airline ).
    ENDIF.




  ENDMETHOD.
ENDCLASS.
