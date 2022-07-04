import 'package:disneymobile/screens/home/components/chatCard.dart';
import 'package:disneymobile/dumpModels/dumpChat.dart';
import 'package:flutter/material.dart';

import '../../message/message.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        padding: const EdgeInsets.only(top: 20.0),
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: dumpChat.length,
        itemBuilder: (context, index) => ChatCard(
            chat: dumpChat[index],
            press: () => [
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          MessagesScreen(chat: dumpChat[index]),
                    ),
                  ),
                  print('$context')
                ]));
  }
}
