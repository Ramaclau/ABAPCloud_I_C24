CLASS zcl_cp13_sql36 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun .

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_cp13_sql36 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    SELECT FROM /DMO/I_Flight
        FIELDS AirlineID,
               MIN( maximumseats ) AS MinSeats,
               MAX( maximumseats ) AS MaxSeats
        WHERE FlightDate BETWEEN '20240101' AND '20301231'
        GROUP BY AirlineID HAVING AirlineID IN ( 'AA', 'LH', 'UA' )
        INTO TABLE @DATA(lt_result).

    IF sy-subrc = 0.
      out->write( lt_result ).
    ENDIF.

  ENDMETHOD.
ENDCLASS.
