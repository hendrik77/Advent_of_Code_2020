CLASS ltcl_boarding_pass DEFINITION FINAL FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.
    DATA: boarding_pass TYPE REF TO zboarding_pass.
    METHODS:
      row_fbfbbffrlr FOR TESTING RAISING cx_static_check,
      row_bfffbbfrrr FOR TESTING RAISING cx_static_check,
      column_fbfbbffrlr FOR TESTING RAISING cx_static_check,
      seat_fbfbbffrlr FOR TESTING RAISING cx_static_check,
      sanity_check FOR TESTING RAISING cx_static_check,
    seat_fffbbbfrrr FOR TESTING RAISING cx_static_check,
    seat_ffffffbrrr FOR TESTING RAISING cx_static_check,
    free_seat FOR TESTING RAISING cx_static_check.
    METHODS setup.
ENDCLASS.


CLASS ltcl_boarding_pass IMPLEMENTATION.

  METHOD row_fbfbbffrlr.
    DATA(row) = boarding_pass->get_row( |FBFBBFFRLR| ).
    cl_abap_unit_assert=>assert_equals( msg = 'FBFBBFFRLR row = 44' exp = 44 act = row ).
  ENDMETHOD.

  METHOD row_bfffbbfrrr.
    DATA(row) = boarding_pass->get_row( |BFFFBBFRRR| ).
    cl_abap_unit_assert=>assert_equals( msg = 'BFFFBBFRRR row = 70' exp = 70 act = row ).
  ENDMETHOD.

  METHOD column_fbfbbffrlr.
    DATA(column) = boarding_pass->get_column( |FBFBBFFRLR| ).
    cl_abap_unit_assert=>assert_equals( msg = 'FBFBBFFRLR col = 5' exp = 5 act = column ).
  ENDMETHOD.

  METHOD seat_fbfbbffrlr.
    DATA seat TYPE i.
    seat = boarding_pass->get_seat_id( seat = |FBFBBFFRLR| ).
    cl_abap_unit_assert=>assert_equals( msg = 'FBFBBFFRLR seat = 357' exp = 357 act = seat ).
  ENDMETHOD.

  METHOD seat_FFFBBBFRRR.
    DATA seat TYPE i.
    seat = boarding_pass->get_seat_id( seat = |FFFBBBFRRR| ).
    cl_abap_unit_assert=>assert_equals( msg = 'FFFBBBFRRR seat = 119' exp = 119 act = seat ).
  ENDMETHOD.

METHOD seat_FFFFFFBRRR.
    DATA seat TYPE i.
    seat = boarding_pass->get_seat_id( seat = |FFFFFFFLLR| ).
    cl_abap_unit_assert=>assert_equals( msg = 'FFFFFFFLLR seat = 1' exp = 1 act = seat ).
  ENDMETHOD.

  METHOD sanity_check.
    DATA(boarding_passes) =
      |BFFFBBFRRR\n| &&
      |FFFBBBFRRR\n| &&
      |BBFFBBFRLL|.

    DATA(seat_id) = boarding_pass->sanity_check( boarding_passes ).
    cl_abap_unit_assert=>assert_equals( msg = 'sanity' exp = 820 act = seat_id ).
  ENDMETHOD.

  METHOD free_seat.
    DATA(boarding_passes) =
      |BFFFBBFRRR\n| &&
      |BFFFBBFRRL\n| &&
      |BFFFBBFRRR|.

    DATA(seat_id) = boarding_pass->get_free_seat( boarding_passes ).
    cl_abap_unit_assert=>assert_equals( msg = 'sanity' exp = 566 act = seat_id ).
  ENDMETHOD.

  METHOD setup.

    boarding_pass = NEW zboarding_pass( ).

  ENDMETHOD.



ENDCLASS.
