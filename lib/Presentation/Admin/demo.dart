import 'dart:ui';

import 'package:essconnect/Constants.dart';
import 'package:essconnect/Presentation/Admin/AdminHome.dart';
import 'package:essconnect/Presentation/Student/Student_home.dart';
import 'package:essconnect/utils/constants.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:material_dialogs/material_dialogs.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';
import 'package:material_dialogs/widgets/buttons/icon_outline_button.dart';

class Demo extends StatefulWidget {
  const Demo({Key? key}) : super(key: key);

  @override
  State<Demo> createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      content: Container(
        height: size.height / 4.5,
        width: size.width * 3,
        child: Stack(
          clipBehavior: Clip.none,
          alignment: AlignmentDirectional.center,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: size.height / 10,
                ),
                const Text(
                  "TRANSACTION SUCCESS",
                  style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 20,
                      color: UIGuide.light_Purple),
                ),
                kheight20,
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(UIGuide.light_Purple),
                          ),
                          onPressed: () {
                            Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                    builder: (context) => AdminHome()),
                                (Route<dynamic> route) => false);
                          },
                          child: const Text(
                            'Back to Home',
                            style: TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: 18,
                                color: UIGuide.WHITE),
                          ))
                    ],
                  ),
                )
              ],
            ),
            Positioned(
              top: -190,
              child: CircleAvatar(
                  radius: 165,
                  backgroundColor: Colors.transparent,
                  child: LottieBuilder.asset(
                    'assets/89618-gopay-succesfull-payment.json',
                    // 'assets/79952-successful.json',
                    //height: 360, width: 300,
                    // width: 10,
                  )),
            )
          ],
        ),
      ),
    );
    // Widget build(BuildContext context) {
    //   return Scaffold(
    //     body: Center(
    //       child: Column(
    //         crossAxisAlignment: CrossAxisAlignment.center,
    //         mainAxisAlignment: MainAxisAlignment.center,
    //         children: [
    //           btn1(context),
    //           btn2(context),
    //           btn3(context),
    //           btn4(context),
    //         ],
    //       ),
    //     ),
    //   );
  }

  Widget btn1(BuildContext context) {
    return MaterialButton(
      color: Colors.grey[300],
      minWidth: 300,
      onPressed: () => Dialogs.materialDialog(
          msg: 'Are you sure ? you can\'t undo this',
          title: "Delete",
          color: Colors.white,
          context: context,
          dialogWidth: kIsWeb ? 0.3 : null,
          onClose: (value) => print("returned value is '$value'"),
          actions: [
            IconsOutlineButton(
              onPressed: () {
                Navigator.of(context).pop(['Test', 'List']);
              },
              text: 'Cancel',
              iconData: Icons.cancel_outlined,
              textStyle: TextStyle(color: Colors.grey),
              iconColor: Colors.grey,
            ),
            IconsButton(
              onPressed: () {},
              text: "Delete",
              iconData: Icons.delete,
              color: Colors.red,
              textStyle: TextStyle(color: Colors.white),
              iconColor: Colors.white,
            ),
          ]),
      child: Text("Show Material Dialog"),
    );
  }

  Widget btn3(BuildContext context) {
    return MaterialButton(
      minWidth: 300,
      color: Colors.grey[300],
      onPressed: () => Dialogs.materialDialog(
        color: Colors.white,
        msg: 'Congratulations, you won 500 points',
        title: 'Congratulations',
        lottieBuilder: Lottie.asset(
          'assets/79952-successful.json',
          fit: BoxFit.contain,
        ),
        dialogWidth: kIsWeb ? 0.3 : null,
        context: context,
        actions: [
          IconsButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            text: 'Claim',
            iconData: Icons.done,
            color: Colors.blue,
            textStyle: TextStyle(color: Colors.white),
            iconColor: Colors.white,
          ),
        ],
      ),
      child: Text("Show animations Material Dialog"),
    );
  }

  Widget btn4(BuildContext context) {
    return MaterialButton(
      color: Colors.grey[300],
      minWidth: 300,
      onPressed: () => Dialogs.bottomMaterialDialog(
        msg: 'Congratulations, you won 500 points',
        title: 'Congratulations',
        color: Colors.white,
        lottieBuilder: Lottie.asset(
          'assets/cong_example.json',
          fit: BoxFit.contain,
        ),
        context: context,
        actions: [
          IconsButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            text: 'Claim',
            iconData: Icons.done,
            color: Colors.blue,
            textStyle: TextStyle(color: Colors.white),
            iconColor: Colors.white,
          ),
        ],
      ),
      child: Text("Show animations Bottom Dialog"),
    );
  }
}





// import 'dart:async';
// import 'package:flutter/material.dart';

// import 'dart:convert';

// import 'package:webview_flutter/webview_flutter.dart';

// const String kNavigationExamplePage = '''
// <!DOCTYPE html><html>
// <head><title>Navigation Delegate Example</title></head>
// <body>
// <p>
// The navigation delegate is set to block navigation to the youtube website.
// </p>
// <ul>
// <ul><a href="https://www.youtube.com/">https://www.youtube.com/</a></ul>
// <ul><a href="https://www.google.com/">https://www.google.com/</a></ul>
// <ul><a href="https://www.google.com/">https://nodejs.org/en</a></ul>
// </ul>
// </body>
// </html>
// ''';

// class Demo extends StatefulWidget {
//   @override
//   _DemoState createState() => _DemoState();
// }

// WebViewController? controllerGlobal;

// _exitApp(BuildContext context) async {
//   if (await controllerGlobal!.canGoBack()) {
//     print("onwill goback");
//     controllerGlobal!.goBack();
//   } else {
//     // Scaffold.of(context).showSnackBar(
//     //   const SnackBar(content: Text("No back history item")),
//     // );
//     return Future.value(false);
//   }
// }

