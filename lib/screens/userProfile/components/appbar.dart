import 'package:flutter/material.dart';

AppBar buildAppBar(BuildContext context) {

  return AppBar(
    leading: BackButton(color: Colors.white),
    centerTitle: true,
    title: Text("User Profile", style: TextStyle(fontWeight: FontWeight.bold)),
    backgroundColor: Theme.of(context).colorScheme.primary,
    elevation: 0,
  );
}