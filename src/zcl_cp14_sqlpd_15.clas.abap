CLASS zcl_cp14_sqlpd_15 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_cp14_sqlpd_15 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    data lc_airline TYPE c LENGTH 3 value 'AA'.

    SELECT FROM zcds_02_param_957( pairline      = @lc_airline,
                                   pcurrencycode = 'USD' )
        FIELDS *
        INTO TABLE @DATA(lt_results).

    IF sy-subrc EQ 0.
      out->write( lt_results ).
    ENDIF.

  ENDMETHOD.
ENDCLASS.
