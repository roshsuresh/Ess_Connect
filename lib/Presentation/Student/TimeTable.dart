import 'package:essconnect/utils/spinkit.dart';
import 'package:flutter/material.dart';
import 'package:material_dialogs/material_dialogs.dart';
import 'package:pdfdownload/pdfdownload.dart';
import 'package:photo_view/photo_view.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import '../../Application/StudentProviders/TimetableProvider.dart';
import '../../Constants.dart';
import '../../utils/constants.dart';

class Timetable extends StatelessWidget {
  const Timetable({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'TimeTable',
          ),
          titleSpacing: 00.0,
          centerTitle: true,
          toolbarHeight: 45.2,
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
                text: "Class Timetable",
              ),
              Tab(text: "Exam Timetable"),
            ],
          ),
          backgroundColor: UIGuide.light_Purple,
        ),
        body: TabBarView(
          children: [Classtimetable(), Examtimetable()],
        ),
      ),
    );
  }
}

class Classtimetable extends StatefulWidget {
  Classtimetable({Key? key}) : super(key: key);

  @override
  State<Classtimetable> createState() => _ClasstimetableState();
}

class _ClasstimetableState extends State<Classtimetable> {
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await Provider.of<Timetableprovider>(context, listen: false)
          .getDivisionId();
      var dividd =
          await Provider.of<Timetableprovider>(context, listen: false).divIDD ??
              '--';
      await Provider.of<Timetableprovider>(context, listen: false)
          .getTimeTable(dividd);
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Consumer<Timetableprovider>(
          builder: (context, value, child) => value.loading
              ? spinkitLoader()
              : value.url == null
                  ? LottieBuilder.network(
                      'https://assets2.lottiefiles.com/private_files/lf30_lkquf6qz.json')
                  : ListView(
                      children: [
                        kheight20,
                        Table(
                          border: TableBorder.all(
                              color: const Color.fromARGB(255, 255, 255, 255)),
                          columnWidths: const {
                            0: FlexColumnWidth(4),
                            1: FlexColumnWidth(2),
                          },
                          children: const [
                            TableRow(
                                decoration: BoxDecoration(
                                  color: UIGuide.light_black,
                                ),
                                children: [
                                  SizedBox(
                                    height: 30,
                                    child: Center(
                                      child: Text(
                                        'Class TimeTable',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 30,
                                    child: Center(
                                        child: Text(
                                      'View',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700),
                                    )),
                                  ),
                                ]),
                          ],
                        ),
                        Consumer<Timetableprovider>(
                          builder: (context, value, child) {
                            return GestureDetector(
                              child: Table(
                                border: TableBorder.all(
                                    color: const Color.fromARGB(
                                        255, 255, 255, 255)),
                                columnWidths: const {
                                  0: FlexColumnWidth(4),
                                  1: FlexColumnWidth(2),
                                },
                                children: [
                                  TableRow(
                                      decoration: const BoxDecoration(
                                        color:
                                            Color.fromARGB(255, 245, 242, 242),
                                      ),
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Center(
                                            child: Text(
                                              value.name == null
                                                  ? '--'
                                                  : value.name.toString(),
                                              style:
                                                  const TextStyle(fontSize: 15),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: SizedBox(
                                            height: 25,
                                            width: 25,
                                            // color: Color.fromARGB(
                                            //     255, 241, 241, 241),
                                            child: LottieBuilder.network(
                                                        "https://assets2.lottiefiles.com/temp/lf20_D0nz3r.json") ==
                                                    null
                                                ? const Icon(Icons
                                                    .remove_red_eye_outlined)
                                                : LottieBuilder.network(
                                                    "https://assets2.lottiefiles.com/temp/lf20_D0nz3r.json"),
                                          ),
                                        ),
                                      ]),
                                ],
                              ),
                              onTap: () async {
                                if (value.extension == '.pdf') {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => PdfDownloader()),
                                  );
                                } else {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => PdfViewPages()),
                                  );
                                }
                              },
                            );
                          },
                        )
                      ],
                    ),
        ),
      ),
    );
  }
}

