CLASS ltcl_passport DEFINITION DEFERRED.
CLASS zpassport DEFINITION LOCAL FRIENDS ltcl_passport.
CLASS ltcl_passport DEFINITION FINAL FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.
    DATA: passport TYPE REF TO zpassport.
    METHODS:
      count_valid_passport FOR TESTING RAISING cx_static_check,
      check_byr FOR TESTING RAISING cx_static_check,
      check_iyr FOR TESTING RAISING cx_static_check,
      check_hgt FOR TESTING RAISING cx_static_check,
      check_hcl FOR TESTING RAISING cx_static_check,
      check_ecl FOR TESTING RAISING cx_static_check,
      check_pid FOR TESTING RAISING cx_static_check,
      invalid_passports FOR TESTING RAISING cx_static_check,
      setup,
      prepare_file
        RETURNING
          VALUE(file) TYPE string,
      prepare_invalid
        RETURNING
          VALUE(file) TYPE string,
      prepare_valid
        RETURNING
          VALUE(file) TYPE string.
ENDCLASS.


CLASS ltcl_passport IMPLEMENTATION.

  METHOD check_hgt.
    "arrange
    DATA(file) = prepare_file( ).
    passport->set_file( file ).

    "act
    DATA(valid) = passport->check_hgt( |60in| ).
    "assert
    cl_abap_unit_assert=>assert_true( msg = '60in is valid' act = valid ).

    "act
    valid = passport->check_hgt( |190cm| ).
    "assert
    cl_abap_unit_assert=>assert_true( msg = '190cm is valid' act = valid ).

    "act
    valid = passport->check_hgt( |190| ).
    "assert
    cl_abap_unit_assert=>assert_false( msg = '190 is invalid' act = valid ).

    "act
    valid = passport->check_hgt( |190in| ).
    "assert
    cl_abap_unit_assert=>assert_false( msg = '190in is invalid' act = valid ).

  ENDMETHOD.

  METHOD check_hcl.

    DATA(valid) = passport->check_hcl( hcl = |#123abc| ).

    cl_abap_unit_assert=>assert_true( msg = |hcl valid:   #123abc| act = valid ).
    valid = passport->check_hcl( hcl = |#123abz| ).
    cl_abap_unit_assert=>assert_false( msg = |hcl invalid: #123abz| act = valid ).
    valid = passport->check_hcl( hcl = |123abc| ).
    cl_abap_unit_assert=>assert_false( msg = |hcl invalid: 123abc| act = valid ).
  ENDMETHOD.

  METHOD check_ecl.
    DATA valid TYPE xsdboolean.
    valid = passport->check_ecl( ecl = |brn| ).
    cl_abap_unit_assert=>assert_true( msg = |ecl valid:   brn| act = valid ).
    valid = passport->check_ecl( ecl = |wat| ).
    cl_abap_unit_assert=>assert_false( msg = |ecl invalid: wat| act = valid ).
  ENDMETHOD.

  METHOD check_pid.
    DATA valid TYPE xsdboolean.
    valid = passport->check_pid( pid = |000000001| ).
    cl_abap_unit_assert=>assert_true( msg = |pid valid:   000000001| act = valid ).
    valid = passport->check_ecl( ecl = |0123456789| ).
    cl_abap_unit_assert=>assert_false( msg = |pid invalid: 0123456789| act = valid ).


  ENDMETHOD.

  METHOD check_byr.
    "arrange
    DATA(file) = prepare_file( ).
    passport->set_file( file ).

    "act
    DATA(valid) = passport->check_byr( 2003 ).

    "assert
    cl_abap_unit_assert=>assert_equals( msg = '2003 is invalid' exp = abap_false act = valid ).

    "act
    valid = passport->check_byr( 2002 ).

    "assert
    cl_abap_unit_assert=>assert_equals( msg = '2002 is valid' exp = abap_true act = valid ).

    "act
    valid = passport->check_byr( 1920 ).

    "assert
    cl_abap_unit_assert=>assert_equals( msg = '1920 is valid' exp = abap_true act = valid ).

    "act
    valid = passport->check_byr( 1919 ).

    "assert
    cl_abap_unit_assert=>assert_equals( msg = '1919 is invalid' exp = abap_false act = valid ).
  ENDMETHOD.

  METHOD check_iyr.
    "arrange
    passport->set_file( prepare_file( ) ).

    "act
    DATA(valid) = passport->check_iyr( 2021 ).

    "assert
    cl_abap_unit_assert=>assert_equals( msg = '2021 is invalid' exp = abap_false act = valid ).

    "act
    valid = passport->check_iyr( 2020 ).

    "assert
    cl_abap_unit_assert=>assert_equals( msg = '2020 is valid' exp = abap_true act = valid ).

    "act
    valid = passport->check_iyr( 2010 ).

    "assert
    cl_abap_unit_assert=>assert_equals( msg = '2010 is valid' exp = abap_true act = valid ).

    "act
    valid = passport->check_iyr( 2009 ).

    "assert
    cl_abap_unit_assert=>assert_equals( msg = '2009 is invalid' exp = abap_false act = valid ).
  ENDMETHOD.

  METHOD count_valid_passport.
    "arrange
    passport->set_file( prepare_valid( ) ).

    "act
    DATA(valid_passports) = passport->count_valid( ).

    "assert
    cl_abap_unit_assert=>assert_equals( msg = 'valid passports = 4' exp = 4 act = valid_passports ).
  ENDMETHOD.

  METHOD invalid_passports.
    "arrange
    passport->set_file( prepare_invalid( ) ).

    "act
    DATA(valid_passports) = passport->count_valid( ).

    "assert
    cl_abap_unit_assert=>assert_equals( msg = 'no valid passport' exp = 0 act = valid_passports ).
  ENDMETHOD.

  METHOD setup.

    passport = NEW zpassport( ).

  ENDMETHOD.


  METHOD prepare_file.

    file  =
 |ecl:gry pid:860033327 eyr:2020 hcl:#fffffd\n| &&
 |byr:1937 iyr:2017 cid:147 hgt:183cm\n| &&
 |\n| &&
 |iyr:2013 ecl:amb cid:350 eyr:2023 pid:028048884\n| &&
 |hcl:#cfa07d byr:1929\n| &&
 |\n| &&
 |hcl:#ae17e1 iyr:2013\n| &&
 |eyr:2024\n| &&
 |ecl:brn pid:760753108 byr:1931\n| &&
 |hgt:179cm\n| &&
 |\n| &&
 |hcl:#cfa07d eyr:2025 pid:166559648\n| &&
 |iyr:2011 ecl:brn hgt:59in|.

  ENDMETHOD.

  METHOD prepare_invalid.
    file =
|eyr:1972 cid:100\n| &&
|hcl:#18171d ecl:amb hgt:170 pid:186cm iyr:2018 byr:1926\n| &&
|\n| &&
|iyr:2019\n| &&
|hcl:#602927 eyr:1967 hgt:170cm\n| &&
|ecl:grn pid:012533040 byr:1946\n| &&
|\n| &&
|hcl:dab227 iyr:2012\n| &&
|ecl:brn hgt:182cm pid:021572410 eyr:2020 byr:1992 cid:277\n| &&
|\n| &&
|hgt:59cm ecl:zzz\n| &&
|eyr:2038 hcl:74454a iyr:2023\n| &&
|pid:3556412378 byr:2007|.
  ENDMETHOD.

  METHOD prepare_valid.
    file =
|pid:087499704 hgt:74in ecl:grn iyr:2012 eyr:2030 byr:1980\n| &&
|hcl:#623a2f\n| &&
|\n| &&
|eyr:2029 ecl:blu cid:129 byr:1989\n| &&
|iyr:2014 pid:896056539 hcl:#a97842 hgt:165cm\n| &&
|\n| &&
|hcl:#888785\n| &&
|hgt:164cm byr:2001 iyr:2015 cid:88\n| &&
|pid:545766238 ecl:hzl\n| &&
|eyr:2022\n| &&
|\n| &&
|iyr:2010 hgt:158cm hcl:#b6652a ecl:blu byr:1944 eyr:2021 pid:093154719|.
  ENDMETHOD.

ENDCLASS.
