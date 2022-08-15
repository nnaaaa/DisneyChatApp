import 'package:disneymobile/styles/responsive.dart';
import 'package:flutter/material.dart';
import 'package:disneymobile/APIs/auth.dart';
import 'package:disneymobile/APIs/user.dart';
import 'package:disneymobile/screens/home/home.dart';
import 'package:disneymobile/states/rootState.dart';
import 'package:disneymobile/states/slices/user.dart';
import 'package:disneymobile/utilities/validator.dart';
import 'package:disneymobile/widgets/button.dart';
import 'package:disneymobile/widgets/input.dart';
import 'package:flutter_hooks/flutter_hooks.dart' show StatefulHookWidget;

class ForgetPassword extends StatefulHookWidget {
  static const route = '/forgetPassword';
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  bool isLoading = false;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _digitCodeController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Future<void> onSubmit() async {
      try {
        print(_emailController.text +
            _passwordController.text.toString() +
            _digitCodeController.text);
        await AuthAPI.newPassword(
            _emailController.text.toString(),
            _passwordController.text.toString(),
            _digitCodeController.text.toString());
        if (!mounted) return;
        Navigator.of(context).pushNamed(HomeScreen.route);
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
        backgroundColor: Theme.of(context).primaryColor,
        title: Text('Forget Password',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: ResponsiveUtil.getResponsiveFontSize(15))),
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
                    placeholder: 'Account',
                    controller: _emailController,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 16),
                  child: CustomTextInput(
                    placeholder: 'New Password',
                    controller: _passwordController,
                    obscure: true,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 16),
                  child: CustomTextInput(
                    placeholder: 'Digit code',
                    controller: _digitCodeController,
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
