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

*    DATA: lv_time1 TYPE utclong,
*          lv_time2 TYPE utclong,
*          lv_date5 TYPE d,
*          lv_time5 TYPE t,
*          text_001 TYPE string.

*    lv_time1 = utclong_current(  ).
*    out->write(  lv_time1 ).
*    lv_time1 = utclong_add( val = lv_time1 days = 1 hours = -1 ).
*    out->write(  lv_time1 ).

*    lv_time1 = utclong_current(  ).
*    lv_time2 = utclong_current(  ).


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

*    DATA: lv_text5   TYPE string,
*          lv_pattern TYPE string.
*
*    lv_text5 = 'El nro de telefono del empleado: 123-456-7890'.
*    lv_pattern = '\d{3}-\d{3}-\d{4}'.   "telefono
*
*    IF contains( val = lv_text5 pcre = lv_pattern ).
*      out->write( 'contiene un nro de telefono' ).
*    ELSE.
*      out->write( 'NO contiene un nro de telefono' ).
*    ENDIF.
*
*    DATA(lv_num10) = match( val = lv_text5 pcre = lv_pattern occ = 1 ).
*    out->write( lv_num10 ).

*    SELECT FROM /dmo/flight
*        FIELDS carrier_id
*        INTO TABLE @DATA(lt_itab).
*
*    DATA(lv_str_tab) = concat_lines_of( table = lt_itab sep = space ).
*    out->write( lv_str_tab ).

*Tipos de Datos cadenas de caracteres
    DATA: lv_str     TYPE string,
          lv_chat(4) TYPE c,
          lv_char1   TYPE c,
          lv_char2.

    DATA: lv_n TYPE n LENGTH 20 VALUE '1234562DD'.
    DATA(lv_str_f) = 'ABC'.

*Concatenación
    DATA: lv_str_a TYPE string VALUE 'Welcome to logali Group',
          lv_str_b TYPE string.

    lv_str_b    = 'ABAP' &&  ' ' && ' student'.
    CONCATENATE lv_str_a lv_str_b INTO DATA(lv_str_fin) SEPARATED BY space.
    out->write( | Comunicado 1: { lv_str_fin } | ).

    CONCATENATE 'x ' 'y ' 'x ' INTO DATA(lv_str_c) RESPECTING BLANKS.
    out->write( | Comunicado 2: { lv_str_c } | ).

    DATA(lv_str_fin2) = | Comunicado 3: { lv_str_a } / { lv_str_b } |.
    out->write( lv_str_fin2 ).

*Concatenaciones líneas de Tablas
    SELECT FROM /dmo/flight
        FIELDS carrier_id
        INTO TABLE @DATA(lt_itab).

    DATA(lv_str_itab) = concat_lines_of( table = lt_itab sep = ` ` ).
    out->write( lv_str_itab ).

*Condensación
    CLEAR lv_str_a.
    lv_str_a = 'Welcome       to        logali         Group'.
    out->write( lv_str_a ).
    CONDENSE lv_str_a.
    out->write( lv_str_a ).
    CONDENSE lv_str_a NO-GAPS.
    out->write( lv_str_a ).

    CLEAR lv_str_a.
    lv_str_a = 'Welcome       to        logali         Group'.
    lv_str_a = condense( lv_str_a ).
    out->write( lv_str_a ).

    CLEAR lv_str_a.
    lv_str_a = 'Welcome       to        logali         Group'.
    lv_str_a = condense( val = lv_str_a from = ` ` ).
    out->write( lv_str_a ).

    CLEAR lv_str_a.
    lv_str_a = 'Welcome       to        logali         Group'.
    lv_str_a = condense( val = lv_str_a to = `` ).
    out->write( lv_str_a ).

    CLEAR lv_str_a.
    lv_str_a = condense( val = '!!!!ABAP!!!!Course!!!!' del = '!' ).
    out->write( lv_str_a ).

*Instrucción SPLIT
    DATA(lv_str_s1) = 'Logali-Group-SAP-Academy'.
    SPLIT lv_str_s1 AT '-' INTO DATA(lv_w1)
                                DATA(lv_w2)
                                DATA(lv_w3)
                                DATA(lv_w4).

    out->write( | w1 { lv_w1 } w2 { lv_w2 } w3 { lv_w3 } w4 { lv_w4 } | ).

*segment
    lv_w3 = segment( val =  lv_str_s1 index = 2 sep = '-' ).
    out->write( lv_w3 ).

*Instrucción SHIFT
    CONSTANTS gc_ini(10) TYPE c VALUE '    ABC123'.
    DATA(gv_fin) = gc_ini.
    out->write( | Valor inicial { gv_fin } | ).

*    SHIFT gv_fin.
*    SHIFT gv_fin BY 8 PLACES.
*    SHIFT gv_fin BY 3 PLACES RIGHT.
*    SHIFT gv_fin RIGHT DELETING TRAILING '123'.
    SHIFT gv_fin LEFT DELETING LEADING space.
    out->write( | Valor final { gv_fin } | ).

