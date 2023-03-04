//Absentees Report

class AttendanceModel {
  AttendanceModel(
      {this.studentId,
      this.admNo,
      this.rollNo,
      this.name,
      this.divisionId,
      this.division,
      this.attendanceDate,
      this.isattendanceTaken,
      this.absentDayForeNoon,
      this.absentDayAfterNoon,
      this.guardianName,
      this.mobileNo,
      this.checked,
      this.terminatedStatus,
      this.selected});

  String? studentId;
  String? admNo;
  String? rollNo;
  String? name;
  String? divisionId;
  String? division;
  String? attendanceDate;
  bool? isattendanceTaken;
  bool? absentDayForeNoon;
  bool? absentDayAfterNoon;
  String? guardianName;
  String? mobileNo;
  bool? checked;
  bool? terminatedStatus;
  bool? selected;

  factory AttendanceModel.fromJson(Map<String, dynamic> json) =>
      AttendanceModel(
        studentId: json["studentId"],
        admNo: json["admNo"],
        rollNo: json["rollNo"],
        name: json["name"],
        divisionId: json["divisionId"],
        division: json["division"],
        attendanceDate: json["attendanceDate"],
        isattendanceTaken: json["isattendanceTaken"],
        absentDayForeNoon: json["absentDayForeNoon"],
        absentDayAfterNoon: json["absentDayAfterNoon"],
        guardianName: json["guardianName"],
        mobileNo: json["mobileNo"],
        checked: json["checked"],
        terminatedStatus: json["terminatedStatus"],
      );

  Map<String, dynamic> toJson() => {
        "studentId": studentId,
        "admNo": admNo,
        "rollNo": rollNo,
        "name": name,
        "divisionId": divisionId,
        "division": division,
        "attendanceDate": attendanceDate,
        "isattendanceTaken": isattendanceTaken,
        "absentDayForeNoon": absentDayForeNoon,
        "absentDayAfterNoon": absentDayAfterNoon,
        "guardianName": guardianName,
        "mobileNo": mobileNo,
        "checked": checked,
        "terminatedStatus": terminatedStatus,
      };
}

//Taken/Not
class StudentAttendancetakenDatum {
  StudentAttendancetakenDatum({
    this.classTeacher,
    this.division,
    this.attendanceTaken,
    this.afternoon,
    this.optedStaffs,
  });

  String? classTeacher;
  String? division;
  String? attendanceTaken;
  dynamic afternoon;
  List<String?>? optedStaffs;

  factory StudentAttendancetakenDatum.fromJson(Map<String, dynamic> json) =>
      StudentAttendancetakenDatum(
        classTeacher: json["classTeacher"],
        division: json["division"],
        attendanceTaken: json["attendanceTaken"],
        afternoon: json["afternoon"],
        optedStaffs: json["optedStaffs"] == null
            ? []
            : List<String?>.from(json["optedStaffs"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "classTeacher": classTeacher,
        "division": division,
        "attendanceTaken": attendanceTaken,
        "afternoon": afternoon,
        "optedStaffs": optedStaffs == null
            ? []
            : List<dynamic>.from(optedStaffs!.map((x) => x)),
      };
}

class AttendanceSmsFormat {
  AttendanceSmsFormat({
    required this.text,
    required this.value,
    required this.isApproved,
  });

  String text;
  String value;
  bool isApproved;

  factory AttendanceSmsFormat.fromJson(Map<String, dynamic> json) =>
      AttendanceSmsFormat(
        text: json["text"],
        value: json["value"],
        isApproved: json["isApproved"],
      );

  Map<String, dynamic> toJson() => {
        "text": text,
        "value": value,
        "isApproved": isApproved,
      };
}

// SendSms

class AttendanceSmsSave {
  AttendanceSmsSave({
    required this.id,
    required this.sendFailed,
    required this.sendSuccess,
    required this.typeSend,
  });

  String id;
  int sendFailed;
  int sendSuccess;
  String typeSend;

  factory AttendanceSmsSave.fromJson(Map<String, dynamic> json) =>
      AttendanceSmsSave(
        id: json["id"],
        sendFailed: json["sendFailed"],
        sendSuccess: json["sendSuccess"],
        typeSend: json["typeSend"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "sendFailed": sendFailed,
        "sendSuccess": sendSuccess,
        "typeSend": typeSend,
      };
}

//smsprovider

class SmsProvider {
  SmsProvider({
    required this.currentSmsProvider,
  });

  CurrentSmsProvider currentSmsProvider;

  factory SmsProvider.fromJson(Map<String, dynamic> json) => SmsProvider(
        currentSmsProvider:
            CurrentSmsProvider.fromJson(json["currentSmsProvider"]),
      );

  Map<String, dynamic> toJson() => {
        "currentSmsProvider": currentSmsProvider.toJson(),
      };
}

class CurrentSmsProvider {
  CurrentSmsProvider({
    required this.smstype,
    required this.senderId,
    required this.providerName,
    required this.providerId,
  });

  String? smstype;
  String? senderId;
  String? providerName;
  String? providerId;

  factory CurrentSmsProvider.fromJson(Map<String, dynamic> json) =>
      CurrentSmsProvider(
        smstype: json["smstype"],
        senderId: json["senderId"],
        providerName: json["providerName"],
        providerId: json["providerId"],
      );

  Map<String, dynamic> toJson() => {
        "smstype": smstype,
        "senderId": senderId,
        "providerName": providerName,
        "providerId": providerId,
      };
}
