import 'package:disneymobile/screens/message/component/textMessage.dart';
import 'package:flutter/material.dart';

import '../../../dumpModels/chatMessages.dart';

class Message extends StatelessWidget {
  const Message({Key? key, this.message, required this.avatarUrl})
      : super(key: key);

  final ChatMessage? message;
  final String avatarUrl;
  @override
  Widget build(BuildContext context) {
    Widget messageContaint(ChatMessage message) {
      switch (message.messageType) {
        case ChatMessageType.text:
          return TextMessage(message: message);
        // case ChatMessageType.audio:
        //   return AudioMessage(message: message);
        // case ChatMessageType.video:
        //   return VideoMessage();
        default:
          return SizedBox();
      }
    }

    return Row(
        mainAxisAlignment: message?.isSender == true
            ? MainAxisAlignment.end
            : MainAxisAlignment.start,
        children: [
          // ignore: unnecessary_null_comparison
          if (message?.isSender != true) ...[
            CircleAvatar(
              radius: 12,
              backgroundImage: NetworkImage(avatarUrl),
            ),
          ],
          messageContaint(message!),
          if (message!.isSender)
            MessageStatusDot(status: message?.messageStatus)
        ]);
  }
}

class MessageStatusDot extends StatelessWidget {
  final MessageStatus? status;

  const MessageStatusDot({Key? key, this.status}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Color dotColor(MessageStatus status) {
      switch (status) {
        case MessageStatus.not_sent:
          return Color(0xFFF03738);
        case MessageStatus.not_view:
          return Theme.of(context).textTheme.bodyText1!.color!.withOpacity(0.1);
        case MessageStatus.viewed:
          return Color(0xFF00BF6D);
        default:
          return Colors.transparent;
      }
    }

    return Container(
      height: 12,
      width: 12,
      decoration: BoxDecoration(
        color: dotColor(status!),
        shape: BoxShape.circle,
      ),
      child: Icon(
        status == MessageStatus.not_sent ? Icons.close : Icons.done,
        size: 8,
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
    );
  }
}
