CLASS zcl_cp07_itab2 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_cp07_itab2 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

*4.1. FOR
    TYPES: BEGIN OF lty_flights,
             iduser      TYPE /dmo/customer_id,
             aircode     TYPE /dmo/carrier_id,
             flightnum   TYPE /dmo/connection_id,
             key         TYPE land1,
             seat        TYPE /dmo/plane_seats_occupied,
             flightdate  TYPE /dmo/flight_date,
             flightprice TYPE /dmo/flight_price,
             currency    TYPE /dmo/currency_code,
           END OF lty_flights.

    DATA: gt_flights_info TYPE TABLE OF lty_flights,
          gt_my_flights   TYPE TABLE OF lty_flights.

    gt_my_flights = VALUE #( FOR  i = 1 UNTIL i > 30
                             ( iduser     = | { 123456 + 1 } - USER |
                               aircode    = 'LH'
                               flightnum  = 0001 + i
                               key        = 'US'
                               seat       = 0 + i
                               flightdate = cl_abap_context_info=>get_system_date(  ) + 1 ) ).

*    gt_flights_info = VALUE #( FOR  i = 1 WHILE i <= 10
*                                 ( iduser     = | { 123456 + 1 } - USER |
*                                   aircode    = 'LH'
*                                   flightnum  = 0001 + i
*                                   key        = 'US'
*                                   seat       = 0 + i
*                                   flightdate = cl_abap_context_info=>get_system_date(  ) + 1 ) ).

    gt_flights_info = VALUE #( FOR gs_my_flight IN gt_my_flights
                                 WHERE ( aircode = 'LH' AND flightnum > 0012 )
                                 ( iduser     = gs_my_flight-iduser
                                   aircode    = gs_my_flight-aircode
                                   flightnum  = gs_my_flight-flightnum
                                   key        = gs_my_flight-key
                                   seat       = gs_my_flight-seat
                                   flightdate = gs_my_flight-flightdate ) ).

*    out->write( data = gt_my_flights name = 'gt_my_flights' ).
*    out->write( |\n| ).
*    out->write( data = gt_flights_info name = 'gt_flights_info' ).

*4.2. FOR Anidado - Cursor paralelo

    SELECT FROM /dmo/flight
        FIELDS *
        INTO TABLE @DATA(gt_flights_type).

    SELECT FROM /dmo/booking_m
         FIELDS carrier_id, connection_id, flight_price, currency_code
         INTO TABLE @DATA(gt_airline)
         UP TO 20 ROWS.

    DATA gt_final TYPE STANDARD TABLE OF lty_flights WITH NON-UNIQUE KEY flightprice.

    gt_final = VALUE #( FOR gs_flight_type IN gt_flights_type WHERE (  carrier_id = 'AA' )
                            FOR gs_airline IN gt_airline WHERE ( carrier_id = gs_flight_type-carrier_id )

                          ( aircode     = gs_flight_type-carrier_id
                            flightnum   = gs_flight_type-connection_id
                            flightdate  = gs_flight_type-flight_date
                            flightprice = gs_airline-flight_price
                            currency    = gs_airline-currency_code ) ).

*    out->write( data =  gt_final name = 'gt_final' ).

*4.3. Añadir múltiples líneas (SELECT)

    DATA gt_flights TYPE STANDARD TABLE OF /dmo/flight.

    SELECT FROM /dmo/flight
        FIELDS *
        WHERE carrier_id = 'LH'
        "INTO TABLE @DATA(gt_flights).
        INTO TABLE @gt_flights.

    SELECT carrier_id, connection_id, flight_date
        FROM @gt_flights AS gt
        INTO TABLE @DATA(gt_flight_copy).

*    out->write( data =  gt_flight_copy name = 'gt_flight_copy' ).

*4.4. Ordenar registros

*    SORT gt_flight_copy.
*    out->write( data =  gt_flight_copy name = 'gt_flight_copy' ).

    SORT gt_flights DESCENDING.
*    out->write( data =  gt_flights name = 'gt_flights' ).

*    SORT gt_flights BY flight_date.
*    out->write( data =  gt_flights name = 'gt_flights' ).

