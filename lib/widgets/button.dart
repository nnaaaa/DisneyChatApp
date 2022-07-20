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
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Text(
            text.toUpperCase(),
            style: TextStyle(
                color: textColor,
                fontWeight: FontWeight.bold,
                fontSize: ResponsiveUtil.getResponsiveFontSize(16)),
          ),
        ),
      ),
    );
  }
}
