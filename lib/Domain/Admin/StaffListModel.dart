class StaffReportNotification {
  String? id;
  String? name;
  String? sectionId;
  String? designation;
  String? staffRole;
  bool? selected;

  StaffReportNotification({
    required this.id,
    required this.name,
    required this.sectionId,
    required this.designation,
    required this.staffRole,
    required this.selected,
  });

  StaffReportNotification.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    sectionId = json['sectionId'];
    designation = json['designation'];
    staffRole = json['staffRole'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['sectionId'] = sectionId;
    data['designation'] = designation;
    data['staffRole'] = staffRole;
    data['id'] = id;

    return data;
  }
}
