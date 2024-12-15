CLASS zcl_cp13_sql54 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
    INTERFACES if_amdp_marker_hdb.

    TYPES: begin of ty_structure,
            id         TYPE c LENGTH 2,
*            id2         TYPE c LENGTH 2,
            name       TYPE c LENGTH 10,
*            name2       TYPE c LENGTH 10,
            datasource1 TYPE c LENGTH 15,
            datasource2 TYPE c LENGTH 15,
           end of ty_structure,
           ty_table type TABLE of ty_structure.

    class-METHODS get_full_join AMDP OPTIONS CDS SESSION CLIENT DEPENDENT
       EXPORTING VALUE(et_result) type ty_table.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_cp13_sql54 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    zcl_cp13_sql54=>get_full_join( IMPORTING et_result = data(lt_result) ).

    out->write( lt_result ).

  ENDMETHOD.

  METHOD get_full_join BY DATABASE PROCEDURE FOR HDB
                       LANGUAGE SQLSCRIPT
                       OPTIONS READ-ONLY
                       USING zdatasource1_957_i
                             zdatasource2_957_i.

    et_result = SELECT coalesce( ds1.id, ds2.id) as id,
                       coalesce( ds1.name1, ds2.name2) as name,
                       ds1.datasource1,
                       ds2.datasource2
                  from zdatasource1_957_i as ds1
                  full join zdatasource2_957_i as ds2 ON ds1.id = ds2.id
                  order BY id;

  ENDMETHOD.

ENDCLASS.
