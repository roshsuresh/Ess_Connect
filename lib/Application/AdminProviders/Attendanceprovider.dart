import 'dart:convert';

import 'package:essconnect/Domain/Admin/SMSFormatModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../../Domain/Admin/AttendanceModel.dart';
import '../../Presentation/Admin/Communication/ToGuardian.dart';
import '../../utils/constants.dart';

class AttendanceReportProvider with ChangeNotifier {
  bool _loading = false;

  bool get loading => _loading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  List<AttendanceModel> attendanceList = [];

  Future getAttReportView(
      String section, String course, String division, String date) async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    setLoading(true);
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${_pref.getString('accesstoken')}'
    };
    var response = await http.get(
        Uri.parse(
            "${UIGuide.baseURL}/studentAbsentPresentReport?sectionId=$section&courseId=$course&divisionId=$division&attendanceDate=$date&attendance=1&absentType=both"),
        headers: headers);
    print(
        "${UIGuide.baseURL}/studentAbsentPresentReport?sectionId=$section&courseId=$course&divisionId=$division&attendanceDate=$date&attendance=1&absentType=both");

    if (response.statusCode == 200) {
      setLoading(true);
      print('correct');
      List data = json.decode(response.body);

      List<AttendanceModel> templist = List<AttendanceModel>.from(
          data.map((x) => AttendanceModel.fromJson(x)));
      attendanceList.addAll(templist);
      notifyListeners();
      setLoading(false);
    } else {
      print('Error in attendance report');
      setLoading(false);
    }

    return response.statusCode;
  }

  List<StudentAttendancetakenDatum> takenList = [];
  Future<bool> getAttendanceTaken(BuildContext context, String date,
      String section, String course, String type) async {
    setLoading(true);
    SharedPreferences _pref = await SharedPreferences.getInstance();
    notifyListeners();
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${_pref.getString('accesstoken')}'
    };
    var request = http.Request(
        'GET',
        Uri.parse(
            '${UIGuide.baseURL}/attendancetakenornottaken/viewAttendance/?attendanceDate=$date&section=$section&course=$course&attendance=$type'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      Map<String, dynamic> data =
          jsonDecode(await response.stream.bytesToString());

      List<StudentAttendancetakenDatum> templist =
          List<StudentAttendancetakenDatum>.from(
              data["studentAttendancetakenData"]
                  .map((x) => StudentAttendancetakenDatum.fromJson(x)));
      takenList.addAll(templist);

      print('correct');
      setLoading(false);
      notifyListeners();
    } else {
      print('Error in attendance report');
      setLoading(false);
    }
    return true;
  }

  clearList() {
    attendanceList.clear();
    notifyListeners();
  }

  cleartakenList() {
    takenList.clear();
    notifyListeners();
  }

  void selectItem(AttendanceModel model) {
    AttendanceModel selected =
        attendanceList.firstWhere((element) => element.admNo == model.admNo);
    selected.selected ??= false;
    selected.selected = !selected.selected!;
    print(selected.toJson());
    notifyListeners();
  }

  bool isselectAll = false;
  void selectAll() {
    if (attendanceList.first.selected == true) {
      attendanceList.forEach((element) {
        element.selected = false;
      });
      isselectAll = false;
    } else {
      attendanceList.forEach((element) {
        element.selected = true;
      });
      isselectAll = true;
    }

    notifyListeners();
  }

  List<AttendanceModel> selectedList = [];
  submitStudent(BuildContext context) {
    selectedList.clear();
    selectedList =
        attendanceList.where((element) => element.selected == true).toList();
    if (selectedList.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        duration: Duration(seconds: 1),
        margin: EdgeInsets.only(bottom: 80, left: 30, right: 30),
        behavior: SnackBarBehavior.floating,
        content: Text(
          'Select any student...',
          textAlign: TextAlign.center,
        ),
      ));
    } else {
      print('selected.....');
      print(
          attendanceList.where((element) => element.selected == true).toList());
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Text_Matter_NotificationAdmin(
              toList: selectedList.map((e) => e.studentId!).toList(),
              type: "Student",
            ),
          ));
    }
  }

  /// sms formats list
  ///

  clearSMSList() {
    formatlist.clear();
    notifyListeners();
  }

  List<SMSfomatModel> formatlist = [];
  Future<bool> viewSMSFormat() async {
    SharedPreferences _pref = await SharedPreferences.getInstance();

    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${_pref.getString('accesstoken')}'
    };
    var request = http.Request('GET',
        Uri.parse('${UIGuide.baseURL}/mobileapp/staffdet/attendanceformat'));
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    print('object');
    if (response.statusCode == 200) {
      List data = jsonDecode(await response.stream.bytesToString());
      print(data);
      List<SMSfomatModel> templist =
          List<SMSfomatModel>.from(data.map((x) => SMSfomatModel.fromJson(x)));
      formatlist.addAll(templist);

      notifyListeners();
    } else {
      print('Error in formatList stf');
    }
    return true;
  }

  String? smsBody;
  Future<int> getSMSContent(String idd) async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${_pref.getString('accesstoken')}'
    };
    var response = await http.get(
        Uri.parse(
            "${UIGuide.baseURL}/studentAbsentPresentReport/get-formats-by-id/$idd"),
        headers: headers);
    if (response.statusCode == 200) {
      print('correct');
      Map<String, dynamic> dashboard = json.decode(response.body);
      SMSContentModel ac = SMSContentModel.fromJson(dashboard);
      smsBody = ac.smsBody;

      notifyListeners();
    } else {
      print('Error in dashboard');
    }
    return response.statusCode;
  }
}
