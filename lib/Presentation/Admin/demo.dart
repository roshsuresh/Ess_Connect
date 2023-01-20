// import 'package:essconnect/Application/AdminProviders/Attendanceprovider.dart';
// import 'package:essconnect/Constants.dart';
// import 'package:essconnect/utils/constants.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class SMSFormats extends StatefulWidget {
//   SMSFormats({Key? key}) : super(key: key);

//   @override
//   State<SMSFormats> createState() => _SMSFormatsState();
// }

// class _SMSFormatsState extends State<SMSFormats> {
//   final formatController = TextEditingController();
//   final formatController1 = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     var size = MediaQuery.of(context).size;
//     WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
//       var p = Provider.of<AttendanceReportProvider>(context, listen: false);
//       p.clearSMSList();
//       p.viewSMSFormat();
//     });
//     return Scaffold(
//         appBar: AppBar(
//           title: const Text(
//             'Send SMS',
//             style: TextStyle(fontSize: 20),
//           ),
//           titleSpacing: 00.0,
//           centerTitle: true,
//           toolbarHeight: 60.2,
//           toolbarOpacity: 0.8,
//           shape: const RoundedRectangleBorder(
//             borderRadius: BorderRadius.only(
//                 bottomRight: Radius.circular(25),
//                 bottomLeft: Radius.circular(25)),
//           ),
//           backgroundColor: UIGuide.light_Purple,
//         ),
//         body: ListView(
//           children: [
//             kheight10,
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 SizedBox(
//                   height: 50,
//                   width: MediaQuery.of(context).size.width * 0.60,
//                   child: Consumer<AttendanceReportProvider>(
//                       builder: (context, snapshot, child) {
//                     return InkWell(
//                       onTap: () {
//                         showDialog(
//                             context: context,
//                             builder: (context) {
//                               return Dialog(
//                                   child: Container(
//                                 child: Column(
//                                   mainAxisSize: MainAxisSize.min,
//                                   children: [
//                                     ListView.builder(
//                                         shrinkWrap: true,
//                                         itemCount: snapshot.formatlist.isEmpty
//                                             ? 0
//                                             : snapshot.formatlist.length,
//                                         itemBuilder: (context, index) {
//                                           return ListTile(
//                                             onTap: () async {
//                                               formatController1.clear();
//                                               formatController.text =
//                                                   await snapshot
//                                                           .formatlist[index]
//                                                           .value ??
//                                                       '--';
//                                               formatController1.text =
//                                                   await snapshot
//                                                           .formatlist[index]
//                                                           .text ??
//                                                       '--';
//                                               await snapshot.getSMSContent(
//                                                   formatController.text);

//                                               Navigator.of(context).pop();
//                                             },
//                                             title: Text(
//                                               snapshot.formatlist[index].text ??
//                                                   '--',
//                                               textAlign: TextAlign.center,
//                                             ),
//                                           );
//                                         }),
//                                   ],
//                                 ),
//                               ));
//                             });
//                       },
//                       child: Padding(
//                         padding: const EdgeInsets.all(5.0),
//                         child: Column(
//                           children: [
//                             Container(
//                               decoration: BoxDecoration(
//                                 border: Border.all(
//                                     color: UIGuide.light_Purple, width: 1),
//                               ),
//                               height: 40,
//                               child: TextField(
//                                 textAlign: TextAlign.center,
//                                 controller: formatController1,
//                                 decoration: const InputDecoration(
//                                   contentPadding:
//                                       EdgeInsets.only(left: 0, top: 0),
//                                   floatingLabelBehavior:
//                                       FloatingLabelBehavior.never,
//                                   filled: true,
//                                   fillColor: Color.fromARGB(255, 238, 237, 237),
//                                   border: OutlineInputBorder(),
//                                   labelText: "  Select Format",
//                                   hintText: "Format",
//                                 ),
//                                 enabled: false,
//                               ),
//                             ),
//                             SizedBox(
//                               height: 0,
//                               child: TextField(
//                                 textAlign: TextAlign.center,
//                                 controller: formatController,
//                                 decoration: const InputDecoration(
//                                   filled: true,
//                                   fillColor: Color.fromARGB(255, 238, 237, 237),
//                                   border: OutlineInputBorder(),
//                                   labelText: "",
//                                   hintText: "",
//                                 ),
//                                 enabled: false,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     );
//                   }),
//                 ),
//               ],
//             ),
//             kheight10,
//             Consumer<AttendanceReportProvider>(
//               builder: (context, value, child) => value.smsBody == null
//                   ? Container(
//                       height: 0,
//                       width: 0,
//                     )
//                   : Padding(
//                       padding: const EdgeInsets.all(3.0),
//                       child: Container(
//                           width: size.width,
//                           height: 100,
//                           decoration: BoxDecoration(
//                               border: Border.all(color: UIGuide.BLACK),
//                               borderRadius: BorderRadius.circular(10)),
//                           child: Padding(
//                             padding: const EdgeInsets.all(6.0),
//                             child: Text(
//                               value.smsBody ?? '',
//                               maxLines: 5,
//                               overflow: TextOverflow.ellipsis,
//                             ),
//                           )),
//                     ),
//             )
//           ],
//         ));
//   }
// }
