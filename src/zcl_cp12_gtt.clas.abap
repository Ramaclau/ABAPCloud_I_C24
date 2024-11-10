CLASS zcl_cp12_gtt DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_cp12_gtt IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

*    data lt_emoloyee TYPE STANDARD TABLE OF zemp_957.

    INSERT zemp_957 FROM TABLE @( VALUE #( ( emp_id     = '00001'
                                             first_name = 'John'
                                             last_name  = 'Smith' ) ) ).

    SELECT FROM zemp_957
        FIELDS *
        INTO TABLE @DATA(lt_employees).

    IF sy-subrc = 0.
      out->write( lt_employees ).
    ELSE.
      out->write( 'No data' ).
    ENDIF.

    DELETE FROM zemp_957.
    COMMIT WORK.
    ROLLBACK WORK.


  ENDMETHOD.
ENDCLASS.
