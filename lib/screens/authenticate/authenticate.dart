import 'package:flutter/material.dart';
import 'package:disneymobile/styles/color.dart';
import './widgets/button.dart';
import './register/register.dart';
import 'package:disneymobile/styles/reponsive.dart';

class Authenticate extends StatelessWidget {
  const Authenticate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //add row here to make it responsive to screen size and orientation change
      body: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    child: CustomButton(
                      accentColor: Colors.white,
                      text: 'Sign In',
                      mainColor: CustomColor.primary,
                      onPress: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Register()),
                        );
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: Responsibility.setHeight(context, 20)),
                    child: CustomButton(
                      accentColor: Colors.white,
                      text: 'Sign Up',
                      mainColor: CustomColor.primary,
                      onPress: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Register()),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