*   SORT gt_flight_copy BY flight_date DESCENDING connection_id ASCENDING.
*    out->write( data =  gt_flight_copy name = 'gt_flight_copy' ).

*4.5. Modificar registros

*    out->write( data =  gt_flights name = 'BEFORE / gt_flights' ).

    LOOP AT gt_flights INTO DATA(gs_flights).

      IF gs_flights-flight_date > '20250101'.

        gs_flights-flight_date = cl_abap_context_info=>get_system_date(  ).

        "MODIFY gt_flights FROM gs_flights INDEX 2.
        "MODIFY gt_flights FROM gs_flights TRANSPORTING flight_date.
        MODIFY gt_flights FROM VALUE #( connection_id = '111'
                                        carrier_id    = 'XX'
                                        plane_type_id = 'YY' ) TRANSPORTING connection_id
                                                                            carrier_id
                                                                            plane_type_id.

      ENDIF.
    ENDLOOP.

*    out->write( |\n| ).
*    out->write( data =  gt_flights name = 'AFTER / gt_flights' ).

*4.6. Eliminar registros

    DATA: gt_flights_struc TYPE STANDARD TABLE OF /dmo/airport,
          gs_flights_struc TYPE /dmo/airport.

    SELECT FROM /dmo/airport
        FIELDS *
        WHERE country = 'US'
        INTO  TABLE @gt_flights_struc.

    IF sy-subrc = 0.
*        out->write( data =  gt_flights_struc name = 'BEFORE / gt_flights_struc' ).

      LOOP AT gt_flights_struc INTO gs_flights_struc.

        IF gs_flights_struc-airport_id = 'JFK' OR
           gs_flights_struc-airport_id = 'BNA' OR
           gs_flights_struc-airport_id = 'BOS'.

          DELETE TABLE gt_flights_struc FROM gs_flights_struc.

        ENDIF.

      ENDLOOP.

      DELETE gt_flights_struc INDEX 2.
      DELETE gt_flights_struc FROM 5 TO 8.
      DELETE gt_flights_struc WHERE city IS INITIAL.
      DELETE ADJACENT DUPLICATES FROM gt_flights_struc COMPARING country.

    ENDIF.

*    out->write( |\n| ).
*    out->write( data =  gt_flights_struc name = 'AFTER / gt_flights_struc' ).

*4.8. Instrucción COLLECT

    DATA: BEGIN OF ls_seats,
            carrid TYPE /dmo/flight-carrier_id,
            connid TYPE /dmo/flight-connection_id,
            seats  TYPE /dmo/flight-seats_max,
            price  TYPE /dmo/flight-price,
          END OF ls_seats.

    DATA gt_seats LIKE HASHED TABLE OF ls_seats WITH UNIQUE KEY carrid connid.

    SELECT carrier_id, connection_id, seats_max, price
        FROM /dmo/flight
        INTO @ls_seats.

      COLLECT ls_seats INTO gt_seats.

    ENDSELECT.

*    out->write( data =  gt_seats name = 'gt_seats' ).

*4.9. Instrucción LET

    SELECT FROM /dmo/flight
        FIELDS *
        WHERE currency_code = 'USD'
        INTO TABLE @DATA(lt_flights).

    SELECT FROM /dmo/booking_m
         FIELDS *
         INTO TABLE @DATA(lt_airline)
         UP TO 50 ROWS.

    LOOP AT lt_flights INTO DATA(ls_flight_let).

      DATA(lv_flights) = CONV string(  LET lv_airline      = lt_airline[ carrier_id    = ls_flight_let-carrier_id ]-travel_id
                                           lv_flight_price = lt_flights[ carrier_id    = ls_flight_let-carrier_id
                                                                         connection_id = ls_flight_let-connection_id ]-price
                                           lv_carrier      = lt_airline[ carrier_id    = ls_flight_let-carrier_id ]-carrier_id
                                        IN | { lv_carrier } / Airline: { lv_airline }   / Price: { lv_flight_price } | ).

*     out->write( data =  lv_flights ).

    ENDLOOP.

*4.10. Instrucción BASE

