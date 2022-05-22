import 'package:flutter/material.dart';
import 'package:disneymobile/styles/color.dart';
import 'package:disneymobile/screens/authenticate/widgets/button.dart';

class ButtonSign extends StatefulWidget {
  const ButtonSign({Key? key}) : super(key: key);

  @override
  State<ButtonSign> createState() => _ButtonSignState();
}

class _ButtonSignState extends State<ButtonSign> {
  @override
  Widget build(BuildContext context) {
    return CustomButton(
      accentColor: Colors.white,
      text: 'Sign Up',
      mainColor: CustomColor.primary,
      onPress: () {
        print('Register button pressed');
      },
    );
  }
}
