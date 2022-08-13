class Emoji {
  final String emojiID;
  String imageUrl;
  String content;
  //String guildID;
  Emoji({
    required this.emojiID,
    required this.imageUrl,
    required this.content,
    //required this.guildID
  });

  factory Emoji.fromJson(Map<String, dynamic> json) {
    return Emoji(
      emojiID: json['emojiID'],
      imageUrl: json['imageUrl'],
      content: json['content'],
      //guildID: json['guildID']
    );
  }
}
// sua guild 