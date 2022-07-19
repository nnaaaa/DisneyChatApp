import 'package:disneymobile/screens/home/components/chatCard.dart';
import 'package:disneymobile/dumpModels/dumpChat.dart';
import 'package:disneymobile/styles/responsive.dart';
import 'package:flutter/material.dart';

import '../../message/message.dart';

class ChatBody extends StatelessWidget {
  const ChatBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, crossAxisSpacing: 5, mainAxisSpacing: 10),
          itemCount: dumpChat.length,
          itemBuilder: (context, index) => ChatCard(
                chat: dumpChat[index],
                press: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MessagesScreen(chat: dumpChat[index]),
                  ),
                ),
              )),
    );
  }
}
