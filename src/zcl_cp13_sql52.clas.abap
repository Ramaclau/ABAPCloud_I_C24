CLASS zcl_cp13_sql52 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .
  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun .

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_cp13_sql52 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    SELECT FROM zdatasource_1 AS ds1
        FIELDS *
        WHERE ds1~id NOT IN ( SELECT FROM zdatasource_2 AS ds2
                                    FIELDS id
                                    WHERE ds1~id EQ ds2~id )
        INTO TABLE @DATA(lt_results_left).

    IF sy-subrc EQ 0.
      out->write( lt_results_left ).
    ENDIF.

    SELECT FROM zdatasource_2 AS ds2
        FIELDS *
        WHERE ds2~id NOT IN ( SELECT FROM zdatasource_1 AS ds1
                                    FIELDS id
                                    WHERE ds1~id EQ ds2~id )
        INTO TABLE @DATA(lt_results_right).

    IF sy-subrc EQ 0.
      out->write( lt_results_right ).
    ENDIF.





  ENDMETHOD.
ENDCLASS.
