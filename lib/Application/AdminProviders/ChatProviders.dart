import 'dart:convert';

import 'package:essconnect/Domain/Admin/ChatModel.dart';
import 'package:essconnect/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class ChatProviders with ChangeNotifier {
  List<ChatUserIdsModel> initialList = [];
  Future getChatInitialList() async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${_pref.getString('accesstoken')}'
    };

    var request = http.Request(
        'GET', Uri.parse('${UIGuide.baseURL}/chat-initial-values'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      Map<String, dynamic> data =
          jsonDecode(await response.stream.bytesToString());

      List<ChatUserIdsModel> templist = List<ChatUserIdsModel>.from(
          data["chatUserIds"].map((x) => ChatUserIdsModel.fromJson(x)));
      initialList.addAll(templist);

      notifyListeners();
    } else {
      print("Error in Chat Initial response");
    }
  }

  clearinitialList() {
    initialList.clear();
    notifyListeners();
  }

  //ChatContact List
  clearcontactList() {
    contactList.clear();
    notifyListeners();
  }

  List<ChatContactListmodel> contactList = [];
  Future getChatcontactList() async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${_pref.getString('accesstoken')}'
    };

    var request =
        http.Request('GET', Uri.parse('${UIGuide.baseURL}/chat-all-contacts'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      Map<String, dynamic> data =
          jsonDecode(await response.stream.bytesToString());

      List<ChatContactListmodel> templist = List<ChatContactListmodel>.from(
          data["chatUserIds"].map((x) => ChatContactListmodel.fromJson(x)));
      contactList.addAll(templist);

      notifyListeners();
    } else {
      print("Error in Chat Initial response");
    }
  }
}
