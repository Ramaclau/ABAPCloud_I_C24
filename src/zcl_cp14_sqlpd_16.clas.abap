CLASS zcl_cp14_sqlpd_16 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_cp14_sqlpd_16 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    DATA(gv_offset) = 18.

    DATA gv_decimal TYPE p LENGTH 13 DECIMALS 4 VALUE '27.0671'.

    delete from zdemo_exp_957.
    INSERT zdemo_exp_957 FROM @( VALUE #( Id   = 'L'
                                          num1 = 14
                                          num2 = 8 ) ).
    SELECT SINGLE FROM zdemo_exp_957
        FIELDS id,
               num1,
               num2,
               CAST( num1 AS FLTP ) / CAST( num2 AS FLTP ) AS ratio,
               division( num1, num2, 2 ) AS division,
               div( num1, num2 ) AS div,
               mod( num1, num2 ) AS mod,
               num1 + num2 + @gv_offset AS sum,
               abs( num1 - num2 ) AS abs,
               @gv_decimal AS decimal,
               ceil( @gv_decimal ) AS ceil,
               floor( @gv_decimal ) AS floor,
               round( @gv_decimal, 2 ) AS round
        WHERE id = 'L'
        INTO @DATA(ls_results).

    IF sy-subrc EQ 0.
      out->write( ls_results ).
    ENDIF.







  ENDMETHOD.
ENDCLASS.
