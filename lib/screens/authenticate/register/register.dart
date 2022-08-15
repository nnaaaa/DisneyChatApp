import 'package:disneymobile/apis/rest/auth.dart';
import 'package:disneymobile/APIs/rest/user.dart';
import '../verifier/verify.dart';
import 'package:disneymobile/screens/home/home.dart';
import 'package:disneymobile/states/rootState.dart';
import 'package:disneymobile/states/slices/user.dart';
import 'package:disneymobile/utilities/validator.dart';
import 'package:disneymobile/widgets/button.dart';
import 'package:disneymobile/widgets/input.dart';

import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  static const route = '/register';
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool isLoading = false;
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    _usernameController.addListener(() {});
    _emailController.addListener(() {});
    _passwordController.addListener(() {});
    _confirmController.addListener(() {});
  }

  @override
  void dispose() {
    super.dispose();
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Future<void> onSubmit() async {
      try {
        if (_formKey.currentState!.validate()) {
          setState(() {
            isLoading = true;
          });
          await AuthAPI.register(UserRegisterDto(
              name: _usernameController.text.toString(),
              account: _emailController.text.toString(),
              password: _passwordController.text.toString()));

          if (!mounted) return;
          Navigator.of(context).pushReplacementNamed(VerifyScreen.route,
              arguments: _emailController.text.toString());
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
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text('Register',
            style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold,
                fontSize: 25)),
      ),
      body: Container(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 16),
                  child: CustomTextInput(
                    placeholder: 'Name',
                    controller: _usernameController,
                    onValidate: Validator.getTextValidator(),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 16),
                  child: CustomTextInput(
                    placeholder: 'Email',
                    controller: _emailController,
                    onValidate: Validator.getEmailValidator(),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 16),
                  child: CustomTextInput(
                    placeholder: 'Password',
                    controller: _passwordController,
                    onValidate: Validator.getPasswordValidator(),
                    obscure: true,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 16),
                  child: CustomTextInput(
                    onValidate: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please confirm your password';
                      }
                      if (value != _passwordController.text.toString()) {
                        return 'Please type correct password';
                      }
                      return null;
                    },
                    textinputaction: false,
                    placeholder: 'Confirm',
                    controller: _confirmController,
                    obscure: true,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 30),
                  child: CustomButton(
                    text: 'Submit',
                    onPress: onSubmit,
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
