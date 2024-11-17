CLASS zcl_cp13_sql9 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_cp13_sql9 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    DATA(ls_airline) = value zcarrier_957( carrier_id    = 'WZ'
                                           name          = 'Wizz Air'
                                           currency_code = 'USD' ).

    MODIFY zcarrier_957 from @ls_airline.

    if sy-subrc = 0.
        out->write( |The record was inserted/updated corrently| ).
    ELSE.
        out->write( |The record was NOT modified| ).
    ENDIF.

  ENDMETHOD.
ENDCLASS.
