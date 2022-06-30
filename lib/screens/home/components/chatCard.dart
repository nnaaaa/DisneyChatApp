import 'package:flutter/material.dart';

class ChatCard extends StatelessWidget {
  const ChatCard({
    Key? key,
    //required this.chat,
    required this.press,
  }) : super(key: key);

  //final Chat chat;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Column(
        children: [
          Stack(
            children: [
              const CircleAvatar(
                radius: 30,
                backgroundImage:
                    NetworkImage('https://i.stack.imgur.com/l60Hf.png'),
              ),

              // if (chat.isActive)
              Positioned(
                right: 0,
                bottom: 0,
                child: Container(
                  height: 16,
                  width: 16,
                  decoration: BoxDecoration(
                    color: Color(0xFF00BF6D),
                    shape: BoxShape.circle,
                    border: Border.all(
                        color: Theme.of(context).scaffoldBackgroundColor,
                        width: 3),
                  ),
                ),
              )
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'chat name',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  Opacity(
                    opacity: 0.64,
                    child: Text(
                      'chat.lastMessage',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Opacity(
                    opacity: 0.64,
                    child: Text('chat.time'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
