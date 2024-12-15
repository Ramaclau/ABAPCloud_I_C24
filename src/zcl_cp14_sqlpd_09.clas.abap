CLASS zcl_cp14_sqlpd_09 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_cp14_sqlpd_09 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    TRY.
        SELECT FROM zinvoice_957
            FIELDS *
            %_HINTS HDB 'INDEX_SEARCH'
            INTO TABLE @FINAL(lt_invoice)
            UP TO 100 ROWS.

      CATCH cx_sy_open_sql_db INTO DATA(lx_sql_db).
        out->write( lx_sql_db->get_text(  ) ).
    ENDTRY.

    IF sy-subrc EQ 0.
      out->write( lt_invoice ).
    ENDIF.







  ENDMETHOD.
ENDCLASS.
