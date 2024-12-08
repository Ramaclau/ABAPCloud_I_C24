CLASS zcl_cp13_sql39 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun .

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_cp13_sql39 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    TYPES: BEGIN OF ty_content,
             AirlineID    TYPE /dmo/carrier_id,
             ConnectionID TYPE /dmo/connection_id,
           END OF ty_content.

    DATA: lt_content         TYPE STANDARD TABLE OF ty_content,
          lv_datasource_name TYPE string.

    DATA lx_dynamic_osql TYPE REF TO cx_root.

    lv_datasource_name = '/DMO/I_CONNECTION_XYZ'. "/DMO/I_FLIGHT /DMO/CONNECTION

    TRY.
        SELECT FROM (lv_datasource_name)
            FIELDS AirlineID, ConnectionID
            INTO TABLE @lt_content.

      CATCH cx_sy_dynamic_osql_syntax
            cx_sy_dynamic_osql_semantics
            cx_sy_dynamic_osql_error      INTO lx_dynamic_osql.

            out->write( lx_dynamic_osql->get_text(  ) ).
            RETURN.
    ENDTRY.

    if sy-subrc = 0.
        out->write( lines( lt_content ) ).
        out->write( lt_content ).
    else.
        out->write( 'No Data' ).
    ENDIF.

  ENDMETHOD.
ENDCLASS.
