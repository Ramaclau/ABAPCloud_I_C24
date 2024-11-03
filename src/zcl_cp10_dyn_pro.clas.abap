CLASS zcl_cp10_dyn_pro DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_cp10_dyn_pro IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    "comneto para declarar en linea
*    FIELD-SYMBOLS: <gt_employees> TYPE ANY TABLE,
*                   <gs_employee>  TYPE any,
*                   <gs_data>      TYPE any.

    DATA(gs_employee) = VALUE zemploy_table( mandt = sy-mandt
                                             id            =  105
                                             first_name    = 'Pepe'
                                             last_name     = 'Lorca'
                                             email         = 'pepe@gmail.com'
                                             phone_number  = 12345678
                                             salary        = 400
                                             currency_code = 'EUR' ).

    ASSIGN gs_employee TO FIELD-SYMBOL(<gs_employee>).

    IF <gs_employee> IS ASSIGNED.
      " comento para declarar en linea
*      ASSIGN COMPONENT 'FIRST_NAME' OF STRUCTURE <gs_employee> TO <gs_data>.
*
*      IF <gs_data> IS ASSIGNED.
*        <gs_data> = 'Marilyn'.
*        UNASSIGN <gs_data>.
*      ENDIF.

      <gs_employee>-first_name = 'Tina'. "declaracion en linea

      UNASSIGN <gs_employee>.
    ENDIF.

    out->write( data = gs_employee name = 'Dyn Pro' ).

    """"""
    SELECT FROM zemploy_table
        FIELDS *
        INTO TABLE @DATA(gt_employees).

    IF lines( gt_employees ) > 0.

      ASSIGN gt_employees TO FIELD-SYMBOL(<gt_employees>).

      LOOP AT <gt_employees> ASSIGNING <gs_employee>.

        IF <gs_employee> IS ASSIGNED.

          <gs_employee>-email = | { <gs_employee>-email }.es |.

        ENDIF.
      ENDLOOP.
    ENDIF.

    out->write( data = gt_employees name = 'gt_employees' ).

*2.3. Usos de Referencias de Datos

    DATA(lr_data) = NEW i(  ).

    ASSIGN lr_data->* TO FIELD-SYMBOL(<fs_value>).

    <fs_value> = 30.

    out->write( data = <fs_value> name = '<fs_value>' ).

*2.4. Objetos de datos anónimos

    TYPES: BEGIN OF lty_data,
             field1 TYPE i,
             field2 TYPE string,
             field3 TYPE string,
           END OF lty_data.

    DATA lt_data_dyn2 TYPE TABLE OF lty_data
        WITH NON-UNIQUE KEY field1
        WITH UNIQUE SORTED KEY sortk COMPONENTS field2.

    TYPES lt_type LIKE lt_data_dyn2.
    DATA lt_data_dyn LIKE lt_data_dyn2.

    DATA lt_ref TYPE TABLE OF REF TO lty_data WITH EMPTY KEY.

    lt_data_dyn = VALUE #( ( field1 = 1 field2 = 'aaa' field3 = 'bbb' )
                           ( field1 = 2 field2 = 'ccc' field3 = 'ddd' )
                           ( field1 = 3 field2 = 'eee' field3 = 'fff' ) ).

    "NEW
    DATA(lr_data1) = NEW i(  ).

    DATA(lr_data2) = NEW zemploy_table( id = 106 first_name = 'perro' ).

    SELECT FROM zemploy_table
        FIELDS *
        INTO TABLE NEW @DATA(lr_data3). "ITAB

    SELECT SINGLE *
        FROM zemploy_table
        INTO NEW @DATA(lr_data4). "ESTRACTURA

    out->write( data = lr_data3 name = 'lr_data3' ).
    out->write( data = lr_data4 name = 'lr_data4' ).

*2.5. Sentencias dinámicas ASSIGN

    DATA ls_data TYPE lty_data.
    DATA lt_data TYPE TABLE OF lty_data WITH EMPTY KEY.

    ls_data = VALUE #( field1 = 1 field2 = 'aaa' field3 = 'Z' ).

    APPEND ls_data TO lt_data.

    DATA(lr_data5) = NEW lty_data( field1 = 2 field2 = 'b' field3 = 'Y' ).

    FIELD-SYMBOLS <lfs_generic> TYPE data.

    ASSIGN ls_data-('FIELD1') TO <lfs_generic>.
    out->write( data = <lfs_generic> name = '<lfs_generic>' ).

    ASSIGN lt_data[ 1 ]-('FIELD1') TO <lfs_generic>.
    out->write( data = <lfs_generic> name = '<lfs_generic>' ).

    ASSIGN lr_data5->('FIELD2') TO <lfs_generic>.
    out->write( data = <lfs_generic> name = '<lfs_generic>' ).

    ASSIGN lr_data5->*-('FIELD3') TO <lfs_generic>.
    out->write( data = <lfs_generic> name = '<lfs_generic>' ).

    DATA lv_field TYPE string VALUE 'FIELD2'.
    ASSIGN ls_data-(lv_field) TO <lfs_generic>.
    out->write( data = <lfs_generic> name = 'ls_data-(lv_field)' ).

    "Dinamico

    ASSIGN ('LS_DATA-FIELD1') TO <lfs_generic>.
    out->write( data = <lfs_generic> name = 'FIELD1' ).

    ASSIGN ls_data-(3) TO <lfs_generic>.
    out->write( data = <lfs_generic> name = 'ls_data-(3)' ).

    DATA(lo_ref) = NEW zcl_cp08_new( iv_name = 'Lorena' iv_age = 20 ).
    lo_ref->lv_age = 30.
    ASSIGN lo_ref->('LV_AGE') TO <lfs_generic>.
    out->write( data = <lfs_generic> name = 'Lo_ref->' ).

*2.6. Especificaciones dinámicas itab

    DATA(lv_field_name) = 'FIELD1'.
    SORT lt_data_dyn BY (lv_field_name) DESCENDING.
    out->write( data = lt_data_dyn name = 'lt_data_dyn' ).

    SORT lt_data_dyn BY ('FIELD2').
    out->write( data = lt_data_dyn name = 'lt_data_dyn' ).

*2.7. READ TABLE dinámico en itab

    DATA(ls_read) = VALUE lty_data( field2 = 'aaa' ).

    READ TABLE lt_data_dyn FROM ls_read USING KEY ('SORTK') REFERENCE INTO DATA(lr_read).
    out->write( lr_read->* ).

*    READ TABLE lt_data_dyn WITH KEY ('PRIMARY KEY') COMPONENTS ('FIELD1') = 3 REFERENCE INTO lr_read.
*    out->write( data = lr_read->* name = 'lr_read->*' ).

    READ TABLE lt_data_dyn INDEX 2 USING KEY ('SORTK') REFERENCE INTO lr_read.
    out->write( data = lr_read->* name = 'lr_read->*' ).

    DATA(ls_read2) = lt_data_dyn[ KEY ('SORTK') INDEX 2 ].
    out->write( data = ls_read2 name = 'ls_read2' ).

    DATA(ls_read3) = lt_data_dyn[ ('FIELD2') = 'ccc' ('FIELD3') = 'ddd' ].
    out->write( data = ls_read3 name = 'ls_read3' ).

    DATA(ls_read4) = lt_data_dyn[ KEY ('SORTK') ('FIELD2') = 'eee' ].
    out->write( data = ls_read4 name = 'ls_read4' ).


  ENDMETHOD.
ENDCLASS.
