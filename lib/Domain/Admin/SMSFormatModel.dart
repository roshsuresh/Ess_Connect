class SMSfomatModel {
  String? text;
  String? value;
  bool? isApproved;

  SMSfomatModel({this.text, this.value, this.isApproved});

  SMSfomatModel.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    value = json['value'];
    isApproved = json['isApproved'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['text'] = this.text;
    data['value'] = this.value;
    data['isApproved'] = this.isApproved;
    return data;
  }
}

class SMSContentModel {
  String? id;
  String? name;
  String? smsBody;
  Null? content;
  bool? isApproved;

  SMSContentModel(
      {this.id, this.name, this.smsBody, this.content, this.isApproved});

  SMSContentModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    smsBody = json['smsBody'];
    content = json['content'];
    isApproved = json['isApproved'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['smsBody'] = this.smsBody;
    data['content'] = this.content;
    data['isApproved'] = this.isApproved;
    return data;
  }
}
