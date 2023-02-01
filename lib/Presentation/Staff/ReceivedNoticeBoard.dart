import 'dart:io';
import 'dart:isolate';
import 'dart:ui';

import 'package:essconnect/Application/Staff_Providers/NoticeboardSend.dart';
import 'package:essconnect/Constants.dart';
import 'package:essconnect/utils/LoadingIndication.dart';
import 'package:essconnect/utils/TextWrap(moreOption).dart';
import 'package:essconnect/utils/constants.dart';
import 'package:essconnect/utils/spinkit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:material_dialogs/material_dialogs.dart';
import 'package:path_provider/path_provider.dart';

import 'package:photo_view/photo_view.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class StaffNoticeBoardReceived extends StatelessWidget {
  StaffNoticeBoardReceived({Key? key}) : super(key: key);
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    Provider.of<StaffNoticeboardSendProviders>(context, listen: false)
        .getnoticeList();
    var size = MediaQuery.of(context).size;
    var width = size.width;
    return Consumer<StaffNoticeboardSendProviders>(builder: (_, value, child) {
      return value.loadingg
          ? spinkitLoader()
          : staffNoticeView == null || staffNoticeView!.length == 0
              ? Center(
                  child: Container(
                    child: LottieBuilder.network(
                        'https://assets2.lottiefiles.com/private_files/lf30_lkquf6qz.json'),
                  ),
                )
              : ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount:
                      staffNoticeView == null ? 0 : staffNoticeView!.length,
                  itemBuilder: (BuildContext context, index) {
                    var noticeattach =
                        staffNoticeView![index]['noticeId'] == null
                            ? '--'
                            : staffNoticeView![index]['noticeId'].toString();

                    String createddate =
                        staffNoticeView![index]["entryDate"] ?? '--';
                    // print(createddate);
                    // var updatedDate = DateFormat('yyyy-MM-dd').parse(createddate);
                    // String newDate = updatedDate.toString();
                    String finalCreatedDate =
                        createddate.replaceRange(11, 19, '');

                    return Padding(
                      padding: const EdgeInsets.only(
                          left: 6.0, right: 6, bottom: 3, top: 3),
                      child: Container(
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 234, 234, 236),
                            border: Border.all(
                                color:
                                    const Color.fromARGB(255, 136, 187, 235)),
                            borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(20),
                                bottomLeft: Radius.circular(20))),
                        width: size.width,
                        child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Container(
                            width: size.width - 4,
                            decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 255, 255, 255),
                                // border: Border.all(
                                //     color: UIGuide.light_Purple),
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(20),
                                    bottomLeft: Radius.circular(20))),
                            child: Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Row(
                                      children: [
                                        const Text('📌  '),
                                        Flexible(
                                          child: RichText(
                                            overflow: TextOverflow.ellipsis,
                                            strutStyle: const StrutStyle(
                                                fontSize: 14.0),
                                            text: TextSpan(
                                                style: const TextStyle(
                                                    color: UIGuide.light_Purple,
                                                    fontWeight:
                                                        FontWeight.w500),
                                                text: staffNoticeView![index]
                                                            ['title'] ==
                                                        null
                                                    ? '--'
                                                    : staffNoticeView![index]
                                                            ['title']
                                                        .toString()
                                                // value.noticeBoard[index].title ?? '--'
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  kheight10,
                                  TextWrapper(
                                    text: staffNoticeView![index]['matter'] ==
                                            null
                                        ? '--'
                                        : staffNoticeView![index]['matter']
                                            .toString(),
                                    fSize: 14,
                                  ),
                                  kheight10,
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      kWidth,
                                      Text(
                                        finalCreatedDate,
                                        //  value.noticeBoard[index].entryDate ?? '--',
                                        style: const TextStyle(fontSize: 12),
                                      ),
                                      const Spacer(), kWidth, kWidth, kWidth,
                                      kWidth,
                                      Text(
                                        staffNoticeView![index]['staffName'] ==
                                                null
                                            ? '--'
                                            : staffNoticeView![index]
                                                    ['staffName']
                                                .toString(),
                                        //   value.noticeBoard[index].staffName ?? '--',
                                        style: const TextStyle(fontSize: 12),
                                      ),
                                      //kWidth
                                      const Spacer(),
                                      GestureDetector(
                                        onTap: () async {
                                          await Provider.of<
                                                      StaffNoticeboardSendProviders>(
                                                  context,
                                                  listen: false)
                                              .staffNoticeBoardAttach(
                                                  noticeattach.toString());
                                          if (value.extension.toString() ==
                                              '.pdf') {
                                            final result = value.url.toString();
                                            final name = value.name.toString();
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      PDFDownloadStaff()),
                                            );
                                          } else {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      PdfViewPageStaff()),
                                            );
                                          }
                                        },
                                        child: const Icon(
                                            Icons.remove_red_eye_outlined),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );

                    //  Stack(
                    //   children: [
                    //     Padding(
                    //       padding: const EdgeInsets.all(8.0),
                    //       child: Container(
                    //         width: width,
                    //         //   height: 200,
                    //         decoration: BoxDecoration(
                    //             color: const Color.fromARGB(255, 245, 241, 241),
                    //             border: Border.all(
                    //                 color: const Color.fromARGB(255, 167, 166, 166)),
                    //             borderRadius: const BorderRadius.all(Radius.circular(5))),
                    //         child: Column(
                    //           crossAxisAlignment: CrossAxisAlignment.start,
                    //           children: [
                    //             Padding(
                    //               padding: const EdgeInsets.all(4.0),
                    //               child: Row(
                    //                 children: [
                    //                   kWidth,
                    //                   const Text('📌  '),
                    //                   Flexible(
                    //                     child: RichText(
                    //                       overflow: TextOverflow.ellipsis,
                    //                       strutStyle: const StrutStyle(fontSize: 14.0),
                    //                       text: TextSpan(
                    //                           style: const TextStyle(
                    //                               color: Colors.black,
                    //                               fontWeight: FontWeight.w500),
                    //                           text:
                    //                               staffNoticeView![index]['title'] == null
                    //                                   ? '--'
                    //                                   : staffNoticeView![index]['title']
                    //                                       .toString()
                    //                           // value.noticeBoard[index].title ?? '--'
                    //                           ),
                    //                     ),
                    //                   ),
                    //                   //Spacer(),
                    //                 ],
                    //               ),
                    //             ),
                    //             Padding(
                    //               padding: const EdgeInsets.all(4.0),
                    //               child: Container(
                    //                 //height: 132,
                    //                 width: width - 15,
                    //                 decoration: BoxDecoration(
                    //                     color: const Color.fromARGB(255, 230, 225, 230),
                    //                     border: Border.all(
                    //                         color:
                    //                             const Color.fromARGB(255, 215, 207, 236)),
                    //                     borderRadius:
                    //                         const BorderRadius.all(Radius.circular(4))),
                    //                 child: Column(
                    //                   crossAxisAlignment: CrossAxisAlignment.start,
                    //                   children: [
                    //                     TextWrapper(
                    //                       text: staffNoticeView![index]['matter'] == null
                    //                           ? '--'
                    //                           : staffNoticeView![index]['matter']
                    //                               .toString(),
                    //                       fSize: 14,
                    //                       //value.noticeBoard[index].matter ?? '--'
                    //                     )
                    //                   ],
                    //                 ),
                    //               ),
                    //             ),
                    //             Row(
                    //               crossAxisAlignment: CrossAxisAlignment.end,
                    //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //               children: [
                    //                 kWidth,
                    //                 Text(
                    //                   staffNoticeView![index]['entryDate'] == null
                    //                       ? '--'
                    //                       : staffNoticeView![index]['entryDate']
                    //                           .toString(),
                    //                   //  value.noticeBoard[index].entryDate ?? '--',
                    //                   style: const TextStyle(fontSize: 12),
                    //                 ),
                    //                 const Spacer(), kWidth, kWidth, kWidth, kWidth,
                    //                 Text(
                    //                   staffNoticeView![index]['staffName'] == null
                    //                       ? '--'
                    //                       : staffNoticeView![index]['staffName']
                    //                           .toString(),
                    //                   //   value.noticeBoard[index].staffName ?? '--',
                    //                   style: const TextStyle(fontSize: 12),
                    //                 ),
                    //                 //kWidth
                    //                 const Spacer(),
                    //                 GestureDetector(
                    //                   onTap: () async {
                    //                     await Provider.of<StaffNoticeboardSendProviders>(
                    //                             context,
                    //                             listen: false)
                    //                         .staffNoticeBoardAttach(
                    //                             noticeattach.toString());
                    //                     if (value.extension.toString() == '.pdf') {
                    //                       final result = value.url.toString();
                    //                       final name = value.name.toString();

                    //                       Navigator.push(
                    //                         context,
                    //                         MaterialPageRoute(
                    //                             builder: (context) => PDFDownloadStaff()),
                    //                       );
                    //                     } else {
                    //                       Navigator.push(
                    //                         context,
                    //                         MaterialPageRoute(
                    //                             builder: (context) => PdfViewPageStaff()),
                    //                       );
                    //                     }
                    //                   },
                    //                   child: const Icon(Icons.remove_red_eye_outlined),
                    //                 ),
                    //               ],
                    //             )
                    //           ],
                    //         ),
                    //       ),
                    //     ),
                    //   ],
                    // );
                  },
                );
    });
  }
}

