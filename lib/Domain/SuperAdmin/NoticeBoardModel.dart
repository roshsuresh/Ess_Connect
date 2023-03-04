class NoticeBoardViewSuperAdmin {
  String? noticeId;
  String? noticeBoardFileid;
  Null? noticeBoardFile;
  String? title;
  String? matter;
  String? createdAt;
  String? entryDate;
  String? entryTime;
  String? staffId;
  String? staffName;
  Null? staffPhotoId;
  Null? staffPhoto;
  bool? forClassTeachers;
  bool? approved;
  bool? cancelled;
  int? displayTo;

  NoticeBoardViewSuperAdmin({
    this.noticeId,
    this.noticeBoardFileid,
    this.noticeBoardFile,
    this.title,
    this.matter,
    this.createdAt,
    this.entryDate,
    this.entryTime,
    this.staffId,
    this.staffName,
    this.staffPhotoId,
    this.staffPhoto,
    this.forClassTeachers,
    this.approved,
    this.cancelled,
    this.displayTo,
  });

  NoticeBoardViewSuperAdmin.fromJson(Map<String, dynamic> json) {
    noticeId = json['noticeId'];
    noticeBoardFileid = json['noticeBoardFileid'];
    noticeBoardFile = json['noticeBoardFile'];
    title = json['title'];
    matter = json['matter'];
    createdAt = json['createdAt'];
    entryDate = json['entryDate'];
    entryTime = json['entryTime'];
    staffId = json['staffId'];
    staffName = json['staffName'];
    staffPhotoId = json['staffPhotoId'];
    staffPhoto = json['staffPhoto'];
    forClassTeachers = json['forClassTeachers'];
    approved = json['approved'];
    cancelled = json['cancelled'];
    displayTo = json['displayTo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['noticeId'] = this.noticeId;
    data['noticeBoardFileid'] = this.noticeBoardFileid;
    data['noticeBoardFile'] = this.noticeBoardFile;
    data['title'] = this.title;
    data['matter'] = this.matter;
    data['createdAt'] = this.createdAt;
    data['entryDate'] = this.entryDate;
    data['entryTime'] = this.entryTime;
    data['staffId'] = this.staffId;
    data['staffName'] = this.staffName;
    data['staffPhotoId'] = this.staffPhotoId;
    data['staffPhoto'] = this.staffPhoto;
    data['forClassTeachers'] = this.forClassTeachers;
    data['approved'] = this.approved;
    data['cancelled'] = this.cancelled;
    data['displayTo'] = this.displayTo;

    return data;
  }
}
