CLASS zcl_lab_05_commitsql_975 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun .

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_lab_05_commitsql_975 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

*    INSERT zproducts_957 FROM TABLE @( VALUE #( ( product_id    = '80'
*                                                  product_name  = 'ASUS'
*                                                  category_id   = '10'
*                                                  quantity      = '200'
*                                                  price         = '25.99' ) ) ).
*
*    IF sy-subrc = 0.
*
*      SELECT SINGLE FROM zproducts_957
*      FIELDS *
*      WHERE product_id    = '20'
*      INTO @DATA(ls_product).
*
*      IF sy-subrc = 0.
*        out->write( ls_product ).
*      ENDIF.
*
*      COMMIT WORK.
*      out->write( |Insert row: { sy-dbcnt }| ).
*
*    ENDIF.

**********************************************************************

    UPDATE zproducts_957
        SET price = '20.99'
        WHERE product_id = 60.


    IF sy-subrc = 0.

      SELECT SINGLE FROM zproducts_957
          FIELDS *
          WHERE product_id = 60
          INTO @DATA(ls_product2).

      IF sy-subrc = 0.
        out->write( ls_product2-price ).
      ENDIF.

      ROLLBACK WORK.

    ENDIF.

  ENDMETHOD.
ENDCLASS.
