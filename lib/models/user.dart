class User {
  String? username;
  final String account;
  final String password;
  String? avatar;
  User(
      {required this.account,
      required this.password,
      this.avatar,
      this.username});
  factory User.fromJson(Map<String, dynamic> data) {
    final username = data['username'] as String;
    final account = data['account'] as String;
    final password = data['password'] as String;
    final avatar = data['avatar'] as String;
    return User(
        account: account,
        password: password,
        username: username,
        avatar: avatar);
  }
}
