import 'package:dio/dio.dart';
import 'package:disneymobile/dumpModels/dumpChat.dart';
import 'package:disneymobile/styles/responsive.dart';
import 'package:disneymobile/widgets/avatar.dart';
import 'package:flutter/material.dart';

class ChatCard extends StatelessWidget {
  const ChatCard({
    Key? key,
    required this.chat,
    required this.press,
  }) : super(key: key);

  final Chat chat;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Card(
        elevation: 10,
        child: Center(
          child: Column(
            mainAxisAlignment:
                MainAxisAlignment.center, //Center Row contents horizontally,
            crossAxisAlignment:
                CrossAxisAlignment.center, //Center Row contents vertically,
            children: [
              Avatar(profile: chat),
              Column(
                children: [
                  Padding(
                      padding: EdgeInsets.only(top: ResponsiveUtil.height(3)),
                      child: Text(chat.name,
                          style: TextStyle(
                              fontSize:
                                  ResponsiveUtil.getResponsiveFontSize(12),
                              fontWeight: FontWeight.w500),
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis)),
                  Padding(
                      padding: EdgeInsets.only(top: ResponsiveUtil.height(8)),
                      child: Opacity(
                        opacity: 0.64,
                        child: Text(
                          chat.lastMessage,
                          maxLines: 1,
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                        ),
                      )),
                  Padding(
                      padding: EdgeInsets.only(top: ResponsiveUtil.height(3)),
                      child: Opacity(
                        opacity: 0.64,
                        child: Text(
                          chat.time,
                          style: TextStyle(
                              fontSize:
                                  ResponsiveUtil.getResponsiveFontSize(10),
                              fontStyle: FontStyle.italic),
                        ),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
