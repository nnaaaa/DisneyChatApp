import 'package:disneymobile/models/GuildMember.dart';
import 'package:disneymobile/models/Message.dart';
import 'package:disneymobile/models/Role.dart';
import 'package:disneymobile/models/Emoji.dart';

class Channel {
  final String channelID;
  final String categoriesID;
  String name;
  List<Role>? roles;
  List<Message>? messages;
  List<GuildMember> members;

  Channel(
      {required this.channelID,
      required this.categoriesID,
      required this.name,
      required this.members,
      this.roles,
      this.messages});

  factory Channel.fromJson(Map<String, dynamic> json) {
    var list1 = json['roles'] as List;
    List<Role> roles = list1.map((i) => Role.fromJson(i)).toList();
    var list2 = json['messages'] as List;
    List<Message> messages = list2.map((i) => Message.fromJson(i)).toList();
    var list3 = json['members'] as List;
    List<GuildMember> members =
        list3.map((i) => GuildMember.fromJson(i)).toList();
    return Channel(
        channelID: json['channelID'],
        categoriesID: json['categoriesID'],
        name: json['name'],
        members: members,
        roles: roles,
        messages: messages);
  }
}