class Examtimetable extends StatefulWidget {
  Examtimetable({Key? key}) : super(key: key);

  @override
  State<Examtimetable> createState() => _ExamtimetableState();
}

class _ExamtimetableState extends State<Examtimetable> {
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      Provider.of<Timetableprovider>(context, listen: false).examList.clear();
      await Provider.of<Timetableprovider>(context, listen: false)
          .getDivisionId();
      var dividd =
          await Provider.of<Timetableprovider>(context, listen: false).divIDD ??
              '--';
      await Provider.of<Timetableprovider>(context, listen: false)
          .getExamTimeTable(dividd);
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Consumer<Timetableprovider>(
          builder: (context, value, child) => value.loading
              ? spinkitLoader()
              : ListView(
                  children: [
                    kheight20,
                    Table(
                      border: TableBorder.all(
                          color: Color.fromARGB(255, 255, 255, 255)),
                      columnWidths: const {
                        0: FlexColumnWidth(4),
                        1: FlexColumnWidth(2),
                      },
                      children: const [
                        TableRow(
                            decoration: BoxDecoration(
                              color: UIGuide.light_black,
                            ),
                            children: [
                              SizedBox(
                                height: 30,
                                child: Center(
                                  child: Text(
                                    'Exam TimeTable',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w700),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 30,
                                child: Center(
                                    child: Text(
                                  'View',
                                  style: TextStyle(fontWeight: FontWeight.w700),
                                )),
                              ),
                            ]),
                      ],
                    ),
                    Consumer<Timetableprovider>(
                      builder: (context, value, child) {
                        return ListView.builder(
                            shrinkWrap: true,
                            itemCount: value.examList.isEmpty
                                ? 0
                                : value.examList.length,
                            itemBuilder: ((context, index) {
                              return GestureDetector(
                                child: Table(
                                  border: TableBorder.all(
                                      color:
                                          Color.fromARGB(255, 255, 255, 255)),
                                  columnWidths: const {
                                    0: FlexColumnWidth(4),
                                    1: FlexColumnWidth(2),
                                  },
                                  children: [
                                    TableRow(
                                        decoration: const BoxDecoration(
                                          color: Color.fromARGB(
                                              255, 245, 242, 242),
                                        ),
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Center(
                                              child: Text(
                                                value.examList[index]
                                                            .examDescription ==
                                                        null
                                                    ? '--'
                                                    : value.examList[index]
                                                        .examDescription
                                                        .toString(),
                                                style: const TextStyle(
                                                    fontSize: 15),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Container(
                                              height: 25,
                                              width: 25,
                                              // color: Color.fromARGB(
                                              //     255, 241, 241, 241),
                                              child: LottieBuilder.network(
                                                          "https://assets2.lottiefiles.com/temp/lf20_D0nz3r.json") ==
                                                      null
                                                  ? const Icon(Icons
                                                      .remove_red_eye_outlined)
                                                  : LottieBuilder.network(
                                                      "https://assets2.lottiefiles.com/temp/lf20_D0nz3r.json"),
                                            ),
                                          ),
                                        ]),
                                  ],
                                ),
                                onTap: () async {
                                  String att =
                                      await value.examList[index].id ?? '--';
                                  await value.viewAttachment(att);
                                  if (value.examList[index].extension ==
                                      '.pdf') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ExamPdfView()),
                                    );
                                  } else {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ImageViewExam()),
                                    );
                                  }
                                },
                              );
                            }));
                      },
                    )
                  ],
                ),
        ),
      ),
    );
  }
}

