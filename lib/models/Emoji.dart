import 'package:disneymobile/models/Guild.dart';
import 'package:disneymobile/models/React.dart';

class Emoji {
  final String emojiID;
  final String imageUrl;
  final Guild guild;
  final List<React> reacts;

  Emoji(
      {required this.emojiID,
      required this.imageUrl,
      required this.guild,
      required this.reacts,
      });

  factory Emoji.fromJson(Map<String, dynamic> json) {
    List<dynamic>? reactsJson = json['reacts'];

    List<React> reacts = [];
    if (reactsJson != null) {
      reacts = reactsJson.map((i) => React.fromJson(i)).toList();
    }

    return Emoji(
        emojiID: json['emojiID'],
        imageUrl: json['imageUrl'],
        guild: Guild.fromJson(json['guild']),
        reacts: reacts);
  }
}