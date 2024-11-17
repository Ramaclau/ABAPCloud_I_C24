CLASS zcl_insert_univ_957 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_INSERT_UNIV_957 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.



    DELETE FROM zuniversity_957.
    MODIFY zuniversity_957 FROM TABLE @( VALUE #( ( soc          = '1000'
                                                    exercise     = 1050
                                                    course_price = 150
                                                    currency     = 'USD'
                                                    courses      = 123
                                                    unit         = 1
                                                    student_id   = '100'
                                                    first_name   = 'Claudio'
                                                    last_name    = 'Perez'
                                                    course_code  = '01' )

                                                  ( soc          = '2000'
                                                    exercise     = 1055
                                                    course_price = 120
                                                    currency     = 'USD'
                                                    courses      = 123
                                                    unit         = 1
                                                    student_id   = '110'
                                                    first_name   = 'Rosa'
                                                    last_name    = 'Garcia'
                                                    course_code  = '01' )

                                                  ( soc          = '3000'
                                                    exercise     = 1055
                                                    course_price = 120
                                                    currency     = 'USD'
                                                    courses      = 121
                                                    unit         = 1
                                                    student_id   = '111'
                                                    first_name   = 'Pepe'
                                                    last_name    = 'Gomez'
                                                    course_code  = '03' )

                                                  ( soc          = '43000'
                                                    exercise     = 1055
                                                    course_price = 140
                                                    currency     = 'USD'
                                                    courses      = 122
                                                    unit         = 1
                                                    student_id   = '112'
                                                    first_name   = 'Amalia'
                                                    last_name    = 'Martonez'
                                                    course_code  = '02' )

                                                  ( soc          = '4000'
                                                    exercise     = 1055
                                                    course_price = 120
                                                    currency     = 'USD'
                                                    courses      = 121
                                                    unit         = 1
                                                    student_id   = '112'
                                                    first_name   = 'Rene'
                                                    last_name    = 'Lopez'
                                                    course_code  = '02' )
                                                     ) ).

    IF sy-subrc = 0.
      out->write( |{ sy-dbcnt } rows affected| ).
    ENDIF.


  ENDMETHOD.
ENDCLASS.
