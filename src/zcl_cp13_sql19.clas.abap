CLASS zcl_cp13_sql19 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_cp13_sql19 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    select SINGLE from zflight_957
        FIELDS price
        where airlineid = 'AA'
          and connectionid = '0322'
          and flightdate = '20250608'
       into @data(lv_flight_price).

    if sy-subrc = 0.
        out->write( lv_flight_price ).
    ENDIF.

    select single from zflight_957
        FIELDS airlineid,
               connectionid,
               price,
               currencycode
        where airlineid = 'AA'
          and connectionid = '0322'
          and flightdate = '20250608'
        into @data(ls_flight).

    if sy-subrc = 0.
        out->write( ls_flight ).
    ENDIF.

    select from zflight_957
        FIELDS airlineid,
               connectionid,
               price,
               currencycode
        where airlineid = 'AA'
       into table @data(lt_flight).

    if sy-subrc = 0.
        out->write( lt_flight ).
    ENDIF.




  ENDMETHOD.
ENDCLASS.
