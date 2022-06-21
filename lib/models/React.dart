class React {
  final String reactID;
  String message;
  String user;
  String emoji;
  React(
      {required this.reactID,
      required this.message,
      required this.user,
      required this.emoji});

  factory React.fromJson(Map<String, dynamic> json) {
    return React(
        reactID: json['reactID'],
        message: json['message'],
        user: json['user'],
        emoji: json['emoji']);
  }
}
