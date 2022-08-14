import 'package:disneymobile/styles/responsive.dart';
import 'package:disneymobile/widgets/CustomTheme/theme_notifier.dart';
import 'package:disneymobile/widgets/button.dart';
import "package:flutter/material.dart";
import 'package:provider/provider.dart';

class ChooseColorTheme extends StatefulWidget {
  const ChooseColorTheme({Key? key}) : super(key: key);

  @override
  State<ChooseColorTheme> createState() => _ChooseColorThemeState();
}

extension ColorExtension on String {
  toColor() {
    var hexColor = this.replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    if (hexColor.length == 8) {
      return Color(int.parse("0x$hexColor"));
    }
  }
}

class _ChooseColorThemeState extends State<ChooseColorTheme> {
  final TextEditingController _primaryColor = TextEditingController();
  final TextEditingController _backgroundColor = TextEditingController();
  final TextEditingController _textColor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    return Container(
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text('CHOOSE COLOR THEME',
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: ResponsiveUtil.getResponsiveFontSize(14),
                    fontWeight: FontWeight.bold)),
          ),
          ListTile(
            title: Row(
              children: <Widget>[
                Expanded(
                  child: Text('Primary color',
                      style: TextStyle(
                        fontSize: ResponsiveUtil.getResponsiveFontSize(12),
                      )),
                ),
                Expanded(
                  child: TextField(
                    controller: _primaryColor,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), hintText: '#00000'),
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            title: Row(
              children: <Widget>[
                Expanded(
                  child: Text('Background color',
                      style: TextStyle(
                        fontSize: ResponsiveUtil.getResponsiveFontSize(12),
                      )),
                ),
                Expanded(
                  child: TextField(
                    controller: _backgroundColor,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), hintText: '#00000'),
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            title: Row(
              children: <Widget>[
                Expanded(
                  child: Text('Text color',
                      style: TextStyle(
                        fontSize: ResponsiveUtil.getResponsiveFontSize(12),
                      )),
                ),
                Expanded(
                  child: TextField(
                    controller: _textColor,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), hintText: '#00000'),
                  ),
                ),
              ],
            ),
          ),
          const Divider(
            color: Colors.black,
          ),
          Padding(
              padding: EdgeInsets.only(
            bottom: ResponsiveUtil.height(65),
          )),
          CustomButton(
              text: "Save change",
              width: ResponsiveUtil.width(280),
              onPress: () {
                ThemeData themeData = ThemeData(
                  primaryColor: _primaryColor.text.toColor(),
                  backgroundColor: _backgroundColor.text.toColor(),
                  textTheme: TextTheme(
                    bodyText1: TextStyle(
                      color: _textColor.text.toColor(),
                    ),
                  ),
                  appBarTheme: AppBarTheme(
                    color: _primaryColor.text.toColor(),
                  ),
                );
                themeNotifier.setTheme(themeData);
              }),
        ],
      ),
    );
  }
}
