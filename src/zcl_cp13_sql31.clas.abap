CLASS zcl_cp13_sql31 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun .

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_cp13_sql31 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    SELECT from /dmo/i_flight
        FIELDS min( MaximumSeats )
        into @data(lv_min_seats).

    if sy-subrc = 0.
        out->write( |Min Seats: { lv_min_seats }| ).
    endif.

    SELECT from /dmo/i_flight
        FIELDS min( MaximumSeats ),
               max( MaximumSeats )
        into ( @lv_min_seats, @data(lv_max_seats) ).

    if sy-subrc = 0.
        out->write( |Min Seats: { lv_min_seats }; Max Seats: { lv_max_seats }| ).
    endif.

    SELECT from /dmo/i_flight
        FIELDS min( MaximumSeats ) as MinSeats,
               max( MaximumSeats ) as MaxSeats
        into @data(ls_min_mx).

    if sy-subrc = 0.
        out->write( ls_min_mx ).
    endif.










  ENDMETHOD.
ENDCLASS.
