CLASS zcl_cp13_sql13 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.
  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun .

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_cp13_sql13 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    delete from zcarrier_957
        where carrier_id = 'AA'.

    if sy-subrc = 0.
        out->write( |Record delele from database| ).
    else.
        out->write( |Record NOT delele| ).
    ENDIF.

    delete from zcarrier_957
        where currency_code = 'CLP'.

    if sy-subrc = 0.
        out->write( |Record delele from database| ).
    ENDIF.





  ENDMETHOD.
ENDCLASS.
