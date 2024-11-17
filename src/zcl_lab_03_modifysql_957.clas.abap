CLASS zcl_lab_03_modifysql_957 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_lab_03_modifysql_957 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

*    DATA(ls_product) = value zproducts_957( product_id   = '1'
*                                            product_name = 'Taladro 1.3'
*                                            category_id  = '2'
*                                            quantity     = 60
*                                            price        = '850.99' ).
*
*    MODIFY zproducts_957 from @ls_product.
*
*    if sy-subrc = 0.
*        out->write( |The record was inserted/updated corrently: { sy-dbcnt }| ).
*    ELSE.
*        out->write( |The record was NOT modified| ).
*    ENDIF.

    SELECT from zproducts_957
        FIELDS *
        where product_id = '1'
        INTO table @data(lt_products).

    if sy-subrc = 0.

        LOOP AT lt_products ASSIGNING FIELD-SYMBOL(<fs_products>).
            <fs_products>-quantity = 90.
        ENDLOOP.

        APPEND VALUE #( product_id   = '10'
                        product_name = 'MSI'
                        category_id  = '2'
                        quantity     = 90
                        price        = '850.99' ) to lt_products.


        MODIFY zproducts_957 from table @lt_products.

        if sy-subrc = 0.
            out->write( |The records have been modified: { sy-dbcnt }| ).
        else.
            out->write( |The records have NOT been modified| ).
        ENDIF.

      ENDIF.

  ENDMETHOD.
ENDCLASS.
