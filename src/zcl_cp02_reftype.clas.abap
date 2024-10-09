CLASS zcl_cp02_reftype DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_cp02_reftype IMPLEMENTATION.

 METHOD if_oo_adt_classrun~main.
    DATA: lvr_int    TYPE REF TO i,
          lvr_string TYPE REF TO string.

    DATA lvr_ddic_tab TYPE REF TO /dmo/airport.

    DATA it_tab TYPE TABLE OF REF TO /dmo/airport.
    DATA lo_ref TYPE REF TO zcl_cp00.

 ENDMETHOD.

ENDCLASS.
