CLASS zcl_work_order_data_426 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_work_order_data_426 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

*    MODIFY ztcustomer_426 FROM TABLE @( VALUE #( ( customer_id  = '00000001'
*                                                   name         = 'American Airline'
*                                                   address      = 'Fourth Avenue T/5'
*                                                   phone        = '562 255721925' )
*                                                 ( customer_id  = '00000002'
*                                                   name         = 'British Airways'
*                                                   address      = 'Park Avenue 123'
*                                                   phone        = '562 259912872' )
*                                                 ( customer_id  = '00000003'
*                                                   name         = 'Delta Air Lines'
*                                                   address      = 'New Avenue 5676'
*                                                   phone        = '562 259786555' )
*                                                 ( customer_id  = '00000004'
*                                                   name         = 'Deutsche Lufthansa'
*                                                   address      = 'DW Center 2345 OF.12'
*                                                   phone        = '562 232256736' )  ) ).
*
*    IF sy-subrc EQ 0.
*      out->write( 'ok' ).
*    ENDIF.
*
*    MODIFY zttechnician_426 FROM TABLE @( VALUE #( ( technician_id = '90010016'
*                                                     name          = 'Robert Smith'
*                                                     specialty     = 'Refrigeration' )
*                                                   ( technician_id = '90010017'
*                                                     name          = 'Jhon Lex'
*                                                     specialty     = 'Refrigeration' )
*                                                   ( technician_id = '90010018'
*                                                     name          = 'Peter Floid'
*                                                     specialty     = 'Electronics' )
*                                                   ( technician_id = '90010019'
*                                                     name          = 'Tony Stan'
*                                                     specialty     = 'Electric' )
*                                                                                          ) ).
*
*    IF sy-subrc EQ 0.
*      out->write( 'ok' ).
*    ENDIF.

*    MODIFY ztworkord_hi_426 FROM TABLE @( VALUE #( ( history_id         = '000000000001'
*                                                     work_order_id      = '0000112236'
*                                                     modification_date  = cl_abap_context_info=>get_system_date(  )
*                                                     change_description = 'Refrigerante motor' )
*                                                   ( history_id         = '000000000002'
*                                                     work_order_id      = '0000112237'
*                                                     modification_date  = cl_abap_context_info=>get_system_date(  )
*                                                     change_description = 'Refrigerante motor' )
*                                                   ( history_id         = '000000000003'
*                                                     work_order_id      = '0000112240'
*                                                     modification_date  = cl_abap_context_info=>get_system_date(  )
*                                                     change_description = 'Ventanas' )
*                                                                                          ) ).
*
*    IF sy-subrc EQ 0.
*      out->write( 'ok' ).
*    ENDIF.

    MODIFY ztwork_order_426 FROM TABLE @( VALUE #( ( work_order_id = '0000112240'
                                                   customer_id     = '00000001'
                                                   technician_id   = '90010016'
                                                   creation_date   = cl_abap_context_info=>get_system_date(  )
                                                   status          = 'PE'
                                                   priority        = 'A'
                                                   description     = 'Orden' )
                                                 ( work_order_id = '0000112241'
                                                   customer_id     = '00000001'
                                                   technician_id   = '90010016'
                                                   creation_date   = cl_abap_context_info=>get_system_date(  )
                                                   status          = 'PE'
                                                   priority        = 'A'
                                                   description     = 'Orden' )
                                                 ( work_order_id = '0000112242'
                                                   customer_id     = '00000001'
                                                   technician_id   = '90010016'
                                                   creation_date   = cl_abap_context_info=>get_system_date(  )
                                                   status          = 'PE'
                                                   priority        = 'A'
                                                   description     = 'Orden' )
                                                 ( work_order_id = '0000112243'
                                                   customer_id     = '00000001'
                                                   technician_id   = '90010016'
                                                   creation_date   = cl_abap_context_info=>get_system_date(  )
                                                   status          = 'PE'
                                                   priority        = 'A'
                                                   description     = 'Orden' )
                                                 ( work_order_id = '0000112244'
                                                   customer_id     = '00000001'
                                                   technician_id   = '90010016'
                                                   creation_date   = cl_abap_context_info=>get_system_date(  )
                                                   status          = 'PE'
                                                   priority        = 'A'
                                                   description     = 'Orden' )
                                                 ( work_order_id = '0000112245'
                                                   customer_id     = '00000001'
                                                   technician_id   = '90010016'
                                                   creation_date   = cl_abap_context_info=>get_system_date(  )
                                                   status          = 'PE'
                                                   priority        = 'A'
                                                   description     = 'Orden' )
                                                 ( work_order_id = '0000112246'
                                                   customer_id     = '00000001'
                                                   technician_id   = '90010016'
                                                   creation_date   = cl_abap_context_info=>get_system_date(  )
                                                   status          = 'PE'
                                                   priority        = 'A'
                                                   description     = 'Orden' )
                                                 ( work_order_id = '0000112247'
                                                   customer_id     = '00000001'
                                                   technician_id   = '90010016'
                                                   creation_date   = cl_abap_context_info=>get_system_date(  )
                                                   status          = 'PE'
                                                   priority        = 'A'
                                                   description     = 'Orden' )
                                                                      ) ).

    IF sy-subrc EQ 0.
      out->write( 'ok' ).
    ENDIF.


  ENDMETHOD.
ENDCLASS.
