CLASS ltcl_pw_policy DEFINITION FINAL FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.
    DATA: pw TYPE REF TO zpw_policy.
    METHODS:
      get_min_1to3 FOR TESTING RAISING cx_static_check,
      get_max_1to3 FOR TESTING RAISING cx_static_check,
      get_letter_a FOR TESTING RAISING cx_static_check,
      get_pw FOR TESTING RAISING cx_static_check,
      check_pw_policy_false FOR TESTING RAISING cx_static_check,
      check_pw_policy_true FOR TESTING RAISING cx_static_check,
      count_valid FOR TESTING RAISING cx_static_check,
    check_pos_valid FOR TESTING RAISING cx_static_check,
      setup.
ENDCLASS.


CLASS ltcl_pw_policy IMPLEMENTATION.
  METHOD setup.
    pw = NEW zpw_policy( ).
  ENDMETHOD.

  METHOD get_max_1to3.
    DATA(max) = pw->get_max( '1-3 a: abcde' ).
    cl_abap_unit_assert=>assert_equals( msg = '1-3 a: abcde --> 3' exp = 3 act = max ).
  ENDMETHOD.

  METHOD get_min_1to3.
    DATA(min) = pw->get_min( '1-3 a: abcde' ).
    cl_abap_unit_assert=>assert_equals( msg = '1-3 a: abcde -> 1' exp = 1 act = min ).
  ENDMETHOD.

  METHOD get_letter_a.
    DATA(letter) = pw->get_letter( '1-3 a: abcde' ).
    cl_abap_unit_assert=>assert_equals( msg = '1-3 a: abcde' exp = |a| act = letter ).
  ENDMETHOD.

  METHOD get_pw.
    DATA(password) = pw->get_pw( '1-3 a: abcde' ).
    cl_abap_unit_assert=>assert_equals( msg = '1-3 a: abcde' exp = |abcde| act = password ).
  ENDMETHOD.

  METHOD check_pw_policy_true.
    DATA(result) = pw->check_count( '1-3 a: abcde' ).
    cl_abap_unit_assert=>assert_equals( msg = '1-3 a: abcde -> abap_true' exp = abap_true act = result ).
  ENDMETHOD.

  METHOD check_pw_policy_false.
    DATA(result) = pw->check_count( '1-3 f: abcde' ).
    cl_abap_unit_assert=>assert_equals( msg = '1-3 f: abcde -> abap_false' exp = abap_false act = result ).
  ENDMETHOD.

  METHOD check_pos_valid.

    data(result) = pw->check_pos( '1-3 a: abcde' ).
    cl_abap_unit_assert=>assert_equals( msg = '1-3 a: abcde -> abap_true' exp = abap_true act = result ).
  ENDMETHOD.

  METHOD count_valid.
    DATA(policy_list) = |1-3 a: abcde\n1-3 b: cdefg\n2-9 c: ccccccccc|.
    DATA(result) = pw->count_valid_count( policy_list ).
    cl_abap_unit_assert=>assert_equals( msg = '2 valid passwords' exp = 2 act = result ).
  ENDMETHOD.

ENDCLASS.
