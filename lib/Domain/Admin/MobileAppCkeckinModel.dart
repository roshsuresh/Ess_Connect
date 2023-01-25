class MobileAppCheckinModel {
  bool? existapp;

  MobileAppCheckinModel({this.existapp});

  MobileAppCheckinModel.fromJson(Map<String, dynamic> json) {
    existapp = json['existapp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['existapp'] = this.existapp;
    return data;
  }
}
