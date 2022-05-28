import 'package:disneymobile/APIs/user.dart';
import 'package:disneymobile/screens/authenticate/authenticate.dart';
import 'package:disneymobile/screens/home/home.dart';
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
        useInheritedMediaQuery: true,
        debugShowCheckedModeBanner: false,
        home: FutureBuilder(
            future: UserAPI.getProfile(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final user = snapshot.data ;
                return const Home();
              }
              print(snapshot.data);
              return const Authenticate();
            }));
  }
}
