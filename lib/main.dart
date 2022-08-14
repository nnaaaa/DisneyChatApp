import 'package:disneymobile/screens/authenticate/authenticate.dart';
import 'package:disneymobile/screens/authenticate/login/local.dart';
import 'package:disneymobile/screens/authenticate/register/register.dart';
import 'package:disneymobile/screens/home/home.dart';
import 'package:disneymobile/screens/theme/theme_screen.dart';
import 'package:disneymobile/screens/authenticate/verifier/verify.dart';
import 'package:disneymobile/screens/setting/setting.dart';
import 'package:disneymobile/states/rootState.dart' show RootState;
import 'package:disneymobile/widgets/CustomTheme/theme_notifier.dart';
import 'package:disneymobile/widgets/CustomTheme/theme_values.dart';
import 'package:sizer/sizer.dart';
import 'package:provider/provider.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart' show dotenv;

import 'package:flutter/material.dart';
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
    child: StoreProvider<RootState>(
      store: store,
      child: const DisneyChat(),
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
          useInheritedMediaQuery: true,
          debugShowCheckedModeBanner: false,
          routes: {
            AuthScreen.route: (context) => const AuthScreen(),
            LoginScreen.route: (context) => const LoginScreen(),
            RegisterScreen.route: (context) => const RegisterScreen(),
            VerifyScreen.route: (context) => const VerifyScreen(),
            HomeScreen.route: (context) => const HomeScreen(),
            SettingScreen.route: (context) => const SettingScreen(),
            ThemeScreen.route: (context) => const ThemeScreen(),
          });
    });
  }
}
