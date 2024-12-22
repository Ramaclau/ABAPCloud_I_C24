CLASS zcl_cp14_sqlpd_24 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_cp14_sqlpd_24 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    DELETE FROM zdemo_exp_957.
    INSERT zdemo_exp_957 FROM @( VALUE #( id       = 'L'
                                          dats1    = '20240101'
                                          utcl1   = '2040-01-01T10:30:27' ) ).

    SELECT SINGLE from zdemo_exp_957
        FIELDS id,
               dats1,
               utcl1,
               extract_year( dats1 ) as year_d,
               extract_month( dats1 ) as month_d,
               extract_day( dats1 ) as day_d,

               extract_year( utcl1 ) as year_utc,
               extract_month( utcl1 ) as month_utc,
               extract_day( utcl1 ) as day_utc,
               extract_hour( utcl1 ) as hour_utc,
               extract_minute( utcl1 ) as minute_utc,
               extract_second( utcl1 ) as second_utc,

               monthname( dats1 ) as monthname_d,
               dayname( dats1 ) as dayname_d,
               weekday( dats1 ) as weekday_d,

               monthname( utcl1 ) as monthname_utc,
               dayname( utcl1 ) as dayname_utc,
               weekday( utcl1 ) as weekday_utc
         where id eq 'L'
         into @data(ls_result).

    if sy-subrc eq 0.
      out->write( ls_result ).
    endif.

  ENDMETHOD.
ENDCLASS.
