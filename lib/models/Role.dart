import 'package:disneymobile/models/Channel.dart';
import 'package:disneymobile/models/Guild.dart';
import 'package:disneymobile/models/Member.dart';

class Role {
  final String roleID;
  final Guild guild;
  String name;
  String color;
  String? icon;
  String? permission;
  final List<Member> members;
  final List<Channel> channels;

  Role(
      {required this.roleID,
      required this.guild,
      required this.name,
      required this.color,
      this.icon,
      this.permission,
      required this.members,
      required this.channels});

  factory Role.fromJson(Map<String, dynamic> data) {
    List<dynamic>? membersJson = data['friends'];
    List<dynamic>? channelsJson = data['channels'];

    List<Member> members = [];
    if (membersJson != null) {
      members = membersJson.map((i) => Member.fromJson(i)).toList();
    }

    List<Channel> channels = [];
    if (channelsJson != null) {
      channels = channelsJson.map((i) => Channel.fromJson(i)).toList();
    }

    return Role(
        roleID: data['roleID'],
        name: data['name'],
        icon: data['icon'],
        color: data['color'],
        permission: data['permission'],
        guild: Guild.fromJson(data['guild']),
        members: members,
        channels: channels);
  }
  
  get data => null;
}
