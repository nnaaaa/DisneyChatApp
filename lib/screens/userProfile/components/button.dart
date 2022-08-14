import 'package:flutter/material.dart';
import 'package:disneymobile/styles/responsive.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onClicked;

  const ButtonWidget({
    Key? key,
    required this.text,
    required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ElevatedButton(
    style: ElevatedButton.styleFrom(
      shape: StadiumBorder(),
      onPrimary: Colors.white,
      padding: EdgeInsets.symmetric(
          horizontal: ResponsiveUtil.width(100),
          vertical: ResponsiveUtil.height(16)),
    ),
    child: Text(text, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
    onPressed: onClicked,
  );
}