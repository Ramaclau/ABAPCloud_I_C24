CLASS zcl_cp13_sql26 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.
  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_cp13_sql26 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

*codigo para update con %
*    SELECT FROM zcarrier_957
*        FIELDS *
*        WHERE currency_code = 'USD'
*        INTO TABLE @DATA(lt_airlines).
*
*    if sy-subrc = 0.
*
*        loop at lt_airlines ASSIGNING FIELD-SYMBOL(<ls_airline>).
*            <ls_airline>-name = |New %:{ <ls_airline>-name }|.
*        ENDLOOP.
*
*        update zcarrier_957 from table @lt_airlines.
*
*    ENDIF.
************************

    CONSTANTS cv_escape TYPE c LENGTH 1 VALUE '#'.

    SELECT FROM zcarrier_957
        FIELDS *
        WHERE name LIKE '%#%%' ESCAPE @cv_escape
        INTO TABLE @DATA(lt_airlines).

    IF sy-subrc = 0.
      out->write( lt_airlines ).
    ELSE.
      out->write( |No data| ).
    ENDIF.

  ENDMETHOD.
ENDCLASS.
