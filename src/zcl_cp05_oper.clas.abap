CLASS zcl_cp05_oper DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_cp05_oper IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    DATA: lv_num_a TYPE i VALUE 10,
          lv_num_b TYPE i VALUE 15,
          lv_total TYPE p LENGTH 6 DECIMALS 2.

*      lv_total = lv_num_a + lv_num_b.
*      out->write( | num a { lv_num_a } num b { lv_num_b } total { lv_total } | ).
*
*      ADD 5 TO lv_total.
*      out->write( | total { lv_total } | ).
*
*      lv_total += 5.
*      out->write( | total 2 { lv_total } | ).
*
*      lv_total = lv_num_a - lv_num_b.
*      out->write( | num a { lv_num_a } num b { lv_num_b } total resta { lv_total } | ).
*
*      SUBTRACT 2 FROM lv_total.
*      out->write( | total 3 { lv_total } | ).
*
*      lv_total = lv_num_a * lv_num_b.
*      out->write( | num a { lv_num_a } num b { lv_num_b } total multplica { lv_total } | ).
*      MULTIPLY lv_total BY 5.
*      out->write( | total 4 { lv_total } | ).
*
*      lv_total = lv_num_a / lv_num_b.
*      out->write( | num a { lv_num_a } num b { lv_num_b } total dv { lv_total } | ).
*      DIVIDE lv_total BY 2.
*      out->write( | total 5 { lv_total } | ).
*
*      clear lv_total.
*      lv_total = ( lv_num_a + lv_num_b ) / 3.
*      out->write( | total 6 { lv_total } | ).
*
*      lv_num_a = 9.
*      lv_num_b = 4.
*      lv_total = lv_num_a / lv_num_b.
*      out->write( | total 7 { lv_total } | ).
*      lv_total = lv_num_a DIV lv_num_b.
*      out->write( | total 8 { lv_total } | ).
*
*      lv_num_a = 20.
*      lv_num_b = 8.
*      lv_total = lv_num_a / lv_num_b.
*      out->write( | total 9 { lv_total } | ).
*      lv_total = lv_num_a MOD lv_num_b.
*      out->write( | total 10 { lv_total } | ).
*
*      lv_num_a = 3.
*      out->write( | lv_num a { lv_num_a } | ).
*      lv_num_a = lv_num_a ** 2.
*      out->write( | lv_num a ex { lv_num_a } | ).
*
*      DATA(result) = ipow( base = 2 exp = 3 ).
*      out->write( | result { result } | ).
*
*      lv_num_a = SQRT( 25 ).
*      out->write( | lv_num raiz { lv_num_a } | ).

    DATA: lv_stg  TYPE string VALUE 'Claudio',
          lv_char TYPE c LENGTH 2,
          lv_int  TYPE i,
          lv_num  TYPE n LENGTH 6.

    DATA: lv_date TYPE d,
          lv_dec  TYPE p LENGTH 3 DECIMALS 2.

* lv_int = lv_stg.
*out->write( | lv_int { lv_int } | ).

*lv_stg = '12345678'.
*lv_dec = lv_stg.
*out->write( | lv_dec { lv_dec } | ).

*lv_date = cl_abap_context_info=>get_system_date(  ).
*out->write( lv_date ).
*lv_int = lv_date.
*out->write( lv_int ).
*
*lv_stg = '20241004'.
*lv_date = lv_stg.
*out->write( | lv_date { lv_date DATE = USER } | ).
*
*lv_stg = 'A1B2C3'.
*lv_num = lv_stg.
*out->write( |lv_num { lv_num } | ).

**TRUNCAR
*    lv_char = lv_stg.
*    out->write( lv_char ).
*
**REDONDEO
*    lv_dec = 1 / 12.
*    out->write( | 1/12 redondeo { lv_dec } | ).

*    DATA(lv_mult) = 8 * 16.
*    out->write(  lv_mult ).
*    DATA(lv_div) = 8 / 16.
*    out->write(  lv_div ).
*    DATA(lv_text) = 'ABAP I - 20250'.
*    out->write(  lv_TEXT ).
*    DATA(lv_deci) = '12.345'.
*    out->write(  lv_deci ).

