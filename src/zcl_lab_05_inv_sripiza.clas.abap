CLASS zcl_lab_05_inv_sripiza DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_LAB_05_INV_SRIPIZA IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA: mv_exercise     TYPE n LENGTH 4,
          mv_invoice_no   TYPE n LENGTH 8,
          mv_invoice_code TYPE string.
*1)
    mv_exercise     = '1234'.
    mv_invoice_no   = '12345678'.
    mv_invoice_code = mv_exercise && '/' && ' ' && mv_invoice_no.
    out->write( mv_invoice_code ).

*2)
    SELECT FROM zemp_logali
        FIELDS id
        INTO TABLE @DATA(lt_employee).

    DATA(lv_str_employee) = concat_lines_of( table = lt_employee sep = ` ` ).
    out->write( lv_str_employee ).

*3)
    DATA: MV_CASE1 TYPE string,
          MV_CASE2 TYPE string.

    MV_CASE1 = 'Sales invoice with    status in process'.
    CONDENSE MV_CASE1.
    out->write( MV_CASE1 ).

    MV_CASE2 = '***ABAP*Cloud***'.
    MV_CASE2 = condense( val = MV_CASE2 del = '*' ).
    out->write( MV_CASE2 ).

*4)
    DATA: MV_DATA        TYPE string VALUE '0001111111;LOGALIGROUP;2024'.

     SPLIT MV_DATA AT ';' INTO  DATA(MV_ID_CUSTOMER)
                                DATA(MV_CUSTOMER)
                                DATA(MV_YEAR).
     out->write( MV_ID_CUSTOMER ).
     out->write( MV_CUSTOMER ).
     out->write( MV_YEAR ).

*5)
    DATA MV_INVOICE_NUM TYPE string VALUE '2015ABCD'.

    SHIFT MV_INVOICE_NUM RIGHT DELETING TRAILING 'CD'.
    SHIFT MV_INVOICE_NUM LEFT DELETING LEADING  '20'.
    out->write( MV_INVOICE_NUM ).

*6)
    DATA(MV_RESPONSE) = ' Generating Invoice '.
    DATA(MV_COUNT)    = strlen( MV_RESPONSE ).
    out->write( MV_COUNT ).

    MV_COUNT = numofchar( MV_RESPONSE ).
    out->write( MV_COUNT ).


*7)
    DATA MV_TRANSLATE_INVOICE TYPE string VALUE 'Report the issuance of this invoice'.

    TRANSLATE MV_TRANSLATE_INVOICE to UPPER CASE.
    out->write( MV_TRANSLATE_INVOICE ).

    TRANSLATE MV_TRANSLATE_INVOICE to LOWER CASE.
    out->write( MV_TRANSLATE_INVOICE ).

*8)
    MV_TRANSLATE_INVOICE = insert( val = MV_TRANSLATE_INVOICE sub = ' to client ' off = 34 ).
    out->write( MV_TRANSLATE_INVOICE ).
















  ENDMETHOD.
ENDCLASS.
