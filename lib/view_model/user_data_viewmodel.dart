import 'package:flutter/material.dart';
import 'package:flutter_mvvm_architecture_with_rest_apis/model/UserDataModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserDataViewModel with ChangeNotifier {
  Future<bool> saveUser(UserDataModel userDataModel) async {
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString('token', userDataModel.token.toString());
    notifyListeners();
    return true;
  }

  Future<UserDataModel> getUserData() async {
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final String? token = sharedPreferences.getString('token');
    return UserDataModel(token: token);
  }

  Future<bool> remove() async {
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.clear();
  }
}
