import 'package:disneymobile/dumpModels/dumpChat.dart';
import 'package:disneymobile/styles/responsive.dart';
import 'package:disneymobile/widgets/avatar.dart';
import 'package:flutter/material.dart';

class FriendCard extends StatelessWidget {
  const FriendCard({
    Key? key,
    required this.chat,
    required this.press,
  }) : super(key: key);

  final Chat chat;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: ResponsiveUtil.height(20),
            vertical: ResponsiveUtil.width(20 * 0.75)),
        child: Row(
          children: [
            Stack(
              children: [Avatar(url: chat.imageUrl)],
            ),
            Expanded(
              child: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: ResponsiveUtil.height(20)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      chat.name,
                      style: TextStyle(
                          fontSize: ResponsiveUtil.getResponsiveFontSize(16),
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
