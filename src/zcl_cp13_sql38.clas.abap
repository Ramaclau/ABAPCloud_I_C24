CLASS zcl_cp13_sql38 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_cp13_sql38 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    data: lv_page_number TYPE i value 3,
          lv_records_per_page type i value 10.

    data gv_offset type int8.

    " Page 1 = Block 0
    " Page 2 = Block 1

    gv_offset = ( lv_page_number - 1 ) * lv_records_per_page.

    SELECT from /DMO/I_Flight
        FIELDS *
        where CurrencyCode = 'USD'
        order by AirlineID, ConnectionID, FlightDate ASCENDING
        into table @data(lt_result)
        OFFSET @gv_offset
        UP TO @lv_records_per_page ROWS.

    if sy-subrc = 0.
        out->write( lt_result ).
    else.
        out->write( 'No rows available for the next page' ).
    endif.

  ENDMETHOD.
ENDCLASS.
