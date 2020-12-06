CLASS zpw_policy DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES
      if_oo_adt_classrun.
    METHODS check_count
      IMPORTING
        policy       TYPE string
      RETURNING
        VALUE(valid) TYPE xsdboolean.
    METHODS get_max
      IMPORTING
        policy     TYPE string
      RETURNING
        VALUE(max) TYPE i.
    METHODS get_min
      IMPORTING
        policy     TYPE string
      RETURNING
        VALUE(min) TYPE i.
    METHODS get_letter
      IMPORTING
        policy        TYPE string
      RETURNING
        VALUE(letter) TYPE string.
    METHODS get_pw
      IMPORTING
        policy          TYPE string
      RETURNING
        VALUE(password) TYPE string.
    METHODS count_valid_count
      IMPORTING
        policy_list  TYPE string
      RETURNING
        VALUE(count) TYPE i.
    METHODS count_valid_pos
      IMPORTING
        policy_list  TYPE string
      RETURNING
        VALUE(count) TYPE i.
    METHODS constructor.
    METHODS check_pos
      IMPORTING
        policy       TYPE string
      RETURNING
        VALUE(valid) TYPE xsdboolean.
  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA policy_list TYPE string.

ENDCLASS.



CLASS zpw_policy IMPLEMENTATION.

  METHOD check_count.
    DATA(min) = get_min( policy ).
    DATA(max) = get_max( policy ).
    DATA(letter) = get_letter( policy ).
    DATA(password) = get_pw( policy ).
    DATA(letter_count) = count( val = password sub = letter ).
    valid = COND #( WHEN letter_count BETWEEN min AND max
                     THEN abap_true
                     ELSE abap_false ).
  ENDMETHOD.

  METHOD check_pos.
    DATA(first) = get_min( policy ).
    DATA(second) = get_max( policy ).
    DATA(letter) = get_letter( policy ).
    DATA(password) = get_pw( policy ).
    valid = COND #( WHEN substring( val = password off = first - 1 len = 1 ) = letter AND
                     NOT substring( val = password off = second - 1 len = 1 ) = letter
                      OR substring( val = password off = second - 1 len = 1 ) = letter AND
                     NOT substring( val = password off = first - 1 len = 1 ) = letter
                     THEN abap_true
                     ELSE abap_false ).
  ENDMETHOD.

  METHOD get_min.
    min = substring_before( val = policy sub = |-| ).
  ENDMETHOD.

  METHOD get_max.
    max = substring( val = substring_after( val = policy sub = |-| ) len = 2 ).
  ENDMETHOD.

  METHOD get_letter.
    letter = substring_before( val = policy sub = |:| len = 1 ).
  ENDMETHOD.

  METHOD get_pw.
    password = substring_after( val = policy sub = |: | ).
  ENDMETHOD.

  METHOD count_valid_count.
    SPLIT policy_list AT cl_abap_char_utilities=>newline INTO TABLE DATA(policy_table).
    count = REDUCE #( INIT c = 0
                      FOR policy IN policy_table NEXT
                      c = c + COND #( WHEN check_count( policy ) THEN 1 ELSE 0 ) ).
  ENDMETHOD.
  METHOD count_valid_pos.
    SPLIT policy_list AT cl_abap_char_utilities=>newline INTO TABLE DATA(policy_table).
    count = REDUCE #( INIT c = 0
                      FOR policy IN policy_table NEXT
                      c = c + COND #( WHEN check_pos( policy ) THEN 1 ELSE 0 ) ).
  ENDMETHOD.

  METHOD if_oo_adt_classrun~main.
    out->write( |Valid password count sled rental place: | && count_valid_count( policy_list ) ).
    out->write( |Valid password count Toboggan Corporate Authentication System: | && count_valid_pos( policy_list ) ).
  ENDMETHOD.

  METHOD constructor.
    policy_list =
      |8-9 n: nnnnnnnnn\n| &&
      |14-15 d: dzjgbdwdkdhdddh\n| &&
      |16-17 m: mmmmmmmmmxmmmmwmm\n| &&
      |7-17 d: pmgdhpqbqdhshgtjt\n| &&
      |1-2 b: mvmgzbmfbrcnr\n| &&
      |16-17 c: cccccccccccqcccgcc\n| &&
      |1-6 x: ctqxsh\n| &&
      |1-5 l: lllvw\n| &&
      |9-10 k: kkkkkkklrsnk\n| &&
      |7-9 g: xsgzggbglgtm\n| &&
      |3-4 b: brwb\n| &&
      |4-5 x: xdxlfx\n| &&
      |5-6 c: cccccc\n| &&
      |4-7 v: vvvvvdpx\n| &&
      |2-7 s: qwdngzbtsntgzmxz\n| &&
      |6-8 s: ssssssssssss\n| &&
      |2-3 t: tjcttt\n| &&
      |2-4 z: nbgfl\n| &&
      |11-12 z: gnjzwzwzzwcbhv\n| &&
      |4-5 v: tvkfvnvvvvcv\n| &&
      |1-3 h: hhbhh\n| &&
      |15-16 g: gggggggggggggggv\n| &&
      |6-9 t: ftjztttfnztv\n| &&
      |2-5 v: vxpmqvvzvnglvvv\n| &&
      |2-4 r: rsxq\n| &&
      |3-4 k: kxkk\n| &&
      |2-3 k: kkkk\n| &&
      |3-6 t: ktttztt\n| &&
      |1-2 v: zvcvv\n| &&
      |14-16 b: bbbbbbbbbbbbbrbb\n| &&
      |7-10 b: sgmbgmxbxnpjgpthcbr\n| &&
      |5-13 r: wmfmgmxxwgbrpllfqnjj\n| &&
      |3-4 t: ftcd\n| &&
      |2-3 z: szzf\n| &&
      |1-6 j: cxjjbj\n| &&
      |2-3 t: ttvt\n| &&
      |2-6 h: hhkszjhjjxhqhrhn\n| &&
      |3-4 s: ssns\n| &&
      |4-8 x: xcjmwxxxlrqxxfx\n| &&
      |3-10 g: ggvggggkgrggggggxg\n| &&
      |2-6 z: lzmhmvftsvcjfhfw\n| &&
      |9-14 x: xxxxxxxxhxxxxxxxxx\n| &&
      |8-16 d: dddddddddfdddddtd\n| &&
      |1-2 g: wrhg\n| &&
      |2-7 r: krjrxmrrvhzrprr\n| &&
      |11-18 v: vvwvdwslcxvtkzvvkr\n| &&
      |9-10 m: mmmxfmmmmmmmmmmz\n| &&
      |7-12 g: ggktlgggsqpgw\n| &&
      |6-8 t: tttttbtpz\n| &&
      |8-18 h: nfhhwkthhxhhcshhwh\n| &&
      |10-16 c: smnclksccmnmcmzcc\n| &&
      |14-15 f: nmndkphffnqmffj\n| &&
      |4-10 f: ffcwqvfffffvfg\n| &&
      |6-13 v: vvnvvcvxwxfvvvvvvvv\n| &&
      |1-4 k: qklkkkspwkxfk\n| &&
      |7-9 w: wwwwwwwwk\n| &&
      |9-10 c: ccccccccbpc\n| &&
      |11-14 r: qrxrjbbtrxrrrr\n| &&
      |2-5 j: wckjjdjjjzvhsqr\n| &&
      |10-12 x: xxxxxxxxxcxxx\n| &&
      |3-8 l: vnlslkhlwdd\n| &&
      |4-12 n: nxnfnqnnzmngnn\n| &&
      |4-5 z: zzgpzzc\n| &&
      |4-5 z: zgmtbz\n| &&
      |2-3 v: vkvv\n| &&
      |11-12 q: mqrqmlfqqqqlq\n| &&
      |6-14 g: lggzggfxggsggqggxg\n| &&
      |3-8 q: sqzqrbgvzp\n| &&
      |6-7 l: lllklll\n| &&
      |5-7 c: czrccvcclm\n| &&
      |11-17 r: rrwrrrrrrdrrrrrrbrrr\n| &&
      |2-4 x: xsxx\n| &&
      |3-9 l: llllllllwl\n| &&
      |3-19 c: ccccccccjccccvczcccc\n| &&
      |5-6 h: zhvhhhhghb\n| &&
      |1-3 t: ttttvttwt\n| &&
      |1-5 p: ppppppp\n| &&
      |3-4 g: ssvgr\n| &&
      |5-6 t: ndjbtttnmf\n| &&
      |14-16 f: fwptdqwwpztqhfnswts\n| &&
      |1-2 h: ffvmvbhmh\n| &&
      |2-3 f: gdrz\n| &&
      |1-2 l: slll\n| &&
      |3-5 w: zwwwrwwwwwwww\n| &&
      |1-3 w: fszt\n| &&
      |8-9 j: jjjjjjjjrj\n| &&
      |4-9 k: kkkskkkkkkk\n| &&
      |4-9 p: sppzppqpplpp\n| &&
      |2-9 s: ssvxrrjhs\n| &&
      |11-14 v: cvvvvvvvkvvvvvmv\n| &&
      |1-10 q: qqqcmqfjqs\n| &&
      |3-7 z: sgzzfzkzz\n| &&
      |5-8 w: wwwwhwrztw\n| &&
      |3-10 p: phbbmpzhpppspdfr\n| &&
      |2-8 c: cscpcccg\n| &&
      |2-4 r: rsvr\n| &&
      |14-16 h: hhhhhhhhhhhhhhhh\n| &&
      |1-13 j: jjjjjjjjhjxjxjjjj\n| &&
      |7-8 v: vvvvvvvvv\n| &&
      |4-8 r: vbhlmwrrvmkrwn\n| &&
      |3-4 c: ccdc\n| &&
      |3-5 h: hbjxx\n| &&
      |3-4 q: qqdqq\n| &&
      |10-14 k: dkkwnrkkhkwzhkkkk\n| &&
      |1-3 z: zzzzzzm\n| &&
      |3-7 t: tbtxfttvw\n| &&
      |6-18 n: qntgnnnztkhwtnjrnm\n| &&
      |4-5 g: gggrng\n| &&
      |2-7 c: bclzgcgq\n| &&
      |1-8 j: jbjjjjjj\n| &&
      |2-3 x: jxxfbtxskxc\n| &&
      |5-7 g: kgszqgcgxgqtppgb\n| &&
      |1-6 l: llllltll\n| &&
      |3-4 g: brgm\n| &&
      |12-16 x: xsxxxxqpxxvxmxjxxx\n| &&
      |6-7 k: kkkkkkk\n| &&
      |3-9 f: fftbvjfvfffstzfff\n| &&
      |14-15 r: khlwrfrcnrkddrh\n| &&
      |2-4 h: hwhqm\n| &&
      |4-5 z: zzzzd\n| &&
      |7-10 b: bbbbbbpbbt\n| &&
      |8-10 h: hhhhhhhdhn\n| &&
      |5-6 c: bccclt\n| &&
      |7-11 p: pppppppppppp\n| &&
      |4-6 r: rwrrrrrr\n| &&
      |9-17 m: mmmmmmmmmmmmmmmmmmm\n| &&
      |3-9 n: nnnfnnnnjnn\n| &&
      |3-4 q: rqqcq\n| &&
      |1-2 z: mbzz\n| &&
      |1-6 h: hhhhhs\n| &&
      |10-11 h: whhhrvtghhh\n| &&
      |5-6 g: ggggjz\n| &&
      |5-8 g: gggbgggvg\n| &&
      |15-16 v: vvvvvvvvvvvrvvtv\n| &&
      |5-7 q: qwrzqbllqqqrgkqnlsr\n| &&
      |2-4 c: ccccc\n| &&
      |7-14 p: spppxpppphblprm\n| &&
      |4-9 j: qzxlxdzsdlnlhw\n| &&
      |2-4 l: lzphl\n| &&
      |16-17 g: ggggggsgggggggxpqggs\n| &&
      |3-17 d: ddddddddddddldddcddd\n| &&
      |10-12 n: qtkgqxknvjnnsbnrwtp\n| &&
      |8-13 d: dddddddcddsdkdd\n| &&
      |7-16 v: wkntvjdvvwvfvnqvm\n| &&
      |2-5 w: vwhjw\n| &&
      |2-3 f: dmgff\n| &&
      |2-5 p: nklmmzp\n| &&
      |4-5 x: vxxxxd\n| &&
      |1-2 m: mmmqm\n| &&
      |9-12 r: rrrrrrrrqrrm\n| &&
      |6-9 r: ldvhvrjdkqhmr\n| &&
      |2-9 f: fmkffptffzdgk\n| &&
      |5-12 x: xxxxxxxxxxxbxxxxx\n| &&
      |3-4 w: bwwqgwt\n| &&
      |10-11 f: fffffffffhfff\n| &&
      |10-13 n: nnfnmnhnnnnnmn\n| &&
      |12-13 n: nnnnnnnnnnnnnn\n| &&
      |8-13 z: rzzfbzzdrzlkn\n| &&
      |13-14 p: qgkxppfppfjcnx\n| &&
      |3-4 z: bcxdctzg\n| &&
      |3-9 z: zznzwzzmffqxj\n| &&
      |1-2 n: nnnznr\n| &&
      |2-6 s: mtspsskswf\n| &&
      |2-15 g: ggggggggggggggqg\n| &&
      |3-8 x: tzxqfjrkpdgkxptbxm\n| &&
      |15-19 v: dvcvvvvvvvvvlvqvvvv\n| &&
      |4-9 r: dszrbrbzrwlfxpcrkn\n| &&
      |6-7 f: fffffsmf\n| &&
      |5-8 v: vdvvvvrv\n| &&
      |10-11 m: mmmmrmmmmmhmmm\n| &&
      |9-12 s: stwssszcsssr\n| &&
      |8-15 j: jjbjjjjjjjjjjhj\n| &&
      |6-8 v: vvvvvhvv\n| &&
      |1-7 w: ghxwddwwbfchvtff\n| &&
      |6-9 v: vvtxxrbqpvdvvv\n| &&
      |3-5 q: fqfqrskl\n| &&
      |15-17 k: kkkkzkkkkvbkkksrlkkk\n| &&
      |2-18 w: rtfwsrwcbpwtwjzmwwws\n| &&
      |5-7 f: pfshgsnff\n| &&
      |8-20 h: jkkhhhssfppkjqdfdhtp\n| &&
      |2-7 b: bblqbfhbbbb\n| &&
      |3-6 j: wjmjjxjj\n| &&
      |4-13 d: dfzdkqpddgchbhtgg\n| &&
      |4-7 x: xxxxtsn\n| &&
      |5-6 m: mmmmmmtm\n| &&
      |4-5 p: pkmppck\n| &&
      |1-14 j: jpjjwjjkjjmxkjwqj\n| &&
      |3-4 s: qxsfvs\n| &&
      |8-9 k: kkkwkzxrvkkkk\n| &&
      |13-15 r: qzrzrrbrxrcrzjpr\n| &&
      |1-4 l: lmvlj\n| &&
      |1-4 l: mrll\n| &&
      |11-15 w: wqwwwnwwwwtwwfwwjww\n| &&
      |8-9 g: fggzsggmggggccm\n| &&
      |2-5 f: vggqfcffxh\n| &&
      |2-4 c: cwcccr\n| &&
      |11-12 c: ccccccccccfc\n| &&
      |3-5 g: ggmggg\n| &&
      |10-11 l: llllllllrll\n| &&
      |5-6 v: wvdjvv\n| &&
      |6-7 p: ppppphkp\n| &&
      |7-10 c: tcccccnccjcccc\n| &&
      |8-10 m: mmmrmmlgmt\n| &&
      |3-14 j: ljsjjjjtjjjjjhj\n| &&
      |10-16 c: kcjcccccccccnvtccccc\n| &&
      |1-9 n: tnjnnnnnnnn\n| &&
      |3-7 h: mhdpxhhh\n| &&
      |15-16 c: ccccccgcccccccgcc\n| &&
      |6-8 t: tvkddtrt\n| &&
      |3-4 k: fkhjk\n| &&
      |9-11 v: bqmhnjvpvxr\n| &&
      |7-9 x: xxxxxxsxpx\n| &&
      |16-17 h: hgjzqhvqhsgcplwmhvth\n| &&
      |16-17 p: ppppppppppppppkqvp\n| &&
      |8-11 l: lllllzlbclslt\n| &&
      |4-18 k: kkkkkbkkkkkqkkkkkks\n| &&
      |1-8 b: cxbvpxbzbsz\n| &&
      |1-12 f: ffffffffffffffff\n| &&
      |13-19 d: ddddddddddddkddddddd\n| &&
      |9-11 v: mtvvvvvvhvgvv\n| &&
      |10-11 t: tttttttttdtttt\n| &&
      |5-9 g: gglgggpgdlgtcqg\n| &&
      |7-10 m: mzmmmmmmrn\n| &&
      |5-6 q: qqqqsq\n| &&
      |8-11 f: ffrcfbfnwffzfpxfbvf\n| &&
      |7-10 f: ffvfffxbpfffmjfqb\n| &&
      |2-3 r: rrrr\n| &&
      |6-7 x: bxxxxxgj\n| &&
      |3-5 j: jljndr\n| &&
      |4-14 q: qqqzqqqqqqpqqdqqqqqq\n| &&
      |3-6 n: nnnnntnnn\n| &&
      |15-16 g: ggggggggggggghggg\n| &&
      |13-16 x: jxxzqxvxfhxxvggxdqx\n| &&
      |4-6 f: zfxfkfhmsfgjf\n| &&
      |9-12 r: rrrrrrrrgrrnrrrrv\n| &&
      |3-7 w: wczsqxwdw\n| &&
      |9-12 k: hxgkkklkkkkwkkk\n| &&
      |1-4 s: sssns\n| &&
      |5-6 v: vvdvlv\n| &&
      |12-14 g: gsgggggggggggkgg\n| &&
      |5-16 r: rlkqflvvtfcdckfrn\n| &&
      |18-19 c: cfncccccccccccccclzc\n| &&
      |4-8 n: nbntnnnvnnnnnn\n| &&
      |3-6 l: jfpxllfrbll\n| &&
      |4-14 k: xphrkstmqmqhkw\n| &&
      |2-10 b: rrsrbbqvbr\n| &&
      |5-7 k: wkbgkkkqfkkkk\n| &&
      |5-6 k: kkkkkkk\n| &&
      |7-10 k: mqrsjkksskswqz\n| &&
      |11-14 x: kxxxxxcxxxnxpbdx\n| &&
      |2-15 h: hhhhhhhhhhhhhhh\n| &&
      |5-12 p: pppjpvgppppppppprv\n| &&
      |2-11 l: lzlllllllpdlll\n| &&
      |5-7 t: xwtzttvctqtpvbltpbtt\n| &&
      |2-18 k: ckhhplvxfrdqkbjhbkpp\n| &&
      |12-14 k: rkkqvkfngkkqjn\n| &&
      |3-7 n: mtxnkbnw\n| &&
      |3-11 z: zzzbzzzqzmzzczzzz\n| &&
      |3-4 m: mmmq\n| &&
      |2-7 s: ssssskcnssgnkzd\n| &&
      |3-4 g: rmgrggd\n| &&
      |2-3 h: grhrtpcch\n| &&
      |2-6 d: dddddddv\n| &&
      |3-7 g: jggggggggrfggggg\n| &&
      |5-6 v: ljztvvqrcsjdnlwv\n| &&
      |2-6 x: vxxtwk\n| &&
      |2-8 v: vvvvvvvvjv\n| &&
      |3-5 h: dwhwv\n| &&
      |2-7 n: ttxgbdbwnnnvnnx\n| &&
      |2-4 c: cctfcsb\n| &&
      |16-17 c: ccccccccgcxckccxccc\n| &&
      |5-6 x: xxxxxx\n| &&
      |2-6 p: pwndpfrpppppppppppkp\n| &&
      |1-4 h: zhhjlh\n| &&
      |2-5 p: prpxwppljppvwjtppkp\n| &&
      |2-6 j: bjjjjjjf\n| &&
      |16-20 p: pmppppbpppppppppsdpn\n| &&
      |1-3 b: bbbh\n| &&
      |8-11 k: nkxskkbkfjvcjkdcgrk\n| &&
      |7-12 c: cqcdcccgchnd\n| &&
      |5-7 m: mmmmmmmmmmmmmmm\n| &&
      |4-12 j: kjdjjvrjxsjw\n| &&
      |7-16 c: dfzcsdcdgrxvfkjzccmw\n| &&
      |1-12 m: mmmmmmmmmmmmmmmmzmm\n| &&
      |1-2 s: sssws\n| &&
      |1-5 x: xrtxs\n| &&
      |3-4 w: wvwv\n| &&
      |6-7 s: sssssss\n| &&
      |11-12 m: lbwtvjjmmggm\n| &&
      |16-17 l: llllllllllllwllht\n| &&
      |11-13 t: qtttttgtttttdmt\n| &&
      |2-5 r: ldgrf\n| &&
      |13-18 r: rrrrrrrrrrrrrrrprr\n| &&
      |12-19 l: lnfnhllrjgcllhjlczl\n| &&
      |6-7 c: clccccv\n| &&
      |9-14 b: shlfbcxhbbmbbzbg\n| &&
      |4-6 s: sjssvxdx\n| &&
      |11-12 v: vvvvjppqkvqv\n| &&
      |5-7 j: jjjjmjjjj\n| &&
      |8-11 l: dsldfrdvbll\n| &&
      |3-4 p: pkvmcps\n| &&
      |2-3 s: ssss\n| &&
      |8-11 j: txbxnpwqxjm\n| &&
      |4-6 d: drdvdd\n| &&
      |4-8 v: xgwkxvfq\n| &&
      |1-5 t: zttttttttqmtt\n| &&
      |5-8 c: ccjccccqc\n| &&
      |9-18 z: zzzzzzzzzzzzzzzmsgzz\n| &&
      |1-4 q: qqqkq\n| &&
      |10-11 w: wwwwwwwwwwww\n| &&
      |5-9 r: prtdrksjbmzmrq\n| &&
      |1-3 v: bvvnsmrdgxmnxjjv\n| &&
      |6-11 d: drnkdpvdvhfrfgzkn\n| &&
      |5-9 h: khhrhhhtvhtznhf\n| &&
      |1-3 g: gfpgn\n| &&
      |4-5 p: pppfg\n| &&
      |8-19 n: nnnnnnnrnnnnnnnnnnzn\n| &&
      |6-13 c: cztfcwpjcczsc\n| &&
      |3-4 r: rrrg\n| &&
      |4-6 t: tfjvtv\n| &&
      |4-7 g: nggggggg\n| &&
      |2-3 c: cmkc\n| &&
      |7-15 r: jrrrrrrrrrrrrrwtrrqr\n| &&
      |8-12 h: hjtpfjpbbzwhw\n| &&
      |7-8 d: jddddddd\n| &&
      |1-9 s: lsssssssmss\n| &&
      |18-19 m: mmmmmlmkmmtdwmmmmmh\n| &&
      |5-9 t: ttzstqtmt\n| &&
      |7-11 x: xxxwxxxxkxxxxgfxxx\n| &&
      |2-3 s: dssjzpsxjr\n| &&
      |3-4 g: gcgtg\n| &&
      |3-4 f: ffxff\n| &&
      |9-11 v: tvvvvvfslvvfvv\n| &&
      |1-7 n: nmlfmnz\n| &&
      |5-6 q: gqzqtqlq\n| &&
      |4-5 v: pvvvczdtwthvc\n| &&
      |1-3 z: zzrd\n| &&
      |6-7 b: sbbmbnbbrp\n| &&
      |3-7 l: lkllvqplww\n| &&
      |7-9 s: sssssssss\n| &&
      |1-8 g: gggkvggsgg\n| &&
      |5-6 n: nhnplpl\n| &&
      |2-9 g: vgnfzjfvjmmtgd\n| &&
      |1-4 d: dcddddddqdh\n| &&
      |1-9 z: zzzzzzzzzz\n| &&
      |8-10 q: wqhcwqdqqq\n| &&
      |7-18 z: tfrfdpwpphzplxfbnw\n| &&
      |7-10 f: rffnjdnffmfffrzfqgz\n| &&
      |6-7 p: pppppppp\n| &&
      |2-13 n: cndfbtxgqzmtnmq\n| &&
      |14-19 v: vvvbvvvvvpvvvsvvvvvv\n| &&
      |8-11 b: bbblbtwbbbbbb\n| &&
      |3-5 v: rfvvv\n| &&
      |15-17 n: snmnnnnnwnnnnnnnnnn\n| &&
      |4-12 q: sqqqhwnbqqxqbvfrk\n| &&
      |4-6 l: lllllvl\n| &&
      |17-18 c: cccccccccccccccccc\n| &&
      |1-12 t: gttttttxnttzttt\n| &&
      |16-17 t: kfmtctsqttztmsxtf\n| &&
      |7-14 f: ffffffcjffcfjfff\n| &&
      |5-19 b: jtvbbbrbbbjbcsbbvvb\n| &&
      |7-8 g: gggggggk\n| &&
      |2-4 w: dwvwww\n| &&
      |1-3 r: rrrrrrm\n| &&
      |7-8 q: qqcqqqqq\n| &&
      |6-9 m: tvglftcxmmnshcvscp\n| &&
      |3-6 m: cmgmmdmm\n| &&
      |6-9 k: kkkdkwzkgk\n| &&
      |2-15 w: bwqwwhpwvfpdwdvjwvk\n| &&
      |7-8 h: jdhhnhrdghh\n| &&
      |3-6 l: llxllpl\n| &&
      |4-11 q: ggrjmwhrqdc\n| &&
      |7-8 w: cwcwwwwwww\n| &&
      |5-6 s: sssssls\n| &&
      |6-9 w: rwjwjwwww\n| &&
      |1-8 c: ccncccccccccc\n| &&
      |2-4 b: xkbbf\n| &&
      |6-9 t: ttttttttrt\n| &&
      |14-15 h: hbhhhhhhhhhhhhw\n| &&
      |14-17 t: ttttgtttdttttttttt\n| &&
      |4-7 q: gqmqrqr\n| &&
      |9-11 j: tjjjsjwjglpjjjkjjg\n| &&
      |18-19 j: jjjjjjjjjjjjjjjjjjf\n| &&
      |15-17 p: ppppvhppppppppppp\n| &&
      |3-5 d: jlqcqdnprnddpd\n| &&
      |6-8 n: nnnnnnnn\n| &&
      |5-7 h: cwhhthhhv\n| &&
      |3-5 z: wqzmzpbjstzjpfww\n| &&
      |2-9 c: fkthkshccccczcph\n| &&
      |11-12 c: hcsscmqcdcgp\n| &&
      |8-9 t: tttttttkq\n| &&
      |3-4 m: tnmcvtljnpdphg\n| &&
      |11-19 l: wqjvlvzrgxlvrngwlktj\n| &&
      |6-14 s: dxzsssssmzgsmssss\n| &&
      |4-7 c: ccckjchc\n| &&
      |8-9 s: ssssssrslsm\n| &&
      |16-17 b: bxbbbbbbbbbbbbbbz\n| &&
      |3-12 p: mpnpplpkppmbp\n| &&
      |14-15 v: vvvvvvvvvvvvtvv\n| &&
      |5-6 d: kttkndlslhfg\n| &&
      |3-5 w: tlwwl\n| &&
      |3-4 n: wnhn\n| &&
      |13-14 r: zrbmrrrrrrrrmrrr\n| &&
      |3-5 f: fzwgrmzpkcfqkftmz\n| &&
      |5-6 s: ssssss\n| &&
      |5-7 h: wxpzhhzgwhdxqhmhw\n| &&
      |8-12 j: djsgjqjjjjjdj\n| &&
      |13-15 h: hhhrhhlhhpjhhhr\n| &&
      |6-7 v: vwvmvhw\n| &&
      |1-9 k: dmwkkkkzk\n| &&
      |1-2 g: ggtkbgvgtvggx\n| &&
      |10-18 r: rrrrrrrrpkhrrrrrrxrs\n| &&
      |5-10 n: nxbslftnwpnn\n| &&
      |4-5 d: ddhdd\n| &&
      |12-15 l: lllllllllllllhlll\n| &&
      |2-3 m: mmmmmmmmmmmmmmm\n| &&
      |1-8 s: ssshsspm\n| &&
      |3-5 b: nblhbdbbb\n| &&
      |2-4 t: qtjtctndq\n| &&
      |2-14 v: vcvkvvttxvkvpvhvvd\n| &&
      |12-16 g: gqckxjtggwzgtlqrtjkf\n| &&
      |3-10 s: ssvssssrsssbss\n| &&
      |2-4 n: knln\n| &&
      |4-10 f: xfqlfffbflm\n| &&
      |1-3 s: mssshjgshpfrssrss\n| &&
      |4-5 t: nttbj\n| &&
      |2-13 w: lwqwmwhthzrtwkgp\n| &&
      |1-3 r: jrnqb\n| &&
      |3-13 k: khkkkvkkfkkqkkhfwzf\n| &&
      |4-8 g: gggwgggg\n| &&
      |3-4 g: wgjgxhngdt\n| &&
      |7-9 k: mgshkgnhkpkjsmkvjp\n| &&
      |7-9 d: gdjrfqndcdhddmdhdd\n| &&
      |17-18 g: gnggggggggggggggng\n| &&
      |14-15 g: ggrgggggggggggg\n| &&
      |2-7 x: sxpwxddpxnxtxft\n| &&
      |5-6 r: grdvrrrrrwrrrrrgvq\n| &&
      |4-5 f: ffffff\n| &&
      |8-9 f: fffxffzgff\n| &&
      |12-15 f: dfffffffpffgffjlfmvf\n| &&
      |10-14 l: dlflltmllplljllvlzll\n| &&
      |1-2 j: jtnftndqklxzj\n| &&
      |1-5 d: ddjwrdddddddhdddddz\n| &&
      |13-14 j: lgztjqgjfbjfxff\n| &&
      |5-7 k: kkklqkz\n| &&
      |15-18 m: hwvmmpmmpqwsmrwmmmsm\n| &&
      |5-6 h: hlvhhhqhlh\n| &&
      |2-4 j: jjldjjjx\n| &&
      |10-11 f: ffffffffffffff\n| &&
      |15-16 t: ttttttttttttmtjttt\n| &&
      |3-4 v: vvvv\n| &&
      |8-9 n: nndhnclnnnnnrwnn\n| &&
      |5-6 r: rxrrrrfrr\n| &&
      |4-18 p: vwmppgpzltpplvwvpg\n| &&
      |9-10 z: fzzzzzzzrzzz\n| &&
      |4-6 n: nnbnvnnn\n| &&
      |10-11 x: xxgxxxwxxfrwk\n| &&
      |3-14 v: tqvvvjvdvvvzkvvvvv\n| &&
      |11-13 z: zzmzzzzhrzrzzzzzp\n| &&
      |5-6 s: ssgwsvssqs\n| &&
      |2-5 z: zbzfzzds\n| &&
      |2-5 s: sssss\n| &&
      |1-18 r: rrrrlrrrrrgrrrrgrr\n| &&
      |2-3 v: vgvvvvv\n| &&
      |3-13 c: qdcvfvkjtczgb\n| &&
      |3-9 h: hvhhhhhshh\n| &&
      |12-13 x: xdxxxxxxxxxxxx\n| &&
      |3-17 q: qqqqqqqqqqqqqqqqcq\n| &&
      |12-14 q: khnjqkkxlzpqhqj\n| &&
      |14-17 t: tttttttttttttsttpt\n| &&
      |15-16 d: kwpdfkbhcdhkwsdh\n| &&
      |2-15 m: fmdvntdqklcvmhmqjl\n| &&
      |5-7 q: qqqqvqnqqq\n| &&
      |3-4 j: mnjjj\n| &&
      |4-15 f: lfbffxfpffsfbdfhpfs\n| &&
      |8-9 s: sssssssgr\n| &&
      |12-14 b: bbbbbbbbbrsbbnbb\n| &&
      |2-3 x: xbxpvc\n| &&
      |10-14 v: vvvvvvvvvvvvvx\n| &&
      |6-13 f: kfvfcfffvfhdn\n| &&
      |4-16 k: gnzkfdkmrjvwdjgkf\n| &&
      |2-5 l: lljll\n| &&
      |2-4 r: dprr\n| &&
      |1-20 v: vvvvvhvvvvvvvvvvvvvc\n| &&
      |1-2 l: mlzljlvllkpzll\n| &&
      |4-13 r: kbzrzdrmdvfcl\n| &&
      |6-7 v: vvpvvzvv\n| &&
      |6-16 h: dxfwghscmjgfqmmf\n| &&
      |6-9 h: hhthhfhhdh\n| &&
      |6-10 j: bvqrjjjfdtjjjjj\n| &&
      |4-7 k: gklkcrvvkk\n| &&
      |2-8 k: ndtdhjpb\n| &&
      |13-15 f: ffffffffffffffb\n| &&
      |6-7 m: mmmmmmzm\n| &&
      |2-15 g: xbgxgfgftvgvgmcgnxc\n| &&
      |4-8 q: xkrqvqqq\n| &&
      |4-9 v: vvvvvvvtbv\n| &&
      |8-16 w: wwwxwxwbbwwwtdww\n| &&
      |8-11 h: hdhhhhhcght\n| &&
      |3-4 f: ffsb\n| &&
      |12-13 h: hhhhghhhdmpfhh\n| &&
      |6-7 f: ffdmgfh\n| &&
      |1-2 c: pcsc\n| &&
      |4-6 q: lkzqqmqqq\n| &&
      |3-4 b: bbjg\n| &&
      |3-6 f: lmbzffl\n| &&
      |10-15 p: prxpdpwqpwplpppp\n| &&
      |10-12 p: pppppppppppfp\n| &&
      |7-8 m: mmmmmmmjmq\n| &&
      |5-8 j: jjjfjbjtjj\n| &&
      |8-10 t: tttttttmtm\n| &&
      |5-11 k: kkkrhkkkkkk\n| &&
      |2-3 c: jcccwcbwfrckb\n| &&
      |3-10 n: qnnnnnfnnknnnnfnxn\n| &&
      |12-13 h: hhhhhhhhhhlhh\n| &&
      |9-10 s: smspmjsssss\n| &&
      |6-7 d: dddddmdnd\n| &&
      |9-10 g: kpnbgstjjgtbhk\n| &&
      |9-13 s: ssssssmshsbsxss\n| &&
      |1-2 s: lsfsss\n| &&
      |8-9 n: nnnnngnnn\n| &&
      |9-10 s: sssfssnssssjs\n| &&
      |6-8 m: mmxmmmmmm\n| &&
      |4-6 x: xtxjxx\n| &&
      |8-11 r: qrqkrwbfjln\n| &&
      |9-10 h: hfhhhhhhvq\n| &&
      |6-10 k: kpkpkjkkkvk\n| &&
      |7-10 b: bbbbhbkmmgbvk\n| &&
      |8-10 k: kkkkkkkkplvmmk\n| &&
      |1-2 r: rrwr\n| &&
      |2-5 d: tdddrddgq\n| &&
      |7-9 j: jjjjjjjjfj\n| &&
      |15-17 m: mmmmmmmmmmmmmmmmj\n| &&
      |5-6 v: vvcvvvfwjvvtn\n| &&
      |14-18 t: kznfxrrtfcdntttjrt\n| &&
      |3-4 c: cjdcc\n| &&
      |17-19 q: qqqqqqqqqqqqqqqqfqh\n| &&
      |4-5 k: fzvkk\n| &&
      |3-7 p: pgppppppppfpp\n| &&
      |10-11 k: kkkkkkvkkkz\n| &&
      |6-7 t: tttjcttt\n| &&
      |2-4 w: kwlcwbgfwwtqpngnb\n| &&
      |4-5 q: kqqvlq\n| &&
      |16-17 q: qqqqsbqqqqqqqqqbqq\n| &&
      |19-20 q: lndjjddqcqkcjztwfxvw\n| &&
      |4-6 p: pppmdccpp\n| &&
      |13-15 x: xxxxxxxxxxxxhxw\n| &&
      |1-9 d: lmdsdfbjpkmh\n| &&
      |8-15 v: vthvwvjvcvvqvvhmvs\n| &&
      |6-7 r: qxrrrrpr\n| &&
      |3-6 n: cxzxnn\n| &&
      |9-11 l: lllbhllhllbll\n| &&
      |5-9 d: nbsqdctdkp\n| &&
      |1-10 l: lllllllllflllllll\n| &&
      |1-5 f: cdsfqzwfnjkhdj\n| &&
      |2-5 m: clmgsmmdz\n| &&
      |1-6 g: cbqgngzvjpxjbwnlprq\n| &&
      |6-8 l: bfxrllllllw\n| &&
      |6-9 v: qtcxqvmvvdptxvv\n| &&
      |3-4 p: fjqx\n| &&
      |5-8 t: tpnttxtlt\n| &&
      |5-6 p: pppppf\n| &&
      |12-13 q: qqqlqqqqqqqqw\n| &&
      |5-6 g: hgggvx\n| &&
      |1-2 x: qxxx\n| &&
      |6-8 n: nkjnnpnnn\n| &&
      |6-8 j: jjjjjjjfjjjjjjjj\n| &&
      |4-5 s: sbsjm\n| &&
      |2-6 m: lmtmlm\n| &&
      |3-6 c: bzvhcccncz\n| &&
      |3-5 l: lllglnlmpl\n| &&
      |2-9 p: hpbwppwdrlpfwbdkmj\n| &&
      |7-10 l: tlzwhnlrkrc\n| &&
      |4-6 m: xmmmqdmcl\n| &&
      |1-6 d: jkdmmd\n| &&
      |5-7 c: cjqlhcdcc\n| &&
      |4-10 z: xgtznmnznkzvz\n| &&
      |13-15 z: zzzzzzzchzzzqzzzz\n| &&
      |2-5 q: qhvqqz\n| &&
      |1-9 l: nlllllllzlllllllll\n| &&
      |4-5 q: qqqzh\n| &&
      |5-7 t: ttpttdt\n| &&
      |3-11 l: lmnxlthlmlzksggzll\n| &&
      |2-5 q: qprnq\n| &&
      |16-18 b: bbbbbbbbbbbhbbbtbgn\n| &&
      |3-4 l: rlhl\n| &&
      |8-9 n: nwdfntdnsnmzkqthl\n| &&
      |6-8 h: hhhhhthv\n| &&
      |1-2 x: xcxp\n| &&
      |7-11 t: nttttctzxmtt\n| &&
      |2-4 b: ksvb\n| &&
      |17-18 d: dddddddddddddddpqd\n| &&
      |3-5 x: lprxzdhxxvz\n| &&
      |7-8 z: zgzzzzlzz\n| &&
      |2-3 p: rcpxw\n| &&
      |11-17 k: qkkkkkkkthkkkkkmkkk\n| &&
      |4-6 s: ssrssswxsssmsk\n| &&
      |5-8 d: ddddddddddd\n| &&
      |5-17 v: vvtvvvtvdvvvvvvvmcw\n| &&
      |3-8 r: rhvfrfcr\n| &&
      |12-15 z: zzzzzzzzzzzpzzpzz\n| &&
      |7-8 p: jppppvpp\n| &&
      |13-18 d: dvdnddddddddgddsdd\n| &&
      |10-11 q: hqnqvdpqdqqkq\n| &&
      |2-4 x: jcxxl\n| &&
      |6-7 q: qqfhfqjqr\n| &&
      |10-11 w: kwpwwhwnwwwwwww\n| &&
      |3-17 d: dddddddkddhdddddd\n| &&
      |4-6 s: ssnhswswlsc\n| &&
      |14-17 j: jhjjjrzjjmjfpzjjjjj\n| &&
      |1-9 z: ztzhzwzzkdzzr\n| &&
      |7-14 s: dcspnghrssxsss\n| &&
      |5-12 w: ctbvvxzwbwgqw\n| &&
      |7-9 k: kwkkqkkkgkm\n| &&
      |11-15 l: gllclqplllrlnlpzllc\n| &&
      |15-16 p: hpbpppppjpppppppppp\n| &&
      |3-5 k: cklnfv\n| &&
      |5-7 t: jczctqm\n| &&
      |14-17 j: jjjjjhjjjjjjjsjjjj\n| &&
      |9-10 g: gsknxggrgblfprf\n| &&
      |5-6 m: zjmmqrflmfpmswcvvmtl\n| &&
      |8-9 d: dxdddddds\n| &&
      |16-20 w: wwwwwwwwwwwwwwwdwwww\n| &&
      |5-7 s: ssssnsbs\n| &&
      |5-8 z: bzbgzvzz\n| &&
      |2-5 b: wbpkbbnkhcndh\n| &&
      |11-13 r: rrrrrrrrrrkrsr\n| &&
      |12-17 c: ksffzpccccspsqvjc\n| &&
      |2-20 v: vvvtvjvjvvvvvvvvstvv\n| &&
      |3-4 z: tzszjqzz\n| &&
      |3-12 x: scpxgxqrtxxpjxn\n| &&
      |13-16 w: wwwwnwjnzwwwwwwwwwwr\n| &&
      |9-12 l: zxlrflvclgck\n| &&
      |2-8 s: klsnwsdzbss\n| &&
      |5-9 s: ssssssssns\n| &&
      |1-9 q: fqqqqqqqqqqqqqqq\n| &&
      |15-17 n: jknfnsvntjqglbnxn\n| &&
      |15-16 h: gbpdwhhhhlthrjhh\n| &&
      |5-7 w: cjwgkxdwwxl\n| &&
      |1-5 j: jmnczjrlqchdwpthbjst\n| &&
      |6-8 v: vvvfxkvvvv\n| &&
      |5-8 g: ggbgqggmhg\n| &&
      |3-15 v: vxvvfzvvwcxvjvvqvvq\n| &&
      |6-14 h: drppknzrchcjhh\n| &&
      |2-3 n: dgntnq\n| &&
      |9-14 s: ssssssssxmsssxssssss\n| &&
      |2-4 j: wjrdcjz\n| &&
      |5-12 n: dntnnvbfjnznn\n| &&
      |3-4 z: zzmnzbsrt\n| &&
      |6-9 n: kngngnnbcnhp\n| &&
      |6-13 k: tmsskkjkkvtksnm\n| &&
      |2-4 w: rwhf\n| &&
      |6-7 p: ppppppwdpvp\n| &&
      |2-8 r: prqvprbrvrsjxm\n| &&
      |1-8 f: gffffffff\n| &&
      |6-8 b: lbmtblbptbxfdqb\n| &&
      |4-10 r: rrsrrrnrrbmrngrk\n| &&
      |10-17 b: bbbbbbbbbmbbbbjbhbb\n| &&
      |2-13 v: tmvqcvvwvvqvzvdx\n| &&
      |13-19 d: hrtlzplwdkshdbsjmsd\n| &&
      |6-13 w: wwwwwwwwwwwwdw\n| &&
      |14-16 q: hlkhpvdqrkhkqlhhlg\n| &&
      |7-8 m: mmmmmmmx\n| &&
      |11-12 p: pppfnpqppppp\n| &&
      |4-5 k: kkclzkfk\n| &&
      |8-9 k: krkkdkkkk\n| &&
      |15-16 w: wwxwwwcwwwwwwwjw\n| &&
      |12-16 w: wwwtmwnwqdwvjpwzwwz\n| &&
      |5-9 d: wdddrdddrdkdkddd\n| &&
      |5-6 p: qppbpvp\n| &&
      |1-7 t: fgznlbtgwtnrlhgf\n| &&
      |4-10 j: jjjjjjjjjljjj\n| &&
      |3-6 z: spgznzcz\n| &&
      |11-12 h: xhhhkfhhhhmh\n| &&
      |3-12 g: ckgvgbrgcqrggggt\n| &&
      |1-6 k: kkkkkjk\n| &&
      |2-3 j: qzbf\n| &&
      |3-4 r: rrlprrrrrrrrdrrrrr\n| &&
      |13-19 l: llllllpllllllllllll\n| &&
      |6-10 x: xxxxxjxxxxnx\n| &&
      |2-12 f: jffffbffqftf\n| &&
      |5-8 b: wbgbgbsb\n| &&
      |4-8 t: jflltrxfgttqvrgt\n| &&
      |2-5 z: fzzzszcwzz\n| &&
      |3-6 w: whwwbnw\n| &&
      |12-15 n: nndnnsnnnttnnnnnnn\n| &&
      |4-9 c: mcsstwccc\n| &&
      |3-4 q: dxwq\n| &&
      |6-11 v: swmrlccvxzdrffvvwj\n| &&
      |10-11 x: xxmxxxxxxmx\n| &&
      |1-2 k: fkqk\n| &&
      |15-16 d: nlnzddfrjqvdjwddmw\n| &&
      |2-6 k: ldkdmnmcp\n| &&
      |1-11 p: fptzpgpzfhp\n| &&
      |12-14 b: bbbbbbbbbbtbbx\n| &&
      |6-12 w: wwwpbwwmxwxz\n| &&
      |1-4 r: mrrrrrr\n| &&
      |13-18 w: wwrwgwrlwwwwwwwwwlw\n| &&
      |16-19 z: szzzjzzmzzzzzzzzzzsc\n| &&
      |2-7 v: qvvcsvd\n| &&
      |7-10 s: mtskmnvnlcgsb\n| &&
      |6-7 q: mkdqqqq\n| &&
      |3-5 x: xwxmx\n| &&
      |7-9 q: qsqjfqcqwnq\n| &&
      |1-4 r: crcb\n| &&
      |14-18 k: lfwklgqjzgxfpkpkfqr\n| &&
      |9-14 j: jjjjjrjzjjjjjfj\n| &&
      |5-6 x: xxxxxxh\n| &&
      |1-17 z: gvczzzzqdqzzzzzmwkzd\n| &&
      |11-14 k: dkkklkkpkkkktkkkkkk\n| &&
      |9-12 j: jjjjjjjjqjjv\n| &&
      |2-6 d: dthddmddd\n| &&
      |4-5 v: qvfjfvvdlszqxvbl\n| &&
      |4-5 n: nnndn\n| &&
      |7-8 c: wqnmpcwf\n| &&
      |1-10 c: cvgmnkcssrhqccmddgh\n| &&
      |8-9 m: lmmtmxmsm\n| &&
      |3-6 v: qvvnqvvrfhv\n| &&
      |6-7 x: vxxxxmkjxxxxxxxxxxx\n| &&
      |5-14 x: qxjgbxxxxprxxn\n| &&
      |13-14 p: dphsqvhrfsbpqpp\n| &&
      |3-5 r: trvrrxrrr\n| &&
      |2-5 f: fffff\n| &&
      |2-6 w: whwdwnwt\n| &&
      |2-3 x: wxcsxx\n| &&
      |10-14 p: pswtzbkslpqppph\n| &&
      |3-5 l: zllllx\n| &&
      |9-11 g: ggggggggggxgg\n| &&
      |4-6 h: fvhhfhhfjqffhhhwx\n| &&
      |7-8 t: wttttttf\n| &&
      |11-14 q: qqqqvqqxzcqpqhqkpqtf\n| &&
      |5-9 b: bsrbbbxkm\n| &&
      |13-15 t: tttttkwtttttgttwt\n| &&
      |4-7 c: czccvxtc\n| &&
      |9-10 n: nwnnnnnnnn\n| &&
      |3-5 f: ffdtf\n| &&
      |13-14 h: hhzhhhhhhhzhphh\n| &&
      |9-11 g: kgsfsnhsggglgsp\n| &&
      |5-6 s: hbxpnsssvx\n| &&
      |10-11 t: ltsrtmvmkgm\n| &&
      |12-18 k: xlwkkkkktkkkbkkrjxkk\n| &&
      |5-7 l: lnllwlw\n| &&
      |16-17 k: kkkkkkklkpkkkkkknkk\n| &&
      |11-12 t: ttttttttttttt\n| &&
      |11-13 v: vvvvvvvgvvvvvvv\n| &&
      |10-14 d: ddvddjdddkdddd\n| &&
      |3-4 r: nrdrhnr\n| &&
      |1-4 q: pqqxcsws\n| &&
      |5-6 p: ppppjpp\n| &&
      |14-15 b: bmbflqmbzhkbqvb\n| &&
      |9-11 t: ttntttttnpt\n| &&
      |15-16 l: llsllldflhblwlllf\n| &&
      |5-10 w: swwwwnwncwtfrpnw\n| &&
      |6-7 j: jjjjjthb\n| &&
      |2-4 d: ddhdzfdddlp\n| &&
      |2-9 q: jqqqqbqqqzq\n| &&
      |19-20 b: bbbgbdbkbbhbsdpbbtbh\n| &&
      |7-9 v: hvvvxvvvv\n| &&
      |6-7 l: gsbslll\n| &&
      |2-6 p: pzpppwpppppppppp\n| &&
      |10-11 g: kmkngxnnrfh\n| &&
      |1-11 v: rvdvvvvvvvv\n| &&
      |2-4 n: nhndnnnnqn\n| &&
      |12-13 q: qqqqqqqqqqqqm\n| &&
      |7-9 s: ssssxsnsssss\n| &&
      |2-15 t: ftntkfmqxzxggcfwb\n| &&
      |1-7 v: vvwvvvqdvv\n| &&
      |6-14 s: sbsssdssssssfqsss\n| &&
      |3-8 w: vwwqwwww\n| &&
      |6-10 z: zzzzzzczkzzz\n| &&
      |5-8 b: bbvdmxqbbbbbbbbdv\n| &&
      |4-8 s: stvsssszcswszs\n| &&
      |12-13 x: xxxxxxxxxxxxxx\n| &&
      |5-15 d: ngzjdxddjddxvbwzbd\n| &&
      |1-10 s: ssssssssss\n| &&
      |10-14 r: rnhrrrrrrrznrrr\n| &&
      |1-7 z: nvzzzcvzzmzhnprzkz\n| &&
      |2-9 w: zfmxnmltsbxpfsh\n| &&
      |13-14 l: lllllblllllldgl\n| &&
      |3-9 b: dbbrkmmfsmhblqb\n| &&
      |1-6 t: tjmrctqggzdgtz\n| &&
      |1-14 m: bmmmmmmmmmmmmmmmmmm\n| &&
      |3-4 b: mwbndzbjp\n| &&
      |9-11 n: nnnnnnccmnb\n| &&
      |5-11 b: kpcbqbbbcmbkb\n| &&
      |3-6 j: wpjjspjw\n| &&
      |6-12 p: pppppppppppdppp\n| &&
      |1-4 c: rccc\n| &&
      |3-9 l: llllxllbllll\n| &&
      |6-14 w: tlpcwxwwwzbtwd\n| &&
      |3-4 q: qqqg\n| &&
      |3-5 x: htxcvqkwx\n| &&
      |15-17 r: rrrrrrrrrwxrrrrrr\n| &&
      |8-10 k: kkkkkrkwkkw\n| &&
      |3-4 s: jjwhksqrbxs\n| &&
      |3-4 g: gvggg\n| &&
      |11-13 t: tjgttvtdtbttttttqttr\n| &&
      |5-6 j: jjjjmjjj\n| &&
      |9-13 f: fffffffflffff\n| &&
      |13-14 z: ccbzvzwmzpzzmz\n| &&
      |6-7 b: bbjtbbbbbb\n| &&
      |3-5 k: pkknmv\n| &&
      |3-4 w: wmchw\n| &&
      |4-7 b: bbbgbbbbb\n| &&
      |10-13 q: qrqqqvxbplqqxqqqmqq\n| &&
      |1-8 b: rbbbbbbjbbbcqbb\n| &&
      |7-17 q: xqqqqqqqqqqqqqqtq\n| &&
      |4-6 k: kqkkbbg\n| &&
      |6-14 l: lglhbvslmhqjnw\n| &&
      |4-6 w: pwwxxn\n| &&
      |12-16 q: tvtqvcchgtmqqznb\n| &&
      |8-14 q: hkthhbpjvkpxgq\n| &&
      |11-13 m: smmffkhhkrmwnbwrs\n| &&
      |8-11 d: dddddddddddd\n| &&
      |4-6 m: lmdmmkwmmmfbs\n| &&
      |12-20 w: wwwwwwwwwwwbwwwwwwsb\n| &&
      |5-7 m: mrnhmplhwczr\n| &&
      |7-11 p: pppppdbpppvpc\n| &&
      |4-10 p: zpwsppfppj\n| &&
      |3-12 d: dddddpfddrdln\n| &&
      |8-9 g: chfcgzfgg\n| &&
      |5-6 g: gggghg\n| &&
      |7-8 q: hqqqxqqqqqqqqqg\n| &&
      |4-10 c: cdtpvcccvd\n| &&
      |7-8 s: sqwtsxsssss\n| &&
      |5-11 v: pcvvrvxvvnpjn\n| &&
      |4-6 z: hzmnzg\n| &&
      |4-6 b: bslbbbxbbwml\n| &&
      |16-18 z: zzzzzzzzzzzzzzzzzg\n| &&
      |1-3 h: hhkh\n| &&
      |2-4 r: wrtrb\n| &&
      |5-6 d: ddddpd\n| &&
      |4-7 k: kkkkkkkkkxk\n| &&
      |8-13 k: pkkkkkkkkkgkkd\n| &&
      |8-13 p: lpxppxpbpgppzppmppp\n| &&
      |3-9 m: mmmmmmmmmmmmmm\n| &&
      |6-7 h: cpmmhcttgx\n| &&
      |11-15 b: bbbbbbqbpkfbbzh\n| &&
      |4-7 j: jjqvjjj\n| &&
      |6-8 c: gwrfrslcsqmcttzcl\n| &&
      |11-13 r: mrrrrrpgrrnrrrr\n| &&
      |3-8 q: tqqqqqqz\n| &&
      |2-4 f: mtsxj\n| &&
      |1-17 g: cgggggsgggdgcgrxg\n| &&
      |1-9 m: mhgqjqxjnpmmmgnmfpm\n| &&
      |2-4 g: rggbc\n| &&
      |2-4 w: wgfw\n| &&
      |7-9 d: qdmddddddmxdd\n| &&
      |12-13 t: ttmjznwtwtttz\n| &&
      |11-12 b: kjbkbgdbwbmcb\n| &&
      |4-5 h: mhvhh\n| &&
      |4-6 t: ttvttttt\n| &&
      |9-12 r: zwlljhfrrfrr\n| &&
      |3-4 j: jjjj\n| &&
      |2-7 v: vvvvvvmvv\n| &&
      |9-19 n: nnnnnnnnmnnnnnnnnnqn\n| &&
      |1-3 q: qfflx\n| &&
      |8-10 k: kkkkkkknkk\n| &&
      |4-9 k: kvrspqfkkqj\n| &&
      |14-15 b: bbbbbbbbbbbbbbbb\n| &&
      |3-8 d: qrdsfdwd\n| &&
      |5-8 j: jjxmrtjjjjkpnnjt\n| &&
      |14-15 f: fnlnbzqffrrnffgf\n| &&
      |1-4 f: fnff\n| &&
      |4-5 x: xxxtx\n| &&
      |5-6 q: qtqqlmqqq\n| &&
      |14-15 f: fflffdfffffffkjfff\n| &&
      |1-5 k: kkqkvkk\n| &&
      |5-9 b: nbjtwbbgw\n| &&
      |13-19 v: ssjjggrvrnbpvjlggsf\n| &&
      |8-10 x: xxxxmxxxxx\n| &&
      |4-5 d: vdwhtcsc\n| &&
      |1-7 l: zlllllglll\n| &&
      |2-5 d: drjpdwrlnpfqqrnlh\n| &&
      |12-13 p: fthsszdpjcqxd\n| &&
      |14-17 z: zzczzzzzzzzzzzzznzz\n| &&
      |6-11 m: hhcsqmvmfgmkmbm\n| &&
      |7-8 m: hmmmmmcmm\n| &&
      |6-7 l: lllllgl\n| &&
      |5-10 t: tttktdzttlcttv\n| &&
      |6-12 m: nmmmpmmmxtmmjmxm\n| &&
      |4-5 q: qnqnnqqqqqqq\n| &&
      |1-4 c: zkpcc\n| &&
      |5-6 n: nbphjnfn\n| &&
      |6-7 f: ffffxqrf\n| &&
      |1-6 g: lgggggggg\n| &&
      |5-11 p: mbfpppplhdp\n| &&
      |5-8 z: jzvzzkzm\n| &&
      |5-7 l: llllllll\n| &&
      |5-14 x: gvjvwmhxtzpsfxb\n| &&
      |4-13 x: tvlfjxmpfrmqmkhrdlbl\n| &&
      |8-11 b: nbbbbrcbbbb\n| &&
      |8-10 w: ccccwwgwwwwl\n| &&
      |2-13 p: wwwxrsfztddwplfpqx\n| &&
      |17-18 c: ccccccccvccccccccj\n| &&
      |11-13 d: dphdtwhqwdhmx\n| &&
      |15-17 c: ccccccccwcccccccdc\n| &&
      |3-4 d: ggjv\n| &&
      |3-4 b: bbqbbqbx\n| &&
      |2-3 g: qggg\n| &&
      |10-18 w: wpbbfmdzhsnbcdxqrh\n| &&
      |13-20 v: vpvvvvvvrvvvvsvvvvxv\n| &&
      |16-17 w: vwwqhwwwfhwgdkhfw\n| &&
      |16-19 b: bbbbbbbbbzpbbkbkbbjb\n| &&
      |11-16 x: hczxsbkhxfbtxvzx\n| &&
      |10-17 b: bbbbbbbbbsbbbbbbvbb\n| &&
      |2-3 p: pppxsznnn\n| &&
      |2-7 g: ggggsgggl\n| &&
      |15-17 t: tttttttthttttttttttt\n| &&
      |7-17 f: fffsfftfffffffffffqf\n| &&
      |3-7 k: gpfmqbkqmkkkrpkpk\n| &&
      |4-7 j: xpbgxjw\n| &&
      |14-15 f: ffffftknfklfdff\n| &&
      |1-4 k: pkkslkkkkk\n| &&
      |4-7 w: czbwgqtpwztxwwbwmqf\n| &&
      |1-5 n: tnnnnn\n| &&
      |1-5 q: qdqtq\n| &&
      |10-15 c: fccqccrkcccczcmcc\n| &&
      |9-14 h: hhbbhhhhdhhhhhdhhh\n| &&
      |2-6 f: fsbfdcvffhffm\n| &&
      |12-15 h: jhhhhhhhhhhhhhs\n| &&
      |9-11 p: ppppppppppbp\n| &&
      |15-16 d: txdbddddjdsdbrvddddp\n| &&
      |5-6 w: wqkwrv\n| &&
      |2-4 z: zzjnsjspkgdkmvvlh\n| &&
      |13-14 z: zzbzzzzzzzkzzzz\n| &&
      |9-10 v: vvvvvvvvvcv\n| &&
      |13-15 g: gggggggggpqgtgv\n| &&
      |1-17 j: bjjjjjjgjjjjjjjjjjj\n| &&
      |5-7 x: dpsxxxx\n| &&
      |17-20 d: ddvxddtdhdrddjddnddd\n| &&
      |5-6 f: ffxffp\n| &&
      |12-14 w: wwwwwgwwwwwwwq\n| &&
      |8-13 t: rnthvkbtnxvltsjn\n| &&
      |4-5 q: qqqdq\n| &&
      |4-12 s: ssssssssssszs\n| &&
      |3-4 s: sssw\n| &&
      |2-5 x: kzxwxqljv\n| &&
      |1-3 x: rhxxdxxxdg\n| &&
      |11-12 t: tthtstttgztrt\n| &&
      |1-4 n: qzdnkpkrzgxdztdcfn\n| &&
      |12-15 g: fgdzsqwkfdhrbsjz\n| &&
      |1-3 g: kggg\n| &&
      |6-9 c: hcwcccpcccwcck\n| &&
      |8-9 r: rqrlrggwrrjfzgkmrq\n| &&
      |4-5 r: ghzlrrrgs\n| &&
      |9-11 g: ggggggdggggr\n| &&
      |12-14 f: fffffffffffcffffff\n| &&
      |3-7 z: mgzmpjz\n| &&
      |1-6 h: hhzzbm\n| &&
      |18-19 g: ggfhhvggffkqfgjnggg\n| &&
      |1-8 p: ppppppphwppwr\n| &&
      |13-15 l: qmjnjfnnlmbqgllwhk\n| &&
      |5-13 z: zgpwzhwnmptrzrq\n| &&
      |3-4 v: xnvnqjjrvvlgv\n| &&
      |14-15 p: pppgpphppppppwpnrpr\n| &&
      |9-13 h: hxfhhshbqhnhhp\n| &&
      |5-6 w: wkvqbtbtfmsbwkwwhdwb\n| &&
      |1-3 x: shxxx\n| &&
      |1-2 v: vhvt\n| &&
      |5-8 c: zdrlnhcctcpccsntl\n| &&
      |12-19 x: xxxxppxxxmfglxfxmxg\n| &&
      |3-4 v: vfqwq\n| &&
      |8-9 f: fffffffxx\n| &&
      |11-14 l: lslvlnbsjlbllmqllfl\n| &&
      |3-9 j: njhfczjmmn\n| &&
      |3-5 q: scqrdqq\n| &&
      |2-16 q: tvgkgqqcpqmpjkqqqqqb\n| &&
      |11-13 q: vdrmqfqqqqqqdjqq\n| &&
      |3-8 j: jftcskds\n| &&
      |10-11 j: ljjwfjtxqjh\n| &&
      |7-16 z: zqtcldzxqmzmgzbz\n| &&
      |6-14 v: vvvvvvvvvjvvvvv\n| &&
      |1-13 q: qdrqgpcqzbpqftws\n| &&
      |6-8 d: mdgddbtdddzd\n| &&
      |1-6 g: gggjgggggg\n| &&
      |1-4 d: djddbhddkdtkvt\n| &&
      |11-12 l: lllllllllllll\n| &&
      |1-9 g: gggggnvgm\n| &&
      |7-17 v: vvvvvvxvvvvvvvvvv\n| &&
      |7-11 m: mmmmmmmmmmh\n| &&
      |2-4 m: cmfmcpm\n| &&
      |4-5 m: mmmmjm\n| &&
      |6-9 q: qzcqxbvqfk\n| &&
      |1-2 s: ssnssms\n| &&
      |2-4 m: xmmz\n| &&
      |15-18 h: rtzvhbrpsrbhxqchbz\n| &&
      |5-6 w: jwwwwnwt\n| &&
      |4-5 m: jmrmwfqmrmtgmm\n| &&
      |8-11 p: pkpjpmpppxzpp\n| &&
      |1-7 s: sssspssszss\n| &&
      |3-6 l: lclllllknlm\n| &&
      |1-2 p: pwrwlc\n| &&
      |7-9 s: ssssssxhfss\n| &&
      |5-9 l: llllllllflllgl\n| &&
      |12-19 n: clkznzskfvxngwnnclpx\n| &&
      |14-18 n: nnnnnxnnnnnnnnnnngnn\n| &&
      |1-8 m: vwbpmmsxmvbwsggqgxd\n| &&
      |10-11 q: nqqqqgqfqpf\n| &&
      |4-15 b: fctbwzqnwbnvqbqlb\n|.
  ENDMETHOD.


ENDCLASS.
