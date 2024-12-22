CLASS zcl_cp14_sqlpd_19 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_cp14_sqlpd_19 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    delete from zdemo_exp_957.
    INSERT zdemo_exp_957 FROM @( VALUE #( Id    = 'L'
                                          dats1 = '20300101'
                                          dats2 = '20310101'
                                          datn1 = '20400101'
                                          datn2 = '20410101' ) ).

    SELECT single from zdemo_exp_957
        FIELDS id,
               dats1,
               dats2,
               datn1,
               datn2,
               dats_is_valid( dats1 ) as valid,
               dats_days_between( dats1, dats2 ) as days_between_d,
               datn_days_between( datn1, datn2 ) as days_between_n,
               dats_add_days( dats1, 30 ) as add_days_d,
               datn_add_days( datn1, 30 ) as add_days_n,
               dats_add_months( dats1, -2 ) as add_months_d,
               datn_add_months( datn1, -2 ) as add_month_n,
               dats_from_datn( datn1 ) as dats_from_n,
               dats_to_datn( dats1 ) as dats_to_datn
        where id eq 'L'
        into @DATA(ls_result).

    if sy-subrc eq 0.
      out->write( ls_result ).
    endif.

  ENDMETHOD.
ENDCLASS.
