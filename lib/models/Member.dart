import 'package:disneymobile/models/Bot.dart';
import 'package:disneymobile/models/Channel.dart';
import 'package:disneymobile/models/Guild.dart';
import 'package:disneymobile/models/Message.dart';
import 'package:disneymobile/models/React.dart';
import 'package:disneymobile/models/Role.dart';
import 'package:disneymobile/models/User.dart';

class Member {
  final String memberID;
  String? nickname;
  String? avatarUrl;
  String joinAt;
  final Guild guild;
  final User user;
  final Bot bot;
  final List<Channel> joinedChannels;
  final List<Role> roles;
  final List<Message> sentMessages;
  final List<React> sentReacts;

  Member(
      {required this.memberID,
      this.nickname,
      this.avatarUrl,
      required this.joinAt,
      required this.guild,
      required this.user,
      required this.bot,
      required this.joinedChannels,
      required this.roles,
      required this.sentMessages,
      required this.sentReacts});

  factory Member.fromJson(Map<String, dynamic> json) {
    List<dynamic>? joinedChannelsJson = json['joinedChannels'];
    List<dynamic>? rolesJson = json['roles'];
    List<dynamic>? sentMessagesJson = json['sentMessages'];
    List<dynamic>? sentReactsJson = json['sentReacts'];

    List<Channel> joinedChannels = [];
    if (joinedChannelsJson != null) {
      joinedChannels =
          joinedChannelsJson.map((i) => Channel.fromJson(i)).toList();
    }

    List<Role> roles = [];
    if (rolesJson != null) {
      roles = rolesJson.map((i) => Role.fromJson(i)).toList();
    }

    List<Message> sentMessages = [];
    if (sentMessagesJson != null) {
      sentMessages = sentMessagesJson.map((i) => Message.fromJson(i)).toList();
    }

    List<React> sentReacts = [];
    if (sentReactsJson != null) {
      sentReacts = sentReactsJson.map((i) => React.fromJson(i)).toList();
    }

    return Member(
      memberID: json['memberID'],
      nickname: json['nickname'],
      avatarUrl: json['avatarUrl'],
      joinAt: json['joinAt'],
      guild: Guild.fromJson(json['guild']),
      user: User.fromJson(json['user']),
      bot: Bot.fromJson(json['bot']),
      joinedChannels: joinedChannels,
      roles: roles,
      sentMessages: sentMessages,
      sentReacts: sentReacts,
    );
  }
}
