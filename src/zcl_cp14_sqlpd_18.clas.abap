CLASS zcl_cp14_sqlpd_18 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_cp14_sqlpd_18 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    delete from zdemo_exp_957.
    INSERT zdemo_exp_957 FROM @( VALUE #( Id    = 'L'
                                          char1 = 'AABbCDDe'
                                          char2 = '123456' ) ).

    SELECT SINGLE FROM zdemo_exp_957
        FIELDS id,
               char1,
               char2,
               left( char1, 2 ) as left,
               right( char1, 3 ) as right,
               lpad( char2, 18, '0' ) as lpad,
               rpad( char2, 18, '0' ) as rpad,
               ltrim( char1, 'A' ) as ltrim,
               rtrim( char1, 'e' ) as rtrim,
               instr( char1, 'bC' ) as instr,
               substring( char1, 4, 2 ) as substr,
               length( char1 ) as lenght,
               replace( char1, 'DD', '__' ) as replace,
               lower( char1 ) as lower,
               upper( char1 ) as upper
        where id eq 'L'
        into @data(ls_result).

    IF sy-subrc EQ 0.
      out->write( ls_result ).
    ENDIF.

  ENDMETHOD.
ENDCLASS.
