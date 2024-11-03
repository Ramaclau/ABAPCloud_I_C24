CLASS zcl_cp08_expre_contruc DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_cp08_expre_contruc IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

*1.2. VALUE
    DATA(lt_msg) = VALUE string_table( ( `perro` ) ( `gato` ) ).
    out->write( data = lt_msg name = 'lt_msg' ).

    lt_msg = VALUE #(  ).
    out->write( data = lt_msg name = 'lt_msg' ).

    DATA: BEGIN OF ls_emp_data,
            emp_name TYPE /dmo/first_name,
            BEGIN OF address,
              street TYPE /dmo/street,
              number TYPE i,
            END OF address,
          END OF ls_emp_data.

    ls_emp_data = VALUE #( emp_name = 'Claudio'
                           address = VALUE #( street = 'Calle' number = 25 ) ).

    out->write( data = ls_emp_data name = 'ls_emp_data' ).

*1.3. CORRESPONDING / BASE / MAPPING

    TYPES: BEGIN OF lty_employee,
             emp_name TYPE string,
             emp_age  TYPE i,
           END OF lty_employee.

    TYPES: BEGIN OF lty_person,
             name TYPE string,
             age  TYPE i,
           END OF lty_person.

    DATA: lt_employee TYPE TABLE OF lty_employee,
          lt_person   TYPE TABLE OF lty_person,
          lt_client   TYPE TABLE OF lty_person.

    lt_employee = VALUE #( ( emp_name = 'Leo'
                             emp_age  = 21 ) ).

    out->write( data = lt_employee name = 'lt_employee' ).

    lt_person = CORRESPONDING #( lt_employee MAPPING name = emp_name
                                                     age  = emp_age ). " copia

    out->write( data = lt_person name = 'lt_person' ).

    lt_client = VALUE #( ( name = 'Juan'
                           age  = '30' ) ).

    lt_client = CORRESPONDING #( BASE ( lt_client ) lt_person ). "Agrega lo que tiene lt_person

    out->write( data = lt_client name = 'lt_client' ).

*1.4. EXCEPT / DUPLICATES

    lt_person = CORRESPONDING #( lt_client EXCEPT age ).
    out->write( data = lt_person name = 'lt_person' ).

    DATA: lt_itab1 TYPE TABLE OF lty_person WITH EMPTY KEY,
          lt_itab2 TYPE SORTED TABLE OF lty_person WITH UNIQUE KEY name.

    lt_itab1 = VALUE #( ( name = 'Maria' age = 32 )
                        ( name = 'Rosa'  age = 33 )
                        ( name = 'Maria' age = 34 )
                        ( name = 'Marta' age = 35 ) ).

    lt_itab2 = CORRESPONDING #( lt_itab1 DISCARDING DUPLICATES ).

    out->write( data = lt_itab2 name = 'lt_itab2' ).

*1.5. NEW

    DATA lo_data TYPE REF TO i.

    lo_data = NEW #( 12345 ).
    out->write( data = lo_data name = 'lo_data' ).

    DATA(lo_data2) = NEW string( 'gato' ).
    out->write( data = lo_data2 name = 'lo_data2' ).

    DATA(lo_employee) = NEW zcl_cp08_new( iv_name = 'Erika'
                                          iv_age  = 35 ).

    out->write( lo_employee->lv_name ).
    out->write( lo_employee->lv_age ).

*1.6. CONV

    DATA: lv_int    TYPE i VALUE 123,
          lv_string TYPE string.

    lv_string = CONV string( lv_int ).
    out->write( data = lv_string name = 'lv_string' ).


    TYPES lt_type TYPE TABLE OF i WITH EMPTY KEY.

    DATA lt_itab TYPE SORTED TABLE OF i WITH NON-UNIQUE DEFAULT KEY.

    lt_itab = VALUE #( ( 1 ) ( 2 ) ( 3 ) ).

    DATA(lt_conv) = CONV lt_type( lt_itab ).
    out->write( data = lt_conv name = 'lt_conv' ).

