CLASS zcl_cp13_sql7 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun .

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_CP13_SQL7 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    CONSTANTS lc_currency TYPE c LENGTH 3 VALUE 'USD'.

    UPDATE zcarrier_957
        SET currency_code = 'USD'
        WHERE carrier_id = 'LH' OR carrier_id = 'AF'.

    IF sy-subrc = 0.
      out->write( |Records updated| ).
    ELSE.
      out->write( |Records NOT updated| ).
    ENDIF.

  ENDMETHOD.
ENDCLASS.
