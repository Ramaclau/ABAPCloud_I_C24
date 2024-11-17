CLASS zcl_cp13_sql2 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_CP13_SQL2 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DELETE FROM zcarrier_957. " Just for demo purpose only

    DATA lt_ddbb TYPE STANDARD TABLE OF zcarrier_957.

    SELECT FROM /dmo/i_carrier
        FIELDS AirlineID AS carrier_id,
               name,
               CurrencyCode AS currency_code
               WHERE CurrencyCode = 'USD'
               INTO CORRESPONDING FIELDS OF TABLE @lt_ddbb.

    IF sy-subrc = 0.

      " insert directo en la tabla
      "insert zcarrier_957 from table @( VALUE #( ( carrier_id    = 'AA'
      "                                             name          = 'American Airline'
      "                                             currency_code = 'USD' )
      "                                           ( carrier_id    = 'FJ'
      "                                             name          = 'American Airline'
      "                                             currency_code = 'USD' ) ) ).

      INSERT zcarrier_957 FROM TABLE @lt_ddbb.

      IF sy-subrc = 0.
        out->write( |The number of insert rows is : { sy-dbcnt }| ).
      ENDIF.

    ENDIF.

  ENDMETHOD.
ENDCLASS.
