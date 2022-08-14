import 'package:disneymobile/dumpModels/dumpChat.dart';
import 'package:disneymobile/screens/home/components/chatCard.dart';
import 'package:disneymobile/screens/message/message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart' show StatefulHookWidget;
import 'package:flutter_redux_hooks/flutter_redux_hooks.dart';

import '../../../states/rootState.dart';
import 'friendCard.dart';

class FriendBody extends StatefulHookWidget {
  const FriendBody({Key? key}) : super(key: key);

  @override
  State<FriendBody> createState() => _FriendBodyState();
}

class _FriendBodyState extends State<FriendBody> {
  @override
  Widget build(BuildContext context) {
    final chats = useSelector<RootState, List<Chat>>((state) => state.chats);
    List<Chat> friendsOnline = onlineFriends(chats);
    return ListView.separated(
        itemCount: friendsOnline.length,
        separatorBuilder: (BuildContext context, int index) => const Divider(
              height: 1,
              thickness: 2,
            ),
        itemBuilder: (context, index) => FriendCard(
            chat: friendsOnline[index],
            press: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        MessagesScreen(chat: friendsOnline[index]),
                  ),
                )));
  }
}

List<Chat> onlineFriends(dumpChat) {
  List<Chat> res = [];
  for (final user in dumpChat) {
    if (user.isActive) {
      res.add(user);
    }
  }
  res.sort((a, b) => a.name
      .toString()
      .toLowerCase()
      .compareTo(b.name.toString().toLowerCase()));
  return res;
}
