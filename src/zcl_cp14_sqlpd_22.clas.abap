CLASS zcl_cp14_sqlpd_22 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_cp14_sqlpd_22 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    DELETE FROM zdemo_exp_957.
    INSERT zdemo_exp_957 FROM @( VALUE #( id    = 'L'
                                          dats1 = '20300101'
                                          tims1 = '103040' ) ).

    DATA lv_tzone TYPE timezone.

    TRY.
        lv_tzone = cl_abap_context_info=>get_user_time_zone(  ).
      CATCH cx_abap_context_info_error into data(lx_sql_db).
        out->write( lx_sql_db->get_text(  ) ).
        RETURN.
    ENDTRY.

    out->write( |lv_tzone { lv_tzone }| ).

    try.
    SELECT single from zdemo_exp_957
        FIELDS id,
               tstmp_current_utctimestamp( ) as current_utc,
               tstmp_to_dats( tstmp    = tstmp_current_utctimestamp(  ),
                              tzone    = @lv_tzone,
                              on_error = @sql_tstmp_to_dats=>set_to_null ) as to_dats,

               tstmp_to_tims( tstmp    = tstmp_current_utctimestamp(  ),
                              tzone    = @lv_tzone,
                              on_error = @sql_tstmp_to_tims=>set_to_null ) as to_tims,

               tstmp_to_dst( tstmp    = tstmp_current_utctimestamp(  ),
                              tzone    = @lv_tzone,
                              on_error = @sql_tstmp_to_dst=>set_to_null ) as to_dst,

                dats_tims_to_tstmp( date     = dats1,
                                    time     = tims1,
                                    tzone    = @lv_tzone,
                                    on_error = @sql_dats_tims_to_tstmp=>set_to_null ) as to_tstmp
               where id eq 'L'
               into @data(ls_result).

      CATCH cx_sy_open_sql_db into data(lx_sql).
        out->write( lx_sql->get_text(  ) ).
        RETURN.
    ENDTRY.

    If sy-subrc eq 0.
      out->write( ls_result ).
    ENDIF.

  ENDMETHOD.
ENDCLASS.
