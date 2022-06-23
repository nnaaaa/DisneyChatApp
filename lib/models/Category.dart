import 'package:disneymobile/models/Channel.dart';

class Category {
  final String categoryID;
  final String name;
  final String guildID;
  List<Channel> channels;
  
  Category({
    required this.categoryID, 
    required this.name,
    required this.guildID,
    required this.channels
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    var channelsJson = json['channels'] as List;
    List<Channel> channels = channelsJson.map((i)=>Channel.fromJson(i)).toList();
    return Category(
      categoryID: json['categoryID'], 
      name: json['name'],
      guildID: json['guildID'],
      channels: channels
    );
  }
}