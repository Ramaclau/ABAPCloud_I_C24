CLASS zcl_cp14_sqlpd_04 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun .

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_cp14_sqlpd_04 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

  CONSTANTS lc_availability_seat TYPE int4 value 30.

  SELECT FROM /dmo/i_flight
        FIELDS AirlineID,
               ConnectionID
        WHERE ( MaximumSeats - OccupiedSeats ) ge @lc_availability_seat
        GROUP BY AirlineID, ConnectionID
        ORDER BY AirlineID DESCENDING
        INTO table @data(lt_flight).

    IF sy-subrc EQ 0.
      out->write( lt_flight ).
    ENDIF.

  ENDMETHOD.
ENDCLASS.
