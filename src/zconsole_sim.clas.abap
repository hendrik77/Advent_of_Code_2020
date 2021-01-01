CLASS zconsole_sim DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES
      if_oo_adt_classrun.
    DATA accumulator TYPE i READ-ONLY.
    DATA terminated TYPE abap_boolean READ-ONLY.
    METHODS load_program IMPORTING i_program TYPE string.
    METHODS run.
    METHODS repair.

  PROTECTED SECTION.
  PRIVATE SECTION.
    CONSTANTS nop TYPE string VALUE 'nop' ##NO_TEXT.
    CONSTANTS acc TYPE string VALUE 'acc' ##NO_TEXT.
    CONSTANTS jmp TYPE string VALUE 'jmp' ##NO_TEXT.
    DATA program TYPE string_table.
    METHODS build_riddle
      RETURNING VALUE(riddle) TYPE string.
ENDCLASS.

CLASS zconsole_sim IMPLEMENTATION.
  METHOD load_program.
    SPLIT i_program AT cl_abap_char_utilities=>newline INTO TABLE program.
  ENDMETHOD.

  METHOD run.
    DATA visited TYPE SORTED TABLE OF i WITH UNIQUE KEY table_line.
    CLEAR accumulator.

    DATA(pointer) = 1.
    DO.
      INSERT pointer INTO TABLE visited.
      DATA(instruction) = program[ pointer ].
      CASE instruction(3).
        WHEN nop.
          pointer += 1.
        WHEN acc.
          accumulator += CONV i( substring( val = instruction off = 4 ) ).
          pointer += 1.
        WHEN jmp.
          pointer += CONV i( substring( val = instruction off = 4 ) ).
      ENDCASE.

      IF line_exists( visited[ table_line = pointer ] ).
        EXIT.
      ELSEIF pointer = lines( program ) + 1. "points to last instruction + 1
        terminated = abap_true.
        EXIT.
      ENDIF.
    ENDDO.
  ENDMETHOD.

  METHOD if_oo_adt_classrun~main.
    load_program( build_riddle( ) ).

    "Part 1
    run( ).
    out->write( |Accumulator = { accumulator }| ).

    "Part 2
    repair( ).
    out->write( |repaired Accumulator = { accumulator }| ).
  ENDMETHOD.

  METHOD repair.
    run( ).

    IF terminated = abap_false.
      LOOP AT program ASSIGNING FIELD-SYMBOL(<instruction>)
        WHERE table_line CS jmp
           OR table_line CS nop.
        DATA(old_instruction) = <instruction>.
        <instruction> = replace( val = <instruction>
                                 sub = <instruction>(3)
                                 with = SWITCH #( <instruction>(3) WHEN jmp THEN nop ELSE jmp ) ).
        run( ).
        IF terminated = abap_true.
          EXIT.
        ELSE.
          <instruction> = old_instruction.
        ENDIF.
      ENDLOOP.
    ENDIF.
  ENDMETHOD.

  METHOD build_riddle.
    riddle =
      |acc -5\n| &&
      |acc +48\n| &&
      |acc -1\n| &&
      |acc +5\n| &&
      |jmp +426\n| &&
      |acc +8\n| &&
      |jmp +72\n| &&
      |acc +22\n| &&
      |nop +64\n| &&
      |acc +18\n| &&
      |jmp +447\n| &&
      |acc +9\n| &&
      |acc +21\n| &&
      |acc -1\n| &&
      |acc -18\n| &&
      |jmp +349\n| &&
      |jmp +475\n| &&
      |acc +10\n| &&
      |nop +273\n| &&
      |acc -12\n| &&
      |acc +16\n| &&
      |jmp +519\n| &&
      |jmp +315\n| &&
      |acc -15\n| &&
      |acc +7\n| &&
      |acc +41\n| &&
      |acc -3\n| &&
      |jmp +97\n| &&
      |acc +28\n| &&
      |jmp +245\n| &&
      |acc +20\n| &&
      |acc -13\n| &&
      |acc +14\n| &&
      |jmp +304\n| &&
      |acc +20\n| &&
      |nop +73\n| &&
      |acc +0\n| &&
      |jmp +308\n| &&
      |jmp +1\n| &&
      |acc +6\n| &&
      |acc -18\n| &&
      |nop -7\n| &&
      |jmp +327\n| &&
      |acc +39\n| &&
      |acc -14\n| &&
      |jmp +473\n| &&
      |jmp +1\n| &&
      |nop +31\n| &&
      |acc -17\n| &&
      |jmp +496\n| &&
      |nop +449\n| &&
      |jmp +163\n| &&
      |acc +50\n| &&
      |nop -31\n| &&
      |nop -11\n| &&
      |acc -7\n| &&
      |jmp +29\n| &&
      |nop +376\n| &&
      |nop +311\n| &&
      |acc +14\n| &&
      |acc -11\n| &&
      |jmp +24\n| &&
      |acc -13\n| &&
      |jmp +237\n| &&
      |jmp +518\n| &&
      |jmp +246\n| &&
      |jmp +380\n| &&
      |acc +40\n| &&
      |acc +17\n| &&
      |acc +42\n| &&
      |acc -14\n| &&
      |jmp +293\n| &&
      |acc +8\n| &&
      |acc +25\n| &&
      |acc +9\n| &&
      |nop +251\n| &&
      |jmp +464\n| &&
      |jmp +409\n| &&
      |jmp +452\n| &&
      |jmp +1\n| &&
      |acc -6\n| &&
      |jmp +230\n| &&
      |jmp +106\n| &&
      |acc -13\n| &&
      |jmp +40\n| &&
      |jmp +452\n| &&
      |acc +16\n| &&
      |jmp +37\n| &&
      |acc -11\n| &&
      |jmp +118\n| &&
      |acc -5\n| &&
      |nop +322\n| &&
      |acc +4\n| &&
      |jmp +425\n| &&
      |nop +61\n| &&
      |nop +190\n| &&
      |acc +37\n| &&
      |acc +44\n| &&
      |jmp +275\n| &&
      |acc +32\n| &&
      |jmp -78\n| &&
      |jmp +485\n| &&
      |nop -1\n| &&
      |acc +50\n| &&
      |jmp +424\n| &&
      |jmp +423\n| &&
      |acc +23\n| &&
      |jmp +460\n| &&
      |acc -11\n| &&
      |acc +10\n| &&
      |jmp -67\n| &&
      |acc -14\n| &&
      |acc -14\n| &&
      |acc +39\n| &&
      |acc -6\n| &&
      |jmp +331\n| &&
      |acc +12\n| &&
      |acc +7\n| &&
      |acc +29\n| &&
      |jmp +65\n| &&
      |nop -26\n| &&
      |jmp +1\n| &&
      |acc +45\n| &&
      |jmp +188\n| &&
      |acc +23\n| &&
      |acc +42\n| &&
      |acc +18\n| &&
      |acc +34\n| &&
      |jmp -94\n| &&
      |acc +35\n| &&
      |acc +0\n| &&
      |nop +282\n| &&
      |acc +33\n| &&
      |jmp +297\n| &&
      |acc +10\n| &&
      |acc +16\n| &&
      |jmp +142\n| &&
      |acc -9\n| &&
      |jmp +9\n| &&
      |acc +35\n| &&
      |jmp +15\n| &&
      |jmp +1\n| &&
      |acc -19\n| &&
      |acc +18\n| &&
      |jmp +156\n| &&
      |jmp +230\n| &&
      |jmp +421\n| &&
      |acc +33\n| &&
      |acc -2\n| &&
      |acc +24\n| &&
      |acc +17\n| &&
      |jmp -66\n| &&
      |acc +32\n| &&
      |acc +38\n| &&
      |jmp -76\n| &&
      |acc +13\n| &&
      |jmp +74\n| &&
      |acc +30\n| &&
      |acc +49\n| &&
      |jmp +220\n| &&
      |nop -44\n| &&
      |acc +36\n| &&
      |nop -23\n| &&
      |nop -29\n| &&
      |jmp +157\n| &&
      |acc -3\n| &&
      |acc -13\n| &&
      |jmp -124\n| &&
      |nop +350\n| &&
      |acc +29\n| &&
      |acc +7\n| &&
      |acc +42\n| &&
      |jmp +282\n| &&
      |acc -4\n| &&
      |acc +33\n| &&
      |acc +50\n| &&
      |acc +1\n| &&
      |jmp +101\n| &&
      |acc +13\n| &&
      |nop +369\n| &&
      |acc -11\n| &&
      |acc -2\n| &&
      |jmp +56\n| &&
      |jmp -5\n| &&
      |acc -1\n| &&
      |acc -1\n| &&
      |jmp +52\n| &&
      |jmp +246\n| &&
      |acc +38\n| &&
      |acc -11\n| &&
      |jmp +30\n| &&
      |acc +18\n| &&
      |nop +15\n| &&
      |jmp +67\n| &&
      |jmp -112\n| &&
      |acc -14\n| &&
      |jmp -8\n| &&
      |nop -73\n| &&
      |jmp +4\n| &&
      |acc +0\n| &&
      |nop +111\n| &&
      |jmp +317\n| &&
      |acc -17\n| &&
      |nop +108\n| &&
      |jmp +91\n| &&
      |acc +9\n| &&
      |jmp +324\n| &&
      |acc +35\n| &&
      |acc +9\n| &&
      |acc +31\n| &&
      |nop +208\n| &&
      |jmp +177\n| &&
      |acc -17\n| &&
      |jmp -135\n| &&
      |jmp +46\n| &&
      |nop +145\n| &&
      |acc +41\n| &&
      |acc -4\n| &&
      |acc -17\n| &&
      |jmp -147\n| &&
      |acc +8\n| &&
      |jmp +357\n| &&
      |acc +25\n| &&
      |jmp +231\n| &&
      |acc -19\n| &&
      |acc +46\n| &&
      |jmp +268\n| &&
      |acc -18\n| &&
      |acc +34\n| &&
      |jmp +3\n| &&
      |jmp -83\n| &&
      |jmp +294\n| &&
      |jmp +89\n| &&
      |nop +27\n| &&
      |acc +32\n| &&
      |acc -1\n| &&
      |acc +5\n| &&
      |jmp +230\n| &&
      |acc +9\n| &&
      |nop -92\n| &&
      |jmp -146\n| &&
      |acc +16\n| &&
      |nop +91\n| &&
      |jmp +251\n| &&
      |jmp +1\n| &&
      |acc +50\n| &&
      |jmp -49\n| &&
      |acc +28\n| &&
      |nop -60\n| &&
      |jmp -29\n| &&
      |nop +328\n| &&
      |acc -13\n| &&
      |jmp +115\n| &&
      |jmp +160\n| &&
      |jmp +1\n| &&
      |acc +34\n| &&
      |acc +44\n| &&
      |acc -18\n| &&
      |jmp +40\n| &&
      |jmp +305\n| &&
      |acc -18\n| &&
      |acc +44\n| &&
      |jmp -174\n| &&
      |acc +15\n| &&
      |nop -62\n| &&
      |jmp +275\n| &&
      |nop +34\n| &&
      |nop +59\n| &&
      |acc +27\n| &&
      |jmp -212\n| &&
      |acc +8\n| &&
      |acc +36\n| &&
      |acc +2\n| &&
      |jmp +27\n| &&
      |jmp -240\n| &&
      |acc +10\n| &&
      |acc +22\n| &&
      |jmp +225\n| &&
      |acc -13\n| &&
      |jmp +246\n| &&
      |jmp -230\n| &&
      |jmp +120\n| &&
      |acc -14\n| &&
      |acc -19\n| &&
      |jmp +261\n| &&
      |acc +8\n| &&
      |jmp -170\n| &&
      |acc -17\n| &&
      |acc +33\n| &&
      |acc +43\n| &&
      |jmp +16\n| &&
      |acc +6\n| &&
      |acc +25\n| &&
      |jmp +140\n| &&
      |jmp +12\n| &&
      |jmp -101\n| &&
      |acc +1\n| &&
      |jmp +67\n| &&
      |jmp +141\n| &&
      |jmp +219\n| &&
      |jmp -46\n| &&
      |acc +20\n| &&
      |acc +6\n| &&
      |acc +39\n| &&
      |acc +43\n| &&
      |jmp +32\n| &&
      |acc +46\n| &&
      |jmp -41\n| &&
      |acc -1\n| &&
      |acc +48\n| &&
      |jmp +220\n| &&
      |acc +13\n| &&
      |acc +33\n| &&
      |acc -9\n| &&
      |nop -206\n| &&
      |jmp -137\n| &&
      |acc +35\n| &&
      |acc +11\n| &&
      |acc -12\n| &&
      |acc -2\n| &&
      |jmp +1\n| &&
      |acc +11\n| &&
      |acc +15\n| &&
      |jmp -73\n| &&
      |jmp +1\n| &&
      |jmp +142\n| &&
      |jmp +1\n| &&
      |acc +29\n| &&
      |acc -7\n| &&
      |acc +45\n| &&
      |jmp -302\n| &&
      |acc -9\n| &&
      |jmp +5\n| &&
      |acc +14\n| &&
      |acc +5\n| &&
      |jmp -313\n| &&
      |jmp -86\n| &&
      |acc -11\n| &&
      |acc +13\n| &&
      |acc +3\n| &&
      |jmp +171\n| &&
      |acc -8\n| &&
      |acc +47\n| &&
      |nop +205\n| &&
      |jmp +181\n| &&
      |acc -19\n| &&
      |acc +26\n| &&
      |jmp -340\n| &&
      |acc +31\n| &&
      |acc +45\n| &&
      |acc +16\n| &&
      |acc +16\n| &&
      |jmp -41\n| &&
      |acc +44\n| &&
      |jmp +76\n| &&
      |acc +0\n| &&
      |acc +47\n| &&
      |acc +9\n| &&
      |acc -12\n| &&
      |jmp +159\n| &&
      |acc +21\n| &&
      |jmp -50\n| &&
      |jmp +1\n| &&
      |jmp -18\n| &&
      |acc +46\n| &&
      |jmp -5\n| &&
      |jmp +120\n| &&
      |jmp +51\n| &&
      |jmp +123\n| &&
      |acc +28\n| &&
      |nop -288\n| &&
      |jmp -293\n| &&
      |jmp -39\n| &&
      |jmp -309\n| &&
      |jmp -206\n| &&
      |jmp -274\n| &&
      |acc -10\n| &&
      |acc +39\n| &&
      |jmp +124\n| &&
      |acc +6\n| &&
      |acc -12\n| &&
      |acc -12\n| &&
      |jmp -294\n| &&
      |acc +30\n| &&
      |acc +42\n| &&
      |acc +30\n| &&
      |acc -17\n| &&
      |jmp -227\n| &&
      |nop -241\n| &&
      |acc +46\n| &&
      |jmp -64\n| &&
      |nop -106\n| &&
      |nop -25\n| &&
      |acc +48\n| &&
      |acc +48\n| &&
      |jmp -323\n| &&
      |acc +30\n| &&
      |acc -10\n| &&
      |jmp -382\n| &&
      |acc +44\n| &&
      |jmp -21\n| &&
      |acc -6\n| &&
      |jmp -102\n| &&
      |acc -17\n| &&
      |acc -13\n| &&
      |acc +23\n| &&
      |jmp -199\n| &&
      |acc +7\n| &&
      |acc +28\n| &&
      |acc +43\n| &&
      |jmp -186\n| &&
      |nop -105\n| &&
      |jmp -390\n| &&
      |acc +29\n| &&
      |nop +168\n| &&
      |acc +49\n| &&
      |jmp -9\n| &&
      |jmp -335\n| &&
      |acc +4\n| &&
      |jmp -86\n| &&
      |nop -348\n| &&
      |acc -17\n| &&
      |acc -12\n| &&
      |jmp +107\n| &&
      |acc +28\n| &&
      |jmp -72\n| &&
      |acc +17\n| &&
      |acc +31\n| &&
      |nop -10\n| &&
      |jmp -295\n| &&
      |acc +41\n| &&
      |jmp -271\n| &&
      |jmp -350\n| &&
      |nop -64\n| &&
      |acc -11\n| &&
      |acc +6\n| &&
      |jmp -198\n| &&
      |acc -5\n| &&
      |jmp -206\n| &&
      |acc +23\n| &&
      |jmp -390\n| &&
      |jmp +1\n| &&
      |jmp +1\n| &&
      |acc +9\n| &&
      |nop -91\n| &&
      |jmp -15\n| &&
      |acc +36\n| &&
      |acc +27\n| &&
      |acc +42\n| &&
      |jmp +18\n| &&
      |acc +20\n| &&
      |acc +10\n| &&
      |acc +44\n| &&
      |jmp +46\n| &&
      |jmp +110\n| &&
      |acc +31\n| &&
      |jmp -371\n| &&
      |acc +13\n| &&
      |acc -16\n| &&
      |nop -245\n| &&
      |acc +30\n| &&
      |jmp +38\n| &&
      |acc -6\n| &&
      |acc -14\n| &&
      |acc +21\n| &&
      |acc +46\n| &&
      |jmp -206\n| &&
      |acc +35\n| &&
      |acc +25\n| &&
      |acc +22\n| &&
      |acc -9\n| &&
      |jmp -92\n| &&
      |acc +20\n| &&
      |nop -113\n| &&
      |nop -189\n| &&
      |jmp -453\n| &&
      |acc +43\n| &&
      |acc -18\n| &&
      |acc -19\n| &&
      |acc -4\n| &&
      |jmp -364\n| &&
      |acc +35\n| &&
      |acc +44\n| &&
      |acc +19\n| &&
      |acc -13\n| &&
      |jmp -297\n| &&
      |acc -11\n| &&
      |acc +36\n| &&
      |nop -92\n| &&
      |jmp -93\n| &&
      |jmp -330\n| &&
      |acc +40\n| &&
      |jmp -248\n| &&
      |jmp -255\n| &&
      |acc +36\n| &&
      |acc +32\n| &&
      |jmp -190\n| &&
      |acc -15\n| &&
      |jmp -187\n| &&
      |jmp -23\n| &&
      |nop -268\n| &&
      |jmp -203\n| &&
      |acc -10\n| &&
      |acc +14\n| &&
      |acc -17\n| &&
      |nop -400\n| &&
      |jmp +61\n| &&
      |nop +60\n| &&
      |acc +17\n| &&
      |acc -9\n| &&
      |jmp -409\n| &&
      |acc +0\n| &&
      |acc +13\n| &&
      |acc +47\n| &&
      |acc -6\n| &&
      |jmp -102\n| &&
      |acc +37\n| &&
      |jmp -257\n| &&
      |acc -1\n| &&
      |acc +41\n| &&
      |acc +25\n| &&
      |jmp -397\n| &&
      |acc +9\n| &&
      |acc +31\n| &&
      |jmp -48\n| &&
      |acc -11\n| &&
      |jmp -332\n| &&
      |jmp -433\n| &&
      |jmp +30\n| &&
      |jmp +38\n| &&
      |acc +17\n| &&
      |nop -376\n| &&
      |nop -93\n| &&
      |acc +50\n| &&
      |jmp -249\n| &&
      |acc -10\n| &&
      |jmp -225\n| &&
      |acc +10\n| &&
      |jmp +35\n| &&
      |jmp -475\n| &&
      |acc +18\n| &&
      |jmp -250\n| &&
      |acc -12\n| &&
      |acc +25\n| &&
      |jmp -450\n| &&
      |jmp -411\n| &&
      |acc +45\n| &&
      |jmp -117\n| &&
      |acc -6\n| &&
      |acc +30\n| &&
      |acc -6\n| &&
      |nop -313\n| &&
      |jmp -271\n| &&
      |acc +22\n| &&
      |acc +13\n| &&
      |acc -12\n| &&
      |acc +4\n| &&
      |jmp -379\n| &&
      |acc +36\n| &&
      |acc +17\n| &&
      |acc +15\n| &&
      |acc +47\n| &&
      |jmp -417\n| &&
      |jmp +4\n| &&
      |jmp -332\n| &&
      |acc +23\n| &&
      |jmp -336\n| &&
      |acc +34\n| &&
      |acc +1\n| &&
      |acc +50\n| &&
      |acc +7\n| &&
      |jmp -466\n| &&
      |jmp -70\n| &&
      |acc +4\n| &&
      |nop +8\n| &&
      |acc +18\n| &&
      |jmp -28\n| &&
      |jmp -47\n| &&
      |jmp -410\n| &&
      |acc -1\n| &&
      |acc +3\n| &&
      |jmp -90\n| &&
      |acc +12\n| &&
      |acc +41\n| &&
      |jmp -98\n| &&
      |jmp -55\n| &&
      |acc +17\n| &&
      |nop -85\n| &&
      |acc +48\n| &&
      |acc +50\n| &&
      |jmp +1|.
  ENDMETHOD.

ENDCLASS.
