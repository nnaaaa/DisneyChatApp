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
    final double resizeScreensWidth = MediaQuery.of(context).size.width / 375;
    final double resizeScreensHeight = MediaQuery.of(context).size.height / 768;
    return GestureDetector(
      onTap: () => onPress(),
      child: Container(
        margin: const EdgeInsets.only(top: 50),
        decoration: BoxDecoration(
            color: mainColor, borderRadius: BorderRadius.circular(50)),
        width: resizeScreensWidth * 343,
        height: resizeScreensHeight * 51,
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
