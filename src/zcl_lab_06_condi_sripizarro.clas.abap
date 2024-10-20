CLASS zcl_lab_06_condi_sripizarro DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_lab_06_condi_sripizarro IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

*1. IF / ENDIF

    DATA(lv_conditional) = 7.
    IF lv_conditional = 7.
      out->write( 'Igual a 7' ).
    ELSE.
      out->write( 'Distinto a 7' ).
    ENDIF.

*2. CASE / ENDCASE
    DATA lv_string TYPE string.
    lv_string = 'SAP'.

    CASE lv_string.
      WHEN 'Logali'.
        out->write( 'Academy' ).
      WHEN 'SAP'.
        out->write( 'Enterprise software' ).
      WHEN OTHERS.
        out->write( 'Unknown' ).
    ENDCASE.

*3. DO / ENDDO
    DATA lv_counter TYPE i.

    DO 10 TIMES.
      lv_counter += 1.
      out->write( | conut { lv_counter } | ).
    ENDDO.

*4. CHECK
    lv_counter = 0.

    DO 10 TIMES.
      lv_counter += 1.

      CHECK lv_counter = 7.
      out->write( lv_counter ).
      EXIT.
      CHECK NOT lv_counter = 7.
      out->write( lv_counter ).
      CONTINUE.
      lv_counter += 1.

    ENDDO.

*5. SWITCH
    DATA(lv_str_sw) = 'LOGALI'.
    DATA(lv_string_2) = SWITCH #( lv_str_sw
                                  WHEN 'LOGALI'   THEN | SAP Academy |
                                  WHEN 'SAP'      THEN | Entrprise software |
                                  WHEN 'MOVISTAR' THEN | Telephony |
                                  ELSE | # Unknown | ).

    out->write( lv_string_2 ).

*6. COND
    DATA(lv_time) = cl_abap_context_info=>get_system_time(  ).

    DATA(lv_time2) = COND #( WHEN lv_time < '120000' THEN | { lv_time TIME = ISO } AM |
                             WHEN lv_time > '120000' THEN | { lv_time TIME = ISO } PM |
                             WHEN lv_time = '120000' THEN | High noon |
                             ELSE | Hora no conocida | ).
    out->write( lv_time2 ).

*7. WHILE / ENDWHILE
    DATA lv_counter_2 TYPE i.

    WHILE  lv_counter_2 < 20.
      IF lv_counter_2 <= 10.
        out->write( | hasta { lv_counter_2 } | ).
      ENDIF.
      lv_counter_2 += 5.
      out->write( | while { lv_counter_2 } | ).
    ENDWHILE.

*8. LOOP / ENDLOOP
    DATA: lt_employees TYPE TABLE OF zemp_logali,
          ls_employees TYPE zemp_logali.

    SELECT * FROM zemp_logali INTO TABLE @lt_employees.
    LOOP AT lt_employees INTO ls_employees WHERE ape2 = 'JIMENEZ'.
        out->write( ls_employees-email ).
    ENDLOOP.

*** NO SE COMO HACER ESTO TODAVIA, LLAMAR A UNA TABLA Y PASARLE LOS DATOS.
*** RECORRER EL LOOP SI LO SE HACER PERO LLAMAR A TABLAS Y MANIPULAR NO SE COMOS E HACE.
*** Ahora lo hice desde la solución. (agregue @ en la tabla local que no estaba en la solución

*9. TRY / ENDTRY
    DATA lv_exception TYPE f.
    lv_exception = 5.
    lv_counter   = 5.

    DO 5 TIMES.
      TRY.
          lv_counter = lv_counter - 1.
          lv_exception =  lv_exception / lv_counter.
        CATCH cx_sy_zerodivide INTO DATA(lv_div_cero).
          out->write( 'error división' ).
      ENDTRY.
    ENDDO.

  ENDMETHOD.

ENDCLASS.