// class _DemoState extends State<Demo> {
//   final Completer<WebViewController> _controller =
//       Completer<WebViewController>();

//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//       onWillPop: () => _exitApp(context),
//       child: Scaffold(
//         // appBar: AppBar(
//         //   title: const Text('Flutter WebView example'),
//         //   // This drop down menu demonstrates that Flutter widgets can be shown over the web view.
//         //   actions: <Widget>[
//         //     NavigationControls(_controller.future),
//         //     SampleMenu(_controller.future),
//         //   ],
//         // ),
//         // We're using a Builder here so we have a context that is below the Scaffold
//         // to allow calling Scaffold.of(context) so we can show a snackbar.
//         body: Builder(builder: (BuildContext context) {
//           return WebView(
//             initialUrl: 'https://flutter.dev',
//             javascriptMode: JavascriptMode.unrestricted,
//             onWebViewCreated: (WebViewController webViewController) {
//               _controller.complete(webViewController);
//             },
//             // TODO(iskakaushik): Remove this when collection literals makes it to stable.
//             // ignore: prefer_collection_literals
//             javascriptChannels: <JavascriptChannel>[
//               _toasterJavascriptChannel(context),
//             ].toSet(),
//             navigationDelegate: (NavigationRequest request) {
//               if (request.url.startsWith('https://www.youtube.com/')) {
//                 print('blocking navigation to $request}');
//                 return NavigationDecision.prevent;
//               }
//               if (request.url.startsWith('https://flutter.dev/docs')) {
//                 print('blocking navigation to $request}');
//                 return NavigationDecision.prevent;
//               }
//               print('allowing navigation to $request');
//               return NavigationDecision.navigate;
//             },
//             onPageFinished: (String url) {
//               print('Page finished loading: $url');
//             },
//           );
//         }),
//         floatingActionButton: favoriteButton(),
//       ),
//     );
//   }

//   JavascriptChannel _toasterJavascriptChannel(BuildContext context) {
//     return JavascriptChannel(
//         name: 'Toaster',
//         onMessageReceived: (JavascriptMessage message) {
//           // Scaffold.of(context).showSnackBar(
//           //   SnackBar(content: Text(message.message)),
//           // );
//         });
//   }

//   Widget favoriteButton() {
//     return FutureBuilder<WebViewController>(
//         future: _controller.future,
//         builder: (BuildContext context,
//             AsyncSnapshot<WebViewController> controller) {
//           if (controller.hasData) {
//             return FloatingActionButton(
//               onPressed: () async {
//                 final String? url = await controller.data!.currentUrl();
//                 // Scaffold.of(context).showSnackBar(
//                 //   SnackBar(content: Text('Favorited $url')),
//                 // );
//               },
//               child: const Icon(Icons.favorite),
//             );
//           }
//           return Container();
//         });
//   }
// }

// enum MenuOptions {
//   showUserAgent,
//   listCookies,
//   clearCookies,
//   addToCache,
//   listCache,
//   clearCache,
//   navigationDelegate,
// }

// class SampleMenu extends StatelessWidget {
//   SampleMenu(this.controller);