class PdfDownloader extends StatelessWidget {
  PdfDownloader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<Timetableprovider>(
      builder: (context, value, child) => Scaffold(
          appBar: AppBar(
            title: const Text('TimeTable'),
            titleSpacing: 00.0,
            centerTitle: true,
            toolbarHeight: 50.2,
            toolbarOpacity: 0.8,
            backgroundColor: UIGuide.light_Purple,
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: DownloandPdf(
                  isUseIcon: true,
                  pdfUrl: value.url.toString().isEmpty
                      ? '--'
                      : value.url.toString(),
                  fileNames: value.name.toString().isEmpty
                      ? '---'
                      : value.name.toString(),
                  color: Colors.white,
                ),
              ),
            ],
          ),
          body: SfPdfViewer.network(
            value.url.toString().isEmpty ? '--' : value.url.toString(),
          )),
    );
  }
}

class PdfViewPages extends StatelessWidget {
  PdfViewPages({Key? key}) : super(key: key);

  bool isLoading = false;

  imageview(String result) {
    return Scaffold(
      body: isLoading
          ? spinkitLoader()
          : Center(
              child: PhotoView(
                loadingBuilder: (context, event) {
                  return spinkitLoader();
                },
                imageProvider: NetworkImage(
                  result.isEmpty
                      ? 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSlmeGlXoJwwpbCE9jGgHgZ2XaE5nnPUSomkZz_vZT7&s'
                      : result,
                ),
              ),
            ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Timetableprovider>(builder: (context, provider, _) {
      if (provider.extension.toString() == '.jpg') {
        final imgResult = provider.url.toString();
        return imageview(imgResult);
      } else if (provider.extension.toString() == '.png') {
        final imgResult2 = provider.url.toString();
        return imageview(imgResult2);
      } else if (provider.extension.toString() == '.jpeg') {
        final imgResult3 = provider.url.toString();
        return imageview(imgResult3);
      } else {
        return const Scaffold(
          body: Center(
            child: Text(
              'No Attachment Provided',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
            ),
          ),
        );
      }
    });
  }
}

////////Exam

class ExamPdfView extends StatelessWidget {
  ExamPdfView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<Timetableprovider>(
      builder: (context, value, child) => Scaffold(
          appBar: AppBar(
            title: const Text('TimeTable'),
            titleSpacing: 00.0,
            centerTitle: true,
            toolbarHeight: 50.2,
            toolbarOpacity: 0.8,
            backgroundColor: UIGuide.light_Purple,
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: DownloandPdf(
                  isUseIcon: true,
                  pdfUrl: value.urlExam.toString().isEmpty
                      ? '--'
                      : value.urlExam.toString(),
                  fileNames: value.nameExam.toString().isEmpty
                      ? '---'
                      : value.nameExam.toString(),
                  color: Colors.white,
                ),
              ),
            ],
          ),
          body: SfPdfViewer.network(
            value.urlExam == null ? '--' : value.urlExam.toString(),
          )),
    );
  }
}

class ImageViewExam extends StatelessWidget {
  ImageViewExam({Key? key}) : super(key: key);

  bool isLoading = false;

  imageview(String result) {
    return Scaffold(
      body: isLoading
          ? spinkitLoader()
          : Center(
              child: PhotoView(
                loadingBuilder: (context, event) {
                  return spinkitLoader();
                },
                imageProvider: NetworkImage(
                  result.isEmpty
                      ? 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSlmeGlXoJwwpbCE9jGgHgZ2XaE5nnPUSomkZz_vZT7&s'
                      : result,
                ),
              ),
            ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Timetableprovider>(builder: (context, provider, _) {
      if (provider.extensionExam.toString() == '.jpg') {
        final imgResult = provider.urlExam.toString();
        return imageview(imgResult);
      } else if (provider.extensionExam.toString() == '.png') {
        final imgResult2 = provider.urlExam.toString();
        return imageview(imgResult2);
      } else if (provider.extensionExam.toString() == '.jpeg') {
        final imgResult3 = provider.urlExam.toString();
        return imageview(imgResult3);
      } else {
        return const Scaffold(
          body: Center(
            child: Text(
              'No Attachment Provided',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
            ),
          ),
        );
      }
    });
  }
}
