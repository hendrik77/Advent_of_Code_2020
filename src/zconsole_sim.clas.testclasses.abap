CLASS ltcl_console_sim DEFINITION FINAL FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.
    DATA: console TYPE REF TO zconsole_sim.
    METHODS:
      two_instruction_loop FOR TESTING RAISING cx_static_check,
      example_part1 FOR TESTING RAISING cx_static_check,
      terminate_with_8 FOR TESTING RAISING cx_static_check,
      repair_jmp FOR TESTING RAISING cx_static_check.
    METHODS setup.
ENDCLASS.


CLASS ltcl_console_sim IMPLEMENTATION.

  METHOD two_instruction_loop.
    "arrange
    DATA(program) =
      |nop +0\n| &&
      |acc +1\n| &&
      |jmp -2|.
    console->load_program( program ).

    "act
    console->run( ).

    "assert
    DATA(accumulator) = console->accumulator.
    cl_abap_unit_assert=>assert_equals( msg = 'accumulator = 1' exp = 1 act = accumulator ).
  ENDMETHOD.

  METHOD example_part1.
    "arrange
    DATA(program) =
      |nop +0\n| &&
      |acc +1\n| &&
      |jmp +4\n| &&
      |acc +3\n| &&
      |jmp -3\n| &&
      |acc -99\n| &&
      |acc +1\n| &&
      |jmp -4\n| &&
      |acc +6|.
    console->load_program( program ).

    "act
    console->run( ).

    "assert
    DATA(accumulator) = console->accumulator.
    cl_abap_unit_assert=>assert_equals( msg = 'accumulator = 5' exp = 5 act = accumulator ).

  ENDMETHOD.

  METHOD terminate_with_8.
    "arrange
    DATA(program) =
      |nop +0\n| &&
      |acc +1\n| &&
      |jmp +4\n| &&
      |acc +3\n| &&
      |jmp -3\n| &&
      |acc -99\n| &&
      |acc +1\n| &&
      |nop -4\n| &&
      |acc +6.|.
    console->load_program( program ).

    "act
    console->run( ).

    "assert
    DATA(accumulator) = console->accumulator.
    cl_abap_unit_assert=>assert_equals( msg = 'accumulator = 8' exp = 8 act = accumulator ).
    DATA(terminated) = console->terminated.
    cl_abap_unit_assert=>assert_true( msg = 'program terminates' act = terminated ).
  ENDMETHOD.

  METHOD repair_jmp.
    "arrange
    DATA(program) =
      |nop +0\n| &&
      |acc +1\n| &&
      |jmp +4\n| &&
      |acc +3\n| &&
      |jmp -3\n| &&
      |acc -99\n| &&
      |acc +1\n| &&
      |jmp -4\n| &&
      |acc +6.|.
    console->load_program( program ).

    "act
    console->repair( ).

    "assert
    DATA(terminated) = console->terminated.
    cl_abap_unit_assert=>assert_true( msg = 'program terminates' act = terminated ).
    DATA(accumulator) = console->accumulator.
    cl_abap_unit_assert=>assert_equals( msg = 'accumulator = 8' exp = 8 act = accumulator ).
  ENDMETHOD.

  METHOD setup.
    console = NEW zconsole_sim( ).
  ENDMETHOD.

ENDCLASS.
