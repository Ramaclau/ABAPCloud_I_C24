CLASS zcl_cp13_sql46 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.
  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_cp13_sql46 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    SELECT FROM /dmo/I_Connection AS Connection
        FIELDS *
        WHERE AirlineID = ANY ( SELECT FROM /dmo/I_Flight
                                       FIELDS AirlineID
                                       WHERE OccupiedSeats >= 100 )
        INTO TABLE @DATA(lt_flights_any).

    IF sy-subrc = 0.
      out->write( |Any: { lines( lt_flights_any ) }| ).
    ENDIF.

    SELECT FROM /dmo/I_Connection AS Connection
        FIELDS *
        WHERE AirlineID = SOME ( SELECT FROM /dmo/I_Flight
                                       FIELDS AirlineID
                                       WHERE OccupiedSeats >= 100 )
        INTO TABLE @DATA(lt_flights_some).

    IF sy-subrc = 0.
      out->write( |Some: { lines( lt_flights_some ) }| ).
    ENDIF.

  ENDMETHOD.
ENDCLASS.
