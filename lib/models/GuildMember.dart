import 'package:disneymobile/models/Channel.dart';
import 'package:disneymobile/models/Role.dart';

class GuildMember {
  final String id;
  final String guildID;
  final String userID;
  String? nickname;
  String? avatarUrl;
  List<Channel>? joinedChannels;
  List<Role>? roles;
  String joinAt;

  GuildMember(
      {required this.id,
      required this.guildID,
      required this.userID,
      this.nickname,
      this.avatarUrl,
      required this.joinAt,
      this.joinedChannels,
      this.roles});

  factory GuildMember.fromJson(Map<String, dynamic> json) {
    var list1 = json['joinedChannels'] as List;
    List<Channel> joinedChannels =
        list1.map((i) => Channel.fromJson(i)).toList();
    var list2 = json['roles'] as List;
    List<Role> roles = list2.map((i) => Role.fromJson(i)).toList();
    return GuildMember(
        id: json['id'],
        guildID: json['guildID'],
        userID: json['userID'],
        nickname: json['nickname'],
        avatarUrl: json['avatarUrl'],
        joinAt: json['joinAt'],
        joinedChannels: joinedChannels,
        roles: roles);
  }
}
