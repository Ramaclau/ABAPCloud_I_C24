CLASS zcl_cp13_sql17 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_cp13_sql17 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    DATA lt_airline TYPE STANDARD TABLE OF zcarrier_957.

    SELECT FROM zcarrier_957
        FIELDS *
        WHERE currency_code = 'USD'
        INTO TABLE @lt_airline.

    IF sy-subrc = 0.

*      APPEND INITIAL LINE TO lt_airline.

      SELECT FROM zcarrier_957
      FIELDS *
      WHERE currency_code = 'EUR'
      APPENDING TABLE @lt_airline.

      out->write( lt_airline ).

    ENDIF.

*    out->write( |New select| ).
*
*    select from zcarrier_957
*        FIELDS *
*        where currency_code = 'XYZ'
*        into table @lt_airline.
*
*    out->write( lt_airline ).
*
*    if sy-subrc = 0.
*        out->write( lt_airline ).
*    ENDIF.
*
*    if lt_airline is INITIAL.
*        out->write( |No data on the internal table| ).
*    ENDIF.

  ENDMETHOD.
ENDCLASS.
