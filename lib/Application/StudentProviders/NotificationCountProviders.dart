import 'dart:convert';
import 'package:essconnect/Domain/Student/NotificationCountModel.dart';
import 'package:essconnect/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class StudNotificationCountProviders with ChangeNotifier {
  Future seeNotification() async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${_pref.getString('accesstoken')}'
    };
    var parsedResponse = await parseJWT();
    final studId = await parsedResponse['ChildId'];
    var request = http.Request(
        'POST',
        Uri.parse(
            '${UIGuide.baseURL}/mobileapp/token/updateStatus?StudentId=$studId'));
    request.body = json.encode({"IsSeen": true, "Type": "Student"});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print('Correct...______________________________');
    } else {
      print('Error in notificationInitial respo');
    }
  }

  int? count;
  Future getnotificationCount() async {
    SharedPreferences _pref = await SharedPreferences.getInstance();

    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${_pref.getString('accesstoken')}'
    };
    var parsedResponse = await parseJWT();
    final studID = await parsedResponse['ChildId'];
    var response = await http.get(
        Uri.parse(
            "${UIGuide.baseURL}/mobileapp/token/initial-Notification-Count?Type=Student&StudentId=$studID"),
        headers: headers);
    try {
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        NotifiCountModel not = NotifiCountModel.fromJson(data);
        count = not.totalCount;
        print(count);

        notifyListeners();
      } else {
        print("Error in Response");
      }
    } catch (e) {
      print(e);
    }
  }
}