import 'package:flutter/material.dart';

AppBar buildAppBar(BuildContext context) {

  return AppBar(
    leading: const BackButton(),
    title: const Text("User Profile", style: TextStyle(fontWeight: FontWeight.bold)),
    elevation: 0,
  );
}