*    out->write( data =  lt_flights  name = 'lt_flights' ).

    DATA lt_seats TYPE TABLE OF /dmo/flight.

    lt_seats = VALUE #( BASE lt_flights
                        ( carrier_id     = 'CL'
                          connection_id  = '000123'
                          flight_date    = cl_abap_context_info=>get_system_date(  )
                          price          = 81000
                          currency_code  = 'CLP'
                          plane_type_id  = '0213-58'
                          seats_max      = 120
                          seats_occupied = 120 ) ).

    lt_seats = VALUE #( BASE lt_seats ( LINES OF lt_flights )
                        ( carrier_id     = 'PE'
                          connection_id  = '000123'
                          flight_date    = cl_abap_context_info=>get_system_date(  )
                          price          = 700
                          currency_code  = 'USD'
                          plane_type_id  = '0213-58'
                          seats_max      = 90
                          seats_occupied = 90 ) ).

    lt_seats = CORRESPONDING #( BASE ( lt_seats ) lt_flights ).

*    out->write( data =  lt_seats  name = 'lt_seats' ).

*4.11. Agrupación de registros

    SELECT FROM /dmo/flight
        FIELDS *
        INTO TABLE @DATA(lt_dmo_flights).

    DATA gt_member LIKE lt_dmo_flights.

    LOOP AT lt_dmo_flights ASSIGNING FIELD-SYMBOL(<lfs_dmo_flight>)

        "GROUP BY <lfs_dmo_flight>-carrier_id.
        GROUP BY ( airline = <lfs_dmo_flight>-carrier_id
                   "plane   = <lfs_dmo_flight>-plane_type_id ).
                   plane   = <lfs_dmo_flight>-plane_type_id    " ). ... INTO DATA(gs_key)
                   index   = GROUP INDEX
                   SIZE    = GROUP SIZE ) WITHOUT MEMBERS INTO DATA(gs_key). "4.12. Agrupar por clave

*        CLEAR gt_member.
*
*        "LOOP AT GROUP <lfs_dmo_flight> INTO DATA(gs_member).
*        LOOP AT GROUP gs_key INTO DATA(gs_member). "4.12. Agrupar por clave
*
*            gt_member = VALUE #( BASE gt_member ( gs_member ) ).
*
*        ENDLOOP.
*
*        out->write( data =  gt_member  name = 'gt_member' ).
*        out->write( data =  gs_key  name = 'gs_key' ).
    ENDLOOP.

*4.12. Agrupar por clave

*4.13. FOR GROUPS

    SELECT FROM /dmo/flight
        FIELDS *
        INTO TABLE @DATA(gt_dmo_flights).

    TYPES lty_group_keys TYPE STANDARD TABLE OF /dmo/flight-carrier_id WITH EMPTY KEY.

*    out->write( VALUE lty_group_keys( FOR GROUPS gv_group OF gs_group IN gt_dmo_flights
*                                          GROUP BY gs_group-carrier_id
*                                          DESCENDING
*                                          WITHOUT MEMBERS ( gv_group ) ) ).

*4.14. Tablas de rangos

    TYPES lty_price TYPE RANGE OF /dmo/flight-price.

    DATA(lt_price_range) = VALUE lty_price( ( sign   = 'I'
                                               option = 'BT'
                                               low    = '600'
                                               high   = '1000'  ) ).

    SELECT *
    FROM /dmo/flight
    WHERE price IN @lt_price_range
    INTO TABLE @DATA(ltr_price).

*    out->write( data =  lt_price_range  name = 'lt_price_range' ).
*    out->write( data =  ltr_price  name = 'ltr_price' ).

*4.15. Enumeraciones

    TYPES: BEGIN OF ENUM gty_colors STRUCTURE ls_type,
                c_blanco,
                c_negro,
                c_purpura,
                c_rojo,
                c_azul,
           END OF ENUM gty_colors STRUCTURE ls_type.

    DATA lv_colors TYPE gty_colors.

    out->write( lv_colors ).

    lv_colors = ls_type-c_negro.

    out->write( lv_colors ).

  ENDMETHOD.
ENDCLASS.
