import 'package:disneymobile/styles/color.dart';
import 'package:disneymobile/styles/responsive.dart';
import 'package:flutter/material.dart';
import 'package:disneymobile/styles/responsive.dart' show ResponsiveUtil;


class Avatar extends StatelessWidget {
  const Avatar(
      {Key? key,
      required this.profile,
      this.colorStatus = const Color(0xFF00BF6D),
      this.iconStatus = Icons.circle })
      : super(key: key);
  final String profile;
  final Color? colorStatus;
  final IconData? iconStatus;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundImage: NetworkImage(profile),
        ),
        Positioned(
          right: -4.5,
          bottom: -3.5,
          child: Container(
            height: ResponsiveUtil.height(20),
            width:  ResponsiveUtil.width(20),
            decoration: BoxDecoration(
              color: Color(0xFF00BF6D),
              shape: BoxShape.circle,
              border: Border.all(
                  color: Theme.of(context).scaffoldBackgroundColor, width: ResponsiveUtil.width(3)),
            ),
            child: Icon(
                iconStatus,
                size: 20,
                color: colorStatus
              ),
          ),
        )
      ],
    );
  }
}
