CLASS zcl_cp04_obj DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_CP04_OBJ IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    DATA: lv_num1 TYPE i VALUE 10,
          lv_num2 TYPE i,
          lv_num3 TYPE i.

    CONSTANTS: lc_num4   TYPE i VALUE 15,
               lc_num5   TYPE i VALUE 20,
               lc_string TYPE string VALUE 'Cloud'.

    lv_num2 = lc_num4.
    lv_num3 = lc_num5 + lv_num2.

    DATA(lv_fact) = '447512'.
    DATA(lv_imp)  = 19.

    out->write( | valor 1 { lv_num1 } valor 2 { lv_num2 } valor2 { lv_num3 } | ).
    out->write( 'Esta es literal' ).
    out->write( |estudio| ).


  ENDMETHOD.
ENDCLASS.
