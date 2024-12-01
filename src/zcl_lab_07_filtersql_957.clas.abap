CLASS zcl_lab_07_filtersql_957 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun .

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_lab_07_filtersql_957 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    data lt_products type STANDARD TABLE OF zproducts_957.

*    SELECT FROM zproducts_957
*        FIELDS *
*        WHERE price GE 100
*        INTO TABLE @lt_products.
*
*    IF sy-subrc = 0.
*      out->write( lt_products ).
*    ELSE.
*      out->write( |No data| ).
*    ENDIF.
*
*    SELECT FROM zproducts_957
*        FIELDS *
*        WHERE price BETWEEN 200 and 1000
*        INTO TABLE @lt_products.
*
*    IF sy-subrc = 0.
*      out->write( lt_products ).
*    ELSE.
*      out->write( |No data| ).
*    ENDIF.
*
*    SELECT FROM zproducts_957
*        FIELDS *
*        WHERE product_name LIKE '%S%'
*        INTO TABLE @lt_products.
*
*    IF sy-subrc = 0.
*      out->write( lt_products ).
*    ELSE.
*      out->write( |No data| ).
*    ENDIF.
*
**codigo para update con _
**    SELECT FROM zproducts_957
**        FIELDS *
**        WHERE  price BETWEEN 200 and 1000
**        INTO TABLE @lt_products.
**
**    if sy-subrc = 0.
**
**        loop at lt_products ASSIGNING FIELD-SYMBOL(<ls_product>).
**            <ls_product>-product_name = |_{ <ls_product>-product_name }|.
**        ENDLOOP.
**
**        update zproducts_957 from table @lt_products.
**
**    ENDIF.
************************
*
*    CONSTANTS cv_escape TYPE c LENGTH 1 VALUE '#'.
*
*    SELECT FROM zproducts_957
*        FIELDS *
*        WHERE product_name LIKE '%#_%' ESCAPE @cv_escape
*        INTO TABLE @lt_products.
*
*    IF sy-subrc = 0.
*      out->write( lt_products ).
*    ELSE.
*      out->write( |No data escape| ).
*    ENDIF.
*
*    SELECT FROM zproducts_957
*        FIELDS product_name, product_id
*        WHERE product_name LIKE '%#_%' ESCAPE @cv_escape
*        INTO TABLE @lt_products.
*
*    IF sy-subrc = 0.
*      out->write( lt_products ).
*    ELSE.
*      out->write( |No data escape| ).
*    ENDIF.

*    SELECT FROM zproducts_957
*        FIELDS *
*        WHERE category_id IN ( '2', '10' )
*        INTO TABLE @lt_products.
*
*    IF sy-subrc = 0.
*      out->write( lt_products ).
*    ELSE.
*      out->write( |No data| ).
*    ENDIF.

*    data lr_cat TYPE RANGE OF i.
*
*    lr_cat = VALUE #( ( sign   = 'I' "E
*                        option = 'BT'
*                        low    = 1
*                        high   = 100 ) ).
*
*    SELECT FROM zproducts_957
*        FIELDS category_id, product_name
*        WHERE category_id IN @lr_cat
*        INTO CORRESPONDING FIELDS OF TABLE @lt_products.
*
*    IF sy-subrc = 0.
*      out->write( lt_products ).
*    ELSE.
*      out->write( |No data| ).
*    ENDIF.

*    CONSTANTS lv_no_value TYPE c VALUE ''.
*
*    SELECT FROM zproducts_957
*        FIELDS *
*        WHERE product_name is null
*           or product_name = @lv_no_value
*        INTO TABLE @lt_products.
*
*    IF sy-subrc = 0.
*      out->write( lt_products ).
*    ELSE.
*      out->write( |No data NULL| ).
*    ENDIF.

    SELECT FROM zproducts_957
        FIELDS *
        WHERE ( category_id EQ '2'
             or category_id EQ '10' )
          and price GE 100
        INTO TABLE @lt_products.

    IF sy-subrc = 0.
      out->write( lt_products ).
    ELSE.
      out->write( |No data NULL| ).
    ENDIF.



  ENDMETHOD.
ENDCLASS.
