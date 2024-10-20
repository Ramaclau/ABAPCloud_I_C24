CLASS zcl_cp07_itab DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_cp07_itab IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

*3.4. Claves
    DATA: lt_flight_stard  TYPE STANDARD TABLE OF /dmo/flight WITH EMPTY KEY,
          lt_flight_stard2 TYPE TABLE OF /dmo/flight.

    DATA: lt_flight_sort  TYPE SORTED TABLE OF /dmo/flight WITH NON-UNIQUE KEY carrier_id.

    DATA: lt_flight_hash  TYPE HASHED TABLE OF /dmo/flight WITH UNIQUE KEY carrier_id.

*3.5. Añadir registros

*    DATA: lt_employee TYPE STANDARD TABLE OF zemploy_table,
*          ls_employee TYPE zemploy_table.
**
*    DATA lty_employee LIKE lt_employee.
*
*    lt_employee = VALUE #( ( Id = 0000
*                             first_name = 'Mario'
*                             last_name  = 'Martinez'
*                             email      = 'mmartinez@gmail.com'
*                             phone_number = '123456'
*                             salary      = '2000.3'
*                             currency_code = 'EUR' ) ).
*
**    out->write( lt_employee ).
*
*    "DATA(lt_employee2) = VALUE lty_employee(  ( Id = 0001
*    lt_employee = VALUE #( ( Id = 0000
*                            first_name = 'Mario'
*                            last_name  = 'Martinez'
*                            email      = 'mmartinez@gmail.com'
*                            phone_number = '123456'
*                            salary      = '2000.3'
*                            currency_code = 'EUR' )
*                           ( Id = 0001
*                                               first_name = 'Juan'
*                                               last_name  = 'Perez'
*                                               email      = 'lperez@gmail.com'
*                                               phone_number = '123456'
*                                               salary      = '2200.3'
*                                               currency_code = 'EUR' )
*                                             ( Id = 0002
*                                               first_name = 'Luis'
*                                               last_name  = 'Garcia'
*                                               email      = 'lgarcia@gmail.com'
*                                               phone_number = '9923451'
*                                               salary      = '2100.3'
*                                               currency_code = 'EUR' ) ).

*    out->write( lt_employee ).

*3.6. Insertar registros

    DATA: lt_employees TYPE STANDARD TABLE OF zemploy_table,
          ls_employee  TYPE zemploy_table.

    DATA lt_employees2 LIKE lt_employees.

*    ls_employee-Id            = 0001.
*    ls_employee-first_name    = 'laura'.
*    ls_employee-last_name     = 'martinez'.
*    ls_employee-email         = 'lauram@gmail.com'.
*    ls_employee-phone_number  = '34556666'.
*    ls_employee-salary        = '3000.2'.
*    ls_employee-currency_code = 'EUR'.
*
*    INSERT ls_employee INTO TABLE lt_employees.
*
*    out->write( lt_employees ).
*
*    INSERT VALUE #( Id = 0002
*                    first_name    = 'Mario'
*                    last_name     = 'Martinez'
*                    email         = 'mmartinez@gmail.com'
*                    phone_number  = '123456'
*                    salary        = '2000.3'
*                    currency_code = 'EUR' ) INTO TABLE lt_employees.
*
*    INSERT INITIAL LINE INTO TABLE lt_employees.
*
*    out->write( lt_employees ).
**
*    INSERT VALUE #(     Id            = 0003
*                        first_name    = 'Daniela'
*                        last_name     = 'Lopez'
*                        email         = 'danielal@gmail.com'
*                        phone_number  = '22334444'
*                        salary        = '1890'
*                        currency_code = 'EUR' ) INTO lt_employees INDEX 2.

    "INSERT LINES OF ls_employee INTO TABLE lt_employees2.
