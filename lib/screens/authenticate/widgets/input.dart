import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  final TextEditingController controller;
  final String placeholder;
  const CustomInput(
      {Key? key, required this.controller, required this.placeholder})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: placeholder,
        label: Text(placeholder),
        hintStyle: const TextStyle(color: Color.fromARGB(249, 226, 64, 64)),
        enabledBorder: const UnderlineInputBorder(
          borderSide:
              BorderSide(color: Color.fromARGB(251, 201, 41, 41), width: 2),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide:
              BorderSide(color: Color.fromARGB(209, 214, 112, 112), width: 2),
        ),
      ),
    );
  }
}
