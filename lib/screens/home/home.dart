import 'dart:math';

import 'package:disneymobile/models/User.dart';
import 'package:disneymobile/screens/authenticate/authenticate.dart';
import 'package:disneymobile/screens/home/components/body.dart';
import 'package:disneymobile/screens/home/components/friends.dart';
import 'package:disneymobile/screens/loading/loading.dart';
import 'package:disneymobile/states/rootState.dart';
import 'package:disneymobile/states/slices/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux_hooks/flutter_redux_hooks.dart'
    show useSelector, useDispatch;
import 'package:flutter_hooks/flutter_hooks.dart'
    show useEffect, StatefulHookWidget;
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import 'components/searchBar.dart';

class HomeScreen extends StatefulHookWidget {
  static const route = '/';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Widget _myChats;
  late Widget _myFriends;
  late final controller;
  late bool isLoading;
  late bool isSearching;
  late int _page;

  @override
  void initState() {
    super.initState();
    controller = FloatingSearchBarController();
    isLoading = false;
    isSearching = false;
    _page = 0;
    _myChats = const Body();
    _myFriends = const Friends();
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
            child: getBody(),
          ),
          buildFloatingSearchBar(context, controller)
        ],
      ),
      bottomNavigationBar: buildBottomNavigationBar(),
      extendBody: true,
    );
  }

  CurvedNavigationBar buildBottomNavigationBar() {
    return CurvedNavigationBar(
      index: _page,
      height: 60.0,
      items: const <Widget>[
        Icon(Icons.messenger, size: 30),
        Icon(Icons.people, size: 30),
      ],
      color: Color.fromARGB(255, 68, 162, 255),
      buttonBackgroundColor: Colors.transparent,
      backgroundColor: Colors.transparent,
      animationCurve: Curves.easeInOut,
      animationDuration: Duration(milliseconds: 600),
      onTap: (index) {
        setState(() {
          _page = index;
        });
      },
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
              icon: getIcon(),
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

  Widget getIcon() {
    if (_page == 0) {
      return isSearching
          ? const Icon(Icons.search)
          : const Icon(
              Icons.cancel,
            );
    }
    return const Icon(Icons.contacts);
  }

  Widget getBody() {
    if (_page == 0) {
      return _myChats;
    } else {
      return _myFriends;
    }
  }
}
