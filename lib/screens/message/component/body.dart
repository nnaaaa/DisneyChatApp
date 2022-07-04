import 'package:disneymobile/dumpModels/dumpChat.dart';
import 'package:flutter/material.dart';

import 'inputChatField.dart';
import 'message.dart';

class Body extends StatelessWidget {
  final Chat chat;

  const Body({Key? key, required this.chat}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Expanded(
        child: ListView.builder(
          itemCount: chat.messages?.length,
          itemBuilder: (context, index) =>
              Message(avatarUrl: chat.imageUrl, message: chat.messages![index]),
        ),
      ),
      const ChatInputField(),
    ]);
  }
}
