import 'package:flutter/material.dart';
import './component/buttonSign.dart';
import './component/itemInput.dart';
import 'package:disneymobile/styles/color.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: CustomColor.primary,
        title: const Text('Register',
            style: TextStyle(
                color: Colors.white,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold,
                fontSize: 25)),
      ),
      body: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: const [
              ListInput(),
              ButtonSign(),
            ],
          )),
    );
  }
}
