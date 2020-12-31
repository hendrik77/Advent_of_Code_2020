CLASS ltcl_luggage DEFINITION DEFERRED.
CLASS zbag DEFINITION LOCAL FRIENDS ltcl_luggage.
CLASS ltcl_luggage DEFINITION FINAL FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.
    DATA bag TYPE REF TO zbag.
    METHODS: directly_wihte_bag FOR TESTING RAISING cx_static_check,
      two_bags FOR TESTING RAISING cx_static_check,
      white_in_light_red FOR TESTING RAISING cx_static_check,
      four_shiny_gold FOR TESTING RAISING cx_static_check,
      riddle_part1 FOR TESTING RAISING cx_static_check,
    shiny_gold_contains_bags FOR TESTING RAISING cx_static_check,
    shiny_gold_contains_bags_126 FOR TESTING RAISING cx_static_check,
      setup.
ENDCLASS.


CLASS ltcl_luggage IMPLEMENTATION.

  METHOD directly_wihte_bag.
    DATA(rules) =
      |bright white bags contain 1 shiny gold bag.\n| &&
      |faded blue bags contain no other bags.|.
    bag->set_rules( rules ).
    DATA(color) = |shiny gold|.
    DATA(bags) = bag->count_bags( color ).
    cl_abap_unit_assert=>assert_equals( msg = 'directly in white bag = 1' exp = 1 act = bags ).
  ENDMETHOD.

  METHOD two_bags.
    DATA(rules) =
      |bright white bags contain 1 shiny gold bag.\n| &&
      |muted yellow bags contain 2 shiny gold bags, 9 faded blue bags.| &&
      |faded blue bags contain no other bags.|.

    bag->set_rules( rules ).
    DATA(color) = |shiny gold|.
    DATA(bags) = bag->count_bags( color ).
    cl_abap_unit_assert=>assert_equals( msg = 'directly in white bag = 1' exp = 2 act = bags ).
  ENDMETHOD.

  METHOD white_in_light_red.
    DATA(rules) =
      |bright white bags contain 1 shiny gold bag.\n| &&
      |light red bags contain 1 bright white bag, 2 muted yellow bags.\n| &&
      |muted yellow bags contain 2 shiny gold bags, 9 faded blue bags.\n| &&
      |faded blue bags contain no other bags.|.

    bag->set_rules( rules ).
    DATA(color) = |shiny gold|.
    DATA(bags) = bag->count_bags( color ).
    cl_abap_unit_assert=>assert_equals( msg = '2 direct + one in light red in bright white' exp = 3 act = bags ).
  ENDMETHOD.

  METHOD riddle_part1.
    bag->set_rules( bag->build_riddle( ) ).
    DATA(color) = |shiny gold|.
    DATA(bags) = bag->count_bags( color ).
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
    bag->set_rules( rules ).
    DATA(color) = |shiny gold|.
    DATA(bags) = bag->count_bags( color ).
    cl_abap_unit_assert=>assert_equals( msg = '4 shiney bags' exp = 4 act = bags ).
  ENDMETHOD.

    METHOD shiny_gold_contains_bags.
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
    bag->set_rules( rules ).
    DATA(color) = |shiny gold|.

    DATA(bags) = bag->contains_bags( color ).
    cl_abap_unit_assert=>assert_equals( msg = 'shiney gold bags contain 32 bags' exp = 32 act = bags ).
  ENDMETHOD.

    METHOD shiny_gold_contains_bags_126.
    DATA(rules) =
      |shiny gold bags contain 2 dark red bags.\n| &&
      |dark red bags contain 2 dark orange bags.\n| &&
      |dark orange bags contain 2 dark yellow bags.\n| &&
      |dark yellow bags contain 2 dark green bags.\n| &&
      |dark green bags contain 2 dark blue bags.\n| &&
      |dark blue bags contain 2 dark violet bags.\n| &&
      |dark violet bags contain no other bags.|.
    bag->set_rules( rules ).
    DATA(color) = |shiny gold|.

    DATA(bags) = bag->contains_bags( color ).
    cl_abap_unit_assert=>assert_equals( msg = 'shiney gold bags contain 126 bags' exp = 126 act = bags ).
  ENDMETHOD.

  METHOD setup.
    bag = NEW #( ).
  ENDMETHOD.

ENDCLASS.
