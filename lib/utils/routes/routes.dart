import 'package:flutter/material.dart';
import 'package:flutter_mvvm_architecture_with_rest_apis/utils/routes/routes_name.dart';
import 'package:flutter_mvvm_architecture_with_rest_apis/view/home_screen.dart';
import 'package:flutter_mvvm_architecture_with_rest_apis/view/login_view.dart';
import 'package:flutter_mvvm_architecture_with_rest_apis/view/signup_view.dart';
import 'package:flutter_mvvm_architecture_with_rest_apis/view/splash_view.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.splash:
        return MaterialPageRoute(builder: (BuildContext context) => SplashView());
      case RoutesName.login:
        return MaterialPageRoute(builder: (BuildContext context) => LoginView());
      case RoutesName.signup:
        return MaterialPageRoute(builder: (BuildContext context) => SignUpView());
      case RoutesName.home:
        return MaterialPageRoute(builder: (BuildContext context) => HomeScreen());
      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(body: Center(child: Text("No routes found")));
        });
    }
  }
}
