enum Status { accepted, pending, blocked }

class BeFriend {
  final String id;
  Status status;

  BeFriend({required this.id, required this.status});
  factory BeFriend.fromJson(Map<String, dynamic> json) {
    return BeFriend(id: json['id'], status: json['status']);
  }
}


// sua status thanh string 