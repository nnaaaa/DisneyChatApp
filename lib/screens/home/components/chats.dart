import 'package:disneymobile/screens/home/components/body.dart';
import 'package:disneymobile/screens/home/components/searchBar.dart';
import 'package:flutter/material.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';

class Chats extends StatelessWidget {
  final FloatingSearchBarController controller;
  const Chats({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        GestureDetector(
          onTap: () {
            controller.hide();
          },
          child: const Body(),
        ),
        buildFloatingSearchBar(context, controller)
      ],
    );
  }
}
