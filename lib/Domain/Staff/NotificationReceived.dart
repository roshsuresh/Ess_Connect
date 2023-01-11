class StaffNotificationReceivedModel {
  String? mobileNotificationDetId;
  String? createdDate;
  String? fromStaff;
  String? title;
  String? body;
  bool? isSeen;

  StaffNotificationReceivedModel(
      {this.mobileNotificationDetId,
      this.createdDate,
      this.fromStaff,
      this.title,
      this.body,
      this.isSeen});

  StaffNotificationReceivedModel.fromJson(Map<String, dynamic> json) {
    mobileNotificationDetId = json['mobileNotificationDetId'];
    createdDate = json['createdDate'];
    fromStaff = json['fromStaff'];
    title = json['title'];
    body = json['body'];
    isSeen = json['isSeen'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mobileNotificationDetId'] = this.mobileNotificationDetId;
    data['createdDate'] = this.createdDate;
    data['fromStaff'] = this.fromStaff;
    data['title'] = this.title;
    data['body'] = this.body;
    data['isSeen'] = this.isSeen;
    return data;
  }
}
