import 'package:disneymobile/models/BeFriend.dart';
import 'package:disneymobile/models/GuildMember.dart';

class User {
  final String userId;
  final String account;
  final String name;
  final String password;
  final String lastLogin;
  final bool isOnline;
  String? avatarUrl;
  final List<GuildMember> joinedGuilds;
  final List<BeFriend> friends;

  User(
      {required this.userId,
      required this.name,
      required this.account,
      required this.password,
      required this.lastLogin,
      required this.isOnline,
      this.avatarUrl,
      required this.joinedGuilds,
      required this.friends});

  factory User.fromJson(Map<String, dynamic> data) {
    final userId = data['userId'] as String;
    final name = data['name'] as String;
    final account = data['account'] as String;
    final password = data['password'] as String;
    final avatarUrl = data['avatarUrl'] as String;
    final lastLogin = data['lastLogin'] as String;
    final isOnline = data['isOnline'];
    List<dynamic>? joinedGuildsJson = data['joinedGuilds'];
    List<dynamic>? friendsJson = data['friends'];

    List<GuildMember> joinedGuilds = [];
    if (joinedGuildsJson != null){
        joinedGuildsJson.map((i) => GuildMember.fromJson(i)).toList();
    }

    List<BeFriend> friends = [];
    if (friendsJson != null){
        friendsJson.map((i) => BeFriend.fromJson(i)).toList();
    }

    return User(
        userId: userId,
        account: account,
        name: name,
        password: password,
        isOnline: isOnline,
        avatarUrl: avatarUrl,
        lastLogin: lastLogin,
        joinedGuilds: joinedGuilds,
        friends: friends);
  }
}
