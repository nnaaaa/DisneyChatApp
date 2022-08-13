import 'package:disneymobile/models/BeFriend.dart';
import 'package:disneymobile/models/Member.dart';

class User {
  final String userId;
  final String account;
  final String password;
  final String name;
  final String lastLogin;
  final bool isOnline;
  final String avatarUrl;
  String? status = "Online";
  List<Member>? joinedGuilds = [];
  List<BeFriend>? friends = [];

  User(
      {required this.userId,
      required this.account,
      required this.name,
      required this.password,
      required this.lastLogin,
      required this.isOnline,
      required this.avatarUrl,
      this.status,
      this.joinedGuilds,
      this.friends});

  factory User.fromJson(Map<String, dynamic> data) {
    final userId = data['userId'] as String;
    final account = data['account'] as String;
    final password = data['password'] as String;
    final name = data['name'] as String;
    final lastLogin = data['lastLogin'] as String;
    final isOnline = data['isOnline'];
    final avatarUrl = data['avatarUrl'] as String;
    List<dynamic>? joinedGuildsJson = data['joinedGuilds'];
    List<dynamic>? friendsJson = data['friends'];

    List<Member> joinedGuilds = [];
    if (joinedGuildsJson != null) {
      joinedGuilds = joinedGuildsJson.map((i) => Member.fromJson(i)).toList();
    } else {
      joinedGuilds = [];
    }

    List<BeFriend> friends = [];
    if (friendsJson != null) {
      friends = friendsJson.map((i) => BeFriend.fromJson(i)).toList();
    } else {
      friends = [];
    }

    return User(
        userId: userId,
        account: account,
        name: name,
        password: password,
        lastLogin: lastLogin,
        isOnline: isOnline,
        avatarUrl: avatarUrl,
        joinedGuilds: joinedGuilds,
        friends: friends);
  }
}
