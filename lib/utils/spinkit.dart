import 'package:essconnect/utils/constants.dart';
import 'package:flutter/material.dart';

import 'package:loading_indicator/loading_indicator.dart';

class spinkitLoader extends StatelessWidget {
  spinkitLoader({Key? key}) : super(key: key);
  final List<Color> _kDefaultRainbowColors = [
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.green,
    Colors.blue,
    Colors.indigo,
    Color.fromARGB(255, 0, 207, 235),
  ];
  final List<Color> _kDefaultColors = [
    UIGuide.light_Purple,
    Color.fromARGB(255, 13, 72, 128),
    Color.fromARGB(255, 43, 101, 156),
    Color.fromARGB(255, 67, 119, 168),
    Color.fromARGB(255, 97, 156, 211),
    Color.fromARGB(255, 159, 201, 240),
    Color.fromARGB(255, 181, 206, 231),
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 68,
        height: 68,
        child: LoadingIndicator(
          colors: _kDefaultRainbowColors,
          strokeWidth: 2.0,
          indicatorType: Indicator.ballRotateChase,
        ),
      ),
      //     SpinKitCircle(
      //   color: UIGuide.light_Purple,
      //   size: 50,
      // )
    );
  }
}
