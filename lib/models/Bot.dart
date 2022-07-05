import 'dart:ffi';

import 'package:disneymobile/models/Command.dart';
import 'package:disneymobile/models/Member.dart';
import 'package:disneymobile/models/User.dart';

class Bot {
  final String botID;
  final String name;
  final String avatarUrl;
  final Bool isListening;
  final String requiredPermissions;
  final String description;
  final String secretKey;
  final User author;
  final List<Member> joinedGuilds;
  final List<Command> commands;

  Bot({
    required this.botID,
    required this.name,
    required this.avatarUrl,
    required this.isListening,
    required this.requiredPermissions,
    required this.description,
    required this.secretKey,
    required this.author,
    required this.joinedGuilds,
    required this.commands,
  });

  factory Bot.fromJson(Map<String, dynamic> json) {
    List<dynamic>? joinedGuildsJson = json['joinedGuilds'];
    List<dynamic>? commandsJson = json['commands'];

    List<Member> joinedGuilds = [];
    if (joinedGuildsJson != null) {
      joinedGuilds = joinedGuildsJson.map((i) => Member.fromJson(i)).toList();
    }

    List<Command> commands = [];
    if (commandsJson != null) {
      commands = commandsJson.map((i) => Command.fromJson(i)).toList();
    }

    return Bot(
        botID: json['botID'],
        name: json['name'],
        avatarUrl: json['avatarUrl'],
        isListening: json['isListening'],
        requiredPermissions: json['requiredPermissions'],
        description: json['description'],
        secretKey: json['secretKey'],
        author: User.fromJson(json['author']),
        joinedGuilds: joinedGuilds,
        commands: commands);
  }
}
