CLASS zcl_lab_02_sqlfunc_957 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_lab_02_sqlfunc_957 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

*    SELECT SINGLE FROM /dmo/flight
*        FIELDS carrier_id,
*               connection_id,
*               flight_date,
*               price,
*               seats_max,
*               seats_occupied,
*               CAST( price AS FLTP ) / CAST( seats_max AS FLTP ) AS ratio,
*               division( price, seats_max, 2 ) AS division,
**               div( CAST( price ), seats_max ) AS div,
**               mod( price, seats_max ) AS mod
*               abs( seats_max - seats_occupied ) AS abs,
*               ceil( price ) AS ceil,
*               floor( price ) AS floor,
*               round( price, 2 ) AS round
*
*        WHERE carrier_id eq 'LH'
*          and connection_id eq '400'
*        INTO @DATA(ls_results).
*
*    IF sy-subrc EQ 0.
*      out->write( ls_results ).
*    ENDIF.

*    SELECT SINGLE FROM /dmo/carrier
*        FIELDS carrier_id,
*               name,
*               concat( name, 'Airlines' ) as full_name,
*               concat_with_space( name, 'Airlines', 2 ) as full_name_with_space,
*               name && 'Airlines'  as full_name_ampersand
*        where carrier_id eq 'AA'
*        into @data(ls_result).
*
*    IF sy-subrc EQ 0.
*      out->write( ls_result ).
*    ENDIF.

*    SELECT SINGLE FROM /dmo/flight
*        FIELDS carrier_id,
*               left( carrier_id, 2 ) as left_id,
*               right( carrier_id, 2 ) as right_id,
*               lpad( carrier_id, 5, '0' ) as lpad_id,
*               rpad( carrier_id, 5, '0' ) as rpad_id,
*               ltrim( carrier_id, 'L' ) as ltrim_id,
*               rtrim( carrier_id, 'H' ) as rtrim_id,
*               instr( carrier_id, 'LH' ) as instr_id,
*               substring( carrier_id, 1, 2 ) as substr_id,
*               length( carrier_id ) as lenght_id,
*               replace( carrier_id, 'LH', 'XX' ) as replace_id,
*               lower( carrier_id ) as lower_id,
*               upper( carrier_id ) as upper_id
*        where carrier_id eq 'LH'
*        into @data(ls_result).
*
*    IF sy-subrc EQ 0.
*      out->write( ls_result ).
*    ENDIF.

*    SELECT single from /dmo/flight
*        FIELDS carrier_id,
*               dats_is_valid( flight_date ) as valid_date,
*               dats_add_days( flight_date, 30 ) as date_plus_30,
*               dats_days_between( flight_date, flight_date ) as days_between,
*               dats_add_months( flight_date, -2 ) as date_minus_2
*        where carrier_id eq 'LH'
*        into @DATA(ls_result).
*
*    if sy-subrc eq 0.
*      out->write( ls_result ).
*    endif.

*    GET TIME STAMP FIELD DATA(lv_timestamp).
*
*    DELETE FROM ztemp_flight_957.
*    INSERT ztemp_flight_957 FROM @( VALUE #( carrier_id = 'LH'
*                                             connection_id  = '001'
*                                             flight_date    = '20241219'
*                                             price          = '100'
*                                             currency_code  = 'EUR'
*                                             plane_type_id  = '767-200'
*                                             seats_max      = '200'
*                                             seats_occupied = '191'
*                                             time       = lv_timestamp ) ).
*
*    TRY.
*        SELECT SINGLE FROM ztemp_flight_957
*            FIELDS carrier_id,
*                   connection_id,
*                   flight_date,
*                   tstmp_is_valid( time ) AS valid_timestan,
*                   tstmp_seconds_between( tstmp1 = tstmp_current_utctimestamp(  ),
*                                          tstmp2 = tstmp_add_seconds( tstmp    = time,
*                                                                      seconds  = CAST( '15' AS DEC( 15,0 ) ),
*                                                           on_error = @sql_tstmp_add_seconds=>set_to_null ),
*                                                           on_error = @sql_tstmp_seconds_between=>set_to_null ) AS seconds_between
*                   WHERE carrier_id EQ 'LH'
*                   INTO @DATA(ls_result).
*
*      CATCH cx_sy_open_sql_db INTO DATA(lx_sql_db).
*        out->write( lx_sql_db->get_text( ) ).
*    ENDTRY.
*
*    if sy-subrc eq 0.
*      out->write( ls_result ).
*    endif.

