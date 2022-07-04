import 'dart:math';

import 'package:disneymobile/models/User.dart';
import 'package:disneymobile/screens/authenticate/authenticate.dart';
import 'package:disneymobile/screens/home/components/body.dart';
import 'package:disneymobile/screens/loading/loading.dart';
import 'package:disneymobile/states/rootState.dart';
import 'package:disneymobile/states/slices/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux_hooks/flutter_redux_hooks.dart'
    show useSelector, useDispatch;
import 'package:flutter_hooks/flutter_hooks.dart'
    show useEffect, StatefulHookWidget;
import 'package:material_floating_search_bar/material_floating_search_bar.dart';

import 'components/searchBar.dart';

class HomeScreen extends StatefulHookWidget {
  static const route = '/';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = FloatingSearchBarController();
  late bool isLoading;
  late bool isSearching;
  int _index = 0;
  int get index => _index;

  set index(int value) {
    _index = min(value, 1);
    _index == 1 ? controller.hide() : controller.show();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    isLoading = false;
    isSearching = false;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final user = useSelector<RootState, User?>((state) => state.user);
    //final dispatch = useDispatch<RootState>();

    // useEffect(() {
    //   UserAPI.getProfile().then(
    //     (value) {
    //       if (value == null) {
    //         return;
    //       }
    //       //   print('value ${value}');
    //       dispatch(AddUserAction(payload: value));
    //       setState(() {
    //         isLoading = false;
    //       });
    //     },
    //   ).catchError((error) {
    //     Navigator.of(context).pushReplacementNamed(AuthScreen.route);
    //     setState(() {
    //       isLoading = false;
    //     });
    //   });
    //   return () {};
    // }, []);

    //if (isLoading) return const LoadingScreen();

    return Scaffold(
      appBar: buildAppbar(user?.avatarUrl),
      body: Stack(
        fit: StackFit.expand,
        children: [
          GestureDetector(
            onTap: () {
              controller.hide();
            },
            child: const Body(),
          ),
          // put your reaction bar here
          buildFloatingSearchBar(context, controller)
        ],
      ),
      bottomNavigationBar: buildBottomNavigationBar(),
    );
  }

  BottomNavigationBar buildBottomNavigationBar() {
    return BottomNavigationBar(
      onTap: (value) => index = value,
      currentIndex: index,
      elevation: 16,
      type: BottomNavigationBarType.fixed,
      showUnselectedLabels: true,
      backgroundColor: Colors.white,
      selectedItemColor: Colors.blue,
      selectedFontSize: 11.5,
      unselectedFontSize: 11.5,
      unselectedItemColor: const Color(0xFF4d4d4d),
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.messenger), label: "Chats"),
        BottomNavigationBarItem(icon: Icon(Icons.people), label: "People"),
      ],
    );
  }

  AppBar buildAppbar(profileUrl) {
    return AppBar(
      centerTitle: true,
      title: const Text('Chats'),
      leading: Builder(
          builder: (context) => IconButton(
                icon: CircleAvatar(
                  radius: 48, // Image radius
                  backgroundImage: NetworkImage(
                      profileUrl ?? 'https://i.stack.imgur.com/l60Hf.png'),
                ),
                onPressed: () => print("personal profile"),
              )),
      actions: [
        Builder(
          builder: (context) => IconButton(
              icon: isSearching
                  ? Icon(Icons.search)
                  : Icon(
                      Icons.cancel,
                    ),
              onPressed: () {
                (controller.isVisible) ? controller.hide() : controller.show();
                setState(() {
                  isSearching = !isSearching;
                });
              }),
        ),
        Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () => print('setting'),
          ),
        ),
      ],
    );
  }
}
