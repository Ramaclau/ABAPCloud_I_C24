CLASS zcl_cp13_sql1 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_CP13_SQL1 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA ls_airline TYPE zcarrier_957.

    "ls_airline = VALUE #( carrier_id    = 'AA'
    "                      name          = 'American Airline'
    "                      currency_code = 'USD' ).

    "insert into zcarrier_957 values @ls_airline.
    "INSERT zcarrier_957 FROM @ls_airline.
    insert zcarrier_957 from @( VALUE #( carrier_id    = 'AA'
                                         name          = 'American Airline'
                                         currency_code = 'USD' ) ).

    IF sy-subrc = 0.
      out->write( 'Record inserted corrently' ).
    ELSE.
      out->write( 'The record was NOT inserted' ).
    ENDIF.


  ENDMETHOD.
ENDCLASS.
