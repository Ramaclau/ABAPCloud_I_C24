CLASS zcl_cp14_sqlpd_10 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_cp14_sqlpd_10 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    CONSTANTS lc_date TYPE d VALUE '00000000'.

    SELECT FROM /dmo/I_flight
        FIELDS AirlineID AS id,
               ConnectionID,
               FlightDate
    UNION DISTINCT "ALL
    SELECT FROM /DMO/I_Connection
        FIELDS airlineid AS id,
               ConnectionID,
               @lc_date AS FlightDate
        INTO TABLE @DATA(lt_union).

    IF sy-subrc EQ 0.
      out->write( lt_union ).
    ENDIF.


  ENDMETHOD.
ENDCLASS.
