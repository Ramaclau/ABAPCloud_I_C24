CLASS zcl_cp14_sqlpd_07 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun .

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_cp14_sqlpd_07 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    WITH +tmp_table AS (
          SELECT FROM /DMO/I_Connection
            FIELDS AirlineID,
                   ConnectionID,
                   DepartureAirport,
                   DestinationAirport
            WHERE AirlineID EQ 'LH' )

          SELECT FROM /DMO/I_Airport AS airport
                 INNER JOIN +tmp_table AS tmpDataDep
                    ON airport~AirportID EQ tmpdataDep~DepartureAirport
                 INNER JOIN +tmp_table AS tmpdataDes
                    ON airport~AirportID EQ tmpdatades~DestinationAirport

          FIELDS *
          ORDER BY tmpdatadep~DepartureAirport ASCENDING
          INTO TABLE @DATA(lt_results).

    IF sy-subrc EQ 0.
      out->write( lt_results ).
    ELSE.
      out->write( 'No data' ).
    ENDIF.

  ENDMETHOD.
ENDCLASS.