*1.7. EXACT
    DATA: lv_int_value  TYPE i VALUE 12345345,
          lv_int2_value TYPE int2.

    TRY.
        lv_int2_value = EXACT int2( lv_int_value ).
        out->write( data = lv_int2_value name = 'lv_int2_value' ).

      CATCH cx_sy_conversion_error INTO DATA(lv_error).

        out->write( data = lv_error->get_longtext(  ) name = 'Error' ).
    ENDTRY.

    DATA: lv_text_value TYPE i VALUE '123.45',
          lv_int_value3 TYPE i.

    TRY.
        lv_int_value3 = EXACT int2( lv_text_value ).
        out->write( data = lv_int_value3 name = 'lv_int_value3' ).

      CATCH cx_sy_conversion_error INTO DATA(lv_error2).

        out->write( data = lv_error2->get_longtext(  ) name = 'Error' ).
    ENDTRY.

*1.8. REF

    DATA: lv_int_value2 TYPE i VALUE 100,
          lv_ref_int    TYPE REF TO i.

    lv_ref_int = REF #( lv_int_value2 ).

    out->write( data = lv_int_value2 name = 'Original' ).
    out->write( data = lv_ref_int->* name = 'REF' ).

    "ITAB
    DATA lt_flight TYPE TABLE OF /dmo/flight WITH EMPTY KEY.

    lt_flight = VALUE #( ( client         = 100
                           carrier_id     = 'CO'
                           connection_id  = 1101
                           currency_code  = 'COP'
                           flight_date    = cl_abap_context_info=>get_system_date(  )
                           plane_type_id  = 'AF-1234'
                           price          = 200
                           seats_max      = 200
                           seats_occupied = 50 )
                         ( client         = 100
                           carrier_id     = 'MX'
                           connection_id  = 1101
                           currency_code  = 'MXM'
                           flight_date    = cl_abap_context_info=>get_system_date(  )
                           plane_type_id  = 'MX-1234'
                           price          = 400
                           seats_max      = 100
                           seats_occupied = 100 )
                         ( client         = 100
                           carrier_id     = 'CL'
                           connection_id  = 1101
                           currency_code  = 'CLP'
                           flight_date    = cl_abap_context_info=>get_system_date(  )
                           plane_type_id  = 'CL-1234'
                           price          = 300
                           seats_max      = 120
                           seats_occupied = 80 ) ).

    DATA(lr_flight) = REF #( lt_flight[ 2 ] ).
    out->write( data = lr_flight->* name = 'lr_flight REF' ).

*    DATA(lr_flight2) = REF #( lt_flight[ 6 ] OPTIONAL ).
*    out->write( data = lr_flight2->* name = 'lr_flight2 6' ).

    "Objeto referencia
    DATA(lor_emp1) = NEW zcl_cp08_new( iv_age = 31 iv_name = 'Sol' ).
    DATA(lor_emp2) = REF #( lor_emp1 ).
    out->write( data = lor_emp2 name = 'lor_emp2' ).

*1.9. CAST
    TYPES: BEGIN OF t_struct,
             col1 TYPE i,
             col2 TYPE i,
           END OF t_struct.


    DATA lr_data TYPE REF TO data.

    DATA ls_int TYPE t_struct.

    lr_data = NEW t_struct(  ).
    ls_int-col1 = CAST t_struct( lr_data )->col1.
    ls_int-col2 = CAST t_struct( lr_data )->col2.

    out->write( data = ls_int name = 'ls_int' ).
    out->write( data = ls_int-col1 name = 'ls_int->col1' ).
    out->write( data = ls_int-col2 name = 'ls_int->col2' ).

*1.10. FILTER

    DATA: lt_flight_all TYPE STANDARD TABLE OF /dmo/flight,
          lt_flight_fin TYPE STANDARD TABLE OF /dmo/flight,
          lt_filter     TYPE SORTED TABLE OF /dmo/carrier_id WITH UNIQUE KEY table_line.

    SELECT FROM /dmo/flight
        FIELDS *
        INTO TABLE @lt_flight_all.


    lt_filter = VALUE #( ( 'LH ' ) ( 'AA ' ) ( 'UA ' ) ).

    lt_flight_fin = FILTER #( lt_flight_all IN lt_filter
                                WHERE carrier_id = table_line ).

    out->write( data = lt_flight_fin name = 'lt_flight_fin' ).

