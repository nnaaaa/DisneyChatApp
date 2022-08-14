import 'package:disneymobile/styles/responsive.dart';
import 'package:disneymobile/widgets/CustomTheme/theme_notifier.dart';
import 'package:disneymobile/widgets/CustomTheme/theme_values.dart';
import "package:flutter/material.dart";
import 'package:provider/provider.dart';

enum SingingCharacter { lafayette, jefferson }

class OptionTheme extends StatefulWidget {
  const OptionTheme({Key? key}) : super(key: key);

  @override
  State<OptionTheme> createState() => _OptionThemeState();
}

class _OptionThemeState extends State<OptionTheme> {
  SingingCharacter? _character = SingingCharacter.lafayette;

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    return Column(
      children: <Widget>[
        ListTile(
          title: Text('THEME',
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: ResponsiveUtil.getResponsiveFontSize(14),
                  fontWeight: FontWeight.bold)),
        ),
        ListTile(
          title: const Text('Light themes'),
          trailing: Radio<SingingCharacter>(
            value: themeNotifier.getTheme() == mainTheme ? SingingCharacter.lafayette : SingingCharacter.jefferson,
            groupValue: _character,
            activeColor: Theme.of(context).primaryColor,
            onChanged: (SingingCharacter? value) {
              setState(() {
                _character = value;
                themeNotifier.setTheme(mainTheme);
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Dark themes'),
          trailing: Radio<SingingCharacter>(
            value: themeNotifier.getTheme() == darkTheme ? SingingCharacter.lafayette : SingingCharacter.jefferson,
            groupValue: _character,
            activeColor: Theme.of(context).primaryColor,
            onChanged: (SingingCharacter? value) {
              setState(() {
                _character = value;
                themeNotifier.setTheme(darkTheme);
              });
            },
          ),
        ),
      ],
    );
  }
}
