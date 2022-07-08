import 'package:disneymobile/dumpModels/dumpChat.dart';
import 'package:disneymobile/styles/color.dart';
import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  const Avatar({Key? key, required this.profile, this.avatarRadius = 30})
      : super(key: key);
  final Chat profile;
  final double avatarRadius;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          radius: avatarRadius,
          backgroundImage: NetworkImage(profile.imageUrl),
        ),
        if (profile.isActive)
          Positioned(
            right: 0,
            bottom: 0,
            child: Container(
              height: 16,
              width: 16,
              decoration: BoxDecoration(
                color: CustomColor.isActive,
                shape: BoxShape.circle,
                border: Border.all(
                    color: Theme.of(context).scaffoldBackgroundColor, width: 3),
              ),
            ),
          )
      ],
    );
  }
}