*2.1. Concepto y Declaración

    DATA gv_employee TYPE string.

    "FIELD-SYMBOLS <gfs_employee>  TYPE string.
    "FIELD-SYMBOLS <gfs_employee2> TYPE zemploy_table.

    ASSIGN gv_employee TO FIELD-SYMBOL(<gfs_employee>).

    <gfs_employee> = 'Maria'.

    out->write( data = gv_employee name = 'gv_employee' ).

    SELECT FROM zemploy_table
        FIELDS *
        INTO TABLE @DATA(gt_employee).

    LOOP AT gt_employee INTO DATA(gs_employee).
      gs_employee-email = 'CPIZARRO@GMAIL.COM'.
    ENDLOOP.

    out->write( data = gt_employee name = 'gt_employee ESTRC' ).

    LOOP AT gt_employee ASSIGNING FIELD-SYMBOL(<gfs_employee2>).
      <gfs_employee2>-email = 'PERRO@GMAIL.COM'.
    ENDLOOP.

    out->write( data = gt_employee name = '<gt_employee2> FS' ).

*2.2. Declaración en línea

    DATA gt_employee_for TYPE STANDARD TABLE OF zemploy_table.

    gt_employee_for = VALUE #( FOR <gfs_employee3> IN gt_employee
                             ( CORRESPONDING #( <gfs_employee3> ) ) ).

    out->write( data = gt_employee_for name = 'gt_employee_for' ).

*2.3. Añadir registros

    APPEND INITIAL LINE TO gt_employee ASSIGNING FIELD-SYMBOL(<lfs_employee_apd>).

    <lfs_employee_apd> = VALUE #( mandt         = sy-mandt
                                  id            = 105
                                  first_name    = 'Daniela'
                                  last_name     = 'Castro'
                                  email         = 'dcastro@gmail.com'
                                  phone_number  = 3344321
                                  salary        = 180
                                  currency_code = 'EUR' ).

    out->write( data = <lfs_employee_apd> name = 'gt_employee apd' ).

*2.4. Insertar registro

    INSERT INITIAL LINE INTO gt_employee ASSIGNING FIELD-SYMBOL(<lfs_employee_ins>) INDEX 2.

    <lfs_employee_ins> = VALUE #( mandt         = sy-mandt
                                  id            = 106
                                  first_name    = 'Sofia'
                                  last_name     = 'Matinez'
                                  email         = 'sofiam@gmail.com'
                                  phone_number  = 1234
                                  salary        = 240
                                  currency_code = 'CLP' ).

    out->write( data = gt_employee name = 'gt_employee ins' ).

*2.5. Leer registro

    READ TABLE gt_employee ASSIGNING FIELD-SYMBOL(<lfs_employee_rd>) WITH KEY first_name = 'Claudio'.

    <lfs_employee_rd>-last_name = 'Palacio'.
    <lfs_employee_rd>-email     = 'cpalacio@gmail.com'.

    out->write( data = gt_employee name = 'gt_employee RD' ).

*2.6. Coerción – Casteo

    TYPES: BEGIN OF gty_date,
            year(4)  TYPE n,
            month(2) TYPE n,
            day(2)   TYPE n,
           END OF gty_date.

    FIELD-SYMBOLS: <lfs_date>  TYPE gty_date,
                   <lfs_date2> TYPE any,
                   <lfs_date3> TYPE n.

    DATA(lv_date) = cl_abap_context_info=>get_system_date(  ).

    ASSIGN lv_date TO <lfs_date> CASTING.

    out->write( <lfs_date>-year ).
    out->write( <lfs_date>-month ).
    out->write( <lfs_date>-day ).


    ASSIGN lv_date TO <lfs_date2> CASTING TYPE gty_date.

    DO.
        ASSIGN COMPONENT sy-index OF STRUCTURE <lfs_date2> TO <lfs_date3>.

        IF sy-subrc <> 0.
            EXIT.
        ENDIF.

        out->write( <lfs_date3> ).

    ENDDO.


  ENDMETHOD.

ENDCLASS.
