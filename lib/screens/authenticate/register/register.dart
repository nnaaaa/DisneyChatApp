import 'package:disneymobile/widgets/button.dart';
import 'package:disneymobile/widgets/input.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
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
    final Color secondaryColor = Theme.of(context).colorScheme.secondary;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: secondaryColor,
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
                    autofocus: true,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 16),
                  child: CustomTextInput(
                    placeholder: 'Email',
                    controller: _emailController,
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
                Container(
                  margin: const EdgeInsets.only(top: 16),
                  child: CustomTextInput(
                    placeholder: 'Confirm',
                    controller: _confirmController,
                    obscure: true,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 30),
                  child: CustomButton(
                    text: 'Submit',
                    onPress: () {
                      if (_formKey.currentState!.validate()) {
                        // If the form is valid, display a snackbar. In the real world,
                        // you'd often call a server or save the information in a database.
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Register ...')),
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
