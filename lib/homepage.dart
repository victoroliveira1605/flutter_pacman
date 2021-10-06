import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pacman/path.dart';
import 'package:pacman/pixel.dart';
import 'package:pacman/player.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static int numberInRow = 11;
  int numberOfSquares = numberInRow * 17;
  int player = numberInRow * 15 + 1;

  List<int> barriers = [
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
    22,
    24,
    26,
    28,
    30,
    33,
    35,
    37,
    38,
    39,
    41,
    44,
    46,
    52,
    55,
    57,
    63,
    66,
    77,
    78,
    79,
    80,
    81,
    70,
    59,
    61,
    72,
    83,
    84,
    85,
    86,
    99,
    110,
    121,
    132,
    143,
    154,
    165,
    176,
    177,
    178,
    179,
    180,
    181,
    182,
    183,
    184,
    185,
    186,
    175,
    164,
    153,
    142,
    131,
    120,
    109,
    87,
    76,
    65,
    54,
    43,
    32,
    21,
    100,
    101,
    102,
    103,
    114,
    125,
    123,
    134,
    145,
    156,
    158,
    147,
    148,
    149,
    160,
    129,
    140,
    151,
    162,
    127,
    116,
    105,
    106,
    107,
    108,
  ];

  String direction = "right";

  void startGame() {
    Timer.periodic(Duration(milliseconds: 150), (timer) {
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
        default:
      }
    });
  }

  void moveLeft() {
    if (!barriers.contains(player - 1)) {
      setState(() {
        player--;
      });
    }
  }

  void moveRight() {
    if (!barriers.contains(player + 1)) {
      setState(() {
        player++;
      });
    }
  }

  void moveUp() {
    if (!barriers.contains(player - numberInRow)) {
      setState(() {
        player -= numberInRow;
      });
    }
  }

  void moveDown() {
    if (!barriers.contains(player + numberInRow)) {
      setState(() {
        player += numberInRow;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Expanded(
              flex: 9,
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
                    itemBuilder: (context, index) {
                      if (player == index) {
                        switch (direction) {
                          case "left":
                            return Transform.rotate(
                                angle: pi, child: MyPlayer());
                          case "right":
                            return MyPlayer();
                          case "up":
                            return Transform.rotate(
                                angle: 3 + pi / 2, child: MyPlayer());
                          case "down":
                            return Transform.rotate(
                                angle: pi / 2, child: MyPlayer());

                          default:
                            return MyPlayer();
                        }
                      } else if (barriers.contains(index)) {
                        return MyPixel(
                          innerColor: Colors.blue[800],
                          outerColor: Colors.blue[900],
                        );
                      } else {
                        return MyPath(
                          innerColor: Colors.yellow,
                          outerColor: Colors.black,
                        );
                      }
                    },
                  ),
                ),
              )),
          Expanded(
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Score",
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                  GestureDetector(
                    onTap: startGame,
                    child: Text(
                      "P L A Y",
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
