CLASS ltcl_luggage DEFINITION DEFERRED.
CLASS zluggage DEFINITION LOCAL FRIENDS ltcl_luggage.
CLASS ltcl_luggage DEFINITION FINAL FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.
    DATA luggage TYPE REF TO zluggage.
    METHODS: directly_wihte_bag FOR TESTING RAISING cx_static_check,
      two_bags FOR TESTING RAISING cx_static_check,
      white_in_light_red FOR TESTING RAISING cx_static_check,
      four_shiny_gold FOR TESTING RAISING cx_static_check,
      riddle_part1 FOR TESTING RAISING cx_static_check,
      setup.
ENDCLASS.


CLASS ltcl_luggage IMPLEMENTATION.

  METHOD directly_wihte_bag.
    DATA(rules) =
      |bright white bags contain 1 shiny gold bag.\n| &&
      |faded blue bags contain no other bags.|.
    luggage->set_rules( rules ).
    DATA(color) = |shiny gold|.
    DATA(bags) = luggage->count_bags( color ).
    cl_abap_unit_assert=>assert_equals( msg = 'directly in white bag = 1' exp = 1 act = bags ).
  ENDMETHOD.

  METHOD two_bags.
    DATA(rules) =
      |bright white bags contain 1 shiny gold bag.\n| &&
      |muted yellow bags contain 2 shiny gold bags, 9 faded blue bags.| &&
      |faded blue bags contain no other bags.|.

    luggage->set_rules( rules ).
    DATA(color) = |shiny gold|.
    DATA(bags) = luggage->count_bags( color ).
    cl_abap_unit_assert=>assert_equals( msg = 'directly in white bag = 1' exp = 2 act = bags ).
  ENDMETHOD.

  METHOD white_in_light_red.
    DATA(rules) =
      |bright white bags contain 1 shiny gold bag.\n| &&
      |light red bags contain 1 bright white bag, 2 muted yellow bags.\n| &&
      |muted yellow bags contain 2 shiny gold bags, 9 faded blue bags.\n| &&
      |faded blue bags contain no other bags.|.

    luggage->set_rules( rules ).
    DATA(color) = |shiny gold|.
    DATA(bags) = luggage->count_bags( color ).
    cl_abap_unit_assert=>assert_equals( msg = '2 direct + one in light red in bright white' exp = 3 act = bags ).
  ENDMETHOD.

  METHOD riddle_part1.
    luggage->set_rules( luggage->build_riddle( ) ).
    DATA(color) = |shiny gold|.
    DATA(bags) = luggage->count_bags( color ).
    cl_abap_unit_assert=>assert_equals( msg = '115 is the solution' exp = 115 act = bags ).
  ENDMETHOD.

  METHOD four_shiny_gold.
    DATA(rules) =
      |light red bags contain 1 bright white bag, 2 muted yellow bags.\n| &&
      |dark orange bags contain 3 bright white bags, 4 muted yellow bags.\n| &&
      |bright white bags contain 1 shiny gold bag.\n| &&
      |muted yellow bags contain 2 shiny gold bags, 9 faded blue bags.\n| &&
      |shiny gold bags contain 1 dark olive bag, 2 vibrant plum bags.\n| &&
      |dark olive bags contain 3 faded blue bags, 4 dotted black bags.\n| &&
      |vibrant plum bags contain 5 faded blue bags, 6 dotted black bags.\n| &&
      |faded blue bags contain no other bags.\n| &&
      |dotted black bags contain no other bags.|.
    luggage->set_rules( rules ).
    DATA(color) = |shiny gold|.
    DATA(bags) = luggage->count_bags( color ).
    cl_abap_unit_assert=>assert_equals( msg = '4 shiney bags' exp = 4 act = bags ).
  ENDMETHOD.

  METHOD setup.
    luggage = NEW #( ).
  ENDMETHOD.

ENDCLASS.
