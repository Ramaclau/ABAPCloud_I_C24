CLASS zcl_lab_08_sqlexpressions_957 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .
  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun .

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_lab_08_sqlexpressions_957 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

* MIN / MAX
*    select from zproducts_957
*        FIELDS min( price ) as MinPrice,
*               max( price ) as MaxPrice
*        into @data(lv_minmax).
*
*    if sy-subrc = 0.
*        out->write( lv_minmax ).
*    endif.

* AVG / SUM
*    select from zproducts_957
*        FIELDS AVG( price ) as AvgPrice,
*               SUM( price ) as SumPrice
*        into ( @data(lv_avgprice), @data(lv_sumprice) ).
*
*    if sy-subrc = 0.
*        out->write( |Avg Price: { lv_avgprice }; Sum Price: { lv_sumprice }| ).
*    endif.

* DISTINCT
*    select from zproducts_957
*        FIELDS min( DISTINCT price ) as MinPrice,
*               max( DISTINCT price ) as MaxPrice
*        into @data(lv_minmax).
*
*    if sy-subrc = 0.
*        out->write( lv_minmax ).
*    endif.

* COUNT
*    select from zproducts_957
*        FIELDS COUNT( * ) as CountALL
*        into @data(lv_count).
*
*    if sy-subrc = 0.
*        out->write( lv_count ).
*    endif.

* GROUP BY
*    SELECT FROM zproducts_957
*        FIELDS category_id,
*               AVG( price ) AS AvgPrice
*        GROUP BY category_id, price HAVING price GE 100
*        INTO TABLE @DATA(lt_group).
*
*    IF sy-subrc = 0.
*      LOOP AT lt_group ASSIGNING FIELD-SYMBOL(<lfs_price>).
*
*        IF <lfs_price>-avgprice GE 100.
*          out->write( |category_id: { <lfs_price>-category_id }; AVG Price { <lfs_price>-avgprice }| ).
*        ENDIF..
*
*      ENDLOOP.
*    ENDIF.

* ORDER BY / OFFSET
    data: lv_page_number TYPE i value 1,
          lv_records_per_page type i value 6.

    data gv_offset type int8.

    " Page 1 = Block 0
    " Page 2 = Block 1

    gv_offset = ( lv_page_number - 1 ) * lv_records_per_page.

    SELECT FROM zproducts_957
        FIELDS price
        ORDER BY price DESCENDING
        INTO TABLE @DATA(lt_order)
        OFFSET @gv_offset
        UP TO @lv_records_per_page ROWS.

    IF sy-subrc = 0.
      out->write( lt_order ).
     ENDIF.



  ENDMETHOD.
ENDCLASS.
