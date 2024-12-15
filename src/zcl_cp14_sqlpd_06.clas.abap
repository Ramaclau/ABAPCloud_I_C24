CLASS zcl_cp14_sqlpd_06 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_cp14_sqlpd_06 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    DATA lt_employees TYPE STANDARD TABLE OF zemp_957.

    lt_employees = VALUE #( ( emp_id     = '00001'
                              first_name = 'Jhon'
                              last_name  = 'Smith' ) ).

    INSERT zemp_957 FROM TABLE @lt_employees.

    SELECT FROM zemp_957
        FIELDS *
        INTO TABLE @DATA(lt_results).

    IF sy-subrc EQ 0.
      out->write( lt_results ).
    ELSE.
      out->write( 'No data' ).
    ENDIF.


  ENDMETHOD.
ENDCLASS.
