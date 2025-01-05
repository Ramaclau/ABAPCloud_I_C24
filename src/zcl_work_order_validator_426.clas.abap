CLASS zcl_work_order_validator_426 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS:
      validate_create_order IMPORTING iv_customer_id   TYPE string
                                      iv_technician_id TYPE string
                                      iv_priority      TYPE string
                            RETURNING VALUE(rv_valid)  TYPE abap_bool,
      validate_update_order IMPORTING iv_work_order_id TYPE string
                                      iv_status        TYPE string
                            RETURNING VALUE(rv_valid)  TYPE abap_bool,
      validate_delete_order IMPORTING iv_work_order_id TYPE string
                                      iv_status        TYPE string
                            RETURNING VALUE(rv_valid)  TYPE abap_bool,
      validate_status_and_priority IMPORTING iv_status       TYPE string
                                             iv_priority     TYPE string
                                   RETURNING VALUE(rv_valid) TYPE abap_bool.

  PRIVATE SECTION.
    CONSTANTS: c_valid_status   TYPE string VALUE 'PE CO', " Example statuses: Pending, Completed
               c_valid_priority TYPE string VALUE 'A B'. " Example priorities: High, Low

    METHODS:
      check_customer_exists IMPORTING iv_customer_id   TYPE string
                            RETURNING VALUE(rv_exists) TYPE abap_bool,
      check_technician_exists IMPORTING iv_technician_id TYPE string
                              RETURNING VALUE(rv_exists) TYPE abap_bool,
      check_order_exists IMPORTING iv_work_order_id TYPE string
                         RETURNING VALUE(rv_exists) TYPE abap_bool,
      check_order_history IMPORTING iv_work_order_id TYPE string
                          RETURNING VALUE(rv_exists) TYPE abap_bool.

ENDCLASS.

CLASS zcl_work_order_validator_426 IMPLEMENTATION.
*
  METHOD validate_create_order.
    " Check if customer exists
    DATA(lv_customer_exists) = check_customer_exists( iv_customer_id ).
    IF lv_customer_exists = abap_false. " IS INITIAL.
      rv_valid = abap_false.
      RETURN.
    ENDIF.

    " Check if technician exists
    DATA(lv_technician_exists) = check_technician_exists( iv_technician_id ).
    IF lv_technician_exists = abap_false. " IS INITIAL.
      rv_valid = abap_false.
      RETURN.
    ENDIF.

    " Check if priority is valid
    IF iv_priority eq 'A' or iv_priority eq 'B'. "c_valid_priority.
      rv_valid = abap_true.
      RETURN.
    ENDIF.

    rv_valid = abap_false.
  ENDMETHOD.

  METHOD validate_update_order.
    " Check if the work order exists
    DATA(lv_order_exists) = check_order_exists( iv_work_order_id ).
    IF lv_order_exists EQ abap_false.
      rv_valid = abap_false.
      RETURN.
    ENDIF.

    " Check if the order status is editable (e.g., Pending)
    IF iv_status NE 'PE'. "NOT IN c_valid_status.
      rv_valid = abap_false.
      RETURN.
    ENDIF.

    rv_valid = abap_true.
  ENDMETHOD.
*
  METHOD validate_delete_order.
    " Check if the order exists
    DATA(lv_order_exists) = check_order_exists( iv_work_order_id ).
    IF lv_order_exists EQ abap_false.
      rv_valid = abap_false.
      RETURN.
    ENDIF.

    " Check if the order status is "PE" (Pending)
    IF iv_status EQ 'PE'.
      rv_valid = abap_false.
      RETURN.
    ENDIF.

    " Check if the order has a history (i.e., if it has been modified before)
    DATA(lv_has_history) = check_order_history( iv_work_order_id ).
    IF lv_has_history EQ abap_false.
      rv_valid = abap_false.
      RETURN.
    ENDIF.

    rv_valid = abap_true.
  ENDMETHOD.
*
  METHOD validate_status_and_priority.
    " Validate the status value
    IF iv_status ne 'PE' or iv_status ne 'CO'. "NOT IN c_valid_status.
      rv_valid = abap_false.
      RETURN.
    ENDIF.

    " Validate the priority value
    IF iv_priority ne 'A' or iv_priority ne 'B'. " NOT IN c_valid_priority.
      rv_valid = abap_false.
      RETURN.
    ENDIF.

    rv_valid = abap_true.
  ENDMETHOD.

  METHOD check_customer_exists.

    SELECT SINGLE from ztcustomer_426
        FIELDS *
        where customer_id eq @iv_customer_id
        into @data(ls_customer).

    if sy-subrc eq 0.
      rv_exists = abap_true.
      RETURN.
    else.
       rv_exists = abap_false.
       RETURN.
    ENDIF.

    rv_exists = abap_false.

  ENDMETHOD.

  METHOD check_technician_exists.

    SELECT SINGLE from zttechnician_426
        FIELDS *
        where technician_id eq @iv_technician_id
        into @data(ls_tech).

    if sy-subrc eq 0.
      rv_exists = abap_true.
      RETURN.
    else.
       rv_exists = abap_false.
       RETURN.
    ENDIF.

    rv_exists = abap_false.

  ENDMETHOD.

  METHOD check_order_exists.

    SELECT SINGLE from ztwork_order_426
        FIELDS *
        where work_order_id eq @iv_work_order_id
        into @data(ls_order).

    if sy-subrc eq 0.
      rv_exists = abap_true.
      RETURN.
    else.
       rv_exists = abap_false.
       RETURN.
    ENDIF.

    rv_exists = abap_false.

  ENDMETHOD.

  METHOD check_order_history.

    SELECT SINGLE from ztworkord_hi_426
        FIELDS *
        where work_order_id eq @iv_work_order_id
        into @data(ls_order_his).

    if sy-subrc eq 0.
      rv_exists = abap_true.
      RETURN.
    else.
       rv_exists = abap_false.
       RETURN.
    ENDIF.

    rv_exists = abap_false.

  ENDMETHOD.


ENDCLASS.
