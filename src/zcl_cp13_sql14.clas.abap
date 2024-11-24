CLASS zcl_cp13_sql14 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.
  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_cp13_sql14 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    UPDATE zcarrier_957
        SET currency_code = 'EUR'
        WHERE carrier_id = 'AA'.

    IF sy-subrc = 0.

      COMMIT WORK.

      SELECT SINGLE FROM zcarrier_957
       FIELDS *
       WHERE carrier_id = 'AA'
       INTO @DATA(ls_airline).

      IF sy-subrc = 0.
        out->write( ls_airline-currency_code ).
      ENDIF.

    UPDATE zcarrier_957
        SET currency_code = 'USD'
        WHERE carrier_id = 'AA'.

      ROLLBACK WORK.

    ENDIF.


  ENDMETHOD.

ENDCLASS.
