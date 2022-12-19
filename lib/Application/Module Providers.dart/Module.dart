import 'dart:developer';
import 'package:essconnect/utils/constants.dart';
import 'package:flutter/material.dart';

class ModuleProviders extends ChangeNotifier {
  bool fees = false;
  bool tabulation = false;
  bool timetable = false;
  bool curiculam = false;
  bool offlineAttendence = false;
  Future getModuleDetails() async {
    print('12121');
    var parsedResponse = await parseJWT();

    final newParse = await parsedResponse['Modules'];
    print(newParse);
    String data = await newParse;
    print('12121');
    if (data.contains('FEE')) {
      fees = true;
      notifyListeners();
      print('!!!!!!!!!!!!!!!!!!!!');
    }
    if (data.contains('TT')) {
      timetable = true;
      notifyListeners();
    }
    if (data.contains('TAB')) {
      tabulation = true;
      notifyListeners();
    }
    if (data.contains('CC')) {
      curiculam = true;
      notifyListeners();
    }

    log('Module Checked'.toString());

    notifyListeners();
  }
}
