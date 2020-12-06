CLASS ltcl_toboggan DEFINITION DEFERRED.
CLASS ztoboggan DEFINITION LOCAL FRIENDS ltcl_toboggan.
CLASS ltcl_toboggan DEFINITION FINAL FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.
    DATA: toboggan TYPE REF TO ztoboggan.
    METHODS:
      count_trees_7 FOR TESTING RAISING cx_static_check,
      build_map FOR TESTING RAISING cx_static_check,
      traverse_map FOR TESTING RAISING cx_static_check,
      get_map FOR TESTING RAISING cx_static_check,
      build_1line_map FOR TESTING RAISING cx_static_check,
      build_small_map FOR TESTING RAISING cx_static_check,
      grow_map FOR TESTING RAISING cx_static_check,
      riddle_part1 FOR TESTING RAISING cx_static_check,
      check_slopes FOR TESTING RAISING cx_static_check,
      riddle_part2 FOR TESTING RAISING cx_static_check,
      down_3 FOR TESTING RAISING cx_static_check,
      setup.
ENDCLASS.


CLASS ltcl_toboggan IMPLEMENTATION.
  METHOD riddle_part1.
    toboggan->set_map( toboggan->get_riddle_input( ) ).
    toboggan->set_slope( VALUE #( ( course = ztoboggan=>down length = 1 )
                                  ( course = ztoboggan=>right length = 3 ) ) ).

    toboggan->traverse( ).
    DATA(trees) = toboggan->count_trees( |X| ).
    cl_abap_unit_assert=>assert_equals( msg = 'solution' exp = 153 act = trees ).
  ENDMETHOD.

  METHOD count_trees_7.
    DATA: encountered_trees TYPE i.
    DATA(map) =
      |..##.......\n| &&
      |#...#...#..\n| &&
      |.#....#..#.\n| &&
      |..#.#...#.#\n| &&
      |.#...##..#.\n| &&
      |..#.##.....\n| &&
      |.#.#.#....#\n| &&
      |.#........#\n| &&
      |#.##...#...\n| &&
      |#...##....#\n| &&
      |.#..#...#.#|.
    toboggan->set_map( map ).
    DATA(slope) = VALUE ztoboggan=>ty_slope( ( course = ztoboggan=>right length = 3 )
                                             ( course = ztoboggan=>down  length = 1 ) ).
    toboggan->set_slope( slope ).
    toboggan->traverse( ).

    encountered_trees = toboggan->count_trees( |X| ).
    cl_abap_unit_assert=>assert_equals( msg = 'encountered trees: 7' exp = 7 act = encountered_trees ).
  ENDMETHOD.

  METHOD down_3.
    DATA(map) =
      |..##.......\n| &&
      |#...#...#..\n| &&
      |.#....#..#.\n| &&
      |..#.#...#.#\n| &&
      |.#...##..#.\n| &&
      |..#.##.....\n| &&
      |.#.#.#....#\n| &&
      |.#........#\n| &&
      |#.##...#...\n| &&
      |#...##....#\n| &&
      |.#..#...#.#|.

    DATA(slope) = VALUE ztoboggan=>ty_slope( ( course = ztoboggan=>right length = 1 )
                                             ( course = ztoboggan=>down  length = 2 ) ).
    DATA(trees) = toboggan->traverse_slope( map = map slope = slope ).

    cl_abap_unit_assert=>assert_equals( exp = 2 act = trees ).

  ENDMETHOD.

  METHOD check_slopes.
    DATA(trees) = 1.
    DATA(map) =
      |..##.......\n| &&
      |#...#...#..\n| &&
      |.#....#..#.\n| &&
      |..#.#...#.#\n| &&
      |.#...##..#.\n| &&
      |..#.##.....\n| &&
      |.#.#.#....#\n| &&
      |.#........#\n| &&
      |#.##...#...\n| &&
      |#...##....#\n| &&
      |.#..#...#.#|.

    DATA(slope) = VALUE ztoboggan=>ty_slope( ( course = ztoboggan=>right length = 1 )
                                             ( course = ztoboggan=>down  length = 1 ) ).
    trees *= toboggan->traverse_slope( map = map slope = slope ).


    slope = VALUE ztoboggan=>ty_slope( ( course = ztoboggan=>right length = 3 )
                                       ( course = ztoboggan=>down  length = 1 ) ).
    trees *= toboggan->traverse_slope( map = map slope = slope ).

    slope = VALUE ztoboggan=>ty_slope( ( course = ztoboggan=>right length = 5 )
                                       ( course = ztoboggan=>down  length = 1 ) ).
    trees *= toboggan->traverse_slope( map = map slope = slope ).

    slope = VALUE ztoboggan=>ty_slope( ( course = ztoboggan=>right length = 7 )
                                       ( course = ztoboggan=>down  length = 1 ) ).
    trees *= toboggan->traverse_slope( map = map slope = slope ).

    slope = VALUE ztoboggan=>ty_slope( ( course = ztoboggan=>right length = 1 )
                                       ( course = ztoboggan=>down  length = 2 ) ).
    trees *= toboggan->traverse_slope( map = map slope = slope ).

    cl_abap_unit_assert=>assert_equals( msg = '2x7x3x4x2 = 336' exp = 336 act = trees ).
  ENDMETHOD.

  METHOD riddle_part2.
    DATA(trees) = CONV int8( 1 ).
    DATA(map) = toboggan->get_riddle_input( ).

    DATA(slope) = VALUE ztoboggan=>ty_slope( ( course = ztoboggan=>right length = 1 )
                                             ( course = ztoboggan=>down  length = 1 ) ).
    trees *= toboggan->traverse_slope( map = map slope = slope ).


    slope = VALUE ztoboggan=>ty_slope( ( course = ztoboggan=>right length = 3 )
                                       ( course = ztoboggan=>down  length = 1 ) ).
    trees *= toboggan->traverse_slope( map = map slope = slope ).

    slope = VALUE ztoboggan=>ty_slope( ( course = ztoboggan=>right length = 5 )
                                       ( course = ztoboggan=>down  length = 1 ) ).
    trees *= toboggan->traverse_slope( map = map slope = slope ).

    slope = VALUE ztoboggan=>ty_slope( ( course = ztoboggan=>right length = 7 )
                                       ( course = ztoboggan=>down  length = 1 ) ).
    trees *= toboggan->traverse_slope( map = map slope = slope ).

    slope = VALUE ztoboggan=>ty_slope( ( course = ztoboggan=>right length = 1 )
                                       ( course = ztoboggan=>down  length = 2 ) ).
    trees *= toboggan->traverse_slope( map = map slope = slope ).

    cl_abap_unit_assert=>assert_equals( msg = 'trees = ?' exp = 2421944712 act = trees ).
  ENDMETHOD.

  METHOD traverse_map.
    "arrange
    DATA(map) =
     |..##.......\n| &&
     |#...#...#..\n| &&
     |.#....#..#.\n| &&
     |..#.#...#.#|.
    toboggan->set_map( map ).
    DATA(slope) = VALUE ztoboggan=>ty_slope( ( course = ztoboggan=>right length = 3 )
                                             ( course = ztoboggan=>down length = 1 ) ).
    toboggan->set_slope( slope ).

    "act
    toboggan->traverse( ).
    DATA(actual_map) = toboggan->get_map( ).

    "assert
    DATA(expected_map) =
      |..##.........##.......\n| &&
      |#..O#...#..#...#...#..\n| &&
      |.#....X..#..#....#..#.\n| &&
      |..#.#...#O#..#.#...#.#|.
    cl_abap_unit_assert=>assert_equals( msg = 'maps are equal' exp = expected_map act = actual_map ).
  ENDMETHOD.

  METHOD build_map.
    DATA(map) =
      |..##.......\n| &&
      |#...#...#..|.
    toboggan->set_map( map ).
    cl_abap_unit_assert=>assert_equals( msg = '2 lines' exp = 2 act = lines( toboggan->map ) ).
    cl_abap_unit_assert=>assert_equals( msg = '11 lines in row 1' exp = 11 act = lines( toboggan->map[ 1 ] ) ).
    DATA(field) = toboggan->map[ 1 ][ 3 ].
    cl_abap_unit_assert=>assert_equals( msg = 'tree at 1,3' exp = '#' act = field ).
    DATA(field3) = toboggan->map[ 2 ][ 3 ].
    cl_abap_unit_assert=>assert_equals( msg = 'tree at 2,3' exp = '.' act = field3 ).
    DATA(field11) = toboggan->map[ 1 ][ 1 ].
    cl_abap_unit_assert=>assert_equals( msg = 'tree at 1,1' exp = '.' act = field11 ).
    DATA(field2) = toboggan->map[ 2 ][ 1 ].
    cl_abap_unit_assert=>assert_equals( msg = 'tree at 2,1' exp = '#' act = field2 ).
  ENDMETHOD.

  METHOD build_1line_map.
    DATA(map) = |.#|.
    toboggan->set_map( map ).
    DATA(exp_map) = VALUE ztoboggan=>ty_map(
      ( VALUE #( (  |.| ) ( |#| ) ) ) ).
    cl_abap_unit_assert=>assert_equals( msg = 'maps' exp = exp_map act = toboggan->map ).
  ENDMETHOD.

  METHOD grow_map.
    "arrange
    DATA(map) =
      |.#.\n| &&
      |..#\n| &&
      |#..|.
    toboggan->set_map( map ).
    DATA(slope) = VALUE ztoboggan=>ty_slope( ( course = ztoboggan=>right length = 3 )
                                             ( course = ztoboggan=>down  length = 1 ) ).
    toboggan->set_slope( slope ).

    "act
    toboggan->traverse( ).
    DATA(traversed_map) = toboggan->get_map( ).

    "assert
    DATA(expected_map) =
      |.#..#..#.\n| &&
      |..#O.#..#\n| &&
      |#..#..X..|.
    cl_abap_unit_assert=>assert_equals( msg = 'maps growing' exp = expected_map act = traversed_map ).
  ENDMETHOD.

  METHOD build_small_map.
    DATA(map) =
      |.\n| &&
      |#|.
    toboggan->set_map( map ).
    DATA(exp_map) = VALUE ztoboggan=>ty_map(
      ( VALUE string_table( (  |.| )  ) )
      ( VALUE string_table( (  |#| )  ) ) ).
    cl_abap_unit_assert=>assert_equals( msg = 'maps' exp = exp_map act = toboggan->map ).
    DATA(field) = toboggan->map[ 2 ][ 1 ].
    cl_abap_unit_assert=>assert_equals( msg = 'tree at 1,3' exp = '#' act = field ).
  ENDMETHOD.

  METHOD get_map.
    "arrange
    DATA(map) =
         |..##.......\n| &&
         |#...#...#..|."
    toboggan->set_map( map ).

    "act
    DATA(actual_map) = toboggan->get_map( ).

    "assert
    cl_abap_unit_assert=>assert_equals( msg = 'maps' exp = map act = actual_map ).
  ENDMETHOD.

  METHOD setup.
    toboggan = NEW ztoboggan( ).
  ENDMETHOD.

ENDCLASS.
