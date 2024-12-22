CLASS zcl_cp14_sqlpd_20 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_cp14_sqlpd_20 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    DATA(lv_seconds) = 3600.

    GET TIME STAMP FIELD DATA(lv_timestamp).

    DELETE FROM zdemo_exp_957.
    INSERT zdemo_exp_957 FROM @( VALUE #( id         = 'L'
                                          num1       = lv_seconds
                                          timestamp1 = lv_timestamp ) ).
    TRY.
        SELECT SINGLE FROM zdemo_exp_957
            FIELDS id,
                   num1,
                   timestamp1,
                   tstmp_is_valid( timestamp1 ) AS valid,
                   tstmp_seconds_between( tstmp1 = tstmp_current_utctimestamp(  ),
                                          tstmp2 = tstmp_add_seconds( tstmp    = timestamp1,
                                                                      seconds  = CAST( num1 AS DEC( 15,0 ) ),
                                                           on_error = @sql_tstmp_add_seconds=>set_to_null ),
                                                           on_error = @sql_tstmp_seconds_between=>set_to_null ) AS difference
                   WHERE id EQ 'L'
                   INTO @DATA(ls_result).

      CATCH cx_sy_open_sql_db INTO DATA(lx_sql_db).
        out->write( lx_sql_db->get_text( ) ).
    ENDTRY.

    if sy-subrc eq 0.
      out->write( ls_result ).
    endif.

    convert time stamp lv_timestamp
            time zone 'UTC'
            into date data(lv_date)
                 time data(lv_time).

    out->write( |{ lv_date }  { lv_time }| ).

    convert UTCLONG conv utclong( '2030-11-27 09:30:30' )
            into date lv_date
                 time lv_time
                 DAYLIGHT SAVING TIME data(lv_dst)
                 TIME ZONE 'CET'.

     out->write( |{ lv_date }  { lv_time }  { lv_dst }| ).

  ENDMETHOD.
ENDCLASS.
