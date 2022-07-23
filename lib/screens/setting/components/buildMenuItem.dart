// ignore: file_names
import 'package:flutter/material.dart';

// ignore: camel_case_types
class buildMenuItem extends StatelessWidget {
  const buildMenuItem(
      {Key? key,
      required this.text,
      required this.icon,
      this.onClicked,
      this.fontSize = 20,
      this.color})
      : super(key: key);
  final String text;
  final IconData icon;
  final VoidCallback? onClicked;
  final double? fontSize;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    const colorText = Colors.white;
    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(text, style: TextStyle(fontSize: fontSize, color: colorText)),
      onTap: onClicked,
    );
  }
}
