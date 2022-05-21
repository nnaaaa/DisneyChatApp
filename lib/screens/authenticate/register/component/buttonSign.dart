import 'package:flutter/material.dart';
import 'package:disneymobile/styles/color.dart';
import 'package:disneymobile/screens/authenticate/widgets/button.dart';

class buttonSign extends StatefulWidget {
  buttonSign({Key? key}) : super(key: key);

  @override
  State<buttonSign> createState() => _buttonSignState();
}

class _buttonSignState extends State<buttonSign> {
  @override
  Widget build(BuildContext context) {
    return CustomButton(
      accentColor: CustomColor.secondary,
      text: 'Sign Up',
      mainColor: CustomColor.primary,
      onPress: () {
        print('Register button pressed');
      },
    );
  }
}
