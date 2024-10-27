CLASS zcl_lab_07_tables_sripiza DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_lab_07_tables_sripiza IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.
* 1. FOR

    TYPES: BEGIN OF ty_flights,
             iduser     TYPE c LENGTH 40,
             aircode    TYPE /dmo/carrier_id,
             flightnum  TYPE /dmo/connection_id,
             key        TYPE land1,
             seat       TYPE /dmo/plane_seats_occupied,
             flightdate TYPE /dmo/flight_date,
           END OF ty_flights.

    DATA: lt_flights      TYPE TABLE OF ty_flights,
          lt_flights_info TYPE TABLE OF ty_flights.

    lt_flights = VALUE #( FOR  i = 1 UNTIL i > 15
                                 ( iduser     = | { 1234 + i } - USER |
                                   aircode    = 'SQ'
                                   flightnum  = 0000 + i
                                   key        = 'US'
                                   seat       = 0 + i
                                   flightdate = cl_abap_context_info=>get_system_date(  ) + 1 ) ).

    lt_flights_info = VALUE #( FOR gs_my_flight IN lt_flights
                             ( iduser     = gs_my_flight-iduser
                               aircode    = 'CL'
                               flightnum  = gs_my_flight-flightnum + 10
                               key        = 'COP'
                               seat       = gs_my_flight-seat
                               flightdate = gs_my_flight-flightdate ) ).

*    out->write( data = lt_flights name = 'lt_flights' ).
*    out->write( |\n| ).
*    out->write( data = lt_flights_info name = 'lt_flights_info' ).

* 2. FOR Anidado

    DATA: mt_flihts_type TYPE STANDARD TABLE OF /dmo/flight,
          "mt_airline     TYPE STANDARD TABLE OF /dmo/connection,
          lt_final       TYPE ty_flights.

    SELECT FROM /dmo/flight
        FIELDS *
        INTO TABLE @mt_flihts_type.

    SELECT FROM /dmo/connection
        FIELDS carrier_id, connection_id, airport_from_id
        INTO TABLE @DATA(mt_airline).

    out->write( data = mt_flihts_type name = 'mt_flihts_type' ).
    out->write( |\n| ).
    out->write( data = mt_airline name = 'mt_airline' ).

    DATA gt_final TYPE STANDARD TABLE OF ty_flights WITH NON-UNIQUE KEY flightnum.

    gt_final = VALUE #( FOR gs_flight_type IN mt_flihts_type WHERE (  carrier_id = 'SQ' )
                            FOR gs_airline IN mt_airline WHERE ( connection_id = gs_flight_type-connection_id )
                          ( aircode     = gs_flight_type-carrier_id
                            flightnum   = gs_flight_type-connection_id
                            key         = gs_flight_type-currency_code
                            seat         = gs_flight_type-seats_occupied
                            flightdate  = gs_flight_type-flight_date ) ).

    out->write( data = gt_final name = 'gt_final' ).

* 3. Añadir múltiples líneas (SELECT)

    TYPES: BEGIN OF ty_airlines,
             carrier_id      TYPE /dmo/carrier_id,
             connection_id   TYPE /dmo/connection_id,
             airport_from_id TYPE /dmo/airport_from_id,
             airport_to_id   TYPE /dmo/airport_to_id,
           END OF ty_airlines.

    DATA mt_airlines TYPE TABLE OF ty_airlines.

    SELECT FROM /dmo/connection
        FIELDS carrier_id, connection_id, airport_from_id, airport_to_id
        WHERE airport_from_id = 'FRA'
        INTO TABLE @mt_airlines.

    out->write( data = mt_airlines name = 'mt_airlines' ).

* 4. Ordenar registros

    SORT mt_airlines DESCENDING.
    out->write( data =  mt_airlines name = 'mt_airlines DESC' ).

* 5. Modificar registros

    LOOP AT gt_final INTO DATA(gs_final).
      IF gs_final-flightdate > '20250101'.
        gs_final-flightdate = cl_abap_context_info=>get_system_date(  ).

        MODIFY gt_final FROM gs_final TRANSPORTING flightdate.

      ENDIF.
    ENDLOOP.

    out->write( data =  gt_final name = 'gt_final MODIFY' ).

*6. Eliminar registros

    SELECT FROM /dmo/connection
        FIELDS *
        INTO TABLE @DATA(mt_airline2).


    IF sy-subrc = 0.
      LOOP AT mt_airline2 INTO DATA(gs_ariline).

        IF gs_ariline-airport_to_id = 'FRA'.

          DELETE TABLE mt_airline2 FROM gs_ariline.

        ENDIF.

      ENDLOOP.
    ENDIF.

    out->write( data =  mt_airline2 name = 'mt_airline DELETE' ).

* 7. CLEAR / FREE

* 8. Instrucción COLLECT

    DATA: BEGIN OF ty_seats,
            carrid   TYPE /dmo/flight-carrier_id,
            connid   TYPE /dmo/flight-connection_id,
            seats    TYPE /dmo/flight-seats_max,
            bookings TYPE /dmo/flight-price,
          END OF ty_seats.

    DATA lt_seats   LIKE HASHED TABLE OF ty_seats WITH UNIQUE KEY carrid connid.
    DATA lt_seats_2 LIKE STANDARD TABLE OF ty_seats.

*    SELECT FROM /dmo/...
*        FIELDS *
*        WHERE seats_max = 140
*        INTO TABLE @data(ty_seats2).

* no dice a que table debo hacer el select en el documento

* 9. Instrucción LET

    SELECT FROM /dmo/flight
        FIELDS *
        INTO TABLE @mt_flihts_type.

    SELECT FROM /dmo/carrier
         FIELDS *
         INTO TABLE @DATA(mt_scarr).

    LOOP AT mt_flihts_type INTO DATA(ls_flight_let).

*      DATA(lv_flights) = CONV string( LET lv_flights = mt_scarr[ carrier_id = ls_flight_let-carrier_id ]-carrier_id
*      lv_price        = mt_scarr[ carrier_id    = ls_flight_let-carrier_id
*      connection_id   = ls_flight_let-connection_id ]-price
*      lv_carrier      = ls_flight_let[ carrier_id    = ls_flight_let-carrier_id ]-carrier_id
*      IN | { lv_carrier } / Airline: { lv_airline }   / Price: { lv_flight_price } | ).

*     out->write( data =  lv_flights ).

* se puede hacer lo mismo en un query

    ENDLOOP.

* 10. Instrucción BASE

    DATA lt_flights_base TYPE TABLE OF /dmo/flight.

    lt_flights_base = CORRESPONDING #( BASE ( lt_flights_base ) mt_flihts_type ).

   out->write( data =  lt_flights_base  name = 'lt_flights_base' ).

* 11. Agrupación de registros

* 12. Agrupar por clave

* 13. FOR GROUPS

* 14. Tablas de rangos




  ENDMETHOD.
ENDCLASS.
