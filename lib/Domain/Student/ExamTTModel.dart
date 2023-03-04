class ExamTTModel {
  String? id;
  String? name;
  String? extension;
  String? path;
  String? url;
  bool? isTemporary;
  bool? isDeleted;
  Null? images;
  String? createdAt;
  String? examStartDate;
  String? examDescription;

  ExamTTModel(
      {this.id,
      this.name,
      this.extension,
      this.path,
      this.url,
      this.isTemporary,
      this.isDeleted,
      this.images,
      this.createdAt,
      this.examStartDate,
      this.examDescription});

  ExamTTModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    extension = json['extension'];
    path = json['path'];
    url = json['url'];
    isTemporary = json['isTemporary'];
    isDeleted = json['isDeleted'];
    images = json['images'];
    createdAt = json['createdAt'];
    examStartDate = json['examStartDate'];
    examDescription = json['examDescription'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['extension'] = this.extension;
    data['path'] = this.path;
    data['url'] = this.url;
    data['isTemporary'] = this.isTemporary;
    data['isDeleted'] = this.isDeleted;
    data['images'] = this.images;
    data['createdAt'] = this.createdAt;
    data['examStartDate'] = this.examStartDate;
    data['examDescription'] = this.examDescription;
    return data;
  }
}

class DivisionIdModel {
  String? divisionId;

  DivisionIdModel({this.divisionId});

  DivisionIdModel.fromJson(Map<String, dynamic> json) {
    divisionId = json['divisionId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['divisionId'] = this.divisionId;
    return data;
  }
}

class PreviewExamTimeTable {
  String? name;
  String? extension;
  String? path;
  String? url;
  bool? isTemporary;
  bool? isDeleted;
  Null? images;
  String? createdAt;
  String? id;

  PreviewExamTimeTable(
      {this.name,
      this.extension,
      this.path,
      this.url,
      this.isTemporary,
      this.isDeleted,
      this.images,
      this.createdAt,
      this.id});

  PreviewExamTimeTable.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    extension = json['extension'];
    path = json['path'];
    url = json['url'];
    isTemporary = json['isTemporary'];
    isDeleted = json['isDeleted'];
    images = json['images'];
    createdAt = json['createdAt'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['extension'] = this.extension;
    data['path'] = this.path;
    data['url'] = this.url;
    data['isTemporary'] = this.isTemporary;
    data['isDeleted'] = this.isDeleted;
    data['images'] = this.images;
    data['createdAt'] = this.createdAt;
    data['id'] = this.id;
    return data;
  }
}
