import 'package:disneymobile/dumpModels/myReact.dart';
import 'package:disneymobile/screens/message/components/messageStatusDot.dart';
import 'package:disneymobile/screens/message/components/textMessage.dart';
import 'package:disneymobile/styles/responsive.dart';
import 'package:disneymobile/widgets/avatar.dart';
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
          return
              // Container(
              //     decoration: BoxDecoration(

              //       border: Border.all(color: Colors.black, width: 0.5),
              //       borderRadius: BorderRadius.circular(10),
              //       boxShadow: [
              //         BoxShadow(
              //           color: Colors.black.withOpacity(0.3),
              //           blurRadius: 10,
              //           offset: Offset(0, 1),
              //         ),
              //       ],
              //     ),
              //     child:
              TextMessage(message: message);
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
                  Avatar(
                    url: avatarUrl,
                    radius: 14,
                  ),
                  const SizedBox(width: 10),
                  Column(children: [
                    messageContaint(message!),
                    if (message?.reacts?.length != 0)
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 0.5),
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Row(
                            children: [
                              for (final react in message?.reacts ?? [])
                                Image.network(
                                  react.emoji.imageUrl,
                                  height: 10,
                                ),
                              const SizedBox(width: 3),
                              Text(
                                '${message?.reacts?.length}',
                                style: const TextStyle(
                                    fontSize: 10, fontWeight: FontWeight.w500),
                              ),
                              // message?.reacts != null? message.reacts.map((react) => MessageStatusDot(react: react)).toList(): const [],
                            ],
                          ),
                        ),
                      ),
                  ])
                ],
                if (message!.isSender)
                  Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
                    Column(
                      children: [
                        messageContaint(message!),
                        if (message?.reacts?.length != 0)
                          Container(
                            height: 16,
                            width: 16,
                            decoration: const BoxDecoration(
                              color: Colors.amber,
                              shape: BoxShape.circle,
                            ),
                          ),
                      ],
                    ),
                    if (isLast) MessageStatusDot(status: message?.messageStatus)
                  ]),
              ]),
        ]));
  }
}
