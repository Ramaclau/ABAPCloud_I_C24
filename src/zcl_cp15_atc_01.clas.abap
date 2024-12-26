CLASS zcl_cp15_atc_01 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_cp15_atc_01 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    select from /DMO/I_Connection
        FIELDS *
        into table @DATA(lt_results).


  ENDMETHOD.
ENDCLASS.
