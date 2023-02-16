// @dart=2.9
import 'dart:async';
import 'dart:core';
import 'dart:io';
import 'package:essconnect/Application/AdminProviders/Attendanceprovider.dart';
import 'package:essconnect/Application/AdminProviders/ExamTTPtoviders.dart';
import 'package:essconnect/Application/Module%20Providers.dart/MobileAppCheckin.dart';
import 'package:essconnect/Application/Staff_Providers/ExamTTProviderStaff.dart';
import 'package:essconnect/Application/Staff_Providers/NotificationCount.dart';
import 'package:essconnect/Application/Staff_Providers/TimetableProvider.dart';
import 'package:essconnect/Application/StudentProviders/DiaryProviders.dart';
import 'package:essconnect/Application/StudentProviders/NotificationCountProviders.dart';
import 'package:essconnect/Application/StudentProviders/TokenCheckProviders.dart';
import 'package:essconnect/Application/SuperAdminProviders/NoticeBoardProvidersSA.dart';
import 'package:essconnect/Presentation/ChildLogin/ChildHomeScreen.dart';
import 'package:essconnect/Presentation/SchoolHead/SchoolHeadHome.dart';
import 'package:essconnect/Presentation/SchoolSuperAdmin/SuperAdminHome.dart';
import 'package:essconnect/routes.dart';
import 'package:essconnect/utils/constants.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Application/AdminProviders/FeeDetailsProvider.dart';
import 'Application/AdminProviders/FeeReportProvider.dart';
import 'Application/AdminProviders/FlashNewsProviders.dart';
import 'Application/AdminProviders/GalleryProviders.dart';
import 'Application/AdminProviders/NoticeBoardList.dart';
import 'Application/AdminProviders/NoticeBoardadmin.dart';
import 'Application/AdminProviders/NotificationStaff.dart';
import 'Application/AdminProviders/NotificationToGuardian.dart';
import 'Application/AdminProviders/SchoolPhotoProviders.dart';
import 'Application/AdminProviders/SearchstaffProviders.dart';
import 'Application/AdminProviders/StaffReportProviders.dart';
import 'Application/AdminProviders/StudstattiticsProvider.dart';
import 'Application/AdminProviders/TimeTableProviders.dart';
import 'Application/AdminProviders/TimeTableStaff.dart';
import 'Application/AdminProviders/dashboardProvider.dart';
import 'Application/Module Providers.dart/Module.dart';
import 'Application/Staff_Providers/Attendencestaff.dart';
import 'Application/Staff_Providers/GallerySendProviderStaff.dart';
import 'Application/Staff_Providers/MarkEntryProvider.dart';
import 'Application/Staff_Providers/MarkReportProvider.dart';
import 'Application/Staff_Providers/NoticeboardSend.dart';
import 'Application/Staff_Providers/Notification_ToGuardianProvider.dart';
import 'Application/Staff_Providers/SearchProvider.dart';
import 'Application/Staff_Providers/StaffFlashnews.dart';
import 'Application/Staff_Providers/StaffNotificationScreen.dart';
import 'Application/Staff_Providers/StaffProfile.dart';
import 'Application/Staff_Providers/StudListProvider.dart';
import 'Application/Staff_Providers/TextSMS_ToGuardian.dart';
import 'Application/StudentProviders/AttendenceProvider.dart';
import 'Application/StudentProviders/CurriculamProviders.dart';
import 'Application/StudentProviders/FeesProvider.dart';
import 'Application/StudentProviders/FinalStatusProvider.dart';
import 'Application/StudentProviders/GalleryProvider.dart';
import 'Application/StudentProviders/InternetConnection.dart';
import 'Application/StudentProviders/LoginProvider.dart';
import 'Application/StudentProviders/NoticProvider.dart';
import 'Application/StudentProviders/NotificationReceived.dart';
import 'Application/StudentProviders/PasswordChangeProvider.dart';
import 'Application/StudentProviders/PaymentHistory.dart';
import 'Application/StudentProviders/ProfileProvider.dart';
import 'Application/StudentProviders/ReportCardProvider.dart';
import 'Application/StudentProviders/SiblingsProvider.dart';
import 'Application/StudentProviders/TimetableProvider.dart';
import 'Firebase_options.dart';
import 'Presentation/Admin/AdminHome.dart';
import 'Presentation/Login_Activation/ActivatePage.dart';
import 'Presentation/Login_Activation/Login_page.dart';
import 'Presentation/Staff/StaffHome.dart';
import 'Presentation/Student/Student_home.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  RemoteNotification notification = message.notification;
  print('Handling a background message ${message.messageId}');

  flutterLocalNotificationsPlugin.show(
    notification.hashCode,
    notification.title,
    notification.body,
    NotificationDetails(
      android: AndroidNotificationDetails(channel.id, channel.name,
          icon: 'launch_background', channelShowBadge: true),
    ),
  );
}

AndroidNotificationChannel channel;

FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  await FlutterDownloader.initialize(debug: true, ignoreSsl: true);
  if (!kIsWeb) {
    channel = const AndroidNotificationChannel(
      'offer_notification_channel', // id
      'offer notification channel', // 1

      importance: Importance.high,
    );

    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
  }
  if (Platform.isAndroid) {
    // await AndroidInAppWebViewController.setWebContentsDebuggingEnabled(true);
  }
  if (Platform.isAndroid) {
    //await AndroidInAppWebViewController.setWebContentsDebuggingEnabled(true);
  }
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((value) => runApp(GjInfoTech()));

// await FlutterDownloader.initialize(debug: true);
  //await Permission.storage.request();
  // await Permission.videos.request();

  // await Permission.photos.request();
  await Permission.notification.request();
  // await Permission.manageExternalStorage.request();
  //
  await Permission.storage.request();
  await Permission.accessMediaLocation.request();
  runApp(GjInfoTech());
}

class GjInfoTech extends StatefulWidget {
  // This widget is the root of your application.
  @override
  State<GjInfoTech> createState() => _GjInfoTechState();
}

class _GjInfoTechState extends State<GjInfoTech> {
  SharedPreferences prefs;
  _checkSession() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (prefs.getBool('activated') != null) {
      activated = true;
    }
  }

  bool activated;

  @override
  void initState() {
    Future.delayed(Duration.zero, () async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      if (prefs.getBool('activated') != null) {
        activated = true;
      }
    });
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification notification = message.notification;
      AndroidNotification android = message.notification?.android;
      if (notification != null && android != null && !kIsWeb) {
        flutterLocalNotificationsPlugin.show(
          notification.hashCode,
          notification.title,
          notification.body,
          NotificationDetails(
            android: AndroidNotificationDetails(
              channel.id,
              channel.name,
              icon: 'launch_background',
            ),
          ),
        );
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LoginProvider()),
        ChangeNotifierProvider(create: (context) => ProfileProvider()),
        ChangeNotifierProvider(create: (context) => NoticeProvider()),
        ChangeNotifierProvider(create: (context) => AttendenceProvider()),
        ChangeNotifierProvider(create: (context) => FeesProvider()),
        ChangeNotifierProvider(create: (context) => GalleryProvider()),
        ChangeNotifierProvider(create: (context) => ReportCardProvider()),
        ChangeNotifierProvider(create: (context) => Timetableprovider()),
        ChangeNotifierProvider(create: (context) => PasswordChangeprovider()),
        ChangeNotifierProvider(create: (context) => SibingsProvider()),
        ChangeNotifierProvider(create: (context) => StaffProfileProvider()),
        ChangeNotifierProvider(
            create: (context) => StudReportListProvider_stf()),
        ChangeNotifierProvider(create: (context) => MarkEntryProvider()),
        ChangeNotifierProvider(create: (context) => StaffTimetableProvider()),
        ChangeNotifierProvider(create: (context) => AttendenceStaffProvider()),
        ChangeNotifierProvider(create: (context) => FlashnewsProvider()),
        ChangeNotifierProvider(
            create: (context) => StaffNoticeboardSendProviders()),
        ChangeNotifierProvider(create: (context) => Screen_Search_Providers()),
        ChangeNotifierProvider(
            create: (context) => NotificationToGuardian_Providers()),
        ChangeNotifierProvider(
            create: (context) => TextSMS_ToGuardian_Providers()),
        ChangeNotifierProvider(create: (context) => GallerySendProvider_Stf()),
        ChangeNotifierProvider(
            create: (context) => MarkEntryReportProvider_stf()),
        ChangeNotifierProvider(create: (context) => StaffReportProviders()),
        ChangeNotifierProvider(create: (context) => DashboardAdmin()),
        ChangeNotifierProvider(create: (context) => SearchStaffProviders()),
        ChangeNotifierProvider(create: (context) => SchoolPhotoProviders()),
        ChangeNotifierProvider(create: (context) => GalleryProviderAdmin()),
        ChangeNotifierProvider(create: (context) => PaymentHistoryProvider()),
        ChangeNotifierProvider(create: (context) => NoticeBoardAdminProvider()),
        ChangeNotifierProvider(
            create: (context) => NotificationReceivedProviderStudent()),
        ChangeNotifierProvider(
            create: (context) => StaffNotificationScreenProvider()),
        ChangeNotifierProvider(
            create: (context) => NotificationToGuardianAdmin()),
        ChangeNotifierProvider(
            create: (context) => NotificationToStaffAdminProviders()),
        ChangeNotifierProvider(create: (context) => FeeReportProvider()),
        ChangeNotifierProvider(
            create: (context) => NoticeBoardListAdminProvider()),
        ChangeNotifierProvider(create: (context) => FlashNewsProviderAdmin()),
        ChangeNotifierProvider(
            create: (context) => TimeTableClassProvidersAdmin()),
        ChangeNotifierProvider(create: (context) => TimetableStaffProviders()),
        ChangeNotifierProvider(create: (context) => FeeDetailsProvider()),
        ChangeNotifierProvider(create: (context) => StudStatiticsProvider()),
        ChangeNotifierProvider(create: (context) => ConnectivityProvider()),
        ChangeNotifierProvider(create: (context) => FinalStatusProvider()),
        ChangeNotifierProvider(create: (context) => ModuleProviders()),
        ChangeNotifierProvider(create: (context) => Curriculamprovider()),
        ChangeNotifierProvider(
            create: (context) => StudNotificationCountProviders()),
        ChangeNotifierProvider(
            create: (context) => StaffNotificationCountProviders()),
        ChangeNotifierProvider(create: (context) => DiaryProvidersstud()),
        ChangeNotifierProvider(create: (context) => ExamTTAdmProviders()),
        ChangeNotifierProvider(create: (context) => ExamTTAdmProvidersStaff()),
        ChangeNotifierProvider(create: (context) => AttendanceReportProvider()),
        ChangeNotifierProvider(
            create: (context) => NoticeBoardProvidersSAdmin()),
        ChangeNotifierProvider(create: (context) => MobileAppCheckinProvider()),
        ChangeNotifierProvider(
            create: (context) => TokenExpiryCheckProviders()),
      ],
      child: MaterialApp(
        title: 'e-SS Connect',
        themeMode: ThemeMode.light,
        theme: ThemeData(
          primaryColor: UIGuide.light_Purple,
          inputDecorationTheme: InputDecorationTheme(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(color: Colors.black))),
        ),
        routes: routes,
        home: SplashFuturePage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

