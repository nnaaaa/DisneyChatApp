import 'package:flutter/material.dart';
import 'package:disneymobile/styles/color.dart';
import 'package:disneymobile/screens/authenticate/widgets/input.dart';

class ListInput extends StatefulWidget {
  const ListInput({Key? key}) : super(key: key);

  @override
  State<ListInput> createState() => _ListInputState();
}

class _ListInputState extends State<ListInput> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        CustomTextInput(
          hintText: 'Name',
          leading: Icons.person,
          userTyped: (value) => print(value),
          obscure: false,
        ),
        CustomTextInput(
          hintText: 'Email',
          leading: Icons.email,
          userTyped: (value) => print(value),
          obscure: false,
        ),
        CustomTextInput(
          hintText: 'Password',
          leading: Icons.lock,
          userTyped: (value) => print(value),
          obscure: true,
        ),
      ],
    );
  }
}
