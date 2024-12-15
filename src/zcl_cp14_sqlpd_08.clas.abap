CLASS zcl_cp14_sqlpd_08 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun .

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_cp14_sqlpd_08 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    MODIFY zflights_957 FROM ( SELECT FROM /dmo/I_Flight AS flight
                                      INNER JOIN /dmo/I_connection AS conn
                                              ON flight~AirlineID    EQ conn~AirlineID
                                             AND flight~ConnectionID EQ conn~ConnectionID
                                      FIELDS flight~AirlineID,
                                             flight~ConnectionID,
                                             flight~FlightDate,
                                             conn~DepartureAirport,
                                             conn~DestinationAirport ).

    SELECT FROM zflights_957
        FIELDS *
        INTO TABLE @DATA(lt_results).

    IF sy-subrc EQ 0.
      out->write( lt_results ).
    ENDIF.


  ENDMETHOD.
ENDCLASS.
