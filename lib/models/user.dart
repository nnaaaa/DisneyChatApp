import 'package:disneymobile/models/BeFriend.dart';
import 'package:disneymobile/models/GuildMember.dart';

class User {
  final String id;
  final String account;
  String? name;
  String password;
  String? email;
  String lastLogin;
  bool isLogin;
  String? avatarUrl;
  List<GuildMember>? joinedGuilds;
  List<BeFriend>? friends;

  User(
      {required this.id,
      this.name,
      required this.account,
      required this.password,
      this.email,
      required this.lastLogin,
      required this.isLogin,
      this.avatarUrl,
      this.joinedGuilds});

  factory User.fromJson(Map<String, dynamic> data) {
    final id = data['id'] as String;
    final name = data['name'] as String;
    final account = data['account'] as String;
    final password = data['password'] as String;
    final email = data['email'] as String;
    final avatarUrl = data['avatarUrl'] as String;
    final lastLogin = data['lastLogin'] as String;
    final isLogin = data['isLogin'];
    var list1 = data['joinedGuilds'] as List;
    List<GuildMember> joinedGuilds =
        list1.map((i) => GuildMember.fromJson(i)).toList();
    return User(
        id: id,
        account: account,
        name: name,
        password: password,
        email: email,
        isLogin: isLogin,
        avatarUrl: avatarUrl,
        lastLogin: lastLogin,
        joinedGuilds: joinedGuilds);
  }
}
