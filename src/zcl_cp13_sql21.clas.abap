CLASS zcl_cp13_sql21 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_cp13_sql21 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    data lt_flights type STANDARD TABLE OF zflight_957.

    select from zflight_957
        FIELDS *
        where currencycode = 'USD'
          and planetype    = '767-200'
        into @data(ls_flights).

    ls_flights-price *= '1.10'.

    APPEND ls_flights to lt_flights.

    ENDSELECT.

    if sy-subrc = 0.
        out->write( lt_flights ).
    ENDIF.

  ENDMETHOD.
ENDCLASS.
