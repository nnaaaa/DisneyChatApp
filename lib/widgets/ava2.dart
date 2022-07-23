//import 'package:disneymobile/dumpModels/dumpChat.dart';
import 'package:disneymobile/styles/color.dart';
import 'package:disneymobile/styles/responsive.dart';
import 'package:disneymobile/widgets/avatar.dart';
import 'package:flutter/material.dart';

class Ava2 extends StatelessWidget {
  const Ava2(
      {Key? key,
      required this.profile,
      this.colorStatus = const Color(0xFF00BF6D),
      this.iconStatus = Icons.circle})
      : super(key: key);
  final String profile;
  //final Color? colorStatus;
  final IconData? iconStatus;
  final Color? colorStatus;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 37,
      backgroundColor: CustomColor.bluemagenta,
      child: Avatar(profile: profile, colorStatus: colorStatus, iconStatus: iconStatus),
    );
  }
}
