CLASS zcl_cp13_sql23 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_cp13_sql23 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

* =  EQ - Equal
* <> NE - Not Equal
* <  LT - Less Than
* >  GT - Greater Than
* <= LE - Less Equal
* >= GE - Greater Equal

    SELECT FROM zflight_957
        FIELDS *
        WHERE airlineid = 'AA'
        INTO TABLE @DATA(lt_fligths).

    IF sy-subrc = 0.
      out->write( lt_fligths ).
    ENDIF.

  ENDMETHOD.
ENDCLASS.
