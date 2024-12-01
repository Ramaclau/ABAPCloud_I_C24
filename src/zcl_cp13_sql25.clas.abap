CLASS zcl_cp13_sql25 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_cp13_sql25 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    DATA lv_search_criteria TYPE string value '_erlin%'. "Busca Berlin

    SELECT FROM /dmo/I_airport
        FIELDS *
        WHERE name like @lv_search_criteria
        INTO TABLE @data(lt_airport).

    IF sy-subrc = 0.
      out->write( lt_airport ).
    ELSE.
      out->write( 'No data' ).
    ENDIF.


  ENDMETHOD.
ENDCLASS.
