import 'dart:ffi';
import 'package:disneymobile/models/Category.dart';
import 'package:disneymobile/models/Member.dart';
import 'package:disneymobile/models/Message.dart';
import 'package:disneymobile/models/Role.dart';

class Channel {
  final String channelID;
  final String name;
  final Bool isPrivate;
  final Category category;
  final List<Role> roles;
  final List<Member> members;
  final List<Message> messages;

  Channel(
      {required this.channelID,
      required this.name,
      required this.isPrivate,
      required this.category,
      required this.roles,
      required this.members,
      required this.messages});

  factory Channel.fromJson(Map<String, dynamic> json) {
    List<dynamic>? rolesJson = json['roles'];
    List<dynamic>? membersJson = json['members'];
    List<dynamic>? messagesJson = json['messages'];

    List<Role> roles = [];
    if (rolesJson != null) {
      roles = rolesJson.map((i) => Role.fromJson(i)).toList();
    }
    List<Member> members = [];
    if (membersJson != null) {
      members = membersJson.map((i) => Member.fromJson(i)).toList();
    }
    List<Message> messages = [];
    if (messagesJson != null) {
      messages = messagesJson.map((i) => Message.fromJson(i)).toList();
    }

    return Channel(
        channelID: json['channelID'],
        name: json['name'],
        isPrivate: json['isPrivate'],
        category: Category.fromJson(json['category']),
        members: members,
        roles: roles,
        messages: messages);
  }
}
