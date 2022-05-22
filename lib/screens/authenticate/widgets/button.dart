import 'package:flutter/material.dart';
import 'package:disneymobile/styles/reponsive.dart';

class CustomButton extends StatelessWidget {
  final Color accentColor;
  final Color mainColor;
  final String text;
  final Function onPress;

  const CustomButton(
      {Key? key,
      required this.accentColor,
      required this.text,
      required this.mainColor,
      required this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onPress(),
      child: Container(
        margin: const EdgeInsets.only(top: 50),
        decoration: BoxDecoration(
            color: mainColor, borderRadius: BorderRadius.circular(15)),
        width: Responsibility.setWidth(context, 343),
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Text(
            text.toUpperCase(),
            style: TextStyle(
                fontFamily: 'Poppins',
                color: accentColor,
                fontWeight: FontWeight.bold,
                fontSize: 16),
          ),
        ),
      ),
    );
  }
}
