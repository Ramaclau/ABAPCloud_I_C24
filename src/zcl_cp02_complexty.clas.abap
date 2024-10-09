CLASS zcl_cp02_complexty DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

  INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_cp02_complexty IMPLEMENTATION.

METHOD if_oo_adt_classrun~main.
  TYPES: BEGIN OF lty_emp,
           id   TYPE i,
           nom  TYPE string,
           edad TYPE i,
         END OF lty_emp.

  DATA ls_emp TYPE lty_emp.

  ls_emp = VALUE #( id   = 123
                    nom  = 'Clau'
                    edad = 20 ).

"  out->write( | ID: { ls_emp-id } nombre: { ls_emp-nom } edad: { ls_emp-edad } |  ).

  TYPES: BEGIN OF ENUM lty_invoice_std,
           pendiente,
           pagado,
         END OF ENUM lty_invoice_std.

  DATA lv_std TYPE lty_invoice_std.
  lv_std = pagado.
  out->write( lv_std ).

ENDMETHOD.
ENDCLASS.
