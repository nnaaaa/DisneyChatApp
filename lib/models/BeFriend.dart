import 'package:disneymobile/models/User.dart';

class BeFriend {
  final String id;
  final String status;
  final User leftUser;
  final User rightUser;

  BeFriend({
    required this.id,
    required this.status,
    required this.leftUser,
    required this.rightUser,
  });

  factory BeFriend.fromJson(Map<String, dynamic> json) {
    return BeFriend(
        id: json['id'],
        status: json['status'],
        leftUser: User.fromJson(json['leftUser']),
        rightUser: User.fromJson(json['rightUser']));
  }
}
