class NoticeBoardListAdmin {
  String? id;
  String? createdStaffId;
  String? createStaffName;
  String? entryDate;
  String? category;
  String? displayTo;
  String? createdAt;
  String? title;
  String? startDate;
  String? endDate;
  bool? approved;
  bool? cancelled;

  NoticeBoardListAdmin({
    this.id,
    this.createdStaffId,
    this.createStaffName,
    this.entryDate,
    this.category,
    this.displayTo,
    this.createdAt,
    this.title,
    this.startDate,
    this.endDate,
    this.approved,
    this.cancelled,
  });

  NoticeBoardListAdmin.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdStaffId = json['createdStaffId'];
    createStaffName = json['createStaffName'];
    entryDate = json['entryDate'];
    category = json['category'];
    displayTo = json['displayTo'];
    createdAt = json['createdAt'];
    title = json['title'];
    startDate = json['startDate'];
    endDate = json['endDate'];
    approved = json['approved'];
    cancelled = json['cancelled'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['createdStaffId'] = createdStaffId;
    data['createStaffName'] = createStaffName;
    data['entryDate'] = entryDate;
    data['category'] = category;
    data['displayTo'] = displayTo;
    data['createdAt'] = createdAt;
    data['title'] = title;
    data['startDate'] = startDate;
    data['endDate'] = endDate;
    data['approved'] = approved;
    data['cancelled'] = cancelled;

    return data;
  }
}
