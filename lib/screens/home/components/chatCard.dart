import 'package:disneymobile/dumpModels/dumpChat.dart';
import 'package:disneymobile/widgets/avatar.dart';
import 'package:flutter/material.dart';

class ChatCard extends StatelessWidget {
  const ChatCard({
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
      child: Column(
        children: [
          Avatar(profile: chat),
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  chat.name,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w500),
                  textAlign: TextAlign.center,
                ),
                Opacity(
                  opacity: 0.64,
                  child: Text(
                    chat.lastMessage,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Opacity(
                  opacity: 0.64,
                  child: Text(
                    chat.time,
                    style: const TextStyle(
                        fontSize: 10, fontStyle: FontStyle.italic),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
