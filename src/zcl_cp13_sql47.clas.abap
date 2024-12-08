CLASS zcl_cp13_sql47 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.
  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_cp13_sql47 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    SELECT FROM /dmo/I_Flight AS flights
        FIELDS *
        WHERE OccupiedSeats < flights~MaximumSeats
          AND EXISTS ( SELECT FROM zcarrier_957
                            FIELDS carrier_id
                            WHERE carrier_id = flights~AirlineID )
        INTO TABLE @DATA(lt_flights).

    IF sy-subrc = 0.
      out->write( lt_flights ).
    ELSE.
      out->write( 'No data' ).
    ENDIF.

  ENDMETHOD.
ENDCLASS.
