import 'package:disneymobile/APIs/auth.dart';
import 'package:disneymobile/APIs/user.dart';
import 'package:disneymobile/screens/home/home.dart';
import 'package:disneymobile/states/rootState.dart';
import 'package:disneymobile/states/slices/user.dart';
import 'package:disneymobile/widgets/button.dart';
import 'package:disneymobile/widgets/input.dart';

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
    final formKey = GlobalKey<FormState>();

    final dispatch = useDispatch<RootState>();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: primaryColor,
        centerTitle: true,
        title: const Text('Login',
            style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold,
                fontSize: 25)),
      ),
      body: Container(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 16),
                  child: CustomTextInput(
                    placeholder: 'Email',
                    controller: _emailController,
                    autofocus: true,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 16),
                  child: CustomTextInput(
                    placeholder: 'Password',
                    controller: _passwordController,
                    obscure: true,
                  ),
                ),
                !isLoading
                    ? Container(
                        margin: const EdgeInsets.only(top: 30),
                        child: CustomButton(
                          // backgroundColor: primaryColor,
                          text: 'Submit',
                          onPress: () async {
                            try {
                              if (formKey.currentState!.validate()) {
                                setState(() {
                                  isLoading = true;
                                });
                                await AuthAPI.localLogin(
                                    _emailController.text.toString(),
                                    _passwordController.text.toString());
                                final user = await UserAPI.getProfile();
                                dispatch(AddUserAction(payload: user));

                                if (!mounted) return;

                                Navigator.of(context)
                                    .pushReplacementNamed(HomeScreen.route);
                              }
                            } catch (e) {
                              print('$e');
                            } finally {
                              setState(() {
                                isLoading = false;
                              });
                            }
                          },
                        ),
                      )
                    : Container(
                        margin: const EdgeInsets.only(top: 50),
                        child: const CircularProgressIndicator()),
              ],
            ),
          )),
    );
  }
}
