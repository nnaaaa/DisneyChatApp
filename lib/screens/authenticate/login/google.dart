import 'package:disneymobile/styles/responsive.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleAuth extends StatelessWidget {
  GoogleAuth({Key? key}) : super(key: key);
  final _googleSignIn = GoogleSignIn(clientId: 
  "830563548686-0bq0au45fvakc2vv2qlu235plddra3mt.apps.googleusercontent.com" );

  Future<void> onGoogleAuth() async {
    final user = await _googleSignIn.signIn();
    print(user);
    //   try {
    //     await AuthAPI.googleLogin();
    //     Navigator.of(context).pushReplacementNamed(HomeScreen.route);
    //   } catch (error) {
    //     print(error);
    //   }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => onGoogleAuth(),
      child: Image.asset(
        'assets/images/icon_gmail.png',
        width: ResponsiveUtil.width(50),
        height: ResponsiveUtil.height(50),
      ),
    );
  }
}
