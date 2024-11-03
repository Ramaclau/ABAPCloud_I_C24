CLASS zcl_cp11_performance DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_cp11_performance IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

*3.1. SORT

    TYPES: lty_flights TYPE STANDARD TABLE OF /dmo/flight
            WITH NON-UNIQUE KEY carrier_id connection_id flight_date.

    DATA lt_flights TYPE lty_flights.

    lt_flights = VALUE #( ( client = sy-mandt
                        carrier_id = 'CO'
                        connection_id = '0900'
                        flight_date = cl_abap_context_info=>get_system_date(  )
                        price = 500
                        currency_code = 'USD' )
                        ( client = sy-mandt
                        carrier_id = 'AR'
                        connection_id = '0700'
                        flight_date = cl_abap_context_info=>get_system_date(  )
                        price = 550
                        currency_code = 'USD' )
                        ( client = sy-mandt
                        carrier_id = 'CO'
                        connection_id = '0900'
                        flight_date = cl_abap_context_info=>get_system_date(  )
                        price = 650
                        currency_code = 'USD' )
                        ( client = sy-mandt
                        carrier_id = 'CL'
                        connection_id = '0800'
                        flight_date = cl_abap_context_info=>get_system_date(  )
                        price = 700
                        currency_code = 'USD' )
                        ( client = sy-mandt
                        carrier_id = 'PE'
                        connection_id = '0400'
                        flight_date = cl_abap_context_info=>get_system_date(  )
                        price = 510
                        currency_code = 'USD' ) ).

    out->write( 'Antes SORT' ).
    out->write( lt_flights ).

    SORT lt_flights.
    out->write( 'SORT PK' ).
    out->write( lt_flights ).

    SORT lt_flights BY currency_code.
    out->write( 'SORT BY FIELD' ).
    out->write( lt_flights ).

    SORT lt_flights BY carrier_id DESCENDING.
    out->write( 'SORT BY FIELD' ).
    out->write( lt_flights ).

*3.2. Eliminación de registros duplicados

    SORT lt_flights BY carrier_id connection_id.
    DELETE ADJACENT DUPLICATES FROM lt_flights. " COMPARING carrier_id connection_id.
    out->write( data = lt_flights name = 'DELETE SORT' ).

*3.3. Reducciones

    TYPES: BEGIN OF lty_total,
            price    TYPE /dmo/flight_price,
            seatsocc TYPE /dmo/plane_seats_occupied,
           END OF lty_total.

    DATA lt_flights_res TYPE TABLE OF /dmo/flight.

    SELECT FROM /dmo/flight
        FIELDS *
        INTO TABLE @lt_flights_res.

    DATA(lv_sum) = REDUCE i( INIT lv_result = 0
                                FOR ls_flghts_res IN lt_flights_res
                                NEXT lv_result += ls_flghts_res-price ).

    out->write( data = lv_sum name = 'lv_sum' ).

    data(ls_data) = REDUCE lty_total( INIT ls_total TYPE lty_total
                                FOR ls_flghts_res2 IN lt_flights_res
                                NEXT ls_total-price    += ls_flghts_res2-price
                                     ls_total-seatsocc += ls_flghts_res2-seats_occupied ).

     out->write( data = ls_data name = 'Estructura' ).

*3.4. Acceso a tablas internas
*creacion de una nueva clase para ver este tema: zcl_cp11_fsvssst

*3.5 utiliza la 3.4

*3.6. Rendimiento Tablas SORT y HASH
*creacion de una nueva clase para ver este tema:

*3.7. Uso claves secundarias
*creacion de una nueva clase para ver este tema:


  ENDMETHOD.
ENDCLASS.
