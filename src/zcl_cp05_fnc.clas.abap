CLASS zcl_cp05_fnc DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_cp05_fnc IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.
*
*    DATA(lv_char) = 'B'.
*    IF lv_char EQ 'A'.
*        out->write( | IF { lv_char } | ).
*    ELSEIF
*        out->write( | ELSE { lv_char } | ).
*    ENDIF.

*    DATA(lv_cli) = cl_abap_random_int=>create( seed = cl_abap_random=>seed(  )
*                                              min = 1
*                                              max = 3 )->get_next(  ).
*    CASE lv_cli.
*    WHEN 1.
*        out->write( | cliente 1 { lv_cli } | ).
*    WHEN 2.
*        out->write( | cliente 2 { lv_cli } | ).
*    WHEN OTHERS.
*        out->write( | NO Existe { lv_cli } | ).
*
*
*    ENDCASE.

*    DATA(lv_num) = 0.
*    DO 3 TIMES.
*        out->write( lv_num ).
*        lv_num += 1.
*    ENDDO.
*
*    DO.
*        out->write( lv_num ).
*        lv_num += 1.
*        if lv_num = 10.
*            EXIT.
*        ENDIF.
*    ENDDO.

*    DO 20 TIMES.
*        DATA(lv_div) = sy-index MOD 2.
*
*        CHECK lv_div = 0.
*        out->write( sy-index ).
*    ENDDO.

    DO 6 TIMES.
        DATA(lv_val) = SWITCH #( sy-index
                                 WHEN 1 THEN |iteración 1|
                                 WHEN 2 THEN |iteración 2|
                                 WHEN 3 THEN |iteración 3|
                                 ELSE |# interacion > 3| ).
        out->write( lv_val ).

    ENDDO.




  ENDMETHOD.
ENDCLASS.
