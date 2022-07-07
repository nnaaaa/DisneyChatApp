import 'package:disneymobile/dumpModels/dumpChat.dart';
import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  const Avatar({Key? key, required this.profile}) : super(key: key);
  final Chat profile;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          radius: 30,
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
                color: Color(0xFF00BF6D),
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
