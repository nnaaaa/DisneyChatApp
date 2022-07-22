import 'package:disneymobile/screens/home/components/chatCard.dart';
import 'package:disneymobile/dumpModels/dumpChat.dart';
import 'package:disneymobile/states/rootState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux_hooks/flutter_redux_hooks.dart';
import 'package:flutter_hooks/flutter_hooks.dart' show StatefulHookWidget;

import '../../message/message.dart';

class ChatBody extends StatefulHookWidget {
  const ChatBody({Key? key}) : super(key: key);

  @override
  State<ChatBody> createState() => _ChatBodyState();
}

class _ChatBodyState extends State<ChatBody> {
  @override
  Widget build(BuildContext context) {
    final chats = useSelector<RootState, List<Chat>>((state) => state.chats);
    return Padding(
      padding: const EdgeInsets.all(20),
      child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, crossAxisSpacing: 5, mainAxisSpacing: 10),
          itemCount: chats.length,
          itemBuilder: (context, index) => ChatCard(
                chat: chats[index],
                press: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MessagesScreen(chat: chats[index]),
                  ),
                ),
              )),
    );
  }
}
