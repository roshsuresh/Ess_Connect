import 'package:essconnect/utils/constants.dart';
import 'package:flutter/material.dart';

class Demo extends StatefulWidget {
  Demo({Key? key}) : super(key: key);

  @override
  State<Demo> createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ExpandTExt(
                title:
                    "texs in 1,067ms (compile: 89 ms, reload: 634 ms, reassemble: 268 ms). t")
          ],
        ),
      ),
    );
  }
}

class ExpandTExt extends StatefulWidget {
  String title;
  ExpandTExt({Key? key, required this.title}) : super(key: key);

  @override
  State<ExpandTExt> createState() => _ExpandTExtState();
}

class _ExpandTExtState extends State<ExpandTExt> {
  bool isExpanded = false;
  late int numLines;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            widget.title,
            style: TextStyle(fontSize: 14),
            maxLines: isExpanded ? 11 : 2,
            softWrap: true,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        const SizedBox(
          height: 4,
        ),
        widget.title.length < 80
            ? SizedBox()
            : InkWell(
                onTap: () {
                  setState(() {
                    isExpanded = !isExpanded;
                  });
                },
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    isExpanded == false ? 'Read more' : 'Read less',
                    style: TextStyle(
                      color: UIGuide.light_Purple,
                      fontSize: 12,
                    ),
                    maxLines: 1,
                  ),
                ),
              ),
      ],
    );
  }
}
