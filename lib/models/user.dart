class User {
  String? username;
  final String account;
  final String password;
  final String id;
  String? avatar;
  User(
      {required this.account,
      required this.password,
      required this.id,
      this.avatar,
      this.username});
  factory User.fromJson(Map<String, dynamic> data) {
    final id = data['id'] as String;
    final username = data['username'] as String;
    final account = data['account'] as String;
    final password = data['password'] as String;
    final avatar = data['avatar'] as String;
    return User(
        id: id,
        account: account,
        password: password,
        username: username,
        avatar: avatar);
  }
}
