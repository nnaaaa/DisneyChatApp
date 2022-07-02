import 'package:disneymobile/screens/authenticate/authenticate.dart';
import 'package:disneymobile/screens/authenticate/login/local.dart';
import 'package:disneymobile/screens/authenticate/register/register.dart';
import 'package:disneymobile/screens/home/home.dart';
import 'package:disneymobile/states/rootState.dart' show RootState;
import 'package:disneymobile/widgets/CustomTheme/theme_notifier.dart';
import 'package:disneymobile/widgets/CustomTheme/theme_values.dart';
import 'package:sizer/sizer.dart';
import 'package:provider/provider.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart' show dotenv;

import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart' show DevicePreview;
import 'package:redux_toolkit/redux_toolkit.dart' show configureStore;
import 'package:flutter_redux_hooks/flutter_redux_hooks.dart'
    show StoreProvider, useDispatch;
import 'package:flutter_hooks/flutter_hooks.dart' show HookWidget;

void main() async {
  await dotenv.load(fileName: ".env");
  final store = await configureStore<RootState>(
    (builder) {
      builder.withReducer(RootState.reducer);
      builder.withPreloadedState(RootState.initState());
    },
  );
  runApp(ChangeNotifierProvider<ThemeNotifier>(
    child: DevicePreview(
      enabled: true,
      builder: (context) => StoreProvider<RootState>(
        store: store,
        child: const DisneyChat(),
      ),
    ),
    create: (_) => ThemeNotifier(mainTheme),
  ));
}

class DisneyChat extends HookWidget {
  const DisneyChat({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
          title: 'Disney',
          theme: themeNotifier.getTheme(),
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
