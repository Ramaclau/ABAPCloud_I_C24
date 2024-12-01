CLASS zcl_cp13_sql33 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun .

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_cp13_sql33 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    select from /dmo/i_flight
        FIELDS avg( DISTINCT MaximumSeats ) as avgseats,
               sum( DISTINCT MaximumSeats ) as sumseats
        where AirlineID = 'AA'
        into ( @data(lv_avgseats), @data(lv_sumseats) ).

    if sy-subrc = 0.
        out->write( |Avg Seats: { lv_avgseats }; Sum Seats { lv_sumseats }| ).
    endif.

   select from /dmo/i_flight
        FIELDS DISTINCT ConnectionID
        where AirlineID = 'AA'
        into  table @data(lv_conn).

    if sy-subrc = 0.
        out->write( lv_conn ).
    endif.


  ENDMETHOD.
ENDCLASS.
