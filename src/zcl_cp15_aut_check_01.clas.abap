CLASS zcl_cp15_aut_check_01 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .
  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun .

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_cp15_aut_check_01 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    DATA lv_country_code TYPE land1 VALUE 'EN'.
    data lv_company_code TYPE c LENGTH 4 value '0001'.

    AUTHORITY-CHECK OBJECT 'ZOA_BLL957'
        ID 'ZAF_CCO957' FIELD lv_country_code
        ID 'ACTVT'      FIELD '01'.

*    AUTHORITY-CHECK OBJECT '/DMO/TRVL'
*        ID '/DMO/CNTRY' FIELD lv_country_code
*        ID 'ACTVT'      FIELD '01'.

    DATA(lv_created_granted) = COND #( WHEN sy-subrc EQ 0 THEN abap_true
                                                          ELSE abap_false ).

    IF lv_created_granted EQ abap_true.
      out->write( |You have authorization to use the country code { lv_company_code }| ).
    ELSE.
      out->write( |You DON'T have authorization to use the country code { lv_company_code }| ).
    ENDIF.


  ENDMETHOD.

ENDCLASS.
