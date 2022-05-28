import 'package:flutter/material.dart';

import 'package:device_preview/device_preview.dart' show DevicePreview;

void main() {
  runApp(DevicePreview(enabled: true, builder: (context) => const App()));
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Disney',
        builder: DevicePreview.appBuilder,
        locale: DevicePreview.locale(context),
        home: Container()
    );
  }
}
