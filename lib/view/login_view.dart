import 'package:flutter/material.dart';
import 'package:flutter_mvvm_architecture_with_rest_apis/res/components/rounded_button.dart';
import 'package:flutter_mvvm_architecture_with_rest_apis/utils/routes/routes_name.dart';
import 'package:flutter_mvvm_architecture_with_rest_apis/utils/utils.dart';
import 'package:flutter_mvvm_architecture_with_rest_apis/view_model/auth_viewmodel.dart';
import 'package:provider/provider.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  //to enable disable password visibility
  ValueNotifier<bool> _obsecurePassword = ValueNotifier<bool>(true);

  //textfield textlistner/textcontroller
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  //change focus to next textfield using FocusNode
  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();

    emailFocusNode.dispose();
    passwordFocusNode.dispose();

    _obsecurePassword.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 1;
    final authViewModel = Provider.of<AuthViewModel>(context);
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Login", style: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold)),
              SizedBox(height: 50),
              TextFormField(
                focusNode: emailFocusNode,
                onFieldSubmitted: (value) {
                  Utils.filedFocusChange(context, emailFocusNode, passwordFocusNode);
                },
                keyboardType: TextInputType.emailAddress,
                controller: emailController,
                decoration: const InputDecoration(
                    hintText: "Email",
                    labelText: "Email",
                    prefixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    )),
              ),
              SizedBox(height: 20),
              ValueListenableBuilder(
                  valueListenable: _obsecurePassword,
                  builder: (context, value, child) {
                    return TextFormField(
                      obscureText: _obsecurePassword.value,
                      controller: passwordController,
                      focusNode: passwordFocusNode,
                      obscuringCharacter: "*",
                      onFieldSubmitted: (value) {},
                      decoration: InputDecoration(
                          hintText: "Password",
                          labelText: "Password",
                          prefixIcon: Icon(Icons.key),
                          suffixIcon: InkWell(
                            child: Icon(_obsecurePassword.value ? Icons.visibility_off_outlined : Icons.visibility),
                            onTap: () {
                              _obsecurePassword.value = !_obsecurePassword.value;
                            },
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(),
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          )),
                    );
                  }),
              SizedBox(height: 40),
              RoundedButton(
                title: "Login",
                isLoading: authViewModel.loading,
                onPress: () {
                  if (emailController.text.isEmpty) {
                    Utils.flushBarErrorMessage("Please enter email", context);
                  } else if (passwordController.text.isEmpty) {
                    Utils.flushBarErrorMessage("Please enter password", context);
                  } else if (passwordController.text.length < 6) {
                    Utils.flushBarErrorMessage("Password enter 6 digit password", context);
                  } else {
                    Map data = {"email": emailController.text.toString().trim(), "password": passwordController.text.toString().trim()};
                    authViewModel.loginApi(data, context);
                  }
                },
              ),
              SizedBox(height: 20),
              InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, RoutesName.signup);
                  },
                  child: Text("Don't have account? SignUp now"))
            ],
          ),
        ),
      ),
    );
  }
}
