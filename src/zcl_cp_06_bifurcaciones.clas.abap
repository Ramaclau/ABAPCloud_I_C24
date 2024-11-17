CLASS zcl_cp_06_bifurcaciones DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_CP_06_BIFURCACIONES IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

*2. Uso y conversiones tipos de datos
*2.1. Conceptos

    DATA ls_flight TYPE /dmo/flight. " Estructura

*2.2. Declaración estructuras

    TYPES: BEGIN OF lty_employee,
             name  TYPE string,
             id    TYPE i,
             email TYPE /dmo/email_address,
           END OF lty_employee.

    "otra forma de declarar
    DATA: BEGIN OF ls_employee,
            name  TYPE string VALUE 'Laura',
            id    TYPE i,
            email TYPE /dmo/email_address,
          END OF ls_employee.

    DATA lt_employee TYPE TABLE OF lty_employee. " ITAB
    DATA ls_emp TYPE lty_employee. " estrctura

    DATA ls_emp2 LIKE ls_employee. "estructura de una estrectura definida
    DATA(ls_emp3) = ls_employee. " ...
    DATA(ls_emp4) = VALUE lty_employee( name = 'Claudio' id = 1234 email = 'sripizarro@gmail' ).

*2.3. Estructuras anidadas (NESTED)

    DATA: BEGIN OF ls_empl_info,
            BEGIN OF info,
              id         TYPE i VALUE 12345,
              first_name TYPE string VALUE 'Laura',
              last_name  TYPE string VALUE 'Martinez',
            END OF info,
            BEGIN OF address,
              city    TYPE string VALUE 'Santiago',
              street  TYPE string VALUE '2da avenida',
              country TYPE string VALUE 'Chile',
            END OF address,
            BEGIN OF position,
              depart TYPE string VALUE 'IT',
              Salary TYPE p VALUE '2000.23',
            END OF position,
          END OF ls_empl_info.

    out->write( data = ls_empl_info name = 'Employee info' ).

*2.4. Estructuras complejas (DEEP)

    TYPES: BEGIN OF lty_flights,
             flight_date   TYPE /dmo/flight-flight_date,
             price         TYPE /dmo/flight-price,
             currency_code TYPE /dmo/flight-currency_code,
           END OF lty_flights.

    DATA: BEGIN OF ls_flight_info,
            carrier    TYPE /dmo/flight-carrier_id VALUE 'AA',
            connid     TYPE /dmo/flight-connection_id VALUE '0018',
*            lt_flights TYPE TABLE OF lty_flights WITH EMPTY KEY,
            ls_flights TYPE lty_flights,
          END OF ls_flight_info.

*     SELECT *
*     FROM /dmo/flight
*     WHERE carrier_id = 'AA'
*     INTO CORRESPONDING FIELDS OF TABLE @ls_flight_info-lt_flights
*     UP TO 4 ROWS.

*     out->write( data = ls_flight_info name = 'ls_flight_infoo' ).

*2.5. Acceso (reutilizamos la tabla y estructura anterior cambiado lt_flight)

    ls_flight_info-carrier = 'XX'.
    ls_flight_info-connid  = '0022'.
    ls_flight_info-ls_flights-flight_date = cl_abap_context_info=>get_system_date(  ).
    ls_flight_info-ls_flights-currency_code = 'USD'.
    ls_flight_info-ls_flights-price = 200.

    IF ls_flight_info-carrier = 'XX'.
      out->write( data = ls_flight_info name = 'ls_flight_infoo' ).
    ENDIF.

*2.6. Añadir datos

    "NESTED Structure
    ls_empl_info = VALUE #(
                        info     = VALUE #(  id = 123456 first_name = 'Juan' last_name = 'Perez' )
                        address  = VALUE #(  City = 'Madrid' street = 'Gran Via' country = 'España' )
                        position = VALUE #(  depart = ' Finance' salary = 12345 ) ).

    out->write( data = ls_empl_info name = 'ls_empl_info' ).

    out->write( |\n| ).

    "DEEP Structure
    ls_flight_info = VALUE #( carrier    = 'SP'
                              connid     = '0035'
                              ls_flights = VALUE #( flight_date   = '20240609'
                                                    currency_code = 'EUR'
                                                    price         = '200' ) ).

    out->write( data = ls_flight_info name = '2.ls_flight_info' ).

    "Definir estructura en linea
    DATA(ls_flight2) = VALUE lty_flights( currency_code = 'USD' ).
    out->write( data = ls_flight2 name = '2.ls_flight2' ).

*2.7. Eliminar datos

    SELECT SINGLE FROM /dmo/flight
        FIELDS *
        WHERE carrier_id = 'LH'
        INTO @DATA(ls_flight3).

    out->write( data = ls_flight3 name = '3.ls_flight3' ).

    CLEAR  ls_flight3-connection_id.
    out->write( data = ls_flight3 name = '3.ls_flight3' ).

    CLEAR  ls_flight3.
    out->write( data = ls_flight3 name = '3.ls_flight3' ).

*2.8. Estructura INCLUDE

    "NASTED
    TYPES: BEGIN OF purchase_order_type,
             order_id   TYPE i,
             order_date TYPE d,
           END OF purchase_order_type,

           BEGIN OF supplaier_type,
             supplaier_id TYPE i,
             name        TYPE string,
           END OF supplaier_type,

           BEGIN OF material_type,
             material_id TYPE i,
             name        TYPE string,
           END OF material_type.

    DATA ls_mat TYPE material_type.

    TYPES BEGIN OF invoice_type.
        INCLUDE TYPE purchase_order_type AS purchase.
        INCLUDE TYPE supplaier_type AS supplaier renaming with suffix _supplaier.
        INCLUDE STRUCTURE ls_mat AS mat renaming with suffix _mat.
    TYPES END OF invoice_type.

    DATA: ls_invoice  TYPE invoice_type,
          ls_purchase TYPE purchase_order_type.

    ls_purchase = VALUE #( order_date = '20241014' order_id = 1234 ).

    ls_invoice = VALUE #( purchase = ls_purchase
                          supplaier-supplaier_id = 123
                          supplaier-name         = 'YY'
                          material_id_mat        = 121
                          name_mat               = 'material' ).

    out->write( data = ls_invoice name = 'ls_invoice' ).


  ENDMETHOD.
ENDCLASS.
