import 'dart:convert';
import 'dart:developer';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../Domain/Student/activation_model.dart';
import '../../utils/constants.dart';

class LoginProvider with ChangeNotifier {
  bool isLoginned = false;
  String imageUrl = "";
  String schoolName = "";
  String schoolid = "";
  String subDomain = "";
  bool _loading = false;
  bool get loading => _loading;
  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<int> getActivation(String key) async {
    String res;
    setLoading(true);
    var headers = {
      'Content-Type': 'application/json',
    };
    var params = {
      "code": key,
    };

    var response = await http.post(
        Uri.parse("${UIGuide.baseURL}/mobileapp/common/get-schooldomain"),
        body: json.encode(params),
        headers: headers);
    if (response.statusCode == 200) {
      setLoading(true);
      print("corect");
      var jsonData = json.decode(response.body);

      ActivationModel ac = ActivationModel.fromJson(jsonData);

      schoolName = ac.schoolName!;
      subDomain = ac.subDomain!;
      schoolid = ac.schoolId!;
      print(schoolName);
      SharedPreferences _pref = await SharedPreferences.getInstance();
      _pref.setString("schoolId", ac.schoolId!);
      _pref.setString("subDomain", ac.subDomain!);
      print(_pref.getString('subDomain'));
      print('-----');
      setLoading(false);
      notifyListeners();
    } else {
      setLoading(false);
      print("Error in API calling");
    }

    return response.statusCode;
  }

  Future getToken(BuildContext context) async {
    Map<String, dynamic> data = await parseJWT();
    SharedPreferences _pref = await SharedPreferences.getInstance();
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${_pref.getString('accesstoken')}'
    };
    String? token = await FirebaseMessaging.instance.getToken();
    print("firebase token");
    print(token);
    var request = http.Request(
        'POST', Uri.parse('${UIGuide.baseURL}/mobileapp/token/saveusertoken'));
    request.body = json.encode({
      "MobileToken": token,
      "StaffId": data.containsKey('StaffId') ? data['StaffId'] : null,
      "GuardianId": data['GuardianId'],
      "StudentId": data['ChildId'],
      "Type": data['role'] == "Guardian" || data['role'] == "Student"
          ? "Student"
          : "Staff"
    });
    print('Responde body  ${request.body}');
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      log("student Token added");
    } else {
      log("student not added.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-!");
      debugPrint(response.reasonPhrase);
    }
  }
}
