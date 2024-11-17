CLASS zcl_cp12_lock_obj DEFINITION
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



CLASS ZCL_CP12_LOCK_OBJ IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    out->write( |User has startted the business process| ).

    TRY.
        DATA(lo_lock_obj) = cl_abap_lock_object_factory=>get_instance(
         EXPORTING
            iv_name = 'EZINV_957' ).

      CATCH cx_abap_lock_failure.
        out->write( |Lock Object Instance not created| ).
    ENDTRY.

    DATA lt_parameter TYPE  if_abap_lock_object=>tt_parameter.

    lt_parameter = VALUE #( ( name  = 'INVOICE_ID'
                              value = REF #( '1' ) )

                            ( name  = 'COMP'
                              value = REF #( '1010' ) ) ).

    TRY.
        lo_lock_obj->enqueue( it_parameter  = lt_parameter ).

      CATCH cx_abap_foreign_lock cx_abap_lock_failure.
        out->write( |Not Possiblle to write on the database. Object is locked| ).
        RETURN.
    ENDTRY.

    out->write( |Lock Object is active| ).

    DATA ls_invoice TYPE zinvoice_957.

    ls_invoice = VALUE #( invoice_id   = '1'
                          comp         = '1010'
                          customer     = 'Coca.Cola'
                          status       = c_payed
                          create_by    = cl_abap_context_info=>get_user_technical_name( )
                          amount       = '2500'
                          currency_key = 'USD ' ).

    wait up to 10 seconds.

    MODIFY zinvoice_957 FROM @ls_invoice.

    IF sy-subrc = 0.
      out->write( |Bussines Object was update on the BBDD| ).
    ENDIF.

    TRY.
        lo_lock_obj->dequeue( it_parameter = lt_parameter ).

      CATCH cx_abap_lock_failure.
        out->write( |Lock Object was NOT released| ).
    ENDTRY.

    out->write( |Lock Object was released| ).


  ENDMETHOD.
ENDCLASS.
