CLASS zcl_cp12_tabla_bbdd DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

    CONSTANTS: c_payed     TYPE c LENGTH 1 VALUE 'P',
               c_unpayed   TYPE c LENGTH 1 VALUE 'U',
               c_overdue   TYPE c LENGTH 1 VALUE 'O',
               c_cancelled TYPE c LENGTH 1 VALUE 'C',
               c_posted    TYPE c LENGTH 1 VALUE 'X'.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_cp12_tabla_bbdd IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

*2.3. Inserción de datos

*  delete from zinvoice_957.
  MODIFY zinvoice_957_d from table @( value #( ( invoice_id = '1'
                                               comp       = '1010'
                                               customer   = 'Coca.Cola'
                                               status     =  c_payed
                                               create_by  = cl_abap_context_info=>get_user_technical_name( ) )

                                             ( invoice_id = '2'
                                               comp       = '1020'
                                               customer   = 'pepsi'
                                               status     =  c_overdue
                                               create_by  = cl_abap_context_info=>get_user_technical_name( ) )

                                             ( invoice_id = '3'
                                               comp       = '1030'
                                               customer   = 'Nestle'
                                               status     =  c_posted
                                               create_by  = cl_abap_context_info=>get_user_technical_name( ) )

                                             ( invoice_id = '4'
                                               comp       = '1040'
                                               customer   = 'Bils'
                                               status     =  c_payed
                                               create_by  = cl_abap_context_info=>get_user_technical_name( ) )

                                            ( invoice_id = '5'
                                               comp       = '1050'
                                               customer   = 'Pringles'
                                               status     =  c_payed
                                               create_by  = 'CB9999999993' ) ) ).

    IF sy-subrc = 0.
        out->write( |{ sy-dbcnt } rows affected| ).
    ENDIF.


 ENDMETHOD.

ENDCLASS.
