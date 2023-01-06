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

class Classtimetable extends StatelessWidget {
  Classtimetable({Key? key}) : super(key: key);

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
                  ? Container(
                      child: LottieBuilder.network(
                          'https://assets2.lottiefiles.com/private_files/lf30_lkquf6qz.json'),
                    )
                  : ListView(
                      children: [
                        kheight20,
                        Table(
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
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 30,
                                    child: Center(
                                        child: Text(
                                      'View',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500),
                                    )),
                                  ),
                                ]),
                          ],
                        ),
                        Consumer<Timetableprovider>(
                          builder: (context, value, child) {
                            return Table(
                              columnWidths: const {
                                0: FlexColumnWidth(4),
                                1: FlexColumnWidth(2),
                              },
                              children: [
                                TableRow(
                                    decoration: const BoxDecoration(
                                      color: Color.fromARGB(255, 245, 242, 242),
                                    ),
                                    children: [
                                      Center(
                                        child: Text(
                                          value.name == null
                                              ? '--'
                                              : value.name.toString(),
                                          style: const TextStyle(fontSize: 15),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () async {
                                          if (value.extension == '.pdf') {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      PdfDownloader()),
                                            );
                                          } else {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      PdfViewPages()),
                                            );
                                          }
                                        },
                                        child: const Icon(Icons.remove_red_eye),
                                      ),
                                    ]),
                              ],
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

class Examtimetable extends StatelessWidget {
  Examtimetable({Key? key}) : super(key: key);

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
                  ? Container(
                      child: LottieBuilder.network(
                          'https://assets2.lottiefiles.com/private_files/lf30_lkquf6qz.json'),
                    )
                  : ListView(
                      children: [
                        kheight20,
                        Table(
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
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 30,
                                    child: Center(
                                        child: Text(
                                      'View',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500),
                                    )),
                                  ),
                                ]),
                          ],
                        ),
                        Consumer<Timetableprovider>(
                          builder: (context, value, child) {
                            return Table(
                              columnWidths: const {
                                0: FlexColumnWidth(4),
                                1: FlexColumnWidth(2),
                              },
                              children: [
                                TableRow(
                                    decoration: const BoxDecoration(
                                      color: Color.fromARGB(255, 245, 242, 242),
                                    ),
                                    children: [
                                      Center(
                                        child: Text(
                                          value.name == null
                                              ? '--'
                                              : value.name.toString(),
                                          style: const TextStyle(fontSize: 15),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () async {
                                          if (value.extension == '.pdf') {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      PdfDownloader()),
                                            );
                                          } else {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      PdfViewPages()),
                                            );
                                          }
                                        },
                                        child: const Icon(Icons.remove_red_eye),
                                      ),
                                    ]),
                              ],
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
