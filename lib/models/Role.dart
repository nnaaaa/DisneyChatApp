import 'package:disneymobile/models/Channel.dart';
import 'package:disneymobile/models/Guild.dart';
import 'package:disneymobile/models/Member.dart';

class Role {
  final String roleID;
  final Guild guild;
  final String name;
  final String color;
  String? icon;
  final List<Member> members;
  final List<Channel> channels;

  Role(
      {required this.roleID,
      required this.guild,
      required this.name,
      required this.color,
      this.icon,
      required this.members,
      required this.channels});

  factory Role.fromJson(Map<String, dynamic> data) {
    List<dynamic>? membersJson = data['members'];
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
        guild: Guild.fromJson(data['guild']),
        name: data['name'],
        color: data['color'],
        icon: data['icon'],
        members: members,
        channels: channels);
  }
}
