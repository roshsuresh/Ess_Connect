import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:essconnect/Application/AdminProviders/SchoolPhotoProviders.dart';
import 'package:essconnect/Application/AdminProviders/dashboardProvider.dart';
import 'package:essconnect/Application/Module%20Providers.dart/Module.dart';
import 'package:essconnect/Application/StudentProviders/CurriculamProviders.dart';
import 'package:essconnect/Presentation/Admin/Communication/ToStaff.dart';
import 'package:essconnect/Presentation/Admin/ExamTimetable/ExamScreen.dart';
import 'package:essconnect/Presentation/Admin/History/NotificationHistoryStaff.dart';
import 'package:essconnect/Presentation/Admin/MarkentryReport.dart';
import 'package:essconnect/Presentation/Admin/StudentStatistiics.dart';
import 'package:essconnect/Presentation/Admin/demo.dart';
import 'package:essconnect/Presentation/Staff/StudReport.dart';
import 'package:essconnect/Presentation/Student/CurriculamScreen.dart';
import 'package:essconnect/Presentation/Student/NoInternetScreen.dart';
import 'package:essconnect/Presentation/Student/TimeTable.dart';
import 'package:essconnect/utils/constants.dart';
import 'package:essconnect/utils/spinkit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Application/StudentProviders/InternetConnection.dart';
import '../../Constants.dart';
import '../Login_Activation/Login_page.dart';
import '../Student/PasswordChange.dart';
import 'Communication/ToGuardian.dart';
import 'FeeCollectionReport/FeeReport.dart';
import 'FlashNews/FlashnewsScreen.dart';
import 'Gallery/GalleryScreen.dart';
import 'NoticeBoard/NoticeboardScreen.dart';
import 'StaffReport.dart';
import 'FeeDetails/StudFeeSearch.dart';

class AdminHome extends StatefulWidget {
  const AdminHome({Key? key}) : super(key: key);

  @override
  State<AdminHome> createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<ConnectivityProvider>(context, listen: false);
      Provider.of<ModuleProviders>(context, listen: false).getModuleDetails();
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Consumer<ConnectivityProvider>(
        builder: (context, connection, child) => connection.isOnline == false
            ? const NoInternetConnection()
            : ListView(
                physics: BouncingScrollPhysics(),
                children: [
                  const AdminProfileTop(),
                  Container(
                    width: size.width,
                    height: size.height - 170,
                    decoration: BoxDecoration(
                        border:
                            Border.all(color: UIGuide.THEME_LIGHT, width: 1),
                        // boxShadow: [
                        //   BoxShadow(
                        //       color: UIGuide.light_Purple,
                        //       blurRadius: 2,
                        //       offset: Offset(1, 3))
                        // ],
                        color: Colors.white,
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30))),
                    child: const AdminHomeContent(),
                  )
                ],
              ),
      ),
    );
  }
}

