// import 'package:essconnect/utils/constants.dart';
// import 'package:flutter/material.dart';
// import 'package:webview_flutter/webview_flutter.dart';
//
// class LoginAdminWeb extends StatelessWidget {
//   LoginAdminWeb({Key? key, required this.schdomain}) : super(key: key);
//   String schdomain;
//
//   late WebViewController _controller;
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         appBar: AppBar(
//           backgroundColor: UIGuide.light_Purple,
//         ),
//         body: Center(
//           child: WebView(
//             initialUrl: 'https://$schdomain.esstestonline.in/login',
//             javascriptMode: JavascriptMode.unrestricted,
//             onWebViewCreated: (WebViewController webViewController) {
//               _controller = webViewController;
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }
