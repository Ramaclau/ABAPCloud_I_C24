CLASS zcl_cp13_sql4 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_CP13_SQL4 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA lt_ddbb TYPE STANDARD TABLE OF zcarrier_957.

    SELECT FROM /dmo/i_carrier
        FIELDS AirlineID AS carrier_id,
               name,
               CurrencyCode AS currency_code
               INTO CORRESPONDING FIELDS OF TABLE @lt_ddbb.

    IF sy-subrc = 0.

      INSERT zcarrier_957 FROM TABLE @lt_ddbb ACCEPTING DUPLICATE KEYS.

      IF sy-subrc = 0.
        out->write( |The number of insert rows is : { sy-dbcnt }| ).
      ELSE.
        out->write( |The insert was not executed correctly: { sy-dbcnt }| ).
      ENDIF.

    ENDIF.

  ENDMETHOD.
ENDCLASS.
