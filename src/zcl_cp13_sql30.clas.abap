CLASS zcl_cp13_sql30 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun .

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_cp13_sql30 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    SELECT from /dmo/i_connection
        FIELDS *
        where ( AirlineID = 'AA'
             or AirlineID = 'LH' )
          and ( DepartureAirport = 'SFO'
             or DepartureAirport = 'JFK' )
          and not connectionid = '0015'
        into table @data(lt_flights).

    if sy-subrc = 0.
        out->write( lt_flights ).
    else.
        out->write( |No data| ).
    endif.

  ENDMETHOD.
ENDCLASS.
