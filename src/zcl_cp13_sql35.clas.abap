CLASS zcl_cp13_sql35 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun .

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_cp13_sql35 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    SELECT FROM /DMO/I_Flight
        FIELDS AirlineID,
               COUNT( DISTINCT ConnectionID ) AS countDistinctConn
        WHERE FlightDate >= '20240101'
        GROUP BY AirlineID
        INTO TABLE @DATA(lt_result).

    IF sy-subrc = 0.
      out->write( lt_result ).
    ENDIF.

  ENDMETHOD.
ENDCLASS.
