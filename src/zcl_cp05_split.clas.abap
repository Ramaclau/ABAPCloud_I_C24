CLASS zcl_cp05_split DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_CP05_SPLIT IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

*    DATA(lv_str3) = 'Logali-Group-SAP-Academy'.
*    SPLIT lv_str3 AT '-' INTO DATA(lv_wprd1)
*                              DATA(lv_wprd2)
*                              DATA(lv_wprd3)
*                              DATA(lv_wprd4).
*    out->write(  lv_wprd1 ).
*    out->write(  lv_wprd2 ).
*    out->write(  lv_wprd3 ).
*    out->write(  lv_wprd4 ).

    CONSTANTS gc_ini(18) TYPE c VALUE '    ABC123'.
    DATA(gv_fin) = gc_ini.
*    out->write(  gv_fin ).
*
*    "SHIFT gv_fin BY 8 PLACES.
*    SHIFT gv_fin BY 3 PLACES RIGHT.
*    out->write(  gv_fin ).

    "gv_fin = shift_left( val = gc_ini places = 2 ).
    "gv_fin = shift_right( val = gc_ini places = 2 ).
    "gv_fin = shift_right( val = gc_ini circular = 5 ).
*    out->write(  gv_fin ).

*    DATA lv_len TYPE c LENGTH 6.
*    lv_len = strlen( 'Logali Group  ' ).
*    out->write(  lv_len ).
*
*    DATA(lv_len2) = strlen( 'Logali  ' ).
*    out->write(  lv_len2 ).
*
*    lv_len = numofchar( 'Logali Group  ' ).
*    out->write(  lv_len ).

    DATA(lv_ins) = insert( val = '123CLIENT02' sub = 'INV' off = 3 ).
    out->write(  lv_ins ).

    lv_ins = '123CLIENT02'.
    lv_ins = insert( val = lv_ins sub = 'INV' ).
    out->write(  lv_ins ).

    lv_ins = reverse( val = lv_ins ).
    out->write(  lv_ins ).



  ENDMETHOD.
ENDCLASS.