class PDFDownloadStaff extends StatefulWidget {
  PDFDownloadStaff({
    Key? key,
  }) : super(key: key);
  static void downloadCallback(
      String id, DownloadTaskStatus status, int progress) {
    final SendPort send =
        IsolateNameServer.lookupPortByName('downloader_send_port')!;
    send.send([id, status, progress]);
  }

  @override
  State<PDFDownloadStaff> createState() => _PDFDownloadStaffState();
}

class _PDFDownloadStaffState extends State<PDFDownloadStaff> {
  final ReceivePort _port = ReceivePort();
  @override
  void initState() {
    super.initState();

    IsolateNameServer.registerPortWithName(
        _port.sendPort, 'downloader_send_port');
    _port.listen((dynamic data) {
      String id = data[0];
      DownloadTaskStatus status = data[1];
      int progress = data[2];

      setState(() {});
    });

    FlutterDownloader.registerCallback(PDFDownloadStaff.downloadCallback);
  }

  @pragma('vm:entry-point')
  static void downloadCallback(
      String id, DownloadTaskStatus status, int progress) {
    final SendPort? send =
        IsolateNameServer.lookupPortByName('downloader_send_port');
    send!.send([id, status, progress]);
  }

  @override
  void dispose() {
    IsolateNameServer.removePortNameMapping('downloader_send_port');
    super.dispose();
  }

