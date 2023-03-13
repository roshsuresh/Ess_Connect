import 'package:essconnect/Application/Staff_Providers/ToolMarkProvider.dart';
import 'package:essconnect/Constants.dart';
import 'package:essconnect/utils/constants.dart';
import 'package:essconnect/utils/spinkit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class ToolMarkEntry extends StatefulWidget {
  const ToolMarkEntry({Key? key}) : super(key: key);

  @override
  State<ToolMarkEntry> createState() => _ToolMarkEntryState();
}

class _ToolMarkEntryState extends State<ToolMarkEntry> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      var p = Provider.of<ToolMarkEntryProviders>(context, listen: false);

      await p.courseClear();
      await p.divisionClear();
      await p.removeAllpartClear();
      await p.removeAllSubjectClear();
      await p.removeAllOptionSubjectListClear();
      await p.removeAllExamClear();
      await p.clearStudList();
      await p.getToolInitialValues();
    });
  }

  List<TextEditingController> _controllers = [];
  @override
  void dispose() {
    for (final controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  String? attendancee;
  String courseId = '';
  String partId = '';
  String subjectId = '';
  String divisionId = '';
  String exam = '';

  final toolInitialValuesController = TextEditingController();
  final toolInitialValuesController1 = TextEditingController();
  final toolDivisionListController = TextEditingController();
  final toolDivisionListController1 = TextEditingController();
  final toolPartListController = TextEditingController();
  final toolPartListController1 = TextEditingController();
  final toolSubjectListController = TextEditingController();
  final toolSubjectListController1 = TextEditingController();
  final toolExamListController = TextEditingController();
  final toolExamListController1 = TextEditingController();
  final toolOptionSubListController = TextEditingController();
  final toolOptionSubListController1 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Tool Mark Entry',
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
      body: Consumer<ToolMarkEntryProviders>(
        builder: (context, value, child) {
          return value.isLocked == true
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    LottieBuilder.network(
                      'https://assets1.lottiefiles.com/packages/lf20_6ZeYZ9ZcjI.json',
                    ),
                    const Center(
                      child: Text(
                        'Mark Entry Locked',
                        style: TextStyle(fontSize: 25),
                      ),
                    ),
                  ],
                )
              : ListView(
                  children: [
                    Row(
                      children: [
                        const Spacer(),
                        SizedBox(
                          height: 50,
                          width: MediaQuery.of(context).size.width * 0.49,
                          child: Consumer<ToolMarkEntryProviders>(
                              builder: (context, snapshot, child) {
                            return InkWell(
                              onTap: () async {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return Dialog(
                                          child: LimitedBox(
                                        maxHeight: size.height - 300,
                                        child: ListView.builder(
                                            shrinkWrap: true,
                                            itemCount: snapshot
                                                .toolInitialValues.length,
                                            itemBuilder: (context, index) {
                                              return ListTile(
                                                onTap: () async {
                                                  toolInitialValuesController
                                                      .text = snapshot
                                                          .toolInitialValues[
                                                              index]
                                                          .id ??
                                                      '--';
                                                  toolInitialValuesController1
                                                      .text = snapshot
                                                          .toolInitialValues[
                                                              index]
                                                          .courseName ??
                                                      '--';
                                                  courseId =
                                                      toolInitialValuesController
                                                          .text
                                                          .toString();

                                                  //div
                                                  toolDivisionListController
                                                      .clear();
                                                  toolDivisionListController1
                                                      .clear();
                                                  await snapshot
                                                      .divisionClear();

                                                  //part

                                                  toolPartListController
                                                      .clear();
                                                  toolPartListController1
                                                      .clear();

                                                  await snapshot
                                                      .removeAllpartClear();

                                                  // sub

                                                  toolSubjectListController
                                                      .clear();
                                                  toolSubjectListController1
                                                      .clear();

                                                  await snapshot
                                                      .removeAllSubjectClear();

                                                  //option sub

                                                  toolOptionSubListController
                                                      .clear();
                                                  toolOptionSubListController1
                                                      .clear();
                                                  await snapshot
                                                      .removeAllOptionSubjectListClear();

                                                  // exam

                                                  toolExamListController
                                                      .clear();
                                                  toolExamListController1
                                                      .clear();
                                                  await snapshot
                                                      .removeAllExamClear();

                                                  await snapshot
                                                      .getToolDivisionValues(
                                                          courseId);
                                                  Navigator.of(context).pop();
                                                },
                                                title: Text(
                                                  snapshot
                                                          .toolInitialValues[
                                                              index]
                                                          .courseName ??
                                                      '--',
                                                  textAlign: TextAlign.center,
                                                ),
                                              );
                                            }),
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
                                            color: UIGuide.light_Purple,
                                            width: 1),
                                      ),
                                      height: 40,
                                      child: TextField(
                                        textAlign: TextAlign.center,
                                        controller:
                                            toolInitialValuesController1,
                                        decoration: const InputDecoration(
                                          filled: true,
                                          contentPadding:
                                              EdgeInsets.only(left: 0, top: 0),
                                          floatingLabelBehavior:
                                              FloatingLabelBehavior.never,
                                          fillColor: Color.fromARGB(
                                              255, 238, 237, 237),
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
                                        controller: toolInitialValuesController,
                                        decoration: const InputDecoration(
                                          filled: true,
                                          fillColor: Color.fromARGB(
                                              255, 238, 237, 237),
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
                          child: Consumer<ToolMarkEntryProviders>(
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
                                                    .toolDivisionList.length,
                                                itemBuilder: (context, index) {
                                                  return ListTile(
                                                    selectedTileColor:
                                                        Colors.blue.shade100,
                                                    selectedColor:
                                                        UIGuide.PRIMARY2,
                                                    onTap: () async {
                                                      // snapshot
                                                      //     .clearStudentMEList();
                                                      toolDivisionListController
                                                          .text = snapshot
                                                              .toolDivisionList[
                                                                  index]
                                                              .value ??
                                                          '---';
                                                      toolDivisionListController1
                                                          .text = snapshot
                                                              .toolDivisionList[
                                                                  index]
                                                              .text ??
                                                          '---';

                                                      divisionId =
                                                          toolDivisionListController
                                                              .text
                                                              .toString();
                                                      courseId =
                                                          toolInitialValuesController
                                                              .text
                                                              .toString();
                                                      //part

                                                      toolPartListController
                                                          .clear();
                                                      toolPartListController1
                                                          .clear();

                                                      await snapshot
                                                          .removeAllpartClear();

                                                      // sub

                                                      toolSubjectListController
                                                          .clear();
                                                      toolSubjectListController1
                                                          .clear();

                                                      await snapshot
                                                          .removeAllSubjectClear();

                                                      //option sub

                                                      toolOptionSubListController
                                                          .clear();
                                                      toolOptionSubListController1
                                                          .clear();
                                                      await snapshot
                                                          .removeAllOptionSubjectListClear();

                                                      // exam

                                                      toolExamListController
                                                          .clear();
                                                      toolExamListController1
                                                          .clear();
                                                      await snapshot
                                                          .removeAllExamClear();

                                                      await snapshot
                                                          .getToolPartValues(
                                                              courseId,
                                                              divisionId);

                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    title: Text(
                                                      snapshot
                                                              .toolDivisionList[
                                                                  index]
                                                              .text ??
                                                          '---',
                                                      textAlign:
                                                          TextAlign.center,
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
                                            color: UIGuide.light_Purple,
                                            width: 1),
                                      ),
                                      height: 40,
                                      child: TextField(
                                        textAlign: TextAlign.center,
                                        controller: toolDivisionListController1,
                                        decoration: const InputDecoration(
                                          filled: true,
                                          contentPadding:
                                              EdgeInsets.only(left: 0, top: 0),
                                          floatingLabelBehavior:
                                              FloatingLabelBehavior.never,
                                          fillColor: Color.fromARGB(
                                              255, 238, 237, 237),
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
                                        controller: toolDivisionListController,
                                        decoration: const InputDecoration(
                                          filled: true,
                                          fillColor: Color.fromARGB(
                                              255, 238, 237, 237),
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
                      ],
                    ),
                    Row(
                      children: [
                        const Spacer(),
                        SizedBox(
                          height: 50,
                          width: MediaQuery.of(context).size.width * 0.49,
                          child: Consumer<ToolMarkEntryProviders>(
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
                                                itemCount: snapshot
                                                    .toolPartList.length,
                                                itemBuilder: (context, index) {
                                                  return ListTile(
                                                    selectedTileColor:
                                                        Colors.blue.shade100,
                                                    selectedColor:
                                                        UIGuide.PRIMARY2,
                                                    onTap: () async {
                                                      toolPartListController
                                                          .text = snapshot
                                                              .toolPartList[
                                                                  index]
                                                              .value ??
                                                          '--';
                                                      toolPartListController1
                                                          .text = snapshot
                                                              .toolPartList[
                                                                  index]
                                                              .text ??
                                                          '--';

                                                      divisionId =
                                                          toolDivisionListController
                                                              .text
                                                              .toString();
                                                      partId =
                                                          toolPartListController
                                                              .text
                                                              .toString();

                                                      toolSubjectListController
                                                          .clear();
                                                      toolSubjectListController1
                                                          .clear();

                                                      await snapshot
                                                          .removeAllSubjectClear();
                                                      //option sub

                                                      toolOptionSubListController
                                                          .clear();
                                                      toolOptionSubListController1
                                                          .clear();
                                                      await snapshot
                                                          .removeAllOptionSubjectListClear();

                                                      // exam

                                                      toolExamListController
                                                          .clear();
                                                      toolExamListController1
                                                          .clear();
                                                      await snapshot
                                                          .removeAllExamClear();

                                                      await snapshot
                                                          .getToolSubjectValues(
                                                              divisionId,
                                                              partId);

                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    title: Text(
                                                      snapshot
                                                              .toolPartList[
                                                                  index]
                                                              .text ??
                                                          '---',
                                                      textAlign:
                                                          TextAlign.center,
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
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: UIGuide.light_Purple,
                                            width: 1),
                                      ),
                                      height: 40,
                                      child: TextField(
                                        textAlign: TextAlign.center,
                                        controller: toolPartListController1,
                                        decoration: const InputDecoration(
                                          filled: true,
                                          contentPadding:
                                              EdgeInsets.only(left: 0, top: 0),
                                          floatingLabelBehavior:
                                              FloatingLabelBehavior.never,
                                          fillColor: Color.fromARGB(
                                              255, 238, 237, 237),
                                          border: OutlineInputBorder(),
                                          labelText: "  Select Part",
                                          hintText: "Part",
                                        ),
                                        enabled: false,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 0,
                                      height: 0,
                                      child: TextField(
                                        controller: toolPartListController,
                                        decoration: const InputDecoration(
                                          filled: true,
                                          fillColor: Color.fromARGB(
                                              255, 238, 237, 237),
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
                          child: Consumer<ToolMarkEntryProviders>(
                              builder: (context, snapshot, child) {
                            return InkWell(
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return Container(
                                        child: Dialog(
                                            child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            ListView.builder(
                                                shrinkWrap: true,
                                                itemCount: snapshot
                                                    .toolSubjectList.length,
                                                itemBuilder: (context, index) {
                                                  return ListTile(
                                                    selectedTileColor:
                                                        Colors.blue.shade100,
                                                    selectedColor:
                                                        UIGuide.PRIMARY2,
                                                    onTap: () async {
                                                      toolSubjectListController
                                                          .text = snapshot
                                                              .toolSubjectList[
                                                                  index]
                                                              .value ??
                                                          '---';
                                                      toolSubjectListController1
                                                          .text = snapshot
                                                              .toolSubjectList[
                                                                  index]
                                                              .text ??
                                                          '---';

                                                      divisionId =
                                                          toolDivisionListController
                                                              .text
                                                              .toString();
                                                      partId =
                                                          toolPartListController
                                                              .text
                                                              .toString();
                                                      subjectId =
                                                          toolSubjectListController
                                                              .text
                                                              .toString();

                                                      //option sub

                                                      toolOptionSubListController
                                                          .clear();
                                                      toolOptionSubListController1
                                                          .clear();
                                                      await snapshot
                                                          .removeAllOptionSubjectListClear();

                                                      // exam

                                                      toolExamListController
                                                          .clear();
                                                      toolExamListController1
                                                          .clear();
                                                      await snapshot
                                                          .removeAllExamClear();

                                                      await snapshot
                                                          .getToolOptionSubject(
                                                              subjectId,
                                                              divisionId);
                                                      await snapshot
                                                          .getToolExamValues(
                                                              subjectId,
                                                              divisionId,
                                                              partId);

                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    title: Text(
                                                      snapshot
                                                          .toolSubjectList[
                                                              index]
                                                          .text
                                                          .toString(),
                                                      textAlign:
                                                          TextAlign.center,
                                                    ),
                                                  );
                                                }),
                                          ],
                                        )),
                                      );
                                    });
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Container(
                                      height: 40,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: UIGuide.light_Purple,
                                            width: 1),
                                      ),
                                      child: TextField(
                                        style: const TextStyle(
                                            fontSize: 14,
                                            overflow: TextOverflow.clip),
                                        textAlign: TextAlign.center,
                                        controller: toolSubjectListController1,
                                        decoration: const InputDecoration(
                                          filled: true,
                                          contentPadding:
                                              EdgeInsets.only(left: 0, top: 0),
                                          floatingLabelBehavior:
                                              FloatingLabelBehavior.never,
                                          fillColor: Color.fromARGB(
                                              255, 238, 237, 237),
                                          border: OutlineInputBorder(),
                                          labelText: "  Select Subject",
                                          hintText: "Subject",
                                        ),
                                        enabled: false,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 0,
                                      child: TextField(
                                        textAlign: TextAlign.center,
                                        controller: toolSubjectListController,
                                        decoration: const InputDecoration(
                                          filled: true,
                                          fillColor: Color.fromARGB(
                                              255, 238, 237, 237),
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
                      ],
                    ),
                    Row(
                      children: [
                        // Spacer(),
                        Consumer<ToolMarkEntryProviders>(
                          builder: (context, snapshot, child) {
                            if (snapshot.toolOptionSubjectList.isEmpty ||
                                snapshot.toolOptionSubjectList == null) {
                              return Container(
                                height: 0,
                                width: 0,
                              );
                            }
                            return SizedBox(
                                height: 50,
                                width:
                                    MediaQuery.of(context).size.width * 0.499,
                                child: InkWell(
                                  onTap: () {
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          return Dialog(
                                              child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              ListView.builder(
                                                  shrinkWrap: true,
                                                  itemCount: snapshot
                                                          .toolOptionSubjectList
                                                          .isEmpty
                                                      ? 0
                                                      : snapshot
                                                          .toolOptionSubjectList
                                                          .length,
                                                  itemBuilder:
                                                      (context, index) {
                                                    return ListTile(
                                                      selectedTileColor:
                                                          Colors.blue.shade100,
                                                      selectedColor:
                                                          UIGuide.PRIMARY2,
                                                      onTap: () {
                                                        toolOptionSubListController
                                                            .text = snapshot
                                                                .toolOptionSubjectList[
                                                                    index]
                                                                .subjectName ??
                                                            '--';
                                                        toolOptionSubListController1
                                                            .text = snapshot
                                                                .toolOptionSubjectList[
                                                                    index]
                                                                .id ??
                                                            '--';

                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                      title: Text(
                                                        snapshot
                                                                .toolOptionSubjectList[
                                                                    index]
                                                                .subjectName ??
                                                            '--',
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                    );
                                                  }),
                                            ],
                                          ));
                                        });
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Container(
                                          height: 40,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                                color: UIGuide.light_Purple,
                                                width: 1),
                                          ),
                                          child: TextField(
                                            style: const TextStyle(
                                                fontSize: 14,
                                                overflow: TextOverflow.clip),
                                            textAlign: TextAlign.center,
                                            controller:
                                                toolOptionSubListController,
                                            decoration: InputDecoration(
                                              filled: true,
                                              contentPadding:
                                                  const EdgeInsets.only(
                                                      left: 0, top: 0),
                                              floatingLabelBehavior:
                                                  FloatingLabelBehavior.never,
                                              fillColor: const Color.fromARGB(
                                                  255, 238, 237, 237),
                                              border:
                                                  const OutlineInputBorder(),
                                              labelText: snapshot
                                                      .toolOptionSubjectList
                                                      .isEmpty
                                                  ? ""
                                                  : snapshot.toolOptionSubjectList[0]
                                                              .subjectDescription ==
                                                          "Sub Subject"
                                                      ? "Select Sub Subject"
                                                      : "Select Option Subject",
                                              hintText: snapshot
                                                      .toolOptionSubjectList
                                                      .isEmpty
                                                  ? ""
                                                  : snapshot.toolOptionSubjectList[0]
                                                              .subjectDescription ==
                                                          "Sub Subject"
                                                      ? "Sub Subject"
                                                      : "Option Subject",
                                            ),
                                            enabled: false,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 0,
                                          child: TextField(
                                            textAlign: TextAlign.center,
                                            controller:
                                                toolOptionSubListController1,
                                            decoration: const InputDecoration(
                                              filled: true,
                                              fillColor: Color.fromARGB(
                                                  255, 238, 237, 237),
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
                                ));
                          },
                        ),
                        const Spacer(),
                        SizedBox(
                          height: 50,
                          width: MediaQuery.of(context).size.width * 0.49,
                          child: Consumer<ToolMarkEntryProviders>(
                              builder: (context, snapshot, child) {
                            return InkWell(
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return Dialog(
                                          child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          ListView.builder(
                                              shrinkWrap: true,
                                              itemCount:
                                                  snapshot.toolExamList.length,
                                              itemBuilder: (context, index) {
                                                return ListTile(
                                                  selectedTileColor:
                                                      Colors.blue.shade100,
                                                  selectedColor:
                                                      UIGuide.PRIMARY2,
                                                  onTap: () {
                                                    toolExamListController
                                                        .text = snapshot
                                                            .toolExamList[index]
                                                            .text ??
                                                        '--';
                                                    toolExamListController1
                                                        .text = snapshot
                                                            .toolExamList[index]
                                                            .value ??
                                                        '--';

                                                    Navigator.of(context).pop();
                                                  },
                                                  title: Text(
                                                    snapshot.toolExamList[index]
                                                            .text ??
                                                        '--',
                                                    textAlign: TextAlign.center,
                                                  ),
                                                );
                                              }),
                                        ],
                                      ));
                                    });
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Container(
                                      height: 40,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: UIGuide.light_Purple,
                                            width: 1),
                                      ),
                                      child: TextField(
                                        style: const TextStyle(
                                            fontSize: 14,
                                            overflow: TextOverflow.clip),
                                        textAlign: TextAlign.center,
                                        controller: toolExamListController,
                                        decoration: const InputDecoration(
                                          filled: true,
                                          contentPadding:
                                              EdgeInsets.only(left: 0, top: 0),
                                          floatingLabelBehavior:
                                              FloatingLabelBehavior.never,
                                          fillColor: Color.fromARGB(
                                              255, 238, 237, 237),
                                          border: OutlineInputBorder(),
                                          labelText: "  Select Exam",
                                          hintText: "Exam",
                                        ),
                                        enabled: false,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 0,
                                      child: TextField(
                                        textAlign: TextAlign.center,
                                        controller: toolExamListController1,
                                        decoration: const InputDecoration(
                                          filled: true,
                                          fillColor: Color.fromARGB(
                                              255, 238, 237, 237),
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
                      ],
                    ),
                    kheight10,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        value.loading
                            ? SizedBox(
                                width: size.width / 2.5,
                                child: MaterialButton(
                                  onPressed: () {},
                                  color: UIGuide.light_Purple,
                                  child: const Text(
                                    'Loading...',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              )
                            : SizedBox(
                                width: size.width / 2.5,
                                child: MaterialButton(
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10.0))),
                                  color: UIGuide.light_Purple,
                                  onPressed: (() async {
                                    var date = await DateFormat('dd/MMM/yyyy')
                                        .format(DateTime.now());
                                    print(DateFormat('dd/MMM/yyyy')
                                        .format(DateTime.now()));
                                    String course = toolInitialValuesController
                                        .text
                                        .toString();
                                    String division = toolDivisionListController
                                        .text
                                        .toString();
                                    String part =
                                        toolPartListController.text.toString();
                                    String subject = toolSubjectListController
                                        .text
                                        .toString();
                                    String exam =
                                        toolExamListController.text.toString();
                                    String optional =
                                        toolOptionSubListController1.text
                                            .toString();
                                    await value.clearStudList();
                                    await value.getMarkEntryView(
                                        course,
                                        date,
                                        division,
                                        exam,
                                        part,
                                        subject,
                                        optional);
                                    print({
                                      course,
                                      date,
                                      division,
                                      exam,
                                      part,
                                      subject,
                                      optional
                                    });
                                  }),
                                  child: const Text(
                                    'View',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                      ],
                    ),
                    kheight20,
                    value.loading
                        ? LimitedBox(
                            maxHeight: size.height / 1.85,
                            child: Container(
                              height: size.height / 1.95,
                              child: spinkitLoader(),
                            ),
                          )
                        : LimitedBox(
                            maxHeight: size.height / 1.85,
                            child: Scrollbar(
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: ListView.builder(
                                    shrinkWrap: true,
                                    physics: const BouncingScrollPhysics(
                                        parent:
                                            AlwaysScrollableScrollPhysics()),
                                    itemCount: value.studentMEList.length,
                                    itemBuilder: ((context, index) {
                                      return Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Container(
                                          width: size.width,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                color: UIGuide.light_Purple,
                                                width: 1,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(5.0),
                                                child: Row(
                                                  children: [
                                                    SizedBox(
                                                      width: 80,
                                                      child: Text(
                                                        'Roll No:  ${value.studentMEList[index].rollNo == null ? '0' : value.studentMEList[index].rollNo.toString()}',
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      ),
                                                    ),
                                                    kWidth,
                                                    kWidth,
                                                    kWidth,
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 10.0),
                                                      child: GestureDetector(
                                                        onTap: () {
                                                          setState(() {
                                                            if (value
                                                                    .studentMEList[
                                                                        index]
                                                                    .attendance ==
                                                                'A') {
                                                              value
                                                                  .studentMEList[
                                                                      index]
                                                                  .attendance = 'P';
                                                            } else {
                                                              value
                                                                  .studentMEList[
                                                                      index]
                                                                  .attendance = 'A';
                                                            }
                                                            attendancee = value
                                                                .studentMEList[
                                                                    index]
                                                                .attendance;

                                                            print(
                                                                "attendace   $attendancee");
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
                                                              child: value.studentMEList[index].attendance ==
                                                                      'A'
                                                                  ? SvgPicture
                                                                      .asset(UIGuide
                                                                          .absent)
                                                                  : SvgPicture
                                                                      .asset(UIGuide
                                                                          .present)),
                                                        ),
                                                      ),
                                                    ),
                                                    kWidth,
                                                    kWidth,
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(4.0),
                                                child: Row(
                                                  children: [
                                                    const Text(
                                                      'Name: ',
                                                      style: TextStyle(),
                                                    ),
                                                    Flexible(
                                                      child: RichText(
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        strutStyle:
                                                            const StrutStyle(
                                                                fontSize: 12.0),
                                                        text: TextSpan(
                                                          style: const TextStyle(
                                                              color: UIGuide
                                                                  .light_Purple),
                                                          text: value
                                                                  .studentMEList[
                                                                      index]
                                                                  .name ??
                                                              '--',
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              ListView.builder(
                                                  physics:
                                                      const NeverScrollableScrollPhysics(),
                                                  shrinkWrap: true,
                                                  itemCount: value
                                                      .studentMEList[index]
                                                      .toolList!
                                                      .length,
                                                  itemBuilder: (context, ind) {
                                                    // final controller =
                                                    //     TextEditingController();
                                                    // List<TextEditingController>
                                                    //     controller = [];
                                                    // for (int i = 0;
                                                    //     i <=
                                                    //         value.studentMEList[index]
                                                    //             .toolList!.length;
                                                    //     i++) {
                                                    _controllers.add(
                                                        TextEditingController());
                                                    _controllers[ind]
                                                            .text
                                                            .isEmpty
                                                        ? _controllers[ind]
                                                            .text = value
                                                                    .studentMEList[
                                                                        index]
                                                                    .toolList![
                                                                        ind]
                                                                    .teMark ==
                                                                null
                                                            ? _controllers[ind]
                                                                .text
                                                            : value
                                                                .studentMEList[
                                                                    index]
                                                                .toolList![ind]
                                                                .teMark
                                                                .toString()
                                                        : _controllers[ind]
                                                            .text;
                                                    //}
                                                    // print(
                                                    //     _controllers[ind].text);

                                                    return Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 5.0),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          SizedBox(
                                                            width: size.width /
                                                                2.2,
                                                            child: Text(
                                                              value
                                                                      .studentMEList[
                                                                          index]
                                                                      .toolList![
                                                                          ind]
                                                                      .toolId ??
                                                                  '',
                                                              maxLines: 2,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                            ),
                                                          ),
                                                          Text(': '),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(5.0),
                                                            child: SizedBox(
                                                              height: 30,
                                                              width: 80,
                                                              child: TextField(
                                                                controller:
                                                                    _controllers[
                                                                        ind],
                                                                focusNode:
                                                                    FocusNode(),
                                                                enabled: value
                                                                            .studentMEList[index]
                                                                            .attendance ==
                                                                        'A'
                                                                    ? false
                                                                    : true,
                                                                cursorColor: UIGuide
                                                                    .light_Purple,
                                                                keyboardType:
                                                                    TextInputType
                                                                        .number,
                                                                inputFormatters: [
                                                                  FilteringTextInputFormatter
                                                                      .allow(RegExp(
                                                                          r"[0-9.]")),
                                                                  TextInputFormatter
                                                                      .withFunction(
                                                                          (oldValue,
                                                                              newValue) {
                                                                    try {
                                                                      final text =
                                                                          newValue
                                                                              .text;
                                                                      if (text
                                                                          .isNotEmpty) {
                                                                        double.parse(
                                                                            text);
                                                                      }
                                                                      return newValue;
                                                                    } catch (e) {}
                                                                    return oldValue;
                                                                  }),
                                                                  LengthLimitingTextInputFormatter(
                                                                      5),
                                                                ],
                                                                decoration:
                                                                    InputDecoration(
                                                                        focusColor: const Color.fromARGB(
                                                                            255,
                                                                            213,
                                                                            215,
                                                                            218),
                                                                        border:
                                                                            OutlineInputBorder(
                                                                          borderRadius:
                                                                              BorderRadius.circular(10.0),
                                                                        ),
                                                                        focusedBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide: const BorderSide(
                                                                              color: UIGuide.light_Purple,
                                                                              width: 1.0),
                                                                          borderRadius:
                                                                              BorderRadius.circular(10.0),
                                                                        ),
                                                                        fillColor:
                                                                            Colors
                                                                                .grey,
                                                                        hintStyle:
                                                                            const TextStyle(
                                                                          color:
                                                                              Colors.grey,
                                                                          fontSize:
                                                                              16,
                                                                          fontFamily:
                                                                              "verdana_regular",
                                                                          fontWeight:
                                                                              FontWeight.w400,
                                                                        ),
                                                                        labelText:
                                                                            // value
                                                                            //         .maxmarkList[
                                                                            //             0]
                                                                            //         .teCaption ??
                                                                            "Mark",
                                                                        labelStyle: const TextStyle(
                                                                            fontSize:
                                                                                13,
                                                                            color: Color.fromARGB(
                                                                                255,
                                                                                106,
                                                                                107,
                                                                                109))),
                                                                onChanged:
                                                                    (value1) {
                                                                  print(
                                                                      _controllers[
                                                                          ind]);
                                                                  // _controllers[index]
                                                                  //         .text =
                                                                  //     value
                                                                  //         .studentMEList[
                                                                  //             index]
                                                                  //         .toolList![
                                                                  //             ind]
                                                                  //         .teMark
                                                                  //         .toString();

                                                                  // teMarkController[
                                                                  //         index]
                                                                  //     .text = value1;
                                                                  // teMarkController[
                                                                  //             index]
                                                                  //         .selection =
                                                                  //     TextSelection.collapsed(
                                                                  //         offset: teMarkController[
                                                                  //                 index]
                                                                  //             .text
                                                                  //             .length);

                                                                  // if (double.parse(
                                                                  //         teMarkController[
                                                                  //                 index]
                                                                  //             .text) >
                                                                  //     value
                                                                  //         .maxmarkList[
                                                                  //             0]
                                                                  //         .teMax!) {
                                                                  //   teMarkController[
                                                                  //           index]
                                                                  //       .clear();
                                                                  // }
                                                                },
                                                              ),
                                                            ),
                                                          ),
                                                          Text(
                                                              '(${value.studentMEList[index].toolList![ind].teMaxMark ?? ''})'),
                                                        ],
                                                      ),
                                                    );
                                                  }),
                                            ],
                                          ),
                                        ),
                                      );
                                    })),
                              ),
                            ))
                  ],
                );
        },
      ),
    );
  }
}
