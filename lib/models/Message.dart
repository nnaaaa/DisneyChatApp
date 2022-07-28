import 'package:disneymobile/models/Channel.dart';
import 'package:disneymobile/models/Member.dart';
import 'package:disneymobile/models/React.dart';

class Message {
  final String messageID;
  final Channel channel;
  final Member author;
  Message? replyTo;
  final String? content;
  final String? images;
  final String createdAt;
  List<React>? reacts = [];

  Message(
      {required this.messageID,
      required this.channel,
      required this.author,
      this.replyTo,
      this.content,
      this.images,
      required this.createdAt,
      this.reacts});

  factory Message.fromJson(Map<String, dynamic> json) {
    List<dynamic>? reactsJson = json['reacts'];

    List<React> reacts = [];
    if (reactsJson != null) {
      reacts = reactsJson.map((i) => React.fromJson(i)).toList();
    }

    Message? replyTo =
        json['replyTo'] ? Message.fromJson(json['replyTo']) : null;
    return Message(
        messageID: json['messageID'],
        channel: Channel.fromJson(json['channel']),
        author: Member.fromJson(json['author']),
        replyTo: replyTo,
        content: json['content'],
        images: json['images'],
        createdAt: json['createdAt'],
        reacts: reacts);
  }
}
