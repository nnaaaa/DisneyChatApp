import 'package:flutter/material.dart';
import 'package:disneymobile/styles/responsive.dart';
import './CustomTheme/theme_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomButton extends StatefulWidget {
  final String text;
  final Function onPress;
  final width;

  CustomButton({
    Key? key,
    required this.text,
    required this.onPress,
    this.width,
  }) : super(key: key);

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () =>widget.onPress(),
      child: Container(
        padding: const EdgeInsets.all(16),
        width: widget.width ?? ResponsiveUtil.width(400),
        child: Center(
          child: Text(
            widget.text.toUpperCase(),
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: ResponsiveUtil.getResponsiveFontSize(12)),
          ),
        ),
      ),
    );
  }
}