class SplashFuturePage extends StatefulWidget {
  SplashFuturePage({Key key}) : super(key: key);

  @override
  State<SplashFuturePage> createState() => _SplashFuturePageState();
}

class _SplashFuturePageState extends State<SplashFuturePage>
    with TickerProviderStateMixin {
  double _fontSize = 2;
  double _containerSize = 1.5;
  double _textOpacity = 0.0;
  double _containerOpacity = 0.0;

  AnimationController _controller;
  Animation<double> animation1;

  Future _checkSession() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getBool('activated') != null) {
      if (prefs.getString('accesstoken') != null) {
        var data = await parseJWT();
        if (data['role'] == "SystemAdmin") {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => AdminHome()),
          );
        } else if (data['role'] == "Guardian") {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => StudentHome()),
          );
        } else if (data['role'] == "Teacher") {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => StaffHome()),
          );
        } else if (data['role'] == "SchoolSuperAdmin") {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => SuperAdminHome()),
          );
        } else if (data['role'] == "SchoolHead") {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => SchoolHeadHomeScreen()),
          );
        } else if (data['role'] == "Student") {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => ChildHome()),
          );
        } else {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => LoginPage()),
          );
        }
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => LoginPage()),
        );
      }
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => ActivatePage()),
      );
    }
  }

  @override
  void initState() {
    super.initState();

    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));

    animation1 = Tween<double>(begin: 40, end: 20).animate(CurvedAnimation(
        parent: _controller, curve: Curves.fastLinearToSlowEaseIn))
      ..addListener(() {
        setState(() {
          _textOpacity = 1.0;
        });
      });

    _controller.forward();

    Timer(const Duration(seconds: 2), () {
      setState(() {
        _fontSize = 1.06;
      });
    });

    Timer(const Duration(seconds: 2), () {
      setState(() {
        _containerSize = 2;
        _containerOpacity = 1;
      });
    });

    Timer(const Duration(seconds: 3), () async {
      await Provider.of<TokenExpiryCheckProviders>(context, listen: false)
          .checkTokenExpired();
      await _checkSession();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: UIGuide.THEME_LIGHT,
      body: Stack(
        children: [
          Column(
            children: [
              AnimatedContainer(
                  duration: const Duration(milliseconds: 2000),
                  curve: Curves.fastLinearToSlowEaseIn,
                  height: _height / _fontSize),
              AnimatedOpacity(
                duration: const Duration(milliseconds: 1000),
                opacity: _textOpacity,
                child: Text(
                  'e-SS Connect',
                  style: TextStyle(
                    color: UIGuide.light_Purple,
                    fontWeight: FontWeight.bold,
                    fontSize: animation1?.value,
                  ),
                ),
              ),
            ],
          ),
          Center(
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 2000),
              curve: Curves.fastLinearToSlowEaseIn,
              opacity: _containerOpacity,
              child: AnimatedContainer(
                  duration: const Duration(milliseconds: 2000),
                  curve: Curves.fastLinearToSlowEaseIn,
                  height: _width / _containerSize,
                  width: _width / _containerSize,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Image.asset('assets/ESS-logo.png')),
            ),
          ),
        ],
      ),
    );
  }
}

class PageTransition extends PageRouteBuilder {
  final Widget page;

  PageTransition(this.page)
      : super(
          pageBuilder: (context, animation, anotherAnimation) => page,
          transitionDuration: const Duration(milliseconds: 2000),
          transitionsBuilder: (context, animation, anotherAnimation, child) {
            animation = CurvedAnimation(
              curve: Curves.fastLinearToSlowEaseIn,
              parent: animation,
            );
            return Align(
              alignment: Alignment.bottomCenter,
              child: SizeTransition(
                sizeFactor: animation,
                child: page,
                axisAlignment: 0,
              ),
            );
          },
        );
}
