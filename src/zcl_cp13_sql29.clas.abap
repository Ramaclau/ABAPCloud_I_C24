CLASS zcl_cp13_sql29 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun .

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_cp13_sql29 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    CONSTANTS lv_no_value TYPE c VALUE ''.

    SELECT FROM zflight_957
        FIELDS *
        WHERE currencycode IS NULL
           OR currencycode = @lv_no_value
           OR currencycode = @space
        INTO TABLE @DATA(lt_flight).

    IF sy-subrc = 0.
      out->write( lt_flight ).
    ELSE.
      out->write( |Not Null or empty values available| ).
    ENDIF.

  ENDMETHOD.
ENDCLASS.
