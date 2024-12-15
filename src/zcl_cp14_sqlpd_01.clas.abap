CLASS zcl_cp14_sqlpd_01 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .
  PUBLIC SECTION.

    TYPES: BEGIN OF ty_customer,
             CustomerId TYPE /dmo/customer_id,
             Firstname  TYPE /dmo/first_name,
           END OF ty_customer,
           tt_customers TYPE TABLE of ty_customer.

    INTERFACES if_oo_adt_classrun .

    METHODS test_inline_declaration IMPORTING it_customers TYPE ty_customer.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_cp14_sqlpd_01 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    SELECT FROM /dmo/I_Customer
        FIELDS CustomerID, FirstName
        INTO TABLE @DATA(lt_customers)
        UP TO 10 ROWS.

    IF sy-subrc EQ 0.
      out->write( lt_customers ).
    ELSE.
      out->write( 'No data available' ).
    ENDIF.

*    test_inline_declaration( EXPORTING it_customers = lt_customers ).

  ENDMETHOD.

  METHOD test_inline_declaration.

  ENDMETHOD.

ENDCLASS.
