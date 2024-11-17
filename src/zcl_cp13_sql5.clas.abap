CLASS zcl_cp13_sql5 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_CP13_SQL5 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA ls_airline type zcarrier_957.

    "modifica directamente el campo
*    SELECT single from zcarrier_957
*        FIELDS *
*        WHERE carrier_id = 'AA'
*        into @ls_airline.
*
*    if sy-subrc = 0.
*        out->write( |Current Currency: { ls_airline-currency_code }| ).
*    ENDIF.
*
*    ls_airline-currency_code = 'EUR'.

    "se debe modificar cada campo que no es llave sino lo deja vacio
    ls_airline = value #( carrier_id    = 'AA'
                          name          = 'LATAM'
                          currency_code = 'CLP' ).

    UPDATE zcarrier_957 from @ls_airline.

    if sy-subrc = 0.
        out->write( |Current Currency: { ls_airline-currency_code }| ).
    ENDIF.



  ENDMETHOD.
ENDCLASS.
