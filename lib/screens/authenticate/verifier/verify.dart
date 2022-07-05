import 'package:flutter/material.dart';
import './component/input_digit_code.dart';
import 'package:disneymobile/widgets/button.dart' show CustomButton;
import 'package:disneymobile/styles/responsive.dart' show ResponsiveUtil;
import 'package:disneymobile/widgets/icon.dart';
import 'package:flutter_redux_hooks/flutter_redux_hooks.dart' show useDispatch;
import 'package:flutter_hooks/flutter_hooks.dart' show StatefulHookWidget;

class VerifyScreen extends StatefulHookWidget {
  static const route = '/verify';

  VerifyScreen({Key? key}) : super(key: key);

  @override
  State<VerifyScreen> createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {
  final TextEditingController _codeOne = TextEditingController();
  final TextEditingController _codeTwo = TextEditingController();
  final TextEditingController _codeThree = TextEditingController();
  final TextEditingController _codeFour = TextEditingController();
  final TextEditingController _codeFive = TextEditingController();
  final TextEditingController _codeSix = TextEditingController();

  String? _digitCode;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Disney Chat'),
        titleTextStyle: TextStyle(
          fontSize: ResponsiveUtil.getResponsiveFontSize(16),
          fontWeight: FontWeight.bold,
        ),
      ),
      body: Column(
        children: [
          Container(
            child: const IconWidget(),
            margin: EdgeInsets.only(
                bottom: ResponsiveUtil.height(70),
                top: ResponsiveUtil.height(50)),
          ),
          Container(
            margin: EdgeInsets.only(
              bottom: ResponsiveUtil.height(40),
            ),
            child: Text(
              'Enter the 6-digit code sent to your gmail: \n .... help: get profile and add',
              style: TextStyle(
                fontSize: ResponsiveUtil.getResponsiveFontSize(14),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CodeInput(_codeOne, true),
              CodeInput(_codeTwo, false),
              CodeInput(_codeThree, false),
              CodeInput(_codeFour, false),
              CodeInput(_codeFive, false),
              CodeInput(_codeSix, false)
            ],
          ),
          SizedBox(
            height: ResponsiveUtil.height(30),
          ),
          CustomButton(
            text: 'Verify',
            width: ResponsiveUtil.width(300),
            onPress: () {
              _digitCode =
                  '${_codeOne.text}${_codeTwo.text}${_codeThree.text}${_codeFour.text}${_codeFive.text}${_codeSix.text}';
              print(_digitCode);
            },
          ),
          SizedBox(
            height: ResponsiveUtil.height(20),
          ),
          Text(
            _digitCode ?? 'Please enter OTP',
            style:
                TextStyle(fontSize: ResponsiveUtil.getResponsiveFontSize(14)),
          )
        ],
      ),
    );
  }
}
