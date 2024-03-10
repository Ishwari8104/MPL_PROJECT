import 'package:flutter/material.dart';
import 'package:furnitureapp/screens/login_screen.dart';
import 'package:furnitureapp/screens/signup_screen.dart';

class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({super.key});

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {

  //initially show only login page
  bool showLoginPage = true;
  //toggle between login and register page
  void togglePages(){
    setState(() {
      showLoginPage=!showLoginPage;
    });
  }
  @override
  Widget build(BuildContext context) {
    if(showLoginPage){
      return LoginScreen(onTap:togglePages);
    }else{
      return SignUpScreen(onTap:togglePages);
    }
  }
}