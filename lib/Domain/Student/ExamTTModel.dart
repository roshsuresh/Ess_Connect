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
    examDescription = json['examDescription'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['extension'] = extension;
    data['path'] = path;
    data['url'] = url;
    data['isTemporary'] = isTemporary;
    data['isDeleted'] = isDeleted;
    data['images'] = images;
    data['createdAt'] = createdAt;
    data['examDescription'] = examDescription;
    return data;
  }
}
