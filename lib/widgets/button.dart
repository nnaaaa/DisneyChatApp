import 'package:flutter/material.dart';
class CustomButton extends StatelessWidget {
  Color? backgroundColor;
  final String text;
  Color? textColor;
  final Function onPress;

  CustomButton({
    Key? key,
    required this.text,
    this.textColor,
    this.backgroundColor,
    required this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        
      onPressed: () => onPress(),
      style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(backgroundColor ?? Theme.of(context).colorScheme.secondary),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)))),
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Text(
            text.toUpperCase(),
            style: TextStyle(
                fontFamily: 'Poppins',
                color: textColor,
                fontWeight: FontWeight.bold,
                fontSize: 16),
          ),
        ),
      ),
    );
  }
}
