import 'package:disneymobile/dumpModels/chatMessages.dart';
import 'package:disneymobile/styles/responsive.dart';
import 'package:flutter/material.dart';

class TextMessage extends StatelessWidget {
  const TextMessage({
    Key? key,
    this.message,
  }) : super(key: key);

  final ChatMessage? message;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
          minWidth: 10, maxWidth: MediaQuery.of(context).size.width * 0.5),
      // color: MediaQuery.of(context).platformBrightness == Brightness.dark
      //     ? Colors.white
      //     : Colors.black,
      //color: Colors.white,
      decoration: BoxDecoration(
        color: Theme.of(context)
            .primaryColor
            .withOpacity(message!.isSender ? 1 : 0.1),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.all(8),
      child: Text(message!.text,
          style: TextStyle(
            color: message!.isSender
                ? Colors.white
                : Theme.of(context).textTheme.bodyText1!.color,
            overflow: TextOverflow.fade,
          ),
          textAlign: TextAlign.justify),
    );
  }
}
