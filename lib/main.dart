import 'package:flutter/material.dart';
import 'package:flutter_mvvm_architecture_with_rest_apis/utils/routes/routes.dart';
import 'package:flutter_mvvm_architecture_with_rest_apis/utils/routes/routes_name.dart';
import 'package:flutter_mvvm_architecture_with_rest_apis/view/login_view.dart';
import 'package:flutter_mvvm_architecture_with_rest_apis/view_model/auth_viewmodel.dart';
import 'package:flutter_mvvm_architecture_with_rest_apis/view_model/user_data_viewmodel.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => AuthViewModel()),
          ChangeNotifierProvider(create: (_) => UserDataViewModel()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(brightness: Brightness.light),
          home: const LoginView(),
          initialRoute: RoutesName.splash,
          onGenerateRoute: Routes.generateRoute,
        ));
  }
}
