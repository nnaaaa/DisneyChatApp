import 'package:disneymobile/models/Channel.dart';

import 'Guild.dart';

class Category {
  final String categoryID;
  final String name;
  final Guild guild;
  List<Channel> channels;
  
  Category({
    required this.categoryID, 
    required this.name,
    required this.guild,
    required this.channels
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    var channelsJson = json['channels'] as List;
    List<Channel> channels = channelsJson.map((i)=>Channel.fromJson(i)).toList();
    return Category(
      categoryID: json['categoryID'], 
      name: json['name'],
      guild: Guild.fromJson(json['guild']),
      channels: channels
    );
  }
}

// list channel