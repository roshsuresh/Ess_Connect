import 'dart:developer';

import 'package:essconnect/Application/Staff_Providers/Attendencestaff.dart';
import 'package:essconnect/utils/spinkit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../Constants.dart';
import '../../utils/constants.dart';

class AttendenceEntry extends StatefulWidget {
  AttendenceEntry({Key? key}) : super(key: key);

  @override
  State<AttendenceEntry> createState() => _AttendenceEntryState();
}

class _AttendenceEntryState extends State<AttendenceEntry> {
  String date = '';
  String? forattd;
  String? aftattd;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      var p = Provider.of<AttendenceStaffProvider>(context, listen: false);
      Provider.of<AttendenceStaffProvider>(context, listen: false)
          .timee
          .toString();
      p.clearAllFilters();
      p.selectedCourse.clear();
      p.courseClear();
      p.divisionClear();
      p.attendenceCourseStaff();
      p.removeDivisionAll();
      p.clearStudentList();
      p.studentsAttendenceView.clear();
    });
  }

  String courseId = '';
  String partId = '';
  String subjectId = '';
  String divisionId = '';
  final markEntryInitialValuesController = TextEditingController();
  final markEntryInitialValuesController1 = TextEditingController();
  final markEntryDivisionListController = TextEditingController();
  final markEntryDivisionListController1 = TextEditingController();
  var dateController1 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    String dateFinal =
        Provider.of<AttendenceStaffProvider>(context, listen: false)
            .timeNew
            .toString();
    print(dateFinal);

    var size = MediaQuery.of(context).size;
    print('object');
    print(DateFormat().format(DateTime.now()));
    Provider.of<AttendenceStaffProvider>(context, listen: false)
        .attendenceCourseStaff();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Attendance Entry',
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
      body: Consumer<AttendenceStaffProvider>(builder: (context, value, child) {
        return ListView(
          physics: const NeverScrollableScrollPhysics(),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MaterialButton(
                    color: Colors.white,
                    child: Text(
                      Provider.of<AttendenceStaffProvider>(context,
                                  listen: false)
                              .timeNew ??
                          'select date',
                      style: const TextStyle(color: UIGuide.light_Purple),
                    ),
                    onPressed: () async {
                      await Provider.of<AttendenceStaffProvider>(context,
                              listen: false)
                          .getDate(context);
                    }),
              ],
            ),
            Row(
              children: [
                SizedBox(
                  height: 50,
                  width: MediaQuery.of(context).size.width * 0.49,
                  child: Consumer<AttendenceStaffProvider>(
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
                                        itemCount: attendecourse!.length,
                                        itemBuilder: (context, index) {
                                          return ListTile(
                                            onTap: () async {
                                              //markEntryDivisionListController.clear();
                                              markEntryDivisionListController1
                                                  .clear();
                                              markEntryInitialValuesController
                                                      .text =
                                                  await attendecourse![index]
                                                          ['value'] ??
                                                      '--';
                                              markEntryInitialValuesController1
                                                      .text =
                                                  await attendecourse![index]
                                                          ['text'] ??
                                                      '--';
                                              courseId =
                                                  markEntryInitialValuesController
                                                      .text
                                                      .toString();

                                              print(courseId);
                                              await Provider.of<
                                                          AttendenceStaffProvider>(
                                                      context,
                                                      listen: false)
                                                  .divisionClear();
                                              await Provider.of<
                                                          AttendenceStaffProvider>(
                                                      context,
                                                      listen: false)
                                                  .getAttendenceDivisionValues(
                                                      courseId);
                                              Navigator.of(context).pop();
                                            },
                                            title: Text(
                                              attendecourse![index]['text'] ??
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
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: UIGuide.light_Purple, width: 1),
                              ),
                              height: 40,
                              child: TextField(
                                textAlign: TextAlign.center,
                                controller: markEntryInitialValuesController1,
                                decoration: const InputDecoration(
                                  contentPadding:
                                      EdgeInsets.only(left: 0, top: 0),
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.never,
                                  filled: true,
                                  fillColor: Color.fromARGB(255, 238, 237, 237),
                                  border: OutlineInputBorder(),
                                  labelText: "  Select Course",
                                  hintText: "Course",
                                ),
                                enabled: false,
                              ),
                            ),
                            SizedBox(
                              height: 0,
                              child: TextField(
                                textAlign: TextAlign.center,
                                controller: markEntryInitialValuesController,
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
                  child: Consumer<AttendenceStaffProvider>(
                      builder: (context, snapshot, child) {
                    return InkWell(
                      onTap: () async {
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
                                        itemCount: snapshot
                                            .attendenceDivisionList.length,
                                        itemBuilder: (context, index) {
                                          return ListTile(
                                            onTap: () async {
                                              markEntryDivisionListController
                                                  .text = snapshot
                                                      .attendenceDivisionList[
                                                          index]
                                                      .value ??
                                                  '---';
                                              markEntryDivisionListController1
                                                  .text = snapshot
                                                      .attendenceDivisionList[
                                                          index]
                                                      .text ??
                                                  '---';
                                              divisionId =
                                                  markEntryDivisionListController
                                                      .text
                                                      .toString();
                                              courseId =
                                                  markEntryInitialValuesController
                                                      .text
                                                      .toString();

                                              Navigator.of(context).pop();
                                            },
                                            title: Text(
                                              snapshot
                                                      .attendenceDivisionList[
                                                          index]
                                                      .text ??
                                                  '---',
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
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: UIGuide.light_Purple, width: 1),
                              ),
                              height: 40,
                              child: TextField(
                                textAlign: TextAlign.center,
                                controller: markEntryDivisionListController1,
                                decoration: const InputDecoration(
                                  contentPadding:
                                      EdgeInsets.only(left: 0, top: 0),
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.never,
                                  filled: true,
                                  fillColor: Color.fromARGB(255, 238, 237, 237),
                                  border: OutlineInputBorder(),
                                  labelText: "  Select Division",
                                  hintText: "Division",
                                ),
                                enabled: false,
                              ),
                            ),
                            SizedBox(
                              height: 0,
                              child: TextField(
                                controller: markEntryDivisionListController,
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 150,
                  child: MaterialButton(
                      color: UIGuide.light_Purple,
                      child: const Text(
                        'View',
                        style: TextStyle(
                            color: UIGuide.WHITE, fontWeight: FontWeight.bold),
                      ),
                      onPressed: () async {
                        print(dateFinal);
                        dateFinal = Provider.of<AttendenceStaffProvider>(
                                    context,
                                    listen: false)
                                .timeNew ??
                            date.toString();
                        if (dateFinal.isEmpty) {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            elevation: 10,
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            duration: Duration(seconds: 1),
                            margin: EdgeInsets.only(
                                bottom: 80, left: 30, right: 30),
                            behavior: SnackBarBehavior.floating,
                            content: Text(
                              "Select Date..!",
                              textAlign: TextAlign.center,
                            ),
                          ));
                        } else if (markEntryInitialValuesController
                                .text.isEmpty &&
                            markEntryDivisionListController.text.isEmpty) {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            elevation: 10,
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            duration: Duration(seconds: 1),
                            margin: EdgeInsets.only(
                                bottom: 80, left: 30, right: 30),
                            behavior: SnackBarBehavior.floating,
                            content: Text(
                              "Select mandatory fileds...!",
                              textAlign: TextAlign.center,
                            ),
                          ));
                        } else {
//  setState(() {
                          dateFinal =
                              await Provider.of<AttendenceStaffProvider>(
                                      context,
                                      listen: false)
                                  .timeNew
                                  .toString();
                          // });
                          await Provider.of<AttendenceStaffProvider>(context,
                                  listen: false)
                              .clearStudentList();
                          await Provider.of<AttendenceStaffProvider>(context,
                                  listen: false)
                              .divisionClear();
                          await Provider.of<AttendenceStaffProvider>(context,
                                  listen: false)
                              .removeDivisionAll();
                          await Provider.of<AttendenceStaffProvider>(context,
                                  listen: false)
                              .getstudentsAttendenceView(dateFinal, divisionId);
                        }
                      }),
                ),
              ],
            ),
            kheight10,
            Consumer<AttendenceStaffProvider>(
              builder: (context, val, child) => val.isDualAttendance == false
                  ? Column(
                      children: [
                        Table(
                          columnWidths: const {
                            0: FlexColumnWidth(1),
                            1: FlexColumnWidth(3),
                            2: FlexColumnWidth(1),
                            // 3: FlexColumnWidth(1.5),
                          },
                          children: const [
                            TableRow(
                                decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 228, 224, 224)),
                                children: [
                                  SizedBox(
                                    height: 30,
                                    child: Center(
                                        child: Text(
                                      'Roll No.',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12),
                                    )),
                                  ),
                                  SizedBox(
                                    height: 30,
                                    child: Center(
                                      child: Text(
                                        'Name           ',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 12),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 30,
                                    child: Center(
                                        child: Text(
                                      'Attendance',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12),
                                    )),
                                  ),
                                ]),
                          ],
                        ),
                        Consumer<AttendenceStaffProvider>(
                          builder: (context, value, child) {
                            return value.loading
                                ? spinkitLoader()
                                : LimitedBox(
                                    maxHeight: size.height - 370,
                                    child: Scrollbar(
                                      child: ListView.builder(
                                        physics: const BouncingScrollPhysics(
                                            parent:
                                                AlwaysScrollableScrollPhysics()),
                                        shrinkWrap: true,
                                        itemCount:
                                            value.studentsAttendenceView.length,
                                        itemBuilder: ((context, index) {
                                          return Padding(
                                            padding: const EdgeInsets.all(4.0),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  color:
                                                      value.studentsAttendenceView[0]
                                                                  .studAttId ==
                                                              null
                                                          ? Colors.white
                                                          : UIGuide.light_black),
                                              child: Column(
                                                children: [
                                                  Table(
                                                    columnWidths: const {
                                                      0: FlexColumnWidth(1.0),
                                                      1: FlexColumnWidth(3),
                                                      2: FlexColumnWidth(1),
                                                    },
                                                    children: [
                                                      TableRow(
                                                          decoration:
                                                              const BoxDecoration(),
                                                          children: [
                                                            Center(
                                                              child: Text(
                                                                value.studentsAttendenceView[index].rollNo ==
                                                                        null
                                                                    ? '0'
                                                                    : value
                                                                        .studentsAttendenceView[
                                                                            index]
                                                                        .rollNo
                                                                        .toString(),
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                style:
                                                                    const TextStyle(
                                                                        fontSize:
                                                                            12),
                                                              ),
                                                            ),
                                                            Text(
                                                              value
                                                                      .studentsAttendenceView[
                                                                          index]
                                                                      .name ??
                                                                  '--',
                                                              textAlign:
                                                                  TextAlign
                                                                      .start,
                                                              style:
                                                                  const TextStyle(
                                                                      fontSize:
                                                                          14),
                                                            ),
                                                            GestureDetector(
                                                              onTap: () async {
                                                                setState(() {
                                                                  if (value.studentsAttendenceView[index].forenoon ==
                                                                          'A' &&
                                                                      value.studentsAttendenceView[index]
                                                                              .afternoon ==
                                                                          'A') {
                                                                    value
                                                                        .studentsAttendenceView[
                                                                            index]
                                                                        .afternoon = 'P';
                                                                    value
                                                                        .studentsAttendenceView[
                                                                            index]
                                                                        .forenoon = 'P';
                                                                  } else {
                                                                    value
                                                                        .studentsAttendenceView[
                                                                            index]
                                                                        .afternoon = 'A';
                                                                    value
                                                                        .studentsAttendenceView[
                                                                            index]
                                                                        .forenoon = 'A';
                                                                  }
                                                                  forattd = value
                                                                      .studentsAttendenceView[
                                                                          index]
                                                                      .forenoon;
                                                                  aftattd = value
                                                                      .studentsAttendenceView[
                                                                          index]
                                                                      .afternoon;
                                                                  print(
                                                                      "Forenonnn   $forattd");
                                                                  print(
                                                                      "afternoon   $aftattd");
                                                                });
                                                              },
                                                              child: Container(
                                                                color: Colors
                                                                    .transparent,
                                                                width: 28,
                                                                height: 26,
                                                                child: SizedBox(
                                                                  width: 28,
                                                                  height: 26,
                                                                  child: value.studentsAttendenceView[index].forenoon ==
                                                                              'A' &&
                                                                          value.studentsAttendenceView[index].afternoon ==
                                                                              'A'
                                                                      ? SvgPicture
                                                                          .asset(
                                                                          UIGuide
                                                                              .absent,
                                                                        )
                                                                      : SvgPicture
                                                                          .asset(
                                                                          UIGuide
                                                                              .present,
                                                                        ),
                                                                ),
                                                              ),
                                                            ),
                                                          ]),
                                                    ],
                                                  ),
                                                  // kheight10,
                                                ],
                                              ),
                                            ),
                                          );
                                        }),
                                      ),
                                    ),
                                  );
                          },
                        ),
                      ],
                    )
                  : Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Table(
                            columnWidths: const {
                              0: FlexColumnWidth(1),
                              1: FlexColumnWidth(3),
                              2: FlexColumnWidth(1),
                              3: FlexColumnWidth(1.5),
                            },
                            children: const [
                              TableRow(
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 228, 224, 224),
                                  ),
                                  children: [
                                    SizedBox(
                                      height: 30,
                                      child: Center(
                                          child: Text(
                                        'Roll No.',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 12),
                                      )),
                                    ),
                                    SizedBox(
                                      height: 30,
                                      child: Center(
                                        child: Text(
                                          'Name           ',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 12),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 30,
                                      child: Center(
                                          child: Text(
                                        'Forenoon',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 12),
                                      )),
                                    ),
                                    SizedBox(
                                      height: 30,
                                      child: Center(
                                          child: Text(
                                        'Afternoon',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 12),
                                      )),
                                    ),
                                  ]),
                            ],
                          ),
                        ),
                        Consumer<AttendenceStaffProvider>(
                            builder: (context, value, child) {
                          return value.loading
                              ? spinkitLoader()
                              : LimitedBox(
                                  maxHeight: size.height - 370,
                                  child: Scrollbar(
                                    child: ListView.builder(
                                      physics: const BouncingScrollPhysics(),
                                      shrinkWrap: true,
                                      itemCount:
                                          value.studentsAttendenceView.length,
                                      itemBuilder: ((context, index) {
                                        return Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: Container(
                                            decoration: BoxDecoration(
                                                color:
                                                    value.studentsAttendenceView[0]
                                                                .studAttId ==
                                                            null
                                                        ? Colors.white
                                                        : UIGuide.light_black),
                                            child: Column(
                                              children: [
                                                Table(
                                                  columnWidths: const {
                                                    0: FlexColumnWidth(1.0),
                                                    1: FlexColumnWidth(3),
                                                    2: FlexColumnWidth(1),
                                                    3: FlexColumnWidth(1.5),
                                                  },
                                                  children: [
                                                    TableRow(
                                                      decoration:
                                                          const BoxDecoration(),
                                                      children: [
                                                        Text(
                                                          value
                                                                      .studentsAttendenceView[
                                                                          index]
                                                                      .rollNo ==
                                                                  null
                                                              ? '0'
                                                              : value
                                                                  .studentsAttendenceView[
                                                                      index]
                                                                  .rollNo
                                                                  .toString(),
                                                          textAlign:
                                                              TextAlign.center,
                                                          style:
                                                              const TextStyle(
                                                                  fontSize: 12),
                                                        ),
                                                        Text(
                                                          value
                                                                  .studentsAttendenceView[
                                                                      index]
                                                                  .name ??
                                                              '--',
                                                          textAlign:
                                                              TextAlign.start,
                                                          style:
                                                              const TextStyle(
                                                                  fontSize: 14),
                                                        ),
                                                        GestureDetector(
                                                          onTap: () {
                                                            setState(() {
                                                              if (value
                                                                      .studentsAttendenceView[
                                                                          index]
                                                                      .forenoon ==
                                                                  'A') {
                                                                value
                                                                    .studentsAttendenceView[
                                                                        index]
                                                                    .forenoon = 'P';
                                                              } else {
                                                                value
                                                                    .studentsAttendenceView[
                                                                        index]
                                                                    .forenoon = 'A';
                                                              }
                                                              forattd = value
                                                                  .studentsAttendenceView[
                                                                      index]
                                                                  .forenoon;

                                                              print(
                                                                  "Forenonnn   $forattd");
                                                            });
                                                          },
                                                          child: Container(
                                                            color: Colors
                                                                .transparent,
                                                            width: 28,
                                                            height: 26,
                                                            child: SizedBox(
                                                              width: 28,
                                                              height: 26,
                                                              child: value
                                                                          .studentsAttendenceView[
                                                                              index]
                                                                          .forenoon ==
                                                                      'A'
                                                                  ? SvgPicture
                                                                      .asset(
                                                                      UIGuide
                                                                          .absent,
                                                                    )
                                                                  : SvgPicture
                                                                      .asset(
                                                                      UIGuide
                                                                          .present,
                                                                    ),
                                                            ),
                                                          ),
                                                        ),
                                                        GestureDetector(
                                                          onTap: () {
                                                            setState(() {
                                                              if (value
                                                                      .studentsAttendenceView[
                                                                          index]
                                                                      .afternoon ==
                                                                  'A') {
                                                                value
                                                                    .studentsAttendenceView[
                                                                        index]
                                                                    .afternoon = 'P';
                                                              } else {
                                                                value
                                                                    .studentsAttendenceView[
                                                                        index]
                                                                    .afternoon = 'A';
                                                              }
                                                              forattd = value
                                                                  .studentsAttendenceView[
                                                                      index]
                                                                  .afternoon;

                                                              print(
                                                                  "Forenonnn   $aftattd");
                                                            });
                                                          },
                                                          child: Container(
                                                            color: Colors
                                                                .transparent,
                                                            width: 10,
                                                            child: SizedBox(
                                                              width: 5,
                                                              height: 22,
                                                              child: value
                                                                          .studentsAttendenceView[
                                                                              index]
                                                                          .afternoon ==
                                                                      'A'
                                                                  ? SvgPicture
                                                                      .asset(
                                                                      UIGuide
                                                                          .absent,
                                                                    )
                                                                  : SvgPicture
                                                                      .asset(
                                                                      UIGuide
                                                                          .present,
                                                                    ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                                kheight20,
                                              ],
                                            ),
                                          ),
                                        );
                                      }),
                                    ),
                                  ),
                                );
                        }),
                      ],
                    ),
            )
          ],
        );
      }),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              kWidth,
              const Spacer(),
              Consumer<AttendenceStaffProvider>(
                  builder: (context, value, child) {
                return MaterialButton(
                  onPressed: () async {
                    List obj = [];
                    obj.clear();
                    print("length:  ${value.studentsAttendenceView.length}");
                    for (int i = 0;
                        i < value.studentsAttendenceView.length;
                        i++) {
                      obj.add({
                        "studAttId": value.studentsAttendenceView[i].studAttId,
                        "divisionId":
                            value.studentsAttendenceView[i].divisionId,
                        "id": value.studentsAttendenceView[i].id,
                        "forenoon": value.studentsAttendenceView[i].forenoon,
                        "afternoon": value.studentsAttendenceView[i].afternoon,
                        "admNo": value.studentsAttendenceView[i].admNo,
                        "rollNo": value.studentsAttendenceView[i].rollNo,
                        "name": value.studentsAttendenceView[i].name,
                        "terminatedStatus":
                            value.studentsAttendenceView[i].terminatedStatus,
                      });
                    }
                    log("Litsssss   $obj");

                    if (markEntryDivisionListController.text.isEmpty &&
                        markEntryInitialValuesController.text.isEmpty &&
                        dateFinal.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        duration: Duration(seconds: 1),
                        margin:
                            EdgeInsets.only(bottom: 80, left: 30, right: 30),
                        behavior: SnackBarBehavior.floating,
                        content: Text(
                          "Select mandatory fileds...!",
                          textAlign: TextAlign.center,
                        ),
                      ));
                    } else {
                      await value.attendanceSave(context, obj, dateFinal);
                    }
                  },
                  color: UIGuide.light_Purple,
                  child: const Text(
                    'Save',
                    style: TextStyle(color: Colors.white),
                  ),
                );
              }),
              kWidth,
              Consumer<AttendenceStaffProvider>(
                  builder: (context, value, child) {
                divisionId = markEntryDivisionListController.text.toString();
                return MaterialButton(
                  onPressed: () {
                    value.studentsAttendenceView[0].studAttId == null
                        ? ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                            elevation: 10,
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                            ),
                            duration: Duration(seconds: 1),
                            margin: EdgeInsets.only(
                                bottom: 80, left: 30, right: 30),
                            behavior: SnackBarBehavior.floating,
                            content: Text(
                              'No data to delete....',
                              textAlign: TextAlign.center,
                            ),
                          ))
                        : showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Center(
                                  child: Text(
                                    "Are You Sure Want To Delete",
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                                actions: <Widget>[
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 8.0),
                                        child: OutlinedButton(
                                          child: Text(
                                            '  Cancel  ',
                                            style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 201, 13, 13),
                                            ),
                                          ),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          style: ButtonStyle(
                                              side: MaterialStateProperty.all(
                                                  BorderSide(
                                                      color:
                                                          UIGuide.light_Purple,
                                                      width: 1.0,
                                                      style:
                                                          BorderStyle.solid))),
                                        ),
                                      ),
                                      OutlinedButton(
                                        child: Text(
                                          'Confirm',
                                          style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 12, 162, 46),
                                          ),
                                        ),
                                        onPressed: () {
                                          value.attendanceDelete(
                                              divisionId, dateFinal, context);
                                          Navigator.of(context).pop();
                                        },
                                        style: ButtonStyle(
                                            side: MaterialStateProperty.all(
                                                BorderSide(
                                                    color: UIGuide.light_Purple,
                                                    width: 1.0,
                                                    style: BorderStyle.solid))),
                                      ),
                                    ],
                                  )
                                ],
                              );
                            },
                          );

                    // value.attendanceDelete(divisionId, dateFinal, context);
                  },
                  color: Colors.red,
                  child: const Text(
                    'Delete',
                    style: TextStyle(color: Colors.white),
                  ),
                );
              })
            ],
          ),
        ),
      ),
    );
  }
}

