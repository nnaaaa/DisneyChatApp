import 'package:disneymobile/models/BeFriend.dart';
import 'package:disneymobile/models/Command.dart';
import 'package:disneymobile/models/Member.dart';
import 'package:disneymobile/models/User.dart';

enum Permission { DELETE_GUILD , UPDATE_GUILD , DELETE_CHANNEL,  UPDATE_CHANNEL
   ,  CREATE_CHANNEL
    ,  CREATE_ROLE
   ,  UPDATE_ROLE
    ,  DELETE_ROLE
   ,  CREATE_EMOJI
   ,  UPDATE_EMOJI
   ,  DELETE_EMOJI
   ,  CREATE_MESSAGE
    ,  UPDATE_MESSAGE
   ,  DELETE_MESSAGE
   ,  CUD_REACT}
class Bot {
  final String botId;
  final String name;
  final String avatarUrl;
  final bool isListening;
  final Permission requiredPermissions;
  final String discription;
  final String secretKey;
  final Member author;
  List<Command>? commands = [];
  List<Member>? joinedGuilds = [];

  Bot(
      {required this.botId,
      required this.name,
      required this.avatarUrl,
      required this.isListening,
      required this.requiredPermissions,
      required this.discription,
      required this.secretKey,
      required this.author,
      this.commands,
      this.joinedGuilds});

  factory Bot.fromJson(Map<String, dynamic> data) {
    final botId = data['botId'] as String;
    final name = data['name'] as String;
    final avatarUrl = data['avatarUrl'] as String;
    final isListening = data['isListening'];
    final requiredPermissions = data['requiredPermissions'] as Permission;
    final discription = data['discription'];
    final secretKey = data['secretKey'] as String;

    List<dynamic>? commandsJson = data['commands'];
    List<dynamic>? joinedGuildsJson = data['joinedGuilds'];

    List<Member> joinedGuilds = [];
    if (joinedGuildsJson != null) {
      joinedGuilds = joinedGuildsJson.map((i) => Member.fromJson(i)).toList();
    } else {
      joinedGuilds = [];
    }

    List<Command> commands = [];
    if (commandsJson != null) {
      commands = commandsJson.map((i) => Command.fromJson(i)).toList();
    } else {
      commands = [];
    }

    return Bot(
        botId: botId,
        name: name,
        avatarUrl: avatarUrl,
        isListening: isListening,
        requiredPermissions: requiredPermissions,
        discription: discription,
        secretKey: secretKey,
        author: Member.fromJson(data['author']),
        joinedGuilds: joinedGuilds,
        commands: commands);
  }
}
