import 'package:disneymobile/models/Channel.dart';
import 'package:disneymobile/models/GuildMember.dart';

class Role {
  final String roleID;
  final String guildID;
  String name;
  String color;
  String? icon;
  String? permission;
  List<GuildMember> members;
  List<Channel>? channels;

  Role(
      {required this.roleID,
      required this.guildID,
      required this.name,
      required this.color,
      this.icon,
      this.permission,
      required this.members,
      this.channels});

  factory Role.fromJson(Map<String, dynamic> json) {
    var list1 = json['members'] as List;
    List<GuildMember> members =
        list1.map((i) => GuildMember.fromJson(i)).toList();
    var list2 = json['channels'] as List;
    List<Channel> channels = list2.map((i) => Channel.fromJson(i)).toList();
    return Role(
        roleID: json['RoleID'],
        name: json['name'],
        icon: json['icon'],
        color: json['color'],
        permission: json['permission'],
        guildID: json['guildID'],
        members: members,
        channels: channels);
  }
}