*    SELECT SINGLE from /dmo/flight
*        FIELDS  carrier_id,
*                connection_id,
*                flight_date,
*                abap_user_timezone( on_error = @sql_abap_user_timezone=>set_to_null ) as user_timezone,
*                abap_system_timezone( on_error = @sql_abap_system_timezone=>set_to_null ) as system_timezone
*        into @data(ls_result).
*
*    if sy-subrc eq 0.
*      out->write( ls_result ).
*    endif.

*    DATA lv_tzone TYPE timezone.
*
*    TRY.
*        lv_tzone = cl_abap_context_info=>get_user_time_zone(  ).
*      CATCH cx_abap_context_info_error into data(lx_sql_db).
*        out->write( lx_sql_db->get_text(  ) ).
*        RETURN.
*    ENDTRY.
*
*    "GET TIME STAMP FIELD DATA(lv_time).
*    data lv_time type t value '102040'.
*
*    try.
*    SELECT single from /dmo/flight
*        FIELDS carrier_id,
*               connection_id,
*               flight_date,
*               tstmp_current_utctimestamp( ) as current_utc,
*
*               tstmp_to_tims( tstmp    = tstmp_current_utctimestamp(  ),
*                              tzone    = @lv_tzone,
*                              on_error = @sql_tstmp_to_tims=>set_to_null ) as to_tims,
*
*               tstmp_to_dst( tstmp    = tstmp_current_utctimestamp(  ),
*                              tzone    = @lv_tzone,
*                              on_error = @sql_tstmp_to_dst=>set_to_null ) as to_dst,
*
*                dats_tims_to_tstmp( date     = flight_date,
*                                    time     = @lv_time,
*                                    tzone    = @lv_tzone,
*                                    on_error = @sql_dats_tims_to_tstmp=>set_to_null ) as to_tstmp
*               where carrier_id    eq 'LH'
*                 and connection_id eq '400'
*               into @data(ls_result).
*
*      CATCH cx_sy_open_sql_db into data(lx_sql).
*        out->write( lx_sql->get_text(  ) ).
*        RETURN.
*    ENDTRY.
*
*    If sy-subrc eq 0.
*      out->write( ls_result ).
*    ENDIF.

*    SELECT single from /dmo/flight
*        FIELDS carrier_id,
*               connection_id,
*               flight_date,
*               price,
*
*               unit_conversion( quantity    = price,
*                                source_unit = unit`EUR`,
*                                target_unit = unit`USD`,
*                                on_error    = @sql_unit_conversion=>c_on_error-set_to_null )
*                                as converted_amount,
*
*               currency_conversion( amount             = price,
*                                    source_currency    = currency_code,
*                                    target_currency    = 'USD',
*                                    exchange_rate_date = @( cl_abap_context_info=>get_system_date(  ) ),
*                                    round              = 'X' ) as converted_currency
*               where carrier_id    eq 'LH'
*                 and connection_id eq '400'
*               into @data(ls_result).
*
*    If sy-subrc eq 0.
*      out->write( ls_result ).
*    ENDIF.

*    SELECT single from /dmo/flight
*        FIELDS carrier_id,
*               connection_id,
*               flight_date,
*               price,
*
*               extract_year( flight_date ) as year,
*               extract_month( flight_date ) as month,
*               extract_day( flight_date ) as day
*
*                where carrier_id    eq 'LH'
*                 and connection_id eq '400'
*               into @data(ls_result).
*
*    If sy-subrc eq 0.
*      out->write( ls_result ).
*    ENDIF.

    INSERT zspfli_957_c FROM ( SELECT FROM /DMO/Flight
                                      FIELDS carrier_id,
                                             uuid(  ) AS ID,
                                             currency_code ).
    SELECT FROM zspfli_957_c
        FIELDS *
        INTO TABLE @DATA(lt_flights).

    IF sy-subrc EQ 0.
      out->write( lt_flights ).
    ENDIF.








  ENDMETHOD.
ENDCLASS.
