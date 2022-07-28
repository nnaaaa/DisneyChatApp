import 'package:disneymobile/styles/responsive.dart';
import 'package:flutter/material.dart';

class Channel extends StatefulWidget {
  final String nameChannel;
  const Channel({Key? key, required this.nameChannel}) : super(key: key);

  @override
  State<Channel> createState() => _ChannelState();
}

class _ChannelState extends State<Channel> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        child: Container(
          margin: EdgeInsets.only(
              bottom: ResponsiveUtil.height(15),
              left: ResponsiveUtil.width(50),
              right: ResponsiveUtil.width(20)),
          decoration: BoxDecoration(
            borderRadius: new BorderRadius.circular(16.0),
          ),
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(Icons.chat_outlined),
              SizedBox(width: ResponsiveUtil.width(10)),
              Text(widget.nameChannel),
            ],
          ),
        ),
        onTap: () {},
      ),
    );
  }
}
