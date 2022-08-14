import 'package:disneymobile/styles/responsive.dart';
import 'package:flutter/material.dart';

class Channel extends StatelessWidget {
  Channel({Key? key, required this.nameChannel}) : super(key: key);
  final String nameChannel;

  bool _isPressed = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        child: Container(
          padding: EdgeInsets.only(
              left: ResponsiveUtil.width(10),
              right: ResponsiveUtil.width(20),
              top: ResponsiveUtil.height(10),
              bottom: ResponsiveUtil.height(10)),
          margin: EdgeInsets.only(
              bottom: ResponsiveUtil.height(15),
              left: ResponsiveUtil.width(30),
              right: ResponsiveUtil.width(20)),
          decoration: BoxDecoration(
            color: _isPressed ? const Color.fromARGB(255, 217, 88, 88) : Colors.white,
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Icon(Icons.chat_outlined),
              SizedBox(width: ResponsiveUtil.width(10)),
              Text(nameChannel),
            ],
          ),
        ),
        onTap: () {
          // setState(() {
          //   _isPressed = !_isPressed;
          // });
          if (_isPressed) {
            // This block will be executed when button is pressed odd number of times.
          } else {
            // This block will be executed when button is pressed even number of times;
          }
        },
      ),
    );
  }
}
