CLASS zcl_work_ord_crud_handler_426 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .
  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
    METHODS:
      create_work_order IMPORTING iv_customer_id   TYPE string
                                  iv_technician_id TYPE string
                                  iv_priority      TYPE string
                        RETURNING VALUE(rv_create) TYPE abap_bool,
      read_work_order,
      update_work_order IMPORTING iv_work_order_id TYPE string
                                  iv_status        TYPE string
                        RETURNING VALUE(rv_update) TYPE abap_bool,
      delete_work_order IMPORTING iv_work_order_id TYPE string
                                  iv_status        TYPE string
                        RETURNING VALUE(rv_delete) TYPE abap_bool.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_work_ord_crud_handler_426 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

    DATA(lv_customer) = update_work_order( iv_work_order_id = '0000112236' iv_status = 'PE' ).
    out->write( |Estado: { lv_customer }| ).

  ENDMETHOD.

  METHOD create_work_order.

*    DATA instancia_zclase TYPE REF TO zcl_work_order_validator_426.
*
*    instancia_zclase = NEW zcl_work_order_validator_426( ).
*
*    DATA(lv_exists) = instancia_zclase->validate_create_order( iv_customer_id   = '00000002'
*                                                               iv_technician_id = '90010019'
*                                                               iv_priority      = 'B' ).
*
*    IF lv_exists EQ abap_true.
*      TRY.
*          INSERT ztwork_order_426 FROM TABLE @( VALUE #( ( work_order_id = '112240'
*                                                           customer_id   = iv_customer_id
*                                                           technician_id = iv_technician_id
*                                                           creation_date = '20250102'
*                                                           status        = 'CO'
*                                                           priority      = iv_priority
*                                                           description   = 'que pasa perro' ) ) ).
*        CATCH cx_sy_open_sql_db INTO DATA(lv_sql_db).
*          rv_create = abap_false.
*          RETURN.
*      ENDTRY.
*    ELSE.
*      rv_create = abap_false.
*    ENDIF.

  ENDMETHOD.

  METHOD delete_work_order.

*    DATA instancia_zclase TYPE REF TO zcl_work_order_validator_426.
*
*    instancia_zclase = NEW zcl_work_order_validator_426( ).
*
*    DATA(lv_exists) = instancia_zclase->validate_delete_order( iv_work_order_id   = '0000112240'
*                                                               iv_status          = 'CO' ).
*
*    IF lv_exists EQ abap_true.
*      TRY.
*          delete from ztwork_order_426 where work_order_id =  @iv_work_order_id
*                                         and status NE 'PE'.
*
*        CATCH cx_sy_open_sql_db INTO DATA(lv_sql_db).
*          rv_delete = abap_false.
*          RETURN.
*      ENDTRY.
*    ELSE.
*      rv_delete = abap_false.
*    ENDIF.

  ENDMETHOD.

  METHOD read_work_order.

  ENDMETHOD.

  METHOD update_work_order.

    DATA instancia_zclase TYPE REF TO zcl_work_order_validator_426.

    instancia_zclase = NEW zcl_work_order_validator_426( ).

    DATA(lv_exists) = instancia_zclase->validate_update_order( iv_work_order_id   = '0000112236'
                                                               iv_status          = 'PE' ).

    IF lv_exists EQ abap_true.
      TRY.
          DATA(lo_lock_obj) = cl_abap_lock_object_factory=>get_instance(
           EXPORTING
              iv_name = 'EZWO_426' ).

        CATCH cx_abap_lock_failure.
          rv_update = abap_false.
          RETURN.
      ENDTRY.

      DATA lt_parameter TYPE  if_abap_lock_object=>tt_parameter.

      lt_parameter = VALUE #( ( name  = 'CLIENT'
                                value = REF #( '100' ) )

                              ( name  = 'WORK_ORDER_ID'
                                value = REF #( iv_work_order_id ) ) ).

      TRY.
          lo_lock_obj->enqueue( it_parameter  = lt_parameter ).

        CATCH cx_abap_foreign_lock cx_abap_lock_failure.
          rv_update = abap_false.
          RETURN.
      ENDTRY.


      TRY.
          UPDATE ztwork_order_426 SET
            status      = 'CO',
            priority    = 'A',
            description = 'Nuevo gato'
          WHERE work_order_id =  @iv_work_order_id.

        CATCH cx_sy_open_sql_db INTO DATA(lv_sql_db).
          rv_update = abap_false.
          RETURN.
      ENDTRY.

      TRY.
          lo_lock_obj->dequeue( it_parameter = lt_parameter ).

        CATCH cx_abap_lock_failure.
          rv_update = abap_false.
          RETURN.
      ENDTRY.

    ELSE.
      rv_update = abap_false.
    ENDIF.

    rv_update = abap_true.

  ENDMETHOD.

ENDCLASS.
