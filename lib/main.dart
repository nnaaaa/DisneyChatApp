import 'package:flutter/material.dart';
import 'package:disneymobile/styles/color.dart';
import './screens/authenticate/register/register.dart' show Register;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Register(),
    );
  }
}
