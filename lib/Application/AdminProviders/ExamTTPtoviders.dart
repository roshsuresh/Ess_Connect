import 'dart:convert';
import 'dart:developer';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:essconnect/Domain/Admin/Course&DivsionList.dart';
import 'package:essconnect/Domain/Admin/ExamTTModel.dart';
import 'package:essconnect/Domain/Staff/GallerySendStaff.dart';
import 'package:essconnect/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ExamTTAdmProviders with ChangeNotifier {
  List<CourseListModel> courseList = [];
  //List<MultiSelectItem> courseDropDown = [];
  Future getCourseList() async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${_pref.getString('accesstoken')}'
    };

    var request = http.Request(
        'GET', Uri.parse('${UIGuide.baseURL}/mobileapp/common/courselist'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      Map<String, dynamic> data =
          jsonDecode(await response.stream.bytesToString());

      List<CourseListModel> templist = List<CourseListModel>.from(
          data["courseList"].map((x) => CourseListModel.fromJson(x)));
      courseList.addAll(templist);

      // courseDropDown = courseList.map((subjectdata) {
      //   return MultiSelectItem(subjectdata, subjectdata.name!);
      // }).toList();

      notifyListeners();
    } else {
      print("Error in Course response");
    }
  }

  int divisionLen = 0;
  divisionCounter(int leng) async {
    divisionLen = 0;
    print(divisionLen);
    if (leng == 0) {
      divisionLen = 0;
    } else {
      divisionLen = leng;
    }

    notifyListeners();
  }
  //Division

  List<DivisionListModel> divisionList = [];
  List<MultiSelectItem> divisionDropDown = [];
  Future<bool> getDivisionList(String courseId) async {
    SharedPreferences _pref = await SharedPreferences.getInstance();

    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${_pref.getString('accesstoken')}'
    };
    var request = http.Request(
        'GET',
        Uri.parse(
            '${UIGuide.baseURL}/mobileapp/staffdet/studentreport/divisions/$courseId'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    print('object');
    if (response.statusCode == 200) {
      Map<String, dynamic> data =
          jsonDecode(await response.stream.bytesToString());

      log(data.toString());

      List<DivisionListModel> templist = List<DivisionListModel>.from(
          data["divisionbyCourse"].map((x) => DivisionListModel.fromJson(x)));
      divisionList.addAll(templist);
      divisionDropDown = divisionList.map((subjectdata) {
        return MultiSelectItem(subjectdata, subjectdata.text!);
      }).toList();
      notifyListeners();
    } else {
      print('Error in DivisionList stf');
    }
    return true;
  }

  divisionClear() {
    divisionList.clear();
    notifyListeners();
  }

  //find image id

  bool _loaddg = false;
  bool get loaddg => _loaddg;
  setLoadddd(bool valu) {
    _loaddg = valu;
    notifyListeners();
  }

  String? id;
  Future examImageSave(BuildContext context, String path) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setLoadddd(true);
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${pref.getString('accesstoken')}'
    };
    var request = http.MultipartRequest(
        'POST', Uri.parse('${UIGuide.baseURL}/files/single/School'));
    request.files.add(await http.MultipartFile.fromPath('file', path));
    request.headers.addAll(headers);
    print(path);
    setLoadddd(true);
    http.StreamedResponse response = await request.send();
    print(request);

    if (response.statusCode == 200) {
      setLoadddd(true);
      Map<String, dynamic> data =
          jsonDecode(await response.stream.bytesToString());

      GalleryImageId idd = GalleryImageId.fromJson(data);
      id = idd.id;
      print(path);
      print('...............   $id');
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        duration: Duration(seconds: 1),
        margin: EdgeInsets.only(bottom: 80, left: 30, right: 30),
        behavior: SnackBarBehavior.floating,
        content: Text(
          'Image added...',
          textAlign: TextAlign.center,
        ),
      ));
      setLoadddd(false);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        duration: Duration(seconds: 1),
        margin: EdgeInsets.only(bottom: 80, left: 30, right: 30),
        behavior: SnackBarBehavior.floating,
        content: Text(
          'Something Went Wrong....',
          textAlign: TextAlign.center,
        ),
      ));
      print(response.reasonPhrase);
      setLoadddd(false);
    }
  }

  //gallery save

  final List divisionn = [];
  Future examSave(
      context,
      String examStartDate,
      String displayStartDate,
      String displayEndDate,
      String discription,
      String coursee,
      divisionn,
      String attachmentId) async {
    SharedPreferences _pref = await SharedPreferences.getInstance();

    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${_pref.getString('accesstoken')}'
    };
    print('$attachmentId  __________________');
    var request = http.Request(
        'POST',
        Uri.parse(
            '${UIGuide.baseURL}/upload-exam-timetable/save-exam-timeTable'));
    request.body = json.encode({
      "attachmentId": attachmentId,
      "courseId": coursee,
      "description": discription,
      "displayFrom": displayStartDate,
      "displayUpto": displayEndDate,
      "divisionId": divisionn,
      "examStartDate": examStartDate,
      "forClassTeacherOnly": false,
      "staffRole": "null"
    });
    print(json.encode({
      "attachmentId": attachmentId,
      "courseId": coursee,
      "description": discription,
      "displayFrom": displayStartDate,
      "displayUpto": displayEndDate,
      "divisionId": divisionn,
      "examStartDate": examStartDate,
      "forClassTeacherOnly": false,
      "staffRole": "null"
    }));
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print('Correct...______________________________');
      await AwesomeDialog(
              context: context,
              dialogType: DialogType.success,
              animType: AnimType.rightSlide,
              headerAnimationLoop: false,
              title: 'Success',
              desc: 'Uploaded Successfully',
              btnOkOnPress: () {},
              btnOkIcon: Icons.cancel,
              btnOkColor: Colors.green)
          .show();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        duration: Duration(seconds: 1),
        margin: EdgeInsets.only(bottom: 80, left: 30, right: 30),
        behavior: SnackBarBehavior.floating,
        content: Text(
          'Something Went Wrong....',
          textAlign: TextAlign.center,
        ),
      ));
    }
  }

  bool _loading = false;
  bool get loading => _loading;
  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  List<ExamTTModelAdmin> examlist = [];
  Future getExamTimeTableList() async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    setLoading(true);
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${_pref.getString('accesstoken')}'
    };

    var request = http.Request(
        'GET',
        Uri.parse(
            '${UIGuide.baseURL}/mobileapp/staffdet/upload-exam-timeTable-list'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      Map<String, dynamic> data =
          jsonDecode(await response.stream.bytesToString());

      List<ExamTTModelAdmin> templist = List<ExamTTModelAdmin>.from(
          data["uploadExamTimeTableList"]
              .map((x) => ExamTTModelAdmin.fromJson(x)));
      examlist.addAll(templist);
      setLoading(false);
      notifyListeners();
    } else {
      setLoading(false);
      print("Error in ExamTimeTableList response");
    }
  }

  clearTTexamList() {
    examlist.clear();
    notifyListeners();
  }

  //delete
  Future examTTDelete(String eventID, BuildContext context) async {
    SharedPreferences _pref = await SharedPreferences.getInstance();

    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${_pref.getString('accesstoken')}'
    };
    var request = http.Request(
        'DELETE',
        Uri.parse(
            '${UIGuide.baseURL}/upload-exam-timetable/delete-exam-timeTable/$eventID'));
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 204) {
      print(await response.stream.bytesToString());
      print('correct');
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        duration: Duration(seconds: 1),
        margin: EdgeInsets.only(bottom: 80, left: 30, right: 30),
        behavior: SnackBarBehavior.floating,
        content: Text(
          'Deleted Successfully',
          textAlign: TextAlign.center,
        ),
      ));

      notifyListeners();
    } else {
      print('Error in ExamDelete admin');
    }
  }
}
