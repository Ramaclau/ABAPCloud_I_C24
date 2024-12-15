CLASS zcl_cp14_sqlpd_03 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun .

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_cp14_sqlpd_03 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    CONSTANTS lc_inmediately TYPE c LENGTH 1 VALUE 'I'.

    DATA lv_airlines_id TYPE c LENGTH 3 VALUE 'LH'.

    TYPES: BEGIN OF ty_result,
             airlineid    TYPE c LENGTH 3,
             Coonectionid TYPE c LENGTH 4,
             Availability TYPE c LENGTH 1,
           END OF ty_result.

    DATA ls_result TYPE ty_result.

    SELECT SINGLE FROM /dmo/i_flight
        FIELDS AirlineID,
               ConnectionID,
               @lc_inmediately as Availability
        WHERE AirlineID EQ @lv_airlines_id
        INTO @ls_result.

    IF sy-subrc EQ 0.
      out->write( ls_result ).
    ENDIF.

    out->write( cl_abap_char_utilities=>newline ).

    clear ls_result.
    ASSIGN ls_result to FIELD-SYMBOL(<fs_result>).

    SELECT SINGLE FROM /dmo/i_flight
        FIELDS AirlineID,
               ConnectionID
        WHERE AirlineID EQ @lv_airlines_id
        INTO @ls_result.

    IF sy-subrc EQ 0.
      out->write( ls_result ).
    ENDIF.


  ENDMETHOD.
ENDCLASS.