//   final Future<WebViewController> controller;
//   final CookieManager cookieManager = CookieManager();

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<WebViewController>(
//       future: controller,
//       builder:
//           (BuildContext context, AsyncSnapshot<WebViewController> controller) {
//         return PopupMenuButton<MenuOptions>(
//           onSelected: (MenuOptions value) {
//             switch (value) {
//               case MenuOptions.showUserAgent:
//                 _onShowUserAgent(controller.data!, context);
//                 break;
//               case MenuOptions.listCookies:
//                 _onListCookies(controller.data!, context);
//                 break;
//               case MenuOptions.clearCookies:
//                 _onClearCookies(context);
//                 break;
//               case MenuOptions.addToCache:
//                 _onAddToCache(controller.data!, context);
//                 break;
//               case MenuOptions.listCache:
//                 _onListCache(controller.data!, context);
//                 break;
//               case MenuOptions.clearCache:
//                 _onClearCache(controller.data!, context);
//                 break;
//               case MenuOptions.navigationDelegate:
//                 _onNavigationDelegateExample(controller.data!, context);
//                 break;
//             }
//           },
//           itemBuilder: (BuildContext context) => <PopupMenuItem<MenuOptions>>[
//             PopupMenuItem<MenuOptions>(
//               value: MenuOptions.showUserAgent,
//               child: const Text('Show user agent'),
//               enabled: controller.hasData,
//             ),
//             const PopupMenuItem<MenuOptions>(
//               value: MenuOptions.listCookies,
//               child: Text('List cookies'),
//             ),
//             const PopupMenuItem<MenuOptions>(
//               value: MenuOptions.clearCookies,
//               child: Text('Clear cookies'),
//             ),
//             const PopupMenuItem<MenuOptions>(
//               value: MenuOptions.addToCache,
//               child: Text('Add to cache'),
//             ),
//             const PopupMenuItem<MenuOptions>(
//               value: MenuOptions.listCache,
//               child: Text('List cache'),
//             ),
//             const PopupMenuItem<MenuOptions>(
//               value: MenuOptions.clearCache,
//               child: Text('Clear cache'),
//             ),
//             const PopupMenuItem<MenuOptions>(
//               value: MenuOptions.navigationDelegate,
//               child: Text('Navigation Delegate example'),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   void _onShowUserAgent(
//       WebViewController controller, BuildContext context) async {
//     // Send a message with the user agent string to the Toaster JavaScript channel we registered
//     // with the WebView.
//     controller.evaluateJavascript(
//         'Toaster.postMessage("User Agent: " + navigator.userAgent);');
//   }

//   void _onListCookies(
//       WebViewController controller, BuildContext context) async {
//     final String cookies =
//         await controller.evaluateJavascript('document.cookie');
//     // Scaffold.of(context).showSnackBar(SnackBar(
//     //   content: Column(
//     //     mainAxisAlignment: MainAxisAlignment.end,
//     //     mainAxisSize: MainAxisSize.min,
//     //     children: <Widget>[
//     //       const Text('Cookies:'),
//     //       _getCookieList(cookies),
//     //     ],
//     //   ),
//     // ));
//   }

//   void _onAddToCache(WebViewController controller, BuildContext context) async {
//     await controller.evaluateJavascript(
//         'caches.open("test_caches_entry"); localStorage["test_localStorage"] = "dummy_entry";');
//     // Scaffold.of(context).showSnackBar(const SnackBar(
//     //   content: Text('Added a test entry to cache.'),
//     // ));
//   }

//   void _onListCache(WebViewController controller, BuildContext context) async {
//     await controller.evaluateJavascript('caches.keys()'
//         '.then((cacheKeys) => JSON.stringify({"cacheKeys" : cacheKeys, "localStorage" : localStorage}))'
//         '.then((caches) => Toaster.postMessage(caches))');
//   }

//   void _onClearCache(WebViewController controller, BuildContext context) async {
//     await controller.clearCache();
//     // Scaffold.of(context).showSnackBar(const SnackBar(
//     //   content: Text("Cache cleared."),
//     // ));
//   }

//   void _onClearCookies(BuildContext context) async {
//     final bool hadCookies = await cookieManager.clearCookies();
//     String message = 'There were cookies. Now, they are gone!';
//     if (!hadCookies) {
//       message = 'There are no cookies.';
//     }
//     // Scaffold.of(context).showSnackBar(SnackBar(
//     //   content: Text(message),
//     // ));
//   }

//   void _onNavigationDelegateExample(
//       WebViewController controller, BuildContext context) async {
//     final String contentBase64 =
//         base64Encode(const Utf8Encoder().convert(kNavigationExamplePage));
//     controller.loadUrl('data:text/html;base64,$contentBase64');
//   }

//   Widget _getCookieList(String cookies) {
//     if (cookies == null || cookies == '""') {
//       return Container();
//     }
//     final List<String> cookieList = cookies.split(';');
//     final Iterable<Text> cookieWidgets =
//         cookieList.map((String cookie) => Text(cookie));
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.end,
//       mainAxisSize: MainAxisSize.min,
//       children: cookieWidgets.toList(),
//     );
//   }
// }

// class NavigationControls extends StatelessWidget {
//   const NavigationControls(this._webViewControllerFuture)
//       : assert(_webViewControllerFuture != null);

//   final Future<WebViewController> _webViewControllerFuture;

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<WebViewController>(
//       future: _webViewControllerFuture,
//       builder:
//           (BuildContext context, AsyncSnapshot<WebViewController> snapshot) {
//         final bool webViewReady =
//             snapshot.connectionState == ConnectionState.done;
//         final WebViewController? controller = snapshot.data;
//         controllerGlobal = controller!;

//         return Row(
//           children: <Widget>[
//             IconButton(
//               icon: const Icon(Icons.arrow_back_ios),
//               onPressed: !webViewReady
//                   ? null
//                   : () async {
//                       if (await controller.canGoBack()) {
//                         controller.goBack();
//                       } else {
//                         // Scaffold.of(context).showSnackBar(
//                         //   const SnackBar(content: Text("No back history item")),
//                         // );
//                         return;
//                       }
//                     },
//             ),
//             IconButton(
//               icon: const Icon(Icons.arrow_forward_ios),
//               onPressed: !webViewReady
//                   ? null
//                   : () async {
//                       if (await controller.canGoForward()) {
//                         controller.goForward();
//                       } else {
//                         // Scaffold.of(context).showSnackBar(
//                         //   const SnackBar(
//                         //       content: Text("No forward history item")),
//                         // );
//                         return;
//                       }
//                     },
//             ),
//             IconButton(
//               icon: const Icon(Icons.replay),
//               onPressed: !webViewReady
//                   ? null
//                   : () {
//                       controller.reload();
//                     },
//             ),
//           ],
//         );
//       },
//     );
//   }
// }
// // class PageTransition extends PageRouteBuilder {
// //   final Widget page;

// //   PageTransition(this.page)
// //       : super(
// //           pageBuilder: (context, animation, anotherAnimation) => page,
// //           transitionDuration: Duration(milliseconds: 2000),
// //           transitionsBuilder: (context, animation, anotherAnimation, child) {
// //             animation = CurvedAnimation(
// //               curve: Curves.fastLinearToSlowEaseIn,
// //               parent: animation,
// //             );
// //             return Align(
// //               alignment: Alignment.bottomCenter,
// //               child: SizeTransition(
// //                 sizeFactor: animation,
// //                 child: page,
// //                 axisAlignment: 0,
// //               ),
// //             );
// //           },
// //         );
// // }

// // class SecondPage extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       backgroundColor: Colors.white,
// //       appBar: AppBar(
// //         brightness: Brightness.dark,
// //         backgroundColor: Colors.deepPurple,
// //         centerTitle: true,
// //         title: Text(
// //           'YOUR APP\'S NAME',
// //           style: TextStyle(
// //             color: Colors.white,
// //             fontWeight: FontWeight.bold,
// //             fontSize: 20,
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }



// // class _DemoState extends State<Demo> with TickerProviderStateMixin {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: Center(
// //         child: Column(
// //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// //           children: [
// //             Text(
// //               'Suppose this is an app in your Phone\'s Screen page.',
// //               textAlign: TextAlign.center,
// //               style: TextStyle(
// //                 fontSize: 17,
// //                 fontWeight: FontWeight.bold,
// //               ),
// //             ),
// //           OpenContainer(
// //               closedBuilder: (_, openContainer) {
// //                 return Container(
// //                   height: 80,
// //                   width: 80,
// //                   child: Center(
// //                     child: Text(
// //                       'App Logo',
// //                       style: TextStyle(
// //                         fontWeight: FontWeight.bold,
// //                       ),
// //                     ),
// //                   ),
// //                 );
// //               },
// //               openColor: Colors.white,
// //               closedElevation: 20,
// //               closedShape: RoundedRectangleBorder(
// //                   borderRadius: BorderRadius.circular(20)),
// //               transitionDuration: Duration(milliseconds: 700),
// //               openBuilder: (_, closeContainer) {
// //                 return SecondPage();
// //               },
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }

