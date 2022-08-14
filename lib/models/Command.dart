import 'package:disneymobile/models/Bot.dart';

class Command {
  final String commandId;
  final String name;
  final String description;
  final String args;
  final Bot bot ;

  Command(
      {required this.commandId,
      required this.name,
      required this.description,
      required this.args,
      required this.bot});

  factory Command.fromJson(Map<String, dynamic> data) {
    final commandId = data['commandId'] as String;
    final name = data['name'] as String;
    final description = data['description'] as String;
    final args = data['args'];

    return Command(
        commandId: commandId,
        name: name,
        description: description,
        args: args,
        bot: Bot.fromJson(data['bot']),
        );
  }
}
