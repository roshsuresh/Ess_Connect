import 'dart:convert';
import 'package:essconnect/Domain/Student/NotificationReceivedStud.dart';
import 'package:essconnect/utils/constants.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NotificationReceivedProviderStudent with ChangeNotifier {
  bool _loading = false;
  bool get loading => _loading;
  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  // List? notificationstud;

  clearReceivedList() async {
    receivedList.clear();
    notifyListeners();
  }

  List<StudNotificationReceivedList> receivedList = [];
  Future getNotificationReceived() async {
    Map<String, dynamic> parse = await parseJWT();
    SharedPreferences _pref = await SharedPreferences.getInstance();
    setLoading(true);
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${_pref.getString('accesstoken')}'
    };

    var request = http.Request(
        'GET', Uri.parse("${UIGuide.baseURL}/mobileapp/token/receivedlist"));
    request.body = json.encode({
      //"SchoolId": _pref.getString('schoolId'),
      "CreatedDate": null,
      "StaffGuardianStudId": parse['ChildId'],
      "Type": "Student"
    });
    print(json.encode({
      //  "SchoolId": _pref.getString('schoolId'),
      "CreatedDate": null,
      "StaffGuardianStudId": parse['ChildId'],
      "Type": "Student"
    }));
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();

    try {
      if (response.statusCode == 200) {
        print("corect");
        // final data = json.decode(await response.stream.bytesToString());
        Map<String, dynamic> data =
            jsonDecode(await response.stream.bytesToString());

        List<StudNotificationReceivedList> templist =
            List<StudNotificationReceivedList>.from(data["receiveList"]
                .map((x) => StudNotificationReceivedList.fromJson(x)));
        receivedList.addAll(templist);

        setLoading(false);
        notifyListeners();
      } else {
        setLoading(false);
        print("Error in Notification screen send  Response");
      }
    } catch (e) {
      setLoading(false);
      print(e);
    }
  }
}
