import 'package:disneymobile/apis/auth.dart';
import 'package:disneymobile/models/User.dart';
import 'package:disneymobile/screens/home/home.dart';
import 'package:disneymobile/styles/responsive.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:dio/dio.dart' show DioError;

class GoogleAuth extends StatelessWidget {
  GoogleAuth({Key? key}) : super(key: key);
  final _googleSignIn = GoogleSignIn();

  @override
  Widget build(BuildContext context) {
    Future<void> onGoogleAuth() async {
      final navigator = Navigator.of(context);
      final GoogleSignInAccount user = await _googleSignIn.signIn();
      try {
        await AuthAPI.localLogin(user.email, user.id);

        navigator.pushReplacementNamed(HomeScreen.route);
      } on DioError catch (e) {
        final registerRes = await AuthAPI.registerOAuth(UserRegisterDto(
            account: user.email,
            name: user.displayName,
            avatarUrl: user.photoUrl,
            password: user.id));

        if (registerRes.statusCode != 201) {
          throw Exception('Register failed');
        }
      } catch (e) {
        print('other error');
      } finally {
        await AuthAPI.localLogin(user.email, user.id);

        navigator.pushReplacementNamed(HomeScreen.route);
      }
    }

    return ElevatedButton(
      onPressed: () => onGoogleAuth(),
      style: ElevatedButton.styleFrom(
          shape: const CircleBorder()),
      child: Image.asset(
        'assets/images/icon_gmail.png',
        width: ResponsiveUtil.width(50),
        height: ResponsiveUtil.height(50),
      ),
    );
  }
}
