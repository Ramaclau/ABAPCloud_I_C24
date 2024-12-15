CLASS zcl_lab_01_advqueries_957 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_lab_01_advqueries_957 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

*    select from /dmo/flight
*        FIELDS *
*        where price gt 500
*        into table @data(lt_flights).
*
*     if sy-subrc eq 0.
*       out->write( lt_flights ).
*     else.
*       out->write( 'No data' ).
*     endif.

*    select from /dmo/flight
*        FIELDS carrier_id, connection_id
*        where price gt 500
*        into table @data(lt_flights).
*
*     if sy-subrc eq 0.
*       out->write( lt_flights ).
*     else.
*       out->write( 'No data' ).
*     endif.

*    DATA: lv_carrier_id TYPE c LENGTH 3 VALUE 'AA',
*          lv_price      TYPE /dmo/flight_price value '500'.
*
*    SELECT FROM /dmo/flight
*        FIELDS *
*        WHERE carrier_id EQ @lv_carrier_id
*          and price      GT @lv_price
*        INTO table @data(ls_result).
*
*    IF sy-subrc EQ 0.
*      out->write( ls_result ).
*    ENDIF.

*    SELECT from /dmo/flight
*        FIELDS carrier_id, connection_id, price,
*              case
*                when price between 100 and 1600   then 'Low'
*                when price between 1601 and 2200 then 'Medium'
*                when price ge 2200              then 'High'
*                end as columnprice
*        order by carrier_id, connection_id, price
*        into table @data(lt_result).
*
*    IF sy-subrc EQ 0.
*      out->write( lt_result ).
*    ENDIF.

*    MODIFY ztemp_flight_957 FROM ( SELECT FROM /dmo/Flight AS flight
*                                      FIELDS *
*                                      where carrier_id    = 'SQ'
*                                        and connection_id = '0001' ).
*
*
*    SELECT from ztemp_flight_957 as tmp_flight
*        INNER JOIN /dmo/Flight as flight ON tmp_flight~carrier_id    eq flight~carrier_id
*                                        and tmp_flight~connection_id eq flight~connection_id
*        FIELDS tmp_flight~carrier_id,
*               tmp_flight~connection_id,
*               flight~price
*        into table @data(lt_flights).
*
*    if sy-subrc eq 0.
*      out->write( lt_flights ).
*    else.
*      out->write( 'No data' ).
*    endif.

*    WITH +tmp_table AS (
*          SELECT FROM /DMO/flight
*            FIELDS carrier_id,
*                   connection_id,
*                   price
*            WHERE price GT 500 )
*
*          SELECT FROM /DMO/flight AS flight
*                 INNER JOIN +tmp_table AS tmpDataprice
*                    ON flight~carrier_id    EQ tmpdataprice~carrier_id
*                   AND flight~connection_id EQ tmpdataprice~connection_id
*          FIELDS tmpdataprice~carrier_id,
*                 tmpdataprice~connection_id,
*                 flight~flight_date,
*                 tmpdataprice~price
*          INTO TABLE @DATA(lt_results).
*
*    IF sy-subrc EQ 0.
*      out->write( lt_results ).
*    ELSE.
*      out->write( 'No data' ).
*    ENDIF.

*    delete from zspfli_957.
*    MODIFY zspfli_957 FROM ( SELECT FROM /dmo/carrier AS carrier
*                                      FIELDS carrier~carrier_id, carrier~name, carrier~currency_code
*                                      where carrier~currency_code eq 'EUR' ).
*
*    SELECT from zspfli_957
*        FIELDS *
*        into table @DATA(lt_results).
*
*    IF sy-subrc EQ 0.
*      out->write( lt_results ).
*    ELSE.
*      out->write( 'No data' ).
*    ENDIF.

*    TRY.
*        SELECT FROM /dmo/flight
*           FIELDS carrier_id, connection_id, price
*           %_HINTS HDB 'INDEX_SEARCH'
*           INTO TABLE @DATA(ls_result).
*
*      CATCH cx_sy_open_sql_db INTO DATA(lx_sql_db).
*        out->write( lx_sql_db->get_text(  ) ).
*    ENDTRY.
*
*    IF sy-subrc EQ 0.
*      out->write( ls_result ).
*    ENDIF.

*    SELECT FROM /dmo/flight
*        FIELDS carrier_id, connection_id, price
*        where price lt 4000
*    UNION ALL
*    SELECT FROM /DMO/flight
*        FIELDS carrier_id, connection_id, price
*        where price gt 6000
*        order by carrier_id, connection_id, price
*        INTO TABLE @DATA(lt_union_flights).
*
*    IF sy-subrc EQ 0.
*      out->write( lt_union_flights ).
*    ENDIF.

*    SELECT from /DMO/Flight
*        FIELDS carrier_id,
*               connection_id,
*               price
*        where price gt 4000
*    INTERSECT
*    SELECT from /DMO/Flight
*        FIELDS carrier_id,
*               connection_id,
*               price
*        where price lt 6000
*        into table @data(lt_intersect_flights).
*
*    if sy-subrc eq 0.
*      out->write( lt_intersect_flights ).
*    ENDIF.

    SELECT from /DMO/Flight
        FIELDS carrier_id,
               connection_id,
               price
        where price gt 4000
    EXCEPT
    SELECT from /DMO/Flight
        FIELDS carrier_id,
               connection_id,
               price
        where price lt 6000
        into table @data(lt_intersect_flights).

    if sy-subrc eq 0.
      out->write( lt_intersect_flights ).
    ENDIF.













  ENDMETHOD.
ENDCLASS.
