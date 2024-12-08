CLASS zcl_cp13_sql44 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun .

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_cp13_sql44 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    TRY.

        SELECT FROM /dmo/I_flight
            FIELDS *
            WHERE price = ( SELECT FROM /dmo/I_flight
                                FIELDS MIN( price ) )
            INTO TABLE @DATA(lt_flight_lowcost).

        IF sy-subrc = 0.
          out->write( lt_flight_lowcost ).
        ENDIF.

*  DO NOT USE

        SELECT FROM /dmo/I_flight
            FIELDS *
            WHERE AirlineID = ( SELECT FROM /dmo/I_Connection
                                FIELDS AirlineID
                                WHERE DepartureAirport = 'JFK' )
            INTO TABLE @DATA(lt_flight).

        IF sy-subrc = 0.
          out->write( lt_flight ).
        ENDIF.

      CATCH cx_sy_open_sql_db into data(lx_sql_db).
        out->write( lx_sql_db->get_text(  ) ).
    ENDTRY.

  ENDMETHOD.
ENDCLASS.
