CLASS zcl_cp11_sortvhash DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
    METHODS constructor.
    METHODS standar.
    METHODS sort.
    METHODS hash.

  PROTECTED SECTION.
  PRIVATE SECTION.

    DATA: lt_standar TYPE STANDARD TABLE OF /dmo/booking_m WITH NON-UNIQUE KEY travel_id booking_id booking_date,
          lt_sort    TYPE SORTED TABLE OF /dmo/booking_m WITH NON-UNIQUE KEY travel_id booking_id booking_date,
          lt_hash    TYPE HASHED TABLE OF /dmo/booking_m WITH UNIQUE KEY travel_id booking_id booking_date.

    DATA: key_travel_id  TYPE /dmo/travel_id,
          key_booking_id TYPE /dmo/booking_id,
          key_date       TYPE /dmo/booking_date.

    METHODS set_line_to_read.

ENDCLASS.

CLASS ZCL_CP11_SORTVHASH IMPLEMENTATION.

  METHOD constructor.

    SELECT FROM /dmo/booking_m
        FIELDS *
        INTO TABLE @lt_standar.

    SELECT FROM /dmo/booking_m
        FIELDS *
        INTO TABLE @lt_sort.

    SELECT FROM /dmo/booking_m
        FIELDS *
        INTO TABLE @lt_hash.

    set_line_to_read(  ).

  ENDMETHOD.

  METHOD hash.
    DATA(lv_result) = lt_hash[ travel_id    = me->key_travel_id
                               booking_id   = me->key_booking_id
                               booking_date = me->key_date ].
  ENDMETHOD.

  METHOD if_oo_adt_classrun~main.

    DATA(lo_flights) = NEW zcl_cp11_sortvhash(  ).

    lo_flights->standar(  ).
    lo_flights->sort(  ).
    lo_flights->hash(  ).

    out->write( me->key_travel_id ).
    out->write( me->key_booking_id ).
    out->write( me->key_date ).

  ENDMETHOD.

  METHOD set_line_to_read.
    DATA(lv_data) = lt_standar[ conv i( lines( lt_standar ) * '0.65' ) ].
    me->key_travel_id  = lv_data-travel_id.
    me->key_booking_id = lv_data-booking_id.
    me->key_date       = lv_data-booking_date.
  ENDMETHOD.

  METHOD sort.
    DATA(lv_result) = lt_sort[ travel_id    = me->key_travel_id
                               booking_id   = me->key_booking_id
                               booking_date = me->key_date ].
  ENDMETHOD.

  METHOD standar.
    DATA(lv_result) = lt_standar[ travel_id    = me->key_travel_id
                                  booking_id   = me->key_booking_id
                                  booking_date = me->key_date ].
  ENDMETHOD.
ENDCLASS.