*    "INSERT LINES OF ls_employees TO 1 INTO TABLE lt_employees2.
*    INSERT LINES OF ls_employees FROM 2 TO 3 INTO TABLE lt_employees2.
*
*    out->write( data = lt_employees name = 'lt_employees' ).
*    out->write( |\n| ).
*    out->write( data = lt_employees2 name = 'lt_employees2' ).

*3.7. Añadir registros con APPEND

*    ls_employee-Id            = 0001.
*    ls_employee-first_name    = 'laura'.
*    ls_employee-last_name     = 'martinez'.
*    ls_employee-email         = 'lauram@gmail.com'.
*    ls_employee-phone_number  = '34556666'.
*    ls_employee-salary         = '3000'.
*    ls_employee-currency_code = 'EUR'.
*
*    APPEND ls_employee TO lt_employees.
*
*    APPEND INITIAL LINE TO lt_employees.
*
*    APPEND VALUE #( Id            = 0001
*                    first_name    = 'Mario'
*                    last_name     = 'martinez'
*                    email         = 'mariom@gmail.com'
*                    phone_number  = '7349991'
*                    salary         = '4000'
*                    currency_code = 'EUR' ) TO lt_employees.
*
*      out->write( data = lt_employees name = 'lt_employees' ).

*3.8. CORRESPONDING

*    TYPES: BEGIN OF lty_flights,
*             carrier     TYPE /dmo/carrier_id,
*             connection  TYPE /dmo/connection_id,
*             flight_date TYPE /dmo/flight_date,
*           END OF lty_flights.
*
*    DATA: gt_my_flights TYPE STANDARD TABLE OF lty_flights,
*          gs_my_flights TYPE lty_flights.
*
*    SELECT FROM /dmo/flight
*        FIELDS *
*        WHERE currency_code = 'EUR'
*        INTO TABLE @DATA(gt_flights).
*
*    "MOVE-CORRESPONDING gt_flights TO gt_my_flights.
*    "gt_my_flights = CORRESPONDING #( gt_flights ).
*    "MOVE-CORRESPONDING gt_flights TO gt_my_flights KEEPING TARGET LINES.
*    "gt_my_flights = CORRESPONDING #( ( gt_my_flights ) gt_flights ).
*
*    gt_my_flights = CORRESPONDING #( gt_flights MAPPING carrier = carrier_id connection = connection_id ).
*
**    out->write( data = gt_flights name = 'gt_flights' ).
**    out->write( |\n| ).
**    out->write( data = gt_my_flights name = 'gt_my_flights' ).
*
**3.9. READ TABLE con índice
*
    SELECT FROM /dmo/airport
        FIELDS *
        "WHERE country = 'DE'
        INTO TABLE @DATA(lt_flights).

    IF sy-subrc = 0.

*        READ TABLE lt_flights INTO DATA(ls_flight) INDEX 1.
*        out->write( data = lt_flights name = 'lt_flights' ).
*        out->write( data = ls_flight name = 'ls_flight' ).

*        READ TABLE lt_flights INTO DATA(ls_flight2) INDEX 2 TRANSPORTING airport_id city.
*        out->write( data = ls_flight2 name = 'ls_flight2' ).

*        READ TABLE lt_flights ASSIGNING FIELD-SYMBOL(<lfs_flight>) INDEX 3.
*        out->write( data = <lfs_flight> name = '<lfs_flight>' ).

*      DATA(ls_data) = lt_flights[ 2 ].
*      out->write( data = ls_data name = 'ls_data' ).
*
*      DATA(ls_data2) = VALUE #( lt_flights[ 200 ] OPTIONAL ).
*      out->write( data = ls_data2 name = 'ls_data2' ).
*
*      DATA(ls_data3) = VALUE #( lt_flights[ 20 ] DEFAULT lt_flights[ 1 ]  ).
*      out->write( data = ls_data3 name = 'ls_data3' ).

    ENDIF.

**3.10. READ TABLE con clave

    "KEY
