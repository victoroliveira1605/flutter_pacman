import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static int numberInRow = 11;
  int numberOfSquares = numberInRow * 17;

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
    88,
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
    98,
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
    108
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      body: Column(
        children: [
          Expanded(
              flex: 9,
              child: Container(
                child: GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: numberOfSquares,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: numberInRow),
                  itemBuilder: (context, index) {
                    if (barriers.contains(index)) {
                      return Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: Container(
                          color: Colors.blue,
                          child: Center(child: Text(index.toString())),
                        ),
                      );
                    } else {
                      return Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: Container(
                          color: Colors.grey,
                          child: Center(child: Text(index.toString())),
                        ),
                      );
                    }
                  },
                ),
              )),
          Expanded(
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Score",
                    style: TextStyle(color: Colors.white, fontSize: 40),
                  ),
                  Text(
                    "P L A Y",
                    style: TextStyle(color: Colors.white, fontSize: 40),
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
