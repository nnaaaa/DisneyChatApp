class Message {
  final String messageID;
  final String channelID;
  final String author;
  final String? replyMessageID;
  String? content;
  String? images;
  String createdAt;

  Message({
    required this.messageID, 
    required this.channelID, 
    required this.author, 
    this.replyMessageID,
    this.content,
    this.images,
    required this.createdAt
  });
  
   factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      messageID: json['messageID'],
      channelID: json['messageID'],
      author: json['messageID'],
      replyMessageID: json['replyMessageID'],
      content: json['content'],
      images:json['images'],
      createdAt: json['createdAt']
    );
   }
}