// // class SecondPage extends StatefulWidget {
// //   @override
// //   _SecondPageState createState() => _SecondPageState();
// // }

// // class _SecondPageState extends State<SecondPage> {
// //   @override
// //   void initState() {
// //     super.initState();

// //     Timer(Duration(milliseconds: 400), () {
// //       setState(() {
// //         _a = true;
// //       });
// //     });
// //     Timer(Duration(milliseconds: 400), () {
// //       setState(() {
// //         _b = true;
// //       });
// //     });
// //     Timer(Duration(milliseconds: 1300), () {
// //       setState(() {
// //         _c = true;
// //       });
// //     });
// //     Timer(Duration(milliseconds: 1700), () {
// //       setState(() {
// //         _e = true;
// //       });
// //     });
// //     Timer(Duration(milliseconds: 3400), () {
// //       setState(() {
// //         _d = true;
// //       });
// //     });
// //     Timer(Duration(milliseconds: 3850), () {
// //       setState(() {
// //         Navigator.of(context).pushReplacement(
// //           ThisIsFadeRoute(
// //             route: ThirdPage(), page: ,
// //           ),
// //         );
// //       });
// //     });
// //   }

// //   bool _a = false;
// //   bool _b = false;
// //   bool _c = false;
// //   bool _d = false;
// //   bool _e = false;

// //   @override
// //   void dispose() {
// //     super.dispose();
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     double _h = MediaQuery.of(context).size.height;
// //     double _w = MediaQuery.of(context).size.width;
// //     return Scaffold(
// //       backgroundColor: Colors.black,
// //       body: Center(
// //         child: Column(
// //           children: [
// //             AnimatedContainer(
// //               duration: Duration(milliseconds: _d ? 900 : 2500),
// //               curve: _d ? Curves.fastLinearToSlowEaseIn : Curves.elasticOut,
// //               height: _d
// //                   ? 0
// //                   : _a
// //                       ? _h / 2
// //                       : 20,
// //               width: 20,
// //               // color: Colors.deepPurpleAccent,
// //             ),
// //             AnimatedContainer(
// //               duration: Duration(
// //                   seconds: _d
// //                       ? 1
// //                       : _c
// //                           ? 2
// //                           : 0),
// //               curve: Curves.fastLinearToSlowEaseIn,
// //               height: _d
// //                   ? _h
// //                   : _c
// //                       ? 80
// //                       : 20,
// //               width: _d
// //                   ? _w
// //                   : _c
// //                       ? 200
// //                       : 20,
// //               decoration: BoxDecoration(
// //                   color: _b ? Colors.white : Colors.transparent,
// //                   // shape: _c? BoxShape.rectangle : BoxShape.circle,
// //                   borderRadius:
// //                       _d ? BorderRadius.only() : BorderRadius.circular(30)),
// //               child: Center(
// //                 child: _e
// //                     ? AnimatedTextKit(
// //                         totalRepeatCount: 1,
// //                         animatedTexts: [
// //                           FadeAnimatedText(
// //                             'APP NAME',
// //                             duration: Duration(milliseconds: 1700),
// //                             textStyle: TextStyle(
// //                               fontSize: 30,
// //                               fontWeight: FontWeight.w700,
// //                             ),
// //                           ),
// //                         ],
// //                       )
// //                     : SizedBox(),
// //               ),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }

// // class ThisIsFadeRoute extends PageRouteBuilder {
// //  late  Widget page;
// //   late Widget route;

// //   ThisIsFadeRoute({ this.page,  this.route})
// //       : super(
// //           pageBuilder: (
// //             BuildContext context,
// //             Animation<double> animation,
// //             Animation<double> secondaryAnimation,
// //           ) =>
// //               page,
// //           transitionsBuilder: (
// //             BuildContext context,
// //             Animation<double> animation,
// //             Animation<double> secondaryAnimation,
// //             Widget child,
// //           ) =>
// //               FadeTransition(
// //             opacity: animation,
// //             child: route,
// //           ),
// //         );
// // }

// // class ThirdPage extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('Go Back'),
// //         centerTitle: true,
// //         brightness: Brightness.dark,
// //         backgroundColor: Colors.black,
// //       ),
// //     );
// //   }
// // }




// //   @override
// //   Widget build(BuildContext context) {
// //     double _w = MediaQuery.of(context).size.width;
// //     return Scaffold(
// //       appBar: AppBar(
// //           title: Text("Go Back"),
// //           centerTitle: true,
// //           brightness: Brightness.dark),
// //       body: AnimationLimiter(
// //         child: ListView.builder(
// //           padding: EdgeInsets.all(_w / 30),
// //           physics:
// //               BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
// //           itemCount: 20,
// //           itemBuilder: (BuildContext context, int index) {
// //             return AnimationConfiguration.staggeredList(
// //               position: index,
// //               delay: Duration(milliseconds: 100),
// //               child: SlideAnimation(
// //                 duration: Duration(milliseconds: 2500),
// //                 curve: Curves.fastLinearToSlowEaseIn,
// //                 horizontalOffset: -300,
// //                 verticalOffset: -850,
// //                 child: Container(
// //                   margin: EdgeInsets.only(bottom: _w / 20),
// //                   height: _w / 4,
// //                   decoration: BoxDecoration(
// //                     color: Colors.white,
// //                     borderRadius: BorderRadius.all(Radius.circular(20)),
// //                     boxShadow: [
// //                       BoxShadow(
// //                         color: Colors.black.withOpacity(0.1),
// //                         blurRadius: 40,
// //                         spreadRadius: 10,
// //                       ),
// //                     ],
// //                   ),
// //                 ),
// //               ),
// //             );
// //           },
// //         ),
// //       ),
// //     );
// //   }
// // }
// //   late AnimationController controller1;
// //   late AnimationController controller2;
// //   late Animation<double> animation1;
// //   late Animation<double> animation2;
// //   late Animation<double> animation3;
// //   late Animation<double> animation4;

