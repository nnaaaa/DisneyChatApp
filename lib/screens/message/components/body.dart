import 'package:disneymobile/dumpModels/dumpChat.dart';
import 'package:flutter/material.dart';

import 'inputChatField.dart';
import 'message.dart';

class Body extends StatefulWidget {
  final Chat chat;
  const Body({Key? key, required this.chat}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 5, 10, 15),
      child: Column(children: [
        Expanded(
            child: ListView.builder(
          itemCount: widget.chat.messages?.length ?? 0,
          itemBuilder: (context, index) => Message(
              avatarUrl: widget.chat.imageUrl,
              message: widget.chat.messages![index],
              isLast: index == widget.chat.messages!.length - 1),
        )),
        ChatInputField(id: widget.chat.id, notifyParent: () => setState(() {})),
      ]),
    );
  }
}
