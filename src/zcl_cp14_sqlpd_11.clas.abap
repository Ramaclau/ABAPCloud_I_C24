CLASS zcl_cp14_sqlpd_11 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun .

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_cp14_sqlpd_11 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    SELECT from /DMO/I_Flight
        FIELDS AirlineID,
               ConnectionID,
               OccupiedSeats
        where AirlineID eq 'LH'
    INTERSECT
    SELECT from /DMO/I_Flight
        FIELDS AirlineID,
               ConnectionID,
               max( OccupiedSeats ) as OccupiedSeats
        where AirlineID eq 'LH'
        GROUP BY AirlineID, ConnectionID
        ORDER BY AirlineID, ConnectionID, OccupiedSeats
    into table @FINAL(lt_result).

    if sy-subrc eq 0.
      out->write( lt_result ).
    ENDIF.

  ENDMETHOD.
ENDCLASS.
