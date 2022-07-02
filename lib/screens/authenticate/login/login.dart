import 'dart:developer';

import 'package:disneymobile/APIs/auth.dart';
import 'package:disneymobile/APIs/user.dart';
import 'package:disneymobile/screens/authenticate/login/google.dart';
import 'package:disneymobile/screens/home/home.dart' show HomeScreen;
import 'package:disneymobile/states/rootState.dart' show RootState;
import 'package:disneymobile/states/slices/user.dart' show AddUserAction;
import 'package:disneymobile/utilities/validator.dart' show Validator;
import 'package:disneymobile/widgets/button.dart' show CustomButton;
import 'package:disneymobile/widgets/input.dart' show CustomTextInput;
import 'package:disneymobile/styles/responsive.dart' show ResponsiveUtil;
import '../register/register.dart' show RegisterScreen;
import 'package:provider/provider.dart';
import 'package:disneymobile/widgets/CustomTheme/theme_notifier.dart';

import 'package:flutter_redux_hooks/flutter_redux_hooks.dart' show useDispatch;
import 'package:flutter_hooks/flutter_hooks.dart' show StatefulHookWidget;
import 'package:flutter/material.dart';

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
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Color primaryColor = Theme.of(context).colorScheme.primary;

    final dispatch = useDispatch<RootState>();

    Future<void> onSubmit() async {
      try {
        if (_formKey.currentState!.validate()) {
          setState(() {
            isLoading = true;
          });
          await AuthAPI.localLogin(_emailController.text.toString(),
              _passwordController.text.toString());

          final user = await UserAPI.getProfile();
          dispatch(AddUserAction(payload: user));

          if (!mounted) return;
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
                        log('forgot');
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
                              EdgeInsets.only(right: ResponsiveUtil.width(10)),
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
                    backgroundColor: Theme.of(context).primaryColor,
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
