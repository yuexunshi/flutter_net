import 'package:flutter_nb_net/flutter_net.dart';

class UserWrapperModel extends BaseNetworkModel<UserWrapperModel> {
  UserWrapperModel({
    Data? data,
    num? errorCode,
    String? errorMsg,
  }) {
    _data = data;
    _errorCode = errorCode;
    _errorMsg = errorMsg;
  }

  @override
  UserWrapperModel fromJson(Map<String, dynamic> json) {
    return UserWrapperModel.fromJson(json);
  }

  UserWrapperModel.fromJson(dynamic json) {
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
    _errorCode = json['errorCode'];
    _errorMsg = json['errorMsg'];
  }

  Data? _data;
  num? _errorCode;
  String? _errorMsg;

  UserWrapperModel copyWith({
    Data? data,
    num? errorCode,
    String? errorMsg,
  }) =>
      UserWrapperModel(
        data: data ?? _data,
        errorCode: errorCode ?? _errorCode,
        errorMsg: errorMsg ?? _errorMsg,
      );

  Data? get data => _data;

  num? get errorCode => _errorCode;

  String? get errorMsg => _errorMsg;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    map['errorCode'] = _errorCode;
    map['errorMsg'] = _errorMsg;
    return map;
  }
}

class Data {
  Data({
    bool? admin,
    List<String>? chapterTops,
    num? coinCount,
    List<num>? collectIds,
    String? email,
    String? icon,
    num? id,
    String? nickname,
    String? password,
    String? publicName,
    String? token,
    num? type,
    String? username,
  }) {
    _admin = admin;
    _chapterTops = chapterTops;
    _coinCount = coinCount;
    _collectIds = collectIds;
    _email = email;
    _icon = icon;
    _id = id;
    _nickname = nickname;
    _password = password;
    _publicName = publicName;
    _token = token;
    _type = type;
    _username = username;
  }

  Data.fromJson(dynamic json) {
    _admin = json['admin'];
    if (json['chapterTops'] != null) {
      _chapterTops = [];
      json['chapterTops'].forEach((v) {
        _chapterTops?.add(v.toString());
      });
    }
    _coinCount = json['coinCount'];
    _collectIds =
        json['collectIds'] != null ? json['collectIds'].cast<num>() : [];
    _email = json['email'];
    _icon = json['icon'];
    _id = json['id'];
    _nickname = json['nickname'];
    _password = json['password'];
    _publicName = json['publicName'];
    _token = json['token'];
    _type = json['type'];
    _username = json['username'];
  }

  bool? _admin;
  List<String>? _chapterTops;
  num? _coinCount;
  List<num>? _collectIds;
  String? _email;
  String? _icon;
  num? _id;
  String? _nickname;
  String? _password;
  String? _publicName;
  String? _token;
  num? _type;
  String? _username;

  Data copyWith({
    bool? admin,
    List<String>? chapterTops,
    num? coinCount,
    List<num>? collectIds,
    String? email,
    String? icon,
    num? id,
    String? nickname,
    String? password,
    String? publicName,
    String? token,
    num? type,
    String? username,
  }) =>
      Data(
        admin: admin ?? _admin,
        chapterTops: chapterTops ?? _chapterTops,
        coinCount: coinCount ?? _coinCount,
        collectIds: collectIds ?? _collectIds,
        email: email ?? _email,
        icon: icon ?? _icon,
        id: id ?? _id,
        nickname: nickname ?? _nickname,
        password: password ?? _password,
        publicName: publicName ?? _publicName,
        token: token ?? _token,
        type: type ?? _type,
        username: username ?? _username,
      );

  bool? get admin => _admin;

  List<dynamic>? get chapterTops => _chapterTops;

  num? get coinCount => _coinCount;

  List<num>? get collectIds => _collectIds;

  String? get email => _email;

  String? get icon => _icon;

  num? get id => _id;

  String? get nickname => _nickname;

  String? get password => _password;

  String? get publicName => _publicName;

  String? get token => _token;

  num? get type => _type;

  String? get username => _username;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['admin'] = _admin;
    if (_chapterTops != null) {
      map['chapterTops'] = _chapterTops;
    }
    map['coinCount'] = _coinCount;
    map['collectIds'] = _collectIds;
    map['email'] = _email;
    map['icon'] = _icon;
    map['id'] = _id;
    map['nickname'] = _nickname;
    map['password'] = _password;
    map['publicName'] = _publicName;
    map['token'] = _token;
    map['type'] = _type;
    map['username'] = _username;
    return map;
  }
}
