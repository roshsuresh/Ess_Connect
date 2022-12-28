import 'dart:convert';
import 'package:essconnect/Domain/Student/NotificationCountModel.dart';
import 'package:essconnect/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class StaffNotificationCountProviders with ChangeNotifier {
  Future seeNotification() async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${_pref.getString('accesstoken')}'
    };
    var parsedResponse = await parseJWT();
    final staffId = await parsedResponse['StaffId'];
    var request = http.Request(
        'POST',
        Uri.parse(
            '${UIGuide.baseURL}/mobileapp/token/updateStatus?StudentId=null&StaffId=$staffId'));
    request.body = json.encode({"IsSeen": true, "Type": "Staff"});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(' _ _ _ _ _ _  Notification Count  _ _ _ _ _ _');
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
    final staffID = await parsedResponse['StaffId'];
    var response = await http.get(
        Uri.parse(
            "${UIGuide.baseURL}/mobileapp/token/initial-Notification-Count?Type=Staff&StudentId=null&StaffId=$staffID"),
        headers: headers);
    try {
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        NotifiCountModel not = NotifiCountModel.fromJson(data);
        count = not.totalCount;
        print("Notification Count = $count");

        notifyListeners();
      } else {
        print("Error in Response");
      }
    } catch (e) {
      print(e);
    }
  }
}
