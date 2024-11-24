CLASS zcl_cp13_sql16 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun .

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_cp13_sql16 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    select single from zcarrier_957
        FIELDS *
        where carrier_id = 'AA'
        into @data(ls_airline)
        BYPASSING BUFFER.

    if sy-subrc = 0.
        out->write( ls_airline ).
    ENDIF.


  ENDMETHOD.
ENDCLASS.