  Future<void> requestDownload(String _url, String _name) async {
    final dir = await getExternalStorageDirectory();
    var _localPath = dir!.path;
    print("pathhhh  $_localPath");
    final savedDir = Directory(_localPath);
    await savedDir.create(recursive: true).then((value) async {
      String? _taskid = await FlutterDownloader.enqueue(
        savedDir: _localPath,
        url: _url,
        fileName: "$_name.pdf",
        showNotification: true,
        openFileFromNotification: true,
      );

      print(_taskid);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<StaffNoticeboardSendProviders>(
      builder: (context, value, child) => Scaffold(
          appBar: AppBar(
            title: const Text(''),
            titleSpacing: 00.0,
            centerTitle: true,
            toolbarHeight: 50.2,
            toolbarOpacity: 0.8,
            backgroundColor: UIGuide.light_Purple,
            actions: [
              Padding(
                  padding: const EdgeInsets.only(right: 15.0),
                  child: IconButton(
                      onPressed: () async {
                        await requestDownload(
                          value.url == null ? '--' : value.url.toString(),
                          value.idd == null
                              ? '---'
                              : value.idd.toString() + value.name.toString(),
                        );
                      },
                      icon: const Icon(Icons.download_outlined))),
            ],
          ),
          body: SfPdfViewer.network(
            value.url == null ? '--' : value.url.toString(),
          )),
    );
  }
}

class PdfViewPageStaff extends StatelessWidget {
  PdfViewPageStaff({Key? key}) : super(key: key);

  bool isLoading = false;

  imageview(String result) {
    return Scaffold(
      body: isLoading
          ? spinkitLoader()
          : Center(
              child: Container(
                  child: PhotoView(
                loadingBuilder: (context, event) {
                  return spinkitLoader();
                },
                imageProvider: NetworkImage(
                  result == null
                      ? 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSlmeGlXoJwwpbCE9jGgHgZ2XaE5nnPUSomkZz_vZT7&s'
                      : result.toString(),
                ),
              )),
            ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<StaffNoticeboardSendProviders>(
        builder: (context, provider, _) {
      if (provider.extension.toString() == '.jpg') {
        final imgResult = provider.url.toString();
        return imageview(imgResult);
      } else if (provider.extension.toString() == '.png') {
        final imgResult2 = provider.url.toString();
        return imageview(imgResult2);
      } else if (provider.extension.toString() == '.jpeg') {
        final imgResult3 = provider.url.toString();
        return imageview(imgResult3);
      } else if (provider.extension.toString() == '.jfif') {
        final imgResult4 = provider.url.toString();
        return imageview(imgResult4);
      } else {
        return const Scaffold(
          body: Center(
            child: Text(
              'No Attachment ',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
            ),
          ),
        );
      }
    });
  }
}
