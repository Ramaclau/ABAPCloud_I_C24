CLASS zcl_lab_lock_obj_univ_957 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_lab_lock_obj_univ_957 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

    out->write( |User has startted the business process| ).

    TRY.
        DATA(lo_lock_obj) = cl_abap_lock_object_factory=>get_instance(
         EXPORTING
            iv_name = 'EZ_UNIV_LOCK_957' ).

      CATCH cx_abap_lock_failure.
        out->write( |Lock Object Instance not created| ).
    ENDTRY.

    DATA lt_parameter TYPE  if_abap_lock_object=>tt_parameter.

    lt_parameter = VALUE #( ( name  = 'CLIENT'
                              value = REF #( '100' ) )

                            ( name  = 'SOC'
                              value = REF #( '3700' ) ) ).

    TRY.
        lo_lock_obj->enqueue( it_parameter  = lt_parameter ).

      CATCH cx_abap_foreign_lock cx_abap_lock_failure.
        out->write( |Not Possiblle to write on the database. Object is locked| ).
        RETURN.
    ENDTRY.

    out->write( |Lock Object is active| ).

    DATA ls_university TYPE zuniversity_957.

    ls_university = VALUE #( client       = '100'
                          soc             = '3700'
                          exercise        = '1020'
                          course_price    = '2300'
                          currency        = 'USD'
                          courses         = '123'
                          unit            = '1 '
                          inf-course_code = '700'
                          inf-first_name  = 'Sofia'
                          inf-last_name   = 'Perez'
                          inf-student_id  = '957' ).

    wait up to 10 seconds.

    MODIFY zuniversity_957 FROM @ls_university.

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
