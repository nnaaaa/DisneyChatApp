import 'package:flutter/material.dart';
import 'package:disneymobile/styles/responsive.dart';
import './CustomTheme/theme_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomButton extends StatelessWidget {
  Color? backgroundColor;
  final String text;
  Color? textColor;
  final Function onPress;
  final width;

  CustomButton({
    Key? key,
    required this.text,
    this.textColor,
    this.backgroundColor,
    required this.onPress,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => onPress(),
      style: ElevatedButton.styleFrom(
        primary: backgroundColor ?? Theme.of(context).primaryColor,
        animationDuration: const Duration(milliseconds: 500),
      ),
      child: Container(
        padding: const EdgeInsets.all(16),
        width: width ?? ResponsiveUtil.width(400),
        child: Center(
          child: Text(
            text.toUpperCase(),
            style: TextStyle(
                color: textColor,
                fontWeight: FontWeight.bold,
                fontSize: 16),
          ),
        ),
      ),
    );
  }
}
