import 'package:essconnect/Application/AdminProviders/SchoolPhotoProviders.dart';
import 'package:essconnect/Application/AdminProviders/StudstattiticsProvider.dart';
import 'package:essconnect/Constants.dart';
import 'package:essconnect/Domain/Staff/StudentReport_staff.dart';
import 'package:essconnect/utils/constants.dart';
import 'package:essconnect/utils/spinkit.dart';
import 'package:flutter/material.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:provider/provider.dart';

class Student_statistics_admin extends StatelessWidget {
  Student_statistics_admin({Key? key}) : super(key: key);
  String course = '';
  String section = '';
  List subjectData = [];
  List diviData = [];
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await Provider.of<StudStatiticsProvider>(context, listen: false)
          .clearStaticsList();
      await Provider.of<StudStatiticsProvider>(context, listen: false)
          .clearTotalList();
      var p = Provider.of<SchoolPhotoProviders>(context, listen: false);
      p.stdReportSectionStaff();
      p.courseDrop.clear();
      p.dropDown.clear();
      p.stdReportInitialValues.clear();
      p.courselist.clear();
      p.courseCounter(0);
      p.sectionCounter(0);
    });
    var size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              const Spacer(),
              const Text(
                'Student Statistics',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              const Spacer(),
              IconButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Student_statistics_admin()));
                  },
                  icon: const Icon(Icons.refresh_outlined)),
              kWidth
            ],
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
          physics: const BouncingScrollPhysics(),
          children: [
            Row(
              children: [
                Consumer<SchoolPhotoProviders>(
                  builder: (context, value, child) => Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SizedBox(
                      width: size.width * .42,
                      height: 50,
                      child: MultiSelectDialogField(
                        items: value.dropDown,
                        listType: MultiSelectListType.CHIP,
                        title: const Text(
                          "Select Section",
                          style: TextStyle(color: Colors.grey),
                        ),
                        selectedItemsTextStyle: const TextStyle(
                            fontWeight: FontWeight.w900,
                            color: UIGuide.light_Purple),
                        confirmText: const Text(
                          'OK',
                          style: TextStyle(color: UIGuide.light_Purple),
                        ),
                        cancelText: const Text(
                          'Cancel',
                          style: TextStyle(color: UIGuide.light_Purple),
                        ),
                        separateSelectedItems: true,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          border: Border.all(
                            color: Colors.grey,
                            width: 2,
                          ),
                        ),
                        buttonIcon: const Icon(
                          Icons.arrow_drop_down_outlined,
                          color: Colors.grey,
                        ),
                        buttonText: value.sectionLen == 0
                            ? const Text(
                                "Select Section",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                ),
                              )
                            : Text(
                                "   ${value.sectionLen.toString()} Selected",
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                ),
                              ),
                        chipDisplay: MultiSelectChipDisplay.none(),
                        onConfirm: (results) async {
                          subjectData = [];
                          diviData.clear();
                          value.courseLen = 0;
                          value.divisionLen = 0;
                          await Provider.of<SchoolPhotoProviders>(context,
                                  listen: false)
                              .clearCourse();
                          await Provider.of<StudStatiticsProvider>(context,
                                  listen: false)
                              .clearAllList();

                          for (var i = 0; i < results.length; i++) {
                            StudReportSectionList data =
                                results[i] as StudReportSectionList;
                            print(data.text);
                            print(data.value);
                            subjectData.add(data.value);
                            subjectData.map((e) => data.value);
                            print("${subjectData.map((e) => data.value)}");
                          }
                          section = subjectData.join(',');
                          // await Provider.of<SchoolPhotoProviders>(context,
                          //         listen: false)
                          //     .courseDropClear();
                          diviData.clear();
                          // await Provider.of<SchoolPhotoProviders>(context,
                          //         listen: false)
                          //     .courseListClear();
                          await Provider.of<SchoolPhotoProviders>(context,
                                  listen: false)
                              .sectionCounter(results.length);
                          await Provider.of<SchoolPhotoProviders>(context,
                                  listen: false)
                              .getCourseList(section);

                          print("data $subjectData");

                          print(subjectData.join(','));
                        },
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                Consumer<SchoolPhotoProviders>(
                  builder: (context, value, child) => Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SizedBox(
                      width: size.width * .42,
                      height: 50,
                      child: MultiSelectDialogField(
                        // height: 200,
                        items: value.courseDrop,
                        listType: MultiSelectListType.CHIP,
                        title: const Text(
                          "Select Course",
                          style: TextStyle(color: Colors.black),
                        ),

                        selectedItemsTextStyle: const TextStyle(
                            fontWeight: FontWeight.w900,
                            color: UIGuide.light_Purple),
                        confirmText: const Text(
                          'OK',
                          style: TextStyle(color: UIGuide.light_Purple),
                        ),
                        cancelText: const Text(
                          'Cancel',
                          style: TextStyle(color: UIGuide.light_Purple),
                        ),
                        separateSelectedItems: true,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          border: Border.all(
                            color: Colors.grey,
                            width: 2,
                          ),
                        ),
                        buttonIcon: const Icon(
                          Icons.arrow_drop_down_outlined,
                          color: Colors.grey,
                        ),
                        buttonText: value.courseLen == 0
                            ? const Text(
                                "Select Course",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                ),
                              )
                            : Text(
                                "   ${value.courseLen.toString()} Selected",
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                ),
                              ),
                        chipDisplay: MultiSelectChipDisplay.none(),
                        onConfirm: (results) async {
                          diviData = [];
                          await Provider.of<StudStatiticsProvider>(context,
                                  listen: false)
                              .clearAllList();
                          for (var i = 0; i < results.length; i++) {
                            StudReportCourse data =
                                results[i] as StudReportCourse;
                            print(data.value);
                            print(data.text);
                            diviData.add(data.value);
                            diviData.map((e) => data.value);
                            print("${diviData.map((e) => data.value)}");
                          }
                          course = diviData.join(',');
                          await Provider.of<SchoolPhotoProviders>(context,
                                  listen: false)
                              .courseCounter(results.length);
                          results.clear();
                          await Provider.of<SchoolPhotoProviders>(context,
                                  listen: false)
                              .getDivisionList(course);

                          print(diviData.join(','));
                          print(course);
                        },
                      ),
                    ),
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Consumer<StudStatiticsProvider>(
                  builder: (context, value, child) => value.loading
                      ? const SizedBox(
                          height: 40,
                          width: 100,
                          child: Center(
                              child: Text(
                            'Loading...',
                            style: TextStyle(
                                color: UIGuide.light_Purple, fontSize: 16),
                          )))
                      : MaterialButton(
                          height: 40,
                          minWidth: 100, color: UIGuide.light_Purple,
                          // shape: ButtonStyle(shape:RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),),
                          onPressed: () async {
                            Provider.of<StudStatiticsProvider>(context,
                                    listen: false)
                                .statiticsList
                                .clear();
                            Provider.of<StudStatiticsProvider>(context,
                                    listen: false)
                                .totalList
                                .clear();
                            await Provider.of<StudStatiticsProvider>(context,
                                    listen: false)
                                .getstatitics(section, course);
                          },
                          child: const Text(
                            'View',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Table(
                border: TableBorder.all(
                    color: const Color.fromARGB(255, 236, 236, 236)),
                columnWidths: const {
                  0: FlexColumnWidth(1),
                  1: FlexColumnWidth(2),
                  2: FlexColumnWidth(1),
                  3: FlexColumnWidth(1),
                  4: FlexColumnWidth(1),
                },
                children: const [
                  TableRow(
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 228, 224, 224),
                      ),
                      children: [
                        SizedBox(
                          height: 30,
                          child: Center(
                              child: Text(
                            'Sl No.',
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 12),
                          )),
                        ),
                        SizedBox(
                          height: 30,
                          child: Center(
                              child: Text(
                            'Course',
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 12),
                          )),
                        ),
                        SizedBox(
                          height: 30,
                          child: Center(
                            child: Text(
                              'Male',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 12),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                          child: Center(
                              child: Text(
                            'Female',
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 12),
                          )),
                        ),
                        SizedBox(
                          height: 30,
                          child: Center(
                              child: Text(
                            'Total',
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 12),
                          )),
                        ),
                      ]),
                ],
              ),
            ),
            Consumer<StudStatiticsProvider>(builder: (context, value, child) {
              return LimitedBox(
                  maxHeight: size.height - 200,
                  child: value.loading
                      ? spinkitLoader()
                      : ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: value.statiticsList.isEmpty
                              ? 0
                              : value.statiticsList.length,
                          itemBuilder: ((context, index) {
                            return Column(
                              children: [
                                Table(
                                  //border: TableBorder.all(color: Color.fromARGB(255, 245, 245, 245)),
                                  columnWidths: const {
                                    0: FlexColumnWidth(1),
                                    1: FlexColumnWidth(2),
                                    2: FlexColumnWidth(1),
                                    3: FlexColumnWidth(1),
                                    4: FlexColumnWidth(1),
                                  },
                                  children: [
                                    TableRow(
                                        decoration: const BoxDecoration(
                                            //  border: Border.all(color: UIGuide.THEME_LIGHT)
                                            ),
                                        children: [
                                          Text(
                                            (index + 1).toString(),
                                            textAlign: TextAlign.center,
                                            style:
                                                const TextStyle(fontSize: 12),
                                          ),
                                          Text(
                                            value.statiticsList[index].course ??
                                                '--',
                                            textAlign: TextAlign.center,
                                            style:
                                                const TextStyle(fontSize: 12),
                                          ),
                                          Text(
                                            value.statiticsList[index].male ==
                                                    null
                                                ? '--'
                                                : value
                                                    .statiticsList[index].male
                                                    .toString(),
                                            textAlign: TextAlign.center,
                                            style:
                                                const TextStyle(fontSize: 14),
                                          ),
                                          Text(
                                            value.statiticsList[index].feMale ==
                                                    null
                                                ? '--'
                                                : value
                                                    .statiticsList[index].feMale
                                                    .toString(),
                                            textAlign: TextAlign.center,
                                          ),
                                          Text(
                                            value.statiticsList[index]
                                                        .totalCount ==
                                                    null
                                                ? '--'
                                                : value.statiticsList[index]
                                                    .totalCount
                                                    .toString(),
                                            textAlign: TextAlign.center,
                                          )
                                        ]),
                                  ],
                                ),
                                kheight20,
                              ],
                            );
                          })));
            }),
            Consumer<StudStatiticsProvider>(
              builder: (context, value, child) => Padding(
                padding: const EdgeInsets.all(5.0),
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount:
                      value.totalList.isEmpty ? 0 : value.totalList.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Table(
                      columnWidths: const {
                        0: FlexColumnWidth(1),
                        1: FlexColumnWidth(2),
                        2: FlexColumnWidth(1),
                        3: FlexColumnWidth(1),
                        4: FlexColumnWidth(1),
                      },
                      children: [
                        TableRow(
                            decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 255, 255, 255),
                            ),
                            children: [
                              const SizedBox(
                                height: 30,
                                child: Center(
                                    child: Text(
                                  '    ',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12),
                                )),
                              ),
                              const SizedBox(
                                height: 30,
                                child: Center(
                                    child: Text(
                                  '   Total:     ',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w900,
                                      color: UIGuide.light_Purple,
                                      fontSize: 12),
                                )),
                              ),
                              SizedBox(
                                height: 30,
                                child: Center(
                                  child: Text(
                                    value.totalList[index].netMaleCount == null
                                        ? '--'
                                        : value.totalList[index].netMaleCount
                                            .toString(),
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w900,
                                        color: UIGuide.light_Purple,
                                        fontSize: 12),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 30,
                                child: Center(
                                    child: Text(
                                  value.totalList[index].netFemaleCount == null
                                      ? '--'
                                      : value.totalList[index].netFemaleCount
                                          .toString(),
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w900,
                                      color: UIGuide.light_Purple,
                                      fontSize: 12),
                                )),
                              ),
                              SizedBox(
                                height: 30,
                                child: Center(
                                    child: Text(
                                  value.totalList[index].netTotal == null
                                      ? '--'
                                      : value.totalList[index].netTotal
                                          .toString(),
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w900,
                                      color: UIGuide.light_Purple,
                                      fontSize: 12),
                                )),
                              ),
                            ]),
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        ));
  }
}
