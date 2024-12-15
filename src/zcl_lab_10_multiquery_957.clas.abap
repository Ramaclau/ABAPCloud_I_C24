CLASS zcl_lab_10_multiquery_957 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun .
    INTERFACES if_amdp_marker_hdb.

    TYPES: BEGIN OF ty_structure,
             id          TYPE c LENGTH 2,
*            id2         TYPE c LENGTH 2,
             name        TYPE c LENGTH 10,
*            name2       TYPE c LENGTH 10,
             datasource1 TYPE c LENGTH 15,
             datasource2 TYPE c LENGTH 15,
           END OF ty_structure,
           ty_table TYPE TABLE OF ty_structure.

    CLASS-METHODS get_full_join AMDP OPTIONS CDS SESSION CLIENT DEPENDENT
      EXPORTING VALUE(et_result) TYPE ty_table.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_lab_10_multiquery_957 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

*    SELECT FROM /dmo/carrier
*        FIELDS carrier_id AS Carrier,
*               name       AS NameAirport
*        INTO TABLE @DATA(lt_result).
*
*
*    IF sy-subrc EQ 0.
*      out->write( lt_result ).
*    ENDIF.

*    SELECT FROM /dmo/flight
*        FIELDS connection_id,
*               seats_occupied,
*               COUNT( * ) AS FlightsConnAll
*        GROUP BY connection_id, seats_occupied
*        HAVING seats_occupied GT ALL ( SELECT FROM /dmo/flight
*                                    FIELDS Max( seats_occupied )
*                                    where currency_code EQ 'EUR'
*                                    GROUP BY connection_id )
*        INTO TABLE @data(lt_flights).
*
*    IF sy-subrc = 0.
*      out->write( lt_flights ).
*    ENDIF.

*    SELECT FROM /dmo/flight AS Connection
*        FIELDS *
*        WHERE seats_max EQ ANY ( SELECT FROM /dmo/flight
*                                       FIELDS Max( seats_max )
*                                       WHERE carrier_id EQ 'AA' )
*        INTO TABLE @DATA(lt_flights_any).
*
*    IF sy-subrc = 0.
*      out->write( |Any: { lines( lt_flights_any ) }| ).
*    ENDIF.
*
*    SELECT FROM /dmo/flight AS Connection
*        FIELDS *
*        WHERE seats_max EQ SOME ( SELECT FROM /dmo/flight
*                                       FIELDS Max( seats_max )
*                                       WHERE carrier_id EQ 'AA' )
*        INTO TABLE @DATA(lt_flights_some).
*
*    IF sy-subrc = 0.
*      out->write( |Some: { lines( lt_flights_some ) }| ).
*    ENDIF.

*    SELECT FROM /dmo/Carrier AS carrier
*        FIELDS *
*        WHERE EXISTS ( SELECT FROM /dmo/flight
*                            FIELDS carrier_id
*                            WHERE carrier_id = carrier~carrier_id )
*        INTO TABLE @DATA(lt_flights).
*
*    IF sy-subrc = 0.
*      out->write( lt_flights ).
*    ELSE.
*      out->write( 'No data' ).
*    ENDIF.

*    SELECT FROM /dmo/Flight AS flights
*        FIELDS *
*        WHERE carrier_id IN ( SELECT FROM /dmo/flight
*                                FIELDS carrier_id
*                                WHERE carrier_id IN ( 'AA', 'DL' ) )
*        INTO TABLE @DATA(lt_flights).
*
*    IF sy-subrc = 0.
*      out->write( lt_flights ).
*    ENDIF.

*    SELECT FROM /dmo/flight AS flight
*        INNER JOIN /dmo/carrier AS carrier ON flight~carrier_id EQ carrier~carrier_id
*        FIELDS flight~connection_id,
*               flight~flight_date,
*               carrier~name
*        INTO TABLE @DATA(lt_result).
*
*    IF sy-subrc = 0.
*      out->write( lines( lt_result ) ).
*      out->write( lt_result ).
*    ENDIF.

*    SELECT FROM /dmo/flight AS flight
*        LEFT JOIN /dmo/carrier AS carrier ON flight~carrier_id EQ carrier~carrier_id
*        FIELDS flight~connection_id,
*               flight~flight_date,
*               carrier~name
*        INTO TABLE @DATA(lt_result).
*
*    IF sy-subrc = 0.
*      out->write( lines( lt_result ) ).
*      out->write( lt_result ).
*    ENDIF.

*    SELECT FROM /dmo/flight AS flight
*        RIGHT JOIN /dmo/carrier AS carrier ON flight~carrier_id EQ carrier~carrier_id
*        FIELDS flight~connection_id,
*               flight~flight_date,
*               carrier~name
*        INTO TABLE @DATA(lt_result).
*
*    IF sy-subrc = 0.
*      out->write( lines( lt_result ) ).
*      out->write( lt_result ).
*    ENDIF.

*    SELECT FROM /dmo/flight AS flight
*        FIELDS *
*        WHERE flight~carrier_id NOT IN ( SELECT FROM /dmo/carrier AS carrier
*                                    FIELDS carrier_id
*                                    WHERE flight~carrier_id EQ carrier~carrier_id )
*        INTO TABLE @DATA(lt_results_left).
*
*    IF sy-subrc EQ 0.
*      out->write( lt_results_left ).
*    else.
*      out->write( 'No Data' ).
*    ENDIF.

*    SELECT FROM /dmo/flight AS flight
*           CROSS JOIN /dmo/carrier AS carrier
*           FIELDS flight~connection_id,
*                  flight~flight_date,
*                  carrier~name as Airport
*           INTO TABLE @DATA(lt_results).
*
*    IF sy-subrc EQ 0.
*      out->write( lines( lt_results ) ).
*      out->write( lt_results ).
*    ENDIF.

    zcl_cp13_sql54=>get_full_join( IMPORTING et_result = DATA(lt_result) ).

    out->write( lt_result ).

  ENDMETHOD.

  METHOD get_full_join BY DATABASE PROCEDURE FOR HDB
                       LANGUAGE SQLSCRIPT
                       OPTIONS READ-ONLY
                       USING zdatasource1_957_i
                             zdatasource2_957_i.

    et_result = SELECT coalesce( ds1.id, ds2.id) as id,
                       coalesce( ds1.name1, ds2.name2) as name,
                       ds1.datasource1,
                       ds2.datasource2
                  from zdatasource1_957_i as ds1
                  full join zdatasource2_957_i as ds2 ON ds1.id = ds2.id
                  order BY id;

   ENDMETHOD.
ENDCLASS.
