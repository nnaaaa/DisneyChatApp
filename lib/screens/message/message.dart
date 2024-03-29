import 'package:disneymobile/dumpModels/dumpChat.dart';
import 'package:disneymobile/screens/listChannel/list_channel.dart';
import 'package:disneymobile/styles/responsive.dart';
import 'package:disneymobile/widgets/avatar.dart';
import 'package:flutter/material.dart';

import 'components/body.dart';

class MessagesScreen extends StatelessWidget {
  final Chat chat;
  const MessagesScreen({Key? key, required this.chat}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      endDrawer: const Drawer(
        child: ListChannel(),
      ),
      body: Body(
        chat: chat,
      ),
    );
  }

  AppBar buildAppBar(context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          const BackButton(),
          CircleAvatar(
            radius: 19,
            backgroundImage: NetworkImage(chat.imageUrl),
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                chat.name,
                style: TextStyle(
                    fontSize: ResponsiveUtil.getResponsiveFontSize(13)),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                chat.time,
                style: TextStyle(
                    fontSize: ResponsiveUtil.getResponsiveFontSize(11)),
              )
            ],
          )
        ],
      ),
    );
  }
}
