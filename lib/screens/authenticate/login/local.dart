import 'package:disneymobile/APIs/auth.dart';
import 'package:disneymobile/screens/authenticate/login/google.dart';
import 'package:disneymobile/screens/authenticate/verifier/verify.dart';
import 'package:disneymobile/screens/forgetPassword/forget_password.dart';
import 'package:disneymobile/screens/home/home.dart' show HomeScreen;
import 'package:disneymobile/styles/responsive.dart' show ResponsiveUtil;
import 'package:disneymobile/utilities/validator.dart' show Validator;
import 'package:disneymobile/widgets/button.dart' show CustomButton;
import 'package:disneymobile/widgets/input.dart' show CustomTextInput;
import 'package:disneymobile/widgets/push_notification.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux_hooks/flutter_redux_hooks.dart' show useDispatch;
import 'package:flutter_hooks/flutter_hooks.dart' show StatefulHookWidget;

import 'package:disneymobile/screens/authenticate/register/register.dart'
    show RegisterScreen;

import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

class LoginScreen extends StatefulHookWidget {
  static const route = '/login';
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late bool isLoading;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    isLoading = false;
    _emailController.addListener(() {});
    _passwordController.addListener(() {});
    tz.initializeTimeZones();
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  final TextEditingController _emailControllerForget = TextEditingController();

  Future<void> onSubmitForget() async {
    try {
      await AuthAPI.forgetPassword(_emailControllerForget.text);
      if (!mounted) return;
      Navigator.of(context).pushNamed(ForgetPassword.route);
    } catch (e) {
      print('$e');
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  _displayDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Input your email'),
            content: TextField(
              controller: _emailControllerForget,
              decoration: const InputDecoration(hintText: "Enter email"),
            ),
            actions: <Widget>[
              FlatButton(
                color: Colors.red,
                textColor: Colors.white,
                child: const Text('CANCEL'),
                onPressed: () {
                  setState(() {
                    Navigator.pop(context);
                  });
                },
              ),
              FlatButton(
                color: Colors.green,
                textColor: Colors.white,
                child: const Text('OK'),
                onPressed: () {
                  print(_emailControllerForget.text);
                  onSubmitForget();
                  setState(() {
                    Navigator.pop(context);
                  });
                },
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    Future<void> onSubmit() async {
      try {
        if (_formKey.currentState!.validate()) {
          setState(() {
            isLoading = true;
          });
          await AuthAPI.localLogin(_emailController.text.toString(),
              _passwordController.text.toString());

          if (!mounted) return;
          NotificationService().showNotification(1, "Login successful", "You have successfully logged in", 1);
          Navigator.of(context).pushReplacementNamed(HomeScreen.route);
        }
      } catch (e) {
        print('$e');
      } finally {
        setState(() {
          isLoading = false;
        });
      }
    }

    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
            margin: EdgeInsets.only(top: ResponsiveUtil.height(25)),
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                //image logo
                Container(
                  margin: EdgeInsets.only(bottom: ResponsiveUtil.height(10)),
                  child: Image.asset(
                    'assets/images/icon.png',
                    height: ResponsiveUtil.height(200),
                  ),
                ),
                //login form
                Form(
                  key: _formKey,
                  child: Column(children: [
                    Container(
                      padding:
                          EdgeInsets.only(bottom: ResponsiveUtil.height(10)),
                      child: Text(
                        'L O G I N',
                        style: TextStyle(
                          fontSize: ResponsiveUtil.getResponsiveFontSize(15),
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: ResponsiveUtil.height(10)),
                      child: CustomTextInput(
                        placeholder: 'Email',
                        onValidate: Validator.getEmailValidator(),
                        controller: _emailController,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: ResponsiveUtil.height(13)),
                      child: CustomTextInput(
                        placeholder: 'Password',
                        controller: _passwordController,
                        onValidate: Validator.getPasswordValidator(),
                        obscure: true,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: ResponsiveUtil.height(20)),
                      child: CustomButton(
                        text: 'Submit',
                        onPress: onSubmit,
                      ),
                    ),
                  ]),
                ),
                //forgot pasword
                Container(
                    margin: EdgeInsets.only(top: ResponsiveUtil.height(20)),
                    child: GestureDetector(
                      child: Text(
                        'Forgot your password?',
                        style: TextStyle(
                          fontSize: ResponsiveUtil.getResponsiveFontSize(14),
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                      onTap: () {
                        _displayDialog(context);
                      },
                    )),
                //list login by gmail, facebook, twitter
                Container(
                  margin: EdgeInsets.only(top: ResponsiveUtil.height(20)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          margin:
                              EdgeInsets.only(right: ResponsiveUtil.width(5)),
                          child: GoogleAuth()),
                      Container(
                          margin:
                              EdgeInsets.only(right: ResponsiveUtil.width(10)),
                          child: Image.asset(
                            'assets/images/icon_github.png',
                            width: ResponsiveUtil.width(50),
                            height: ResponsiveUtil.height(50),
                          )),
                      Container(
                          margin: const EdgeInsets.all(0.0),
                          child: Image.asset(
                            'assets/images/icon_linkedin.png',
                            width: ResponsiveUtil.width(50),
                            height: ResponsiveUtil.height(50),
                          )),
                    ],
                  ),
                ),
                //sign up button
                Container(
                  margin: EdgeInsets.only(top: ResponsiveUtil.height(25)),
                  child: CustomButton(
                    text: 'Sign Up',
                    onPress: () {
                      Navigator.pushNamed(context, RegisterScreen.route);
                    },
                  ),
                ),
              ],
            )));
  }
}
