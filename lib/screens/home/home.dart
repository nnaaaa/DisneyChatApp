import 'package:disneymobile/apis/dio.dart' show Token;
import 'package:disneymobile/apis/user.dart';
import 'package:disneymobile/models/User.dart';
import 'package:disneymobile/screens/authenticate/authenticate.dart';
import 'package:disneymobile/screens/home/components/chatBody.dart';
import 'package:disneymobile/screens/home/components/friendBody.dart';
import 'package:disneymobile/screens/loading/loading.dart';
import 'package:disneymobile/screens/setting/setting.dart';
import 'package:disneymobile/states/rootState.dart';
import 'package:disneymobile/states/slices/user.dart';
import 'package:disneymobile/widgets/CustomTheme/theme_values.dart';
import 'package:disneymobile/widgets/push_notification.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux_hooks/flutter_redux_hooks.dart'
    show useSelector, useDispatch;
import 'package:flutter_hooks/flutter_hooks.dart'
    show useEffect, StatefulHookWidget;
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'components/searchBar.dart';

import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

class HomeScreen extends StatefulHookWidget {
  static const route = '/';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Widget _myChats;
  late Widget _myFriends;
  final controller = FloatingSearchBarController();
  late bool isLoading;
  late bool isSearching;
  late int _page;

  @override
  void initState() {
    super.initState();
    isLoading = false;
    isSearching = false;
    _page = 0;
    _myChats = const ChatBody();
    _myFriends = const FriendBody();
    tz.initializeTimeZones();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final user = useSelector<RootState, User?>((state) => state.user);
    final dispatch = useDispatch<RootState>();
    useEffect(() {
      UserAPI.getProfile().then(
        (value) {
          if (value == null) {
            return;
          }
          dispatch(AddUserAction(payload: value));
          setState(() {
            isLoading = false;
          });
        },
      ).catchError((error) {
        print(error);
        Navigator.of(context).pushReplacementNamed(AuthScreen.route);
        setState(() {
          isLoading = false;
        });
      });
      return () {};
    }, []);

    if (isLoading) return const LoadingScreen();

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
        Icon(Icons.messenger, size: 20),
        Icon(Icons.people, size: 20),
      ],
      color: Theme.of(context).primaryColor,
      buttonBackgroundColor: Theme.of(context).primaryColor,
      backgroundColor: const Color.fromARGB(0, 140, 35, 35),
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 600),
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
      title: _page == 0 ? const Text('Guilds') : const Text('Online Friends'),
      leading: Builder(
          builder: (context) => IconButton(
                icon: CircleAvatar(
                  radius: 48, // Image radius
                  backgroundImage: NetworkImage(
                      profileUrl ?? 'https://i.stack.imgur.com/l60Hf.png'),
                ),
                onPressed: () =>
                    Navigator.of(context).pushNamed(SettingScreen.route),
              )),
      actions: [Builder(builder: (_) => getIcon())],
    );
  }

  IconButton getIcon() {
    if (_page == 0) {
      return IconButton(
          icon: const Icon(Icons.add),
          onPressed: () {
            print("add guild");
            NotificationService().showNotification(1, "Add guild", "Đạt đẹp trai", 1);
          });
    } else {
      return IconButton(
          icon: isSearching
              ? const Icon(Icons.cancel)
              : const Icon(
                  Icons.search,
                ),
          onPressed: () {
            (controller.isVisible) ? controller.hide() : controller.show();
            setState(() {
              isSearching = !isSearching;
            });
          });
    }
  }

  Widget getBody() {
    if (_page == 0) {
      return _myChats;
    } else {
      return _myFriends;
    }
  }
}
