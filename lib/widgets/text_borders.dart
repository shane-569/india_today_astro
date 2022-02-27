// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

OutlineInputBorder borderStyleForm() {
  // ignore: prefer_const_constructors
  return OutlineInputBorder(
      borderSide: BorderSide(
    color: Colors.grey,
    width: 0.5,
  ));
}

OutlineInputBorder errorBorderStyleForm() {
  // ignore: prefer_const_constructors
  return OutlineInputBorder(
      borderSide: BorderSide(
    color: Colors.red,
    width: 0.5,
  ));
}

Widget clearField(dynamic controller, BuildContext context) {
  return IconButton(
      onPressed: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
        controller.clear();
      },
      icon: Icon(
        Icons.clear,
        color: Colors.grey.withOpacity(0.3),
      ));
}
