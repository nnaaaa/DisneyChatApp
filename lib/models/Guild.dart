import 'package:disneymobile/models/Member.dart';
import 'package:disneymobile/models/Category.dart';
import 'package:disneymobile/models/Role.dart';
import 'package:disneymobile/models/Emoji.dart';

class Guild {
  final String guildID;
  final String name;
  String? avatarUrl;
  final List<Category> categories;
  final List<Member> members;
  final List<Emoji> emojis;
  final List<Role> roles;

  Guild({
    required this.guildID,
    required this.name,
    this.avatarUrl,
    required this.categories,
    required this.members,
    required this.emojis,
    required this.roles,
  });

  factory Guild.fromJson(Map<String, dynamic> json) {
    List<dynamic>? categoriesJson = json['categories'];
    List<dynamic>? membersJson = json['members'];
    List<dynamic>? emojisJson = json['emojis'];
    List<dynamic>? rolesJson = json['roles'];

    List<Category> categories = [];
    if (categoriesJson != null) {
      categories = categoriesJson.map((i) => Category.fromJson(i)).toList();
    }
    List<Member> members = [];
    if (membersJson != null) {
      members = membersJson.map((i) => Member.fromJson(i)).toList();
    }
    List<Emoji> emojis = [];
    if (emojisJson != null) {
      emojis = emojisJson.map((i) => Emoji.fromJson(i)).toList();
    }
    List<Role> roles = [];
    if (rolesJson != null) {
      roles = rolesJson.map((i) => Role.fromJson(i)).toList();
    }

    return Guild(
        guildID: json['guildID'],
        name: json['name'],
        avatarUrl: json['avatarUrl'],
        categories: categories,
        members: members,
        emojis: emojis,
        roles: roles);
  }
}
