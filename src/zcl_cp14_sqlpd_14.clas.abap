CLASS zcl_cp14_sqlpd_14 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_cp14_sqlpd_14 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    SELECT FROM /dmo/i_flight
        FIELDS AirlineID,
               ConnectionID,
               FlightDate,
               \_Airline[ (1) ]-name AS Name,
               \_Airline-name AS Name2,
               \_Airline[ currencycode = 'EUR' ]-name AS AirlineNameEUR,
               \_Airline\_Currency-CurrencyISOCode,
               \_Airline\_Currency\_Text[ Language = 'E' AND Currency = 'EUR' ]-CurrencyShortName,
               \_Connection-DepartureAirport,
               \_Connection-DestinationAirport
        WHERE AirlineID = 'LH'
        ORDER BY FlightDate
        INTO TABLE @DATA(ltresults).

    IF sy-subrc EQ 0.
      out->write( ltresults ).
    ENDIF.










  ENDMETHOD.
ENDCLASS.
