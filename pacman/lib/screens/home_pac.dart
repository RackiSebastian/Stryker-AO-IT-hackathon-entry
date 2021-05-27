import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pacman/screens/Register.dart';
import 'package:pacman/screens/path.dart';
import 'package:pacman/screens/pixelpac.dart';
import 'package:pacman/screens/player.dart';

class PacHome extends StatefulWidget {
  @override
  _PacHomeState createState() => _PacHomeState();
}

class _PacHomeState extends State<PacHome> {
  static int numberInRow = 30;
  int numberOfSquares = numberInRow * 20;
  int round = 0;
  int player = 328;
  Timer _timer;
  int _start = 15;
  int score = 0;
  List<int> food = [];
  List<int> foodGone = [];
  List<int> barriersTwo = [
    181,
    182,
    32,
    62,
    92,
    122,
    152,
    182,
    212,
    242,
    272,
    302,
    332,
    183,
    184,
    185,
    35,
    65,
    95,
    125,
    155,
    185,
    215,
    245,
    275,
    305,
    335,
    246,
    247,
    127,
    157,
    187,
    217,
    68,
    98,
    39,
    70,
    100,
    131,
    161,
    191,
    221,
    251,
    280,
    310,
    278,
    308,
    339,
    311,
    312,
    43,
    73,
    103,
    133,
    163,
    193,
    223,
    253,
    283,
    313,
    343,
    44,
    45,
    76,
    194,
    195,
    166,
    107,
    137,
    108,
    49,
    79,
    109,
    139,
    169,
    199,
    229,
    259,
    289,
    319,
    349,
    350,
    351,
    352,
    353,
    200,
    201,
    202,
    203,
    50,
    51,
    52,
    53,
    56,
    86,
    116,
    146,
    176,
    206,
    236,
    266,
    296,
    356,
  ];
  List<int> barriers = [
    390,
    391,
    392,
    393,
    394,
    395,
    396,
    397,
    398,
    399,
    400,
    401,
    402,
    403,
    404,
    405,
    406,
    407,
    408,
    409,
    410,
    411,
    412,
    413,
    414,
    415,
    416,
    417,
    418,
    0,
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
    11,
    12,
    13,
    14,
    15,
    16,
    17,
    18,
    19,
    20,
    21,
    22,
    23,
    24,
    25,
    26,
    27,
    28,
    29,
    59,
    89,
    239,
    119,
    269,
    149,
    299,
    179,
    329,
    209,
    359,
    389,
    419,
    449,
    479,
    509,
    538,
    539,
    360,
    511,
    512,
    513,
    514,
    515,
    516,
    517,
    518,
    519,
    520,
    521,
    522,
    523,
    524,
    525,
    526,
    527,
    528,
    529,
    530,
    531,
    532,
    533,
    534,
    535,
    536,
    537,
    30,
    60,
    90,
    120,
    150,
    180,
    210,
    240,
    270,
    300,
    330,
  ];
  List<int> barrriersThree = [];
  List<int> barriersFour = [];
  List<int> barriersFive = [];
  List<int> barriersSix = [];
  String direction;

  void moveLeft() {
    if (!barriers.contains(player - 1) &&
        !barriersTwo.contains(player - 1) &&
        !barrriersThree.contains(player - 1) &&
        !barriersFour.contains(player - 1) &&
        !barriersFive.contains(player - 1)) {
      setState(() {
        player--;
      });
    }
  }

  void moveRight() {
    if (!barriers.contains(player + 1) &&
        !barriersTwo.contains(player + 1) &&
        !barrriersThree.contains(player + 1) &&
        !barriersFour.contains(player + 1) &&
        !barriersFive.contains(player + 1) &&
        !barriersSix.contains(player + 1)) {
      setState(() {
        player++;
      });
    }
  }

  void moveUp() {
    if (!barriers.contains(player - numberInRow) &&
        !barriersTwo.contains(player - numberInRow) &&
        !barrriersThree.contains(player - numberInRow) &&
        !barriersFour.contains(player - numberInRow) &&
        !barriersFive.contains(player - numberInRow) &&
        !barriersSix.contains(player - numberInRow)) {
      setState(() {
        player -= numberInRow;
      });
    }
  }

  void moveDown() {
    if (!barriers.contains(player + numberInRow) &&
        !barriersTwo.contains(player + numberInRow) &&
        !barriersTwo.contains(player + numberInRow) &&
        !barrriersThree.contains(player + numberInRow) &&
        !barriersFour.contains(player + numberInRow) &&
        !barriersFive.contains(player + numberInRow)) {
      setState(() {
        player += numberInRow;
      });
    }
  }

  void getFood() {
    for (int i = 0; i < numberOfSquares; i++) {
      if (!barriers.contains(i) ||
          !barriersTwo.contains(i) ||
          !barrriersThree.contains(i) ||
          !barriersFour.contains(i) ||
          !barriersFive.contains(i) ||
          !barriersSix.contains(i)) {
        food.add(i);
      }
    }
  }

