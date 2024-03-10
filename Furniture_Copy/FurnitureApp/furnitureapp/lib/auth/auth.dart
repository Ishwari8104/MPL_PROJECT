import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:furnitureapp/auth/login_or_register.dart';
import 'package:furnitureapp/screens/home_screen.dart';
 class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context,snapshot){
          //if user is logged in
          if(snapshot.hasData){
            return const HomeScreen();
          }


        else{
          return const LoginOrRegister();

        }
        }
      ),
    );
  }
}