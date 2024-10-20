CLASS zcl_lab_07_tables_sripizarro DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_lab_07_tables_sripizarro IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

*1. Añadir registros
    DATA: lt_employee TYPE STANDARD TABLE OF zemp_logali,
          ls_employee TYPE zemp_logali.

    ls_employee-Id     = 0001.
    ls_employee-email  = 'cpizarro@gmail.com'.
    ls_employee-ape1   = 'martinez'.
    ls_employee-ape2   = 'Lorca'.
    ls_employee-name   = 'Carlos'.
    ls_employee-fechan = '20241020'.
    ls_employee-fechaa = '20241020'.

    APPEND ls_employee TO lt_employee.
*    out->write( data = lt_employee name = 'lt_employee' ).

    APPEND VALUE #( Id     = 0002
                    email  = 'pepe@gmail.com'
                    ape1   = 'Garcia'
                    ape2   = 'Nero'
                    name   = 'Pepe'
                    fechan = '20241020'
                    fechaa = '20241020' ) TO lt_employee.

*    out->write( data = lt_employee name = 'lt_employees' ).

*2. Insertar registros (INSERT)

    INSERT VALUE #( Id     = 0003
                   email  = 'mario@gmail.com'
                   ape1   = 'Lopez'
                   ape2   = 'Martel'
                   name   = 'Mario'
                   fechan = '20241020'
                   fechaa = '20241020' ) INTO TABLE lt_employee.

*    out->write( data = lt_employee name = 'lt_employees' ).

*3. Añadir registros con APPEND

    DATA lt_employee_2 LIKE lt_employee.

    ls_employee-Id     = 0004.
    ls_employee-email  = 'migel@gmail.com'.
    ls_employee-ape1   = 'Caro'.
    ls_employee-ape2   = 'Abarca'.
    ls_employee-name   = 'Miguel'.
    ls_employee-fechan = '20241020'.
    ls_employee-fechaa = '20241020'.

    APPEND ls_employee TO lt_employee_2.

*    out->write( data = lt_employee_2 name = 'lt_employees_2' ).

    APPEND VALUE #( Id     = 0005
                    email  = 'ramiro@gmail.com'
                    ape1   = 'Perez'
                    ape2   = 'Romero'
                    name   = 'Ramiro'
                    fechan = '20241020'
                    fechaa = '20241020' ) TO lt_employee_2.

*    out->write( data = lt_employee_2 name = 'lt_employees_2' ).

*    APPEND LINES OF lt_employee FROM 2 TO 3 TO lt_employee_2.

*    out->write( data = lt_employee_2 name = 'lt_employees_2' ).

*4. CORRESPONDING

    DATA: lt_spfli TYPE STANDARD TABLE OF /dmo/flight,
          ls_spfli, ls_spfli2 TYPE /dmo/flight.

    SELECT FROM /dmo/flight
        FIELDS *
        WHERE carrier_id = 'LH'
        INTO TABLE @DATA(gt_spfli).

    MOVE-CORRESPONDING gt_spfli TO lt_spfli.

    out->write( data = lt_spfli name = 'lt_spfli' ).

*5. READ TABLE con índice

        READ TABLE lt_spfli INTO DATA(ls_spfli3) INDEX 1.
        out->write( data = ls_spfli3 name = 'ls_spfli3' ).

*6. READ TABLE con clave

    READ TABLE lt_spfli INTO DATA(ls_flight4) WITH KEY carrier_id = 'FRA'.
    out->write( data = ls_flight4 name = 'ls_flight4' ).

*7. Chequeo de registros

    DATA: lt_spfli2 TYPE STANDARD TABLE OF /dmo/flight.

    SELECT FROM /dmo/flight
     FIELDS *
     WHERE connection_id >= '0400'
     INTO TABLE @lt_spfli2.

    out->write( data = lt_spfli2 name = 'lt_spfli2' ).

    IF sy-subrc = 0.
      IF line_exists( lt_spfli2[ connection_id = '0407' ] ).
        out->write( 'Vuelo existe.' ).
      ELSE.
        out->write( 'Vuelo No existe.' ).
      ENDIF.
    ENDIF.

*8. Índice de un registro

    DATA(lv_num) = lines( lt_spfli2 ).
    out->write( data = lv_num name = 'lv_num' ).

*9. Sentencia LOOP

    LOOP AT lt_spfli2 INTO DATA(ls_spfli4) WHERE seats_max = 330.

      out->write( data = ls_spfli4 name = 'ls_spfli4' ).

    ENDLOOP.





  ENDMETHOD.

ENDCLASS.
