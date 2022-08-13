import 'package:disneymobile/dumpModels/chatMessages.dart';
import 'package:disneymobile/dumpModels/dumpEmojis.dart';
import 'package:disneymobile/styles/responsive.dart';
import 'package:disneymobile/widgets/buildMenuItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

class TextMessage extends StatefulWidget {
  final ChatMessage? message;

  const TextMessage({Key? key, this.message}) : super(key: key);

  @override
  State<TextMessage> createState() => _TextMessageState();
}

class _TextMessageState extends State<TextMessage> {
  @override
  Widget build(BuildContext context) {
    Widget _buildReactionsIcon(String path, Function() onClick) {
      return IconButton(
        color: Colors.transparent,
        icon: Row(
          children: <Widget>[
            Image.network(path, height: 20),
            const SizedBox(width: 5),
          ],
        ),
        onPressed: onClick,
      );
    }

    Widget _buildAddIcon(Function() onClick) {
      return IconButton(
          color: Colors.grey, icon: const Icon(Icons.add), onPressed: onClick);
    }

    Future<void> showmenu() async {
      showModalBottomSheet(
          context: context,
          builder: (BuildContext context) {
            return Container(
                decoration: const BoxDecoration(
                  color: Color(0xff6768AB),
                ),
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: ResponsiveUtil.height(12)),
                      Container(
                        padding:
                            EdgeInsets.only(left: ResponsiveUtil.width(20)),
                        child: Row(
                          children: [
                            SizedBox(width: ResponsiveUtil.width(20)),
                            for (final emoji in emojiList)
                              _buildReactionsIcon(emoji.imageUrl, () {
                                Fluttertoast.showToast(
                                    msg: emoji.content,
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.black,
                                    textColor: Colors.white,
                                    fontSize: 16.0);
                                Navigator.pop(context);
                              }),
                            _buildAddIcon(() => Fluttertoast.showToast(
                                msg: "Add",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.black,
                                textColor: Colors.white,
                                fontSize: 16.0)),
                          ],
                        ),
                      ),
                      SizedBox(height: ResponsiveUtil.height(12)),
                      SizedBox(
                          height: ResponsiveUtil.height((56 * 6).toDouble()),
                          child: Stack(
                            alignment: const Alignment(0, 0),
                            children: <Widget>[
                              Positioned(
                                top: ResponsiveUtil.height(-36),
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(50)),
                                      border: Border.all(
                                          color: const Color(0xff232f34),
                                          width: ResponsiveUtil.width(10))),
                                ),
                              ),
                              Positioned(
                                child: ListView(
                                  physics: const NeverScrollableScrollPhysics(),
                                  children: <Widget>[
                                    buildMenuItem(
                                        text: 'Copy',
                                        icon: Icons.content_copy,
                                        color: Colors.white,
                                        onClicked: () {
                                          Clipboard.setData(ClipboardData(
                                              text: widget.message?.text));
                                          Navigator.pop(context);
                                          Fluttertoast.showToast(
                                              msg: "Message saved to clipboard",
                                              toastLength: Toast.LENGTH_SHORT,
                                              gravity: ToastGravity.CENTER,
                                              textColor: Colors.white,
                                              fontSize: 16.0);
                                        }),
                                    SizedBox(height: ResponsiveUtil.height(12)),
                                    buildMenuItem(
                                      text: 'Delete',
                                      icon: Icons.delete,
                                      color: Colors.white,
                                      onClicked: () {
                                        Navigator.pop(context);
                                      },
                                    ),
                                    SizedBox(height: ResponsiveUtil.height(12)),
                                    buildMenuItem(
                                      text: 'Reply',
                                      icon: Icons.reply,
                                      color: Colors.white,
                                      onClicked: () {
                                        Navigator.pop(context);
                                      },
                                    ),
                                    SizedBox(height: ResponsiveUtil.height(12)),
                                    buildMenuItem(
                                        text: 'Cancel',
                                        icon: Icons.cancel,
                                        color: Colors.white,
                                        onClicked: () {
                                          Navigator.pop(context);
                                        }),
                                  ],
                                ),
                              )
                            ],
                          )),
                    ]));
          });
    }

    return GestureDetector(
      onLongPress: () {
        showmenu();
      },
      child: Container(
        constraints: BoxConstraints(
            minWidth: 10, maxWidth: MediaQuery.of(context).size.width * 0.5),
        decoration: BoxDecoration(
          color: Theme.of(context)
              .primaryColor
              .withOpacity(widget.message!.isSender ? 1 : 0.1),
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.all(8),
        child: Text(widget.message!.text,
            style: TextStyle(
              color: widget.message!.isSender
                  ? Colors.white
                  : Theme.of(context).textTheme.bodyText1!.color,
              overflow: TextOverflow.fade,
            ),
            textAlign: TextAlign.justify),
      ),
    );
  }
}
