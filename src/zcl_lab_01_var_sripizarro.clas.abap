CLASS zcl_lab_01_var_sripizarro DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_LAB_01_VAR_SRIPIZARRO IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA: lv_MV_PURCHASE_DATE TYPE d,
          lv_MV_PURCHASE_TIME TYPE c.

    lv_MV_PURCHASE_DATE = cl_abap_context_info=>get_system_date(  ).
    lv_MV_PURCHASE_TIME = cl_abap_context_info=>get_system_time(  ).

    out->write( lv_MV_PURCHASE_DATE ).
    out->write( lv_MV_PURCHASE_TIME ).

    DATA lv_MV_PRICE    TYPE f VALUE '10.5'.

    DATA: lv_MV_TAX      TYPE i VALUE 16,
          lv_MV_INCREASE TYPE c LENGTH 10 VALUE 'PC',
          lv_MV_SHIPPING TYPE p LENGTH 8 DECIMALS 2,
          lv_MV_ID_CODE  TYPE n LENGTH 4 VALUE '1110',
          lv_MV_QR_CODE  TYPE x LENGTH 5 VALUE 'F5CF'.


    TYPES: BEGIN OF lty_MTY_CUSTOMER,
             id       TYPE i,
             customer TYPE c LENGTH 15,
             age      TYPE i,
           END OF lty_MTY_CUSTOMER.


    DATA ls_customer TYPE lty_MTY_CUSTOMER.

    ls_customer = VALUE #( id       = 123
                           customer = 'CUSTOMER'
                           age      = 125 ).

    out->write( | ID: { ls_customer-id } CUSTOMER: { ls_customer-customer } AGE: { ls_customer-age } | ).


    DATA lvr_employee TYPE /dmo/employee_hr.

*    DATA MS_EMPLOYEES TYPE lvr_employee.

    DATA: MV_PRODUCT  TYPE string  VALUE 'Laptop',
          MV_BAR_CODE TYPE xstring VALUE '12121 121211'.

    DATA(LV_PRODUCT)  = MV_PRODUCT.
    DATA(LV_BAR_CODE) = MV_BAR_CODE.



  ENDMETHOD.
ENDCLASS.
