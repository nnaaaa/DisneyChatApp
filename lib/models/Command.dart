import 'dart:ffi';

import 'package:disneymobile/models/Bot.dart';
import 'package:disneymobile/models/Channel.dart';
import 'package:disneymobile/models/Member.dart';
import 'package:disneymobile/models/User.dart';
import 'Guild.dart';

class Command {
  final String commandID;
  final String name;
  final String description;
  final Bot bot;
  
  Command({
    required this.commandID, 
    required this.name,
    required this.description,
    required this.bot
  });

  factory Command.fromJson(Map<String, dynamic> json) {
   
    return Command(
      commandID: json['commandID'], 
      name: json['name'],
      description: json['description'],
      bot: Bot.fromJson(json['bot']),
    );
  }
}
