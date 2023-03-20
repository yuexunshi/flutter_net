import 'package:flutter_nb_net/flutter_net.dart';

class UserModel extends BaseNetworkModel<UserModel> {
  UserModel({
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

  UserModel.fromJson(dynamic json) {
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

  UserModel copyWith({
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
      UserModel(
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

  @override
  UserModel fromJson(Map<String, dynamic> json) {
    return UserModel.fromJson(json);
  }
}
