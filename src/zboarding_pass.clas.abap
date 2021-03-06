CLASS zboarding_pass DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES
      if_oo_adt_classrun.
    METHODS get_row
      IMPORTING
        seat       TYPE string
      RETURNING
        VALUE(row) TYPE i.
    METHODS get_column
      IMPORTING
        seat          TYPE string
      RETURNING
        VALUE(column) TYPE i.
    METHODS get_seat_id
      IMPORTING
        seat      TYPE string
      RETURNING
        VALUE(id) TYPE i.
    METHODS sanity_check
      IMPORTING
        boarding_passes TYPE string
      RETURNING
        VALUE(result)   TYPE i.
    METHODS get_free_seat
      IMPORTING
        boarding_passes TYPE string
      RETURNING
        VALUE(seat_id)  TYPE i.
  PROTECTED SECTION.
  PRIVATE SECTION.
    METHODS prepare_riddle
      RETURNING
        VALUE(riddle) TYPE string.

ENDCLASS.

CLASS zboarding_pass IMPLEMENTATION.

  METHOD get_row.
    DATA(row_code) = substring( val = seat len = 7 ).
    DO 7 TIMES.
      row += COND i( WHEN substring( val = row_code off = sy-index - 1 len = 1 ) = 'B'
                     THEN ipow( base = 2 exp = 7 - sy-index  )
                     ELSE 0 ).
    ENDDO.
  ENDMETHOD.

  METHOD if_oo_adt_classrun~main.
    out->write( |part 1 - sanitiy check: | && sanity_check( prepare_riddle( ) ) ).
    out->write( |part 2 - free seat: | && get_free_seat( prepare_riddle( ) ) ).

  ENDMETHOD.

  METHOD get_column.
    DATA(column_code) = substring( val = seat off = 7 len = 3 ).
    DATA(x) = strlen( column_code ).
    DATA(code) = 'R'.
    DO x TIMES.
      column += COND i( WHEN substring( val = column_code off = sy-index - 1 len = 1 ) = code
                        THEN ipow( base = 2 exp = x - sy-index  )
                        ELSE 0 ).
    ENDDO.
  ENDMETHOD.

  METHOD get_seat_id.
    id = get_row( seat ) * 8 + get_column( seat ).
  ENDMETHOD.

  METHOD prepare_riddle.
    riddle =
      |BFBFFFFLLL\n| &&
      |BBFBBFBRLL\n| &&
      |BFBBFFFRRR\n| &&
      |FBFFBBBLLL\n| &&
      |FFBBFBBRLL\n| &&
      |BBBFFFFLRL\n| &&
      |BFBBBFBRRR\n| &&
      |FBBFFFBLRL\n| &&
      |FFBFBBFLLR\n| &&
      |FBFFFFBLRL\n| &&
      |BBFFBBFRLL\n| &&
      |BBFBBBBLLR\n| &&
      |FFBBBBFRLR\n| &&
      |BBFFBFFRLR\n| &&
      |BFFBBFFRRL\n| &&
      |BBFBBBFLLR\n| &&
      |FBFBBBBRRL\n| &&
      |BFFFBFFLRL\n| &&
      |FBFFFBFRLL\n| &&
      |FBBBFFBLRR\n| &&
      |FFFBFBBRLR\n| &&
      |FBBFBBFLLR\n| &&
      |FBFBFFFLRL\n| &&
      |BFFBFBFLLR\n| &&
      |BBFBFBBRRL\n| &&
      |BFFBBFBRLR\n| &&
      |FBFBFFFRRL\n| &&
      |BFBFFBBRRL\n| &&
      |FBFBFBFLLL\n| &&
      |BFFBFFBRRL\n| &&
      |FFBBBBBRRL\n| &&
      |FFFBFBFRLR\n| &&
      |BBFFFBBLRL\n| &&
      |BFBFBFFRLL\n| &&
      |BFBFFFBRLR\n| &&
      |FBBBFFFRRR\n| &&
      |BBFFFBFRLL\n| &&
      |FBBBFBFRLL\n| &&
      |FFBBBFFLRR\n| &&
      |FBFBBFBLRL\n| &&
      |FBBBBBFLLR\n| &&
      |FBFFBBBLRL\n| &&
      |FFFBBFFRRL\n| &&
      |FBBBFFFRLR\n| &&
      |BBFBFFFRLR\n| &&
      |BBFBBFBLLL\n| &&
      |FBFFBBBRRL\n| &&
      |BFFFFBFRRR\n| &&
      |FBBFFBFLRR\n| &&
      |FBFBBBFLRL\n| &&
      |BFBBBBBRRL\n| &&
      |BBFFFFBLRL\n| &&
      |FBFFFBFLLL\n| &&
      |FFFBBFFLLR\n| &&
      |FBBBFBFLRR\n| &&
      |BBBFFBFRRL\n| &&
      |BFBFFFFRLR\n| &&
      |FFBFFFBRLR\n| &&
      |FBFFBFBRLL\n| &&
      |FBBFFFFRLL\n| &&
      |FFFBBFBRRR\n| &&
      |FBBBBFFLRR\n| &&
      |BFBBBFBRLR\n| &&
      |BFFFFFFRRR\n| &&
      |FFBBBBFRRR\n| &&
      |BFFBFBFRRL\n| &&
      |BFFBFFFRLR\n| &&
      |BBFFBFBLRR\n| &&
      |FBFFFBBLLL\n| &&
      |FBFFFFFRLR\n| &&
      |BFBBFBFLRR\n| &&
      |FBBBBBBLRL\n| &&
      |BFFFFBBLRR\n| &&
      |BFFBFFFRRR\n| &&
      |FBFFFBFLRL\n| &&
      |BFBBFFBLRR\n| &&
      |BBFBBBBLLL\n| &&
      |BBFBBBFRRL\n| &&
      |FBBBBBBRLR\n| &&
      |BFFBFBFLRR\n| &&
      |BFFBFFFLLR\n| &&
      |FBBBBBFLRL\n| &&
      |FBFFFBFRRL\n| &&
      |FFBBBBFRRL\n| &&
      |BFBBBBBRLR\n| &&
      |FBBBBBFRRL\n| &&
      |FFBFBFFLLL\n| &&
      |BBBFFFFRRL\n| &&
      |BBFBBFBRRR\n| &&
      |BFBFFFFRLL\n| &&
      |FBFFFFFLLR\n| &&
      |FFFBBFFLRL\n| &&
      |FBFFBFFLRR\n| &&
      |FBFFBBFRLR\n| &&
      |FFBBBFBLLR\n| &&
      |BFFFFBFLRR\n| &&
      |BBFBFBFRRR\n| &&
      |FBBFBBBLLL\n| &&
      |FBBFBFBLLL\n| &&
      |FBBBFFBLRL\n| &&
      |BBBFFBFRRR\n| &&
      |FBBBFBFLRL\n| &&
      |FBFFFBFRRR\n| &&
      |FBFFBFBRRR\n| &&
      |FFBBFFBRLL\n| &&
      |BFBFBFBLLR\n| &&
      |BBFFFFBRRR\n| &&
      |FBBBBBBLLR\n| &&
      |FBBBBFFRLR\n| &&
      |BBFBBFFLRL\n| &&
      |BFBBFBFLLR\n| &&
      |FBFFFFFRLL\n| &&
      |FFBBFFFLLR\n| &&
      |BBFFFBFRRR\n| &&
      |BFBBBFFLLR\n| &&
      |BBFFFFBRLR\n| &&
      |FFBFBBFRLR\n| &&
      |BFBFFFBLLL\n| &&
      |FBFFBFFLLL\n| &&
      |FBBBFBBRLR\n| &&
      |BBFBFFFLLR\n| &&
      |FBFFFBBRLR\n| &&
      |BFFBFBBLLL\n| &&
      |BFFBBFFLLR\n| &&
      |FBBFFBBRLR\n| &&
      |BBFBFFBRLL\n| &&
      |FBFBBBFRRL\n| &&
      |BFBBBFBLLR\n| &&
      |BBFFBBBRLL\n| &&
      |BBBFFFBLRL\n| &&
      |BBFBFFBRLR\n| &&
      |BFFBBBFRRR\n| &&
      |FFFBFBBRLL\n| &&
      |FBFBFBBRLL\n| &&
      |BFFFFFBRLR\n| &&
      |FBFFBBBRRR\n| &&
      |FBFFBBFLRL\n| &&
      |BFFFBBBRLL\n| &&
      |FBBBBFFLLL\n| &&
      |BBFBFFFRRR\n| &&
      |BFBFBBFLLL\n| &&
      |FFBBFBFRRL\n| &&
      |FFFBBBBRLR\n| &&
      |BFFBBBBRLL\n| &&
      |FFBFBBFRRL\n| &&
      |FBFBFBFRLL\n| &&
      |BBBFFFBRRL\n| &&
      |BBBFFBFRLR\n| &&
      |FBFBFBFLLR\n| &&
      |BBFBBFFRLL\n| &&
      |FBFBFFFLLR\n| &&
      |BBFBFBFRRL\n| &&
      |BFFBBFBRRL\n| &&
      |FFBFFBFRLR\n| &&
      |BFFBBFBRRR\n| &&
      |FFBBFFBRRL\n| &&
      |BFFFFBBRRL\n| &&
      |FBBBBFFRLL\n| &&
      |FBBBFFBRRR\n| &&
      |FBBFFBFLLL\n| &&
      |BBBFFBFRLL\n| &&
      |FFFBBFBLLR\n| &&
      |BFFBBFFLRR\n| &&
      |BFBFBFFLLL\n| &&
      |BFBFFBBLRL\n| &&
      |FFFBBFBLRR\n| &&
      |BBFFBFBLLL\n| &&
      |FBBBFBFRRL\n| &&
      |BFBBBBBLLR\n| &&
      |BBFBFBBLLL\n| &&
      |FFBFBFFLRR\n| &&
      |BFFFFFFLLR\n| &&
      |BFBFBFFRRL\n| &&
      |BFBFBBFLLR\n| &&
      |FBBBBFFLLR\n| &&
      |FFBBFFBLLL\n| &&
      |BBFFBFBRRR\n| &&
      |FFFBBFBLRL\n| &&
      |FBFBFFBLRL\n| &&
      |BFBBBBBLLL\n| &&
      |BFFFFBFRRL\n| &&
      |FBFFFFFLRL\n| &&
      |BFFFBFBLRL\n| &&
      |BFFBFBFLLL\n| &&
      |BBFBBBFRRR\n| &&
      |FBFBFFBLRR\n| &&
      |FBFBBBBRLL\n| &&
      |BBFFFFFLRL\n| &&
      |FBBFFFBRRR\n| &&
      |FBFFFBBRLL\n| &&
      |BFFFBFFLLL\n| &&
      |BFFBBFFLRL\n| &&
      |FFBFFFBLLL\n| &&
      |BFBFBBBLLL\n| &&
      |FBBFBFBLRR\n| &&
      |FBFFBFFLLR\n| &&
      |FBFFBBFRRR\n| &&
      |BBFFFBFLLR\n| &&
      |BBFBBFBLRL\n| &&
      |FBFBBBFRRR\n| &&
      |BBFFFFBLLR\n| &&
      |FFBFBFBLRL\n| &&
      |FFBBBBBLLR\n| &&
      |FBFBFBBLRR\n| &&
      |FFBBBFFRLL\n| &&
      |FBBFBFBRLL\n| &&
      |BBFBFFBRRL\n| &&
      |BFBFFBFLRR\n| &&
      |BFBFFBBRLR\n| &&
      |FBBFFFFRRL\n| &&
      |FBFFFFFLLL\n| &&
      |FBFBBFBRLR\n| &&
      |BBFBBFBLRR\n| &&
      |BFBBBFFRLR\n| &&
      |FBFFBBBLRR\n| &&
      |FBFBFBBRRL\n| &&
      |BBFFBBFLRL\n| &&
      |BBFFFFBLRR\n| &&
      |FFBBFFBLLR\n| &&
      |BFBBFBBLRR\n| &&
      |BBFBFBBRLL\n| &&
      |BBFFFBFLLL\n| &&
      |FBBFBBBRRR\n| &&
      |BFBFBBFRLL\n| &&
      |FFBBFFBLRL\n| &&
      |FFFBBBFRRR\n| &&
      |BFBFFFBLRR\n| &&
      |BBFBFBBRRR\n| &&
      |BFBFFBBLLR\n| &&
      |BFFFBBBRLR\n| &&
      |FFBBBBBRLL\n| &&
      |FFFBBFBLLL\n| &&
      |FBFBBBBLRR\n| &&
      |FFBFFBBRLL\n| &&
      |BFBBBBFLLL\n| &&
      |BFFFBFFRLL\n| &&
      |BBFFFBFLRR\n| &&
      |BFBFFFFLRR\n| &&
      |BFBFBBBRLR\n| &&
      |BBFBBBFLRL\n| &&
      |FBBFFFFLLR\n| &&
      |FFFBBBBLLL\n| &&
      |BBBFFBFLLL\n| &&
      |FBFFBBBRLL\n| &&
      |FBFBFFFLLL\n| &&
      |FBBFFBFLLR\n| &&
      |BFBFBBFRRL\n| &&
      |BFFFFBBRLL\n| &&
      |FBFBFFBLLL\n| &&
      |BBFFFFFLLL\n| &&
      |FFBBBBFLLR\n| &&
      |FBFBBBFLLR\n| &&
      |BFBBFFBRRL\n| &&
      |FBBFFBBRLL\n| &&
      |BFBFFFFLLR\n| &&
      |BBFBFFFLRL\n| &&
      |BFFFBFBLRR\n| &&
      |FBBFBBFRRR\n| &&
      |FFBFBFFRRL\n| &&
      |BBFFFBBLLR\n| &&
      |BFBFBFFLRL\n| &&
      |BFBFFFBLRL\n| &&
      |FBFBBBFLLL\n| &&
      |FBBFFBBLLL\n| &&
      |BBBFFBFLLR\n| &&
      |BFFFBBFLRL\n| &&
      |BFFFBFFLLR\n| &&
      |BBBFFFFLRR\n| &&
      |BBFFBFFLLR\n| &&
      |BBFFFBBRRR\n| &&
      |BBBFFFBLLR\n| &&
      |BFBBBBFRLR\n| &&
      |FBBFBBBRLL\n| &&
      |BFBBFFBRLL\n| &&
      |FBFBFBFLRR\n| &&
      |BBFFFBFLRL\n| &&
      |FBFBFFBRLL\n| &&
      |FBBFBFBRLR\n| &&
      |FFBFBBFLRL\n| &&
      |BBFBBBFLRR\n| &&
      |BFFBFBBLRL\n| &&
      |BFFBBBBRLR\n| &&
      |BFFFFFBRRR\n| &&
      |FBBFFFBRRL\n| &&
      |BFBFFBFLLR\n| &&
      |FBBFBBFLRL\n| &&
      |FBBBBBBLRR\n| &&
      |BFBBBFBRRL\n| &&
      |BFFFBFBLLL\n| &&
      |FBFFFBBRRR\n| &&
      |FFBBFFBRLR\n| &&
      |BBFFFFFRRL\n| &&
      |FFBFBBBRRL\n| &&
      |FFBFBBFLRR\n| &&
      |BFFFBBBRRL\n| &&
      |FFBFBFBLRR\n| &&
      |BBFFBFBRLL\n| &&
      |BBFBBFBRRL\n| &&
      |BBFBBFFRLR\n| &&
      |FBBFBFFRLR\n| &&
      |BFBBFFBLLL\n| &&
      |BBFBFBFRLL\n| &&
      |FFBBBFFLLL\n| &&
      |FFBBBBBLRR\n| &&
      |FBBFBBFRRL\n| &&
      |BBFFBFBRLR\n| &&
      |BFFFBBFRRL\n| &&
      |BBFBBFFLLR\n| &&
      |FBFFBBFLRR\n| &&
      |BFBFBBBLLR\n| &&
      |FFFBBBBRLL\n| &&
      |BBFFFFFLRR\n| &&
      |BFBBFFBLRL\n| &&
      |BFBBFFFLLR\n| &&
      |FFFBFBFLLL\n| &&
      |FFBFFFFLLR\n| &&
      |FBFFFBFLLR\n| &&
      |BBBFFFFLLR\n| &&
      |BFFBFFFLLL\n| &&
      |FFFBBFBRRL\n| &&
      |FBBFFFFLLL\n| &&
      |FFFBBBFRLL\n| &&
      |BBFBBBBLRR\n| &&
      |FFFBBBFLRR\n| &&
      |FFBBFBFRRR\n| &&
      |BFBFBBBLRL\n| &&
      |BBFBBBFLLL\n| &&
      |FBBBFFBRLR\n| &&
      |BFFFBBBRRR\n| &&
      |FFBBBBFLRR\n| &&
      |FFBBFBBRRL\n| &&
      |FBBFFBFRLR\n| &&
      |BBFFBBFRRR\n| &&
      |BBFBBFBRLR\n| &&
      |BFFBBFBLRR\n| &&
      |FFBBBBBLRL\n| &&
      |BBFFBBBRRR\n| &&
      |BFFFBFBRRR\n| &&
      |BFFFFFFRRL\n| &&
      |BBFFBFBLRL\n| &&
      |FBFFFFBLRR\n| &&
      |FBFBBFFRRL\n| &&
      |BFBFFFBLLR\n| &&
      |FFFBFBBLRL\n| &&
      |BFFFFFFRLL\n| &&
      |BBFFFBBRRL\n| &&
      |FFBFBFBRRL\n| &&
      |FBBFBFFLLL\n| &&
      |FBFFBFBLRR\n| &&
      |BFFFFBBRLR\n| &&
      |FFBFFFBLRR\n| &&
      |BFBFFFBRRL\n| &&
      |FBBFFBFRLL\n| &&
      |FBFBBFBRRR\n| &&
      |FBBBFBFLLR\n| &&
      |FBBFFFBLLR\n| &&
      |BFFFFBFLLR\n| &&
      |FBBBBBBRLL\n| &&
      |BBBFFFFRLL\n| &&
      |BFFFBBBLRL\n| &&
      |FFFBFBFLLR\n| &&
      |FBFBBBBLLR\n| &&
      |FBFFBFFRRR\n| &&
      |BFFFBBBLLL\n| &&
      |BFBBFFBRRR\n| &&
      |FBBBBFFRRR\n| &&
      |BFBFBBFLRR\n| &&
      |BFFBFFBLRL\n| &&
      |BBFBFFFRLL\n| &&
      |FFFBBFBRLL\n| &&
      |FBBFFFFRLR\n| &&
      |FFBBFBBRLR\n| &&
      |BBFFFBBLLL\n| &&
      |BBFFFBBRLL\n| &&
      |FBBFFFFRRR\n| &&
      |BFBFBFBLRR\n| &&
      |FFBFFFFRRR\n| &&
      |FBFBFBFLRL\n| &&
      |FFBFBBFLLL\n| &&
      |FFBFBBBRLR\n| &&
      |BFBFFFBRLL\n| &&
      |FFBFFBBLRL\n| &&
      |BFBBBBBRLL\n| &&
      |BBFBFFBLRR\n| &&
      |FBFFFFBRLR\n| &&
      |FFBBBFBRRR\n| &&
      |BFBFBBBRRR\n| &&
      |FBBBBBFRRR\n| &&
      |FBBFBBBLRR\n| &&
      |BBFBBBBRRL\n| &&
      |BFFBBBFRLL\n| &&
      |BBFBFBFLLR\n| &&
      |FFBBFFBRRR\n| &&
      |BFFFBBBLLR\n| &&
      |BFFFBBBLRR\n| &&
      |FFFBFBFRRR\n| &&
      |BFBFBFBRRL\n| &&
      |FFBBBFBRRL\n| &&
      |FFFBBBBRRR\n| &&
      |FBFFBFFRRL\n| &&
      |BFFBFFFRRL\n| &&
      |FFFBBBFLRL\n| &&
      |FBBBBFFLRL\n| &&
      |FFBFFBBRLR\n| &&
      |FBBFBBBLRL\n| &&
      |FFBFFFFLRR\n| &&
      |FBFFBFBRLR\n| &&
      |FBBFBBBRRL\n| &&
      |FFBBBFBRLL\n| &&
      |BFFFFFBLRL\n| &&
      |FFFBBFFRLR\n| &&
      |BFBFFFBRRR\n| &&
      |FFBBFFFLRL\n| &&
      |FBBBBFBRLR\n| &&
      |FFBBBBFRLL\n| &&
      |FFBFFBBLLR\n| &&
      |FBFFFFBLLL\n| &&
      |FBFBBBBLLL\n| &&
      |BFFFBFBRRL\n| &&
      |FBBBBBFLLL\n| &&
      |FFBBFFFRLL\n| &&
      |FBBBFFFLLR\n| &&
      |BFFBBBBLLR\n| &&
      |BFBFBFFRLR\n| &&
      |BFBFFBBLLL\n| &&
      |FBFBBFFLRR\n| &&
      |FFBBFFFRRL\n| &&
      |FBFBBFFRLL\n| &&
      |BFFFFBFLLL\n| &&
      |FBBBFBBLLL\n| &&
      |FBFBFFFRLR\n| &&
      |BFFBBBBLRL\n| &&
      |FFBFFFFRLL\n| &&
      |BFBBFBBLLR\n| &&
      |FFBBFBBLRL\n| &&
      |FBFBBFBLRR\n| &&
      |FBBBBBBRRL\n| &&
      |FFBFBBFRRR\n| &&
      |FBFFBBFRLL\n| &&
      |FBBFFFBRLL\n| &&
      |BFFFBFBRLR\n| &&
      |BFFBFFBLRR\n| &&
      |BBBFFFBRLL\n| &&
      |BFBFFBBLRR\n| &&
      |BFBBBFBRLL\n| &&
      |BBFBFBFRLR\n| &&
      |FFFBFBBRRL\n| &&
      |BFFFFBBLLR\n| &&
      |FBFFBBBRLR\n| &&
      |BFBFFBFRLL\n| &&
      |FBFBFFBRRL\n| &&
      |BFFFFFFLLL\n| &&
      |BFFFBBFLLR\n| &&
      |BFFFBFBRLL\n| &&
      |BFBBBBBLRL\n| &&
      |BFFFFBFRLR\n| &&
      |BBFBFBFLRL\n| &&
      |FBBBBBFRLL\n| &&
      |BBFFBFFLRR\n| &&
      |FBFBFFBRLR\n| &&
      |FFBBBFBLRR\n| &&
      |FBBFFFBLRR\n| &&
      |BFBBBFBLRL\n| &&
      |BFFFBFBLLR\n| &&
      |BBFFBBFRLR\n| &&
      |BFBBFFFLRR\n| &&
      |BFFBFBBRLR\n| &&
      |FFBBFFFLLL\n| &&
      |FBBBFBFLLL\n| &&
      |BFBBBBFLRL\n| &&
      |FFBBBBBRRR\n| &&
      |FBBFFFBLLL\n| &&
      |BFBBFBBLLL\n| &&
      |FBBBBFBRLL\n| &&
      |FBBFBFFLRL\n| &&
      |BFFBBFBLLL\n| &&
      |FBBBFBBRRR\n| &&
      |BFFBFBFRLL\n| &&
      |BBFFBBBLRL\n| &&
      |BFBFBFBLRL\n| &&
      |FBBBFFFLLL\n| &&
      |BFFFBFFRRL\n| &&
      |FFBFFBFLLR\n| &&
      |BFFBFBBLRR\n| &&
      |BFFFFFBRLL\n| &&
      |BFBFBBBLRR\n| &&
      |FFFBBBBLRL\n| &&
      |BFBBBBBRRR\n| &&
      |BFFBFBFRLR\n| &&
      |BFFBBFFLLL\n| &&
      |BBFBBFFRRL\n| &&
      |FBBBFFFLRL\n| &&
      |FBFFBFFRLL\n| &&
      |FBFFFBFLRR\n| &&
      |FBBBFBBLLR\n| &&
      |BBFFFFBLLL\n| &&
      |BFFFBBFRLR\n| &&
      |BBFBFBBLRR\n| &&
      |FBBFBBBRLR\n| &&
      |FBFFFBBRRL\n| &&
      |FBBBFFBLLR\n| &&
      |FFBBBBFLLL\n| &&
      |BFFBFFBLLL\n| &&
      |FFBFBFBLLR\n| &&
      |BBFFBBBLLL\n| &&
      |BBFFFFFRLL\n| &&
      |BBFFFBBLRR\n| &&
      |FFFBBBFRRL\n| &&
      |BFFBFBBRRR\n| &&
      |BFFBBFFRLL\n| &&
      |FFFBBBFLLL\n| &&
      |FBFFFFFRRR\n| &&
      |FBBFBBFLRR\n| &&
      |FFBBFBFRLL\n| &&
      |FFFBFBFRLL\n| &&
      |FBBBFBBRLL\n| &&
      |BBFFBFFLRL\n| &&
      |FFFBBBBLLR\n| &&
      |BFFBFBBRLL\n| &&
      |BFBFFBFRLR\n| &&
      |BFFBFBBLLR\n| &&
      |BFFFBBFLLL\n| &&
      |BFFFFBFLRL\n| &&
      |FBFBBBBRRR\n| &&
      |FFBBBBFLRL\n| &&
      |BBFFFFBRLL\n| &&
      |FFBBBFFRRR\n| &&
      |FBFBBFBLLR\n| &&
      |FBBBFBBLRR\n| &&
      |BBBFFFFLLL\n| &&
      |BBFBBFBLLR\n| &&
      |BFBBFFBRLR\n| &&
      |BFBBBBFRRL\n| &&
      |FBBFFBBLRL\n| &&
      |BFFBFBFRRR\n| &&
      |BFBFBBFLRL\n| &&
      |FBFBBFFRLR\n| &&
      |FBBFBBFRLL\n| &&
      |FFBBFBFLRR\n| &&
      |BFBBFBFRRL\n| &&
      |BFBBBFFLRR\n| &&
      |BFBBFBBRRR\n| &&
      |FFBBBBBRLR\n| &&
      |BFBBFBFRLR\n| &&
      |FFBFFBFRRR\n| &&
      |BFFFFBBLRL\n| &&
      |BFFBBFBLLR\n| &&
      |BFFBBBFLRR\n| &&
      |FFBFFFBRLL\n| &&
      |BBBFFFBLLL\n| &&
      |FBBFBBFLLL\n| &&
      |BBFFFBFRRL\n| &&
      |FBBBFFFLRR\n| &&
      |FBBFBFBRRR\n| &&
      |FBBBFFFRRL\n| &&
      |BFFBBBFLLL\n| &&
      |BFBBFBBLRL\n| &&
      |FFBBFBBLLL\n| &&
      |BFBBBBFLLR\n| &&
      |FBFFFFBRRR\n| &&
      |FBBFFFFLRR\n| &&
      |FFFBFBBLLR\n| &&
      |BFBBFFFLRL\n| &&
      |FFBFFBBLRR\n| &&
      |FFBFBFBRLL\n| &&
      |FFBFFFBLRL\n| &&
      |FFFBBFFRRR\n| &&
      |FBBFBFFLRR\n| &&
      |FBFFBFBRRL\n| &&
      |BBFFBBFLLR\n| &&
      |FFBFFFBRRL\n| &&
      |BBFFBFFRRR\n| &&
      |FFBBBFBLRL\n| &&
      |FBBFFBFLRL\n| &&
      |FBFBBBFRLL\n| &&
      |BFFFFBBLLL\n| &&
      |BFFBBBBRRR\n| &&
      |FFBFBFBRRR\n| &&
      |FFBFBBBLLL\n| &&
      |BBFFBFFLLL\n| &&
      |BFFBFBBRRL\n| &&
      |FFBBFBFLRL\n| &&
      |FFBBFFFRLR\n| &&
      |BFBFBFFLLR\n| &&
      |BFBFBBFRLR\n| &&
      |FFFBFBBLRR\n| &&
      |BFFBFFBRRR\n| &&
      |BFFBFFFLRR\n| &&
      |FFBFFFBRRR\n| &&
      |FBBBFFBLLL\n| &&
      |FBFFBFBLLR\n| &&
      |BBFBFFBLLL\n| &&
      |FFBFBBFRLL\n| &&
      |BBFFFFBRRL\n| &&
      |FBFBFBBLLR\n| &&
      |FBFBFBBLLL\n| &&
      |FBBFBFFRRR\n| &&
      |FBFBBFBLLL\n| &&
      |BBFFBBFLRR\n| &&
      |BBFBFFBLRL\n| &&
      |FBFBFBBLRL\n| &&
      |BFFFFFBLLL\n| &&
      |BFFBBBFLLR\n| &&
      |BFBBBBBLRR\n| &&
      |FBFBBFBRLL\n| &&
      |FBFFFFBLLR\n| &&
      |BBFFBBBLRR\n| &&
      |FBFFFFFRRL\n| &&
      |FBFBFBFRLR\n| &&
      |BFFFBBFRLL\n| &&
      |BFFBFFBLLR\n| &&
      |BFBFFFFRRL\n| &&
      |FFBFFBFRRL\n| &&
      |FBBFBFFRLL\n| &&
      |FFBBBFBRLR\n| &&
      |BFBBBFFLRL\n| &&
      |FBBBBFBRRL\n| &&
      |FFFBFBFRRL\n| &&
      |BBFBBBFRLR\n| &&
      |BFFBFBFLRL\n| &&
      |BFFBBFBLRL\n| &&
      |FBFBFBFRRR\n| &&
      |FBBFFBBRRL\n| &&
      |FBFFBFFLRL\n| &&
      |BFBFFFFRRR\n| &&
      |FFBBFBFLLL\n| &&
      |FFFBBFBRLR\n| &&
      |BBFFBBBLLR\n| &&
      |BBFBFBFLRR\n| &&
      |BFFFFFBLLR\n| &&
      |BBFBFBBRLR\n| &&
      |FBFBFFFLRR\n| &&
      |BFBFFBFLLL\n| &&
      |BBFBBFFLLL\n| &&
      |FBBBFBBRRL\n| &&
      |FBFBFBBRLR\n| &&
      |FFBBBFFLLR\n| &&
      |BFFFFFBLRR\n| &&
      |BBFBFFFLRR\n| &&
      |FFBFBBBRLL\n| &&
      |BBFBFBFLLL\n| &&
      |BBFBBFFRRR\n| &&
      |BBFBBFFLRR\n| &&
      |FFBFBBBRRR\n| &&
      |FBFBFBFRRL\n| &&
      |BFFFFFFLRR\n| &&
      |BFBFBBFRRR\n| &&
      |FFFBBFFLLL\n| &&
      |FBFBBFFLRL\n| &&
      |FBFFBBBLLR\n| &&
      |BFFBBBBLLL\n| &&
      |FFBFFBFLLL\n| &&
      |FBFBFFBRRR\n| &&
      |BFBBBFFRRR\n| &&
      |BBBFFFFRRR\n| &&
      |BFBFBFBLLL\n| &&
      |FFBFBBBLRR\n| &&
      |BBFFBBBRLR\n| &&
      |FFBBFFBLRR\n| &&
      |BFBFBBBRRL\n| &&
      |FFBBFFFLRR\n| &&
      |FFFBBBBRRL\n| &&
      |BFBBFBFLLL\n| &&
      |FBBBBFBLRR\n| &&
      |BBFBFFFRRL\n| &&
      |FFBBFBFLLR\n| &&
      |BFFFFBBRRR\n| &&
      |BBFFBBFLLL\n| &&
      |FBFFBFBLLL\n| &&
      |BFBBFFFLLL\n| &&
      |FFBFFFBLLR\n| &&
      |FBFFFBBLLR\n| &&
      |BFBBBFFRRL\n| &&
      |FBFBBBFRLR\n| &&
      |FFBFFBFLRR\n| &&
      |BBFFFFFLLR\n| &&
      |FBBFBFFLLR\n| &&
      |BBFFBFBRRL\n| &&
      |BFBFBFFLRR\n| &&
      |BBFBFFFLLL\n| &&
      |BBFFFBBRLR\n| &&
      |BFBFFBBRLL\n| &&
      |BFBFBFBRLR\n| &&
      |BBFBBBBRLL\n| &&
      |BFBBFBBRLL\n| &&
      |FFBFBBBLRL\n| &&
      |BFBFBBBRLL\n| &&
      |FBBFBFBLRL\n| &&
      |FBFFFBBLRR\n| &&
      |BBFFBBBRRL\n| &&
      |BFBFFBFRRR\n| &&
      |BBBFFFBLRR\n| &&
      |FFBBBFFRRL\n| &&
      |FBBFFBFRRL\n| &&
      |BFFFBFFRLR\n| &&
      |FBFFBFFRLR\n| &&
      |FFFBFBBLLL\n| &&
      |FFBFBFFRRR\n| &&
      |BBFFBFFRRL\n| &&
      |FFFBFBFLRL\n| &&
      |BFFBBFFRRR\n| &&
      |FFBBBFFLRL\n| &&
      |FBFBFFBLLR\n| &&
      |FBFFBBFRRL\n| &&
      |BFFBBFFRLR\n| &&
      |BFFBFFBRLR\n| &&
      |BFFBFFFLRL\n| &&
      |FBFFFFFLRR\n| &&
      |FFFBBBBLRR\n| &&
      |BFBBFFBLLR\n| &&
      |BFBBFBBRLR\n| &&
      |BFFFFBFRLL\n| &&
      |BBFFFBFRLR\n| &&
      |FBFBFFFRRR\n| &&
      |FFFBBFFLRR\n| &&
      |FBBBBFBLLR\n| &&
      |FBBBBBFRLR\n| &&
      |FFBFBFBLLL\n| &&
      |FBFBBFFLLL\n| &&
      |BBFBBBBRLR\n| &&
      |BBFFBBFRRL\n| &&
      |BBFBBBFRLL\n| &&
      |BFBBFBFLRL\n| &&
      |BFBBBFFRLL\n| &&
      |FBFBFBBRRR\n| &&
      |FBBBBBBLLL\n| &&
      |BFBFFBBRRR\n| &&
      |FBBFFBBRRR\n| &&
      |BFFFFFBRRL\n| &&
      |FFBBFFFRRR\n| &&
      |FFBFFBBLLL\n| &&
      |BBBFFBFLRR\n| &&
      |BBFBBBBRRR\n| &&
      |FBFBFFFRLL\n| &&
      |FBBBFBFRRR\n| &&
      |FBBBBFFRRL\n| &&
      |BFFFFFFLRL\n| &&
      |FBBBBBFLRR\n| &&
      |BFFBBBFLRL\n| &&
      |BFBBFFFRLR\n| &&
      |FFBFFFFRLR\n| &&
      |FFBBBFFRLR\n| &&
      |BFBBFBBRRL\n| &&
      |FFBFBFFLLR\n| &&
      |BBBFFFFRLR\n| &&
      |BBFFFFFRLR\n| &&
      |FBBFFBBLLR\n| &&
      |BFBFFBFRRL\n| &&
      |BFFFBFFLRR\n| &&
      |FFBFBFBRLR\n| &&
      |BFFFBFFRRR\n| &&
      |BFFBBBBRRL\n| &&
      |FFBBBBBLLL\n| &&
      |BFFBBBFRLR\n| &&
      |FBFFFBFRLR\n| &&
      |FFBFBFFRLR\n| &&
      |BFBBBFBLLL\n| &&
      |FBFBBFBRRL\n| &&
      |BBFBFBBLRL\n| &&
      |BFBBFBFRLL\n| &&
      |BFBBBFFLLL\n| &&
      |FBBFBBBLLR\n| &&
      |FBFFFFBRRL\n| &&
      |FBBBBBBRRR\n| &&
      |FBFBBBBLRL\n| &&
      |FFFBFBBRRR\n| &&
      |FFBFBFFLRL\n| &&
      |FBFFBBFLLR\n| &&
      |FFBBFBBLRR\n| &&
      |BBFBFBBLLR\n| &&
      |FFFBFBFLRR\n| &&
      |BBBFFFBRRR\n| &&
      |FFBFFBBRRR\n| &&
      |FFBFFBBRRL\n| &&
      |FBBFFFFLRL\n| &&
      |FBFBBFFRRR\n| &&
      |BFBBFFFRLL\n| &&
      |FFFBBBFLLR\n| &&
      |FBBBBFBLLL\n| &&
      |BBFBBBBLRL\n| &&
      |BBFBFFBRRR\n| &&
      |BFFBBBBLRR\n| &&
      |FBBBBFBRRR\n| &&
      |BFBFBFFRRR\n| &&
      |BFFBBFBRLL\n| &&
      |FFBBBFBLLL\n| &&
      |BFBFFBFLRL\n| &&
      |BFFFBBFLRR\n| &&
      |FBBBBFBLRL\n| &&
      |FBBFBFFRRL\n| &&
      |FFFBBFFRLL\n| &&
      |FBFFFBBLRL\n| &&
      |FBBFFFBRLR\n| &&
      |FBBFBFBRRL\n| &&
      |FFBFFFFRRL\n| &&
      |FBFBBFFLLR\n| &&
      |FBFFBBFLLL\n| &&
      |FBBFBFBLLR\n| &&
      |BFFBBBFRRL\n| &&
      |FFBBFBBLLR\n| &&
      |BFBBFBFRRR\n| &&
      |BFFFFFFRLR\n| &&
      |FBBBFFFRLL\n| &&
      |FFBFFBFLRL\n| &&
      |FFBFFFFLRL\n| &&
      |BBBFFFBRLR\n| &&
      |BFFBFFBRLL\n| &&
      |BBBFFBFLRL\n| &&
      |FBBBFFBRRL\n| &&
      |BFBFBFBRRR\n| &&
      |FFFBBBFRLR\n| &&
      |BBFFBFBLLR\n| &&
      |BFBBBBFRLL\n| &&
      |BBFBFFBLLR\n| &&
      |FFBBFBBRRR\n| &&
      |FBBBFBBLRL\n| &&
      |BFBBBBFRRR\n| &&
      |BFBFBFBRLL\n| &&
      |BFBBFFFRRL\n| &&
      |FFBFBFFRLL\n| &&
      |FBBFBBFRLR\n| &&
      |BFFBFFFRLL\n| &&
      |BFBBBFBLRR\n| &&
      |BBFFFFFRRR\n| &&
      |FBFBBBBRLR\n| &&
      |FFBBFBFRLR\n| &&
      |FFBFFFFLLL\n| &&
      |FBBFFBFRRR\n| &&
      |FFBFFBFRLL\n| &&
      |FBBFFBBLRR\n| &&
      |FBBBFBFRLR\n| &&
      |BFBBBBFLRR\n| &&
      |FFBFBBBLLR\n| &&
      |BFFFBBFRRR\n| &&
      |FBBBFFBRLL\n| &&
      |FBFBBBFLRR\n| &&
      |BBFFBFFRLL\n| &&
      |FBFFFFBRLL\n| &&
      |FBFFBFBLRL|.
  ENDMETHOD.


  METHOD sanity_check.
    SPLIT boarding_passes AT cl_abap_char_utilities=>newline INTO TABLE DATA(bp_tab).
    result = REDUCE #( INIT r = 0
                       FOR boarding_pass IN bp_tab
                       LET seat_id = get_seat_id( boarding_pass ) IN
*                       NEXT r = COND #( WHEN r < seat_id THEN seat_id ELSE r  ) ).
                       NEXT r = nmax( val1 = r val2 = seat_id   ) ).
  ENDMETHOD.


  METHOD get_free_seat.
    SPLIT boarding_passes AT cl_abap_char_utilities=>newline INTO TABLE DATA(riddle).

    TYPES int_tab TYPE STANDARD TABLE OF i WITH EMPTY KEY.
    DATA(seat_ids) = VALUE int_tab( FOR r IN riddle ( CONV #( get_seat_id( r ) ) ) ).
    SORT seat_ids ASCENDING BY table_line.
    DATA(last) = seat_ids[ 1 ].
    LOOP AT seat_ids INTO DATA(id) FROM 2.
      IF last + 1 <> id.
        seat_id = id - 1.
        RETURN.
      ENDIF.
      last = id.
    ENDLOOP.

  ENDMETHOD.

ENDCLASS.
