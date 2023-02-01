import 'package:essconnect/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:material_dialogs/material_dialogs.dart';

class NoInternetConnection extends StatelessWidget {
  const NoInternetConnection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      color: UIGuide.WHITE,
      height: size.height,
      width: size.width,
      child: Center(child: LottieBuilder.asset('assets/no internet.json')),
    );
  }
}
