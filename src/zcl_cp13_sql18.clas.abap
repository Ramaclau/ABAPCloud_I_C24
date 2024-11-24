CLASS zcl_cp13_sql18 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_cp13_sql18 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

    TYPES: BEGIN OF ty_flights,
             airlineid    TYPE c LENGTH 3,
             connectionid TYPE c LENGTH 4,
             price        TYPE p LENGTH 16 DECIMALS 2,
             currencycode TYPE c LENGTH 5,
           END OF ty_flights.

    DATA lt_flights TYPE STANDARD TABLE OF ty_flights.

    SELECT FROM zflight_957
        FIELDS *
        WHERE airlineid = 'LH'
        INTO CORRESPONDING FIELDS OF TABLE @lt_flights.

    if sy-subrc = 0.
        out->write( lt_flights ).
    ENDIF.


  ENDMETHOD.

ENDCLASS.
