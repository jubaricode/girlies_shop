import 'package:flutter/material.dart';

Widget appTextField(Icon textIcon, String textHint, bool isPassword){
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.all(Radius.circular(15),), 
    ),
    child: TextField(
      obscureText: isPassword == null ? false : isPassword,
      decoration: InputDecoration(
        hintText: textHint == null ? "": textHint,
        prefixIcon: textIcon == null? Container(): Icon(Icons.person)
      ),
    ),
  );
}