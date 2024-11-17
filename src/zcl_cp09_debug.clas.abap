CLASS zcl_cp09_debug DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_CP09_DEBUG IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

*1.2. Debug
*1.3. Funciones de navegación

    TYPES: lty_flights TYPE STANDARD TABLE OF /dmo/flight
            WITH NON-UNIQUE KEY carrier_id connection_id flight_date.

    DATA lt_flights TYPE lty_flights.


    lt_flights = VALUE #( ( client = sy-mandt
                        carrier_id = 'CO'
                        connection_id = '0500'
                        flight_date = cl_abap_context_info=>get_system_date(  )
                        price = 1500
                        currency_code = 'USD'
                        plane_type_id = 'A340-600'
                        seats_max = 200
                        seats_occupied = 180 ) ).

    "out->write( lt_flights ).

*1.4. Tipos de Break-points

*1.5. Identificar errores en modo depuración

    DATA lv_total TYPE i.
    DATA(lv_num) = 10.
    DATA(lv_string) = 60. "'AB'.

    lv_total = lv_num + lv_string.

    out->write( lv_total ).

*1.6. Watchpoints

   TYPES: BEGIN OF lty_flights2,
             aircode     TYPE /dmo/carrier_id,
             flightnum   TYPE /dmo/connection_id,
             key         TYPE land1,
             seat        TYPE /dmo/plane_seats_occupied,
             flightdate  TYPE /dmo/flight_date,
           END OF lty_flights2.

    DATA: gt_final TYPE SORTED TABLE OF lty_flights2 WITH NON-UNIQUE KEY flightnum.

    SELECT FROM /dmo/flight
        FIELDS *
        INTO TABLE @DATA(gt_flights).

    SELECT FROM /dmo/a_booking_d
        FIELDS carrier_id, connection_id, customer_id
        WHERE booking_status = 'N' and  connection_id = '0001'
        INTO TABLE @DATA(gt_airline).

    gt_final = VALUE #( FOR gs_flights IN gt_flights WHERE ( carrier_id = 'SQ' )
                            FOR gs_airline IN gt_airline WHERE ( connection_id = gs_flights-connection_id )
                             ( aircode    = gs_airline-carrier_id
                             flightnum  = gs_airline-connection_id
                             key        = gs_airline-customer_id
                             seat       = gs_flights-seats_occupied
                             flightdate = gs_flights-flight_date ) ).


    out->write( gt_final ).

*1.7. Guardar sesiones





  ENDMETHOD.
ENDCLASS.
