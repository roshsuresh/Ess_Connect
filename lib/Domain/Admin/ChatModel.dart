class ChatUserIdsModel {
  String? receiveUserRole;
  String? sendUserRole;
  String? lastChatTime;
  String? createdAt;
  bool? isToday;
  String? userId;
  String? sendUserId;
  String? receiveUserId;
  String? name;
  String? shortName;
  String? status;
  Null? lastChatMessage;
  Null? isPinnedUser;
  Null? isMuted;
  bool? isActiveChat;
  int? unreadMessageCount;
  Null? avatar;
  Null? chats;

  ChatUserIdsModel(
      {this.receiveUserRole,
      this.sendUserRole,
      this.lastChatTime,
      this.createdAt,
      this.isToday,
      this.userId,
      this.sendUserId,
      this.receiveUserId,
      this.name,
      this.shortName,
      this.status,
      this.lastChatMessage,
      this.isPinnedUser,
      this.isMuted,
      this.isActiveChat,
      this.unreadMessageCount,
      this.avatar,
      this.chats});

  ChatUserIdsModel.fromJson(Map<String, dynamic> json) {
    receiveUserRole = json['receiveUserRole'];
    sendUserRole = json['sendUserRole'];
    lastChatTime = json['lastChatTime'];
    createdAt = json['createdAt'];
    isToday = json['isToday'];
    userId = json['userId'];
    sendUserId = json['sendUserId'];
    receiveUserId = json['receiveUserId'];
    name = json['name'];
    shortName = json['shortName'];
    status = json['status'];
    lastChatMessage = json['lastChatMessage'];
    isPinnedUser = json['isPinnedUser'];
    isMuted = json['isMuted'];
    isActiveChat = json['isActiveChat'];
    unreadMessageCount = json['unreadMessageCount'];
    avatar = json['avatar'];
    chats = json['chats'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['receiveUserRole'] = this.receiveUserRole;
    data['sendUserRole'] = this.sendUserRole;
    data['lastChatTime'] = this.lastChatTime;
    data['createdAt'] = this.createdAt;
    data['isToday'] = this.isToday;
    data['userId'] = this.userId;
    data['sendUserId'] = this.sendUserId;
    data['receiveUserId'] = this.receiveUserId;
    data['name'] = this.name;
    data['shortName'] = this.shortName;
    data['status'] = this.status;
    data['lastChatMessage'] = this.lastChatMessage;
    data['isPinnedUser'] = this.isPinnedUser;
    data['isMuted'] = this.isMuted;
    data['isActiveChat'] = this.isActiveChat;
    data['unreadMessageCount'] = this.unreadMessageCount;
    data['avatar'] = this.avatar;
    data['chats'] = this.chats;
    return data;
  }
}

/// contact list
///
class ChatContactListmodel {
  String? receiveUserRole;
  String? sendUserRole;
  String? lastChatTime;
  String? createdAt;
  bool? isToday;
  String? userId;
  String? sendUserId;
  String? receiveUserId;
  String? name;
  String? shortName;
  String? status;
  String? lastChatMessage;
  String? isPinnedUser;
  Null? isMuted;
  bool? isActiveChat;
  Null? unreadMessageCount;
  Null? avatar;
  Null? chats;

  ChatContactListmodel(
      {this.receiveUserRole,
      this.sendUserRole,
      this.lastChatTime,
      this.createdAt,
      this.isToday,
      this.userId,
      this.sendUserId,
      this.receiveUserId,
      this.name,
      this.shortName,
      this.status,
      this.lastChatMessage,
      this.isPinnedUser,
      this.isMuted,
      this.isActiveChat,
      this.unreadMessageCount,
      this.avatar,
      this.chats});

  ChatContactListmodel.fromJson(Map<String, dynamic> json) {
    receiveUserRole = json['receiveUserRole'];
    sendUserRole = json['sendUserRole'];
    lastChatTime = json['lastChatTime'];
    createdAt = json['createdAt'];
    isToday = json['isToday'];
    userId = json['userId'];
    sendUserId = json['sendUserId'];
    receiveUserId = json['receiveUserId'];
    name = json['name'];
    shortName = json['shortName'];
    status = json['status'];
    lastChatMessage = json['lastChatMessage'];
    isPinnedUser = json['isPinnedUser'];
    isMuted = json['isMuted'];
    isActiveChat = json['isActiveChat'];
    unreadMessageCount = json['unreadMessageCount'];
    avatar = json['avatar'];
    chats = json['chats'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['receiveUserRole'] = this.receiveUserRole;
    data['sendUserRole'] = this.sendUserRole;
    data['lastChatTime'] = this.lastChatTime;
    data['createdAt'] = this.createdAt;
    data['isToday'] = this.isToday;
    data['userId'] = this.userId;
    data['sendUserId'] = this.sendUserId;
    data['receiveUserId'] = this.receiveUserId;
    data['name'] = this.name;
    data['shortName'] = this.shortName;
    data['status'] = this.status;
    data['lastChatMessage'] = this.lastChatMessage;
    data['isPinnedUser'] = this.isPinnedUser;
    data['isMuted'] = this.isMuted;
    data['isActiveChat'] = this.isActiveChat;
    data['unreadMessageCount'] = this.unreadMessageCount;
    data['avatar'] = this.avatar;
    data['chats'] = this.chats;
    return data;
  }
}
