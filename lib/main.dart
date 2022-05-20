import 'package:flutter/material.dart';
import './styles/color.dart' show CustomColor;
// import './test.dart';
import './screens/authenticate/register/index.dart' show Register;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColor.primary,
        title: const Text('Flutter Code Sample'),
      ),
      // add the register screen to the body of the scaffold widget and return it to the main widget to be displayed on the screen
      body: Register(),
    ));
  }
}
