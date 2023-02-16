import 'package:essconnect/utils/spinkit.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import '../../Application/StudentProviders/AttendenceProvider.dart';
import '../../Constants.dart';
import '../../utils/constants.dart';

class Attendence extends StatelessWidget {
  const Attendence({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      Provider.of<AttendenceProvider>(context, listen: false)
          .attendList
          .clear();
      await Provider.of<AttendenceProvider>(context, listen: false)
          .attendenceList();
    });

    var size = MediaQuery.of(context).size;

    return Scaffold(
        appBar: AppBar(
          title: const Text('Attendance'),
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
        body: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Consumer<AttendenceProvider>(
            builder: (context, value, child) => value.loading
                ? spinkitLoader()
                : value.attendList.isEmpty
                    ? Container(
                        child: LottieBuilder.network(
                            'https://assets2.lottiefiles.com/private_files/lf30_lkquf6qz.json'),
                      )
                    : ListView(
                        physics: const BouncingScrollPhysics(),
                        children: [
                          Center(
                            child: Container(
                              width: size.width - 45,
                              padding: const EdgeInsets.all(5.0),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: UIGuide.light_Purple, width: .5),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Consumer<AttendenceProvider>(
                                builder: (_, provider, child) {
                                  return Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Center(
                                        child: Table(
                                          children: [
                                            TableRow(children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text(
                                                  'Working Days : ${provider.workDays == null ? '--' : provider.workDays.toString()}',
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text(
                                                  'Days Present :  ${provider.presentDays == null ? '--' : provider.presentDays.toString()}',
                                                ),
                                              ),
                                            ]),
                                            TableRow(children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text(
                                                  'Days Absent : ${provider.absentDays == null ? '--' : provider.absentDays.toString()}',
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text(
                                                    'Percentage % : ${provider.totPercentage == null ? '--' : provider.totPercentage.toString()}'),
                                              ),
                                            ])
                                          ],
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ),
                          ),
                          kheight10,
                          Table(
                            columnWidths: const {
                              0: FlexColumnWidth(3),
                              1: FlexColumnWidth(2),
                              2: FlexColumnWidth(2),
                              3: FlexColumnWidth(2),
                              4: FlexColumnWidth(2),
                            },
                            border: TableBorder.all(
                                color: const Color.fromARGB(255, 215, 216, 216),
                                width: .2),
                            children: const [
                              TableRow(
                                  decoration: BoxDecoration(
                                      color:
                                          Color.fromARGB(255, 231, 233, 235)),
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: 19.0,
                                          bottom: 4,
                                          left: 4,
                                          right: 4),
                                      child: Text(
                                        'Month',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: 4.0,
                                          bottom: 4,
                                          left: 4,
                                          right: 4),
                                      child: Text(
                                        'No of \n Working \n Days',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: 10.0,
                                          bottom: 4,
                                          left: 4,
                                          right: 4),
                                      child: Text(
                                        'Days \n Present',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: 10.0,
                                          bottom: 4,
                                          left: 4,
                                          right: 4),
                                      child: Text(
                                        'Days \n absent',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    Text(
                                      ' \n %',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700),
                                      textAlign: TextAlign.center,
                                    ),
                                  ])
                            ],
                          ),
                          Consumer<AttendenceProvider>(
                            builder: (_, value, child) => ListView.builder(
                                physics: const BouncingScrollPhysics(),
                                itemCount: value.attendList.isEmpty
                                    ? 0
                                    : value.attendList.length,
                                shrinkWrap: true,
                                itemBuilder: ((context, index) {
                                  return Table(
                                    columnWidths: const {
                                      0: FlexColumnWidth(3),
                                      1: FlexColumnWidth(2),
                                      2: FlexColumnWidth(2),
                                      3: FlexColumnWidth(2),
                                      4: FlexColumnWidth(2),
                                    },
                                    border: TableBorder.all(
                                        color: const Color.fromARGB(
                                            255, 245, 243, 243)),
                                    children: [
                                      TableRow(children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            value.attendList[index].month ??
                                                '--',
                                            style: const TextStyle(
                                                fontWeight: FontWeight.w400),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            value.attendList[index]
                                                        .totalWorkingDays ==
                                                    null
                                                ? '--'
                                                : value.attendList[index]
                                                    .totalWorkingDays
                                                    .toString(),
                                            style: const TextStyle(
                                                fontWeight: FontWeight.w400),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            value.attendList[index]
                                                        .daysPresent ==
                                                    null
                                                ? '--'
                                                : value.attendList[index]
                                                    .daysPresent
                                                    .toString(),
                                            style: const TextStyle(
                                                fontWeight: FontWeight.w400),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            value.attendList[index]
                                                        .daysAbsent ==
                                                    null
                                                ? '--'
                                                : value.attendList[index]
                                                    .daysAbsent
                                                    .toString(),
                                            style: const TextStyle(
                                                fontWeight: FontWeight.w400),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            value.attendList[index].monthres ==
                                                    null
                                                ? '--'
                                                : value
                                                    .attendList[index].monthres
                                                    .toString(),
                                            style: const TextStyle(
                                                fontWeight: FontWeight.w400),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ])
                                    ],
                                  );
                                })),
                          ),
                        ],
                      ),
          ),
        ));
  }
}
