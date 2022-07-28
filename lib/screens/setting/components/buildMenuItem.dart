<<<<<<< HEAD:lib/screens/setting/components/buildMenuItem.dart
// ignore: file_names
import 'package:flutter/material.dart';
=======
import 'package:disneymobile/styles/color.dart';
import 'package:disneymobile/styles/responsive.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_redux_hooks/flutter_redux_hooks.dart';
import 'package:disneymobile/styles/responsive.dart' show ResponsiveUtil;
>>>>>>> d991440bbbf96dd28d73ce95788e1a942e35447a:lib/screens/setting/component/buildMenuItem.dart

class buildMenuItem extends StatelessWidget {
  buildMenuItem(
      {Key? key,
      required this.text,
      required this.icon,
      this.onClicked,
      this.fontSize = 16,//ResponsiveUtil.getResponsiveFontSize(14),
      this.color})
      : super(key: key);
  final String text;
  final IconData icon;
  final VoidCallback? onClicked;
  final double fontSize;
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