*FORZAR CONVERSION
*    DATA(lv_date_inv) = '20241001'.
*    out->write(  lv_date_inv ).
*
*    DATA(lv_date_inv2) = CONV d( lv_date_inv ).
*    out->write(  lv_date_inv2 ).

*CALCUO DE FECHAS
*    DATA: lv_date1 TYPE d VALUE '20241004',
*          lv_date2 TYPE d VALUE '20240609',
*          lv_time  TYPE c,
*          lv_time2 TYPE c LENGTH 6.
*
*    lv_date1 = cl_abap_context_info=>get_system_date(  ).
*    lv_time  = cl_abap_context_info=>get_system_time(  ).
*    lv_time2 = cl_abap_context_info=>get_user_time_zone(  ).
*    out->write(  lv_date1 ).
*    out->write(  lv_time ).
*    out->write(  lv_time2 ).
*
*    DATA(lv_dia) = lv_date1 - lv_date2.
*    out->write(  lv_dia ).
*
*    DATA(lv_mes) = lv_date1+4(2).
*    out->write(  lv_mes ).
*    DATA(lv_aa) = lv_date1(4).
*    out->write(  lv_aa ).
*    DATA(lv_dia1) = lv_date1+6(2).
*    out->write(  lv_dia1 ).

*UTCLONG

    DATA: lv_time1 TYPE utclong,
          lv_time2 TYPE utclong,
          lv_date5 TYPE d,
          lv_time5 TYPE t,
          text_001 TYPE string.

*    lv_time1 = utclong_current(  ).
*    out->write(  lv_time1 ).
*    lv_time1 = utclong_add( val = lv_time1 days = 1 hours = -1 ).
*    out->write(  lv_time1 ).

    lv_time1 = utclong_current(  ).
    lv_time2 = utclong_current(  ).


*    CONVERT UTCLONG lv_time1
*    TIME ZONE cl_abap_context_info=>get_user_time_zone(  )
*    INTO DATE lv_date5
*    TIME lv_time5.
*    out->write(  lv_date5 ).
*    out->write(  lv_time5 ).

*     out->write( text-001 ).
*     out->write( 'BTP gato'(002) )

*    DATA(lv_str06) = 'CLAUDIO'.

*    DATA(lv_txt06) = Find( val = lv_str06 sub = 'CL' case = abap_true occ = 1 off = 1 len = 2 ).
*    out->write( lv_txt06 ).

    DATA(lv_num1) = strlen( ' Claudio ' ).
*    out->write( lv_num1 ).
*    lv_num1 = numofchar( ' Claudio ' ).
*    out->write( lv_num1 ).

*    DATA lv_str07 TYPE string VALUE '  LOGALI Local '.
*    lv_num1 = count( val = lv_str07 sub = 'LO' ).
*    out->write( lv_num1 ).
*    lv_num1 = count_any_of( val = lv_str07 sub = 'LO' ).
*    out->write( lv_num1 ).
*    lv_num1 = count_any_not_of( val = lv_str07 sub = 'LO' ).
*    out->write( lv_num1 ).
*
*    lv_num1 = find( val = lv_str07 sub = 'LI' ).
*        out->write( lv_num1 ).
*        lv_num1 = find_any_of( val = lv_str07 sub = 'LI' ).
*    out->write( lv_num1 ).
*    lv_num1 = find_any_not_of( val = lv_str07 sub = 'LI' ).
*    out->write( lv_num1 ).

*    out->write( 'hola'(MSG) ).

    DATA: lv_text5   TYPE string,
          lv_pattern TYPE string.

    lv_text5 = 'El nro de telefono del empleado: 123-456-7890'.
    lv_pattern = '\d{3}-\d{3}-\d{4}'.   "telefono

    IF contains( val = lv_text5 pcre = lv_pattern ).
      out->write( 'contiene un nro de telefono' ).
    ELSE.
      out->write( 'NO contiene un nro de telefono' ).
    ENDIF.

    DATA(lv_num10) = match( val = lv_text5 pcre = lv_pattern occ = 1 ).
    out->write( lv_num10 ).


  ENDMETHOD.
ENDCLASS.
