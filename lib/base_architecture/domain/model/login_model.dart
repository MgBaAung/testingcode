import 'package:testingapp/base_architecture/core/master_object.dart';

// ignore: must_be_immutable
class LoginModel extends MasterObject<LoginModel> {
  String? username;
  String? password;
  String? token;
  LoginModel({String? id, this.username, this.password, this.token})
    : super(id: (id).toString());

  @override
  LoginModel fromMap(dynamicData) {
    return LoginModel(
      id: dynamicData['id'],
      username: dynamicData['username'],
      password: dynamicData['password'],
      token: dynamicData['token'],
    );
  }

  @override
  List<LoginModel> fromMapList(List dynamicDataList) {
    throw UnimplementedError();
  }

  @override
  Map<String, dynamic>? toMap(LoginModel object) {
    return {
      'id': object.id,
      'username': object.username,
      'password': object.password,
    };
  }

  @override
  List<Map<String, dynamic>?> toMapList(List<LoginModel> objectList) {
    throw UnimplementedError();
  }
}
