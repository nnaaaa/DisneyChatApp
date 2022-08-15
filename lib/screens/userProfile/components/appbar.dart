import 'package:flutter/material.dart';

AppBar buildAppBar(BuildContext context) {

  return AppBar(
    leading: const BackButton(color: Colors.white),
    title: const Text("User Profile", style: TextStyle(fontWeight: FontWeight.bold)),
    backgroundColor: Theme.of(context).colorScheme.primary,
    elevation: 0,
  );
}