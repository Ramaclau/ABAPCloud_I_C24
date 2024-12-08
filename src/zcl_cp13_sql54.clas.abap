CLASS zcl_cp13_sql54 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
    INTERFACES if_amdp_marker_hdb.

    TYPES: begin of ty_structure,
            id1         TYPE c LENGTH 2,
            id2         TYPE c LENGTH 2,
            name1       TYPE c LENGTH 10,
            name2       TYPE c LENGTH 10,
            datasource1 TYPE c LENGTH 15,
            datasource2 TYPE c LENGTH 15,
           end of ty_structure,
           ty_table type TABLE of ty_structure.

    class-METHODS get_full_join AMDP OPTIONS CDS SESSION CLIENT DEPENDENT
       EXPORTING VALUE(st_result) type ty_table.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_cp13_sql54 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.



  ENDMETHOD.

  METHOD get_full_join.
*    BY DATABASE PROCEDURE FOR HDB
*                       LANGUAGE SQLSCRIPT
*                       OPTIONS READ-ONLY
*                       USING z_i_datasource1
*                             zdatasource_2.

  ENDMETHOD.

ENDCLASS.
