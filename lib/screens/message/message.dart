import 'package:disneymobile/dumpModels/dumpChat.dart';
import 'package:disneymobile/widgets/avatar.dart';
import 'package:flutter/material.dart';

import 'component/body.dart';

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({Key? key, required this.chat}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Body(
        chat: chat,
      ),
    );
  }

  final Chat chat;
  AppBar buildAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          const BackButton(),
          Avatar(profile: chat),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                chat.name,
                style: const TextStyle(fontSize: 16),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                chat.time,
                style: const TextStyle(fontSize: 12),
              )
            ],
          )
        ],
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.local_phone),
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(Icons.videocam),
          onPressed: () {},
        ),
      ],
    );
  }
}
