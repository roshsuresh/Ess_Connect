import 'package:essconnect/Presentation/Staff/ExamTT.dart/ExamTTList.dart';
import 'package:essconnect/Presentation/Staff/ExamTT.dart/ExamTTUpload.dart';
import 'package:essconnect/utils/constants.dart';
import 'package:flutter/material.dart';

class ExamTimetableStaff extends StatelessWidget {
  const ExamTimetableStaff({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              const Spacer(),
              const Text('Exam Timetable'),
              const Spacer(),
              IconButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ExamTimetableStaff()));
                  },
                  icon: const Icon(Icons.refresh))
            ],
          ),
          titleSpacing: 00.0,
          centerTitle: true,
          toolbarHeight: 45.2,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(25),
                bottomLeft: Radius.circular(25)),
          ),
          bottom: const TabBar(
            indicatorSize: TabBarIndicatorSize.label,
            indicatorColor: Colors.white,
            indicatorWeight: 5,
            tabs: [
              Tab(
                text: "Upload",
              ),
              Tab(text: "History"),
            ],
          ),
          backgroundColor: UIGuide.light_Purple,
        ),
        body: TabBarView(
          children: [ExamTTUploadStaff(), ExamTTHistoryStaff()],
        ),
      ),
    );
  }
}
