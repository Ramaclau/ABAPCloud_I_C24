CLASS zcl_cp13_sql22 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_cp13_sql22 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    DATA lt_flights TYPE SORTED TABLE OF zflight_957
                    WITH NON-UNIQUE KEY airlineid connectionid.

    SELECT FROM zflight_957
        FIELDS *
        INTO TABLE @lt_flights
        PACKAGE SIZE 3.

      LOOP AT lt_flights ASSIGNING FIELD-SYMBOL(<fs_flights>).
        out->write( |{ <fs_flights>-airlineid } { <fs_flights>-connectionid }| ).
      ENDLOOP.

      out->write( cl_abap_char_utilities=>newline ).

    ENDSELECT.

  ENDMETHOD.
ENDCLASS.
