class StaffNotificationHistory {
  String? createdDate;
  List<String>? toStudent;
  String? fromStaff;
  String? title;
  String? body;

  StaffNotificationHistory(
      {this.createdDate,
      this.toStudent,
      this.fromStaff,
      this.title,
      this.body});

  StaffNotificationHistory.fromJson(Map<String, dynamic> json) {
    createdDate = json['createdDate'];
    toStudent = json['toStudent'].cast<String>();
    fromStaff = json['fromStaff'];
    title = json['title'];
    body = json['body'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['createdDate'] = createdDate;
    data['toStudent'] = toStudent;
    data['fromStaff'] = fromStaff;
    data['title'] = title;
    data['body'] = body;
    return data;
  }
}

//staff

class AdminStaffNotificationHistory {
  String? createdDate;
  List<String>? toStaff;
  String? fromStaff;
  String? title;
  String? body;

  AdminStaffNotificationHistory(
      {this.createdDate, this.toStaff, this.fromStaff, this.title, this.body});

  AdminStaffNotificationHistory.fromJson(Map<String, dynamic> json) {
    createdDate = json['createdDate'];
    toStaff = json['toStaff'].cast<String>();
    fromStaff = json['fromStaff'];
    title = json['title'];
    body = json['body'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['createdDate'] = createdDate;
    data['toStaff'] = toStaff;
    data['fromStaff'] = fromStaff;
    data['title'] = title;
    data['body'] = body;
    return data;
  }
}