// //   @override
// //   void initState() {
// //     super.initState();

// //     controller1 = AnimationController(
// //       vsync: this,
// //       duration: Duration(
// //         seconds: 5,
// //       ),
// //     );
// //     animation1 = Tween<double>(begin: .1, end: .15).animate(
// //       CurvedAnimation(
// //         parent: controller1,
// //         curve: Curves.easeInOut,
// //       ),
// //     )
// //       ..addListener(() {
// //         setState(() {});
// //       })
// //       ..addStatusListener((status) {
// //         if (status == AnimationStatus.completed) {
// //           controller1.reverse();
// //         } else if (status == AnimationStatus.dismissed) {
// //           controller1.forward();
// //         }
// //       });
// //     animation2 = Tween<double>(begin: .02, end: .04).animate(
// //       CurvedAnimation(
// //         parent: controller1,
// //         curve: Curves.easeInOut,
// //       ),
// //     )..addListener(() {
// //         setState(() {});
// //       });

// //     controller2 = AnimationController(
// //       vsync: this,
// //       duration: Duration(
// //         seconds: 5,
// //       ),
// //     );
// //     animation3 = Tween<double>(begin: .41, end: .38).animate(CurvedAnimation(
// //       parent: controller2,
// //       curve: Curves.easeInOut,
// //     ))
// //       ..addListener(() {
// //         setState(() {});
// //       })
// //       ..addStatusListener((status) {
// //         if (status == AnimationStatus.completed) {
// //           controller2.reverse();
// //         } else if (status == AnimationStatus.dismissed) {
// //           controller2.forward();
// //         }
// //       });
// //     animation4 = Tween<double>(begin: 170, end: 190).animate(
// //       CurvedAnimation(
// //         parent: controller2,
// //         curve: Curves.easeInOut,
// //       ),
// //     )..addListener(() {
// //         setState(() {});
// //       });

// //     Timer(Duration(milliseconds: 2500), () {
// //       controller1.forward();
// //     });

// //     controller2.forward();
// //   }

// //   @override
// //   void dispose() {
// //     controller1.dispose();
// //     controller2.dispose();
// //     super.dispose();
// //   }

// //   bool _isObscure = false;
// //   bool isLoading = false;
// //   final _formKey = GlobalKey<FormState>();
// //   final _username = TextEditingController();
// //   final _password = TextEditingController();
// //   @override
// //   Widget build(BuildContext context) {
// //     Size size = MediaQuery.of(context).size;
// //     return Scaffold(
// //       backgroundColor: Color.fromARGB(255, 211, 228, 245),
// //       body: ScrollConfiguration(
// //         behavior: MyBehavior(),
// //         child: SingleChildScrollView(
// //           child: SizedBox(
// //             height: size.height,
// //             child: Stack(
// //               children: [
// //                 Positioned(
// //                   top: size.height * (animation2.value + .29),
// //                   left: size.width * .75,
// //                   child: CustomPaint(
// //                     painter: MyPainter(38),
// //                   ),
// //                 ),
// //                 Positioned(
// //                   top: size.height * .98,
// //                   left: size.width * .1,
// //                   child: CustomPaint(
// //                     painter: MyPainter(animation4.value - 30),
// //                   ),
// //                 ),
// //                 // Positioned(
// //                 //   top: size.height * .5,
// //                 //   left: size.width * (animation2.value + .8),
// //                 //   child: CustomPaint(
// //                 //     painter: MyPainter(30),
// //                 //   ),
// //                 // ),
// //                 // Positioned(
// //                 //   top: size.height * animation3.value,
// //                 //   left: size.width * (animation1.value + .1),
// //                 //   child: CustomPaint(
// //                 //     painter: MyPainter(60),
// //                 //   ),
// //                 // ),
// //                 Positioned(
// //                   top: size.height * .16,
// //                   left: size.width * .9,
// //                   child: CustomPaint(
// //                     painter: MyPainter(animation4.value - 80),
// //                   ),
// //                 ),
// //                 Form(
// //                   key: _formKey,
// //                   child: Column(
// //                     mainAxisAlignment: MainAxisAlignment.center,
// //                     children: [
// //                       Padding(
// //                         padding: const EdgeInsets.only(left: 30.0, right: 30),
// //                         child: TextFormField(
// //                           keyboardType: TextInputType.emailAddress,
// //                           controller: _username,
// //                           decoration: InputDecoration(
// //                             focusColor: Color.fromARGB(255, 23, 92, 196),
// //                             prefixIcon: const Icon(
// //                               Icons.person_outline_rounded,
// //                               color: UIGuide.light_Purple,
// //                             ),
// //                             border: OutlineInputBorder(
// //                               borderSide: const BorderSide(
// //                                   color: UIGuide.light_Purple, width: 2.0),
// //                               borderRadius: BorderRadius.circular(20.0),
// //                             ),
// //                             focusedBorder: OutlineInputBorder(
// //                               borderSide: const BorderSide(
// //                                   color: UIGuide.light_Purple, width: 2.0),
// //                               borderRadius: BorderRadius.circular(20.0),
// //                             ),
// //                             fillColor: Color.fromARGB(255, 158, 158, 158),
// //                             hintText: "Enter Your registered Email",
// //                             hintStyle: const TextStyle(
// //                               color: Colors.grey,
// //                               fontSize: 16,
// //                               fontFamily: "verdana_regular",
// //                               fontWeight: FontWeight.w400,
// //                             ),
// //                             labelText: 'Email',
// //                             labelStyle:
// //                                 const TextStyle(color: UIGuide.light_Purple),
// //                             enabledBorder: OutlineInputBorder(
// //                               borderRadius: BorderRadius.circular(20.0),
// //                               borderSide: BorderSide(
// //                                 color: UIGuide.light_Purple,
// //                                 width: 2.0,
// //                               ),
// //                             ),
// //                           ),
// //                           validator: (value) {
// //                             if (value == null || value.isEmpty) {
// //                               return 'Please enter Email';
// //                             }
// //                             return null;
// //                           },
// //                         ),
// //                       ),
// //                       kheight20,
// //                       Padding(
// //                         padding: const EdgeInsets.only(left: 30.0, right: 30),
// //                         child: TextFormField(
// //                           obscureText: !_isObscure,
// //                           controller: _password,
// //                           decoration: InputDecoration(
// //                             focusColor:
// //                                 const Color.fromARGB(255, 213, 215, 218),
// //                             prefixIcon: const Icon(
// //                               Icons.password_sharp,
// //                               color: UIGuide.light_Purple,
// //                             ),
// //                             // errorText: "Please enter valid username",
// //                             border: OutlineInputBorder(
// //                               borderRadius: BorderRadius.circular(10.0),
// //                             ),
// //                             focusedBorder: OutlineInputBorder(
// //                               borderSide: const BorderSide(
// //                                   color: UIGuide.light_Purple, width: 1.0),
// //                               borderRadius: BorderRadius.circular(10.0),
// //                             ),
// //                             fillColor: Colors.grey,
// //                             hintText: "Enter Your Password",
// //                             hintStyle: const TextStyle(
// //                               color: Colors.grey,
// //                               fontSize: 16,
// //                               fontFamily: "verdana_regular",
// //                               fontWeight: FontWeight.w400,
// //                             ),
// //                             labelText: 'Password',
// //                             labelStyle:
// //                                 const TextStyle(color: UIGuide.light_Purple),
// //                             suffixIcon: IconButton(
// //                               icon: Icon(
// //                                 _isObscure
// //                                     ? Icons.visibility
// //                                     : Icons.visibility_off,
// //                                 color: UIGuide.light_Purple,
// //                               ),
// //                               onPressed: () {
// //                                 setState(() {
// //                                   _isObscure = !_isObscure;
// //                                 });
// //                               },
// //                             ),
// //                             enabledBorder: OutlineInputBorder(
// //                               borderRadius: BorderRadius.circular(20.0),
// //                               borderSide: BorderSide(
// //                                 color: UIGuide.light_Purple,
// //                                 width: 2.0,
// //                               ),
// //                             ),
// //                           ),
// //                           validator: (value) {
// //                             if (value == null || value.isEmpty) {
// //                               return 'Please enter some text';
// //                             }
// //                             return null;
// //                           },
// //                         ),
// //                       ),

