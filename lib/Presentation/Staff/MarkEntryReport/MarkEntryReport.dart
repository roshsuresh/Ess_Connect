import 'package:essconnect/Application/Staff_Providers/MarkReportProvider.dart';
import 'package:essconnect/Presentation/Staff/MarkEntryReport/UASmarkEntry.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../Constants.dart';
import '../../../utils/constants.dart';

class MarkEntryReport extends StatefulWidget {
  MarkEntryReport({Key? key}) : super(key: key);

  @override
  State<MarkEntryReport> createState() => _MarkEntryReportState();
}

class _MarkEntryReportState extends State<MarkEntryReport> {
  String courseId = '';
  String divisionId = '';
  String partId = '';
  String subjectId = '';
  String subText = '';
  String divText = '';
  String examId = '';

  final courseController = TextEditingController();

  final courseController1 = TextEditingController();

  final divisionController = TextEditingController();

  final divisionController1 = TextEditingController();

  final partController = TextEditingController();

  final partController1 = TextEditingController();

  final subjectController = TextEditingController();

  final subjectController1 = TextEditingController();

  final examController = TextEditingController();

  final examController1 = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      var p = Provider.of<MarkEntryReportProvider_stf>(context, listen: false);
      p.markReportcourse();
      p.removeCourseAll();
      p.courseClear();
      p.divisionClear();
      p.removeDivisionAll();
      p.partClear();
      p.removePartAll();
      p.markReportStudList.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Mark Entry Report',
          style: TextStyle(fontSize: 20),
        ),
        titleSpacing: 00.0,
        centerTitle: true,
        toolbarHeight: 60.2,
        toolbarOpacity: 0.8,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(25),
              bottomLeft: Radius.circular(25)),
        ),
        backgroundColor: UIGuide.light_Purple,
      ),
      body: ListView(
        children: [
          Row(
            children: [
              SizedBox(
                height: 50,
                width: MediaQuery.of(context).size.width * 0.49,
                child: Consumer<MarkEntryReportProvider_stf>(
                    builder: (context, snapshot, child) {
                  return InkWell(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return Dialog(
                                child: Container(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  ListView.builder(
                                      shrinkWrap: true,
                                      itemCount:
                                          snapshot.markReportCourseList.length,
                                      itemBuilder: (context, index) {
                                        print(snapshot
                                            .markReportCourseList.length);
                                        return ListTile(
                                          selectedTileColor:
                                              Colors.blue.shade100,
                                          selectedColor: UIGuide.PRIMARY2,
                                          selected: snapshot.isCourseSelected(
                                              snapshot
                                                  .markReportCourseList[index]),
                                          onTap: () async {
                                            print(snapshot
                                                .markReportCourseList.length);
                                            courseController.text = snapshot
                                                    .markReportCourseList[index]
                                                    .id ??
                                                '--';
                                            courseController1.text = snapshot
                                                    .markReportCourseList[index]
                                                    .courseName ??
                                                '--';
                                            courseId = courseController.text
                                                .toString();

                                            snapshot.addSelectedCourse(snapshot
                                                .markReportCourseList[index]);
                                            print(courseId);
                                            // Provider.of<MarkEntryReportProvider_stf>(
                                            await Provider.of<
                                                        MarkEntryReportProvider_stf>(
                                                    context,
                                                    listen: false)
                                                .markReportDivisionList(
                                                    courseId);
                                            await Provider.of<
                                                        MarkEntryReportProvider_stf>(
                                                    context,
                                                    listen: false)
                                                .markReportPart(courseId);
                                            Navigator.of(context).pop();
                                          },
                                          title: Text(
                                            snapshot.markReportCourseList[index]
                                                    .courseName ??
                                                '--',
                                            textAlign: TextAlign.center,
                                          ),
                                        );
                                      }),
                                ],
                              ),
                            ));
                          });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 40,
                            child: TextField(
                              textAlign: TextAlign.center,
                              controller: courseController1,
                              decoration: const InputDecoration(
                                filled: true,
                                fillColor: Color.fromARGB(255, 238, 237, 237),
                                border: OutlineInputBorder(),
                                labelText: "Select Course",
                                hintText: "Course",
                              ),
                              enabled: false,
                            ),
                          ),
                          SizedBox(
                            height: 0,
                            child: TextField(
                              textAlign: TextAlign.center,
                              controller: courseController,
                              enabled: false,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              ),
              const Spacer(),
              SizedBox(
                height: 50,
                width: MediaQuery.of(context).size.width * 0.49,
                child: Consumer<MarkEntryReportProvider_stf>(
                    builder: (context, snapshot, child) {
                  return InkWell(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return Dialog(
                                child: Container(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  ListView.builder(
                                      shrinkWrap: true,
                                      itemCount:
                                          snapshot.markReportDivisions.length,
                                      itemBuilder: (context, index) {
                                        print(snapshot
                                            .markReportDivisions.length);
                                        return ListTile(
                                          selectedTileColor:
                                              Colors.blue.shade100,
                                          selectedColor: UIGuide.PRIMARY2,
                                          selected: snapshot.isDivisionSelected(
                                              snapshot
                                                  .markReportDivisions[index]),
                                          onTap: () async {
                                            print(snapshot
                                                .markReportDivisions.length);
                                            divisionController.text = snapshot
                                                    .markReportDivisions[index]
                                                    .value ??
                                                '--';
                                            divisionController1.text = snapshot
                                                    .markReportDivisions[index]
                                                    .text ??
                                                '--';
                                            courseId = courseController.text
                                                .toString();
                                            divisionId = divisionController.text
                                                .toString();
                                            divText = divisionController1.text
                                                .toString();
                                            snapshot.addSelectedDivision(
                                                snapshot.markReportDivisions[
                                                    index]);
                                            print(courseId);
                                            Provider.of<MarkEntryReportProvider_stf>(
                                                    context,
                                                    listen: false)
                                                .markReportDivisions
                                                .clear();
                                            Navigator.of(context).pop();
                                          },
                                          title: Text(
                                            snapshot.markReportDivisions[index]
                                                    .text ??
                                                '--',
                                            textAlign: TextAlign.center,
                                          ),
                                        );
                                      }),
                                ],
                              ),
                            ));
                          });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 40,
                            child: TextField(
                              textAlign: TextAlign.center,
                              controller: divisionController1,
                              decoration: const InputDecoration(
                                filled: true,
                                fillColor: Color.fromARGB(255, 238, 237, 237),
                                border: OutlineInputBorder(),
                                labelText: "Select Division",
                                hintText: "Division",
                              ),
                              enabled: false,
                            ),
                          ),
                          SizedBox(
                            height: 0,
                            child: TextField(
                              textAlign: TextAlign.center,
                              controller: divisionController,
                              decoration: const InputDecoration(
                                filled: true,
                                fillColor: Color.fromARGB(255, 238, 237, 237),
                                border: OutlineInputBorder(),
                                labelText: "",
                                hintText: "",
                              ),
                              enabled: false,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              ),
            ],
          ),
          Row(
            children: [
              SizedBox(
                height: 50,
                width: MediaQuery.of(context).size.width * 0.49,
                child: Consumer<MarkEntryReportProvider_stf>(
                    builder: (context, snapshot, child) {
                  return InkWell(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return Dialog(
                                child: Container(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  ListView.builder(
                                      shrinkWrap: true,
                                      itemCount:
                                          snapshot.markReportPartList.length,
                                      itemBuilder: (context, index) {
                                        print(
                                            snapshot.markReportPartList.length);
                                        return ListTile(
                                          selectedTileColor:
                                              Colors.blue.shade100,
                                          selectedColor: UIGuide.PRIMARY2,
                                          selected: snapshot.isPartSelected(
                                              snapshot
                                                  .markReportPartList[index]),
                                          onTap: () async {
                                            print(snapshot
                                                .markReportPartList.length);
                                            partController.text = snapshot
                                                    .markReportPartList[index]
                                                    .value ??
                                                '--';
                                            partController1.text = snapshot
                                                    .markReportPartList[index]
                                                    .text ??
                                                '--';
                                            partId =
                                                partController.text.toString();
                                            snapshot.addSelectedPart(snapshot
                                                .markReportPartList[index]);
                                            print(courseId);

                                            Provider.of<MarkEntryReportProvider_stf>(
                                                    context,
                                                    listen: false)
                                                .markReportPartList
                                                .clear();
                                            await Provider.of<
                                                        MarkEntryReportProvider_stf>(
                                                    context,
                                                    listen: false)
                                                .markReportSubject(courseId,
                                                    divisionId, partId);
                                            Navigator.of(context).pop();
                                          },
                                          title: Text(
                                            snapshot.markReportPartList[index]
                                                    .text ??
                                                '--',
                                            textAlign: TextAlign.center,
                                          ),
                                        );
                                      }),
                                ],
                              ),
                            ));
                          });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 40,
                            child: TextField(
                              textAlign: TextAlign.center,
                              controller: partController1,
                              decoration: const InputDecoration(
                                filled: true,
                                fillColor: Color.fromARGB(255, 238, 237, 237),
                                border: OutlineInputBorder(),
                                labelText: "Select Part",
                                hintText: "Part",
                              ),
                              enabled: false,
                            ),
                          ),
                          SizedBox(
                            height: 0,
                            child: TextField(
                              textAlign: TextAlign.center,
                              controller: partController,
                              decoration: const InputDecoration(
                                filled: true,
                                fillColor: Color.fromARGB(255, 238, 237, 237),
                                border: OutlineInputBorder(),
                                labelText: "",
                                hintText: "",
                              ),
                              enabled: false,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              ),
              const Spacer(),
              SizedBox(
                height: 50,
                width: MediaQuery.of(context).size.width * 0.49,
                child: Consumer<MarkEntryReportProvider_stf>(
                    builder: (context, snapshot, child) {
                  return InkWell(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return Dialog(
                                child: Container(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: markReportSub!.length == null
                                          ? 0
                                          : markReportSub!.length,
                                      itemBuilder: (context, index) {
                                        print(markReportSub?.length);

                                        return ListTile(
                                          selectedTileColor:
                                              Colors.blue.shade100,
                                          selectedColor: UIGuide.PRIMARY2,
                                          onTap: () async {
                                            subjectController1.text =
                                                markReportSub![index]['text'] ??
                                                    '';
                                            subjectController.text =
                                                markReportSub![index]
                                                        ['value'] ??
                                                    '';
                                            subjectId = subjectController.text
                                                .toString();
                                            subText = subjectController1.text
                                                .toString();
                                            await Provider.of<
                                                        MarkEntryReportProvider_stf>(
                                                    context,
                                                    listen: false)
                                                .markReportExam(
                                                    courseId,
                                                    divisionId,
                                                    partId,
                                                    subjectId);
                                            Navigator.of(context).pop();
                                          },
                                          title: Text(
                                            markReportSub![index]['text'] ??
                                                '--',
                                            textAlign: TextAlign.center,
                                          ),
                                        );
                                      }),
                                ],
                              ),
                            ));
                          });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 40,
                            child: TextField(
                              textAlign: TextAlign.center,
                              controller: subjectController1,
                              decoration: const InputDecoration(
                                filled: true,
                                fillColor: Color.fromARGB(255, 238, 237, 237),
                                border: OutlineInputBorder(),
                                labelText: "Select Subject",
                                hintText: "Subject",
                              ),
                              enabled: false,
                            ),
                          ),
                          SizedBox(
                            height: 0,
                            child: TextField(
                              textAlign: TextAlign.center,
                              controller: subjectController,
                              decoration: const InputDecoration(
                                filled: true,
                                fillColor: Color.fromARGB(255, 238, 237, 237),
                                border: OutlineInputBorder(),
                                labelText: "",
                                hintText: "",
                              ),
                              enabled: false,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              ),
            ],
          ),
          Row(
            children: [
              SizedBox(
                height: 50,
                width: MediaQuery.of(context).size.width * 0.49,
                child: Consumer<MarkEntryReportProvider_stf>(
                    builder: (context, snapshot, child) {
                  return InkWell(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return Dialog(
                                child: Container(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: markRepoExam!.length == null
                                          ? 0
                                          : markRepoExam!.length,
                                      itemBuilder: (context, index) {
                                        print(markRepoExam?.length);

                                        return ListTile(
                                          selectedTileColor:
                                              Colors.blue.shade100,
                                          selectedColor: UIGuide.PRIMARY2,
                                          onTap: () async {
                                            examController1.text =
                                                markRepoExam![index]['text'] ??
                                                    '';
                                            examController.text =
                                                markRepoExam![index]['value'] ??
                                                    '';
                                            examId =
                                                examController.text.toString();

                                            await Provider.of<
                                                        MarkEntryReportProvider_stf>(
                                                    context,
                                                    listen: false)
                                                .markReportExam(
                                                    courseId,
                                                    divisionId,
                                                    partId,
                                                    subjectId);
                                            Navigator.of(context).pop();
                                          },
                                          title: Text(
                                            markRepoExam![index]['text'] ??
                                                '--',
                                            textAlign: TextAlign.center,
                                          ),
                                        );
                                      }),
                                ],
                              ),
                            ));
                          });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 40,
                            child: TextField(
                              textAlign: TextAlign.center,
                              controller: examController1,
                              decoration: const InputDecoration(
                                filled: true,
                                fillColor: Color.fromARGB(255, 238, 237, 237),
                                border: OutlineInputBorder(),
                                labelText: "Select Exam",
                                hintText: "Exam",
                              ),
                              enabled: false,
                            ),
                          ),
                          SizedBox(
                            height: 0,
                            width: 0,
                            child: TextField(
                              textAlign: TextAlign.center,
                              controller: examController,
                              decoration: const InputDecoration(
                                filled: true,
                                fillColor: Color.fromARGB(255, 238, 237, 237),
                                border: OutlineInputBorder(),
                                labelText: "",
                                hintText: "",
                              ),
                              enabled: false,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              ),
              const Spacer(),
              MaterialButton(
                color: UIGuide.light_Purple,
                onPressed: () async {
                  Provider.of<MarkEntryReportProvider_stf>(context,
                          listen: false)
                      .markReportStudList
                      .clear();

                  await Provider.of<MarkEntryReportProvider_stf>(context,
                          listen: false)
                      .markReportView(courseId, divisionId, partId, examId,
                          subjectId, subText, divText);
                },
                child: const Text(
                  'View',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const Spacer(),
            ],
          ),
          kheight20,
          const UASmarkentryReport()
        ],
      ),
    );
  }
}
