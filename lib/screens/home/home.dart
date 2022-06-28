import 'package:disneymobile/APIs/auth.dart';
import 'package:disneymobile/APIs/user.dart';
import 'package:disneymobile/models/User.dart';
import 'package:disneymobile/screens/authenticate/authenticate.dart';
import 'package:disneymobile/screens/loading/loading.dart';
import 'package:disneymobile/states/rootState.dart';
import 'package:disneymobile/states/slices/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux_hooks/flutter_redux_hooks.dart'
    show useSelector, useDispatch;
import 'package:flutter_hooks/flutter_hooks.dart'
    show useEffect, StatefulHookWidget;

class HomeScreen extends StatefulHookWidget {
  static const route = '/';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late bool isLoading;
  @override
  void initState() {
    super.initState();
    isLoading = false;
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
          //   print('value ${value}');
          dispatch(AddUserAction(payload: value));
          setState(() {
            isLoading = false;
          });
        },
      ).catchError((error) {
        Navigator.of(context).pushReplacementNamed(AuthScreen.route);
        setState(() {
          isLoading = false;
        });
      });
      return () {};
    }, []);

    //if (isLoading) return const LoadingScreen();

    return Scaffold(
      appBar: buildAppbar(user?.avatarUrl),
      drawer: const Drawer(
          child: Center(
        child: Text('Guilds'),
      )),
      endDrawer: const Drawer(
          child: Center(
        child: Text('Friends'),
      )),
      body: Column(
        children: [
          user != null
              ? Center(
                  child: Column(children: [
                    user.avatarUrl != null
                        ? Image.network(user.avatarUrl!)
                        : const Center(),
                    Text(user.account),
                    Text(user.userId),
                  ]),
                )
              : const Text('Null user'),
        ],
      ),
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
            icon: const Icon(Icons.people),
            onPressed: () => Scaffold.of(context).openEndDrawer(),
          ),
        ),
      ],
    );
  }
}
