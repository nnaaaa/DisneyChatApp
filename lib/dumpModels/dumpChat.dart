import 'package:disneymobile/dumpModels/chatMessages.dart';
import 'package:disneymobile/dumpModels/dumpEmojis.dart';
import 'package:disneymobile/dumpModels/dumpUser.dart';
import 'package:disneymobile/dumpModels/myReact.dart';
import 'package:flutter/material.dart';

class Chat {
  final int id;
  final String name, imageUrl, time;
  List<ChatMessage>? messages;
  final bool isActive;

  Chat({
    required this.id,
    this.messages,
    this.name = '',
    this.imageUrl = '',
    this.time = '',
    this.isActive = false,
  });
}

List<Chat> dumpChat = [
  Chat(
    id: 1,
    messages: [
      ChatMessage(
          messageID: '1',
          text: "Hi ",
          messageType: ChatMessageType.text,
          messageStatus: MessageStatus.viewed,
          isSender: false,
          reacts: [React(author: cr7, emoji: emojiList[0])]),
      ChatMessage(
          messageID: '2',
          text: "Can I have your signature ",
          messageType: ChatMessageType.text,
          messageStatus: MessageStatus.viewed,
          isSender: false,
          reacts: [React(author: cr7, emoji: emojiList[5])]),
    ],
    name: "Christiano Ronaldo",
    imageUrl:
        'https://cdnimg.vietnamplus.vn/t620/uploaded/mzdic/2022_04_19/ronaldo1904.jpg',
    time: "3m ago",
    isActive: false,
  ),
  Chat(
    id: 2,
    messages: [
      ChatMessage(
          messageID: '1',
          text: "I love you my bae",
          messageType: ChatMessageType.text,
          messageStatus: MessageStatus.viewed,
          isSender: false,
          reacts: [React(author: cr7, emoji: emojiList[3])]),
      ChatMessage(
          messageID: '2',
          text: "I love you too <3",
          messageType: ChatMessageType.text,
          messageStatus: MessageStatus.viewed,
          isSender: true,
          reacts: []),
    ],
    name: "Emma Waston",
    imageUrl:
        "https://upload.wikimedia.org/wikipedia/commons/7/71/Emma_Watson_in_the_Bag.jpg",
    time: "8m ago",
    isActive: true,
  ),
  Chat(
    id: 5,
    name: "Melody Marks",
    messages: [],
    imageUrl:
        "https://i.pinimg.com/736x/52/81/71/52817168f255a475afae309616e697f0.jpg",
    time: "5d ago",
    isActive: false,
  ),
  Chat(
    id: 3,
    name: "Leuleu Messi",
    messages: [],
    imageUrl:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRHkju7oWifCdB_B_Hmsol3BpzILxwkiddr7w&usqp=CAU",
    time: "5d ago",
    isActive: true,
  ),
  Chat(
    id: 4,
    name: "Thắng Thông Minh",
    messages: [],
    imageUrl:
        "https://scontent.fsgn6-1.fna.fbcdn.net/v/t1.15752-9/203707619_970775803715028_5401410019197328519_n.png?_nc_cat=106&ccb=1-7&_nc_sid=ae9488&_nc_ohc=3uE9gwlb3BYAX-HnHng&_nc_ht=scontent.fsgn6-1.fna&oh=03_AVIhksIBYBq3mnl3nW9D3nvZth3iZCQWsQprYQyheU9P0w&oe=62E96240",
    time: "6d ago",
    isActive: false,
  ),
];