// //                       kheight20,
// //                       Row(
// //                         mainAxisAlignment: MainAxisAlignment.center,
// //                         children: [
// //                           SizedBox(
// //                             height: 40,
// //                             width: size.width / 2.5,
// //                             child: MaterialButton(
// //                                 shape: RoundedRectangleBorder(
// //                                     borderRadius: BorderRadius.all(
// //                                         Radius.circular(15.0))),
// //                                 color: UIGuide.light_Purple,
// //                                 onPressed: () async {
// //                                   if (_formKey.currentState!.validate()) {
// //                                     checkLogin(_username.text, _password.text);

// //                                     print(_username);
// //                                     print(_password);
// //                                   } else {
// //                                     print("Enter some value");
// //                                   }
// //                                 },
// //                                 child: Text(
// //                                   'LOGIN',
// //                                   style: TextStyle(color: Colors.white),
// //                                 )),
// //                           ),
// //                         ],
// //                       ),
// //                       //   ],
// //                       // ),
// //                     ],
// //                   ),
// //                 ),
// //               ],
// //             ),
// //           ),
// //         ),
// //       ),
// //     );
// //   }

// //   void checkLogin(String username, String password) async {
// //     SharedPreferences _pref = await SharedPreferences.getInstance();
// //     var headers = {'Content-Type': 'application/json'};
// //     var request = http.Request(
// //         'POST',
// //         Uri.parse(
// //             '${UIGuide.baseURL}/login?id=${_pref.getString('schoolId')}'));
// //     // print(request);
// //     request.body = json.encode({"email": username, "password": password});
// //     print(request.body);
// //     request.headers.addAll(headers);

// //     http.StreamedResponse response = await request.send();

// //     if (response.statusCode == 200 || response.statusCode == 201) {
// //       var data = jsonDecode(await response.stream.bytesToString());
// //       LoginModel res = LoginModel.fromJson(data);
// //       SharedPreferences prefs = await SharedPreferences.getInstance();
// //       prefs.setString('accesstoken', res.accessToken);
// //       //  print(res.accessToken);
// //       // await  Provider.of<ProfileProvider>(context).profileData();
// //       Provider.of<LoginProvider>(context, listen: false).getToken(context);
// //       var parsedResponse = await parseJWT();
// //       if (parsedResponse['role'] == "Guardian") {
// //         if (isLoading) return;
// //         setState(() {
// //           isLoading = true;
// //         });
// //         await Future.delayed(const Duration(seconds: 3));
// //         Navigator.pushReplacement(
// //             context,
// //             MaterialPageRoute(
// //                 builder: (BuildContext context) => StudentHome()));
// //       } else if (parsedResponse['role'] == "SystemAdmin") {
// //         if (isLoading) return;
// //         setState(() {
// //           isLoading = true;
// //         });
// //         await Future.delayed(const Duration(seconds: 3));
// //         Navigator.pushReplacement(context,
// //             MaterialPageRoute(builder: (BuildContext context) => AdminHome()));
// //       } else if (parsedResponse['role'] == "Teacher") {
// //         if (isLoading) return;
// //         setState(() {
// //           isLoading = true;
// //         });
// //         await Future.delayed(const Duration(seconds: 3));
// //         Navigator.pushReplacement(context,
// //             MaterialPageRoute(builder: (BuildContext context) => StaffHome()));
// //       } else {
// //         Navigator.pushReplacement(
// //             context,
// //             MaterialPageRoute(
// //                 builder: (BuildContext context) => StudentHome()));
// //         // Navigator.push(
// //         //     context, MaterialPageRoute(builder: (context) => StudentHome()));
// //       }
// //     } else {
// //       ScaffoldMessenger.of(context).showSnackBar(
// //           const SnackBar(content: Text("Invalid Username or Password")));
// //     }
// //   }
// // }

