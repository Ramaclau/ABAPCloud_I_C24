CLASS zcl_cp13_sql8 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_CP13_SQL8 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA lt_flights TYPE STANDARD TABLE OF zflight_957.

    "INSERT en la tabla para tener datos
*    SELECT FROM /DMO/I_Flight
*        FIELDS *
*        INTO CORRESPONDING FIELDS OF TABLE @lt_flights.
*
*    IF sy-subrc = 0.
*      INSERT zflight_957 FROM TABLE @lt_flights.
*      IF sy-subrc = 0.
*        out->write( |Inserted: { sy-dbcnt } rows| ).
*      ENDIF.
*    ENDIF.
*********************************************************
    UPDATE zflight_957
        SET maximumseats  = maximumseats + 10,
            occupiedseats = occupiedseats + 5
        WHERE airlineid = 'LH'.

    IF sy-subrc = 0.
      out->write( |Update rows: { sy-dbcnt }| ).
    ELSE.
      out->write( |Update not excured| ).

    ENDIF.


  ENDMETHOD.
ENDCLASS.
