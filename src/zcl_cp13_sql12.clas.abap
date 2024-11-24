CLASS zcl_cp13_sql12 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_cp13_sql12 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    DATA lt_airline TYPE STANDARD TABLE OF zcarrier_957.

    SELECT FROM zcarrier_957
        FIELDS *
        WHERE currency_code = 'EUR'
        INTO TABLE @lt_airline.

    IF sy-subrc = 0.
      out->write( |Recods delete from database| ).
    ELSE.
      out->write( |Recods NOT available | ).
    ENDIF.

    SELECT FROM zcarrier_957
        FIELDS carrier_id
        WHERE currency_code = 'COP'
        INTO CORRESPONDING FIELDS OF TABLE @lt_airline.

    IF sy-subrc = 0.

      DELETE zcarrier_957 FROM TABLE @lt_airline.

      IF sy-subrc = 0.
        out->write( |Recods delete from database| ).
      ENDIF.
    ENDIF.







  ENDMETHOD.
ENDCLASS.
