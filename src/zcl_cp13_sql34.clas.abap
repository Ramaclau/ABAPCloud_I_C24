CLASS zcl_cp13_sql34 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun .

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_cp13_sql34 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    select from /dmo/i_flight
        FIELDS count( * ) as countall,
               count( distinct MaximumSeats ) as CountMaximumSeats
        where airlineid = 'AA'
        into ( @data(lv_count_all), @data(lv_distinct_seats) ).

    if sy-subrc = 0.
        out->write( |Count All: { lv_count_all }; Count Distinct Seats: { lv_distinct_seats }| ).
    endif.


  ENDMETHOD.
ENDCLASS.