// // class MyPainter extends CustomPainter {
// //   final double radius;

// //   MyPainter(this.radius);

// //   @override
// //   void paint(Canvas canvas, Size size) {
// //     final paint = Paint()
// //       ..shader = LinearGradient(
// //               colors: [UIGuide.light_Purple, UIGuide.light_Purple],
// //               begin: Alignment.topLeft,
// //               end: Alignment.bottomRight)
// //           .createShader(Rect.fromCircle(
// //         center: Offset(0, 0),
// //         radius: radius,
// //       ));

// //     canvas.drawCircle(Offset.zero, radius, paint);
// //   }

// //   @override
// //   bool shouldRepaint(covariant CustomPainter oldDelegate) {
// //     return true;
// //   }
// // }

// // class MyBehavior extends ScrollBehavior {
// //   @override
// //   Widget buildViewportChrome(
// //       BuildContext context, Widget child, AxisDirection axisDirection) {
// //     return child;
// //   }
// // }
// //   super.initState();
// //   WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
// //     var p = Provider.of<SchoolPhotoProviders>(context, listen: false);
// //     p.stdReportSectionStaff();
// //     p.courseDrop.clear();
// //     p.divisionDrop.clear();
// //     p.dropDown.clear();
// //     p.stdReportInitialValues.clear();
// //     p.courselist.clear();
// //     p.divisionlist.clear();
// //   });
// // }

// // final TextEditingController controller = new TextEditingController();

// // List subjectData = [];
// // List diviData = [];
// // List courseData = [];

// // String courseId = '';

// // var i = 0;

// // @override
// // Widget build(BuildContext context) {
// //   var size = MediaQuery.of(context).size;
// //   return Scaffold(
// //       body: ListView(
// //     children: [
// //       Row(
// //         children: [
// //           Consumer<SchoolPhotoProviders>(
// //             builder: (context, value, child) => Padding(
// //               padding: const EdgeInsets.all(10.0),
// //               child: SizedBox(
// //                 width: size.width * .42,
// //                 height: 50,
// //                 child: MultiSelectDialogField(
// //                   // height: 200,
// //                   items: value.dropDown,

// //                   listType: MultiSelectListType.CHIP,
// //                   title: const Text(
// //                     "Select Section",
// //                     style: TextStyle(color: Colors.grey),
// //                   ),
// //                   selectedItemsTextStyle: TextStyle(
// //                       fontWeight: FontWeight.w900,
// //                       color: UIGuide.light_Purple),
// //                   confirmText: Text(
// //                     'OK',
// //                     style: TextStyle(color: UIGuide.light_Purple),
// //                   ),
// //                   cancelText: Text(
// //                     'Cancel',
// //                     style: TextStyle(color: UIGuide.light_Purple),
// //                   ),
// //                   separateSelectedItems: true,
// //                   //  checkColor: Colors.lightBlue,
// //                   decoration: BoxDecoration(
// //                     color: Colors.white,
// //                     borderRadius: const BorderRadius.all(Radius.circular(10)),
// //                     border: Border.all(
// //                       color: Colors.grey,
// //                       width: 2,
// //                     ),
// //                   ),
// //                   buttonIcon: const Icon(
// //                     Icons.arrow_drop_down_outlined,
// //                     color: Colors.grey,
// //                   ),
// //                   buttonText: Text(
// //                     "Select Section",
// //                     style: TextStyle(
// //                       color: Colors.black,
// //                       fontSize: 16,
// //                     ),
// //                   ),
// //                   chipDisplay: MultiSelectChipDisplay.none(),
// //                   onConfirm: (results) async {
// //                     subjectData = [];
// //                     for (i = 0; i < results.length; i++) {
// //                       StudReportSectionList data =
// //                           results[i] as StudReportSectionList;
// //                       print(data.text);
// //                       print(data.value);
// //                       subjectData.add(data.value);
// //                       subjectData.map((e) => data.value);
// //                       print("${subjectData.map((e) => data.value)}");
// //                     }
// //                     String section = subjectData.join('&');

// //                     await Provider.of<SchoolPhotoProviders>(context,
// //                             listen: false)
// //                         .getCourseList(section);
// //                     print("data $subjectData");

