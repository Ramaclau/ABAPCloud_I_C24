CLASS zcl_cp12_dyn_cache DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_CP12_DYN_CACHE IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    GET TIME STAMP FIELD DATA(lv_timestamp_begin).

    SELECT FROM zinvoice_957
        FIELDS comp, currency_key, SUM( amount ) AS totalamount
        GROUP BY comp, currency_key
        ORDER BY comp, currency_key
        INTO TABLE @DATA(lt_invoice).

    IF sy-subrc = 0.
      GET TIME STAMP FIELD DATA(lv_timestamp_end).

      DATA(lv_dif_second) = cl_abap_tstmp=>subtract( EXPORTING
          tstmp1 = lv_timestamp_end
          tstmp2 = lv_timestamp_begin ).

      out->write( |Number of records: { lines( lt_invoice ) }| ).

      out->write( lt_invoice ).

      out->write( |Total execution time: { lv_dif_second }| ).

    ENDIF.

  ENDMETHOD.
ENDCLASS.
