CLASS zcl_lab_08_fieldsy_sripizarro DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_LAB_08_FIELDSY_SRIPIZARRO IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

*1. Declaración

    DATA lv_employee TYPE string.

    ASSIGN lv_employee TO FIELD-SYMBOL(<lfs_employee>).

    <lfs_employee> = 'Claudio'.

    out->write( data = <lfs_employee> name = '<lfs_employee>' ).

*2. Declaración en línea

    SELECT FROM zemp_logali
    FIELDS *
    INTO TABLE @DATA(lt_employee).

    LOOP AT lt_employee ASSIGNING FIELD-SYMBOL(<ls_employee>).
      <ls_employee>-email = 'MODIFICACION@GMAIL.COM'.
    ENDLOOP.

    out->write( data = <ls_employee> name = '<ls_employee>' ).

*3. Añadir un registro

    APPEND INITIAL LINE TO lt_employee ASSIGNING FIELD-SYMBOL(<lfs_employee_apd>).

    out->write( data = lt_employee name = 'lt_employee' ).

    <lfs_employee_apd> = VALUE #( client = sy-mandt
                                  id     = 30102024
                                  email  = 'cpizarro@gmail.com'
                                  ape1   = 'Pizarro'
                                  ape2   = 'Lobos'
                                  name   = 'Claudio'
                                  fechan = '20241030'
                                  fechaa =  '20241030' ).

    out->write( data = lt_employee name = 'lt_employee apd' ).

*4. Insertar un registro

    INSERT INITIAL LINE INTO lt_employee ASSIGNING FIELD-SYMBOL(<lfs_employee_ins>) INDEX 1.

    <lfs_employee_ins> = VALUE #( client = sy-mandt
                                  id     = 31102024
                                  email  = 'perez@gmail.com'
                                  ape1   = 'Perez'
                                  ape2   = 'Lopez'
                                  name   = 'Pirata'
                                  fechan = '20241030'
                                  fechaa = '20241030' ).

        out->write( data = lt_employee name = 'lt_employee ins' ).

*5. Leer registro

    READ TABLE lt_employee ASSIGNING FIELD-SYMBOL(<lfs_employee_rd>) WITH KEY name = 'Claudio'.

    <lfs_employee_rd>-name  = 'Perro'.
    <lfs_employee_rd>-email = 'perro@gmail.com'.

    out->write( data = lt_employee name = 'lt_employee RD' ).

*6. Coerción – Casteo

   DATA lv_date TYPE d.

   lv_date = cl_abap_context_info=>get_system_date(  ).

   ASSIGN lv_date TO FIELD-SYMBOL(<lfs_date>).

   out->write( data = <lfs_date> name = '<lfs_date> FS' ).








  ENDMETHOD.
ENDCLASS.
