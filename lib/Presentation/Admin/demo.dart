import 'package:essconnect/utils/constants.dart';
import 'package:flutter/material.dart';

class Demo extends StatefulWidget {
  const Demo({Key? key}) : super(key: key);

  @override
  State<Demo> createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        body: ListView(
      children: [
        const SizedBox(
          height: 200,
        ),
        Container(
          color: Colors.deepOrange,
          height: 250,
          width: size.width - 50,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics()),
            child: Column(
              children: [
                Container(
                  width: size.width / 3,
                  height: 100,
                  decoration: BoxDecoration(
                      color: Colors.cyan,
                      border: Border.all(color: UIGuide.light_Purple),
                      borderRadius: BorderRadius.circular(20)),
                  child: const Center(child: Text("")),
                ),
                Container(
                  width: size.width / 3,
                  height: 100,
                  decoration: BoxDecoration(
                      color: Colors.cyan,
                      border: Border.all(color: UIGuide.light_Purple),
                      borderRadius: BorderRadius.circular(20)),
                  child: const Center(child: Text("")),
                )
              ],
            ),
          ),
        )
      ],
    ));
  }
}
