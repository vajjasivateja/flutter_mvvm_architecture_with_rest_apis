import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_mvvm_architecture_with_rest_apis/repository/auth_repository.dart';
import 'package:flutter_mvvm_architecture_with_rest_apis/utils/routes/routes_name.dart';
import 'package:flutter_mvvm_architecture_with_rest_apis/utils/utils.dart';

class AuthViewModel with ChangeNotifier {
  final _repository = AuthRepository();
  bool _loading = false;
  bool get loading => _loading;

  bool _signupLoading = false;
  bool get signupLoading => _signupLoading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  setSignupLoading(bool value) {
    _signupLoading = value;
    notifyListeners();
  }

  Future<void> loginApi(dynamic data, BuildContext context) async {
    setLoading(true);
    _repository.loginApi(data).then((value) {
      setLoading(false);
      Utils.flushBarSuccessMessage("Login Successful", context);
      if (kDebugMode) {
        print(value.toString());
      }
      Navigator.pushNamed(context, RoutesName.home);
    }).onError((error, stackTrace) {
      setLoading(false);
      Utils.flushBarErrorMessage(error.toString(), context);
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }

  Future<void> signup(dynamic data, BuildContext context) async {
    setSignupLoading(true);
    _repository.registerApi(data).then((value) {
      setSignupLoading(false);
      Utils.flushBarSuccessMessage("Signup Successful", context);
      if (kDebugMode) {
        print(value.toString());
      }
      Navigator.pushNamed(context, RoutesName.home);
    }).onError((error, stackTrace) {
      setSignupLoading(false);
      Utils.flushBarErrorMessage(error.toString(), context);
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }
}
