CLASS zcl_cp14_sqlpd_23 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_cp14_sqlpd_23 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    CONSTANTS lc_currency TYPE c LENGTH 5 VALUE 'EUR'.

    DELETE FROM zdemo_exp_957.
    INSERT zdemo_exp_957 FROM @( VALUE #( id       = 'L'
                                          dec3     = '160.934'
                                          amount   = '100.00'
                                          currency = 'USD' ) ).

    SELECT single from zdemo_exp_957
        FIELDS id,
               dec3 as CurrencyQuantity,
               'MI' as CurrentUnit,
               unit_conversion( quantity    = dec3,
                                source_unit = unit`KM`,
                                target_unit = unit`MI`,
                                on_error    = @sql_unit_conversion=>c_on_error-set_to_null )
                                as ConvertedQuantity,
               'KM' as ConvertedUnit,
               currency_conversion( amount             = amount,
                                    source_currency    = currency,
                                    target_currency    = @lc_currency,
                                    exchange_rate_date = @( cl_abap_context_info=>get_system_date(  ) ),
                                    round              = 'X' ) as ConvertedAmount,
               @lc_currency as ConvertedCurrency

               where id eq 'L'
               into @data(ls_result).


    If sy-subrc eq 0.
      out->write( ls_result ).
    ENDIF.

  ENDMETHOD.
ENDCLASS.
