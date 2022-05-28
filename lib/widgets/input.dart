import 'package:flutter/material.dart';

class CustomTextInput extends StatelessWidget {
  final String placeholder;
  final TextEditingController controller;
  final bool obscure;
  final TextInputType keyboardType;
  final bool autofocus;
  const CustomTextInput(
      {Key? key,
      required this.placeholder,
      required this.controller,
      this.obscure = false,
      this.keyboardType = TextInputType.text,this.autofocus = false})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter some text';
        }
        return null;
      },
      autofocus: autofocus,
      obscureText: obscure,
      decoration: InputDecoration(
        //   icon: Icon(
        //     leading,
        //     color: Colors.deepPurple,
        //   ),
        contentPadding: const EdgeInsets.only(left: 10),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        hintText: placeholder,
        hintStyle: const TextStyle(
          fontFamily: 'Poppins',
        ),
      ),
    );
  }
}