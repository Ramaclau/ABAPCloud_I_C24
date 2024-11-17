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



CLASS ZCL_CP12_TABLA_BBDD IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

*2.3. Inserción de datos

    GET TIME STAMP FIELD DATA(lv_timestamp_begin).

    DELETE FROM zinvoice_957.
    DO 10000 TIMES.
      MODIFY zinvoice_957 FROM TABLE @( VALUE #( ( invoice_id = sy-index
                                                   comp       = '1010'
                                                   customer   = 'Coca.Cola'
                                                   status     =  c_payed
                                                   create_by  = cl_abap_context_info=>get_user_technical_name( )
                                                   amount     = '2000'
                                                   currency_key = 'USD' )

                                                 ( invoice_id = sy-index
                                                   comp       = '1020'
                                                   customer   = 'pepsi'
                                                   status     =  c_overdue
                                                   create_by  = cl_abap_context_info=>get_user_technical_name( )
                                                   amount     = '2500'
                                                   currency_key = 'USD' )

                                                 ( invoice_id = sy-index
                                                   comp       = '1030'
                                                   customer   = 'Nestle'
                                                   status     =  c_posted
                                                   create_by  = cl_abap_context_info=>get_user_technical_name( )
                                                   amount     = '3000'
                                                   currency_key = 'EUR' )

                                                 ( invoice_id = sy-index
                                                   comp       = '1040'
                                                   customer   = 'Bils'
                                                   status     =  c_payed
                                                   create_by  = cl_abap_context_info=>get_user_technical_name( )
                                                   amount     = '3500'
                                                   currency_key = 'EUR' )

                                                ( invoice_id = sy-index
                                                   comp       = '1050'
                                                   customer   = 'Pringles'
                                                   status     =  c_payed
                                                   create_by  = 'CB9999999993'
                                                   amount     = '4000'
                                                   currency_key = 'EUR' ) ) ).
    ENDDO.

    GET TIME STAMP FIELD DATA(lv_timestamp_end).

    DATA(lv_dif_second) = cl_abap_tstmp=>subtract( EXPORTING
        tstmp1 = lv_timestamp_end
        tstmp2 = lv_timestamp_begin ).

    out->write( |Total execution time: { lv_dif_second }| ).

*    IF sy-subrc = 0.
*      out->write( |{ sy-dbcnt } rows affected| ).
*    ENDIF.


  ENDMETHOD.
ENDCLASS.
