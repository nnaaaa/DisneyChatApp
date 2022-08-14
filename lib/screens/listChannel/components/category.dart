import 'package:disneymobile/styles/responsive.dart';
import 'package:disneymobile/screens/listChannel/components/channel.dart';
import 'package:flutter/material.dart';

class Category extends StatefulWidget {
  final String nameCategory;
  const Category({Key? key, required this.nameCategory}) : super(key: key);

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  TextEditingController _nameController = TextEditingController();
  final List<Channel> channels = [];

  _displayDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Input name channel'),
            content: TextField(
              controller: _nameController,
              decoration: const InputDecoration(hintText: "Enter name"),
            ),
            actions: <Widget>[
              FlatButton(
                color: Colors.red,
                textColor: Colors.white,
                child: const Text('CANCEL'),
                onPressed: () {
                  setState(() {
                    Navigator.pop(context);
                  });
                },
              ),
              FlatButton(
                color: Colors.green,
                textColor: Colors.white,
                child: const Text('OK'),
                onPressed: () {
                  setState(() {
                    addChannelButton(_nameController.text);
                    Navigator.pop(context);
                  });
                },
              ),
            ],
          );
        });
  }

  @override
  void addChannelButton(String name) {
    setState(() {
      channels.insert(
          channels.length,
          Channel(
            nameChannel: name,
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
        title: Text(widget.nameCategory),
        controlAffinity: ListTileControlAffinity.leading,
        trailing: Container(
          child: GestureDetector(
            child: const Icon(
              Icons.add_box_outlined,
            ),
            onTap: () {
              _displayDialog(context);
            },
          ),
        ),
        children: channels);
  }
}
