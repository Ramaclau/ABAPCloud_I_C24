CLASS zcl_cp13_sql43 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_cp13_sql43 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    SELECT FROM zflight_957 AS flight
        FIELDS flight~airlineid    AS Airline,
               flight~connectionid AS Conn
        GROUP BY flight~airlineid, flight~connectionid
        INTO TABLE @DATA(lt_flights).

    IF sy-subrc = 0.
      out->write( lt_flights ).
    ENDIF.

  ENDMETHOD.
ENDCLASS.
