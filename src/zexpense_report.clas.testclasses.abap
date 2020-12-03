CLASS ltcl_expense_report DEFINITION FINAL FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.
    DATA input_values TYPE zexpense_report=>in_type.
    DATA: expense_report TYPE REF TO zexpense_report.
    METHODS:
      test_514579 FOR TESTING RAISING cx_static_check,
      test_241861950 FOR TESTING RAISING cx_static_check,
      setup.
ENDCLASS.


CLASS ltcl_expense_report IMPLEMENTATION.

  METHOD test_514579.
    input_values = VALUE #(
      ( 1721 )
      ( 979 )
      ( 366 )
      ( 299 )
      ( 675 )
      ( 1456 ) ).
    DATA(result) = expense_report->add_2for_2020( input_values = input_values ).
    cl_abap_unit_assert=>assert_equals( msg = '1721 * 299 = 514579' exp = 514579 act = result ).
  ENDMETHOD.

  METHOD test_241861950.
    input_values = VALUE #(
      ( 1721 )
      ( 979 )
      ( 366 )
      ( 299 )
      ( 675 )
      ( 1456 ) ).
    DATA(result) = expense_report->add_3for_2020( input_values = input_values ).
    cl_abap_unit_assert=>assert_equals( msg = '979 * 366 * 675 = 241861950' exp = 241861950 act = result ).
  ENDMETHOD.


  METHOD setup.
    expense_report = NEW zexpense_report( ).
  ENDMETHOD.

ENDCLASS.
