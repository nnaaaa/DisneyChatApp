import 'package:disneymobile/models/BeFriend.dart';
import 'package:disneymobile/models/Bot.dart';
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
  final List<Bot> createBots;
  
  User(
      {required this.userId,
      required this.account,
      required this.name,
      required this.lastLogin,
      required this.isOnline,
      this.avatarUrl,
      required this.joinedGuilds,
      required this.friends,
      required this.createBots,
      });

  factory User.fromJson(Map<String, dynamic> data) {
    final userId = data['userId'] as String;
    final account = data['account'] as String;
    final name = data['name'] as String;
    final lastLogin = data['lastLogin'] as String;
    final isOnline = data['isOnline'];
    final avatarUrl = data['avatarUrl'] as String;
    List<dynamic>? joinedGuildsJson = data['joinedGuilds'];
    List<dynamic>? friendsJson = data['friends'];
    List<dynamic>? createBotsJson = data['createBots'];

    List<Member> joinedGuilds = [];
    if (joinedGuildsJson != null) {
      joinedGuilds = joinedGuildsJson.map((i) => Member.fromJson(i)).toList();
    }

    List<BeFriend> friends = [];
    if (friendsJson != null) {
      friends = friendsJson.map((i) => BeFriend.fromJson(i)).toList();
    }

    List<Bot> createBots = [];
    if (createBotsJson != null) {
      createBots = createBotsJson.map((i) => Bot.fromJson(i)).toList();
    }

    return User(
        userId: userId,
        account: account,
        name: name,
        lastLogin: lastLogin,
        isOnline: isOnline,
        avatarUrl: avatarUrl,
        joinedGuilds: joinedGuilds,
        friends: friends,
        createBots: createBots);
  }
}
