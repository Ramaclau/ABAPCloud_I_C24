CLASS zcl_lab_04_deletesql_957 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_lab_04_deletesql_957 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    DATA(ls_product) = VALUE zproducts_957( product_id = '1' ).

    DELETE zproducts_957 FROM @ls_product.

    IF sy-subrc = 0.
      out->write( |Record delete from database| ).
    ELSE.
      out->write( |Record NOT available from database| ).
    ENDIF.

**************************************************************

    DATA lt_product2 TYPE STANDARD TABLE OF zproducts_957.

    SELECT FROM zproducts_957
        FIELDS product_id
        WHERE product_id = '2' OR product_id = '3'
        INTO CORRESPONDING FIELDS OF TABLE @lt_product2.

    IF sy-subrc = 0.

      DELETE zproducts_957 FROM TABLE @lt_product2.

      IF sy-subrc = 0.
        out->write( |Recods delete from database| ).
      ELSE.
        out->write( |Record NOT available from database| ).
      ENDIF.
    ENDIF.

    DATA lt_product3 TYPE STANDARD TABLE OF zproducts_957.

    SELECT FROM zproducts_957
        FIELDS *
        WHERE quantity > '100'
        INTO CORRESPONDING FIELDS OF TABLE @lt_product3.

    IF sy-subrc = 0.

      DELETE zproducts_957 FROM TABLE @lt_product3.

      IF sy-subrc = 0.
        out->write( |Recods delete from database: { sy-dbcnt }| ).
      ENDIF.
    ENDIF.


  ENDMETHOD.
ENDCLASS.
