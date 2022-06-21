import 'package:disneymobile/screens/authenticate/login/login.dart';
import 'package:disneymobile/screens/authenticate/register/register.dart';
import 'package:disneymobile/widgets/icon.dart';
import 'package:flutter/material.dart';
import 'package:disneymobile/widgets/button.dart';

class AuthScreen extends StatelessWidget {
  static const route = '/auth';

  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Color primaryColor = Theme.of(context).colorScheme.primary;

    return Scaffold(
      //add row here to make it responsive to screen size and orientation change
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const IconWidget(),
              Container(
                margin: const EdgeInsets.only(top: 18),
                child: CustomButton(
                  backgroundColor: primaryColor,
                  text: 'Login',
                  onPress: () {
                    Navigator.pushNamed(context, LoginScreen.route);
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 18),
                child: CustomButton(
                  text: 'Register',
                  onPress: () {
                    Navigator.pushNamed(context, RegisterScreen.route);
                  },
                ),
              ),
              // Container(
              //   margin: const EdgeInsets.only(top: 18),
              //   child: CustomButton(
              //     text: 'Choose color',
              //     onPress: () {
              //       Navigator.push(
              //           context,
              //           MaterialPageRoute(
              //               builder: (context) => const CustomTheme()));
              //     },
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
