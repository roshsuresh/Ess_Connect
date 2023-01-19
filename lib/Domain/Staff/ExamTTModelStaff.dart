class ExamTTmodelStaff {
  List<CourseExam>? courses;
  bool? isClassTeacher;

  ExamTTmodelStaff({this.courses, this.isClassTeacher});

  ExamTTmodelStaff.fromJson(Map<String, dynamic> json) {
    if (json['courses'] != null) {
      courses = <CourseExam>[];
      json['courses'].forEach((v) {
        courses!.add(new CourseExam.fromJson(v));
      });
    }

    isClassTeacher = json['isClassTeacher'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.courses != null) {
      data['courses'] = this.courses!.map((v) => v.toJson()).toList();
    }

    data['isClassTeacher'] = this.isClassTeacher;
    return data;
  }
}

class CourseExam {
  String? id;
  String? courseName;
  int? sortOrder;

  CourseExam({this.id, this.courseName, this.sortOrder});

  CourseExam.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    courseName = json['courseName'];
    sortOrder = json['sortOrder'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['courseName'] = this.courseName;
    data['sortOrder'] = this.sortOrder;
    return data;
  }
}

class DivisionsExam {
  String? value;
  String? text;
  Null? selected;
  Null? active;
  Null? order;

  DivisionsExam(
      {this.value, this.text, this.selected, this.active, this.order});

  DivisionsExam.fromJson(Map<String, dynamic> json) {
    value = json['value'];
    text = json['text'];
    selected = json['selected'];
    active = json['active'];
    order = json['order'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['value'] = this.value;
    data['text'] = this.text;
    data['selected'] = this.selected;
    data['active'] = this.active;
    data['order'] = this.order;
    return data;
  }
}
