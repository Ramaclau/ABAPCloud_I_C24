CLASS zcl_cp13_sql42 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun .

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_cp13_sql42 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

   DATA lo_generic_data type REF TO data.

   FIELD-SYMBOLS <lfs_itab> TYPE STANDARD TABLE.

    DATA: lv_datasource_name  TYPE string,
          lv_selected_columns TYPE string,
          lv_where_conditions TYPE string,
          lv_airline_id       TYPE string.

    DATA lx_dynamic_osql TYPE REF TO cx_root.

    lv_datasource_name = '/DMO/I_FLIGHT'. "/DMO/I_FLIGHT /DMO/I_CONNECTION

    if lv_datasource_name = '/DMO/I_FLIGHT'.
        lv_selected_columns = |AirlineID, ConnectionID, FlightDate, Price, CurrencyCode|.
        lv_airline_id       = 'LH'.
    elseif lv_datasource_name = '/DMO/I_CONNECTION'.
        lv_selected_columns = |AirlineID, ConnectionID, DepartureAirport, DestinationAirport|.
        lv_airline_id       = 'AA'.
    else.
        RETURN.
    ENDIF.

    lv_where_conditions = |AirlineID = '{ lv_airline_id }'|.

    TRY.

        DATA(lo_comp_table) = cast cl_abap_structdescr( cl_abap_typedescr=>describe_by_name( lv_datasource_name
                                                                                             ) )->get_components(  ).
        DATA(lo_struct_type) = cl_abap_structdescr=>create( lo_comp_table ).

        DATA(lo_table_type)  = cl_abap_tabledescr=>create( lo_struct_type ).

        create data lo_generic_data TYPE HANDLE lo_table_type.

        ASSIGN lo_generic_data->* to <lfs_itab>.

        SELECT FROM (lv_datasource_name)
            FIELDS (lv_selected_columns)
            where (lv_where_conditions)
            INTO TABLE @<lfs_itab>.

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
