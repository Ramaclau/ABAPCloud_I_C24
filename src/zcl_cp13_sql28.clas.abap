CLASS zcl_cp13_sql28 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun .

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS ZCL_CP13_SQL28 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    data lr_price TYPE RANGE OF /dmo/price.

    lr_price = VALUE #( ( sign   = 'I' "E
                          option = 'BT'
                          low    = 500
                          high   = 1500 ) ).

    APPEND value #( sign   = 'I' "E
                    option = 'EQ'
                    low    = '4996.00' ) to lr_price.

    SELECT FROM zflight_957
        FIELDS *
        WHERE price IN @lr_price
          and currencycode = 'USD'
        INTO TABLE @DATA(lt_fligths).

    IF sy-subrc = 0.
      out->write( lt_fligths ).
    ELSE.
      out->write( |No data| ).
    ENDIF.

  ENDMETHOD.
ENDCLASS.
