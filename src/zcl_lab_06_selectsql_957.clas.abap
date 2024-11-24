CLASS zcl_lab_06_selectsql_957 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_lab_06_selectsql_957 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

*    select SINGLE from zproducts_957
*        FIELDS *
*        where product_id = '50'
*        into @data(ls_products)
*        BYPASSING BUFFER.
*
*     if sy-subrc = 0.
*        out->write( ls_products-product_name ).
*     ENDIF.

*    DATA lt_products TYPE STANDARD TABLE OF zproducts_957.
*
*    SELECT FROM zproducts_957
*        FIELDS *
*        WHERE category_id = '10'
*        INTO TABLE @lt_products.
*
*    IF sy-subrc = 0.
*      out->write( lt_products ).
*
*      SELECT FROM zproducts_957
*          FIELDS *
*          WHERE category_id = '2'
*          APPENDING TABLE @lt_products.
*
*      out->write( lt_products ).
*
*    ENDIF.

*    TYPES: BEGIN OF ly_products,
*             product_id   TYPE int8,
*             product_name TYPE c LENGTH 40,
*             category_id  TYPE int8,
*             END OF ly_products.
*
*    DATA lt_prod TYPE STANDARD TABLE OF ly_products.
*
*    select from zproducts_957
*        FIELDS *
*        where category_id = '10'
*        into CORRESPONDING FIELDS OF table @lt_prod.
*
*    if sy-subrc = 0.
*        out->write( lt_prod ).
*    ENDIF.

*    select from zproducts_957
*        FIELDS *
*        where category_id = '1212'
*        into table @data(lt_prod)
*        UP TO 3 ROWS.
*
*    if sy-subrc = 0.
*        out->write( lt_prod ).
*    ENDIF.

*    DATA lt_prod TYPE STANDARD TABLE OF zproducts_957.
*
*    SELECT FROM zproducts_957
*        FIELDS *
*        WHERE price > '100'
*        INTO @DATA(ls_prod).
*
*      APPEND ls_prod TO lt_prod.
*
*    ENDSELECT.
*
*    IF sy-subrc = 0.
*      out->write( lt_prod ).
*    ENDIF.

    SELECT FROM zproducts_957
        FIELDS *
        INTO TABLE @DATA(lt_prod)
        PACKAGE SIZE 2.

      IF sy-subrc = 0.
        LOOP AT lt_prod ASSIGNING FIELD-SYMBOL(<fs_prod>).
          out->write( <fs_prod> ).
        ENDLOOP.

        out->write( cl_abap_char_utilities=>newline ).

      ENDIF.

      ENDSELECT.






    ENDMETHOD.
ENDCLASS.
