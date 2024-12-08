CLASS zcl_cp13_sql49 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_cp13_sql49 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    SELECT FROM zdatasource_1 AS ds1
        INNER JOIN zdatasource_2 AS ds2 ON ds1~id EQ ds2~id
        FIELDS ds1~id AS id1,
               ds2~id AS id2,
               ds1~name1,
               ds2~name2,
               ds1~datasource1,
               ds2~datasource2
        INTO TABLE @DATA(lt_result).

    IF sy-subrc = 0.
      out->write( lt_result ).
    ENDIF.

    SELECT FROM ( ( /DMO/I_Flight AS flight
        INNER JOIN /DMO/I_Connection AS connection ON flight~AirlineID    EQ connection~AirlineID
                                                  AND flight~ConnectionID EQ connection~ConnectionID )
        INNER JOIN /dmo/I_Airport AS departure ON connection~DepartureAirport EQ departure~AirportID
        INNER JOIN /dmo/I_Airport AS destination ON connection~DestinationAirport EQ destination~AirportID )
        FIELDS flight~AirlineID,
               flight~ConnectionID,
               flight~FlightDate,
               connection~DepartureAirport,
               departure~Name AS DepartureName,
               connection~DestinationAirport,
               destination~Name AS DestinationName,
               flight~Price,
               flight~CurrencyCode
         INTO TABLE @DATA(lt_flights).

    IF sy-subrc = 0.
      out->write( lt_flights ).
    ENDIF.















  ENDMETHOD.
ENDCLASS.