*Funciones STRLEN y NUMOFCHAR
    DATA lv_length TYPE c LENGTH 6.
    lv_length = strlen( 'Logali Group   ' ).
    out->write( lv_length ).

    DATA(lv_length2) = strlen( `Logali Group   ` ).
    out->write( lv_length2 ).

*numofchar
    lv_length = numofchar( 'Logali Group   ' ).
    out->write( lv_length ).

    lv_length2 = numofchar( `Logali Group   ` ).
    out->write( lv_length2 ).

*TO_LOWER y TO_UPPER
    DATA(lv_fact) = to_upper( 'abcdexyec' ).
    out->write( lv_fact ).

    lv_fact = to_lower( 'INVzasddeZz' ).
    out->write( lv_fact ).

*TRANSLATE
    lv_fact = to_lower( '123clientefact02' ).
    TRANSLATE lv_fact TO UPPER CASE.
    out->write( lv_fact ).

    lv_fact = to_lower( '123clientefact02' ).
    TRANSLATE lv_fact TO LOWER CASE.
    out->write( lv_fact ).

    lv_fact = to_upper( lv_fact ).
    out->write( lv_fact ).

*Función INSERT y REVERSE
    DATA(lv_ins_str) = insert( val = '123CLIENTE02' sub = 'INV' off = 3 ).
    out->write( lv_ins_str ).

    lv_ins_str = '123CLIENTE02'.
    lv_ins_str = insert( val = lv_ins_str sub = 'INV' ).
    out->write( lv_ins_str ).

*REVERSE
    lv_ins_str = reverse( lv_ins_str ).
    out->write( lv_ins_str ).

*******************************************************************************
*OVERLAY
    DATA(lv_campany) = '------------->Logali'.
    DATA(lv_name)    = 'Group Class                  '.
    OVERLAY lv_name WITH lv_campany.
    out->write( lv_name ).

    DATA(lv_str_ov1) = 'a.b.c.a.b.c.A'.
    DATA(lv_str_ov2) = 'z.x.y.Z.x.y.z'.
    OVERLAY lv_str_ov1 WITH lv_str_ov2 ONLY 'ab'.
    out->write( lv_str_ov1 ).

*SUBSTRING
    lv_str_a = 'Logaly Group'.
    out->write( lv_str_a ).

    lv_str_a = substring( val = lv_str_a off = 7 len = 4 ).
    out->write( lv_str_a ). "Grou

    lv_str_a = 'Logaly Group'.
    lv_str_a = substring_from( val = lv_str_a sub = 'ga' len = 6 ).
    out->write( lv_str_a ). "galy G

    lv_str_a = 'Logaly Group'.
    lv_str_a = substring_after( val = lv_str_a sub = 'ga' ).
    out->write( lv_str_a ). "ly Group

    lv_str_a = 'Logaly Group'.
    lv_str_a = substring_before( val = lv_str_a sub = 'ga' ).
    out->write( lv_str_a ). "Lo

    lv_str_a = 'Logaly Group'.
    lv_str_a = substring_to( val = lv_str_a sub = 'ga' ).
    out->write( lv_str_a ). "Loga

*FIND
    lv_str_a     = 'Abap Student'.
    out->write( lv_str_a ).

    DATA(lv_pos) = find_any_of( val = lv_str_a sub = 'x523z4e' ).

    lv_pos = sy-fdpos + 1.
    out->write( lv_pos ).

    lv_pos = find_any_of( val = lv_str_a sub = 'zxyq85x' ).
    out->write( lv_pos ). "-1

    DATA: lv_str_c2 TYPE string VALUE 'ERP ### 1  a nivel mundial desde 1972******',
          lv_regex  TYPE string VALUE '[0-9]'.

    DATA(lv_find) = find( val = lv_str_c2 regex = lv_regex ).
    out->write( lv_find ). "6


    FIND ALL OCCURRENCES OF '#' IN lv_str_c2 MATCH COUNT DATA(lv_count).
    out->write( lv_count ). "3

    lv_count = count( val = lv_str_c2 sub = '*' ).
    out->write( lv_count ).

*REPLACE
    DATA(lv_replace) = 'Logali-Group-SAP-Academy'.
    DATA(lv_sign)    = '-'.
    out->write( lv_replace ).

    REPLACE lv_sign WITH '/' INTO lv_replace.
    out->write( lv_replace ).

    REPLACE ALL OCCURRENCES OF lv_sign IN lv_replace WITH '/'.
    out->write( lv_replace ).

    "Funcion replace
    lv_replace = replace( val = lv_replace sub = '/' with = '*' occ = 0 ).
    out->write( lv_replace ).

    lv_replace = 'Logali-Group-SAP-Academy'.
    lv_replace = replace( val = lv_replace with = '#' off = 5 len = 3 ).
    out->write( lv_replace ).


DATA(lv_rut) = '10813754-1'.
    SPLIT lv_rut AT '-' INTO DATA(lv_e1)
                                DATA(lv_d2).
    out->write( lv_e1 ).
    out->write( lv_d2 ).

  ENDMETHOD.
ENDCLASS.
