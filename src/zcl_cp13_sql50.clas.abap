CLASS zcl_cp13_sql50 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .
  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun .

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_cp13_sql50 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    SELECT FROM zdatasource_1 AS ds1
           LEFT JOIN zdatasource_2 AS ds2 ON ds1~id EQ ds2~id
           FIELDS ds1~id AS id1,
                  ds2~id AS id2,
                  ds1~name1,
                  ds2~name2,
                  ds1~datasource1,
                  ds2~datasource2
           INTO TABLE @DATA(lt_result).

    IF sy-subrc = 0.
      out->write( lt_result ).
    ENDIF.

  ENDMETHOD.
ENDCLASS.
