CLASS zcl_cp11_secondkey DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun .
    METHODS constructor.
    METHODS read_primary.
    METHODS read_non_key.
    METHODS read_secondary_1.
    METHODS read_secondary_2.
    METHODS read_secondary_3.
  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA: lt_sort          TYPE SORTED TABLE OF /dmo/booking_m WITH NON-UNIQUE KEY travel_id booking_id booking_date,
          lt_sort_with_key TYPE SORTED TABLE OF /dmo/booking_m WITH NON-UNIQUE KEY travel_id booking_id booking_date
                             WITH NON-UNIQUE SORTED KEY sk_carrier COMPONENTS carrier_id.
ENDCLASS.

CLASS zcl_cp11_secondkey IMPLEMENTATION.

  METHOD constructor.

    SELECT FROM /dmo/booking_m
        FIELDS *
        INTO TABLE @lt_sort.

    SELECT FROM /dmo/booking_m
        FIELDS *
        INTO TABLE @lt_sort_with_key.

  ENDMETHOD.

  METHOD read_non_key.

    DATA(ls_flight_without_key) = lt_sort[ flight_date = '20240810' ].

  ENDMETHOD.

  METHOD read_primary.

    DATA(ls_flight) = lt_sort[ travel_id    = '00000003'
                               booking_id   = '0002'
                               booking_date = '20240721' ].

  ENDMETHOD.

  METHOD read_secondary_1.

    DATA(ls_scnd_key1) = lt_sort_with_key[ KEY sk_carrier carrier_id = 'AA' ]. " usando 1ra vez clave secundaria

  ENDMETHOD.

  METHOD read_secondary_2.

    DATA(ls_scnd_key2) = lt_sort_with_key[ KEY sk_carrier carrier_id = 'AA' ]. " usando 1ra vez clave secundaria

  ENDMETHOD.

  METHOD read_secondary_3.

    DATA(ls_scnd_key3) = lt_sort_with_key[ KEY sk_carrier carrier_id = 'AA' ]. " usando 1ra vez clave secundaria

  ENDMETHOD.

  METHOD if_oo_adt_classrun~main.

    DATA(object) = NEW zcl_cp11_secondkey(  ).

    object->read_non_key(  ).
    object->read_primary(  ).
    object->read_secondary_1(  ).
    object->read_secondary_2(  ).
    object->read_secondary_3(  ).

    out->write( 'OK' ).

  ENDMETHOD.



ENDCLASS.
