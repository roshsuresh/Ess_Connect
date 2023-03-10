import 'package:essconnect/Application/Staff_Providers/SearchProvider.dart';
import 'package:essconnect/Constants.dart';
import 'package:essconnect/Domain/Staff/SearchStudReport.dart';
import 'package:essconnect/utils/constants.dart';
import 'package:essconnect/utils/spinkit.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class SearchStudent_stf extends StatefulWidget {
  SearchStudent_stf({Key? key}) : super(key: key);

  @override
  State<SearchStudent_stf> createState() => _SearchStudent_stfState();
}

class _SearchStudent_stfState extends State<SearchStudent_stf> {
  TextEditingController clearValue = TextEditingController();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      var p = Provider.of<Screen_Search_Providers>(context, listen: false);
      p.clearStudentList();
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            kheight10,
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios_new,
                        color: Colors.grey,
                      )),
                  Expanded(
                    child: TextField(
                      controller: clearValue,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        suffixIcon: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.search),
                              color: Colors.grey,
                              onPressed: (() async {
                                Provider.of<Screen_Search_Providers>(context,
                                        listen: false)
                                    .getSearch_View(clearValue.text.toString());
                                Provider.of<Screen_Search_Providers>(context,
                                        listen: false)
                                    .clearStudentList();
                              }),
                            ),
                            IconButton(
                              icon: const Icon(Icons.close),
                              color: Colors.grey,
                              onPressed: (() {
                                clearValue.clear();
                              }),
                            ),
                          ],
                        ),
                        hintText: 'Search',
                        hintStyle: const TextStyle(
                          color: Colors.grey,
                          fontSize: 20,
                        ),
                        fillColor: UIGuide.light_black,
                        filled: true,
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: UIGuide.light_Purple, width: .5),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: const BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      style: const TextStyle(color: UIGuide.light_Purple),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Consumer<Screen_Search_Providers>(
                  builder: (context, provider, child) {
                if (clearValue.text.isEmpty) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      LottieBuilder.network(
                          'https://assets5.lottiefiles.com/packages/lf20_l5qvxwtf.json'),
                      const Text(
                        "Please enter the name to search",
                        style: TextStyle(
                            fontSize: 20,
                            color: Color.fromARGB(255, 122, 121, 121)),
                      )
                    ],
                  );
                }
                if (provider.searchStudent.isEmpty) {
                  Future.delayed(const Duration(seconds: 2));
                  return provider.loading
                      ? spinkitLoader()
                      : Center(
                          child: LottieBuilder.network(
                              'https://assets2.lottiefiles.com/private_files/lf30_lkquf6qz.json'),
                        );
                }
                return provider.loading
                    ? spinkitLoader()
                    : ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: provider.searchStudent.isEmpty
                            ? 0
                            : provider.searchStudent.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              kheight10,
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            StudProfileViewBySearch_Staff(
                                              stud:
                                                  provider.searchStudent[index],
                                            )),
                                  );
                                },
                                child: Container(
                                  width: size.width - 15,
                                  height: 82,
                                  decoration: const BoxDecoration(
                                      color: UIGuide.light_black,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      kWidth,
                                      Center(
                                        child: Container(
                                          width: 60,
                                          height: 60,
                                          decoration: BoxDecoration(
                                              color: UIGuide.light_black,
                                              image: DecorationImage(
                                                  image: NetworkImage(provider
                                                          .searchStudent[index]
                                                          .studentPhoto ??
                                                      'https://img.myloview.com/canvas-prints/default-avatar-profile-icon-social-media-user-symbol-image-400-251200038.jpg')),
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(10))),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                const Text(
                                                  'Name : ',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 13),
                                                ),
                                                RichText(
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  maxLines: 1,
                                                  strutStyle: const StrutStyle(
                                                      fontSize: 8.0),
                                                  text: TextSpan(
                                                      style: const TextStyle(
                                                        fontSize: 12,
                                                        color: Colors.black,
                                                      ),
                                                      text: provider
                                                              .searchStudent[
                                                                  index]
                                                              .name ??
                                                          '---'),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                const Text(
                                                  'Roll No : ',
                                                  textAlign: TextAlign.start,
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 13),
                                                ),
                                                RichText(
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  maxLines: 1,
                                                  strutStyle: const StrutStyle(
                                                      fontSize: 8.0),
                                                  text: TextSpan(
                                                    style: const TextStyle(
                                                      fontSize: 12,
                                                      color: Colors.black,
                                                    ),
                                                    text: provider
                                                                .searchStudent[
                                                                    index]
                                                                .rollNo ==
                                                            null
                                                        ? '---'
                                                        : provider
                                                            .searchStudent[
                                                                index]
                                                            .rollNo
                                                            .toString(),
                                                  ),
                                                ),
                                                kWidth,
                                                kWidth,
                                                Row(
                                                  children: [
                                                    const Text(
                                                      'Division : ',
                                                      textAlign:
                                                          TextAlign.start,
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: 13),
                                                    ),
                                                    RichText(
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      maxLines: 1,
                                                      strutStyle:
                                                          const StrutStyle(
                                                              fontSize: 8.0),
                                                      text: TextSpan(
                                                        style: const TextStyle(
                                                          fontSize: 12,
                                                          color: Colors.black,
                                                        ),
                                                        text: provider
                                                                .searchStudent[
                                                                    index]
                                                                .division ??
                                                            '---',
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                const Text(
                                                  'Adm No : ',
                                                  textAlign: TextAlign.start,
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 13),
                                                ),
                                                RichText(
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  maxLines: 1,
                                                  strutStyle: const StrutStyle(
                                                      fontSize: 8.0),
                                                  text: TextSpan(
                                                    style: const TextStyle(
                                                      fontSize: 12,
                                                      color: Colors.black,
                                                    ),
                                                    text: provider
                                                            .searchStudent[
                                                                index]
                                                            .admnNo ??
                                                        '---',
                                                  ),
                                                ),
                                              ],
                                            ),
                                            GestureDetector(
                                              onTap: () async {
                                                String phn = provider
                                                            .searchStudent[
                                                                index]
                                                            .mobNo ==
                                                        null
                                                    ? '--'
                                                    : provider
                                                        .searchStudent[index]
                                                        .mobNo
                                                        .toString();

                                                _makingPhoneCall(
                                                    phn.toString());
                                              },
                                              child: Row(
                                                children: [
                                                  const Text(
                                                    'Phone : ',
                                                    textAlign: TextAlign.start,
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 13),
                                                  ),
                                                  RichText(
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    maxLines: 1,
                                                    strutStyle:
                                                        const StrutStyle(
                                                            fontSize: 8.0),
                                                    text: TextSpan(
                                                      style: const TextStyle(
                                                        fontSize: 13,
                                                        color: Colors.black,
                                                      ),
                                                      text: provider
                                                              .searchStudent[
                                                                  index]
                                                              .mobNo ??
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
                          );
                        },
                      );
              }),
            ),
          ],
        ),
      ),
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

