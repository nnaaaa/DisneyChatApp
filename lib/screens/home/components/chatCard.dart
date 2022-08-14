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
      radius: 10,
      child: Card(
        elevation: 10,
        child: Center(
          child: Column(
            mainAxisAlignment:
                MainAxisAlignment.center, //Center Row contents horizontally,
            crossAxisAlignment:
                CrossAxisAlignment.center, //Center Row contents vertically,
            children: [
              CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(chat.imageUrl),
              ),
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
                        child: chat.messages?.length != 0
                            ? Text(chat.messages!.last.getText,
                                style: TextStyle(
                                    fontSize:
                                        ResponsiveUtil.getResponsiveFontSize(
                                            11),
                                    fontWeight: FontWeight.w500),
                                textAlign: TextAlign.center,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis)
                            : Text('No messages',
                                style: TextStyle(
                                    fontSize:
                                        ResponsiveUtil.getResponsiveFontSize(
                                            11),
                                    fontWeight: FontWeight.w500),
                                textAlign: TextAlign.center,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis),
                        // child: Text(
                        //   chat.messages?.last.getText,
                        //   maxLines: 1,
                        //   textAlign: TextAlign.center,
                        //   overflow: TextOverflow.ellipsis,
                        // ),
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
