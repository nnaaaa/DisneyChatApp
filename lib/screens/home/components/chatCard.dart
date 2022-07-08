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
    return GridTile(
        child: Container(
      decoration:
          BoxDecoration(border: Border.all(color: Colors.black, width: 0.25)),
      child: InkWell(
        onTap: press,
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 10.0, vertical: 30.0 * 0.75),
          child: Column(
            children: [
              Avatar(profile: chat),
              Column(
                children: [
                  Padding(
                      padding: const EdgeInsets.only(top: 3),
                      child: Text(chat.name,
                          style: const TextStyle(
                              fontSize: 13, fontWeight: FontWeight.w500),
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis)),
                  Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Opacity(
                        opacity: 0.64,
                        child: Text(
                          chat.lastMessage,
                          maxLines: 1,
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                        ),
                      )),
                  Padding(
                      padding: const EdgeInsets.only(top: 3),
                      child: Opacity(
                        opacity: 0.64,
                        child: Text(
                          chat.time,
                          style: const TextStyle(
                              fontSize: 10, fontStyle: FontStyle.italic),
                        ),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    ));
  }
}
