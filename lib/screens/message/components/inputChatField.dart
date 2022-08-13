import 'package:disneymobile/states/rootState.dart';
import 'package:disneymobile/states/slices/message.dart';
import 'package:disneymobile/styles/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux_hooks/flutter_redux_hooks.dart';

import 'package:flutter_hooks/flutter_hooks.dart' show StatefulHookWidget;

class ChatInputField extends StatefulHookWidget {
  final int id;
  final Function() notifyParent;

  const ChatInputField({
    Key? key,
    required this.id,
    required this.notifyParent,
  }) : super(key: key);

  @override
  State<ChatInputField> createState() => _ChatInputFieldState();
}

class _ChatInputFieldState extends State<ChatInputField> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController textController = TextEditingController();
    final dispatch = useDispatch<RootState>();
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 4),
            blurRadius: 32,
            color: Colors.grey.withOpacity(0.08),
          ),
        ],
      ),
      child: SafeArea(
        child: Row(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(40),
                  border: Border.all(
                    color: Colors.black.withOpacity(0.05),
                    width: 1,
                  ),
                ),
                child: Row(
                  children: [
                    // Icon(
                    //   Icons.sentiment_satisfied_alt_outlined,
                    //   color: Theme.of(context)
                    //       .textTheme
                    //       .bodyText1!
                    //       .color!
                    //       .withOpacity(0.64),
                    // ),
                    const SizedBox(width: 15),
                    Expanded(
                      child: TextField(
                        controller: textController,
                        decoration: InputDecoration(
                          hintText: "Message here...",
                          hintStyle: TextStyle(
                            color: Colors.grey.withOpacity(0.64),
                            fontSize: ResponsiveUtil.getResponsiveFontSize(12),
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    // Icon(
                    //   Icons.attach_file,
                    //   color: Theme.of(context)
                    //       .textTheme
                    //       .bodyText1!
                    //       .color!
                    //       .withOpacity(0.64),
                    // ),
                    // Icon(
                    //   Icons.camera_alt_outlined,
                    //   color: Theme.of(context)
                    //       .textTheme
                    //       .bodyText1!
                    //       .color!
                    //       .withOpacity(0.64),
                    // ),
                    IconButton(
                        onPressed: () {
                          if (textController.text != '') {
                            dispatch(SendMessageAction(
                              payload: convertToMessage(
                                  widget.id.toString(), textController.text.toString()),
                            ));
                          }
                          widget.notifyParent();
                          //print(textController.text.toString());
                          textController.clear();
                        },
                        icon: Icon(Icons.arrow_upward,
                            color: Theme.of(context).primaryColor))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
