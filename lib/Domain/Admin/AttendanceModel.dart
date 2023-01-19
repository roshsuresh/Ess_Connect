//Absentees Report

class AttendanceModel {
  AttendanceModel({
    this.studentId,
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
    this.selected
  });

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

  factory AttendanceModel.fromJson(Map<String, dynamic> json) => AttendanceModel(
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

  factory StudentAttendancetakenDatum.fromJson(Map<String, dynamic> json) => StudentAttendancetakenDatum(
    classTeacher: json["classTeacher"],
    division: json["division"],
    attendanceTaken: json["attendanceTaken"],
    afternoon: json["afternoon"],
    optedStaffs: json["optedStaffs"] == null ? [] : List<String?>.from(json["optedStaffs"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "classTeacher": classTeacher,
    "division": division,
    "attendanceTaken": attendanceTaken,
    "afternoon": afternoon,
    "optedStaffs": optedStaffs == null ? [] : List<dynamic>.from(optedStaffs!.map((x) => x)),
  };
}
