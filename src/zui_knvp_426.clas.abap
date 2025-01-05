CLASS zui_knvp_426 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zui_knvp_426 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

*    INSERT zknvp_ui426 FROM TABLE @( VALUE #( ( kunnr  = '762924773'
*                                                vkorg  = 'CL11'
*                                                vtweg  = 'C1'
*                                                parvw  = 'SG'
*                                                kunnr2 = '762924773' )
*                                              ( kunnr  = '762924773'
*                                                vkorg  = 'CL11'
*                                                vtweg  = 'C1'
*                                                parvw  = 'WE'
*                                                kunnr2 = '762924773' )
*                                              ( kunnr  = '762924773'
*                                                vkorg  = 'CL11'
*                                                vtweg  = 'C1'
*                                                parvw  = 'WE'
*                                                kunnr2 = '100838' )
*                                              ( kunnr  = '762924773'
*                                                vkorg  = 'CL11'
*                                                vtweg  = 'C1'
*                                                parvw  = 'WE'
*                                                kunnr2 = '100839' )
*                                              ( kunnr  = '762924773'
*                                                vkorg  = 'CL11'
*                                                vtweg  = 'C1'
*                                                parvw  = 'WE'
*                                                kunnr2 = '100840' )
*                                              ( kunnr  = '762924773'
*                                                vkorg  = 'CL11'
*                                                vtweg  = 'C1'
*                                                parvw  = 'WE'
*                                                kunnr2 = '100841' ) ) ).



    DATA: lv_cli_to TYPE C LENGTH 10,    " Cliente
          lv_dm_to  TYPE C LENGTH 10,    " DM
          lt_knvp   TYPE TABLE OF zknvp_ui426, " Tabla de relaciones de socios comerciales
          lv_valid  TYPE abap_bool.     " Validez

    lv_cli_to = '762924773'.  " Cliente (viene como parámetro)
    lv_dm_to = '100838'.  " DM (viene como parámetro)

    " Buscamos los DM del cliente
    SELECT FROM zknvp_ui426
      FIELDS *
      WHERE kunnr = @lv_cli_to
        AND parvw = 'WE' " DM
      INTO TABLE @lt_knvp.

    " Validar
    READ TABLE lt_knvp WITH KEY kunnr2 = lv_dm_to TRANSPORTING NO FIELDS.

    IF sy-subrc = 0.
      lv_valid = abap_true.
    ELSE.
      lv_valid = abap_false.
    ENDIF.

    " Mensaje validacion
    IF lv_valid = abap_false.
      OUT->WRITE( 'El destinatario de mercancías no pertenece al cliente.' ).
    ELSE.
      OUT->WRITE( 'El destinatario de mercancías es válido.' ).
    ENDIF.

  ENDMETHOD.
ENDCLASS.
