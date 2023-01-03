class DiaryList {
  String? uploadedDate;
  String? name;
  String? remarksDate;
  String? category;
  String? remarks;
  bool? isImportant;

  DiaryList(
      {this.uploadedDate,
      this.name,
      this.remarksDate,
      this.category,
      this.remarks,
      this.isImportant});

  DiaryList.fromJson(Map<String, dynamic> json) {
    uploadedDate = json['uploadedDate'];
    name = json['name'];
    remarksDate = json['remarksDate'];
    category = json['category'];
    remarks = json['remarks'];
    isImportant = json['isImportant'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uploadedDate'] = this.uploadedDate;
    data['name'] = this.name;
    data['remarksDate'] = this.remarksDate;
    data['category'] = this.category;
    data['remarks'] = this.remarks;
    data['isImportant'] = this.isImportant;
    return data;
  }
}
