import 'package:disneymobile/widgets/icon.dart';
import 'package:flutter/material.dart';
import 'package:disneymobile/widgets/button.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Color primaryColor = Theme.of(context).colorScheme.primary;

    return Scaffold(
      //add row here to make it responsive to screen size and orientation change
      body: Container(
        padding: const EdgeInsets.all(16),
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
                  Navigator.of(context).pushReplacementNamed('/login');
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 18),
              child: CustomButton(
                text: 'Register',
                onPress: () {
                    Navigator.of(context).pushReplacementNamed('/register');
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
