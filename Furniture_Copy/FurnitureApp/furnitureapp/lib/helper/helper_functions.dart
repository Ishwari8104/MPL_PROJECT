import 'package:flutter/material.dart';

//displaying error

void displayMessageToUser(String message,BuildContext context){
  showDialog(
    context: context,
    builder: (context)=>AlertDialog(
      title: Text(message),
    ),
    );
}