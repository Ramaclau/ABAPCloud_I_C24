CLASS zcl_cp13_sql11 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_cp13_sql11 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    "Eliminacion con una estructura
    SELECT SINGLE FROM zcarrier_957
        FIELDS *
        WHERE carrier_id = 'UA'
        INTO @DATA(ls_airline).

    IF sy-subrc = 0.

      DELETE zcarrier_957 FROM @ls_airline.

      IF sy-subrc = 0.
        out->write( |Record delete from database| ).
      ELSE.
        out->write( |Record NOT delete from database| ).
      ENDIF.

    ENDIF.

    "Delete directo pasando la clave para el delete
    DATA(ls_airline2) = VALUE zcarrier_957( carrier_id = 'WZ' ).

    DELETE zcarrier_957 FROM @ls_airline2.

    IF sy-subrc = 0.
      out->write( |Record delete from database| ).
    ELSE.
      out->write( |Record NOT available from database| ).
    ENDIF.

  ENDMETHOD.
ENDCLASS.
