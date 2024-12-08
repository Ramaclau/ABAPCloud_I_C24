CLASS zcl_cp13_sql37 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun .

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_cp13_sql37 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    SELECT FROM /DMO/I_Flight
        FIELDS AirlineID,
               ConnectionID,
               FlightDate,
               Price,
               CurrencyCode
        WHERE FlightDate BETWEEN '20240101' AND '20301231'
        ORDER BY FlightDate DESCENDING
        INTO TABLE @DATA(lt_result).

    SELECT FROM /DMO/I_Flight
        FIELDS AirlineID,
               ConnectionID,
               FlightDate,
               Price,
               CurrencyCode
        WHERE FlightDate BETWEEN '20240101' AND '20301231'
        ORDER BY PRIMARY KEY
        INTO TABLE @lt_result.

    IF sy-subrc = 0.
      out->write( lt_result ).
    ENDIF.

  ENDMETHOD.
ENDCLASS.
