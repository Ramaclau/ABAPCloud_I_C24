CLASS zcl_cp14_sqlpd_13 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_cp14_sqlpd_13 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    DELETE FROM ztree_957.
    INSERT ztree_957 FROM TABLE @( VALUE #(
           ( id = 1  parent_id = 0  name = 'AA' )
           ( id = 2  parent_id = 1  name = 'AA-AA' )
           ( id = 3  parent_id = 2  name = 'AA-AA-AA' )
           ( id = 4  parent_id = 2  name = 'AA-AA-BB' )
*           ( id = 4  parent_id = 5  name = 'AA-AA-BB--5' )
*           ( id = 4  parent_id = 21 name = 'AA-AA-BB--21' )
           ( id = 5  parent_id = 1  name = 'AA-BB' )
           ( id = 6  parent_id = 5  name = 'AA-BB-AA' )
           ( id = 7  parent_id = 6  name = 'AA-BB-AA-AA' )
*           ( id = '' parent_id = 6  name = 'AA-BB-AA-AB' )
*           ( id = 9  parent_id = 25 name = 'AA-BB-BB' )
           ( id = 10 parent_id = 9  name = 'AA-BB-BB-AA' )
*           ( id = 11 parent_id = 31 name = 'AA-CC' )
           ( id = 12 parent_id = 0  name = 'BB' )
           ( id = 13 parent_id = 0  name = 'CC' )
           ( id = 14 parent_id = 13 name = 'CC-AA' )
           ( id = 15 parent_id = 14 name = 'CC-AA-AA' )
           ( id = 16 parent_id = 14 name = 'CC-AA-BB' ) ) ).

    TRY.
        SELECT FROM HIERARCHY( SOURCE zcds_01_tree_957
                               CHILD TO PARENT ASSOCIATION _tree
                               START WHERE id = 1
                               SIBLINGS ORDER BY id ASCENDING
                               DEPTH 1 ) "4.4. Profundidad
                    FIELDS id,
                           ParentId,
                           name
                    INTO TABLE @DATA(lt_results).

      CATCH cx_sy_open_sql_db INTO DATA(lx_sql_db).
        out->write( lx_sql_db->get_text(  ) ).
        RETURN.
    ENDTRY.

    CHECK lt_results is not INITIAL.
    out->write( lt_results ).

  ENDMETHOD.
ENDCLASS.
