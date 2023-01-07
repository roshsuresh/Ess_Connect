import 'package:essconnect/Application/AdminProviders/ExamTTPtoviders.dart';
import 'package:essconnect/Application/Staff_Providers/ExamTTProviderStaff.dart';
import 'package:essconnect/Constants.dart';
import 'package:essconnect/utils/constants.dart';
import 'package:essconnect/utils/spinkit.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ExamTTHistoryStaff extends StatelessWidget {
  const ExamTTHistoryStaff({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      var p = Provider.of<ExamTTAdmProvidersStaff>(context, listen: false);
      p.courseList.clear();
      p.clearTTexamList();
      p.getExamTimeTableList();
    });
    var size = MediaQuery.of(context).size;
    return Consumer<ExamTTAdmProvidersStaff>(
      builder: (context, provider, child) {
        return provider.loading
            ? spinkitLoader()
            : ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount:
                    provider.examlist.isEmpty ? 0 : provider.examlist.length,
                itemBuilder: (context, index) {
                  //created date
                  String createddate =
                      provider.examlist[index].createdAt ?? '--';
                  var updatedDate = DateFormat('yyyy-MM-dd').parse(createddate);
                  String newDate = updatedDate.toString();
                  String finalCreatedDate = newDate.replaceRange(10, 23, '');

                  //start date
                  String startdate =
                      provider.examlist[index].examStartDate ?? '--';
                  var updateStartDate =
                      DateFormat('yyyy-MM-dd').parse(startdate);
                  String newstartDate = updateStartDate.toString();
                  String finalStartDate = newstartDate.replaceRange(10, 23, '');

                  return Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Container(
                      width: size.width,
                      height: 140,
                      decoration: BoxDecoration(
                          border:
                              Border.all(color: UIGuide.light_Purple, width: 1),
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Row(
                                children: [
                                  const Text('Created Date: '),
                                  Text(
                                    finalCreatedDate.isEmpty
                                        ? '--'
                                        : finalCreatedDate,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: UIGuide.light_Purple,
                                        fontSize: 13),
                                  ),
                                  const Spacer(),
                                  kWidth,
                                  GestureDetector(
                                    onTap: () async {
                                      String staffid = provider
                                              .examlist[index].createdStaffId ??
                                          '--';

                                      var parsedResponse = await parseJWT();
                                      if (parsedResponse['StaffId'] ==
                                          staffid) {
                                        String event = provider
                                            .examlist[index].id
                                            .toString();
                                        await provider.examTTDelete(
                                            event, context);
                                        await provider.clearTTexamList();
                                        await provider.getExamTimeTableList();
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          const SnackBar(
                                            elevation: 10,
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10)),
                                            ),
                                            duration: Duration(seconds: 1),
                                            margin: EdgeInsets.only(
                                                bottom: 80,
                                                left: 30,
                                                right: 30),
                                            behavior: SnackBarBehavior.floating,
                                            content: Text(
                                              'Sorry, you have no access to delete ',
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        );
                                      }
                                    },
                                    child: Container(
                                      width: 60,
                                      color: Colors.transparent,
                                      child: const Icon(
                                        Icons.delete_forever_outlined,
                                        color: Colors.red,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Row(
                                children: [
                                  const Text('Exam Description: '),
                                  Flexible(
                                    child: Text(
                                      provider.examlist[index].description ??
                                          '--',
                                      overflow: TextOverflow.clip,
                                      maxLines: 1,
                                      style: const TextStyle(
                                          color: UIGuide.light_Purple,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 13),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Row(
                                children: [
                                  const Text('Start Date: '),
                                  Flexible(
                                    child: Text(
                                      finalStartDate.isEmpty
                                          ? '--'
                                          : finalStartDate,
                                      overflow: TextOverflow.clip,
                                      style: const TextStyle(
                                          color: UIGuide.light_Purple,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 13),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Row(
                                children: [
                                  const Text('Course: '),
                                  Flexible(
                                    child: Text(
                                      provider.examlist[index].course ?? '--',
                                      overflow: TextOverflow.clip,
                                      style: const TextStyle(
                                          color: UIGuide.light_Purple,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 13),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Row(
                                children: [
                                  const Text('Division: '),
                                  Flexible(
                                    child: Text(
                                      provider.examlist[index].division ?? '--',
                                      overflow: TextOverflow.clip,
                                      style: const TextStyle(
                                          color: UIGuide.light_Purple,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 13),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Row(
                                children: [
                                  const Text('Created by: '),
                                  Flexible(
                                    child: Text(
                                      provider.examlist[index]
                                              .createStaffName ??
                                          '--',
                                      overflow: TextOverflow.clip,
                                      style: const TextStyle(
                                          color: UIGuide.light_Purple,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 13),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
      },
    );
  }
}