class AdminHomeContent extends StatelessWidget {
  const AdminHomeContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        Container(
          decoration: const BoxDecoration(
              color: Color.fromARGB(255, 255, 255, 255),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30))),
          child: Column(
            children: [
              kheight20,
              Row(children: <Widget>[
                // Expanded(
                //   child: Container(
                //       margin: const EdgeInsets.only(left: 10.0, right: 20.0),
                //       child: const Divider(
                //         color: Colors.black45,
                //         height: 36,
                //       )),
                // ),
                Text(
                  ' ──    ',
                  style: TextStyle(
                    color: Colors.black26,
                  ),
                ),
                const Text(
                  'General Info',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: UIGuide.light_Purple, fontWeight: FontWeight.w900),
                ),
                Expanded(
                  child: Container(
                      margin: const EdgeInsets.only(left: 20.0, right: 10.0),
                      child: const Divider(
                        color: Colors.black45,
                        height: 36,
                      )),
                ),
              ]),
              kheight20,
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const StudReport()),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Card(
                            elevation: 10,
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 38,
                                width: 38,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    opacity: 20,
                                    image: AssetImage(
                                      'assets/01student report.png',
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          kheight10,
                          const Center(
                            child: Text(
                              'Student \n Report',
                              style: TextStyle(
                                  fontSize: 11,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Student_statistics_admin()),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Card(
                            elevation: 10,
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 38,
                                width: 38,
                                decoration: BoxDecoration(
                                  image: const DecorationImage(
                                    opacity: 20,
                                    image: AssetImage(
                                      'assets/statistics.png',
                                    ),
                                  ),
                                  borderRadius: BorderRadius.circular(0),
                                ),
                              ),
                            ),
                          ),
                          kheight10,
                          const Center(
                            child: Text(
                              ' Student\nStatistics',
                              style: TextStyle(
                                  fontSize: 11,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const StaffReport()),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Column(
                        children: [
                          Card(
                            elevation: 10,
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 38,
                                width: 38,
                                decoration: BoxDecoration(
                                  image: const DecorationImage(
                                    opacity: 20,
                                    image: AssetImage(
                                      'assets/01staffreport.jpg',
                                    ),
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          ),
                          kheight10,
                          const Text(
                            ' Staff Report',
                            style: TextStyle(
                                fontSize: 11,
                                color: Colors.black87,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ExamTimetable()),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Card(
                            elevation: 10,
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 38,
                                width: 38,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    opacity: 20,
                                    image: AssetImage(
                                      'assets/Timetable.png',
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          kheight10,
                          const Text(
                            '     Exam \n TimeTable',
                            style: TextStyle(
                                fontSize: 11,
                                color: Colors.black87,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              kheight10,
              kheight10,
              Row(children: <Widget>[
                Text(
                  ' ──    ',
                  style: TextStyle(
                    color: Colors.black26,
                  ),
                ),
                const Text(
                  "Reports",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: UIGuide.light_Purple, fontWeight: FontWeight.w900),
                ),
                Expanded(
                  child: Container(
                      margin: const EdgeInsets.only(left: 20.0, right: 10.0),
                      child: const Divider(
                        color: Colors.black45,
                        height: 36,
                      )),
                ),
              ]),
              kheight20,
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const FeeReport()),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Card(
                            elevation: 10,
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 38,
                                width: 38,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    opacity: 20,
                                    image: AssetImage(
                                      'assets/01feescollectionreport.png',
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          kheight10,
                          const Center(
                            child: Text(
                              'Fees Collection \n        Report',
                              style: TextStyle(
                                  fontSize: 11,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const StudentFeeSearch()),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Card(
                            elevation: 10,
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 38,
                                width: 38,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    opacity: 20,
                                    image: AssetImage(
                                      "assets/Fees.png",
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          kheight10,
                          const Text(
                            '    Student \nFees Report',
                            style: TextStyle(
                                fontSize: 11,
                                color: Colors.black87,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          duration: Duration(seconds: 1),
                          margin:
                              EdgeInsets.only(bottom: 80, left: 30, right: 30),
                          behavior: SnackBarBehavior.floating,
                          content: Text(
                            'Something went wrong...',
                            textAlign: TextAlign.center,
                          ),
                        ),
                      );
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => Demo()),
                      // );
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Column(
                        children: [
                          Card(
                            elevation: 10,
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 38,
                                width: 38,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    opacity: 20,
                                    image: AssetImage(
                                      'assets/Tabulation.png',
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          kheight10,
                          const Text(
                            'Mark Entry',
                            style: TextStyle(
                                fontSize: 11,
                                color: Colors.black87,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          duration: Duration(seconds: 1),
                          margin:
                              EdgeInsets.only(bottom: 80, left: 30, right: 30),
                          behavior: SnackBarBehavior.floating,
                          content: Text(
                            'Something went wrong...',
                            textAlign: TextAlign.center,
                          ),
                        ),
                      );
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => MarkentryReportByAdmin(),
                      //   ),
                      // );
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Column(
                        children: [
                          Card(
                            elevation: 10,
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 38,
                                width: 38,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    opacity: 20,
                                    image: AssetImage(
                                      'assets/Marksheet.png',
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          kheight10,
                          const Text(
                            'Mark Entry\n   Report',
                            style: TextStyle(
                                fontSize: 11,
                                color: Colors.black87,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              kheight10,
              kheight10,
              Row(children: <Widget>[
                Text(
                  ' ──    ',
                  style: TextStyle(
                    color: Colors.black26,
                  ),
                ),
                const Text(
                  "Communication",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: UIGuide.light_Purple, fontWeight: FontWeight.w900),
                ),
                Expanded(
                  child: Container(
                      margin: const EdgeInsets.only(left: 20.0, right: 10.0),
                      child: const Divider(
                        color: Colors.black45,
                        height: 36,
                      )),
                ),
              ]),
              kheight20,
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AdminToStaff()),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Card(
                            elevation: 10,
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 38,
                                width: 38,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    opacity: 20,
                                    image: AssetImage(
                                      'assets/01communication to staff.png',
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          kheight10,
                          const Text(
                            'To Staff',
                            style: TextStyle(
                                fontSize: 11,
                                color: Colors.black87,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AdminToGuardian()),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Card(
                            elevation: 10,
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 38,
                                width: 38,
                                decoration: BoxDecoration(
                                  image: const DecorationImage(
                                    opacity: 20,
                                    image: AssetImage(
                                      'assets/01communicationto guardian.png',
                                    ),
                                  ),
                                  borderRadius: BorderRadius.circular(0),
                                ),
                              ),
                            ),
                          ),
                          kheight10,
                          const Text(
                            'To Guardian',
                            style: TextStyle(
                                fontSize: 11,
                                color: Colors.black87,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.only(left: 10, right: 10),
                  //   child: GestureDetector(
                  //     onTap: () {
                  //       Navigator.push(
                  //         context,
                  //         MaterialPageRoute(
                  //             builder: (context) => ScreenTimeTable()),
                  //       );
                  //     },
                  //     child: Column(
                  //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //       children: [
                  //         Container(
                  //           height: 50,
                  //           width: 40,
                  //           decoration: const BoxDecoration(
                  //             image: DecorationImage(
                  //               opacity: 20,
                  //               image: AssetImage(
                  //                 'assets/Profilee.png',
                  //               ),
                  //             ),
                  //           ),
                  //         ),
                  //         kheight10,
                  //         const Text(
                  //           '   Upload\nTimetable',
                  //           style:
                  //               TextStyle(fontSize: 11, color: Colors.black38),
                  //         )
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const NotificationHistory()),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Card(
                            elevation: 10,
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 38,
                                width: 38,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    opacity: 20,
                                    image: AssetImage(
                                      'assets/Notification.png',
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          kheight10,
                          const Text(
                            'Notification\n     History',
                            style: TextStyle(
                                fontSize: 11,
                                color: Colors.black87,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AdminGallery()),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Card(
                            elevation: 10,
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 38,
                                width: 38,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    opacity: 20,
                                    image: AssetImage(
                                      'assets/Gallery.png',
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          kheight10,
                          const Text(
                            'Gallery',
                            style: TextStyle(
                                fontSize: 11,
                                color: Colors.black87,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              kheight10,
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ScreenFlashNews()),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Card(
                            elevation: 10,
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 38,
                                width: 38,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    opacity: 20,
                                    image: AssetImage(
                                      'assets/01flashnews.png',
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          kheight10,
                          const Text(
                            'Flash News',
                            style: TextStyle(
                                fontSize: 11,
                                color: Colors.black87,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const NoticeBoardAdnin()),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Card(
                            elevation: 10,
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 38,
                                width: 38,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    opacity: 20,
                                    image: AssetImage(
                                      'assets/Noticeboard.png',
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          kheight10,
                          const Text(
                            'NoticeBoard',
                            style: TextStyle(
                                fontSize: 11,
                                color: Colors.black87,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ),
                  Consumer<Curriculamprovider>(
                    builder: (context, curri, child) => GestureDetector(
                      onTap: () async {
                        await Provider.of<Curriculamprovider>(context,
                                listen: false)
                            .getCuriculamtoken();
                        String token = await curri.token.toString();
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CurriculamPage(
                                    token: token,
                                  )),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Card(
                              elevation: 10,
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: 38,
                                  width: 38,
                                  decoration: BoxDecoration(
                                    image: const DecorationImage(
                                      opacity: 20,
                                      image: AssetImage(
                                        'assets/Curriculum.png',
                                      ),
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                            ),
                            kheight10,
                            const Text(
                              'Curriculum',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 11,
                                  color: Colors.black87),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              kheight20,
              Row(children: <Widget>[
                const Text(
                  ' ──    ',
                  style: TextStyle(
                    color: Colors.black26,
                  ),
                ),
                const Text(
                  "Change Password | SignOut",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: UIGuide.light_Purple, fontWeight: FontWeight.w900),
                ),
                Expanded(
                  child: Container(
                      margin: const EdgeInsets.only(left: 20.0, right: 10.0),
                      child: const Divider(
                        color: Colors.black45,
                        height: 36,
                      )),
                ),
              ]),
              kheight20,
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MaterialButton(
                      elevation: 10,
                      minWidth: 50,
                      color: UIGuide.THEME_LIGHT,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0)),
                      onPressed: () async {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => PasswordChange()),
                        );
                      },
                      child: const Icon(
                        Icons.key_sharp,
                        color: UIGuide.light_Purple,
                      )),
                  MaterialButton(
                      minWidth: 50,
                      elevation: 10,
                      color: UIGuide.THEME_LIGHT,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0)),
                      onPressed: () async {
                        AwesomeDialog(
                          context: context,
                          dialogType: DialogType.info,
                          borderSide: const BorderSide(
                              color: UIGuide.light_Purple, width: 2),
                          buttonsBorderRadius:
                              const BorderRadius.all(Radius.circular(2)),
                          headerAnimationLoop: false,
                          animType: AnimType.bottomSlide,
                          title: 'SignOut',
                          desc: 'Are you sure want to sign out',
                          showCloseIcon: true,
                          btnOkColor: UIGuide.button1,
                          btnCancelColor: UIGuide.button2,
                          btnCancelOnPress: () {
                            return;
                          },
                          btnOkOnPress: () async {
                            SharedPreferences prefs =
                                await SharedPreferences.getInstance();
                            print("accesstoken  $prefs");
                            prefs.remove("accesstoken");

                            Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                    builder: (context) => LoginPage()),
                                (Route<dynamic> route) => false);
                          },
                        ).show();
                      },
                      child: const Icon(
                        Icons.logout_outlined,
                        color: UIGuide.light_Purple,
                      )),
                ],
              ),
              kheight20,
              const Center(
                child: Text(
                  "Powered By GJ Infotech (P) Ltd.",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: UIGuide.light_Purple),
                ),
              ),
              kheight20,
              kheight20
            ],
          ),
        ),
      ],
    );
  }

  _noAcess(context) {
    var size = MediaQuery.of(context).size;
    return showAnimatedDialog(
      animationType: DialogTransitionType.slideFromBottomFade,
      curve: Curves.fastOutSlowIn,
      // duration: Duration(seconds: 1),
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return Dialog(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0))),
          child: Container(
            height: size.height / 7.2,
            width: size.width * 3,
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    "Sorry, you don't have access to this module",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                        color: UIGuide.light_Purple),
                  ),
                  //kheight10,
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Spacer(),
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text(
                              'Cancel',
                              style: TextStyle(color: Colors.grey),
                            )),
                        kWidth,
                        //kWidth
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class AdminProfileTop extends StatefulWidget {
  const AdminProfileTop({Key? key}) : super(key: key);

  @override
  State<AdminProfileTop> createState() => _AdminProfileTopState();
}

class _AdminProfileTopState extends State<AdminProfileTop> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      var p = Provider.of<DashboardAdmin>(context, listen: false);
      p.getDashboard();
      var m = Provider.of<SchoolPhotoProviders>(context, listen: false);
      m.getSchoolPhoto();
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: CarouselSlider(
        items: [
          Container(
            width: size.width,
            margin: const EdgeInsets.all(6.0),
            decoration: BoxDecoration(
                gradient: const LinearGradient(
                    colors: [Color(0xFFc2e59c), Color(0xFF64b3f4)]),
                // color: UIGuide.light_Purple,
                border: Border.all(color: UIGuide.THEME_LIGHT),
                borderRadius: const BorderRadius.all(Radius.circular(5))),
            child: Consumer<DashboardAdmin>(
              builder: (context, value, child) => value.loading
                  ? spinkitLoader()
                  : SingleChildScrollView(
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 4,
                          ),
                          const Text(
                            'Student Info',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color.fromARGB(255, 37, 37, 117),
                                fontWeight: FontWeight.bold),
                          ),
                          Row(children: [
                            SingleChildScrollView(
                              child: Column(
                                children: [
                                  kheight10,
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        const Text(
                                          'Total Strength:  ',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          value.totalStudentStrength == null
                                              ? '--'
                                              : value.totalStudentStrength
                                                  .toString(),
                                          style: const TextStyle(
                                              color: UIGuide.light_Purple,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        const Text(
                                          'Boys Strength:  ',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          value.boysStrength == null
                                              ? '--'
                                              : value.boysStrength.toString(),
                                          style: const TextStyle(
                                              color: UIGuide.light_Purple,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        const Text(
                                          'Girls Strength:  ',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          value.girlsStrength == null
                                              ? '--'
                                              : value.girlsStrength.toString(),
                                          style: const TextStyle(
                                              color: UIGuide.light_Purple,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            const Spacer(),
                            Container(
                              height: 100,
                              width: 85,
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          "assets/cardstudent.png"))),
                            ),
                            const Spacer(),
                          ]),
                        ],
                      ),
                    ),
            ),
          ),
          Container(
            width: size.width,
            margin: const EdgeInsets.all(6.0),
            decoration: BoxDecoration(
                gradient: const LinearGradient(colors: [
                  Color.fromARGB(255, 79, 93, 223),
                  Color.fromARGB(255, 98, 195, 219),
                ]),
                border: Border.all(color: UIGuide.THEME_LIGHT),
                borderRadius: const BorderRadius.all(Radius.circular(5))),
            child: Consumer<DashboardAdmin>(
                builder: (context, value, child) => value.loading
                    ? spinkitLoader()
                    : SingleChildScrollView(
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 4,
                            ),
                            const Text(
                              'Staff Info',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Color.fromARGB(255, 37, 37, 117),
                                  fontWeight: FontWeight.bold),
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SingleChildScrollView(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      kheight10,
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          children: [
                                            const Text(
                                              'Total Strength:  ',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              value.totalStaffStrength == null
                                                  ? '--'
                                                  : value.totalStaffStrength
                                                      .toString(),
                                              style: const TextStyle(
                                                  color: UIGuide.light_Purple,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(0),
                                        child: Row(
                                          children: [
                                            const Text(
                                              '  Teaching  :  ',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              value.teachingStrength == null
                                                  ? '--'
                                                  : value.teachingStrength
                                                      .toString(),
                                              style: const TextStyle(
                                                  color: UIGuide.light_Purple,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          children: [
                                            const Text(
                                              'Non-Teaching:  ',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              value.nonTeachingStrength == null
                                                  ? '--'
                                                  : value.nonTeachingStrength
                                                      .toString(),
                                              style: const TextStyle(
                                                  color: UIGuide.light_Purple,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                const Spacer(),
                                Container(
                                  height: 100,
                                  width: 85,
                                  decoration: const BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              "assets/Staffdb1.png"))),
                                ),
                                const Spacer(),
                              ],
                            ),
                          ],
                        ),
                      )),
          ),
          Consumer<SchoolPhotoProviders>(
            builder: (context, value, child) => Container(
              width: size.width,
              margin: const EdgeInsets.all(6.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                image: DecorationImage(
                  image: NetworkImage(value.url ??
                      "https://previews.123rf.com/images/dualororua/dualororua1707/dualororua170700237/82718617-happy-school-children-in-front-of-school-building.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
        options: CarouselOptions(
          height: 150.0,
          enlargeCenterPage: true,
          autoPlay: true,
          aspectRatio: 16 / 9,
          autoPlayCurve: Curves.easeInBack,
          enableInfiniteScroll: true,
          autoPlayAnimationDuration: const Duration(milliseconds: 700),
          viewportFraction: 0.75,
        ),
      ),
    );
  }
}
