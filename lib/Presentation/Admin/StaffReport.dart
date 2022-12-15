import 'package:essconnect/Application/AdminProviders/StaffReportProviders.dart';
import 'package:essconnect/Presentation/Admin/SearchStaff.dart';
import 'package:essconnect/Presentation/Admin/StaffInfo.dart';
import 'package:essconnect/utils/spinkit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../Constants.dart';
import '../../utils/constants.dart';

class StaffReport extends StatelessWidget {
  const StaffReport({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Staff Report'),
            titleSpacing: 25.0,
            centerTitle: true,
            toolbarHeight: 40.2,
            toolbarOpacity: 0.8,
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
                  text: "Teaching",
                ),
                Tab(text: "Non-Teaching"),
                Tab(text: 'Both')
              ],
            ),
            backgroundColor: UIGuide.light_Purple,
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SearchStaff()),
                    );
                  },
                  icon: Icon(Icons.search))
            ],
          ),
          body: TabBarView(children: [
            TeachingStaff(),
            NonTeachingStaff(),
            BothStaff(),
          ]),
        ));
  }
}

class TeachingStaff extends StatefulWidget {
  const TeachingStaff({Key? key}) : super(key: key);

  @override
  State<TeachingStaff> createState() => _TeachingStaffState();
}

class _TeachingStaffState extends State<TeachingStaff> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      var p = Provider.of<StaffReportProviders>(context, listen: false);

      p.staffReportt();
      p.clearStudentList();
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return ListView(
      children: [
        LimitedBox(
          maxHeight: size.height - 110,
          child: Consumer<StaffReportProviders>(
            builder: (context, value, child) => value.loading
                ? spinkitLoader()
                : AnimationLimiter(
                    child: ListView.builder(
                      // padding: EdgeInsets.all(size.width / 30),
                      physics: BouncingScrollPhysics(
                          parent: AlwaysScrollableScrollPhysics()),
                      shrinkWrap: true,
                      itemCount: value.staffReportList.length == null
                          ? 0
                          : value.staffReportList.length,
                      itemBuilder: (BuildContext context, int index) {
                        String status =
                            value.staffReportList[index].staffRole == null
                                ? '--'
                                : value.staffReportList[index].staffRole
                                    .toString();
                        if (status.toString() == "Teacher") {
                          return AnimationConfiguration.staggeredList(
                              position: index,
                              delay: Duration(milliseconds: 100),
                              child: SlideAnimation(
                                  duration: Duration(milliseconds: 2500),
                                  curve: Curves.fastLinearToSlowEaseIn,
                                  horizontalOffset: -300,
                                  verticalOffset: -850,
                                  child: Padding(
                                    padding: const EdgeInsets.all(6.0),
                                    child: Container(
                                        width: size.width - 4,
                                        // height: 150,
                                        decoration: const BoxDecoration(
                                            boxShadow: [
                                              BoxShadow(
                                                blurRadius: 2,
                                              )
                                            ],
                                            color: Color.fromARGB(
                                                255, 236, 236, 241),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10))),
                                        child: Column(
                                          children: [
                                            kheight10,
                                            GestureDetector(
                                              onTap: () {
                                                Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        StaffInfo(
                                                      index: index,
                                                    ),
                                                  ),
                                                );
                                              },
                                              child: Container(
                                                width: size.width - 10,
                                                height: 100,
                                                decoration: const BoxDecoration(
                                                    color: Color.fromARGB(
                                                        255, 236, 233, 233),
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                10))),
                                                child: Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    kWidth,
                                                    Center(
                                                      child: Container(
                                                        width: 70,
                                                        height: 70,
                                                        decoration: BoxDecoration(
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    236,
                                                                    233,
                                                                    233),
                                                            image: DecorationImage(
                                                                image: NetworkImage(value.staffReportList[index].staffPhoto == null
                                                                    ? 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRhwaLDKaK49tsHmdMGOrmTdns5qiw080F2Yw&usqp=CAU'
                                                                    : value
                                                                        .staffReportList[
                                                                            index]
                                                                        .staffPhoto
                                                                        .toString())),
                                                            borderRadius:
                                                                const BorderRadius.all(
                                                                    Radius.circular(10))),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Row(
                                                            children: [
                                                              const Text(
                                                                'Name : ',
                                                                style: TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    fontSize:
                                                                        13),
                                                              ),
                                                              RichText(
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                maxLines: 1,
                                                                strutStyle:
                                                                    const StrutStyle(
                                                                        fontSize:
                                                                            8.0),
                                                                text: TextSpan(
                                                                    style: const TextStyle(
                                                                        fontSize:
                                                                            12,
                                                                        color: UIGuide
                                                                            .light_Purple,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w600),
                                                                    text: value
                                                                            .staffReportList[index]
                                                                            .name ??
                                                                        '--'),
                                                              ),
                                                            ],
                                                          ),
                                                          Row(
                                                            children: [
                                                              const Text(
                                                                'Section : ',
                                                                textAlign:
                                                                    TextAlign
                                                                        .start,
                                                                style: TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    fontSize:
                                                                        13),
                                                              ),
                                                              RichText(
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                maxLines: 1,
                                                                strutStyle:
                                                                    const StrutStyle(
                                                                        fontSize:
                                                                            8.0),
                                                                text: TextSpan(
                                                                  style:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        12,
                                                                    color: Colors
                                                                        .black,
                                                                  ),
                                                                  text: value
                                                                          .staffReportList[
                                                                              index]
                                                                          .section ??
                                                                      '--',
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          Row(
                                                            children: [
                                                              Text(
                                                                'Designation : ',
                                                                textAlign:
                                                                    TextAlign
                                                                        .start,
                                                                style: TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    fontSize:
                                                                        13),
                                                              ),
                                                              RichText(
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                maxLines: 1,
                                                                strutStyle:
                                                                    const StrutStyle(
                                                                        fontSize:
                                                                            8.0),
                                                                text: TextSpan(
                                                                  style:
                                                                      const TextStyle(
                                                                    fontSize:
                                                                        12,
                                                                    color: Colors
                                                                        .black,
                                                                  ),
                                                                  text: value
                                                                          .staffReportList[
                                                                              index]
                                                                          .designation ??
                                                                      '--',
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          Row(
                                                            children: [
                                                              const Text(
                                                                'Staff Role : ',
                                                                textAlign:
                                                                    TextAlign
                                                                        .start,
                                                                style: TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    fontSize:
                                                                        13),
                                                              ),
                                                              RichText(
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                maxLines: 1,
                                                                strutStyle:
                                                                    const StrutStyle(
                                                                        fontSize:
                                                                            8.0),
                                                                text: TextSpan(
                                                                  style:
                                                                      const TextStyle(
                                                                    fontSize:
                                                                        12,
                                                                    color: Colors
                                                                        .black,
                                                                  ),
                                                                  text: value
                                                                          .staffReportList[
                                                                              index]
                                                                          .staffRole ??
                                                                      '---',
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          GestureDetector(
                                                            onTap: () {
                                                              _makingPhoneCall(value
                                                                      .staffReportList[
                                                                          index]
                                                                      .mobileNo ??
                                                                  '---');
                                                            },
                                                            child: Row(
                                                              children: [
                                                                const Text(
                                                                  'Phone : ',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .start,
                                                                  style: TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      fontSize:
                                                                          13),
                                                                ),
                                                                RichText(
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                  maxLines: 1,
                                                                  strutStyle:
                                                                      const StrutStyle(
                                                                          fontSize:
                                                                              8.0),
                                                                  text:
                                                                      TextSpan(
                                                                    style:
                                                                        const TextStyle(
                                                                      fontSize:
                                                                          13,
                                                                      color: Colors
                                                                          .black,
                                                                    ),
                                                                    text: value
                                                                            .staffReportList[index]
                                                                            .mobileNo ??
                                                                        '---',
                                                                  ),
                                                                ),
                                                                const Icon(
                                                                  Icons.phone,
                                                                  size: 17,
                                                                )
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        )),
                                  )));
                        } else {
                          return Container(
                            height: 0,
                            width: 0,
                          );
                        }
                      },
                    ),
                  ),

            // ListView.builder(
            //     shrinkWrap: true,
            //     itemCount: value.staffReportList.length,
            //     itemBuilder: (context, index) {
            //       String status = value.staffReportList[index].staffRole ==
            //               null
            //           ? '--'
            //           : value.staffReportList[index].staffRole.toString();
            //       if (status.toString() == "Teacher") {
            //         return Column(
            //           children: [
            //             kheight10,
            //             GestureDetector(
            //               onTap: () {
            //                 Navigator.of(context).push(
            //                   MaterialPageRoute(
            //                     builder: (context) => StaffInfo(
            //                       index: index,
            //                     ),
            //                   ),
            //                 );
            //               },
            //               child: Container(
            //                 width: size.width - 10,
            //                 height: 100,
            //                 decoration: const BoxDecoration(
            //                     color: Color.fromARGB(255, 236, 233, 233),
            //                     borderRadius:
            //                         BorderRadius.all(Radius.circular(10))),
            //                 child: Row(
            //                   crossAxisAlignment: CrossAxisAlignment.start,
            //                   children: [
            //                     kWidth,
            //                     Center(
            //                       child: Container(
            //                         width: 70,
            //                         height: 70,
            //                         decoration: BoxDecoration(
            //                             color: Color.fromARGB(
            //                                 255, 236, 233, 233),
            //                             image: DecorationImage(
            //                                 image: NetworkImage(value
            //                                             .staffReportList[
            //                                                 index]
            //                                             .staffPhoto ==
            //                                         null
            //                                     ? 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRhwaLDKaK49tsHmdMGOrmTdns5qiw080F2Yw&usqp=CAU'
            //                                     : value
            //                                         .staffReportList[index]
            //                                         .staffPhoto
            //                                         .toString())),
            //                             borderRadius:
            //                                 const BorderRadius.all(
            //                                     Radius.circular(10))),
            //                       ),
            //                     ),
            //                     Padding(
            //                       padding: const EdgeInsets.all(8.0),
            //                       child: Column(
            //                         crossAxisAlignment:
            //                             CrossAxisAlignment.start,
            //                         children: [
            //                           Row(
            //                             children: [
            //                               const Text(
            //                                 'Name : ',
            //                                 style: TextStyle(
            //                                     fontWeight: FontWeight.w500,
            //                                     fontSize: 13),
            //                               ),
            //                               RichText(
            //                                 overflow: TextOverflow.ellipsis,
            //                                 maxLines: 1,
            //                                 strutStyle: const StrutStyle(
            //                                     fontSize: 8.0),
            //                                 text: TextSpan(
            //                                     style: const TextStyle(
            //                                         fontSize: 12,
            //                                         color: UIGuide
            //                                             .light_Purple,
            //                                         fontWeight:
            //                                             FontWeight.w600),
            //                                     text: value
            //                                             .staffReportList[
            //                                                 index]
            //                                             .name ??
            //                                         '--'),
            //                               ),
            //                             ],
            //                           ),
            //                           Row(
            //                             children: [
            //                               const Text(
            //                                 'Section : ',
            //                                 textAlign: TextAlign.start,
            //                                 style: TextStyle(
            //                                     fontWeight: FontWeight.w500,
            //                                     fontSize: 13),
            //                               ),
            //                               RichText(
            //                                 overflow: TextOverflow.ellipsis,
            //                                 maxLines: 1,
            //                                 strutStyle: const StrutStyle(
            //                                     fontSize: 8.0),
            //                                 text: TextSpan(
            //                                   style: TextStyle(
            //                                     fontSize: 12,
            //                                     color: Colors.black,
            //                                   ),
            //                                   text: value
            //                                           .staffReportList[
            //                                               index]
            //                                           .section ??
            //                                       '--',
            //                                 ),
            //                               ),
            //                             ],
            //                           ),
            //                           Row(
            //                             children: [
            //                               Text(
            //                                 'Designation : ',
            //                                 textAlign: TextAlign.start,
            //                                 style: TextStyle(
            //                                     fontWeight: FontWeight.w500,
            //                                     fontSize: 13),
            //                               ),
            //                               RichText(
            //                                 overflow: TextOverflow.ellipsis,
            //                                 maxLines: 1,
            //                                 strutStyle: const StrutStyle(
            //                                     fontSize: 8.0),
            //                                 text: TextSpan(
            //                                   style: const TextStyle(
            //                                     fontSize: 12,
            //                                     color: Colors.black,
            //                                   ),
            //                                   text: value
            //                                           .staffReportList[
            //                                               index]
            //                                           .designation ??
            //                                       '--',
            //                                 ),
            //                               ),
            //                             ],
            //                           ),
            //                           Row(
            //                             children: [
            //                               const Text(
            //                                 'Staff Role : ',
            //                                 textAlign: TextAlign.start,
            //                                 style: TextStyle(
            //                                     fontWeight: FontWeight.w500,
            //                                     fontSize: 13),
            //                               ),
            //                               RichText(
            //                                 overflow: TextOverflow.ellipsis,
            //                                 maxLines: 1,
            //                                 strutStyle: const StrutStyle(
            //                                     fontSize: 8.0),
            //                                 text: TextSpan(
            //                                   style: const TextStyle(
            //                                     fontSize: 12,
            //                                     color: Colors.black,
            //                                   ),
            //                                   text: value
            //                                           .staffReportList[
            //                                               index]
            //                                           .staffRole ??
            //                                       '---',
            //                                 ),
            //                               ),
            //                             ],
            //                           ),
            //                           GestureDetector(
            //                             onTap: () {
            //                               _makingPhoneCall(value
            //                                       .staffReportList[index]
            //                                       .mobileNo ??
            //                                   '---');
            //                             },
            //                             child: Row(
            //                               children: [
            //                                 const Text(
            //                                   'Phone : ',
            //                                   textAlign: TextAlign.start,
            //                                   style: TextStyle(
            //                                       fontWeight:
            //                                           FontWeight.w500,
            //                                       fontSize: 13),
            //                                 ),
            //                                 RichText(
            //                                   overflow:
            //                                       TextOverflow.ellipsis,
            //                                   maxLines: 1,
            //                                   strutStyle: const StrutStyle(
            //                                       fontSize: 8.0),
            //                                   text: TextSpan(
            //                                     style: const TextStyle(
            //                                       fontSize: 13,
            //                                       color: Colors.black,
            //                                     ),
            //                                     text: value
            //                                             .staffReportList[
            //                                                 index]
            //                                             .mobileNo ??
            //                                         '---',
            //                                   ),
            //                                 ),
            //                                 const Icon(
            //                                   Icons.phone,
            //                                   size: 17,
            //                                 )
            //                               ],
            //                             ),
            //                           ),
            //                         ],
            //                       ),
            //                     )
            //                   ],
            //                 ),
            //               ),
            //             ),
            //           ],
            //         );
            //       } else {
            //         return Container(
            //           height: 0,
            //           width: 0,
            //         );
            //       }
            //     },
            //   ),
          ),
        ),
      ],
    );
  }

  _makingPhoneCall(String phn) async {
    var url = Uri.parse("tel:$phn");
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

//Non teaching

class NonTeachingStaff extends StatefulWidget {
  const NonTeachingStaff({Key? key}) : super(key: key);

  @override
  State<NonTeachingStaff> createState() => _NonTeachingStaffState();
}

class _NonTeachingStaffState extends State<NonTeachingStaff> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      var p = Provider.of<StaffReportProviders>(context, listen: false);

      p.staffReportt();
      p.clearStudentList();
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return ListView(
      children: [
        LimitedBox(
          maxHeight: size.height - 110,
          child: Consumer<StaffReportProviders>(
            builder: (context, value, child) => value.loading
                ? spinkitLoader()
                : AnimationLimiter(
                    child: ListView.builder(
                      // padding: EdgeInsets.all(size.width / 30),
                      physics: BouncingScrollPhysics(
                          parent: AlwaysScrollableScrollPhysics()),
                      shrinkWrap: true,
                      itemCount: value.staffReportList.length == null
                          ? 0
                          : value.staffReportList.length,
                      itemBuilder: (BuildContext context, int index) {
                        String status =
                            value.staffReportList[index].staffRole == null
                                ? '--'
                                : value.staffReportList[index].staffRole
                                    .toString();
                        if (status.toString() == "NonTeachingStaff") {
                          return AnimationConfiguration.staggeredList(
                              position: index,
                              delay: Duration(milliseconds: 100),
                              child: SlideAnimation(
                                  duration: Duration(milliseconds: 2500),
                                  curve: Curves.fastLinearToSlowEaseIn,
                                  horizontalOffset: -300,
                                  verticalOffset: -850,
                                  child: Padding(
                                    padding: const EdgeInsets.all(6.0),
                                    child: Container(
                                        width: size.width - 4,
                                        // height: 150,
                                        decoration: const BoxDecoration(
                                            boxShadow: [
                                              BoxShadow(
                                                blurRadius: 2,
                                              )
                                            ],
                                            color: Color.fromARGB(
                                                255, 236, 236, 241),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10))),
                                        child: Column(
                                          children: [
                                            kheight10,
                                            GestureDetector(
                                              onTap: () {
                                                Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        StaffInfo(
                                                      index: index,
                                                    ),
                                                  ),
                                                );
                                              },
                                              child: Container(
                                                width: size.width - 10,
                                                height: 100,
                                                decoration: const BoxDecoration(
                                                    color: Color.fromARGB(
                                                        255, 236, 233, 233),
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                10))),
                                                child: Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    kWidth,
                                                    Center(
                                                      child: Container(
                                                        width: 70,
                                                        height: 70,
                                                        decoration: BoxDecoration(
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    236,
                                                                    233,
                                                                    233),
                                                            image: DecorationImage(
                                                                image: NetworkImage(value.staffReportList[index].staffPhoto == null
                                                                    ? 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRhwaLDKaK49tsHmdMGOrmTdns5qiw080F2Yw&usqp=CAU'
                                                                    : value
                                                                        .staffReportList[
                                                                            index]
                                                                        .staffPhoto
                                                                        .toString())),
                                                            borderRadius:
                                                                const BorderRadius.all(
                                                                    Radius.circular(10))),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Row(
                                                            children: [
                                                              const Text(
                                                                'Name : ',
                                                                style: TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    fontSize:
                                                                        13),
                                                              ),
                                                              RichText(
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                maxLines: 1,
                                                                strutStyle:
                                                                    const StrutStyle(
                                                                        fontSize:
                                                                            8.0),
                                                                text: TextSpan(
                                                                    style: const TextStyle(
                                                                        fontSize:
                                                                            12,
                                                                        color: UIGuide
                                                                            .light_Purple,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w600),
                                                                    text: value
                                                                            .staffReportList[index]
                                                                            .name ??
                                                                        '--'),
                                                              ),
                                                            ],
                                                          ),
                                                          Row(
                                                            children: [
                                                              const Text(
                                                                'Section : ',
                                                                textAlign:
                                                                    TextAlign
                                                                        .start,
                                                                style: TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    fontSize:
                                                                        13),
                                                              ),
                                                              RichText(
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                maxLines: 1,
                                                                strutStyle:
                                                                    const StrutStyle(
                                                                        fontSize:
                                                                            8.0),
                                                                text: TextSpan(
                                                                  style:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        12,
                                                                    color: Colors
                                                                        .black,
                                                                  ),
                                                                  text: value
                                                                          .staffReportList[
                                                                              index]
                                                                          .section ??
                                                                      '--',
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          Row(
                                                            children: [
                                                              Text(
                                                                'Designation : ',
                                                                textAlign:
                                                                    TextAlign
                                                                        .start,
                                                                style: TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    fontSize:
                                                                        13),
                                                              ),
                                                              RichText(
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                maxLines: 1,
                                                                strutStyle:
                                                                    const StrutStyle(
                                                                        fontSize:
                                                                            8.0),
                                                                text: TextSpan(
                                                                  style:
                                                                      const TextStyle(
                                                                    fontSize:
                                                                        12,
                                                                    color: Colors
                                                                        .black,
                                                                  ),
                                                                  text: value
                                                                          .staffReportList[
                                                                              index]
                                                                          .designation ??
                                                                      '--',
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          Row(
                                                            children: [
                                                              const Text(
                                                                'Staff Role : ',
                                                                textAlign:
                                                                    TextAlign
                                                                        .start,
                                                                style: TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    fontSize:
                                                                        13),
                                                              ),
                                                              RichText(
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                maxLines: 1,
                                                                strutStyle:
                                                                    const StrutStyle(
                                                                        fontSize:
                                                                            8.0),
                                                                text: TextSpan(
                                                                  style:
                                                                      const TextStyle(
                                                                    fontSize:
                                                                        12,
                                                                    color: Colors
                                                                        .black,
                                                                  ),
                                                                  text: value
                                                                          .staffReportList[
                                                                              index]
                                                                          .staffRole ??
                                                                      '---',
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          GestureDetector(
                                                            onTap: () {
                                                              _makingPhoneCall(value
                                                                      .staffReportList[
                                                                          index]
                                                                      .mobileNo ??
                                                                  '---');
                                                            },
                                                            child: Row(
                                                              children: [
                                                                const Text(
                                                                  'Phone : ',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .start,
                                                                  style: TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      fontSize:
                                                                          13),
                                                                ),
                                                                RichText(
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                  maxLines: 1,
                                                                  strutStyle:
                                                                      const StrutStyle(
                                                                          fontSize:
                                                                              8.0),
                                                                  text:
                                                                      TextSpan(
                                                                    style:
                                                                        const TextStyle(
                                                                      fontSize:
                                                                          13,
                                                                      color: Colors
                                                                          .black,
                                                                    ),
                                                                    text: value
                                                                            .staffReportList[index]
                                                                            .mobileNo ??
                                                                        '---',
                                                                  ),
                                                                ),
                                                                const Icon(
                                                                  Icons.phone,
                                                                  size: 17,
                                                                )
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        )),
                                  )));
                        } else {
                          return Container(
                            height: 0,
                            width: 0,
                          );
                        }
                      },
                    ),
                  ),

            // ListView.builder(
            //     shrinkWrap: true,
            //     itemCount: value.staffReportList.length,
            //     itemBuilder: (context, index) {
            //       String status = value.staffReportList[index].staffRole ==
            //               null
            //           ? '--'
            //           : value.staffReportList[index].staffRole.toString();
            //       if (status.toString() == "NonTeachingStaff") {
            //         return Column(
            //           children: [
            //             kheight10,
            //             GestureDetector(
            //               onTap: () {
            //                 Navigator.of(context).push(
            //                   MaterialPageRoute(
            //                       builder: (context) => StaffInfo(
            //                             index: index,
            //                           )),
            //                 );
            //               },
            //               child: Container(
            //                 width: size.width - 10,
            //                 height: 100,
            //                 decoration: const BoxDecoration(
            //                     color: Color.fromARGB(255, 236, 233, 233),
            //                     borderRadius:
            //                         BorderRadius.all(Radius.circular(10))),
            //                 child: Row(
            //                   crossAxisAlignment: CrossAxisAlignment.start,
            //                   children: [
            //                     kWidth,
            //                     Center(
            //                       child: Container(
            //                         width: 70,
            //                         height: 70,
            //                         decoration: BoxDecoration(
            //                             color: Color.fromARGB(
            //                                 255, 236, 233, 233),
            //                             image: DecorationImage(
            //                                 image: NetworkImage(value
            //                                             .staffReportList[
            //                                                 index]
            //                                             .staffPhoto ==
            //                                         null
            //                                     ? 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRhwaLDKaK49tsHmdMGOrmTdns5qiw080F2Yw&usqp=CAU'
            //                                     : value
            //                                         .staffReportList[index]
            //                                         .staffPhoto
            //                                         .toString())),
            //                             borderRadius: BorderRadius.all(
            //                                 Radius.circular(10))),
            //                       ),
            //                     ),
            //                     Padding(
            //                       padding: const EdgeInsets.all(8.0),
            //                       child: Column(
            //                         crossAxisAlignment:
            //                             CrossAxisAlignment.start,
            //                         children: [
            //                           Row(
            //                             children: [
            //                               const Text(
            //                                 'Name : ',
            //                                 style: TextStyle(
            //                                     fontWeight: FontWeight.w500,
            //                                     fontSize: 13),
            //                               ),
            //                               RichText(
            //                                 overflow: TextOverflow.ellipsis,
            //                                 maxLines: 1,
            //                                 strutStyle: const StrutStyle(
            //                                     fontSize: 8.0),
            //                                 text: TextSpan(
            //                                     style: const TextStyle(
            //                                         fontSize: 12,
            //                                         color: UIGuide
            //                                             .light_Purple,
            //                                         fontWeight:
            //                                             FontWeight.w600),
            //                                     text: value
            //                                             .staffReportList[
            //                                                 index]
            //                                             .name ??
            //                                         '--'),
            //                               ),
            //                             ],
            //                           ),
            //                           Row(
            //                             children: [
            //                               const Text(
            //                                 'Section : ',
            //                                 textAlign: TextAlign.start,
            //                                 style: TextStyle(
            //                                     fontWeight: FontWeight.w500,
            //                                     fontSize: 13),
            //                               ),
            //                               RichText(
            //                                 overflow: TextOverflow.ellipsis,
            //                                 maxLines: 1,
            //                                 strutStyle: const StrutStyle(
            //                                     fontSize: 8.0),
            //                                 text: TextSpan(
            //                                   style: TextStyle(
            //                                     fontSize: 12,
            //                                     color: Colors.black,
            //                                   ),
            //                                   text: value
            //                                           .staffReportList[
            //                                               index]
            //                                           .section ??
            //                                       '--',
            //                                 ),
            //                               ),
            //                             ],
            //                           ),
            //                           Row(
            //                             children: [
            //                               Text(
            //                                 'Designation : ',
            //                                 textAlign: TextAlign.start,
            //                                 style: TextStyle(
            //                                     fontWeight: FontWeight.w500,
            //                                     fontSize: 13),
            //                               ),
            //                               RichText(
            //                                 overflow: TextOverflow.ellipsis,
            //                                 maxLines: 1,
            //                                 strutStyle: const StrutStyle(
            //                                     fontSize: 8.0),
            //                                 text: TextSpan(
            //                                   style: const TextStyle(
            //                                     fontSize: 12,
            //                                     color: Colors.black,
            //                                   ),
            //                                   text: value
            //                                           .staffReportList[
            //                                               index]
            //                                           .designation ??
            //                                       '--',
            //                                 ),
            //                               ),
            //                             ],
            //                           ),
            //                           Row(
            //                             children: [
            //                               const Text(
            //                                 'Staff Role : ',
            //                                 textAlign: TextAlign.start,
            //                                 style: TextStyle(
            //                                     fontWeight: FontWeight.w500,
            //                                     fontSize: 13),
            //                               ),
            //                               RichText(
            //                                 overflow: TextOverflow.ellipsis,
            //                                 maxLines: 1,
            //                                 strutStyle: const StrutStyle(
            //                                     fontSize: 8.0),
            //                                 text: TextSpan(
            //                                   style: const TextStyle(
            //                                     fontSize: 12,
            //                                     color: Colors.black,
            //                                   ),
            //                                   text: value
            //                                           .staffReportList[
            //                                               index]
            //                                           .staffRole ??
            //                                       '---',
            //                                 ),
            //                               ),
            //                             ],
            //                           ),
            //                           GestureDetector(
            //                             onTap: () {
            //                               _makingPhoneCall(value
            //                                       .staffReportList[index]
            //                                       .mobileNo ??
            //                                   '---');
            //                             },
            //                             child: Row(
            //                               children: [
            //                                 const Text(
            //                                   'Phone : ',
            //                                   textAlign: TextAlign.start,
            //                                   style: TextStyle(
            //                                       fontWeight:
            //                                           FontWeight.w500,
            //                                       fontSize: 13),
            //                                 ),
            //                                 RichText(
            //                                   overflow:
            //                                       TextOverflow.ellipsis,
            //                                   maxLines: 1,
            //                                   strutStyle: const StrutStyle(
            //                                       fontSize: 8.0),
            //                                   text: TextSpan(
            //                                     style: const TextStyle(
            //                                       fontSize: 13,
            //                                       color: Colors.black,
            //                                     ),
            //                                     text: value
            //                                             .staffReportList[
            //                                                 index]
            //                                             .mobileNo ??
            //                                         '---',
            //                                   ),
            //                                 ),
            //                                 const Icon(
            //                                   Icons.phone,
            //                                   size: 17,
            //                                 )
            //                               ],
            //                             ),
            //                           ),
            //                         ],
            //                       ),
            //                     )
            //                   ],
            //                 ),
            //               ),
            //             ),
            //           ],
            //         );
            //       } else {
            //         return Container(
            //           height: 0,
            //           width: 0,
            //         );
            //       }
            //     },
            //   ),
          ),
        ),
      ],
    );
  }

  _makingPhoneCall(String phn) async {
    var url = Uri.parse("tel:$phn");
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

//both

class BothStaff extends StatefulWidget {
  const BothStaff({Key? key}) : super(key: key);

  @override
  State<BothStaff> createState() => _BothStaffState();
}

class _BothStaffState extends State<BothStaff> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      var p = Provider.of<StaffReportProviders>(context, listen: false);

      p.staffReportt();
      p.clearStudentList();
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return ListView(
      children: [
        LimitedBox(
          maxHeight: size.height - 110,
          child: Consumer<StaffReportProviders>(
            builder: (context, value, child) => value.loading
                ? spinkitLoader()
                : AnimationLimiter(
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(
                          parent: AlwaysScrollableScrollPhysics()),
                      shrinkWrap: true,
                      itemCount: value.staffReportList.length == null
                          ? 0
                          : value.staffReportList.length,
                      itemBuilder: (BuildContext context, int index) {
                        String status =
                            value.staffReportList[index].staffRole == null
                                ? '--'
                                : value.staffReportList[index].staffRole
                                    .toString();

                        return AnimationConfiguration.staggeredList(
                            position: index,
                            delay: Duration(milliseconds: 100),
                            child: SlideAnimation(
                                duration: Duration(milliseconds: 2500),
                                curve: Curves.fastLinearToSlowEaseIn,
                                horizontalOffset: -300,
                                verticalOffset: -850,
                                child: Padding(
                                  padding: const EdgeInsets.all(6.0),
                                  child: Container(
                                      width: size.width - 4,
                                      // height: 150,
                                      decoration: const BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                              blurRadius: 2,
                                            )
                                          ],
                                          color: Color.fromARGB(
                                              255, 236, 236, 241),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10))),
                                      child: Column(
                                        children: [
                                          kheight10,
                                          GestureDetector(
                                            onTap: () {
                                              Navigator.of(context).push(
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      StaffInfo(
                                                    index: index,
                                                  ),
                                                ),
                                              );
                                            },
                                            child: Container(
                                              width: size.width - 10,
                                              height: 100,
                                              decoration: const BoxDecoration(
                                                  color: Color.fromARGB(
                                                      255, 236, 233, 233),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(10))),
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  kWidth,
                                                  Center(
                                                    child: Container(
                                                      width: 70,
                                                      height: 70,
                                                      decoration: BoxDecoration(
                                                          color: Color.fromARGB(
                                                              255, 236, 233, 233),
                                                          image: DecorationImage(
                                                              image: NetworkImage(value.staffReportList[index].staffPhoto ==
                                                                      null
                                                                  ? 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRhwaLDKaK49tsHmdMGOrmTdns5qiw080F2Yw&usqp=CAU'
                                                                  : value
                                                                      .staffReportList[
                                                                          index]
                                                                      .staffPhoto
                                                                      .toString())),
                                                          borderRadius:
                                                              const BorderRadius.all(
                                                                  Radius.circular(10))),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Row(
                                                          children: [
                                                            const Text(
                                                              'Name : ',
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontSize: 13),
                                                            ),
                                                            RichText(
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              maxLines: 1,
                                                              strutStyle:
                                                                  const StrutStyle(
                                                                      fontSize:
                                                                          8.0),
                                                              text: TextSpan(
                                                                  style: const TextStyle(
                                                                      fontSize:
                                                                          12,
                                                                      color: UIGuide
                                                                          .light_Purple,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600),
                                                                  text: value
                                                                          .staffReportList[
                                                                              index]
                                                                          .name ??
                                                                      '--'),
                                                            ),
                                                          ],
                                                        ),
                                                        Row(
                                                          children: [
                                                            const Text(
                                                              'Section : ',
                                                              textAlign:
                                                                  TextAlign
                                                                      .start,
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontSize: 13),
                                                            ),
                                                            RichText(
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              maxLines: 1,
                                                              strutStyle:
                                                                  const StrutStyle(
                                                                      fontSize:
                                                                          8.0),
                                                              text: TextSpan(
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 12,
                                                                  color: Colors
                                                                      .black,
                                                                ),
                                                                text: value
                                                                        .staffReportList[
                                                                            index]
                                                                        .section ??
                                                                    '--',
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        Row(
                                                          children: [
                                                            Text(
                                                              'Designation : ',
                                                              textAlign:
                                                                  TextAlign
                                                                      .start,
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontSize: 13),
                                                            ),
                                                            RichText(
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              maxLines: 1,
                                                              strutStyle:
                                                                  const StrutStyle(
                                                                      fontSize:
                                                                          8.0),
                                                              text: TextSpan(
                                                                style:
                                                                    const TextStyle(
                                                                  fontSize: 12,
                                                                  color: Colors
                                                                      .black,
                                                                ),
                                                                text: value
                                                                        .staffReportList[
                                                                            index]
                                                                        .designation ??
                                                                    '--',
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        Row(
                                                          children: [
                                                            const Text(
                                                              'Staff Role : ',
                                                              textAlign:
                                                                  TextAlign
                                                                      .start,
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontSize: 13),
                                                            ),
                                                            RichText(
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              maxLines: 1,
                                                              strutStyle:
                                                                  const StrutStyle(
                                                                      fontSize:
                                                                          8.0),
                                                              text: TextSpan(
                                                                style:
                                                                    const TextStyle(
                                                                  fontSize: 12,
                                                                  color: Colors
                                                                      .black,
                                                                ),
                                                                text: value
                                                                        .staffReportList[
                                                                            index]
                                                                        .staffRole ??
                                                                    '---',
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        GestureDetector(
                                                          onTap: () {
                                                            _makingPhoneCall(value
                                                                    .staffReportList[
                                                                        index]
                                                                    .mobileNo ??
                                                                '---');
                                                          },
                                                          child: Row(
                                                            children: [
                                                              const Text(
                                                                'Phone : ',
                                                                textAlign:
                                                                    TextAlign
                                                                        .start,
                                                                style: TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    fontSize:
                                                                        13),
                                                              ),
                                                              RichText(
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                maxLines: 1,
                                                                strutStyle:
                                                                    const StrutStyle(
                                                                        fontSize:
                                                                            8.0),
                                                                text: TextSpan(
                                                                  style:
                                                                      const TextStyle(
                                                                    fontSize:
                                                                        13,
                                                                    color: Colors
                                                                        .black,
                                                                  ),
                                                                  text: value
                                                                          .staffReportList[
                                                                              index]
                                                                          .mobileNo ??
                                                                      '---',
                                                                ),
                                                              ),
                                                              const Icon(
                                                                Icons.phone,
                                                                size: 17,
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      )),
                                )));
                      },
                    ),
                  ),

            // ListView.builder(
            //     shrinkWrap: true,
            //     itemCount: value.staffReportList.length,
            //     itemBuilder: (context, index) {
            //       return Column(
            //         children: [
            //           kheight10,
            //           GestureDetector(
            //             onTap: () {
            //               Navigator.of(context).push(
            //                 MaterialPageRoute(
            //                     builder: (context) => StaffInfo(
            //                           index: index,
            //                         )),
            //               );
            //             },
            //             child: Container(
            //               width: size.width - 10,
            //               height: 100,
            //               decoration: const BoxDecoration(
            //                   color: Color.fromARGB(255, 236, 233, 233),
            //                   borderRadius:
            //                       BorderRadius.all(Radius.circular(10))),
            //               child: Row(
            //                 crossAxisAlignment: CrossAxisAlignment.start,
            //                 children: [
            //                   kWidth,
            //                   Center(
            //                     child: Container(
            //                       width: 70,
            //                       height: 70,
            //                       decoration: BoxDecoration(
            //                           color: Color.fromARGB(
            //                               255, 236, 233, 233),
            //                           image: DecorationImage(
            //                               image: NetworkImage(value
            //                                           .staffReportList[
            //                                               index]
            //                                           .staffPhoto ==
            //                                       null
            //                                   ? 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRhwaLDKaK49tsHmdMGOrmTdns5qiw080F2Yw&usqp=CAU'
            //                                   : value.staffReportList[index]
            //                                       .staffPhoto
            //                                       .toString())),
            //                           borderRadius: BorderRadius.all(
            //                               Radius.circular(10))),
            //                     ),
            //                   ),
            //                   Padding(
            //                     padding: const EdgeInsets.all(8.0),
            //                     child: Column(
            //                       crossAxisAlignment:
            //                           CrossAxisAlignment.start,
            //                       children: [
            //                         Row(
            //                           children: [
            //                             const Text(
            //                               'Name : ',
            //                               style: TextStyle(
            //                                   fontWeight: FontWeight.w500,
            //                                   fontSize: 13),
            //                             ),
            //                             RichText(
            //                               overflow: TextOverflow.ellipsis,
            //                               maxLines: 1,
            //                               strutStyle: const StrutStyle(
            //                                   fontSize: 8.0),
            //                               text: TextSpan(
            //                                   style: const TextStyle(
            //                                       fontSize: 12,
            //                                       color:
            //                                           UIGuide.light_Purple,
            //                                       fontWeight:
            //                                           FontWeight.w600),
            //                                   text: value
            //                                           .staffReportList[
            //                                               index]
            //                                           .name ??
            //                                       '--'),
            //                             ),
            //                           ],
            //                         ),
            //                         Row(
            //                           children: [
            //                             const Text(
            //                               'Section : ',
            //                               textAlign: TextAlign.start,
            //                               style: TextStyle(
            //                                   fontWeight: FontWeight.w500,
            //                                   fontSize: 13),
            //                             ),
            //                             RichText(
            //                               overflow: TextOverflow.ellipsis,
            //                               maxLines: 1,
            //                               strutStyle: const StrutStyle(
            //                                   fontSize: 8.0),
            //                               text: TextSpan(
            //                                 style: TextStyle(
            //                                   fontSize: 12,
            //                                   color: Colors.black,
            //                                 ),
            //                                 text: value
            //                                         .staffReportList[index]
            //                                         .section ??
            //                                     '--',
            //                               ),
            //                             ),
            //                           ],
            //                         ),
            //                         Row(
            //                           children: [
            //                             Text(
            //                               'Designation : ',
            //                               textAlign: TextAlign.start,
            //                               style: TextStyle(
            //                                   fontWeight: FontWeight.w500,
            //                                   fontSize: 13),
            //                             ),
            //                             RichText(
            //                               overflow: TextOverflow.ellipsis,
            //                               maxLines: 1,
            //                               strutStyle: const StrutStyle(
            //                                   fontSize: 8.0),
            //                               text: TextSpan(
            //                                 style: const TextStyle(
            //                                   fontSize: 12,
            //                                   color: Colors.black,
            //                                 ),
            //                                 text: value
            //                                         .staffReportList[index]
            //                                         .designation ??
            //                                     '--',
            //                               ),
            //                             ),
            //                           ],
            //                         ),
            //                         Row(
            //                           children: [
            //                             const Text(
            //                               'Staff Role : ',
            //                               textAlign: TextAlign.start,
            //                               style: TextStyle(
            //                                   fontWeight: FontWeight.w500,
            //                                   fontSize: 13),
            //                             ),
            //                             RichText(
            //                               overflow: TextOverflow.ellipsis,
            //                               maxLines: 1,
            //                               strutStyle: const StrutStyle(
            //                                   fontSize: 8.0),
            //                               text: TextSpan(
            //                                 style: const TextStyle(
            //                                   fontSize: 12,
            //                                   color: Colors.black,
            //                                 ),
            //                                 text: value
            //                                         .staffReportList[index]
            //                                         .staffRole ??
            //                                     '---',
            //                               ),
            //                             ),
            //                           ],
            //                         ),
            //                         GestureDetector(
            //                           onTap: () {
            //                             _makingPhoneCall(value
            //                                     .staffReportList[index]
            //                                     .mobileNo ??
            //                                 '---');
            //                           },
            //                           child: Row(
            //                             children: [
            //                               const Text(
            //                                 'Phone : ',
            //                                 textAlign: TextAlign.start,
            //                                 style: TextStyle(
            //                                     fontWeight: FontWeight.w500,
            //                                     fontSize: 13),
            //                               ),
            //                               RichText(
            //                                 overflow: TextOverflow.ellipsis,
            //                                 maxLines: 1,
            //                                 strutStyle: const StrutStyle(
            //                                     fontSize: 8.0),
            //                                 text: TextSpan(
            //                                   style: const TextStyle(
            //                                     fontSize: 13,
            //                                     color: Colors.black,
            //                                   ),
            //                                   text: value
            //                                           .staffReportList[
            //                                               index]
            //                                           .mobileNo ??
            //                                       '---',
            //                                 ),
            //                               ),
            //                               const Icon(
            //                                 Icons.phone,
            //                                 size: 17,
            //                               )
            //                             ],
            //                           ),
            //                         ),
            //                       ],
            //                     ),
            //                   )
            //                 ],
            //               ),
            //             ),
            //           ),
            //         ],
            //       );
            //     },
            //   ),
          ),
        ),
      ],
    );
  }

  _makingPhoneCall(String phn) async {
    var url = Uri.parse("tel:$phn");
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
