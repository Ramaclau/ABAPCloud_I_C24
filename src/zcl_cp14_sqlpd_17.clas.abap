CLASS zcl_cp14_sqlpd_17 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_cp14_sqlpd_17 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    CONSTANTS lc_char TYPE c LENGTH 6 VALUE 'LOGALI'.

    delete from zdemo_exp_957.
    INSERT zdemo_exp_957 FROM @( VALUE #( Id    = 'L'
                                          char1 = 'AABbCDe'
                                          char2 = '123456' ) ).

    SELECT SINGLE FROM zdemo_exp_957
        FIELDS id,
               char1,
               char2,
               concat( char1, char2 ) as concat,
               concat_with_space( char1, @lc_char, 2 ) as concat2,
               char1 && char2 && 'Abap-Cloud-' && @lc_char as ampersand
        where id eq 'L'
        into @data(ls_result).

    IF sy-subrc EQ 0.
      out->write( ls_result ).
    ENDIF.





  ENDMETHOD.
ENDCLASS.
