import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mvvm_architecture_with_rest_apis/utils/routes/routes_name.dart';

import '../../model/UserDataModel.dart';
import '../../view_model/user_data_viewmodel.dart';

class SplashServices {
  Future<UserDataModel> getUser() => UserDataViewModel().getUserData();

  void checkAuthentication(BuildContext context) async {
    getUser().then((value) async {
      if (value.token == null || value.token == "") {
        await Future.delayed(Duration(seconds: 3));
        Navigator.pushNamed(context, RoutesName.login);
      } else {
        await Future.delayed(Duration(seconds: 3));
        Navigator.pushNamed(context, RoutesName.home);
      }
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }
}
