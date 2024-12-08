CLASS zcl_lab_09_dinamicsql_957 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .
  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_lab_09_dinamicsql_957 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

*    TYPES: BEGIN OF ty_content,
*           Product_name TYPE string,
*           Price        TYPE p LENGTH 10 DECIMALS 2,
*           END OF ty_content.
*
*    DATA: lt_content          TYPE STANDARD TABLE OF ty_content,
*          lv_datasource_name  TYPE string,
*          lv_selected_columns TYPE string,
*          lv_where_conditions TYPE string,
*          lv_price_selection  TYPE p LENGTH 10 DECIMALS 2.
*
*    DATA lx_dynamic_osql TYPE REF TO cx_root.
*
*    lv_datasource_name  = 'zproducts_957'.
*    lv_selected_columns = |product_name, price|.
*    lv_price_selection  = 100.
*    lv_where_conditions = |price GE '{ lv_price_selection }'|.
*
*    Try.
*        select from (lv_datasource_name)
*            FIELDS (lv_selected_columns)
*            where (lv_where_conditions)
*            into table @lt_content.
*
*      CATCH cx_sy_dynamic_osql_syntax
*            cx_sy_dynamic_osql_semantics
*            cx_sy_dynamic_osql_error      INTO lx_dynamic_osql.
*
*            out->write( lx_dynamic_osql->get_text(  ) ).
*            RETURN.
*    ENDTRY.
*
*    if sy-subrc = 0.
*        out->write( lines( lt_content ) ).
*        out->write( lt_content ).
*    else.
*        out->write( 'No Data' ).
*    ENDIF.
*****************************************************************************

    data lo_generic TYPE REF TO data.

    FIELD-SYMBOLS <lfs_itab> type STANDARD TABLE.

    DATA: lv_datasource_name  TYPE string,
          lv_selected_columns TYPE string,
          lv_where_conditions TYPE string,
          lv_price_selection  TYPE p LENGTH 10 DECIMALS 2.

    DATA lx_dynamic_osql TYPE REF TO cx_root.

    lv_datasource_name  = 'zproducts_957'.
    lv_selected_columns = |client, product_id, product_name, category_id, quantity, price|.
    lv_price_selection  = 100.
    lv_where_conditions = |price GE '{ lv_price_selection }'|.

    Try.

        DATA(lo_comp_table) = cast cl_abap_structdescr( cl_abap_typedescr=>describe_by_name( lv_datasource_name
                                                                                             ) )->get_components(  ).
        DATA(lo_struct_type) = cl_abap_structdescr=>create( lo_comp_table ).

        DATA(lo_table_type)  = cl_abap_tabledescr=>create( lo_struct_type ).

        create data lo_generic TYPE HANDLE lo_table_type.

        ASSIGN lo_generic->* to <lfs_itab>.

        select from (lv_datasource_name)
            FIELDS (lv_selected_columns)
            where (lv_where_conditions)
            into table @<lfs_itab>.

      CATCH cx_sy_dynamic_osql_syntax
            cx_sy_dynamic_osql_semantics
            cx_sy_dynamic_osql_error      INTO lx_dynamic_osql.

            out->write( lx_dynamic_osql->get_text(  ) ).
            RETURN.
    ENDTRY.

    if sy-subrc = 0.
        out->write( lines( <lfs_itab> ) ).
        out->write( <lfs_itab> ).
    else.
        out->write( 'No Data' ).
    ENDIF.

  ENDMETHOD.

ENDCLASS.
