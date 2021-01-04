CLASS ltcl_xmas DEFINITION DEFERRED.
CLASS zxmas DEFINITION LOCAL FRIENDS ltcl_xmas.
CLASS ltcl_xmas DEFINITION FINAL FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.
    DATA: xmas TYPE REF TO zxmas.
    METHODS:
      preamble_len_5 FOR TESTING RAISING cx_static_check,
      preamble_1_25_not_valid FOR TESTING RAISING cx_static_check,
      preamble_26_is_valid FOR TESTING RAISING cx_static_check,
    contiguous_set_127 FOR TESTING RAISING cx_static_check,
    find_encryption_weakness FOR TESTING RAISING cx_static_check,
      setup.
ENDCLASS.

CLASS ltcl_xmas IMPLEMENTATION.

  METHOD preamble_1_25_not_valid.
    "arrange
    DATA(puzzle) =
      |1\n| &&
      |2\n| &&
      |3\n| &&
      |4\n| &&
      |5\n| &&
      |6\n| &&
      |7\n| &&
      |8\n| &&
      |9\n| &&
      |10\n| &&
      |11\n| &&
      |12\n| &&
      |13\n| &&
      |14\n| &&
      |15\n| &&
      |16\n| &&
      |17\n| &&
      |18\n| &&
      |19\n| &&
      |20\n| &&
      |21\n| &&
      |22\n| &&
      |23\n| &&
      |24\n| &&
      |25\n| &&
      |50|.
    xmas->set_preamble_length( 25 ).
    xmas->set_puzzle( puzzle ).

    "act
    DATA(not_valid) = xmas->find_invalid_number( ).

    "assert
    cl_abap_unit_assert=>assert_equals( msg = 'number = 50' exp = 50 act = not_valid ).
  ENDMETHOD.

  METHOD preamble_26_is_valid.
    "arrange
    DATA(puzzle) =
      |1\n| &&
      |2\n| &&
      |3\n| &&
      |4\n| &&
      |5\n| &&
      |6\n| &&
      |7\n| &&
      |8\n| &&
      |9\n| &&
      |10\n| &&
      |11\n| &&
      |12\n| &&
      |13\n| &&
      |14\n| &&
      |15\n| &&
      |16\n| &&
      |17\n| &&
      |18\n| &&
      |19\n| &&
      |20\n| &&
      |21\n| &&
      |22\n| &&
      |23\n| &&
      |24\n| &&
      |25\n| &&
      |26\n| &&
      |49\n| &&
      |50\n| &&
      |51\n|.
    xmas->set_preamble_length( 25 ).
    xmas->set_puzzle( puzzle ).

    "act
    DATA(valid) = xmas->is_valid( 26 ).

    "assert
    cl_abap_unit_assert=>assert_true( msg = '26 valid' act = valid ).
  ENDMETHOD.

  METHOD preamble_len_5.
    "arrange
    DATA(puzzle) =
      |35\n| &&
      |20\n| &&
      |15\n| &&
      |25\n| &&
      |47\n| &&
      |40\n| &&
      |62\n| &&
      |55\n| &&
      |65\n| &&
      |95\n| &&
      |102\n| &&
      |117\n| &&
      |150\n| &&
      |182\n| &&
      |127\n| &&
      |219\n| &&
      |299\n| &&
      |277\n| &&
      |309\n| &&
      |576|.
    xmas->set_preamble_length( 5 ).
    xmas->set_puzzle( puzzle ).

    "act
    DATA(not_valid) = xmas->find_invalid_number( ).

    "assert
    cl_abap_unit_assert=>assert_equals( msg = 'number = 127' exp = 127 act = not_valid ).
  ENDMETHOD.

METHOD contiguous_set_127.
    "arrange
    DATA(puzzle) =
      |35\n| &&
      |20\n| &&
      |15\n| &&
      |25\n| &&
      |47\n| &&
      |40\n| &&
      |62\n| &&
      |55\n| &&
      |65\n| &&
      |95\n| &&
      |102\n| &&
      |117\n| &&
      |150\n| &&
      |182\n| &&
      |127\n| &&
      |219\n| &&
      |299\n| &&
      |277\n| &&
      |309\n| &&
      |576|.
    xmas->set_preamble_length( 5 ).
    xmas->set_puzzle( puzzle ).

    "act
    DATA(set) = xmas->find_contiguous_set( invalid_number = 127 ).

    "assert
    cl_abap_unit_assert=>assert_equals( msg = 'set consists of 4 lines' exp = 4 act = lines( set ) ).
  ENDMETHOD.

METHOD find_encryption_weakness.
    "arrange
    DATA(puzzle) =
      |35\n| &&
      |20\n| &&
      |15\n| &&
      |25\n| &&
      |47\n| &&
      |40\n| &&
      |62\n| &&
      |55\n| &&
      |65\n| &&
      |95\n| &&
      |102\n| &&
      |117\n| &&
      |150\n| &&
      |182\n| &&
      |127\n| &&
      |219\n| &&
      |299\n| &&
      |277\n| &&
      |309\n| &&
      |576|.
    xmas->set_preamble_length( 5 ).
    xmas->set_puzzle( puzzle ).

    "act
    DATA(weakness) = xmas->find_encryption_weakness( 127 ).

    "assert
    cl_abap_unit_assert=>assert_equals( msg = 'encryption weakness for 127 = 62' exp = 62 act = weakness ).
  ENDMETHOD.


  METHOD setup.
    xmas = NEW zxmas( ).
  ENDMETHOD.

ENDCLASS.
