import 'package:flutter/material.dart';
class MyAccount extends StatelessWidget {
  final String name;
  final String urlImage;

  const MyAccount({
    Key? key,
    required this.name,
    required this.urlImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pink,
          title: Text(name),
          centerTitle: true,
        ),
        body: Image.network(
          urlImage,
          width: 50,
          height: 50,
          fit: BoxFit.cover,
        ),
      );
}