class StudProfileViewBySearch_Staff extends StatelessWidget {
  SearchStudReport stud;
  StudProfileViewBySearch_Staff({
    Key? key,
    required this.stud,
  }) : super(key: key);
  //final int indexx;
  String? phn;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    const Color background = Colors.white;
    const Color fill1 = UIGuide.light_Purple;
    const Color fill2 = UIGuide.custom_blue;
    final List<Color> gradient = [
      fill1,
      fill2,
      background,
      background,
    ];
    const double fillPercent = 35;
    const double fillStop = (100 - fillPercent) / 100;
    final List<double> stops = [0.0, fillStop, fillStop, 1.0];

    return SafeArea(
        child: Scaffold(
      body: Consumer<Screen_Search_Providers>(
        builder: (context, value, child) => ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            Stack(
              children: [
                Container(
                  height: 260,
                  width: size.width,
                  // color: UIGuide.WHITE,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: gradient,
                      stops: stops,
                      end: Alignment.bottomCenter,
                      begin: Alignment.topCenter,
                    ),
                  ),
                ),
                Positioned(
                  top: 70,
                  left: 30,
                  right: 30,
                  child: Container(
                      decoration: const BoxDecoration(
                          color: UIGuide.WHITE,
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromARGB(255, 128, 125, 125),
                              offset: Offset(
                                2,
                                5.0,
                              ),
                              blurRadius: 5.0,
                              spreadRadius: 2.0,
                            ),
                          ],
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      width: size.width - 50,
                      height: 170,
                      child: Column(
                        children: [
                          kheight20,
                          kheight20,
                          kheight20,
                          kheight10,
                          Text(
                            stud.name ?? '---',
                            style: const TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 13),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text('Division: ',
                                  style: TextStyle(
                                      fontSize: 14.0, color: Colors.grey)),
                              Text(stud.division ?? '---',
                                  style: const TextStyle(fontSize: 14.0)),
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Table(
                              // defaultColumnWidth: FixedColumnWidth(120.0),
                              border: TableBorder.all(
                                  color:
                                      const Color.fromARGB(255, 213, 213, 243),
                                  style: BorderStyle.solid,
                                  width: 2),
                              children: [
                                TableRow(children: [
                                  Column(
                                    children: [
                                      const Text('Roll No',
                                          style: TextStyle(
                                              fontSize: 14.0,
                                              color: Colors.grey)),
                                      Text(
                                          stud.rollNo == null
                                              ? '---'
                                              : stud.rollNo.toString(),
                                          style:
                                              const TextStyle(fontSize: 16.0)),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      const Text('Adm No',
                                          style: TextStyle(
                                              fontSize: 14.0,
                                              color: Colors.grey)),
                                      Text(stud.admnNo ?? '---',
                                          style:
                                              const TextStyle(fontSize: 16.0)),
                                    ],
                                  ),
                                ])
                              ],
                            ),
                          )
                        ],
                      )),
                ),
                Center(
                  child: CircleAvatar(
                    foregroundColor: Colors.white,
                    foregroundImage: NetworkImage(
                      stud.studentPhoto ??
                          'https://png.pngtree.com/element_our/png/20181129/male-student-icon-png_251938.jpg',
                    ),
                    radius: 65,
                    backgroundColor: UIGuide.WHITE,
                    // child: Image(
                    //   image: NetworkImage(
                    //     value.viewStudReportListt[indexx].studentPhoto ??
                    //         'https://png.pngtree.com/element_our/png/20181129/male-student-icon-png_251938.jpg',
                    //   ),
                    //   // fit: BoxFit.fill,
                    // ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 170,
                width: size.width,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 238, 234, 234),
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 238, 234, 234),
                      ),
                      width: size.width,
                      height: 85,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Permenent Address',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w700),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Flexible(
                            child: RichText(
                              overflow: TextOverflow.ellipsis,
                              strutStyle: const StrutStyle(fontSize: 13),
                              maxLines: 3,
                              text: TextSpan(
                                style: const TextStyle(
                                    fontSize: 15,
                                    color: Color.fromARGB(255, 44, 43, 43)),
                                text: stud.address ?? '---',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        const Text(
                          'Bus Name : ',
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 13),
                        ),
                        Flexible(
                          child: Text(
                            stud.bus ?? '---',
                            overflow: TextOverflow.clip,
                            style: const TextStyle(fontSize: 12),
                          ),
                        )
                      ],
                    ),
                    kheight10,
                    Row(
                      children: [
                        const Text(
                          'Bus Stop : ',
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 13),
                        ),
                        Flexible(
                          child: Text(
                            stud.stop ?? '---',
                            overflow: TextOverflow.clip,
                            style: const TextStyle(fontSize: 12),
                          ),
                        )
                      ],
                    ),
                    kheight10,
                    GestureDetector(
                      onTap: () {
                        _makingPhoneCall(phn.toString());
                      },
                      child: Row(
                        children: [
                          const Text(
                            'Phone No : ',
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 13),
                          ),
                          Flexible(
                            child: Text(
                              phn = stud.mobNo ?? '---',
                              overflow: TextOverflow.clip,
                              style: const TextStyle(fontSize: 12),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    ));
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
