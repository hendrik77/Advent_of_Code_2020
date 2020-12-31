CLASS zbag DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES
      if_oo_adt_classrun.
    METHODS count_bags
      IMPORTING
        color         TYPE string
      RETURNING
        VALUE(number) TYPE i.
    METHODS set_rules
      IMPORTING
        i_rules TYPE string.
    METHODS contains_bags
      IMPORTING
        color       TYPE string
      RETURNING
        VALUE(bags) TYPE i.
  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA: rules_table TYPE string_table.

    METHODS build_riddle
      RETURNING VALUE(riddle) TYPE string.
    METHODS get_bags_that_contain
      IMPORTING
        color          TYPE string
      RETURNING
        VALUE(bag_tab) TYPE string_table.
ENDCLASS.



CLASS zbag IMPLEMENTATION.

  METHOD count_bags.
    DATA bag_color_tab TYPE string_table.

    bag_color_tab = get_bags_that_contain( color ).

    LOOP AT bag_color_tab INTO DATA(bag).
      APPEND LINES OF get_bags_that_contain( bag ) TO bag_color_tab.
    ENDLOOP.
*     REDUCE #( INIT x = 0
*                                                FOR bag IN bag_color_tab NEXT
*                                                x += count_bags( bag ) ).
    SORT bag_color_tab.
    DELETE ADJACENT DUPLICATES FROM bag_color_tab.
    number = lines( bag_color_tab ).
  ENDMETHOD.

  METHOD set_rules.
    SPLIT i_rules AT cl_abap_char_utilities=>newline INTO TABLE rules_table.
  ENDMETHOD.

  METHOD build_riddle.
    riddle =
    |dim red bags contain 2 bright gold bags, 5 striped fuchsia bags.\n| &&
    |dotted purple bags contain 5 bright olive bags, 3 faded maroon bags.\n| &&
    |plaid chartreuse bags contain 1 vibrant olive bag, 5 bright black bags, 1 clear tomato bag.\n| &&
    |wavy orange bags contain 4 dark lavender bags, 4 posh white bags.\n| &&
    |light lavender bags contain 4 drab olive bags, 5 dark magenta bags.\n| &&
    |pale black bags contain 5 dotted beige bags, 5 clear chartreuse bags, 4 pale lime bags.\n| &&
    |wavy crimson bags contain 5 dull tomato bags.\n| &&
    |muted aqua bags contain 1 dotted aqua bag, 5 posh plum bags, 1 bright blue bag.\n| &&
    |striped green bags contain 3 light silver bags, 2 plaid purple bags.\n| &&
    |plaid cyan bags contain 3 pale maroon bags, 2 bright yellow bags.\n| &&
    |dull maroon bags contain 2 wavy black bags, 2 plaid tomato bags, 2 dim silver bags, 3 plaid salmon bags.\n| &&
    |bright gold bags contain 4 wavy olive bags, 3 muted gray bags, 4 dark indigo bags, 5 dark chartreuse bags.\n| &&
    |drab blue bags contain 1 light green bag.\n| &&
    |muted brown bags contain 4 dark red bags, 5 dull aqua bags, 4 drab blue bags.\n| &&
    |bright olive bags contain 5 dim salmon bags, 4 dotted beige bags, 2 pale bronze bags.\n| &&
    |mirrored red bags contain 3 mirrored chartreuse bags, 3 muted gold bags, 5 bright beige bags, 4 dim green bags.\n| &&
    |pale gray bags contain 4 vibrant tomato bags.\n| &&
    |striped purple bags contain 5 dotted gray bags.\n| &&
    |light brown bags contain 1 shiny silver bag, 3 plaid olive bags, 1 clear tan bag.\n| &&
    |dim tan bags contain 1 posh black bag, 3 faded maroon bags, 5 bright gray bags.\n| &&
    |faded fuchsia bags contain 5 posh fuchsia bags, 3 drab salmon bags, 1 posh orange bag.\n| &&
    |dim gray bags contain 4 bright crimson bags, 5 dotted salmon bags, 2 plaid indigo bags.\n| &&
    |bright tan bags contain 2 posh lime bags.\n| &&
    |faded olive bags contain 5 light fuchsia bags, 1 shiny orange bag, 4 posh lavender bags.\n| &&
    |vibrant indigo bags contain 3 vibrant turquoise bags, 4 faded magenta bags, 4 pale red bags, 4 mirrored turquoise bags.\n| &&
    |clear salmon bags contain 3 pale maroon bags, 5 drab green bags, 1 light green bag.\n| &&
    |clear maroon bags contain 2 pale black bags, 5 dark coral bags, 3 dark purple bags, 2 vibrant blue bags.\n| &&
    |clear olive bags contain 2 muted brown bags.\n| &&
    |drab bronze bags contain 3 wavy brown bags, 4 posh lime bags, 1 mirrored beige bag.\n| &&
    |dull red bags contain 3 dark cyan bags, 5 bright indigo bags, 4 clear brown bags, 5 plaid violet bags.\n| &&
    |vibrant green bags contain 3 clear brown bags, 5 plaid yellow bags, 4 vibrant crimson bags.\n| &&
    |dark bronze bags contain 5 dark silver bags.\n| &&
    |mirrored orange bags contain 2 shiny crimson bags, 3 clear tomato bags, 1 muted crimson bag.\n| &&
    |pale yellow bags contain 1 bright olive bag.\n| &&
    |dotted teal bags contain 1 plaid olive bag, 2 drab white bags.\n| &&
    |dull tan bags contain 2 faded aqua bags, 3 muted green bags.\n| &&
    |clear crimson bags contain 3 dark purple bags.\n| &&
    |light violet bags contain 3 pale beige bags, 2 mirrored silver bags.\n| &&
    |muted green bags contain 2 wavy brown bags, 3 dull gray bags, 4 drab tan bags, 3 plaid teal bags.\n| &&
    |mirrored beige bags contain no other bags.\n| &&
    |dotted silver bags contain 1 vibrant green bag.\n| &&
    |drab fuchsia bags contain 1 vibrant bronze bag, 1 striped fuchsia bag, 1 dotted beige bag.\n| &&
    |dim beige bags contain 4 dotted cyan bags, 4 vibrant fuchsia bags, 5 dull violet bags.\n| &&
    |shiny fuchsia bags contain 4 pale gold bags, 3 mirrored crimson bags, 4 plaid gold bags, 5 shiny yellow bags.\n| &&
    |dark yellow bags contain 2 faded chartreuse bags.\n| &&
    |light chartreuse bags contain 1 plaid blue bag, 5 dim green bags, 1 faded chartreuse bag.\n| &&
    |dull beige bags contain 2 wavy tomato bags, 1 striped yellow bag.\n| &&
    |clear tan bags contain 4 plaid yellow bags, 1 posh cyan bag, 2 dim silver bags.\n| &&
    |posh lime bags contain 3 pale brown bags, 5 dim tomato bags.\n| &&
    |dim aqua bags contain 4 plaid lavender bags, 5 striped violet bags, 4 plaid chartreuse bags.\n| &&
    |light salmon bags contain 4 striped red bags, 2 wavy indigo bags, 2 light tomato bags, 1 dark cyan bag.\n| &&
    |vibrant yellow bags contain 1 plaid blue bag, 3 dotted violet bags, 2 wavy red bags, 5 drab beige bags.\n| &&
    |drab white bags contain 4 faded tan bags.\n| &&
    |light gray bags contain 3 plaid gold bags, 2 light green bags, 5 dim blue bags, 4 posh turquoise bags.\n| &&
    |dull magenta bags contain 5 mirrored salmon bags, 1 mirrored chartreuse bag, 3 dull gray bags.\n| &&
    |striped tan bags contain 5 plaid red bags, 2 dim chartreuse bags, 3 muted tomato bags.\n| &&
    |shiny turquoise bags contain 1 drab gold bag, 5 posh teal bags, 2 vibrant bronze bags, 2 vibrant chartreuse bags.\n| &&
    |bright lime bags contain 1 drab olive bag, 3 dark blue bags, 2 mirrored lavender bags, 4 shiny indigo bags.\n| &&
    |mirrored lavender bags contain no other bags.\n| &&
    |pale white bags contain 1 plaid tan bag.\n| &&
    |wavy blue bags contain 2 light tomato bags, 4 dim bronze bags, 1 plaid green bag, 2 dark maroon bags.\n| &&
    |muted beige bags contain 1 bright black bag, 4 dull magenta bags, 2 shiny indigo bags.\n| &&
    |light purple bags contain 3 bright violet bags, 2 vibrant crimson bags.\n| &&
    |mirrored cyan bags contain 1 wavy salmon bag, 2 vibrant green bags, 1 muted coral bag, 2 drab bronze bags.\n| &&
    |faded coral bags contain 2 drab bronze bags, 2 wavy beige bags, 5 clear blue bags.\n| &&
    |wavy aqua bags contain 4 dotted beige bags.\n| &&
    |striped maroon bags contain 2 clear indigo bags, 4 pale black bags.\n| &&
    |dark white bags contain 1 vibrant green bag, 2 vibrant crimson bags.\n| &&
    |dim teal bags contain 1 pale plum bag.\n| &&
    |muted red bags contain 4 plaid maroon bags.\n| &&
    |plaid lavender bags contain 2 posh gold bags, 1 dark blue bag, 4 muted gold bags.\n| &&
    |drab crimson bags contain 2 dull green bags, 3 vibrant orange bags, 4 bright gray bags.\n| &&
    |posh aqua bags contain 1 dotted fuchsia bag, 5 posh turquoise bags.\n| &&
    |muted maroon bags contain 4 drab green bags, 5 pale plum bags, 4 shiny indigo bags, 1 light chartreuse bag.\n| &&
    |posh indigo bags contain 2 dim blue bags.\n| &&
    |light magenta bags contain 4 muted black bags, 1 muted green bag.\n| &&
    |dark plum bags contain 2 pale tomato bags, 2 dark maroon bags.\n| &&
    |faded lavender bags contain 2 bright magenta bags.\n| &&
    |light silver bags contain 2 pale red bags, 5 vibrant plum bags, 3 posh indigo bags.\n| &&
    |light plum bags contain 1 light red bag, 1 mirrored chartreuse bag, 1 dark cyan bag.\n| &&
    |plaid bronze bags contain 4 muted turquoise bags, 4 mirrored blue bags, 4 faded yellow bags, 1 pale bronze bag.\n| &&
    |striped cyan bags contain 4 posh black bags, 5 light maroon bags.\n| &&
    |striped magenta bags contain 5 faded brown bags, 4 pale aqua bags, 5 wavy brown bags.\n| &&
    |plaid olive bags contain 5 vibrant green bags, 2 posh plum bags.\n| &&
    |light maroon bags contain 4 muted tomato bags, 1 shiny lavender bag.\n| &&
    |mirrored salmon bags contain 2 dull tomato bags, 5 pale crimson bags, 2 striped yellow bags, 1 drab salmon bag.\n| &&
    |mirrored bronze bags contain 5 posh orange bags.\n| &&
    |muted black bags contain 2 light white bags, 5 wavy black bags, 5 wavy maroon bags.\n| &&
    |drab plum bags contain 5 light indigo bags, 5 dull silver bags, 3 dim green bags, 2 dim silver bags.\n| &&
    |light green bags contain no other bags.\n| &&
    |posh salmon bags contain 3 bright lime bags.\n| &&
    |light beige bags contain 1 faded indigo bag, 4 faded teal bags, 1 dark green bag, 3 vibrant bronze bags.\n| &&
    |light gold bags contain 4 pale black bags, 4 dotted white bags, 5 striped gray bags.\n| &&
    |pale lime bags contain 2 drab blue bags, 4 wavy beige bags, 3 striped red bags, 5 shiny purple bags.\n| &&
    |striped crimson bags contain 5 muted white bags, 3 plaid coral bags.\n| &&
    |dull aqua bags contain 2 vibrant maroon bags, 4 posh gold bags.\n| &&
    |mirrored indigo bags contain 4 wavy white bags.\n| &&
    |clear green bags contain 2 light white bags.\n| &&
    |clear gray bags contain 3 dull coral bags, 4 dim fuchsia bags.\n| &&
    |dim coral bags contain 1 muted olive bag.\n| &&
    |dark indigo bags contain 5 faded chartreuse bags, 4 dark red bags, 4 shiny indigo bags, 3 plaid blue bags.\n| &&
    |plaid purple bags contain 4 striped blue bags, 4 dark beige bags, 1 drab silver bag, 5 dotted blue bags.\n| &&
    |faded tan bags contain 4 wavy fuchsia bags, 2 mirrored beige bags, 5 dim chartreuse bags.\n| &&
    |faded white bags contain 1 plaid teal bag, 5 dark red bags, 4 dim olive bags, 2 dim bronze bags.\n| &&
    |dotted chartreuse bags contain 2 muted purple bags, 4 posh gold bags.\n| &&
    |dull plum bags contain 3 dark lime bags.\n| &&
    |dull lime bags contain 2 bright teal bags, 1 vibrant aqua bag, 4 plaid yellow bags, 2 vibrant silver bags.\n| &&
    |dim violet bags contain 4 wavy white bags, 3 vibrant aqua bags, 4 clear tomato bags.\n| &&
    |dotted olive bags contain 1 clear gray bag, 1 dotted fuchsia bag, 3 wavy tomato bags, 4 bright maroon bags.\n| &&
    |mirrored olive bags contain 4 drab salmon bags, 4 light indigo bags.\n| &&
    |wavy brown bags contain 5 wavy beige bags.\n| &&
    |drab salmon bags contain 4 wavy maroon bags, 5 bright purple bags.\n| &&
    |bright indigo bags contain 4 mirrored tomato bags.\n| &&
    |plaid violet bags contain 3 shiny white bags, 1 posh crimson bag.\n| &&
    |drab lavender bags contain 2 vibrant gold bags, 5 faded aqua bags.\n| &&
    |clear red bags contain 3 dotted plum bags, 4 striped crimson bags.\n| &&
    |vibrant salmon bags contain 2 light maroon bags, 1 light olive bag, 1 mirrored tomato bag.\n| &&
    |faded beige bags contain 3 plaid blue bags.\n| &&
    |vibrant magenta bags contain 2 vibrant black bags, 5 drab lavender bags, 4 dull indigo bags, 3 faded indigo bags.\n| &&
    |shiny lavender bags contain 4 drab gold bags, 4 plaid violet bags.\n| &&
    |striped coral bags contain 5 vibrant green bags.\n| &&
    |dotted green bags contain 1 wavy maroon bag, 1 wavy white bag, 4 striped fuchsia bags.\n| &&
    |dull purple bags contain 1 posh lavender bag, 5 posh brown bags, 1 plaid gray bag, 2 clear red bags.\n| &&
    |mirrored teal bags contain 4 posh chartreuse bags.\n| &&
    |faded lime bags contain 5 dark gray bags, 5 light purple bags, 3 dotted magenta bags, 1 mirrored blue bag.\n| &&
    |striped olive bags contain 3 clear purple bags, 2 light cyan bags, 5 mirrored chartreuse bags, 4 plaid cyan bags.\n| &&
    |dark cyan bags contain 5 faded violet bags, 4 clear brown bags, 3 shiny gold bags.\n| &&
    |mirrored tan bags contain 5 dim green bags, 5 clear brown bags.\n| &&
    |wavy maroon bags contain 3 pale lime bags, 1 muted brown bag.\n| &&
    |posh brown bags contain 3 wavy salmon bags, 1 shiny tan bag, 1 plaid tomato bag.\n| &&
    |mirrored lime bags contain 5 muted tomato bags.\n| &&
    |clear teal bags contain 3 muted lavender bags, 3 dotted fuchsia bags.\n| &&
    |dim silver bags contain 4 drab green bags, 5 striped yellow bags, 3 vibrant maroon bags.\n| &&
    |dim indigo bags contain 4 plaid blue bags, 3 bright brown bags.\n| &&
    |vibrant tomato bags contain 1 dim violet bag, 3 clear gray bags.\n| &&
    |wavy white bags contain 4 bright purple bags, 4 vibrant orange bags, 2 wavy yellow bags, 3 drab blue bags.\n| &&
    |plaid beige bags contain 4 shiny white bags, 4 drab chartreuse bags, 1 bright orange bag.\n| &&
    |pale fuchsia bags contain 1 plaid cyan bag, 3 striped coral bags, 5 muted violet bags, 3 wavy brown bags.\n| &&
    |posh plum bags contain 5 dotted brown bags, 5 muted green bags.\n| &&
    |dim gold bags contain 5 mirrored lavender bags.\n| &&
    |plaid aqua bags contain 3 drab magenta bags.\n| &&
    |dotted tan bags contain 3 dull tan bags, 4 pale lime bags, 5 wavy teal bags.\n| &&
    |faded bronze bags contain 4 dull silver bags, 3 dim cyan bags, 5 posh chartreuse bags, 4 pale maroon bags.\n| &&
    |wavy green bags contain 5 plaid teal bags, 2 bright teal bags.\n| &&
    |clear orange bags contain 5 faded yellow bags, 2 mirrored salmon bags, 3 faded coral bags, 4 clear tan bags.\n| &&
    |wavy lavender bags contain 3 dotted magenta bags, 5 wavy tomato bags, 1 pale maroon bag, 4 dull brown bags.\n| &&
    |striped chartreuse bags contain 5 dotted orange bags, 2 wavy black bags.\n| &&
    |wavy plum bags contain 2 dark tomato bags, 5 dim blue bags, 4 shiny violet bags.\n| &&
    |shiny blue bags contain 2 vibrant green bags.\n| &&
    |pale tomato bags contain 2 faded chartreuse bags.\n| &&
    |clear fuchsia bags contain 1 light lime bag, 2 shiny lavender bags.\n| &&
    |muted cyan bags contain 3 vibrant purple bags, 5 posh cyan bags, 4 muted red bags, 4 shiny indigo bags.\n| &&
    |dull cyan bags contain 1 striped black bag.\n| &&
    |light turquoise bags contain 5 plaid orange bags, 2 striped yellow bags.\n| &&
    |clear lime bags contain 4 drab fuchsia bags.\n| &&
    |vibrant lavender bags contain 4 drab olive bags.\n| &&
    |plaid crimson bags contain 1 vibrant cyan bag, 5 striped gray bags, 2 drab gray bags.\n| &&
    |shiny yellow bags contain 5 dark red bags, 1 shiny crimson bag.\n| &&
    |faded cyan bags contain 2 striped tan bags, 5 pale magenta bags.\n| &&
    |light coral bags contain 1 plaid gray bag, 3 plaid magenta bags, 5 faded tan bags, 5 clear blue bags.\n| &&
    |pale blue bags contain 5 vibrant silver bags, 5 pale black bags, 4 dotted red bags.\n| &&
    |dim fuchsia bags contain 1 posh lime bag, 2 bright purple bags, 4 clear tan bags, 1 light green bag.\n| &&
    |muted coral bags contain 5 dark indigo bags, 5 posh plum bags.\n| &&
    |plaid gray bags contain 2 dark crimson bags, 3 vibrant aqua bags, 1 posh lime bag, 5 faded bronze bags.\n| &&
    |dotted cyan bags contain 4 vibrant maroon bags, 3 dull gray bags, 2 dark red bags, 3 pale magenta bags.\n| &&
    |wavy coral bags contain 3 plaid maroon bags, 4 plaid gold bags, 1 posh lavender bag.\n| &&
    |bright crimson bags contain 5 faded bronze bags, 1 dark cyan bag, 4 shiny purple bags, 5 drab gold bags.\n| &&
    |drab lime bags contain 1 dim cyan bag, 3 shiny coral bags, 3 light crimson bags.\n| &&
    |drab red bags contain 3 dim silver bags, 3 dim purple bags.\n| &&
    |dark red bags contain 5 muted gold bags.\n| &&
    |pale coral bags contain 2 posh violet bags.\n| &&
    |bright purple bags contain 4 mirrored lavender bags, 1 bright lime bag, 4 posh gold bags.\n| &&
    |bright brown bags contain 3 faded aqua bags, 2 dull black bags, 4 striped magenta bags.\n| &&
    |faded violet bags contain 5 pale maroon bags, 4 wavy maroon bags, 3 dull gray bags, 4 posh gold bags.\n| &&
    |dark crimson bags contain 3 clear silver bags, 3 muted silver bags, 1 faded aqua bag, 5 drab gold bags.\n| &&
    |dotted red bags contain 2 drab gray bags, 4 clear bronze bags.\n| &&
    |pale bronze bags contain 4 shiny salmon bags, 5 drab bronze bags, 4 dull gray bags.\n| &&
    |plaid silver bags contain 5 wavy black bags, 1 muted plum bag, 5 posh blue bags.\n| &&
    |posh green bags contain 5 shiny white bags, 5 dotted fuchsia bags, 2 pale black bags.\n| &&
    |dotted orange bags contain 5 plaid red bags.\n| &&
    |bright red bags contain 1 faded beige bag.\n| &&
    |pale brown bags contain no other bags.\n| &&
    |drab magenta bags contain 4 dark indigo bags, 5 striped violet bags, 5 bright tan bags, 4 posh salmon bags.\n| &&
    |striped indigo bags contain 3 dotted indigo bags, 3 dim lavender bags, 1 wavy yellow bag, 4 pale gold bags.\n| &&
    |dark tomato bags contain 4 wavy yellow bags, 3 vibrant lavender bags, 1 bright black bag.\n| &&
    |wavy tomato bags contain 1 wavy green bag, 2 plaid red bags, 5 wavy yellow bags.\n| &&
    |dotted aqua bags contain 1 drab green bag, 4 clear chartreuse bags, 5 plaid yellow bags.\n| &&
    |faded black bags contain 5 clear lavender bags.\n| &&
    |muted gray bags contain 2 pale brown bags, 1 bright tan bag.\n| &&
    |bright green bags contain 1 light olive bag.\n| &&
    |wavy yellow bags contain 5 dark red bags.\n| &&
    |dark coral bags contain 4 mirrored turquoise bags, 3 dark maroon bags.\n| &&
    |shiny green bags contain 3 posh turquoise bags, 3 striped yellow bags, 1 bright lime bag, 4 dotted white bags.\n| &&
    |vibrant teal bags contain 1 shiny magenta bag, 5 light maroon bags.\n| &&
    |shiny bronze bags contain 5 pale brown bags.\n| &&
    |mirrored gold bags contain 3 shiny crimson bags, 3 muted turquoise bags, 4 striped fuchsia bags, 3 vibrant lavender bags.\n| &&
    |dotted salmon bags contain 2 dim lime bags, 4 pale tomato bags.\n| &&
    |dotted gold bags contain 1 drab magenta bag, 4 clear fuchsia bags, 3 shiny violet bags, 2 dark indigo bags.\n| &&
    |muted olive bags contain 4 mirrored olive bags.\n| &&
    |pale green bags contain 2 plaid magenta bags, 2 bright lavender bags.\n| &&
    |clear lavender bags contain 2 vibrant gold bags, 5 clear silver bags.\n| &&
    |dark brown bags contain 4 plaid coral bags, 1 dark tan bag, 3 dotted bronze bags.\n| &&
    |dotted brown bags contain 2 wavy brown bags, 1 wavy beige bag.\n| &&
    |wavy gray bags contain 4 pale turquoise bags.\n| &&
    |pale olive bags contain 1 plaid gray bag, 1 striped coral bag.\n| &&
    |pale salmon bags contain 4 striped gray bags, 4 striped tomato bags, 1 bright bronze bag.\n| &&
    |vibrant violet bags contain 5 bright red bags, 5 posh coral bags, 1 wavy aqua bag.\n| &&
    |shiny maroon bags contain 5 clear indigo bags, 1 striped lavender bag.\n| &&
    |vibrant red bags contain 5 mirrored beige bags, 5 wavy indigo bags, 2 light coral bags, 1 mirrored salmon bag.\n| &&
    |posh yellow bags contain 5 drab gray bags, 1 dark silver bag, 3 pale maroon bags.\n| &&
    |clear white bags contain 2 drab olive bags.\n| &&
    |posh red bags contain 1 faded teal bag, 2 wavy crimson bags, 4 vibrant beige bags.\n| &&
    |striped plum bags contain 4 striped purple bags, 2 pale red bags.\n| &&
    |drab violet bags contain 1 wavy black bag.\n| &&
    |posh orange bags contain 1 pale crimson bag, 5 pale magenta bags, 3 dull olive bags.\n| &&
    |clear bronze bags contain 2 clear aqua bags, 5 mirrored plum bags, 2 pale crimson bags.\n| &&
    |plaid white bags contain 2 faded cyan bags, 3 vibrant green bags, 5 wavy red bags.\n| &&
    |vibrant chartreuse bags contain 1 bright red bag, 2 bright gray bags, 5 faded bronze bags, 3 vibrant crimson bags.\n| &&
    |dim bronze bags contain 4 dull tomato bags, 2 pale gold bags, 2 striped yellow bags.\n| &&
    |plaid yellow bags contain 1 pale plum bag, 4 bright purple bags, 1 bright lavender bag.\n| &&
    |light orange bags contain 3 drab bronze bags, 5 wavy coral bags, 4 bright purple bags, 3 dark magenta bags.\n| &&
    |faded magenta bags contain 4 clear tomato bags, 2 drab fuchsia bags, 1 dull gray bag.\n| &&
    |mirrored magenta bags contain 5 vibrant maroon bags, 3 light fuchsia bags, 1 drab olive bag.\n| &&
    |dark teal bags contain 3 shiny chartreuse bags, 5 mirrored fuchsia bags, 4 bright green bags.\n| &&
    |dull teal bags contain 1 bright salmon bag, 1 mirrored salmon bag.\n| &&
    |bright silver bags contain 1 shiny fuchsia bag, 4 dotted blue bags, 5 posh indigo bags.\n| &&
    |dull orange bags contain 2 striped purple bags, 3 muted green bags, 2 vibrant indigo bags.\n| &&
    |dim purple bags contain 1 posh chartreuse bag, 1 dark chartreuse bag, 4 faded indigo bags, 4 bright purple bags.\n| &&
    |pale cyan bags contain 1 mirrored gray bag, 2 muted beige bags, 2 plaid lime bags.\n| &&
    |vibrant gray bags contain 2 mirrored lavender bags, 1 light tomato bag, 3 clear indigo bags.\n| &&
    |dark olive bags contain 1 dim fuchsia bag, 4 plaid teal bags, 1 plaid gold bag, 5 plaid coral bags.\n| &&
    |faded green bags contain 3 pale olive bags, 1 shiny crimson bag, 2 faded silver bags.\n| &&
    |muted plum bags contain 5 dotted white bags, 2 plaid coral bags, 5 dim purple bags, 2 dim fuchsia bags.\n| &&
    |dim blue bags contain 3 pale silver bags.\n| &&
    |dark orange bags contain 3 dull crimson bags, 2 mirrored tan bags.\n| &&
    |bright blue bags contain 4 dark turquoise bags.\n| &&
    |bright black bags contain 3 mirrored lavender bags, 5 mirrored blue bags, 1 faded violet bag.\n| &&
    |light olive bags contain 1 pale beige bag, 1 wavy maroon bag, 5 pale crimson bags, 1 striped gray bag.\n| &&
    |shiny teal bags contain 2 bright white bags.\n| &&
    |posh gold bags contain 1 dark blue bag.\n| &&
    |dull crimson bags contain 2 dim bronze bags.\n| &&
    |muted gold bags contain no other bags.\n| &&
    |striped turquoise bags contain 1 pale silver bag.\n| &&
    |posh olive bags contain 5 drab salmon bags, 2 striped coral bags.\n| &&
    |dim white bags contain 2 vibrant aqua bags, 3 bright green bags, 5 vibrant maroon bags, 4 dim tomato bags.\n| &&
    |pale plum bags contain 5 bright purple bags.\n| &&
    |shiny silver bags contain 1 plaid bronze bag, 3 plaid blue bags.\n| &&
    |muted lime bags contain 1 dull lime bag.\n| &&
    |shiny plum bags contain 2 bright teal bags, 1 striped yellow bag.\n| &&
    |plaid black bags contain 1 bright purple bag.\n| &&
    |dark gold bags contain 5 faded magenta bags, 1 shiny tan bag, 1 muted crimson bag.\n| &&
    |wavy chartreuse bags contain 5 faded beige bags, 3 faded crimson bags.\n| &&
    |light cyan bags contain 4 drab chartreuse bags, 1 clear gray bag, 5 clear indigo bags, 4 vibrant black bags.\n| &&
    |pale red bags contain 2 dark gray bags.\n| &&
    |clear yellow bags contain 2 drab black bags.\n| &&
    |faded silver bags contain 4 drab cyan bags, 3 light cyan bags, 5 clear tan bags.\n| &&
    |plaid turquoise bags contain 4 faded silver bags, 4 striped bronze bags, 1 drab purple bag.\n| &&
    |pale purple bags contain 5 clear chartreuse bags, 1 plaid bronze bag, 5 clear cyan bags, 3 light tan bags.\n| &&
    |bright fuchsia bags contain 4 wavy lavender bags.\n| &&
    |posh blue bags contain 5 muted gold bags, 3 dark gray bags.\n| &&
    |muted crimson bags contain 2 light tomato bags, 3 muted white bags, 4 muted brown bags, 3 faded yellow bags.\n| &&
    |striped fuchsia bags contain 5 vibrant aqua bags.\n| &&
    |pale silver bags contain 1 vibrant orange bag, 5 dull gray bags, 3 bright teal bags, 1 plaid tomato bag.\n| &&
    |faded blue bags contain 4 striped olive bags, 4 dull chartreuse bags.\n| &&
    |striped beige bags contain 3 drab teal bags, 1 posh gold bag.\n| &&
    |plaid maroon bags contain 5 muted turquoise bags, 2 dull aqua bags.\n| &&
    |light tan bags contain 1 mirrored gold bag, 3 shiny white bags, 5 faded maroon bags, 4 dim violet bags.\n| &&
    |mirrored plum bags contain 4 wavy beige bags, 2 dark turquoise bags, 2 plaid teal bags, 5 shiny purple bags.\n| &&
    |wavy teal bags contain 3 vibrant cyan bags, 3 plaid coral bags.\n| &&
    |striped bronze bags contain 3 dotted brown bags, 3 vibrant cyan bags.\n| &&
    |clear black bags contain 3 dim chartreuse bags, 2 vibrant beige bags, 2 clear cyan bags.\n| &&
    |drab purple bags contain 2 plaid red bags, 2 vibrant aqua bags.\n| &&
    |mirrored white bags contain 2 vibrant gray bags.\n| &&
    |shiny coral bags contain no other bags.\n| &&
    |dotted lavender bags contain 2 light brown bags.\n| &&
    |dark salmon bags contain 2 dark maroon bags, 4 dark teal bags.\n| &&
    |wavy bronze bags contain 3 striped teal bags.\n| &&
    |mirrored maroon bags contain 3 light green bags, 1 light chartreuse bag.\n| &&
    |vibrant black bags contain 3 clear bronze bags, 2 dotted beige bags, 2 dark crimson bags.\n| &&
    |clear indigo bags contain 1 light fuchsia bag, 2 striped coral bags.\n| &&
    |mirrored black bags contain 5 plaid lime bags, 1 clear plum bag.\n| &&
    |pale chartreuse bags contain 5 plaid crimson bags.\n| &&
    |dim black bags contain 4 dotted blue bags, 2 drab indigo bags, 3 clear indigo bags.\n| &&
    |striped lime bags contain 5 light fuchsia bags, 1 dim silver bag.\n| &&
    |clear magenta bags contain 4 striped bronze bags, 3 posh orange bags, 4 dotted olive bags, 4 dull cyan bags.\n| &&
    |drab chartreuse bags contain 4 vibrant gold bags, 4 vibrant orange bags, 3 striped red bags, 4 drab olive bags.\n| &&
    |light yellow bags contain 2 dark green bags, 1 light fuchsia bag, 3 bright orange bags.\n| &&
    |drab coral bags contain 5 light red bags, 4 posh plum bags, 4 drab crimson bags, 1 faded magenta bag.\n| &&
    |dull brown bags contain 2 plaid cyan bags, 4 dull aqua bags, 5 posh cyan bags.\n| &&
    |dotted plum bags contain 4 dull brown bags.\n| &&
    |vibrant plum bags contain 1 mirrored plum bag, 5 vibrant olive bags, 5 clear gray bags, 3 mirrored tomato bags.\n| &&
    |mirrored silver bags contain 2 faded indigo bags, 3 striped yellow bags, 3 muted tomato bags.\n| &&
    |pale teal bags contain 5 mirrored white bags, 4 wavy plum bags, 4 pale indigo bags, 2 bright turquoise bags.\n| &&
    |dotted black bags contain 3 plaid coral bags.\n| &&
    |drab gray bags contain 4 plaid red bags.\n| &&
    |striped white bags contain 2 vibrant teal bags, 3 posh aqua bags, 4 faded cyan bags.\n| &&
    |plaid green bags contain 3 mirrored chartreuse bags, 4 wavy yellow bags.\n| &&
    |posh chartreuse bags contain 5 clear gray bags, 1 striped lavender bag, 2 striped coral bags.\n| &&
    |posh turquoise bags contain 4 bright lime bags, 2 vibrant bronze bags.\n| &&
    |muted silver bags contain 2 dull gray bags, 3 plaid tomato bags, 5 light green bags.\n| &&
    |muted salmon bags contain 4 dotted brown bags, 5 dim lavender bags, 3 muted violet bags.\n| &&
    |dotted coral bags contain 4 drab cyan bags.\n| &&
    |striped teal bags contain 2 shiny tan bags, 3 dark turquoise bags, 3 wavy beige bags.\n| &&
    |vibrant coral bags contain 3 vibrant aqua bags, 2 pale brown bags.\n| &&
    |light indigo bags contain 2 dark cyan bags, 5 drab chartreuse bags, 5 clear tomato bags.\n| &&
    |dim tomato bags contain 2 pale lime bags, 2 muted brown bags, 4 dull gray bags.\n| &&
    |dull gray bags contain 3 dotted white bags, 3 drab olive bags, 3 plaid red bags, 2 plaid blue bags.\n| &&
    |bright beige bags contain 5 posh gold bags, 2 dull green bags, 1 wavy brown bag.\n| &&
    |dull coral bags contain 2 shiny gold bags, 2 dark red bags, 4 faded chartreuse bags, 3 vibrant orange bags.\n| &&
    |dark blue bags contain 3 dotted white bags, 5 light green bags, 5 vibrant gold bags, 4 mirrored lavender bags.\n| &&
    |clear turquoise bags contain 5 striped lavender bags, 5 plaid lime bags, 3 clear aqua bags, 1 mirrored salmon bag.\n| &&
    |dull turquoise bags contain 2 vibrant fuchsia bags, 2 light gold bags, 4 striped gray bags.\n| &&
    |clear aqua bags contain 1 mirrored lavender bag.\n| &&
    |drab maroon bags contain 1 mirrored indigo bag, 3 plaid crimson bags, 4 faded aqua bags, 3 clear violet bags.\n| &&
    |dull black bags contain 1 shiny tan bag.\n| &&
    |muted tomato bags contain 4 light green bags.\n| &&
    |muted lavender bags contain 3 pale maroon bags, 2 shiny lavender bags, 1 dark beige bag, 1 light red bag.\n| &&
    |dotted maroon bags contain 3 dotted magenta bags, 4 drab gray bags, 1 clear gray bag.\n| &&
    |muted turquoise bags contain 5 plaid orange bags, 2 vibrant bronze bags.\n| &&
    |striped violet bags contain 2 plaid lavender bags, 4 clear tomato bags, 4 striped crimson bags.\n| &&
    |posh purple bags contain 1 plaid blue bag, 2 pale tan bags, 5 light brown bags, 3 faded indigo bags.\n| &&
    |faded chartreuse bags contain 5 mirrored lavender bags, 2 dark red bags, 2 dull aqua bags.\n| &&
    |plaid fuchsia bags contain 4 mirrored maroon bags, 1 bright blue bag.\n| &&
    |faded teal bags contain 4 bright lavender bags, 5 light green bags, 2 striped yellow bags, 5 drab olive bags.\n| &&
    |mirrored gray bags contain 2 muted green bags, 5 dim cyan bags, 2 drab yellow bags.\n| &&
    |posh bronze bags contain 1 drab blue bag.\n| &&
    |drab yellow bags contain 1 bright lavender bag, 3 vibrant aqua bags, 5 bright beige bags, 2 dull olive bags.\n| &&
    |faded salmon bags contain 5 muted salmon bags.\n| &&
    |mirrored purple bags contain 2 mirrored turquoise bags, 1 pale bronze bag.\n| &&
    |shiny gray bags contain 2 dark bronze bags, 5 drab yellow bags, 2 clear salmon bags.\n| &&
    |posh gray bags contain 4 vibrant tan bags, 5 wavy maroon bags, 1 faded crimson bag.\n| &&
    |vibrant cyan bags contain 5 dark indigo bags, 3 bright purple bags, 1 dotted white bag, 3 muted gold bags.\n| &&
    |dotted fuchsia bags contain 2 plaid olive bags.\n| &&
    |shiny crimson bags contain 4 vibrant coral bags, 2 light brown bags, 1 wavy tan bag, 1 clear tomato bag.\n| &&
    |striped gold bags contain 5 vibrant olive bags, 4 vibrant tomato bags, 1 wavy red bag, 5 bright orange bags.\n| &&
    |dotted magenta bags contain 5 striped yellow bags, 2 dull brown bags, 4 clear silver bags.\n| &&
    |dull violet bags contain 3 posh maroon bags, 1 drab silver bag.\n| &&
    |drab gold bags contain 2 vibrant maroon bags, 5 posh plum bags, 1 shiny indigo bag.\n| &&
    |dull lavender bags contain 4 dull silver bags, 4 bright aqua bags, 2 striped bronze bags.\n| &&
    |faded gray bags contain 1 dim white bag, 1 bright bronze bag, 4 drab violet bags.\n| &&
    |dotted lime bags contain 1 striped white bag, 4 light turquoise bags, 2 light maroon bags.\n| &&
    |mirrored chartreuse bags contain 3 dull coral bags, 1 dark gray bag, 1 bright red bag, 4 posh blue bags.\n| &&
    |drab silver bags contain 2 striped violet bags, 1 light red bag.\n| &&
    |dark beige bags contain 1 posh maroon bag, 1 dark maroon bag, 5 shiny tan bags, 3 faded chartreuse bags.\n| &&
    |dim lavender bags contain 1 dim yellow bag, 3 dark coral bags, 1 wavy plum bag.\n| &&
    |shiny olive bags contain 4 pale gray bags, 5 striped coral bags, 5 dotted green bags.\n| &&
    |dim green bags contain 5 shiny purple bags, 4 mirrored lavender bags.\n| &&
    |clear tomato bags contain 1 clear aqua bag, 4 bright orange bags.\n| &&
    |striped orange bags contain 4 striped plum bags.\n| &&
    |drab green bags contain 3 shiny coral bags, 3 bright purple bags.\n| &&
    |shiny chartreuse bags contain 1 faded violet bag, 5 drab salmon bags, 5 vibrant orange bags.\n| &&
    |shiny magenta bags contain 2 plaid crimson bags.\n| &&
    |dim magenta bags contain 1 dim fuchsia bag, 5 dark red bags, 2 shiny crimson bags.\n| &&
    |dull white bags contain 5 pale tan bags, 1 shiny teal bag, 5 plaid cyan bags, 4 pale green bags.\n| &&
    |posh violet bags contain 4 vibrant orange bags, 5 mirrored fuchsia bags, 2 vibrant coral bags, 4 bright purple bags.\n| &&
    |dotted crimson bags contain 5 vibrant gray bags, 2 dark red bags, 5 vibrant bronze bags.\n| &&
    |dark black bags contain 2 pale maroon bags, 2 striped maroon bags.\n| &&
    |plaid teal bags contain 2 shiny coral bags, 1 posh gold bag.\n| &&
    |muted white bags contain 5 pale plum bags, 3 plaid teal bags.\n| &&
    |dim yellow bags contain 4 dark olive bags, 3 dim lime bags, 5 bright crimson bags, 1 dim fuchsia bag.\n| &&
    |dark lime bags contain 5 posh plum bags, 4 dim tan bags, 3 bright indigo bags.\n| &&
    |muted teal bags contain 4 vibrant purple bags, 5 mirrored orange bags, 3 drab green bags.\n| &&
    |vibrant white bags contain 3 pale plum bags, 2 bright orange bags, 4 posh bronze bags, 2 light yellow bags.\n| &&
    |plaid orange bags contain 2 drab blue bags, 5 plaid lavender bags.\n| &&
    |dim olive bags contain 2 vibrant bronze bags, 5 pale violet bags, 1 pale magenta bag, 4 dim salmon bags.\n| &&
    |light black bags contain 3 shiny purple bags, 4 faded tan bags, 5 light gold bags, 4 vibrant olive bags.\n| &&
    |pale orange bags contain 5 posh maroon bags, 2 clear olive bags, 2 muted beige bags, 2 dim violet bags.\n| &&
    |dull bronze bags contain 5 posh gold bags, 5 dark blue bags, 4 vibrant gold bags.\n| &&
    |faded aqua bags contain 4 striped fuchsia bags, 5 shiny white bags.\n| &&
    |dotted blue bags contain 1 bright salmon bag.\n| &&
    |pale maroon bags contain 1 light green bag, 3 posh gold bags, 2 mirrored lavender bags.\n| &&
    |plaid blue bags contain 5 dull bronze bags, 4 drab blue bags.\n| &&
    |posh cyan bags contain 1 shiny indigo bag, 1 bright purple bag, 5 dotted white bags, 3 vibrant orange bags.\n| &&
    |dim turquoise bags contain 4 clear purple bags, 3 mirrored cyan bags, 4 striped bronze bags.\n| &&
    |dull fuchsia bags contain 4 light black bags.\n| &&
    |striped black bags contain 4 shiny white bags, 3 mirrored blue bags.\n| &&
    |muted tan bags contain 2 plaid gold bags, 1 vibrant lavender bag, 5 plaid tomato bags, 1 dull silver bag.\n| &&
    |plaid tomato bags contain 1 wavy maroon bag, 5 muted brown bags, 4 faded violet bags.\n| &&
    |light tomato bags contain 5 pale maroon bags, 3 shiny indigo bags, 1 dull bronze bag, 1 light green bag.\n| &&
    |vibrant gold bags contain no other bags.\n| &&
    |shiny lime bags contain 1 posh plum bag, 3 vibrant beige bags, 1 clear plum bag.\n| &&
    |drab turquoise bags contain 3 pale beige bags, 5 dull beige bags, 3 dark black bags.\n| &&
    |bright violet bags contain 2 plaid coral bags, 1 vibrant lime bag, 3 pale silver bags.\n| &&
    |dotted white bags contain no other bags.\n| &&
    |dark green bags contain 1 vibrant aqua bag, 3 posh cyan bags.\n| &&
    |dim cyan bags contain 4 light green bags.\n| &&
    |striped aqua bags contain 2 dotted magenta bags.\n| &&
    |posh fuchsia bags contain 4 dull beige bags, 4 light turquoise bags, 5 pale violet bags, 1 pale beige bag.\n| &&
    |clear brown bags contain 4 wavy yellow bags, 1 shiny indigo bag, 5 wavy maroon bags, 1 mirrored lavender bag.\n| &&
    |drab black bags contain 2 striped crimson bags.\n| &&
    |vibrant turquoise bags contain 3 dull black bags.\n| &&
    |muted purple bags contain 4 wavy cyan bags.\n| &&
    |vibrant bronze bags contain 1 drab olive bag.\n| &&
    |light red bags contain 3 vibrant cyan bags, 2 striped gray bags, 4 plaid yellow bags.\n| &&
    |pale turquoise bags contain 4 mirrored lavender bags, 2 posh maroon bags, 2 pale gold bags, 1 clear gray bag.\n| &&
    |shiny aqua bags contain 4 clear silver bags, 3 vibrant lavender bags, 4 wavy olive bags.\n| &&
    |drab teal bags contain 3 faded tan bags.\n| &&
    |mirrored turquoise bags contain 4 clear aqua bags, 3 striped crimson bags, 3 dull black bags.\n| &&
    |vibrant beige bags contain 3 vibrant tan bags, 5 vibrant fuchsia bags.\n| &&
    |dotted bronze bags contain 3 muted lavender bags, 4 drab crimson bags, 1 dotted red bag.\n| &&
    |muted magenta bags contain 2 bright teal bags, 4 dim olive bags, 3 posh brown bags, 1 striped gray bag.\n| &&
    |striped red bags contain no other bags.\n| &&
    |pale lavender bags contain 5 mirrored maroon bags, 3 pale gray bags.\n| &&
    |dim brown bags contain 2 dull gray bags, 4 shiny purple bags, 4 vibrant gold bags.\n| &&
    |muted yellow bags contain 2 posh teal bags, 4 vibrant cyan bags.\n| &&
    |posh tomato bags contain 4 shiny silver bags, 2 mirrored lavender bags.\n| &&
    |faded yellow bags contain 1 muted brown bag, 1 light green bag, 4 pale lime bags.\n| &&
    |vibrant orange bags contain 4 shiny coral bags, 3 drab tan bags, 1 dark blue bag.\n| &&
    |dotted beige bags contain 1 dim olive bag, 2 pale lime bags, 1 plaid lavender bag, 2 wavy brown bags.\n| &&
    |pale magenta bags contain 2 pale brown bags, 2 faded violet bags, 1 dull gray bag, 2 dim green bags.\n| &&
    |plaid coral bags contain 1 wavy brown bag.\n| &&
    |drab indigo bags contain 5 vibrant plum bags, 1 striped crimson bag, 2 dim violet bags.\n| &&
    |pale crimson bags contain 2 wavy brown bags, 1 light green bag, 3 plaid orange bags.\n| &&
    |faded tomato bags contain 4 posh black bags, 1 mirrored orange bag.\n| &&
    |dim chartreuse bags contain 1 pale lime bag.\n| &&
    |bright orange bags contain 5 plaid blue bags.\n| &&
    |light crimson bags contain 3 drab gold bags.\n| &&
    |vibrant aqua bags contain 5 wavy white bags.\n| &&
    |wavy beige bags contain 1 mirrored beige bag, 3 vibrant maroon bags, 3 light green bags.\n| &&
    |dotted gray bags contain 1 dark cyan bag, 5 mirrored fuchsia bags.\n| &&
    |dim lime bags contain 5 vibrant maroon bags, 3 striped coral bags, 2 plaid crimson bags, 5 dotted magenta bags.\n| &&
    |faded purple bags contain 3 muted brown bags, 2 clear plum bags, 3 posh plum bags.\n| &&
    |dim orange bags contain 2 dotted lime bags, 3 posh violet bags, 4 dotted indigo bags.\n| &&
    |faded indigo bags contain 3 light brown bags, 3 plaid maroon bags, 1 bright aqua bag, 2 plaid red bags.\n| &&
    |shiny salmon bags contain 1 drab bronze bag, 5 faded yellow bags, 3 vibrant gold bags.\n| &&
    |light lime bags contain 1 vibrant plum bag.\n| &&
    |muted orange bags contain 5 posh red bags.\n| &&
    |vibrant fuchsia bags contain 5 drab gray bags, 4 clear chartreuse bags, 2 posh blue bags.\n| &&
    |faded turquoise bags contain 2 vibrant indigo bags, 5 dotted indigo bags, 3 mirrored silver bags.\n| &&
    |wavy indigo bags contain 3 vibrant white bags, 5 clear chartreuse bags.\n| &&
    |striped brown bags contain 4 dull aqua bags, 3 bright yellow bags.\n| &&
    |dotted violet bags contain 4 mirrored beige bags, 4 striped gray bags, 2 dim chartreuse bags, 3 dim brown bags.\n| &&
    |dark chartreuse bags contain 5 dark turquoise bags, 4 drab gold bags.\n| &&
    |drab tomato bags contain 3 striped magenta bags, 5 shiny tomato bags.\n| &&
    |striped gray bags contain 3 shiny coral bags, 4 pale brown bags, 5 light green bags.\n| &&
    |wavy olive bags contain 5 shiny silver bags, 3 plaid blue bags, 5 shiny coral bags.\n| &&
    |mirrored tomato bags contain 5 clear plum bags, 3 bright aqua bags, 4 bright lime bags.\n| &&
    |dark magenta bags contain 2 posh lavender bags, 5 light brown bags.\n| &&
    |shiny cyan bags contain 2 drab yellow bags, 4 dotted bronze bags.\n| &&
    |light white bags contain 3 wavy turquoise bags, 3 vibrant beige bags.\n| &&
    |shiny indigo bags contain 4 pale brown bags, 1 drab olive bag, 2 dark red bags, 1 striped gray bag.\n| &&
    |wavy lime bags contain 3 dark cyan bags, 1 vibrant green bag.\n| &&
    |vibrant brown bags contain 4 light bronze bags, 1 drab black bag.\n| &&
    |drab tan bags contain 1 striped gray bag.\n| &&
    |dotted yellow bags contain 5 dotted coral bags, 4 striped magenta bags.\n| &&
    |shiny brown bags contain 3 dull beige bags, 2 striped silver bags.\n| &&
    |dull chartreuse bags contain 3 pale black bags.\n| &&
    |pale aqua bags contain 1 posh turquoise bag, 3 vibrant aqua bags, 4 shiny white bags.\n| &&
    |muted indigo bags contain 4 dotted aqua bags, 3 striped black bags, 3 pale lime bags, 3 dotted violet bags.\n| &&
    |mirrored yellow bags contain 1 dim chartreuse bag, 3 pale black bags.\n| &&
    |posh beige bags contain 1 plaid bronze bag, 5 vibrant tan bags, 3 posh tomato bags.\n| &&
    |dim plum bags contain 3 plaid gold bags, 4 dim chartreuse bags, 1 pale green bag.\n| &&
    |wavy violet bags contain 5 striped turquoise bags, 4 drab chartreuse bags, 4 plaid maroon bags.\n| &&
    |dim crimson bags contain 1 posh chartreuse bag.\n| &&
    |dull salmon bags contain 3 muted black bags.\n| &&
    |vibrant blue bags contain 4 dark white bags, 5 mirrored plum bags.\n| &&
    |bright gray bags contain 4 bright lavender bags.\n| &&
    |bright plum bags contain 4 bright tomato bags, 3 light gold bags, 2 bright aqua bags, 4 striped red bags.\n| &&
    |clear chartreuse bags contain 1 plaid yellow bag.\n| &&
    |shiny tan bags contain 4 pale maroon bags.\n| &&
    |mirrored brown bags contain 2 pale maroon bags, 3 dark beige bags, 1 mirrored lime bag, 4 bright purple bags.\n| &&
    |plaid plum bags contain 5 pale magenta bags, 2 mirrored lavender bags, 2 plaid gold bags.\n| &&
    |faded crimson bags contain 4 plaid maroon bags, 1 light turquoise bag, 5 posh purple bags, 1 wavy beige bag.\n| &&
    |clear blue bags contain 3 dim salmon bags, 2 wavy fuchsia bags, 3 vibrant olive bags.\n| &&
    |light aqua bags contain 4 posh aqua bags, 4 striped black bags.\n| &&
    |bright chartreuse bags contain 2 plaid olive bags, 4 striped lavender bags.\n| &&
    |plaid tan bags contain 1 vibrant aqua bag.\n| &&
    |faded red bags contain 1 plaid maroon bag, 2 muted coral bags, 4 light brown bags.\n| &&
    |clear gold bags contain 4 striped red bags, 3 shiny gold bags, 4 light green bags, 4 dark blue bags.\n| &&
    |light teal bags contain 5 muted tomato bags, 3 dim cyan bags.\n| &&
    |pale gold bags contain 4 dim fuchsia bags, 4 dark indigo bags.\n| &&
    |faded maroon bags contain 5 dim silver bags, 4 vibrant cyan bags, 3 plaid coral bags, 3 bright purple bags.\n| &&
    |plaid red bags contain 2 dull bronze bags, 5 bright lime bags.\n| &&
    |mirrored blue bags contain 2 plaid coral bags, 5 dull indigo bags, 4 drab chartreuse bags, 3 vibrant gold bags.\n| &&
    |faded orange bags contain 2 wavy green bags, 5 bright purple bags, 1 dark cyan bag.\n| &&
    |mirrored fuchsia bags contain 5 light green bags.\n| &&
    |dark turquoise bags contain 4 bright white bags.\n| &&
    |shiny violet bags contain 1 pale magenta bag.\n| &&
    |shiny tomato bags contain 2 pale violet bags, 4 pale brown bags.\n| &&
    |posh magenta bags contain 2 shiny tan bags, 2 vibrant tan bags.\n| &&
    |plaid magenta bags contain 1 drab chartreuse bag, 1 vibrant orange bag, 2 plaid red bags, 2 faded yellow bags.\n| &&
    |light blue bags contain 5 dotted bronze bags, 3 dotted brown bags.\n| &&
    |plaid indigo bags contain 3 bright orange bags.\n| &&
    |striped tomato bags contain 2 striped yellow bags.\n| &&
    |shiny purple bags contain 5 dull bronze bags, 3 dull aqua bags.\n| &&
    |posh white bags contain 1 plaid teal bag, 1 striped blue bag, 3 posh magenta bags.\n| &&
    |clear violet bags contain 1 drab bronze bag.\n| &&
    |muted blue bags contain 3 dotted bronze bags, 2 light olive bags.\n| &&
    |muted chartreuse bags contain 4 posh purple bags, 1 dull magenta bag, 1 dim silver bag, 5 bright indigo bags.\n| &&
    |dark purple bags contain 3 faded aqua bags, 2 dull beige bags, 4 plaid coral bags, 1 pale black bag.\n| &&
    |wavy silver bags contain 5 muted salmon bags, 2 bright salmon bags, 1 posh magenta bag, 2 dim brown bags.\n| &&
    |posh black bags contain 1 dim tomato bag.\n| &&
    |bright lavender bags contain 1 vibrant crimson bag, 3 posh turquoise bags, 5 faded yellow bags.\n| &&
    |dull green bags contain 3 faded chartreuse bags, 2 faded beige bags, 2 shiny coral bags.\n| &&
    |posh crimson bags contain 5 bright red bags, 3 clear brown bags, 4 shiny salmon bags, 3 vibrant orange bags.\n| &&
    |plaid gold bags contain 2 plaid tomato bags, 4 muted turquoise bags, 4 clear salmon bags.\n| &&
    |bright coral bags contain 5 mirrored lavender bags, 1 bright yellow bag, 4 clear black bags, 5 posh lavender bags.\n| &&
    |wavy black bags contain 3 dim salmon bags.\n| &&
    |clear silver bags contain 4 plaid magenta bags.\n| &&
    |striped lavender bags contain 3 muted gold bags, 4 light brown bags, 2 vibrant green bags.\n| &&
    |dull blue bags contain 2 plaid violet bags, 5 vibrant white bags.\n| &&
    |dull olive bags contain 2 clear chartreuse bags, 1 pale violet bag, 2 vibrant crimson bags.\n| &&
    |wavy tan bags contain 4 posh cyan bags, 5 clear silver bags.\n| &&
    |bright salmon bags contain 1 drab tan bag, 1 dull indigo bag.\n| &&
    |wavy turquoise bags contain 1 dark maroon bag.\n| &&
    |drab olive bags contain 2 muted gold bags, 5 dark blue bags, 4 mirrored lavender bags.\n| &&
    |drab cyan bags contain 1 drab blue bag, 1 vibrant bronze bag.\n| &&
    |pale beige bags contain 5 clear gold bags, 3 dim tomato bags, 5 posh crimson bags, 2 drab gray bags.\n| &&
    |bright teal bags contain 1 wavy maroon bag, 4 dim green bags, 2 shiny tan bags.\n| &&
    |drab aqua bags contain 3 clear cyan bags, 3 dull silver bags.\n| &&
    |shiny white bags contain 4 dim green bags, 5 faded violet bags, 5 posh cyan bags, 4 pale brown bags.\n| &&
    |bright magenta bags contain 1 bright indigo bag.\n| &&
    |bright yellow bags contain 1 dark red bag, 2 posh cyan bags.\n| &&
    |dotted tomato bags contain 4 drab salmon bags, 1 shiny coral bag, 1 faded beige bag, 2 shiny magenta bags.\n| &&
    |vibrant silver bags contain 5 clear orange bags.\n| &&
    |dark aqua bags contain 3 bright tan bags, 3 dim cyan bags, 1 plaid chartreuse bag, 1 clear orange bag.\n| &&
    |shiny red bags contain 4 clear tomato bags.\n| &&
    |plaid lime bags contain 3 mirrored lavender bags, 4 drab green bags.\n| &&
    |shiny gold bags contain 4 striped yellow bags, 3 drab olive bags, 1 bright purple bag.\n| &&
    |bright maroon bags contain 5 dull indigo bags, 1 mirrored lavender bag, 5 posh salmon bags.\n| &&
    |light bronze bags contain 3 dim tan bags, 4 dotted brown bags, 1 drab green bag.\n| &&
    |light fuchsia bags contain 3 shiny crimson bags, 2 bright salmon bags.\n| &&
    |faded plum bags contain 3 dull brown bags.\n| &&
    |posh silver bags contain 3 wavy bronze bags, 2 plaid green bags, 5 drab fuchsia bags, 1 wavy red bag.\n| &&
    |bright tomato bags contain 2 bright black bags, 2 clear brown bags.\n| &&
    |dull gold bags contain 1 dark salmon bag.\n| &&
    |clear plum bags contain 1 mirrored tan bag, 1 shiny coral bag, 2 clear tan bags.\n| &&
    |pale tan bags contain 1 bright red bag, 5 light yellow bags, 4 vibrant olive bags.\n| &&
    |plaid salmon bags contain 3 drab maroon bags, 1 posh black bag, 1 vibrant blue bag.\n| &&
    |striped silver bags contain 4 faded coral bags, 5 clear black bags, 4 dark chartreuse bags, 5 pale tan bags.\n| &&
    |faded brown bags contain 5 wavy black bags.\n| &&
    |faded gold bags contain 5 plaid maroon bags, 4 posh blue bags, 4 posh crimson bags, 1 bright teal bag.\n| &&
    |dull tomato bags contain 4 muted coral bags, 5 drab tan bags.\n| &&
    |dotted turquoise bags contain 5 light gray bags, 4 plaid cyan bags, 5 dark lime bags.\n| &&
    |dull indigo bags contain 4 plaid red bags, 5 bright aqua bags.\n| &&
    |dull yellow bags contain 4 muted crimson bags, 5 bright black bags.\n| &&
    |striped yellow bags contain 4 dark red bags, 3 vibrant crimson bags, 4 vibrant maroon bags, 1 mirrored lavender bag.\n| &&
    |dotted indigo bags contain 4 drab turquoise bags, 2 posh purple bags.\n| &&
    |mirrored aqua bags contain 4 plaid blue bags, 1 dark white bag, 4 bright magenta bags, 5 drab lime bags.\n| &&
    |striped blue bags contain 5 dotted red bags, 3 light fuchsia bags, 3 light crimson bags, 5 striped yellow bags.\n| &&
    |shiny orange bags contain 1 shiny crimson bag, 4 vibrant silver bags.\n| &&
    |dim maroon bags contain 2 bright lavender bags.\n| &&
    |wavy gold bags contain 2 muted chartreuse bags.\n| &&
    |bright bronze bags contain 1 posh crimson bag, 4 wavy red bags.\n| &&
    |dark fuchsia bags contain 2 pale tan bags, 3 posh orange bags, 1 shiny chartreuse bag.\n| &&
    |pale violet bags contain 1 drab green bag, 1 drab tan bag.\n| &&
    |bright turquoise bags contain 2 posh gold bags, 3 dull green bags, 2 pale tan bags.\n| &&
    |wavy salmon bags contain 5 plaid olive bags, 5 posh cyan bags.\n| &&
    |wavy magenta bags contain 5 plaid chartreuse bags, 5 muted bronze bags.\n| &&
    |dark violet bags contain 3 dim chartreuse bags, 1 faded aqua bag.\n| &&
    |dull silver bags contain 5 plaid orange bags.\n| &&
    |vibrant purple bags contain 2 mirrored turquoise bags, 5 plaid gray bags.\n| &&
    |dark lavender bags contain 4 dull red bags.\n| &&
    |dark silver bags contain 1 posh brown bag, 4 wavy white bags, 5 muted fuchsia bags, 1 clear plum bag.\n| &&
    |dark gray bags contain 4 wavy white bags, 5 plaid lavender bags, 2 dull aqua bags, 4 bright purple bags.\n| &&
    |pale indigo bags contain 5 plaid green bags, 2 dull aqua bags.\n| &&
    |posh maroon bags contain 4 plaid magenta bags, 4 bright orange bags.\n| &&
    |muted violet bags contain 4 muted brown bags.\n| &&
    |mirrored violet bags contain 3 dim tomato bags.\n| &&
    |posh lavender bags contain 3 muted turquoise bags, 4 wavy maroon bags.\n| &&
    |posh tan bags contain 4 muted coral bags, 4 shiny beige bags, 5 light red bags, 4 faded beige bags.\n| &&
    |vibrant crimson bags contain 4 mirrored lavender bags, 2 mirrored beige bags, 1 striped red bag.\n| &&
    |bright white bags contain 3 striped fuchsia bags, 2 mirrored tan bags, 4 dull bronze bags, 4 posh plum bags.\n| &&
    |bright cyan bags contain 5 light cyan bags, 3 vibrant crimson bags, 1 faded cyan bag.\n| &&
    |clear beige bags contain 1 plaid yellow bag, 5 drab white bags, 2 drab lime bags, 5 dim orange bags.\n| &&
    |mirrored coral bags contain 2 light tomato bags, 3 wavy bronze bags, 3 mirrored fuchsia bags.\n| &&
    |vibrant olive bags contain 2 posh turquoise bags, 3 mirrored fuchsia bags, 4 dotted beige bags.\n| &&
    |shiny black bags contain 2 faded coral bags, 4 plaid indigo bags, 3 dark violet bags, 4 posh indigo bags.\n| &&
    |mirrored green bags contain 4 bright teal bags.\n| &&
    |clear purple bags contain 1 posh turquoise bag, 3 dull black bags, 3 faded violet bags.\n| &&
    |vibrant tan bags contain 4 drab blue bags.\n| &&
    |mirrored crimson bags contain 2 mirrored chartreuse bags, 4 muted red bags, 4 vibrant purple bags.\n| &&
    |posh teal bags contain 4 dim fuchsia bags, 2 shiny tan bags, 2 dull indigo bags, 3 pale plum bags.\n| &&
    |striped salmon bags contain 3 plaid fuchsia bags, 3 muted teal bags.\n| &&
    |wavy fuchsia bags contain 1 drab green bag, 2 dim salmon bags, 2 light crimson bags, 4 muted turquoise bags.\n| &&
    |clear cyan bags contain 4 mirrored cyan bags, 1 dull bronze bag, 4 dim brown bags.\n| &&
    |posh coral bags contain 3 pale beige bags, 2 plaid salmon bags.\n| &&
    |shiny beige bags contain 5 faded violet bags.\n| &&
    |wavy cyan bags contain 2 posh lime bags, 2 dotted white bags, 4 dim lime bags.\n| &&
    |dark tan bags contain 5 clear green bags, 1 light cyan bag, 5 light chartreuse bags, 1 dark lime bag.\n| &&
    |clear coral bags contain 2 wavy beige bags, 2 muted cyan bags, 5 dark turquoise bags, 4 posh green bags.\n| &&
    |drab orange bags contain 5 wavy salmon bags, 5 wavy olive bags, 3 posh green bags.\n| &&
    |vibrant maroon bags contain no other bags.\n| &&
    |drab beige bags contain 1 dark red bag.\n| &&
    |muted bronze bags contain 4 striped teal bags, 5 faded brown bags, 4 light silver bags, 3 muted beige bags.\n| &&
    |muted fuchsia bags contain 2 shiny coral bags, 4 dull tomato bags, 1 wavy teal bag, 5 faded tan bags.\n| &&
    |plaid brown bags contain 5 dull magenta bags.\n| &&
    |dim salmon bags contain 3 mirrored lavender bags, 2 shiny salmon bags, 4 plaid lavender bags.\n| &&
    |wavy purple bags contain 1 shiny yellow bag, 1 dim plum bag.\n| &&
    |bright aqua bags contain 4 plaid red bags, 5 pale lime bags, 5 bright lime bags.\n| &&
    |vibrant lime bags contain 5 light green bags.\n| &&
    |dark maroon bags contain 5 drab bronze bags, 4 bright red bags, 1 posh cyan bag.\n| &&
    |wavy red bags contain 2 mirrored beige bags, 5 muted crimson bags, 5 vibrant orange bags, 3 posh turquoise bags.\n| &&
    |drab brown bags contain 1 faded tan bag, 3 vibrant maroon bags.|.
  ENDMETHOD.


  METHOD get_bags_that_contain.

    DATA(pattern) = |*contain*{ color }*.|.
    LOOP AT rules_table INTO DATA(rule) WHERE table_line CP pattern.
      DATA(bag_color) = substring_before( val = rule sub = ' bags contain' ).
      IF NOT line_exists( bag_tab[ table_line = bag_color ] ).
        APPEND bag_color TO bag_tab.
      ENDIF.
    ENDLOOP.

  ENDMETHOD.

  METHOD if_oo_adt_classrun~main.
    set_rules( build_riddle( ) ).
    out->write( |Bags that contain at least one shiny gold bag: | && count_bags( 'shiny gold' ) ).
    out->write( |Shiny gold bag contains: | && contains_bags( 'shiny gold' ) ).
  ENDMETHOD.


  METHOD contains_bags.
    DATA(pattern) = |{ color } bags contain* |.
    FIND REGEX pattern IN TABLE me->rules_table RESULTS DATA(found).
    CHECK found IS NOT INITIAL.

    DATA(rule) = rules_table[ found-line ].
    CHECK NOT rule CS 'no other bags.'.

    DATA(content) = substring_after( val = rule sub = 'contain ' ).
    SPLIT content AT ', ' INTO TABLE DATA(contents).
    bags = REDUCE #( INIT b = 0
                     FOR cnt IN contents NEXT
                     b += CONV i( substring_before( val = condense( cnt ) regex = '\s' ) )
                       +  CONV i( substring_before( val = condense( cnt ) regex = '\s' ) )
                       * contains_bags( substring_before(
                                          val = substring_after( val = condense( cnt ) regex = '\d\s' )
                                          sub = ' bag' ) ) ).

  ENDMETHOD.

ENDCLASS.
