CLASS zcl_cp13_sql32 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun .

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_cp13_sql32 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    select from /dmo/i_flight
        FIELDS avg( MaximumSeats ) as avgseats,
               sum( MaximumSeats ) as sumseats
        where AirlineID = 'AA'
        into ( @data(lv_avgseats), @data(lv_sumseats) ).

    if sy-subrc = 0.
        out->write( |Avg Seats: { lv_avgseats }; Sum Seats { lv_sumseats }| ).
    endif.

  ENDMETHOD.
ENDCLASS.
