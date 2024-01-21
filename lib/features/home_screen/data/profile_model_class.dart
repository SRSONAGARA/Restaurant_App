class UserDataModel {
  String? message;
  bool? success;
  List<Data>? data;

  UserDataModel({
    this.message,
    this.success,
    this.data,
  });

  factory UserDataModel.fromJson(Map<String, dynamic> json) => UserDataModel(
        message: json["message"],
        success: json["success"],
        data: List<Data>.from(json["data"].map((x) => Data.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "success": success,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Data {
  int clientId;
  String clientName;
  String clientPhone;
  DateTime createdDate;
  bool clientStatus;
  int clientGender;
  String password;
  String mail;
  dynamic birthDate;
  int points;
  dynamic longitude;
  dynamic latitude;
  int country;
  dynamic savedTime;
  dynamic createdMethod;
  dynamic userId;
  dynamic restId;
  dynamic lastSeen;
  dynamic avatar;
  int activationStep;
  int walletBalance;
  dynamic realTimeChannel;
  int freeQueue;
  dynamic subscription;
  dynamic subscriptionExpiredOn;
  int totalQueue;
  bool addedFreeQueue;
  String loginPassword;
  bool hasApp;
  dynamic otp;
  dynamic online;
  dynamic providerId;
  int id;
  int userid;
  String username;
  dynamic bio;
  int countryId;
  String countryName;
  bool countryStatus;
  String countryCode;
  String countryCurancy;
  String countryNameAr;
  String flag;
  bool restActive;
  int length;
  dynamic prefix;
  String shortCode;
  dynamic ticketActive;
  dynamic region;
  List<Setting> setting;
  Connections connections;
  Connections userconnections;
  Followlist followlist;

  Data({
    required this.clientId,
    required this.clientName,
    required this.clientPhone,
    required this.createdDate,
    required this.clientStatus,
    required this.clientGender,
    required this.password,
    required this.mail,
    required this.birthDate,
    required this.points,
    required this.longitude,
    required this.latitude,
    required this.country,
    required this.savedTime,
    required this.createdMethod,
    required this.userId,
    required this.restId,
    required this.lastSeen,
    required this.avatar,
    required this.activationStep,
    required this.walletBalance,
    required this.realTimeChannel,
    required this.freeQueue,
    required this.subscription,
    required this.subscriptionExpiredOn,
    required this.totalQueue,
    required this.addedFreeQueue,
    required this.loginPassword,
    required this.hasApp,
    required this.otp,
    required this.online,
    required this.providerId,
    required this.id,
    required this.userid,
    required this.username,
    required this.bio,
    required this.countryId,
    required this.countryName,
    required this.countryStatus,
    required this.countryCode,
    required this.countryCurancy,
    required this.countryNameAr,
    required this.flag,
    required this.restActive,
    required this.length,
    required this.prefix,
    required this.shortCode,
    required this.ticketActive,
    required this.region,
    required this.setting,
    required this.connections,
    required this.userconnections,
    required this.followlist,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        clientId: json["client_id"],
        clientName: json["client_name"],
        clientPhone: json["client_phone"],
        createdDate: DateTime.parse(json["created_date"]),
        clientStatus: json["client_status"],
        clientGender: json["client_gender"],
        password: json["password"],
        mail: json["mail"],
        birthDate: json["birthDate"],
        points: json["points"],
        longitude: json["longitude"],
        latitude: json["latitude"],
        country: json["country"],
        savedTime: json["savedTime"],
        createdMethod: json["createdMethod"],
        userId: json["userId"],
        restId: json["restId"],
        lastSeen: json["lastSeen"],
        avatar: json["avatar"],
        activationStep: json["activationStep"],
        walletBalance: json["walletBalance"],
        realTimeChannel: json["realTimeChannel"],
        freeQueue: json["freeQueue"],
        subscription: json["subscription"],
        subscriptionExpiredOn: json["subscriptionExpiredOn"],
        totalQueue: json["totalQueue"],
        addedFreeQueue: json["AddedFreeQueue"],
        loginPassword: json["LoginPassword"],
        hasApp: json["hasApp"],
        otp: json["OTP"],
        online: json["online"],
        providerId: json["providerId"],
        id: json["id"],
        userid: json["Userid"],
        username: json["Username"],
        bio: json["Bio"],
        countryId: json["country_id"],
        countryName: json["country_name"],
        countryStatus: json["country_status"],
        countryCode: json["country_code"],
        countryCurancy: json["country_curancy"],
        countryNameAr: json["country_name_ar"],
        flag: json["flag"],
        restActive: json["restActive"],
        length: json["length"],
        prefix: json["prefix"],
        shortCode: json["shortCode"],
        ticketActive: json["ticketActive"],
        region: json["region"],
        setting:
            List<Setting>.from(json["setting"].map((x) => Setting.fromJson(x))),
        connections: Connections.fromJson(json["connections"]),
        userconnections: Connections.fromJson(json["userconnections"]),
        followlist: Followlist.fromJson(json["followlist"]),
      );

  Map<String, dynamic> toJson() => {
        "client_id": clientId,
        "client_name": clientName,
        "client_phone": clientPhone,
        "created_date": createdDate.toIso8601String(),
        "client_status": clientStatus,
        "client_gender": clientGender,
        "password": password,
        "mail": mail,
        "birthDate": birthDate,
        "points": points,
        "longitude": longitude,
        "latitude": latitude,
        "country": country,
        "savedTime": savedTime,
        "createdMethod": createdMethod,
        "userId": userId,
        "restId": restId,
        "lastSeen": lastSeen,
        "avatar": avatar,
        "activationStep": activationStep,
        "walletBalance": walletBalance,
        "realTimeChannel": realTimeChannel,
        "freeQueue": freeQueue,
        "subscription": subscription,
        "subscriptionExpiredOn": subscriptionExpiredOn,
        "totalQueue": totalQueue,
        "AddedFreeQueue": addedFreeQueue,
        "LoginPassword": loginPassword,
        "hasApp": hasApp,
        "OTP": otp,
        "online": online,
        "providerId": providerId,
        "id": id,
        "Userid": userid,
        "Username": username,
        "Bio": bio,
        "country_id": countryId,
        "country_name": countryName,
        "country_status": countryStatus,
        "country_code": countryCode,
        "country_curancy": countryCurancy,
        "country_name_ar": countryNameAr,
        "flag": flag,
        "restActive": restActive,
        "length": length,
        "prefix": prefix,
        "shortCode": shortCode,
        "ticketActive": ticketActive,
        "region": region,
        "setting": List<dynamic>.from(setting.map((x) => x.toJson())),
        "connections": connections.toJson(),
        "userconnections": userconnections.toJson(),
        "followlist": followlist.toJson(),
      };
}

class Connections {
  int followList;
  int blockList;
  int muteList;

  Connections({
    required this.followList,
    required this.blockList,
    required this.muteList,
  });

  factory Connections.fromJson(Map<String, dynamic> json) => Connections(
        followList: json["follow_list"],
        blockList: json["block_list"],
        muteList: json["mute_list"],
      );

  Map<String, dynamic> toJson() => {
        "follow_list": followList,
        "block_list": blockList,
        "mute_list": muteList,
      };
}

class Followlist {
  int following;
  int follower;

  Followlist({
    required this.following,
    required this.follower,
  });

  factory Followlist.fromJson(Map<String, dynamic> json) => Followlist(
        following: json["following"],
        follower: json["follower"],
      );

  Map<String, dynamic> toJson() => {
        "following": following,
        "follower": follower,
      };
}

class Setting {
  int id;
  String country;
  String language;
  int termOfCondition;
  int chatMessages;
  int notificationSound;
  int profilePrivate;
  int queueVisible;
  int myOrder;
  int seated;
  int chatPrivicy;
  int commentFromAnyone;
  int notification;
  int userId;

  Setting({
    required this.id,
    required this.country,
    required this.language,
    required this.termOfCondition,
    required this.chatMessages,
    required this.notificationSound,
    required this.profilePrivate,
    required this.queueVisible,
    required this.myOrder,
    required this.seated,
    required this.chatPrivicy,
    required this.commentFromAnyone,
    required this.notification,
    required this.userId,
  });

  factory Setting.fromJson(Map<String, dynamic> json) => Setting(
        id: json["id"],
        country: json["Country"],
        language: json["language"],
        termOfCondition: json["Term_Of_Condition"],
        chatMessages: json["Chat_Messages"],
        notificationSound: json["Notification_Sound"],
        profilePrivate: json["Profile_Private"],
        queueVisible: json["Queue_visible"],
        myOrder: json["my_Order"],
        seated: json["Seated"],
        chatPrivicy: json["Chat_Privicy"],
        commentFromAnyone: json["Comment_From_Anyone"],
        notification: json["Notification"],
        userId: json["UserID"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "Country": country,
        "language": language,
        "Term_Of_Condition": termOfCondition,
        "Chat_Messages": chatMessages,
        "Notification_Sound": notificationSound,
        "Profile_Private": profilePrivate,
        "Queue_visible": queueVisible,
        "my_Order": myOrder,
        "Seated": seated,
        "Chat_Privicy": chatPrivicy,
        "Comment_From_Anyone": commentFromAnyone,
        "Notification": notification,
        "UserID": userId,
      };
}