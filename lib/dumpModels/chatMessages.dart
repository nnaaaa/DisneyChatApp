import 'myReact.dart';

enum ChatMessageType { text, audio, image, video }

enum MessageStatus { not_sent, not_view, viewed }

class ChatMessage {
  String messageID;
  final String text;
  final ChatMessageType messageType;
  final MessageStatus messageStatus;
  final bool isSender;
  List<React>? reacts = [];

  ChatMessage({
    required this.messageID,
    required this.text,
    required this.messageType,
    required this.messageStatus,
    required this.isSender,
    this.reacts,
  });

  String get getText => text;
}
