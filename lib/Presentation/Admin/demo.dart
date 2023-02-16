import 'dart:convert';

import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:badges/badges.dart' as badges;
import 'package:essconnect/Constants.dart';
import 'package:essconnect/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:uuid/uuid.dart';

class ChatListScreen extends StatelessWidget {
  const ChatListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,

          title: Row(
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back_ios_new_rounded,
                    size: 18,
                  )),
              kWidth,
              Text(
                'Chat',
                style: GoogleFonts.notoSansBamum(
                    textStyle: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                )),

                // style: TextStyle(fontSize: 40),
              ),
              const Spacer(),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.search_outlined),
                splashColor: UIGuide.THEME_LIGHT,
              ),
              kWidth
            ],
          ),
          titleSpacing: 00.0,
          // centerTitle: true,
          toolbarHeight: 65,
          toolbarOpacity: 0.8,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(25),
                bottomLeft: Radius.circular(25)),
          ),
          backgroundColor: UIGuide.light_Purple,
        ),
        body: AnimationLimiter(
          child: ListView.builder(
            physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics()),
            itemCount: 15,
            shrinkWrap: false,
            itemBuilder: (BuildContext context, int index) {
              return AnimationConfiguration.staggeredList(
                position: index,
                delay: const Duration(milliseconds: 100),
                child: SlideAnimation(
                  duration: const Duration(milliseconds: 2500),
                  curve: Curves.fastLinearToSlowEaseIn,
                  child: FadeInAnimation(
                      curve: Curves.fastLinearToSlowEaseIn,
                      duration: const Duration(milliseconds: 2500),
                      child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ChatPage()));
                            },
                            child: Container(
                              height: 70,
                              width: size.width,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black12),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Center(
                                child: Row(
                                  children: [
                                    kWidth,
                                    const CircleAvatar(
                                      radius: 25,
                                      backgroundColor: Colors.white,
                                      backgroundImage: NetworkImage(
                                          'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
                                    ),
                                    kWidth,
                                    kWidth,
                                    Center(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: 20,
                                            width: size.width / 2.5,
                                            child: Text(
                                              'RAVINDRANATH',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                  color: UIGuide.light_Purple),
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 1,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 20,
                                            width: size.width / 1.6,
                                            child: Text(
                                              'data RavidranathRa avidrana thRavi Ravi drana thRa avidrana thRavianath avianath avi',
                                              style:
                                                  TextStyle(color: Colors.grey),
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 1,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    const Spacer(),
                                    SizedBox(
                                      height: 60,
                                      width: 50,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: const [
                                          Text(
                                            'Yesterday',
                                            style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 117, 117, 117),
                                                fontSize: 10),
                                          ),
                                          SizedBox(
                                            height: 3,
                                          ),
                                          SizedBox(
                                            height: 20,
                                            width: 33,
                                            child: badges.Badge(
                                              // showBadge:
                                              //      0 ? false : true,
                                              badgeAnimation: badges
                                                  .BadgeAnimation.rotation(
                                                animationDuration:
                                                    Duration(seconds: 1),
                                                colorChangeAnimationDuration:
                                                    Duration(seconds: 1),
                                                loopAnimation: false,
                                                curve: Curves.fastOutSlowIn,
                                                colorChangeAnimationCurve:
                                                    Curves.easeInCubic,
                                              ),

                                              badgeContent: Center(
                                                child: Text(
                                                  '20',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 10,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),

                                              badgeStyle: badges.BadgeStyle(
                                                  shape:
                                                      badges.BadgeShape.square,
                                                  badgeColor:
                                                      UIGuide.light_Purple,
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(20))),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ))),
                ),
              );
            },
          ),
        ));
  }
}

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);
  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<types.Message> _messages = [];
  final _user = const types.User(id: '82091008-a484-4a89-ae75-a22bf8d6f3ac');

  @override
  void initState() {
    super.initState();
    _loadMessages();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: UIGuide.light_Purple,
        title: Row(
          children: [
            // GestureDetector(
            //   onTap: () {
            //     Navigator.pop(context);
            //   },
            //   child: CircleAvatar(
            //     backgroundColor: Colors.transparent,
            //     child: Icon(
            //       Icons.arrow_back_ios_new_rounded,
            //       size: 18,
            //     ),
            //   ),
            // ),
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back_ios_new_rounded,
                  size: 18,
                )),
            kWidth,
            CircleAvatar(
              radius: 20,
              backgroundColor: Colors.grey,
              backgroundImage: NetworkImage(
                  'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
            ),
            kWidth,
            SizedBox(
                width: size.width / 1.6,
                child: Text(
                  'ABRAHAM LINKON',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                )),
          ],
        ),
      ),
      body: Chat(
        theme: const DefaultChatTheme(
            userAvatarImageBackgroundColor: UIGuide.PRIMARY,
            primaryColor: Colors.blue,
            inputBorderRadius: BorderRadius.vertical(top: Radius.circular(10)),
            deliveredIcon: Icon(Icons.mark_chat_read_outlined),
            inputBackgroundColor: UIGuide.light_Purple,
            backgroundColor: Colors.white10),

        messages: _messages,
        //  onAttachmentPressed: _handleAttachmentPressed,
        //  onMessageTap: _handleMessageTap,
        //onPreviewDataFetched: _handlePreviewDataFetched,
        onSendPressed: _handleSendPressed,
        showUserAvatars: true,
        showUserNames: true,
        user: _user,
      ),
    );
  }

  void _addMessage(types.Message message) {
    setState(() {
      _messages.insert(0, message);
    });
  }

  void _handleSendPressed(types.PartialText message) {
    final textMessage = types.TextMessage(
      author: _user,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: const Uuid().v4(),
      text: message.text,
    );

    _addMessage(textMessage);
  }

  void _loadMessages() async {
    final response = await rootBundle.loadString('assets/messages.json');
    final messages = (jsonDecode(response) as List)
        .map((e) => types.Message.fromJson(e as Map<String, dynamic>))
        .toList();

    setState(() {
      _messages = messages;
    });
  }
}
