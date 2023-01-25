import 'dart:developer';
import 'package:essconnect/utils/constants.dart';
import 'package:flutter/material.dart';

class ModuleProviders extends ChangeNotifier {
  bool fees = false;
  bool tabulation = false;
  bool timetable = false;
  bool curiculam = false;
  bool offlineAttendence = false;
  bool offlineTab = false;
  bool attendenceEntry = false;
  Future getModuleDetails() async {
    var parsedResponse = await parseJWT();
    final newParse = await parsedResponse['Modules'];
    print(newParse);
    String data = await newParse;

    if (data.contains('FEE')) {
      fees = await true;
      notifyListeners();
      print('Fees Module Provided');
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
    if (data.contains('OFFLINE_ATT')) {
      offlineAttendence = true;
      notifyListeners();
    }
    if (data.contains('OFFLINE_TAB')) {
      offlineTab = true;
      notifyListeners();
    }

    if (data.contains('ATT')) {
      attendenceEntry = true;
      notifyListeners();
    }

    log('Module Checked '.toString());

    notifyListeners();
  }
}
