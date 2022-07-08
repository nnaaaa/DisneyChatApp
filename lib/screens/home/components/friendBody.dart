import 'package:disneymobile/dumpModels/dumpChat.dart';
import 'package:disneymobile/screens/home/components/chatCard.dart';
import 'package:disneymobile/screens/message/message.dart';
import 'package:flutter/material.dart';

import 'friendCard.dart';

class FriendBody extends StatelessWidget {
  const FriendBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Chat> friendsOnline = onlineFriends(dumpChat);
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
  for (var user in dumpChat) {
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
