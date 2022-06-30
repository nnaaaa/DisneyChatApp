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

import 'components/searchBar.dart';

class HomeScreen extends StatefulHookWidget {
  static const route = '/';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late bool isLoading;
  late int selectedIndex;
  @override
  void initState() {
    super.initState();
    isLoading = false;
    selectedIndex = 1;
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
        children: [const Body(), buildFloatingSearchBar(context)],
      ),
      bottomNavigationBar: buildBottomNavigationBar(),
    );
  }

  BottomNavigationBar buildBottomNavigationBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: selectedIndex,
      onTap: (value) {
        setState(() {
          selectedIndex = value;
        });
      },
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
            icon: const Icon(Icons.settings),
            onPressed: () => print('setting'),
          ),
        ),
      ],
    );
  }
}
