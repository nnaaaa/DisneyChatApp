import 'package:disneymobile/dumpModels/myReact.dart';
import 'package:disneymobile/screens/message/components/messageStatusDot.dart';
import 'package:disneymobile/screens/message/components/textMessage.dart';
import 'package:disneymobile/styles/responsive.dart';
import 'package:disneymobile/widgets/avatar.dart';
import 'package:flutter/material.dart';

import 'package:disneymobile/dumpModels/chatMessages.dart';

class Message extends StatefulWidget {
  final ChatMessage? message;
  final String avatarUrl;
  final bool isLast;
  final int userID;
  const Message(
      {Key? key,
      this.message,
      required this.avatarUrl,
      required this.isLast,
      required this.userID})
      : super(key: key);

  @override
  State<Message> createState() => _MessageState();
}

class _MessageState extends State<Message> {
  @override
  Widget build(BuildContext context) {
    Widget messageContaint(ChatMessage message) {
      switch (message.messageType) {
        case ChatMessageType.text:
          return TextMessage(
              userID: widget.userID,
              message: message,
              notifyParent: () => setState(() {}));
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
              mainAxisAlignment: widget.message?.isSender == true
                  ? MainAxisAlignment.end
                  : MainAxisAlignment.start,
              children: [
                if (widget.message?.isSender != true) ...[
                  Avatar(
                    url: widget.avatarUrl,
                    radius: 14,
                  ),
                  const SizedBox(width: 10),
                  Column(children: [
                    messageContaint(widget.message!),
                    if (widget.message?.reacts?.length != 0)
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 0.5),
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Row(
                            children: [
                              for (final react in widget.message?.reacts ?? [])
                                Image.network(
                                  react.emoji.imageUrl,
                                  height: 10,
                                ),
                              const SizedBox(width: 3),
                              Text(
                                '${widget.message?.reacts?.length}',
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
                if (widget.message!.isSender)
                  Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
                    Column(
                      children: [
                        messageContaint(widget.message!),
                        // if (message?.reacts?.length != 0)
                        //   Container(
                        //     decoration: BoxDecoration(
                        //       border:
                        //           Border.all(color: Colors.black, width: 0.5),
                        //       borderRadius:
                        //           BorderRadius.all(Radius.circular(10.0)),
                        //     ),
                        //     child: Padding(
                        //       padding: const EdgeInsets.all(4.0),
                        //       child: Row(
                        //         children: [
                        //           for (final react in message?.reacts ?? [])
                        //             Image.network(
                        //               react.emoji.imageUrl,
                        //               height: 10,
                        //             ),
                        //           const SizedBox(width: 3),
                        //           Text(
                        //             '${message?.reacts?.length}',
                        //             style: const TextStyle(
                        //                 fontSize: 10,
                        //                 fontWeight: FontWeight.w500),
                        //           ),
                        //           // message?.reacts != null? message.reacts.map((react) => MessageStatusDot(react: react)).toList(): const [],
                        //         ],
                        //       ),
                        //     ),
                        //   ),
                      ],
                    ),
                    if (widget.isLast)
                      MessageStatusDot(status: widget.message?.messageStatus)
                  ]),
              ]),
        ]));
  }
}
