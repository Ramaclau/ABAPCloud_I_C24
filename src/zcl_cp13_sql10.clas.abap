CLASS zcl_cp13_sql10 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_cp13_sql10 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    CONSTANTS ls_currency type c LENGTH 3 value 'EUR'.

    SELECT from zcarrier_957
        FIELDS *
        where carrier_id = 'AF' or carrier_id = 'LH'
        INTO table @data(lt_airlines).

    if sy-subrc = 0.

        LOOP AT lt_airlines ASSIGNING FIELD-SYMBOL(<fs_airline>).
            <fs_airline>-currency_code = ls_currency.
        ENDLOOP.

        APPEND VALUE #( carrier_id    = 'AV'
                        name          = 'AVIANCA'
                        currency_code = 'COP' ) to lt_airlines.


        MODIFY zcarrier_957 from table @lt_airlines.

        if sy-subrc = 0.
            out->write( |The records have been modified| ).
        else.
            out->write( |The records have NOT been modified| ).
        ENDIF.

      ENDIF.

  ENDMETHOD.
ENDCLASS.
