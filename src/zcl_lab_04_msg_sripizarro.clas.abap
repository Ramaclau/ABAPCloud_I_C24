CLASS zcl_lab_04_msg_sripizarro DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_LAB_04_MSG_SRIPIZARRO IMPLEMENTATION.


METHOD if_oo_adt_classrun~main.

DATA: LV_ORDER_STATUS TYPE string VALUE 'Purchase Completed Successfully',
      LV_CHAR_NUMBER  TYPE i.

*2. Funciones de descripción

LV_CHAR_NUMBER = strlen( LV_ORDER_STATUS ).
out->write( LV_CHAR_NUMBER ).

LV_CHAR_NUMBER = numofchar( LV_ORDER_STATUS ).
out->write( LV_CHAR_NUMBER ).

LV_CHAR_NUMBER = count_any_of( val = LV_ORDER_STATUS sub = 'A' ).
out->write( LV_CHAR_NUMBER ).

LV_CHAR_NUMBER = find( val = LV_ORDER_STATUS sub = 'Exit' ).
out->write( LV_CHAR_NUMBER ).





ENDMETHOD.
ENDCLASS.
