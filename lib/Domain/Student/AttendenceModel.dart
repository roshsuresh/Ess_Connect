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
      monthwiseAttendence = [];
      json['monthwiseAttendence'].forEach((v) {
        monthwiseAttendence!.add(new MonthwiseAttendence.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['workDays'] = workDays;
    data['presentDays'] = presentDays;
    data['absentDays'] = absentDays;
    data['attendancePercentage'] = attendancePercentage;
    data['attendanceAsOnDate'] = attendanceAsOnDate;
    if (monthwiseAttendence != null) {
      data['monthwiseAttendence'] =
          monthwiseAttendence!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MonthwiseAttendence {
  String? month;
  String? attMonthId;
  int? totalWorkingDays;
  double? daysPresent;
  double? daysAbsent;
  double? percentage;

  MonthwiseAttendence(
      {this.month,
      this.attMonthId,
      this.totalWorkingDays,
      this.daysPresent,
      this.daysAbsent,
      this.percentage});

  MonthwiseAttendence.fromJson(Map<String, dynamic> json) {
    month = json['month'];
    attMonthId = json['attMonthId'];
    totalWorkingDays = json['totalWorkingDays'];
    daysPresent = json['daysPresent'];
    daysAbsent = json['daysAbsent'];
    percentage = json['percentage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['month'] = month;
    data['attMonthId'] = attMonthId;
    data['totalWorkingDays'] = totalWorkingDays;
    data['daysPresent'] = daysPresent;
    data['daysAbsent'] = daysAbsent;
    data['percentage'] = percentage;
    return data;
  }
}
