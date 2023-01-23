import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Demo extends StatelessWidget {
  Demo({Key? key}) : super(key: key);
  final dropList = [
    'new',
    'hihi',
    '1121',
    '3453y4',
    'neyw',
    'hiyhi',
    '1121',
    '34534',
    'new5',
    'hihyi',
    '11251',
    '345354' 'nedw5',
    'hihsyi',
    '11s251',
    '345s354'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(),
          ],
        ),
      ),
    );
  }
}
