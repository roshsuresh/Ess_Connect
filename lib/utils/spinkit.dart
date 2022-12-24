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
    Colors.purple,
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 80,
        height: 80,
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
