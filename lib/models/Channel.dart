import 'package:disneymobile/models/Category.dart';
import 'package:disneymobile/models/Member.dart';
import 'package:disneymobile/models/Message.dart';
import 'package:disneymobile/models/Role.dart';
import 'package:disneymobile/models/Emoji.dart';

class Channel {
  final String channelID;
  Category category;
  String name;
  List<Role> roles;
  List<Message> messages;
  List<Member> members;

  Channel(
      {required this.channelID,
      required this.category,
      required this.name,
      required this.members,
      required this.roles,
      required this.messages});

  factory Channel.fromJson(Map<String, dynamic> json) {
    var rolesJson = json['roles'] as List;
    List<Role> roles = rolesJson.map((i) => Role.fromJson(i)).toList();
    var messagesJson = json['messages'] as List;
    List<Message> messages =
        messagesJson.map((i) => Message.fromJson(i)).toList();
    var membersJson = json['members'] as List;
    List<Member> members = membersJson.map((i) => Member.fromJson(i)).toList();
    
    final category = Category.fromJson(json['category']);
    return Channel(
        channelID: json['channelID'],
        category: category,
        name: json['name'],
        members: members,
        roles: roles,
        messages: messages);
  }
}
