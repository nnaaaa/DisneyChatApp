import 'package:disneymobile/dumpModels/myReact.dart';
import 'package:disneymobile/screens/message/components/messageStatusDot.dart';
import 'package:disneymobile/screens/message/components/textMessage.dart';
import 'package:flutter/material.dart';

import '../../../dumpModels/chatMessages.dart';

class Message extends StatelessWidget {
  const Message(
      {Key? key, this.message, required this.avatarUrl, required this.isLast})
      : super(key: key);

  final ChatMessage? message;
  final String avatarUrl;
  final bool isLast;
  @override
  Widget build(BuildContext context) {
    Widget messageContaint(ChatMessage message) {
      switch (message.messageType) {
        case ChatMessageType.text:
          return TextMessage(message: message);
        // case ChatMessageType.audio:
        //   return AudioMessage(message: message);
        // case ChatMessageType.video:
        //   return VideoMessage();
        default:
          return const SizedBox();
      }
    }

    return Padding(
        padding: const EdgeInsets.only(top: 2.0),
        child: Stack(children: [
          Row(
              mainAxisAlignment: message?.isSender == true
                  ? MainAxisAlignment.end
                  : MainAxisAlignment.start,
              children: [
                if (message?.isSender != true) ...[
                  CircleAvatar(
                    radius: 14,
                    backgroundImage: NetworkImage(avatarUrl),
                  ),
                  const SizedBox(width: 20.0 / 2),
                  messageContaint(message!),
                ],
                if (message!.isSender)
                  Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
                    messageContaint(message!),
                    if (isLast) MessageStatusDot(status: message?.messageStatus)
                  ]),
              ]),
          if (message?.reacts?.length != 0)
            Positioned(
              right: 0,
              bottom: 0,
              child: Container(
                height: 16,
                width: 16,
                decoration: BoxDecoration(
                  color: Colors.amber,
                  shape: BoxShape.circle,
                  border: Border.all(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      width: 3),
                ),
              ),
            ),
        ]));
  }
}
