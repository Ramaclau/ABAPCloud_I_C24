CLASS zcl_cp13_sql24 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_cp13_sql24 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    SELECT FROM zflight_957
        FIELDS *
        WHERE flightdate >= '20250101'
          and flightdate <= '20251231'
        INTO TABLE @DATA(lt_fligths).

    IF sy-subrc = 0.
      out->write( lt_fligths ).
    ENDIF.

    out->write( cl_abap_char_utilities=>newline ).

    SELECT FROM zflight_957
        FIELDS *
        WHERE flightdate NOT BETWEEN '20250101' and '20251231'
        INTO TABLE @lt_fligths.

    IF sy-subrc = 0.
      out->write( lt_fligths ).
    ENDIF.


  ENDMETHOD.
ENDCLASS.
