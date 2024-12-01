CLASS zcl_cp13_sql27 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun .

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS ZCL_CP13_SQL27 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    SELECT FROM zcarrier_957
        FIELDS *
        WHERE carrier_id IN ( 'AA', 'AC', 'JL', 'WZ' )
        INTO TABLE @DATA(lt_airlines).

    IF sy-subrc = 0.
      out->write( lt_airlines ).
    ELSE.
      out->write( |No data| ).
    ENDIF.

  ENDMETHOD.
ENDCLASS.
