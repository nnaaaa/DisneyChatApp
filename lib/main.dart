import 'package:disneymobile/states/rootState.dart';

import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart' show DevicePreview;
import 'package:redux_toolkit/redux_toolkit.dart' show configureStore;
import 'package:flutter_redux_hooks/flutter_redux_hooks.dart'
    show StoreProvider;

void main() async {
  final store = await configureStore<RootState>(
    (builder) {
      builder.withReducer(RootState.reducer);
      builder.withPreloadedState(RootState.initState());
    },
  );
  runApp(DevicePreview(
      enabled: true,
      builder: (context) =>
          StoreProvider<RootState>(store: store, child: const App())));
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
        home: Container());
  }
}
