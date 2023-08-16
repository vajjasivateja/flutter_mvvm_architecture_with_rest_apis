import 'package:flutter/material.dart';

import '../view_model/services/splsh_services.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  SplashServices services = SplashServices();

  @override
  void initState() {
    super.initState();
    services.checkAuthentication(context);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Center(
        child: Text("Splash screen", style: Theme.of(context).textTheme.bodyMedium),
      ),
    ));
  }
}
