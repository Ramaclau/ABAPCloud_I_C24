CLASS zcl_cp00 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_cp00 IMPLEMENTATION.

METHOD if_oo_adt_classrun~main.

out->write( 'esta es una clase' ).

ENDMETHOD.

ENDCLASS.