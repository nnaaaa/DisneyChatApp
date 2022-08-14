import 'package:disneymobile/screens/theme/components/check_box.dart';
import 'package:disneymobile/screens/theme/components/pick_color_theme.dart';
import 'package:disneymobile/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:disneymobile/styles/responsive.dart';

class ThemeScreen extends StatefulWidget {
  static const route = '/setting/custom_theme';
  const ThemeScreen({Key? key}) : super(key: key);

  @override
  State<ThemeScreen> createState() => _ThemeScreenState();
}

class _ThemeScreenState extends State<ThemeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Custom theme",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: ResponsiveUtil.getResponsiveFontSize(15)),
            ),
            Text(
              "User setting",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: ResponsiveUtil.getResponsiveFontSize(12)),
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        reverse: true, // this is new
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: const <Widget>[
            OptionTheme(),
            Divider(
              color: Colors.black,
            ),
            ChooseColorTheme(),
          ],
        ),
      ),
    );
  }
}
