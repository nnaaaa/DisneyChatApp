import 'package:disneymobile/models/BeFriend.dart';
import 'package:disneymobile/models/Member.dart';

class User {
  final String userId;
  final String account;
  final String name;
  final String lastLogin;
  final bool isOnline;
  String? avatarUrl;
  final List<Member> joinedGuilds;
  final List<BeFriend> friends;

  User(
      {required this.userId,
      required this.name,
      required this.account,
      required this.lastLogin,
      required this.isOnline,
      this.avatarUrl,
      required this.joinedGuilds,
      required this.friends});

  factory User.fromJson(Map<String, dynamic> data) {
    final userId = data['userId'] as String;
    final name = data['name'] as String;
    final account = data['account'] as String;
    final avatarUrl = data['avatarUrl'] as String;
    final lastLogin = data['lastLogin'] as String;
    final isOnline = data['isOnline'];
    List<dynamic>? joinedGuildsJson = data['joinedGuilds'];
    List<dynamic>? friendsJson = data['friends'];

    List<Member> joinedGuilds = [];
    if (joinedGuildsJson != null) {
      joinedGuilds = joinedGuildsJson.map((i) => Member.fromJson(i)).toList();
    }

    List<BeFriend> friends = [];
    if (friendsJson != null) {
      friends = friendsJson.map((i) => BeFriend.fromJson(i)).toList();
    }

    return User(
        userId: userId,
        account: account,
        name: name,
        isOnline: isOnline,
        avatarUrl: avatarUrl,
        lastLogin: lastLogin,
        joinedGuilds: joinedGuilds,
        friends: friends);
  }
}