*    READ TABLE lt_flights INTO DATA(ls_flight) WITH KEY city = 'Berlin'.
*    out->write( data = lt_flights name = 'lt_flights' ).
*    out->write( data = ls_flight name = 'ls_flight' ).
*
*    DATA(ls_flight2) = lt_flights[ airport_id = 'JFK' ].
*    out->write( data = ls_flight2 name = 'ls_flight2' ).
*
*    DATA(lv_flight2) = lt_flights[ airport_id = 'JFK' ]-name.
*    out->write( data = lv_flight2 name = 'lv_flight2' ).
*
*    "PRIMARY KEY
*    DATA gt_flights_sort TYPE SORTED TABLE OF /dmo/airport
*      WITH NON-UNIQUE KEY airport_id.
*
*    SELECT FROM /dmo/airport
*        FIELDS *
*        INTO TABLE @gt_flights_sort.
*
*    READ TABLE gt_flights_sort INTO DATA(ls_flight3) WITH TABLE KEY airport_id = 'LAS'.
*    out->write( data = gt_flights_sort name = 'gt_flights_sort' ).
*    out->write( data = ls_flight3 name = 'ls_flight3' ).
*
*    DATA(ls_flight4) = gt_flights_sort[ KEY primary_key airport_id = 'LAS' ].
*    out->write( data = ls_flight4 name = 'ls_flight4' ).

**3.11. Chequeo de registros
*
    DATA: gt_flights2 TYPE STANDARD TABLE OF /dmo/flight.

    SELECT FROM /dmo/flight
     FIELDS *
     WHERE carrier_id = 'LH'
     INTO TABLE @gt_flights2.

*    IF sy-subrc = 0.
*        READ TABLE gt_flights2 WITH KEY connection_id = '0403' TRANSPORTING NO FIELDS.
*        IF sy-subrc = 0.
*           out->write( 'Vuelo existe' ).
*        ELSE.
*           out->write( 'Vuelo No existe' ).
*        ENDIF.
*     ENDIF.
*
*      IF line_exists( gt_flights2[ connection_id = '0403' ] ).
*        out->write( 'Vuelo existe.' ).
*      ELSE.
*        out->write( 'Vuelo No existe.' ).
*      ENDIF.
*    ENDIF.

**3.12. Índice de un registro
*
*    READ TABLE gt_flights2 WITH KEY connection_id = '0403' TRANSPORTING NO FIELDS.
*
*    DATA(lv_fligth) = sy-tabix.
*
*    DATA(lv_index) = line_index( gt_flights2[ connection_id = '0401' ] ).
*
*    out->write( data = gt_flights2 name = 'gt_flights2' ).
*    out->write( data = lv_index name = 'lv_index' ).
*
*    DATA(lv_num) = lines( gt_flights2 ).
*    out->write( data = lv_num name = 'lv_num' ).
*
**3.13. LOOP AT

*    DATA gs_flight TYPE /dmo/flight..
*
*    LOOP AT gt_flights2 INTO gs_flight.
*
*      out->write( data = gs_flight name = 'gs_flight' ).
*
*    ENDLOOP.
*
*    LOOP AT gt_flights2 INTO DATA(gs_flight2) WHERE connection_id = '0403'.
*
*      out->write( data = gs_flight2 name = 'gs_flight2' ).
*
*    ENDLOOP.
*
*    LOOP AT gt_flights2 ASSIGNING FIELD-SYMBOL(<lfs_flight>) WHERE connection_id = '0400'.
*
*      out->write( data = <lfs_flight> name = '<lfs_flight>' ).
*
*    ENDLOOP.
*
*    LOOP AT gt_flights2 ASSIGNING FIELD-SYMBOL(<lfs_flight2>) FROM 2 TO 8.
*
*      <lfs_flight2>-currency_code = 'CLP'.
*
*    ENDLOOP.
*
*    out->write( data = <lfs_flight2> name = '<lfs_flight2>' ).


  ENDMETHOD.

ENDCLASS.
