CLASS zcl_cp14_sqlpd_25 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_cp14_sqlpd_25 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    INSERT zflights_957_c FROM ( SELECT FROM /DMO/I_Flight
                                             FIELDS uuid(  ) AS flight_uuid,
                                                    airlineid,
                                                    ConnectionID,
                                                    FlightDate,
                                                    \_Connection-DepartureAirport,
                                                    \_Connection-DestinationAirport ).
    SELECT FROM zflights_957_c
        FIELDS *
        INTO TABLE @DATA(lt_flights).

    IF sy-subrc EQ 0.
      out->write( lt_flights ).
    ENDIF.

  ENDMETHOD.
ENDCLASS.
