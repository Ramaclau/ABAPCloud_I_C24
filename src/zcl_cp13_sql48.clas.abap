CLASS zcl_cp13_sql48 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .
  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun .

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_cp13_sql48 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    SELECT FROM /dmo/I_Flight AS flights
        FIELDS *
        WHERE AirlineID IN ( SELECT FROM /dmo/I_Connection
                                FIELDS AirlineID
                                WHERE AirlineID    = flights~AirlineID
                                  AND ConnectionID = flights~ConnectionID )
        INTO TABLE @DATA(lt_flights).

    IF sy-subrc = 0.
      out->write( lt_flights ).
    ENDIF.

  ENDMETHOD.
ENDCLASS.