// //                     print(subjectData.join('&'));
// //                   },
// //                 ),
// //               ),
// //             ),
// //           ),
// //           Spacer(),
// //           Consumer<SchoolPhotoProviders>(
// //             builder: (context, value, child) => Padding(
// //               padding: const EdgeInsets.all(10.0),
// //               child: SizedBox(
// //                 width: size.width * .42,
// //                 height: 50,
// //                 child: MultiSelectDialogField(
// //                   // height: 200,
// //                   items: value.courseDrop,
// //                   listType: MultiSelectListType.CHIP,
// //                   title: const Text(
// //                     "Select Course",
// //                     style: TextStyle(color: Colors.black),
// //                   ),
// //                   // selectedColor: Color.fromARGB(255, 157, 232, 241),
// //                   selectedItemsTextStyle: TextStyle(
// //                       fontWeight: FontWeight.w900,
// //                       color: UIGuide.light_Purple),
// //                   confirmText: Text(
// //                     'OK',
// //                     style: TextStyle(color: UIGuide.light_Purple),
// //                   ),
// //                   cancelText: Text(
// //                     'Cancel',
// //                     style: TextStyle(color: UIGuide.light_Purple),
// //                   ),
// //                   separateSelectedItems: true,
// //                   decoration: BoxDecoration(
// //                     color: Colors.white,
// //                     borderRadius: const BorderRadius.all(Radius.circular(10)),
// //                     border: Border.all(
// //                       color: Colors.grey,
// //                       width: 2,
// //                     ),
// //                   ),
// //                   buttonIcon: const Icon(
// //                     Icons.arrow_drop_down_outlined,
// //                     color: Colors.grey,
// //                   ),
// //                   buttonText: Text(
// //                     "Select Course",
// //                     style: TextStyle(
// //                       color: Colors.black,
// //                       fontSize: 16,
// //                     ),
// //                   ),
// //                   chipDisplay: MultiSelectChipDisplay.none(),
// //                   onConfirm: (results) async {
// //                     diviData = [];
// //                     for (i = 0; i < results.length; i++) {
// //                       StudReportCourse data = results[i] as StudReportCourse;
// //                       print(data.value);
// //                       print(data.text);
// //                       diviData.add(data.value);
// //                       diviData.map((e) => data.value);
// //                       print("${diviData.map((e) => data.value)}");
// //                     }
// //                     String course = diviData.join('&');
// //                     await Provider.of<SchoolPhotoProviders>(context,
// //                             listen: false)
// //                         .getDivisionList(course);

// //                     print(diviData.join('&'));
// //                   },
// //                 ),
// //               ),
// //             ),
// //           )
// //         ],
// //       ),
// //       Row(
// //         children: [
// //           Consumer<SchoolPhotoProviders>(
// //             builder: (context, value, child) => Padding(
// //               padding: const EdgeInsets.only(left: 10.0, right: 10),
// //               child: SizedBox(
// //                 width: size.width * .42,
// //                 height: 50,
// //                 child: MultiSelectDialogField(
// //                   items: value.divisionDrop,
// //                   listType: MultiSelectListType.CHIP,
// //                   title: const Text(
// //                     "Select Division",
// //                     style: TextStyle(color: Colors.grey),
// //                   ),
// //                   // selectedColor: Color.fromARGB(255, 157, 232, 241),
// //                   selectedItemsTextStyle: TextStyle(
// //                       fontWeight: FontWeight.w900,
// //                       color: UIGuide.light_Purple),
// //                   confirmText: Text(
// //                     'OK',
// //                     style: TextStyle(color: UIGuide.light_Purple),
// //                   ),
// //                   cancelText: Text(
// //                     'Cancel',
// //                     style: TextStyle(color: UIGuide.light_Purple),
// //                   ),
// //                   separateSelectedItems: true,
// //                   decoration: BoxDecoration(
// //                     color: Colors.white,
// //                     borderRadius: const BorderRadius.all(Radius.circular(10)),
// //                     border: Border.all(
// //                       color: Colors.grey,
// //                       width: 2,
// //                     ),
// //                   ),
// //                   buttonIcon: const Icon(
// //                     Icons.arrow_drop_down_outlined,
// //                     color: Colors.grey,
// //                   ),
// //                   buttonText: const Text(
// //                     "Select Division",
// //                     style: TextStyle(
// //                       color: Colors.black,
// //                       fontSize: 16,
// //                     ),
// //                   ),
// //                   chipDisplay: MultiSelectChipDisplay.none(),
// //                   onConfirm: (results) {
// //                     courseData = [];
// //                     for (i = 0; i < results.length; i++) {
// //                       StudReportDivision data =
// //                           results[i] as StudReportDivision;
// //                       print(data.text);
// //                       print(data.value);
// //                       courseData.add(data.value);
// //                       courseData.map((e) => data.value);
// //                       print("${courseData.map((e) => data.value)}");
// //                     }
// //                     String div = courseData.join('&');
// //                     // Provider.of<SchoolPhotoProviders>(context, listen: false)
// //                     //     .getCourseList(div);
// //                     print("data $courseData");

// //                     print(courseData.join('&'));
// //                   },
// //                 ),
// //               ),
// //             ),
// //           ),
// //           Spacer(),
// //           Padding(
// //             padding: const EdgeInsets.only(left: 10.0, right: 10),
// //             child: SizedBox(
// //               width: size.width * .42,
// //               height: 44,
// //               child: MaterialButton(
// //                 shape: RoundedRectangleBorder(
// //                     borderRadius: BorderRadius.all(Radius.circular(10.0))),
// //                 onPressed: () {},
// //                 color: UIGuide.THEME_LIGHT,
// //                 child: Text('View'),
// //               ),
// //             ),
// //           )
// //         ],
// //       ),
// //       TextField(
// //           controller: controller,
// //           decoration: new InputDecoration(
// //               hintText: "Password",
// //               border: new OutlineInputBorder(borderSide: BorderSide()))),
// //       kheight20,
// //       FlutterPwValidator(
// //         controller: controller,
// //         minLength: 8,
// //         uppercaseCharCount: 1,
// //         numericCharCount: 1,
// //         specialCharCount: 1,
// //         normalCharCount: 3,
// //         width: 300,
// //         height: 120,
// //         onSuccess: () {
// //           print("MATCHED");
// //           ScaffoldMessenger.of(context).showSnackBar(
// //               new SnackBar(content: new Text("Password is matched")));
// //         },
// //         onFail: () {
// //           ScaffoldMessenger.of(context).showSnackBar(
// //               new SnackBar(content: new Text("Password not matched")));
// //           print("NOT MATCHED");
// //         },
// //       ),
// //     ],
// //   ));
// // }
