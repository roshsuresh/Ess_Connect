class AttendencePercentageModel {
  AttendenceModel? attendence;
  double? percentage;

  AttendencePercentageModel({this.attendence, this.percentage});

  AttendencePercentageModel.fromJson(Map<String, dynamic> json) {
    attendence = json['attendence'] != null
        ? AttendenceModel.fromJson(json['attendence'])
        : null;
    percentage = json['percentage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.attendence != null) {
      data['attendence'] = this.attendence!.toJson();
    }
    data['percentage'] = this.percentage;
    return data;
  }
}

class AttendenceModel {
  double? workDays;
  double? presentDays;
  double? absentDays;
  double? attendancePercentage;
  String? attendanceAsOnDate;
  List<MonthwiseAttendence>? monthwiseAttendence;

  AttendenceModel(
      {this.workDays,
      this.presentDays,
      this.absentDays,
      this.attendancePercentage,
      this.attendanceAsOnDate,
      this.monthwiseAttendence});

  AttendenceModel.fromJson(Map<String, dynamic> json) {
    workDays = json['workDays'];
    presentDays = json['presentDays'];
    absentDays = json['absentDays'];
    attendancePercentage = json['attendancePercentage'];
    attendanceAsOnDate = json['attendanceAsOnDate'];
    if (json['monthwiseAttendence'] != null) {
      monthwiseAttendence = <MonthwiseAttendence>[];
      json['monthwiseAttendence'].forEach((v) {
        monthwiseAttendence!.add(new MonthwiseAttendence.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['workDays'] = this.workDays;
    data['presentDays'] = this.presentDays;
    data['absentDays'] = this.absentDays;
    data['attendancePercentage'] = this.attendancePercentage;
    data['attendanceAsOnDate'] = this.attendanceAsOnDate;
    if (this.monthwiseAttendence != null) {
      data['monthwiseAttendence'] =
          this.monthwiseAttendence!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MonthwiseAttendence {
  String? month;
  double? monthres;
  String? attMonthId;
  int? totalWorkingDays;
  double? daysPresent;
  double? daysAbsent;
  double? percentage;

  MonthwiseAttendence(
      {this.month,
      this.monthres,
      this.attMonthId,
      this.totalWorkingDays,
      this.daysPresent,
      this.daysAbsent,
      this.percentage});

  MonthwiseAttendence.fromJson(Map<String, dynamic> json) {
    month = json['month'];
    monthres = json['monthres'];
    attMonthId = json['attMonthId'];
    totalWorkingDays = json['totalWorkingDays'];
    daysPresent = json['daysPresent'];
    daysAbsent = json['daysAbsent'];
    percentage = json['percentage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['month'] = this.month;
    data['monthres'] = this.monthres;
    data['attMonthId'] = this.attMonthId;
    data['totalWorkingDays'] = this.totalWorkingDays;
    data['daysPresent'] = this.daysPresent;
    data['daysAbsent'] = this.daysAbsent;
    data['percentage'] = this.percentage;
    return data;
  }
}
