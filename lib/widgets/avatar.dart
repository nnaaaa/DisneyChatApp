import 'package:flutter/material.dart';
import 'package:disneymobile/styles/responsive.dart' show ResponsiveUtil;


class Avatar extends StatelessWidget {
  const Avatar({Key? key, required this.profile}) : super(key: key);
  final String profile;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundImage: NetworkImage(profile),
        ),
        Positioned(
          right: 0,
          bottom: 0,
          child: Container(
            height: ResponsiveUtil.height(20),
            width:  ResponsiveUtil.width(20),
            decoration: BoxDecoration(
              color: Color(0xFF00BF6D),
              shape: BoxShape.circle,
              border: Border.all(
                  color: Theme.of(context).scaffoldBackgroundColor, width: ResponsiveUtil.width(3)),
            ),
          ),
        )
      ],
    );
  }
}
