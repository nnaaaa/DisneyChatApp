import 'package:disneymobile/screens/authenticate/login/local.dart';
import 'package:disneymobile/screens/authenticate/register/register.dart';
import 'package:disneymobile/styles/responsive.dart';
import 'package:disneymobile/widgets/icon.dart';
import 'package:flutter/material.dart';
import 'package:disneymobile/widgets/button.dart';

class AuthScreen extends StatelessWidget {
  static const route = '/auth';

  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                margin: EdgeInsets.only(top: ResponsiveUtil.height(15)),
                child: CustomButton(
                  backgroundColor: Theme.of(context).primaryColor,
                  text: 'Login',
                  onPress: () {
                    Navigator.pushNamed(context, LoginScreen.route);
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: ResponsiveUtil.height(15)),
                child: CustomButton(
                  text: 'Register',
                  onPress: () {
                    Navigator.pushNamed(context, RegisterScreen.route);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
