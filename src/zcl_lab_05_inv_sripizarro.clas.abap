CLASS zcl_lab_05_inv_sripizarro DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_lab_05_inv_sripizarro IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

*1. OVERLAY
    DATA(lv_sale)        = 'Purchase Completed'.
    DATA(lv_sale_status) = 'Invoice'.

    OVERLAY lv_sale WITH lv_sale_status.
    out->write( lv_sale ).

*2. Función SUBSTRING
    DATA(LV_RESULT) = 'SAP-ABAP-32-PE'.
    out->write( LV_RESULT ).

    LV_RESULT = substring( val = LV_RESULT off = 9  len = 5 ).
    out->write( LV_RESULT ).

*3. FIND
    DATA(LV_STATUS) = 'INVOICE GENERATED SUCCESSFULLY'.
    DATA LV_COUNT TYPE i.

    LV_COUNT = find_any_of( val = LV_STATUS sub = 'GEN' ).
    out->write( LV_COUNT ).

    FIND ALL OCCURRENCES OF 'A' IN LV_STATUS MATCH COUNT LV_COUNT.
    out->write( LV_COUNT ).

*4. REPLACE
    DATA(LV_REQUEST) = '^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,4})$'.
    DATA(LV_EMAIL)   = 'cpizarro@logali.com'.

    FIND PCRE LV_REQUEST IN LV_EMAIL.

    IF sy-subrc = 0.
      out->write( 'OK' ).
    ELSE.
      out->write( 'NO OK' ).
    ENDIF.

*6. Expresiones regulares
    DATA(LV_IDCUSTOME) = '0000012345'.
    DATA(LV_REGEX) = '0*'.
    REPLACE ALL OCCURRENCES OF PCRE LV_REGEX IN LV_IDCUSTOME WITH ||.
    out->write( LV_IDCUSTOME ).

*7. Repetición de strings
    LV_IDCUSTOME = repeat( val = '1' occ = 3 ).
    out->write( LV_IDCUSTOME ).

*8. Función ESCAPE
    DATA(LV_FORMAT) = 'Send payment data via Internet'.
    DATA(LV_URL)    = LV_FORMAT && ' @300'.
    DATA(LV_JSON)   = LV_FORMAT && ' \ Academy @300'.
    DATA(LV_TPL)    = LV_FORMAT && ' |, \, {, }'.

    "URL
    LV_URL = escape( val = LV_URL format = cl_abap_format=>e_url_full ).
    out->write( LV_URL ).

    "JSON
    LV_JSON = escape( val = LV_JSON format = cl_abap_format=>e_json_string ).
    out->write( LV_JSON ).

    "STRING TEMPLATE
    LV_TPL = escape( val = LV_TPL format = cl_abap_format=>e_string_tpl ).
    out->write( LV_TPL ).



  ENDMETHOD.
ENDCLASS.
