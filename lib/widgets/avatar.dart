import 'package:disneymobile/styles/color.dart';
import 'package:disneymobile/styles/responsive.dart';
import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  const Avatar(
      {Key? key,
      required this.url,
      this.colorStatus = const Color(0xFF00BF6D),
      this.iconStatus = Icons.circle,
      this.radius = 30})
      : super(key: key);
  final String url;
  final Color? colorStatus;
  final IconData? iconStatus;
  final double radius;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          radius: radius,
          backgroundImage: NetworkImage(url),
        ),
        Positioned(
          right: -4.5,
          bottom: -3.5,
          child: Container(
            decoration: BoxDecoration(
              color: CustomColor.gray,
              shape: BoxShape.circle,
              border: Border.all(
                  color: CustomColor.gray, width: ResponsiveUtil.width(2)),
            ),
            child: Icon(iconStatus, size: radius / 2, color: colorStatus),
          ),
        )
      ],
    );
  }
}
