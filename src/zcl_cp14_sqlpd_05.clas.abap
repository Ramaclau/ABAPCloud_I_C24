CLASS zcl_cp14_sqlpd_05 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun .

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_cp14_sqlpd_05 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    TRY.
        DATA(lo_ramdom) = cl_abap_random_int=>create(
          EXPORTING
            seed = CONV i( cl_abap_context_info=>get_system_time(  ) )
            min  = 1
            max  = 1000
        ).
      CATCH cx_abap_random INTO DATA(lx_ramdom).
        out->write( lx_ramdom->get_text( ) ).
        RETURN.
    ENDTRY.

    MODIFY zdemo_exp_957 from table @( value #(
                               for i = 0 until i > 9 ( id   = i
                                                       num1 = lo_ramdom->get_next(  )
                                                       num2 = lo_ramdom->get_next(  ) ) ) ).

    SELECT from zdemo_exp_957
        FIELDS num1,
               num2,
               case
                 when num1 < 50 and num2 < 50 then 'Both lowe then 50'
                 when num1 < 50 and num2 < 50 then 'Both hegher then 50'
                 when num1 < 50 and num2 < 50 then 'Both Equal 50'
                 else 'Others Case 1'
               end as ColumnCase1,
               case num1
                 when 10 then 'Value is 10'
                 when 20 then 'Value is 200'
                 else 'DiFferent then 10 or 20'
               end as ColumnCase2,
               case
                 when num1 < 50 and num2 < 50 then case num1
                                                     when 10 then 'Value is 10'
                                                     when 20 then 'Value is 200'
                                                     else 'DiFferent then 10 or 20'
                                                     end
                 when num1 < 50 and num2 < 50 then 'Both hegher then 50'
                 when num1 < 50 and num2 < 50 then 'Both Equal 50'
                 else 'Others Case 3'
               end as ColumnCase3
        order by ColumnCase1
        into table @DATA(lt_results).

    if sy-subrc eq 0.
        out->write( lt_results ).
    ENDIF.



  ENDMETHOD.
ENDCLASS.
