import 'package:flutter/material.dart';

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
        margin: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: mainColor, borderRadius: BorderRadius.circular(50)),
        width: MediaQuery.of(context).size.width * 0.9,
        padding: const EdgeInsets.all(15),
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
