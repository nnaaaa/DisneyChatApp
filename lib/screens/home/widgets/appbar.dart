import 'package:flutter/material.dart';

AppBar buildAppbar(profileUrl) {
  return AppBar(
    centerTitle: true,
    title: const Text('Chats'),
    leading: Builder(
        builder: (context) => IconButton(
              icon: CircleAvatar(
                radius: 48, // Image radius
                backgroundImage: NetworkImage(
                    profileUrl ?? 'https://i.stack.imgur.com/l60Hf.png'),
              ),
              onPressed: () => print("personal profile"),
            )),
    actions: [
      Builder(
        builder: (context) => IconButton(
          icon: const Icon(Icons.people),
          onPressed: () => Scaffold.of(context).openEndDrawer(),
        ),
      ),
    ],
  );
}