// class AttendenceviewWidget extends StatefulWidget {
//   AttendenceviewWidget({Key? key}) : super(key: key);
//
//   @override
//   State<AttendenceviewWidget> createState() => _AttendenceviewWidgetState();
// }
//
// class _AttendenceviewWidgetState extends State<AttendenceviewWidget> {
//   String att = '';
//
//   @override
//   Widget build(BuildContext context) {
//     return Consumer<AttendenceStaffProvider>(
//       builder: (context, val, child) => val.loading
//           ? Column(
//               children: [
//                 const SizedBox(
//                   height: 150,
//                 ),
//                 spinkitLoader(),
//               ],
//             )
//           : Column(
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.all(5.0),
//                   child: Table(
//                     columnWidths: const {
//                       0: FlexColumnWidth(1),
//                       1: FlexColumnWidth(3),
//                       2: FlexColumnWidth(1),
//                       // 3: FlexColumnWidth(1.5),
//                     },
//                     children: const [
//                       TableRow(
//                           decoration: BoxDecoration(
//                             color: Color.fromARGB(255, 228, 224, 224),
//                           ),
//                           children: [
//                             SizedBox(
//                               height: 30,
//                               child: Center(
//                                   child: Text(
//                                 'Roll No.',
//                                 style: TextStyle(
//                                     fontWeight: FontWeight.w500, fontSize: 12),
//                               )),
//                             ),
//                             SizedBox(
//                               height: 30,
//                               child: Center(
//                                 child: Text(
//                                   'Name           ',
//                                   style: TextStyle(
//                                       fontWeight: FontWeight.w500,
//                                       fontSize: 12),
//                                 ),
//                               ),
//                             ),
//                             SizedBox(
//                               height: 30,
//                               child: Center(
//                                   child: Text(
//                                 'Attendance',
//                                 style: TextStyle(
//                                     fontWeight: FontWeight.w500, fontSize: 12),
//                               )),
//                             ),
//                           ]),
//                     ],
//                   ),
//                 ),
//                 Consumer<AttendenceStaffProvider>(
//                   builder: (context, value, child) {
//                     return value.loading
//                         ? spinkitLoader()
//                         : LimitedBox(
//                             maxHeight: 530,
//                             child: Scrollbar(
//                               child: ListView.builder(
//                                 physics: const BouncingScrollPhysics(),
//                                 shrinkWrap: true,
//                                 itemCount: value.studentsAttendenceView.length,
//                                 itemBuilder: ((context, index) {
//                                   String att = value
//                                           .studentsAttendenceView[index]
//                                           .absent ??
//                                       '--';
//                                   value.forattt = value
//                                       .studentsAttendenceView[index].forenoon;
//
//                                   return Column(
//                                     children: [
//                                       Table(
//                                         columnWidths: const {
//                                           0: FlexColumnWidth(1.0),
//                                           1: FlexColumnWidth(3),
//                                           2: FlexColumnWidth(1),
//                                         },
//                                         children: [
//                                           TableRow(
//                                               decoration: const BoxDecoration(),
//                                               children: [
//                                                 Text(
//                                                   value
//                                                               .studentsAttendenceView[
//                                                                   index]
//                                                               .rollNo ==
//                                                           null
//                                                       ? '0'
//                                                       : value
//                                                           .studentsAttendenceView[
//                                                               index]
//                                                           .rollNo
//                                                           .toString(),
//                                                   textAlign: TextAlign.center,
//                                                   style: const TextStyle(
//                                                       fontSize: 12),
//                                                 ),
//                                                 Text(
//                                                   value
//                                                           .studentsAttendenceView[
//                                                               index]
//                                                           .name ??
//                                                       '--',
//                                                   textAlign: TextAlign.start,
//                                                   style: const TextStyle(
//                                                       fontSize: 14),
//                                                 ),
//                                                 GestureDetector(
//                                                   onTap: () async {
//                                                     await value.attendView();
//                                                     value.forattt = value
//                                                         .studentsAttendenceView[
//                                                             index]
//                                                         .forenoon;
//                                                     value.aftattt = value.studentsAttendenceView[index].afternoon;
//
//                                                     if (value.aftattt == 'A' || value.forattt == 'A') {
//                                                       value.forattt = 'P';
//                                                       value.aftattt = 'P';
//                                                       print(value.forattt);
//                                                       print(value.aftattt);
//
//                                                     } else if (value.forattt ==
//                                                         'P' || value.aftattt =='P') {
//                                                       value.forattt = "A";
//                                                       value.aftattt ="A";
//                                                       print(
//                                                           "-------fornoon${value.forattt}");
//                                                       print(
//                                                           "-------afternoon${value.aftattt}");
//                                                     }
//                                                     value.selectItem(value
//                                                             .studentsAttendenceView[
//                                                         index]);
//                                                     if (value
//                                                                 .studentsAttendenceView[
//                                                                     index]
//                                                                 .select !=
//                                                             null &&
//                                                         value
//                                                             .studentsAttendenceView[
//                                                                 index]
//                                                             .select!) {
//                                                       att = value
//                                                               .studentsAttendenceView[
//                                                                   index]
//                                                               .absent ??
//                                                           '--';
//                                                       print('Absent');
//                                                       print(att);
//                                                     } else {
//                                                       att = "P";
//                                                       print('Present');
//                                                     }
//                                                   },
//                                                   child: Container(
//                                                     color: Colors.transparent,
//                                                     width: 25,
//                                                     height: 22,
//                                                     child: SizedBox(
//                                                       width: 25,
//                                                       height: 22,
//                                                       child: value
//                                                                       .studentsAttendenceView[
//                                                                           index]
//                                                                       .select !=
//                                                                   null &&
//                                                               value
//                                                                   .studentsAttendenceView[
//                                                                       index]
//                                                                   .select! &&
//                                                               value.forattt == 'P'
//                                                           ? SvgPicture.asset(
//                                                               UIGuide.absent,
//                                                             )
//                                                           : SvgPicture.asset(
//                                                               UIGuide.present,
//                                                             ),
//                                                     ),
//                                                   ),
//                                                 ),
//                                               ]),
//                                         ],
//                                       ),
//                                       kheight20,
//                                     ],
//                                   );
//                                 }),
//                               ),
//                             ),
//                           );
//                   },
//                 ),
//               ],
//             ),
//     );
//   }
// }

