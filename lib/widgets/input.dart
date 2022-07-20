import 'package:flutter/material.dart';
import '../styles/color.dart';
import '../styles/responsive.dart';

class CustomTextInput extends StatelessWidget {
  final String placeholder;
  final TextEditingController controller;
  final bool obscure;
  String? errorText;
  final TextInputType keyboardType;
  final bool autofocus;
  late String? Function(String?)? onValidate;

  CustomTextInput(
      {super.key,
      required this.placeholder,
      required this.controller,
      this.obscure = false,
      this.keyboardType = TextInputType.text,
      this.autofocus = false,
      this.onValidate}) {
    onValidate ??= (value) {
      if (value == null || value.isEmpty) {
        return 'Please enter some text';
      }
      return null;
    };
  }
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: onValidate,
      controller: controller,
      obscureText: obscure,
      autofocus: autofocus,
      keyboardType: keyboardType,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.only(left: ResponsiveUtil.width(10)),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8)),
          hintText: placeholder,
          hintStyle: TextStyle(color: Colors.grey, fontSize: ResponsiveUtil.getResponsiveFontSize(14)),
          errorText: errorText),
    );
  }
}
