import 'package:disneymobile/models/GuildMember.dart';
import 'package:disneymobile/models/Category.dart';
import 'package:disneymobile/models/User.dart';
import 'package:disneymobile/models/Emoji.dart';

class Guild {
  final String guildID;
  String name;
  String? avatarUrl;
  List<Category>? categories;
  List<GuildMember> members;
  List<Emoji>? emojis;
  Guild(
      {required this.guildID,
      required this.name,
      this.avatarUrl,
      this.categories,
      required this.members,
      this.emojis});
  factory Guild.fromJson(Map<String, dynamic> json) {
    var list1 = json['Categories'] as List;
    List<Category> categories = list1.map((i) => Category.fromJson(i)).toList();
    var list2 = json['members'] as List;
    List<GuildMember> members =
        list2.map((i) => GuildMember.fromJson(i)).toList();
    var list3 = json['emojis'] as List;
    List<Emoji> emojis = list3.map((i) => Emoji.fromJson(i)).toList();
    return Guild(
        guildID: json['guildID'],
        name: json['name'],
        avatarUrl: json['avatarUrl'],
        categories: categories,
        members: members,
        emojis: emojis);
  }
}
