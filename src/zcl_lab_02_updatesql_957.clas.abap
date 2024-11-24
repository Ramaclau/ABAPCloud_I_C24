CLASS zcl_lab_02_updatesql_957 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_lab_02_updatesql_957 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

*   DATA ls_products type zproducts_957.
*
*    ls_products = value #( product_id = 1
*                           product_name = 'Taladro 1.3'
*                           category_id  = 2
*                           quantity    = '75'
*                           price       = '899.99' ).
*
*    UPDATE zproducts_957 from @ls_products.
*
*    if sy-subrc = 0.
*        out->write( |Current Currency: { ls_products-product_id }| ).
*    ENDIF.

*    SELECT FROM zproducts_957
*      FIELDS *
*      where category_id = 2
*      INTO TABLE @DATA(lt_products).
*
*    IF sy-subrc = 0.
*      LOOP AT lt_products ASSIGNING FIELD-SYMBOL(<lsf_products>).
*        <lsf_products>-quantity = 120.
*      ENDLOOP.
*
*      UPDATE zproducts_957 FROM TABLE @lt_products.
*
*      IF sy-subrc = 0.
*        out->write( |All records updated with the new currency: { sy-dbcnt }| ).
*      ENDIF.
*
*    ENDIF.

*    UPDATE zproducts_957
*        SET price = 21
*        WHERE category_id = '2' OR price = '50'.
*
*    IF sy-subrc = 0.
*      out->write( |Records updated { sy-dbcnt }| ).
*    ELSE.
*      out->write( |Records NOT updated| ).
*    ENDIF.

    UPDATE zproducts_957
        SET quantity  = quantity + 110
        WHERE product_id > 11.

    IF sy-subrc = 0.
      out->write( |Update rows: { sy-dbcnt }| ).
    ELSE.
      out->write( |Update not excured| ).

    ENDIF.

  ENDMETHOD.
ENDCLASS.
