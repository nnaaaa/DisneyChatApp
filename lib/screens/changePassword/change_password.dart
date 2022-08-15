import 'package:disneymobile/APIs/auth.dart';
import 'package:disneymobile/screens/authenticate/authenticate.dart';
import 'package:disneymobile/styles/responsive.dart';
import 'package:disneymobile/widgets/button.dart';
import 'package:disneymobile/widgets/input.dart';
import 'package:disneymobile/widgets/push_notification.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart' show StatefulHookWidget;

import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

class ChangePassword extends StatefulHookWidget {
  static const route = '/changePassword';
  const ChangePassword({Key? key}) : super(key: key);

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  @override
  void initState() {
    super.initState();
    isLoading = false;
    tz.initializeTimeZones();
  }

  bool isLoading = false;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _oldPasswordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Future<void> onSubmit() async {
      try {
        await AuthAPI.changePassword(_emailController.text,
            _oldPasswordController.text, _newPasswordController.text);
        if (!mounted) return;
        NotificationService().showNotification(1, "Update password successfully", "Please, Login to continue!", 1);
        Navigator.of(context).pushNamed(AuthScreen.route);
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
        title: Text('Change Password',
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
                  margin: EdgeInsets.only(bottom: ResponsiveUtil.height(10)),
                  child: Image.asset(
                    'assets/images/icon.png',
                    height: ResponsiveUtil.height(200),
                  ),
                ),
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
                    placeholder: 'Old Password',
                    controller: _oldPasswordController,
                    obscure: true,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 16),
                  child: CustomTextInput(
                    placeholder: 'New password',
                    controller: _newPasswordController,
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
