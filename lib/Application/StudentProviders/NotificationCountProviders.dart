import 'dart:convert';
import 'dart:developer';
import 'package:essconnect/Domain/Student/NotificationCountModel.dart';
import 'package:essconnect/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class StudNotificationCountProviders with ChangeNotifier {
  bool _loading = false;
  bool get loading => _loading;
  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future seeNotification() async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    setLoading(true);
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
    print('${UIGuide.baseURL}/mobileapp/token/updateStatus?StudentId=$studId');

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      setLoading(true);
      print(
          '_ _ _ _ _ _ _ _ _ _ _ _   Correct   _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _');
      setLoading(false);
    } else {
      setLoading(false);
      print(response.statusCode);
      print('Error in notificationInitial respo');
    }
  }

  int? count;
  Future getnotificationCount() async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    setLoading(true);
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

    print(
        "${UIGuide.baseURL}/mobileapp/token/initial-Notification-Count?Type=Student&StudentId=$studID");
    try {
      if (response.statusCode == 200) {
        setLoading(true);
        final data = json.decode(response.body);
        NotifiCountModel not = NotifiCountModel.fromJson(data);
        count = not.totalCount;
        print("Notification Count = $count");
        log('-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_'
            .toString());
        setLoading(false);
        notifyListeners();
      } else {
        setLoading(false);
        print(response.statusCode);
        print("Error in Response");
      }
    } catch (e) {
      setLoading(false);
      print(e);
    }
  }
}
