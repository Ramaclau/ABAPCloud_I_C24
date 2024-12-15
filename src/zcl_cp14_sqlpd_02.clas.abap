CLASS zcl_cp14_sqlpd_02 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun .

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_cp14_sqlpd_02 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    SELECT FROM /dmo/I_Customer
        FIELDS CustomerID, FirstName, LastName, PhoneNumber, EMailAddress
        INTO TABLE @DATA(lt_customers)
        UP TO 10 ROWS.

    IF sy-subrc EQ 0.
      out->write( lt_customers ).
    ELSE.
      out->write( 'No data available' ).
    ENDIF.





  ENDMETHOD.
ENDCLASS.
