CLASS ltcl_customs_declaration DEFINITION FINAL FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.
    DATA: customs TYPE REF TO zcustom.
    METHODS:
      answers_one_group FOR TESTING RAISING cx_static_check,
    answers_four_groups FOR TESTING RAISING cx_static_check,
    answers_anyone_groups FOR TESTING RAISING cx_static_check,
    answers_everyone_groups FOR TESTING RAISING cx_static_check,
    answers_everyone_3from1 FOR TESTING RAISING cx_static_check,
    answers_everyone_abcfrom3 FOR TESTING RAISING cx_static_check,
    answers_everyone_abac FOR TESTING RAISING cx_static_check,
      setup.
ENDCLASS.


CLASS ltcl_customs_declaration IMPLEMENTATION.

  METHOD answers_one_group.
    DATA(answers) =
      |abcx\n| &&
      |abcy\n| &&
      |abcz|.

    DATA(count) = customs->count_anyone( answers ).
    cl_abap_unit_assert=>assert_equals( msg = '6 q' exp = 6 act = count ).
  ENDMETHOD.

  METHOD answers_four_groups.
    DATA(answers) =
      |abc\n| &&
      |\n| &&
      |a\n| &&
      |b\n| &&
      |c\n| &&
      |\n| &&
      |ab\n| &&
      |ac\n| &&
      |\n| &&
      |a\n| &&
      |a\n| &&
      |a\n| &&
      |a\n| &&
      |\n| &&
      |b\n|.

    DATA(count) = customs->count_anyone( answers ).
    cl_abap_unit_assert=>assert_equals( msg = '4 groups = 3+3+3+1+1=11' exp = 11 act = count ).
  ENDMETHOD.

  METHOD answers_anyone_groups.
    DATA(answers) =
      |abc\n| &&
      |\n| &&
      |a\n| &&
      |b\n| &&
      |c\n| &&
      |\n| &&
      |ab\n| &&
      |ac\n| &&
      |\n| &&
      |a\n| &&
      |a\n| &&
      |a\n| &&
      |a\n| &&
      |\n| &&
      |b\n|.

    DATA(count) = customs->count_anyone( answers ).
    cl_abap_unit_assert=>assert_equals( msg = '4 groups = 3 + 3 + 3 + 1 + 1 = 11' exp = 11 act = count ).
  ENDMETHOD.

METHOD answers_everyone_groups.
    DATA(answers) =
      |abc\n| &&
      |\n| &&
      |a\n| &&
      |b\n| &&
      |c\n| &&
      |\n| &&
      |ab\n| &&
      |ac\n| &&
      |\n| &&
      |a\n| &&
      |a\n| &&
      |a\n| &&
      |a\n| &&
      |\n| &&
      |b\n|.

    DATA(count) = customs->count_everyone( answers ).
    cl_abap_unit_assert=>assert_equals( msg = '4 groups = 3 + 0 + 1 + 1 + 1 = 6' exp = 6 act = count ).
  ENDMETHOD.

METHOD answers_everyone_3from1.
    DATA(answers) = |abc|.

    DATA(count) = customs->count_everyone( answers ).
    cl_abap_unit_assert=>assert_equals( msg = 'abc = 3' exp = 3 act = count ).
  ENDMETHOD.

METHOD answers_everyone_abcfrom3.
    DATA(answers) =
      |ab\n| &&
      |ac|.

    DATA(count) = customs->count_everyone( answers ).
    cl_abap_unit_assert=>assert_equals( msg = 'ab ac = 1' exp = 1 act = count ).
  ENDMETHOD.

  METHOD answers_everyone_abac.
    DATA(answers) =
      |a\n| &&
      |b\n| &&
      |c|.

    DATA(count) = customs->count_everyone( answers ).
    cl_abap_unit_assert=>assert_equals( msg = 'a b c = 0' exp = 0 act = count ).
  ENDMETHOD.

  METHOD setup.

    customs = NEW zcustom( ).

  ENDMETHOD.

ENDCLASS.
