CLASS zcl_cp11_fsvssst DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .
  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
    METHODS structure.
    METHODS field_symbol.
  PROTECTED SECTION.
  PRIVATE SECTION.

    TYPES lty_flights TYPE STANDARD TABLE OF /dmo/airport WITH NON-UNIQUE KEY airport_id name.
    METHODS loop_fs CHANGING c_flights TYPE lty_flights.
    METHODS loop_st CHANGING c_flights TYPE lty_flights.

ENDCLASS.

CLASS zcl_cp11_fsvssst IMPLEMENTATION.

  METHOD field_symbol.

    DATA lt_flights TYPE lty_flights.

    SELECT FROM /dmo/airport
        FIELDS *
        INTO TABLE @lt_flights.

    loop_fs( CHANGING c_flights = lt_flights ).

  ENDMETHOD.

  METHOD structure.

    DATA lt_flights TYPE lty_flights.

    SELECT FROM /dmo/airport
        FIELDS *
        INTO TABLE @lt_flights.

    loop_st( CHANGING c_flights = lt_flights ).

  ENDMETHOD.

  METHOD loop_fs.

    LOOP AT c_flights ASSIGNING FIELD-SYMBOL(<lfs_flights>).
      <lfs_flights>-country = 'CO'.
    ENDLOOP.
  ENDMETHOD.

  METHOD loop_st.

    LOOP AT c_flights INTO DATA(ls_flights).
      ls_flights-country = 'CO'.
      MODIFY c_flights FROM ls_flights.
    ENDLOOP.

  ENDMETHOD.


  METHOD if_oo_adt_classrun~main.

    DATA(lo_flights) = NEW zcl_cp11_fsvssst(  ).

    lo_flights->structure(  ).

    lo_flights->field_symbol(  ).

    out->get( 'OK' ).


  ENDMETHOD.
ENDCLASS.
