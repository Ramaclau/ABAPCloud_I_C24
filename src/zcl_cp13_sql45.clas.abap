CLASS zcl_cp13_sql45 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.
  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_cp13_sql45 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    SELECT FROM /dmo/I_flight
        FIELDS AirlineID,
               COUNT( * ) AS FlightsAvailables
        GROUP BY AirlineID
        ORDER BY FlightsAvailables DESCENDING
        INTO TABLE @DATA(lt_flights).
        "UP TO 1 ROWS.

    IF sy-subrc = 0.
      out->write( lt_flights ).
    ENDIF.

    SELECT FROM /dmo/I_flight
        FIELDS AirlineID,
               COUNT( * ) AS FlightsAvailablesALL
        GROUP BY AirlineID
        HAVING COUNT( * ) >= ALL ( SELECT FROM /dmo/I_flight
                                    FIELDS COUNT( * )
                                    GROUP BY AirlineID )
        INTO TABLE @lt_flights.

    IF sy-subrc = 0.
      out->write( lt_flights ).
    ENDIF.

  ENDMETHOD.
ENDCLASS.
