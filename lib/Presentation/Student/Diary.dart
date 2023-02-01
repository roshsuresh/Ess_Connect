import 'package:essconnect/Application/StudentProviders/DiaryProviders.dart';
import 'package:essconnect/utils/spinkit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import '../../Constants.dart';
import '../../utils/TextWrap(moreOption).dart';
import '../../utils/constants.dart';

class Diary extends StatelessWidget {
  const Diary({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await Provider.of<DiaryProvidersstud>(context, listen: false)
          .clearDiary();
      await Provider.of<DiaryProvidersstud>(context, listen: false)
          .getDiaryList();
    });

    var size = MediaQuery.of(context).size;

    var width = size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Diary',
        ),
        titleSpacing: 00.0,
        centerTitle: true,
        toolbarHeight: 60.2,
        toolbarOpacity: 0.8,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(25),
              bottomLeft: Radius.circular(25)),
        ),
        backgroundColor: UIGuide.light_Purple,
      ),
      body: Consumer<DiaryProvidersstud>(
        builder: (_, value, child) {
          return value.loading
              ? spinkitLoader()
              : value.diarylist == null || value.diarylist.isEmpty
                  ? Container(
                      child: LottieBuilder.network(
                          'https://assets2.lottiefiles.com/private_files/lf30_lkquf6qz.json'),
                    )
                  : AnimationLimiter(
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(
                            parent: AlwaysScrollableScrollPhysics()),
                        itemCount: value.diarylist.isEmpty
                            ? 0
                            : value.diarylist.length,
                        itemBuilder: (BuildContext context, int index) {
                          String createddate =
                              value.diarylist[index].remarksDate ?? '--';
                          var updatedDate =
                              DateFormat('yyyy-MM-dd').parse(createddate);
                          String newDate = updatedDate.toString();
                          String finalCreatedDate =
                              newDate.replaceRange(10, 23, '');
                          return AnimationConfiguration.staggeredList(
                            position: index,
                            delay: const Duration(milliseconds: 100),
                            child: SlideAnimation(
                              duration: const Duration(milliseconds: 2500),
                              curve: Curves.fastLinearToSlowEaseIn,
                              child: FadeInAnimation(
                                curve: Curves.fastLinearToSlowEaseIn,
                                duration: const Duration(milliseconds: 2500),
                                child: Stack(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        width: width,
                                        decoration: BoxDecoration(
                                            color: const Color.fromARGB(
                                                255, 243, 243, 252),
                                            border: Border.all(
                                                color: UIGuide.light_Purple,
                                                width: .5),
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(5))),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(4.0),
                                              child: Row(
                                                children: [
                                                  kWidth,
                                                  const Text('📘  '),
                                                  Flexible(
                                                    child: RichText(
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      strutStyle:
                                                          const StrutStyle(
                                                              fontSize: 14.0),
                                                      text: TextSpan(
                                                          style: const TextStyle(
                                                              color: UIGuide
                                                                  .light_Purple,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500),
                                                          text: value
                                                                      .diarylist[
                                                                          index]
                                                                      .category ==
                                                                  null
                                                              ? '--'
                                                              : value
                                                                  .diarylist[
                                                                      index]
                                                                  .category
                                                                  .toString()),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(4.0),
                                              child: Container(
                                                width: width - 15,
                                                decoration: BoxDecoration(
                                                    color: const Color.fromARGB(
                                                        255, 236, 237, 245),
                                                    border: Border.all(
                                                        color: const Color
                                                                .fromARGB(255,
                                                            215, 207, 236)),
                                                    borderRadius:
                                                        const BorderRadius.all(
                                                            Radius.circular(
                                                                4))),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    TextWrapper(
                                                      text: value
                                                                  .diarylist[
                                                                      index]
                                                                  .remarks ==
                                                              null
                                                          ? '--'
                                                          : value
                                                              .diarylist[index]
                                                              .remarks
                                                              .toString(),
                                                      fSize: 16,
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                const Spacer(),
                                                Text(
                                                  finalCreatedDate.toString(),
                                                  style: const TextStyle(
                                                      fontSize: 12),
                                                ),
                                                kWidth,
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    );
        },
      ),
    );
  }
}
