import 'package:disneymobile/APIs/dio.dart';
import 'package:disneymobile/APIs/user.dart';
import 'package:disneymobile/dumpModels/dumpChat.dart';
import 'package:disneymobile/models/Guild.dart';
import 'package:disneymobile/screens/home/components/chatBody.dart';
import 'package:disneymobile/screens/loading/loading.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

Widget buildFloatingSearchBar(context, controller) {
  final actions = [
    FloatingSearchBarAction(
      showIfOpened: false,
      child: CircularButton(
        icon: const Icon(Icons.search),
        onPressed: () {},
      ),
    ),
    FloatingSearchBarAction.searchToClear(
      showIfClosed: false,
    ),
  ];

  final isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;

  return FloatingSearchBar(
    automaticallyImplyBackButton: false,
    controller: controller,
    borderRadius: BorderRadius.circular(10),
    clearQueryOnClose: true,
    hint: 'Search...',
    iconColor: Colors.grey,
    transitionDuration: const Duration(milliseconds: 400),
    transitionCurve: Curves.easeInOutCubic,
    physics: const BouncingScrollPhysics(),
    axisAlignment: isPortrait ? 0.0 : -1.0,
    openAxisAlignment: 0.0,
    actions: actions,
    debounceDelay: const Duration(milliseconds: 200),
    //onQueryChanged: onQueryChanged(),
    onKeyEvent: (KeyEvent keyEvent) {
      if (keyEvent.logicalKey == LogicalKeyboardKey.escape) {
        controller.query = "";
        controller.close();
      }
    },
    onQueryChanged: (String query)async {
      print(query);
      await UserAPI.findByName(query);
    },
    scrollPadding: EdgeInsets.zero,
    transition: CircularFloatingSearchBarTransition(spacing: 16),
    builder: (context, transition) {
      return Container();
    },
    //body: const Body(),
    initiallyHidden: true,
  );
}
