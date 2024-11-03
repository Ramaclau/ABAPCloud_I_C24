CLASS zcl_cp00_ins_zemploy_table DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_cp00_ins_zemploy_table IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    DATA: lt_employee TYPE TABLE OF zemploy_table,  " Tabla interna con tipo de la entidad
          ls_employee TYPE zemploy_table.           " Estructura para un registro

* Asignación de datos

*    ls_employee-mandt         = 100.
*    ls_employee-id            = 102.
*    ls_employee-first_name    = 'Maria'.
*    ls_employee-last_name     = 'Jota'.
*    ls_employee-email         = 'mariaj@gmail.com'.
*    ls_employee-currency_code = '123456'.
*    ls_employee-salary        = 100.
*    ls_employee-currency_code = 'USD'.

    ls_employee-mandt         = 100.
    ls_employee-id            = sy-index + 1.
    ls_employee-first_name    = 'Rosa'.
    ls_employee-last_name     = 'Erre'.
    ls_employee-email         = 'rosar@gmail.com'.
    ls_employee-currency_code = '123456'.
    ls_employee-salary        = 110.
    ls_employee-currency_code = 'USD'.

    out->write( data = ls_employee name = 'ls_employee' ).

    TRY.
        APPEND ls_employee TO lt_employee.
        INSERT zemploy_table FROM TABLE @lt_employee.

        out->write( data = lt_employee name = 'lt_employee' ).

      CATCH cx_sy_open_sql_db INTO DATA(lv_error).
        out->write( data = lv_error name = 'ERROR' ).
    ENDTRY.

  ENDMETHOD.
ENDCLASS.
