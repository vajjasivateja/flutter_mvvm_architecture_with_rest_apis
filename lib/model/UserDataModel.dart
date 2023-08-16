/// token : "QpwL5tke4Pnpja7X4"

class UserDataModel {
  String? _token;

  String? get token => _token;

  UserDataModel({String? token}) {
    _token = token;
  }

  UserDataModel.fromJson(dynamic json) {
    _token = json['token'];
  }

  UserDataModel copyWith({String? token}) => UserDataModel(token: token ?? _token);

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['token'] = _token;
    return map;
  }
}