  void startGame() {
    getFood();

    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(oneSec, (Timer timer) {
      if (_start == 0) {
        setState(() {
          _timer.cancel();
          round++;
          score = 0;
          food = [];
          foodGone = [];
          player = 181;
          if (round == 1) {
            _start = 15;
            startGame();
            direction = null;
            barriers = [
              0,
              1,
              2,
              3,
              4,
              5,
              6,
              7,
              8,
              9,
              10,
              11,
              12,
              13,
              14,
              15,
              16,
              17,
              18,
              19,
              20,
              21,
              22,
              23,
              24,
              25,
              26,
              27,
              28,
              29,
              30,
              60,
              90,
              120,
              150,
              180,
              210,
              240,
              270,
              300,
              330,
              360,
              390,
              391,
              392,
              393,
              394,
              395,
              396,
              397,
              398,
              399,
              400,
              401,
              402,
              403,
              404,
              405,
              406,
              407,
              408,
              409,
              410,
              411,
              412,
              413,
              414,
              415,
              416,
              417,
              418,
              419,
              29,
              59,
              89,
              119,
              149,
              179,
              209,
              239,
              269,
              299,
              329,
              359,
              389,
            ];
            barriersTwo = [
              31,
              361,
              362,
              363,
              364,
              365,
              366,
              367,
              368,
              369,
              370,
              371,
              372,
              373,
              374,
              375,
              376,
              377,
              378,
              379,
              380,
              381,
              382,
              383,
              384,
              385,
              386,
              387,
              388,
              32,
              335,
              33,
              34,
              35,
              36,
              37,
              38,
              39,
              40,
              41,
              42,
              43,
              44,
              45,
              46,
              47,
              48,
              49,
              50,
              51,
              52,
              53,
              54,
              55,
              56,
              57,
              58,
              61,
              62,
              64,
              65,
              66,
              68,
              69,
              70,
              71,
              72,
              74,
              75,
              76,
              78,
              79,
              80,
              81,
              83,
              84,
              85,
              87,
              88,
              91,
              95,
              99,
              100,
              101,
              130,
              105,
              109,
              110,
              139,
              114,
              118,
              331,
              332,
              333,
              334,
              335,
              336,
              337,
              338,
              339,
              340,
              341,
              342,
              343,
              344,
              345,
              346,
              347,
              348,
              349,
              350,
              351,
              352,
              353,
              354,
              355,
              356,
              357,
              358,
              301,
              302,
              303,
              304,
              271,
              272,
              273,
              241,
              242,
              211,
              306,
              307,
              308,
              309,
              310,
              311,
              312,
              313,
              314,
              277,
              278,
              279,
              280,
              281,
              282,
              283,
              248,
              249,
              250,
              251,
              252,
              219,
              220,
              221,
              316,
              317,
              318,
              319,
              320,
              321,
              322,
              323,
              287,
              288,
              289,
              290,
              291,
              292,
              258,
              259,
              260,
              261,
              229,
              230,
              199,
              325,
              326,
              327,
              328,
              296,
              297,
              298,
              267,
              268,
              238,
            ];
          }
          if (round == 2) {
            _start = 15;
            startGame();

            direction = null;
            barriers = [
              1,
              2,
              3,
              4,
              5,
              6,
              7,
              8,
              9,
              10,
              11,
              12,
              13,
              14,
              15,
              16,
              17,
              18,
              19,
              20,
              21,
              22,
              23,
              24,
              25,
              26,
              27,
              28,
              29,
              30,
              60,
              90,
              120,
              150,
              180,
              210,
              240,
              270,
              300,
              330,
              360,
              390,
              391,
              392,
              393,
              394,
              395,
              396,
              397,
              398,
              399,
              400,
              401,
              402,
              403,
              404,
              405,
              406,
              407,
              408,
              409,
              410,
              411,
              412,
              413,
              414,
              415,
              416,
              417,
              418,
              419,
              29,
              59,
              89,
              119,
              149,
              179,
              209,
              239,
              269,
              299,
              329,
              359,
              389,
            ];
            barriersTwo = [
              100,
              101,
              102,
              71,
              131,
              106,
              107,
              108,
              77,
              137,
              216,
              187,
              158,
              218,
              249,
              280,
              311,
              312,
              313,
              314,
              315,
              316,
              317,
              318,
              289,
              260,
              231,
              171,
              202,
              233,
            ];
          }
          if (round == 3) {
            _start = 15;
            startGame();
            direction = null;
            barriers = [];
            barriersTwo = [];
            barrriersThree = [
              0,
              360,
              389,
              1,
              2,
              3,
              4,
              5,
              6,
              7,
              8,
              9,
              10,
              11,
              12,
              13,
              14,
              15,
              16,
              17,
              18,
              19,
              20,
              21,
              22,
              23,
              24,
              25,
              26,
              27,
              28,
              29,
              30,
              60,
              90,
              120,
              150,
              180,
              210,
              240,
              270,
              300,
              330,
              390,
              391,
              392,
              393,
              394,
              395,
              396,
              397,
              398,
              399,
              400,
              401,
              402,
              403,
              404,
              405,
              406,
              407,
              408,
              409,
              410,
              411,
              412,
              413,
              414,
              415,
              416,
              417,
              418,
              419,
              59,
              89,
              119,
              149,
              179,
              209,
              239,
              269,
              299,
              329,
              359,
              122,
              123,
              124,
              125,
              126,
              127,
              128,
              66,
              96,
              156,
              186,
              216,
              246,
              247,
              248,
              242,
              243,
              244,
              184,
              214,
              182,
              183,
              152,
              77,
              107,
              137,
              167,
              197,
              227,
              257,
              168,
              198,
              110,
              229,
              260,
              139,
            ];
            barriersFour = [
              129,
              159,
              189,
              219,
              249,
              130,
              131,
              145,
              175,
              205,
              235,
              265,
              146,
              147,
            ];
            barriersFive = [
              132,
              163,
              194,
              224,
              254,
              165,
              136,
            ];
            barriersSix = [
              141,
              171,
              201,
              231,
              262,
              263,
              264,
              172,
              173,
              174,
              144,
              112,
              113,
            ];
          }
        });
      } else {
        setState(() {
          _start--;
        });
      }
    });

    Timer.periodic(Duration(milliseconds: 500), (timer) {
      if (food.contains(player)) {
        score++;
        food.remove(player);
        foodGone.add(player);
      }

      switch (direction) {
        case "left":
          moveLeft();
          break;
        case "right":
          moveRight();
          break;
        case "up":
          moveUp();
          break;
        case "down":
          moveDown();
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Expanded(
            flex: 10,
            child: GestureDetector(
              onVerticalDragUpdate: (details) {
                if (details.delta.dy > 0) {
                  direction = "down";
                } else if (details.delta.dy < 0) {
                  direction = "up";
                }
              },
              onHorizontalDragUpdate: (details) {
                if (details.delta.dx > 0) {
                  direction = "right";
                } else if (details.delta.dx < 0) {
                  direction = "left";
                }
              },
              child: Container(
                  child: GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: numberOfSquares,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: numberInRow),
                itemBuilder: (BuildContext context, int index) {
                  if (player == index) {
                    switch (direction) {
                      case "left":
                        return Transform.rotate(angle: pi, child: myPlayer());

                      default:
                        return myPlayer();
                    }
                  } else if (barriers.contains(index)) {
                    return pixel(
                      innerColor: Colors.blue[800],
                      outerColor: Colors.blue[900],
                      child: Text(index.toString()),
                    );
                  } else if (!barriers.contains(index) &&
                      foodGone.contains(index)) {
                    return myPath(
                      innerColor: Colors.black,
                      outerColor: Colors.black,
                    );
                  } else if (!barriersTwo.contains(index) &&
                      foodGone.contains(index)) {
                    return myPath(
                      innerColor: Colors.black,
                      outerColor: Colors.black,
                    );
                  } else if (barriersTwo.contains(index)) {
                    return pixel(
                      innerColor: Colors.orange,
                      outerColor: Colors.orange,
                    );
                  } else if (barrriersThree.contains(index)) {
                    return pixel(
                      innerColor: Colors.blue,
                      outerColor: Colors.blue,
                    );
                  } else if (!barrriersThree.contains(index) &&
                      foodGone.contains(index)) {
                    return myPath(
                      innerColor: Colors.black,
                      outerColor: Colors.black,
                    );
                  } else if (barriersFour.contains(index)) {
                    return pixel(
                      innerColor: Colors.red,
                      outerColor: Colors.red,
                    );
                  } else if (!barriersFour.contains(index) &&
                      foodGone.contains(index)) {
                    return myPath(
                      innerColor: Colors.black,
                      outerColor: Colors.black,
                    );
                  } else if (barriersFive.contains(index)) {
                    return pixel(
                      innerColor: Colors.yellow,
                      outerColor: Colors.yellow,
                    );
                  } else if (!barriersFive.contains(index) &&
                      foodGone.contains(index)) {
                    return myPath(
                      innerColor: Colors.black,
                      outerColor: Colors.black,
                    );
                  } else if (barriersSix.contains(index)) {
                    return pixel(
                      innerColor: Colors.green,
                      outerColor: Colors.green,
                    );
                  } else if (!barriersSix.contains(index) &&
                      foodGone.contains(index)) {
                    return myPath(
                      innerColor: Colors.black,
                      outerColor: Colors.black,
                    );
                  } else {
                    return myPath(
                      innerColor: Colors.yellow,
                      outerColor: Colors.black,
                      child: Text(index.toString()),
                    );
                  }
                },
              )),
            ),
          ),
          Expanded(
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Timer:" + _start.toString(),
                    style: TextStyle(color: Colors.white, fontSize: 40),
                  ),
                  Text(
                    "Score:" + score.toString(),
                    style: TextStyle(color: Colors.white, fontSize: 40),
                  ),
                  GestureDetector(
                    onTap: startGame,
                    child: Text("P L A Y ",
                        style: TextStyle(color: Colors.white, fontSize: 40)),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
