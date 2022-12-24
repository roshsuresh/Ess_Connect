class MarkEntryInitialValues {
  String? id;
  String? courseName;
  int? sortOrder;

  MarkEntryInitialValues({this.id, this.courseName, this.sortOrder});

  MarkEntryInitialValues.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    courseName = json['courseName'];
    sortOrder = json['sortOrder'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['courseName'] = courseName;
    data['sortOrder'] = sortOrder;
    return data;
  }
}

class MarkEntryDivisionList {
  String? value;
  String? text;
  int? order;

  MarkEntryDivisionList({this.value, this.text, this.order});

  MarkEntryDivisionList.fromJson(Map<String, dynamic> json) {
    value = json['value'];
    text = json['text'];
    order = json['order'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['value'] = value;
    data['text'] = text;
    data['order'] = order;
    return data;
  }
}

class MarkEntryPartList {
  String? value;
  String? text;
  int? order;

  MarkEntryPartList({this.value, this.text, this.order});

  MarkEntryPartList.fromJson(Map<String, dynamic> json) {
    value = json['value'];
    text = json['text'];
    order = json['order'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['value'] = value;
    data['text'] = text;
    data['order'] = order;
    return data;
  }
}

class MarkEntrySubjectList {
  String? value;
  String? text;

  MarkEntrySubjectList({
    this.value,
    this.text,
  });

  MarkEntrySubjectList.fromJson(Map<String, dynamic> json) {
    value = json['value'];
    text = json['text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['value'] = value;
    data['text'] = text;
    return data;
  }
}

class MarkEntryExamList {
  String? value;
  String? text;

  MarkEntryExamList({this.value, this.text});

  MarkEntryExamList.fromJson(Map<String, dynamic> json) {
    value = json['value'];
    text = json['text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['value'] = value;
    data['text'] = text;

    return data;
  }
}
