CLASS zcl_cp14_sqlpd_21 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_cp14_sqlpd_21 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    SELECT SINGLE from zdemo_exp_957
        FIELDS abap_system_timezone( on_error = @sql_abap_system_timezone=>set_to_null ) as system_tz,
               abap_user_timezone( on_error = @sql_abap_user_timezone=>set_to_null ) as user_tz
        into @data(ls_result).

    if sy-subrc eq 0.
      out->write( ls_result ).
    endif.

  ENDMETHOD.
ENDCLASS.
