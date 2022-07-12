import 'package:disneymobile/styles/responsive.dart';
import 'package:disneymobile/screens/listChannel/component/channel.dart';
import 'package:flutter/material.dart';

class Category extends StatefulWidget {
  final String nameCategory;
  const Category({Key? key, required this.nameCategory}) : super(key: key);

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  Widget addChannelButton() {
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(widget.nameCategory),
      controlAffinity: ListTileControlAffinity.leading,
      trailing:  Icon(Icons.add_box_outlined),
      children: const <Widget>[
        Channel(nameChannel: 'Channel1'),
        Channel(nameChannel: 'Channel2'),
      ],
    );
  }
}
