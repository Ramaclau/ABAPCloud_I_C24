CLASS zcl_cp13_sql41 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun .

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_cp13_sql41 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    TYPES: BEGIN OF ty_content,
             AirlineID          TYPE /dmo/carrier_id,
             ConnectionID       TYPE /dmo/connection_id,
             FlightDate         TYPE /dmo/flight_date,
             Price              TYPE /dmo/flight_price,
             CurrencyCode       TYPE /dmo/currency_code,
             DepartureAirport   TYPE /dmo/airport_from_id,
             DestinationAirport TYPE /dmo/airport_to_id,
           END OF ty_content.

    DATA: lt_content          TYPE STANDARD TABLE OF ty_content,
          lv_datasource_name  TYPE string,
          lv_selected_columns TYPE string,
          lv_where_conditions TYPE string,
          lv_airline_id       TYPE string.

    DATA lx_dynamic_osql TYPE REF TO cx_root.

    lv_datasource_name = '/DMO/I_FLIGHT'. "/DMO/I_FLIGHT /DMO/I_CONNECTION

    if lv_datasource_name = '/DMO/I_FLIGHT'.
        lv_selected_columns = |AirlineID, ConnectionID, FlightDate, Price, CurrencyCode|.
        lv_airline_id       = 'LH'.
    elseif lv_datasource_name = '/DMO/I_CONNECTION'.
        lv_selected_columns = |AirlineID, ConnectionID, DepartureAirport, DestinationAirport|.
        lv_airline_id       = 'AA'.
    else.
        RETURN.
    ENDIF.

    lv_where_conditions = |AirlineID = '{ lv_airline_id }'|.

    TRY.
        SELECT FROM (lv_datasource_name)
            FIELDS (lv_selected_columns)
            where (lv_where_conditions)
            INTO CORRESPONDING FIELDS OF TABLE @lt_content.

      CATCH cx_sy_dynamic_osql_syntax
            cx_sy_dynamic_osql_semantics
            cx_sy_dynamic_osql_error      INTO lx_dynamic_osql.

            out->write( lx_dynamic_osql->get_text(  ) ).
            RETURN.
    ENDTRY.

    if sy-subrc = 0.
        out->write( lines( lt_content ) ).
        out->write( lt_content ).
    else.
        out->write( 'No Data' ).
    ENDIF.

  ENDMETHOD.
ENDCLASS.
