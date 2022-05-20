import 'package:flutter/material.dart';
import '../widgets/input.dart' show CustomInput;

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //create three input fields for name, email and password and add them to a column widget and add it to the body of the scaffold widget and return it to the main widget to be displayed on the screen
    return Container(
        padding: const EdgeInsets.all(10),
        child: Column(children: [
          CustomInput(
            controller: nameController,
            placeholder: 'Name',
          ),
          CustomInput(
            controller: emailController,
            placeholder: 'Email',
          ),
          CustomInput(
            controller: passwordController,
            placeholder: 'Password',
          ),
        ]));
  }
}
