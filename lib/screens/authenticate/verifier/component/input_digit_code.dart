import 'package:flutter/material.dart';
import 'package:disneymobile/styles/responsive.dart' show ResponsiveUtil;
import 'package:flutter/services.dart';

class CodeInput extends StatelessWidget {
  final TextEditingController controller;
  final bool autoFocus;
  const CodeInput(this.controller, this.autoFocus, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: ResponsiveUtil.height(50),
      width: ResponsiveUtil.height(40),
      child: TextField(
        autofocus: autoFocus,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.digitsOnly,
        ],
        controller: controller,
        maxLength: 1,
        cursorColor: Theme.of(context).primaryColor,
        decoration: InputDecoration(
            border: const OutlineInputBorder(),
            counterText: '',
            hintStyle: TextStyle(
                color: Colors.black,
                fontSize: ResponsiveUtil.getResponsiveFontSize(30))),
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          }
        },
      ),
    );
  }
}
