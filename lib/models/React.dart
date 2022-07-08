import 'package:disneymobile/models/Emoji.dart';
import 'package:disneymobile/models/Member.dart';
import 'package:disneymobile/models/Message.dart';

class React {
  final String reactID;
  final Member author;
  final Message message;
  final Emoji emoji;
  React(
      {required this.reactID,
      required this.message,
      required this.author,
      required this.emoji});

  factory React.fromJson(Map<String, dynamic> json) {
    return React(
        reactID: json['reactID'],
        author: Member.fromJson(json['author']),
        message: Message.fromJson(json['message']),
        emoji: Emoji.fromJson(json['emoji']));
  }
}
