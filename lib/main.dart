import 'package:disneymobile/screens/authenticate/authenticate.dart';
import 'package:disneymobile/screens/authenticate/login/login.dart';
import 'package:disneymobile/screens/authenticate/register/register.dart';
import 'package:disneymobile/screens/home/home.dart';
import 'package:disneymobile/states/rootState.dart' show RootState;
import 'package:sizer/sizer.dart';

import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart' show DevicePreview;
import 'package:redux_toolkit/redux_toolkit.dart' show configureStore;
import 'package:flutter_redux_hooks/flutter_redux_hooks.dart'
    show StoreProvider, useDispatch;
import 'package:flutter_hooks/flutter_hooks.dart' show HookWidget;

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

class App extends HookWidget {
  const App({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
          title: 'Disney',
          builder: DevicePreview.appBuilder,
          locale: DevicePreview.locale(context),
          useInheritedMediaQuery: true,
          debugShowCheckedModeBanner: false,
          routes: {
            HomeScreen.route: (context) => const HomeScreen(),
            AuthScreen.route: (context) => const AuthScreen(),
            RegisterScreen.route: (context) => const RegisterScreen(),
            LoginScreen.route: (context) => const LoginScreen(),
          });
    });
  }
}
