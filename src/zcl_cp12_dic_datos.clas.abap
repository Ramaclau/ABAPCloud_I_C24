CLASS zcl_cp12_dic_datos DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun.

    TYPES: BEGIN OF ty_employee,
             employee_id TYPE c LENGTH 10,
             first_name  TYPE zde_first_name_cp,
             last_name   TYPE zde_last_name_cl,
             start_date  TYPE zde_start_date_cp,
             category    TYPE zde_job_category_cp.
             INCLUDE TYPE zst_emp_address_cp.
    TYPES: END OF ty_employee.

    TYPES: BEGIN OF ty_employee2,
             employee_id TYPE c LENGTH 10,
             first_name  TYPE zde_first_name_cp,
             last_name   TYPE zde_last_name_cl,
             start_date  TYPE zde_start_date_cp,
             category    TYPE zde_job_category_cp,
             address     TYPE zst_emp_address_cp,
           END OF ty_employee2.

    TYPES: BEGIN OF ty_employee_s,
             employee_id TYPE c LENGTH 10,
             first_name  TYPE zde_first_name_cp,
             last_name   TYPE zde_last_name_cl,
             start_date  TYPE zde_start_date_cp,
             category    TYPE zde_job_category_cp,
             status      TYPE c LENGTH 1.
             INCLUDE TYPE zst_emp_address_cp.
    TYPES: END OF ty_employee_s.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_CP12_DIC_DATOS IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA lv_first_name TYPE zde_first_name_cp.

    lv_first_name = 'First Name'.

    DATA ls_employee TYPE zst_employees_cp.

    ls_employee-address-address_id = '001'.
    ls_employee-first_name         = 'Claudio'.

    DATA ls_g_employee TYPE zst_employees_i_cp.

    ls_g_employee-address-address_id = '004'.
    ls_g_employee-address_id         = '005'.

    out->write( ls_g_employee-address-address_id ).
    out->write( ls_g_employee-address_id ).

    DATA lsl_employee TYPE ty_employee.
    lsl_employee-address_id = '006'.

    DATA lsl_employee2 TYPE ty_employee2.
    lsl_employee2-address-address_id = '007'.

    DATA: lt_employee_address TYPE ztt_emp_address_cp,
          ls_employee_address TYPE zst_emp_address_cp.

    lt_employee_address[ 1 ]-address_id = ''.

    ls_employee_address-address_id = '0001'.
    APPEND ls_g_employee TO lt_employee_address.

    DATA ls_employee_deep TYPE zst_employ_cp.

    ls_employee_deep-address[ 1 ]-address_id = '001'.

    TYPES: tt_employees_s TYPE SORTED TABLE OF ty_employee_s WITH UNIQUE KEY employee_id
                         WITH NON-UNIQUE SORTED KEY cat_status COMPONENTS category status
                         "WITH FURTHER SECONDARY KEYS INITIAL SIZE 50
                         .

    DATA gt_employee_s TYPE tt_employees_s.

    data gt_employee_d TYPE ZTT_EMPLOYEES_STATUS_CP.

    LOOP AT gt_employee_s ASSIGNING FIELD-SYMBOL(<gfs_employee>)
        WHERE employee_id BETWEEN '0000000001' AND '0000000100'.

    ENDLOOP.

    LOOP AT gt_employee_s ASSIGNING FIELD-SYMBOL(<gfs_employee_sec>)
        USING KEY cat_status
        WHERE category = '01'
          AND status   = 'A'.

    ENDLOOP.

    TRY.
        DATA(gs_employee_s) = gt_employee_s[ KEY cat_status COMPONENTS category = '01' status   = 'A' ].

      CATCH cx_sy_itab_line_not_found INTO DATA(lv_error).
    ENDTRY.

    DATA lt_employees_nested TYPE ZTT_EMPLOYEES_NESTED_CP.

    LOOP AT lt_employees_nested ASSIGNING FIELD-SYMBOL(<lfs_employees_nested>).

        DATA(ls_first_address) = value #( <lfs_employees_nested>-address[ 1 ] OPTIONAL ).

        LOOP AT <lfs_employees_nested>-address ASSIGNING FIELD-SYMBOL(<lsf_address>).

            <lsf_address>-address_id = ''.
         ENDLOOP.

    ENDLOOP.





  ENDMETHOD.
ENDCLASS.
