CLASS zcl_cp13_sql6 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_CP13_SQL6 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    CONSTANTS lc_currency TYPE c LENGTH 3 VALUE 'CLP'.

    SELECT FROM zcarrier_957
      FIELDS *
      INTO TABLE @DATA(lt_airline).

    IF sy-subrc = 0.
      LOOP AT lt_airline ASSIGNING FIELD-SYMBOL(<lsf_airline>).
        <lsf_airline>-currency_code = lc_currency.
      ENDLOOP.

      UPDATE zcarrier_957 FROM TABLE @lt_airline.

      IF sy-subrc = 0.
        out->write( |All records updated with the new currency: { lc_currency }| ).
      ENDIF.

    ENDIF.

  ENDMETHOD.
ENDCLASS.
