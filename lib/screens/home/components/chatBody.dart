import 'package:disneymobile/screens/home/components/chatCard.dart';
import 'package:disneymobile/dumpModels/dumpChat.dart';
import 'package:flutter/material.dart';

import '../../message/message.dart';

class ChatBody extends StatelessWidget {
  const ChatBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: dumpChat.length,
        itemBuilder: (context, index) => ChatCard(
              chat: dumpChat[index],
              press: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MessagesScreen(chat: dumpChat[index]),
                ),
              ),
            ));
  }
}
