CLASS zcl_lab_09_struc_sripizarro DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_LAB_09_STRUC_SRIPIZARRO IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

*1. Declaración estructuras

    TYPES: BEGIN OF ty_flights,
             iduser     TYPE string,
             aircode    TYPE /dmo/carrier_id,
             flightnum  TYPE /dmo/connection_id,
             key        TYPE land1,
             seat       TYPE /dmo/plane_seats_occupied,
             flightdate TYPE /dmo/flight_date,
           END OF ty_flights.

    TYPES: BEGIN OF ty_airline,
             carrid    TYPE /dmo/carrier_id,
             connid    TYPE /dmo/connection_id,
             countryfr TYPE land1,
             cityfrom  TYPE /dmo/city,
             countryto TYPE land1,
           END OF ty_airline.

*2. Estructuras anidadas (NESTED)

    DATA: BEGIN OF ls_flight,
            BEGIN OF flight,
              iduser     VALUE 12345,
              connid     VALUE 123,
              flightnum  VALUE 900,
              key        VALUE 'A',
              seat       VALUE 200,
              flightdate VALUE '20241026',
            END OF flight,
            BEGIN OF airline,
              carrid    VALUE 'AA',
              connid    VALUE '0018',
              countryfr VALUE 'B',
              cityfrom  VALUE 'S',
              countryto VALUE 'P',
            END OF airline,
          END OF ls_flight.

    out->write( data = ls_flight name = 'ls_flight' ).

*3. Estructuras complejas (DEEP)

    TYPES: BEGIN OF ty_deep,
             carrid TYPE /dmo/carrier_id,
             connid TYPE /dmo/connection_id,
             flight TYPE ty_flights,
           END OF ty_deep.

*4. Añadir datos

    DATA ls_flight_info TYPE ty_flights.

    ls_flight_info-iduser = 12345.
    ls_flight_info-aircode = '0035'.
    ls_flight_info-flightdate = cl_abap_context_info=>get_system_date(  ).
    ls_flight_info-flightnum = 321.
    ls_flight_info-key       = 'B'.
    ls_flight_info-seat      = 200.

    out->write( data = ls_flight_info name = 'ls_flight_info' ).

*5. Estructura INCLUDE

*Eliminar datos

    SELECT SINGLE FROM /dmo/flight
        FIELDS *
        WHERE carrier_id = 'LH'
        INTO @DATA(ls_flight3).

    out->write( data = ls_flight3 name = '3.ls_flight3' ).

    CLEAR  ls_flight3-connection_id.
    out->write( data = ls_flight3 name = '3.ls_flight3' ).






  ENDMETHOD.
ENDCLASS.
