import 'package:disneymobile/apis/dio.dart' show Token;
import 'package:disneymobile/apis/user.dart';
import 'package:disneymobile/models/User.dart';
import 'package:disneymobile/screens/authenticate/authenticate.dart';
import 'package:disneymobile/screens/loading/loading.dart';
import 'package:disneymobile/states/rootState.dart';
import 'package:disneymobile/states/slices/user.dart';

import 'package:flutter_redux_hooks/flutter_redux_hooks.dart'
    show useSelector, useDispatch;
import 'package:flutter_hooks/flutter_hooks.dart'
    show useEffect, StatefulHookWidget;
import 'package:flutter/material.dart';

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
    isLoading = true;
  }

  @override
  Widget build(BuildContext context) {
    final user = useSelector<RootState, User?>((state) => state.user);
    final dispatch = useDispatch<RootState>();

    useEffect(() {
      UserAPI.getProfile().then(
        (user) {
          if (user == null) {
            return;
          }
          dispatch(AddUserAction(payload: user));
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

    if (isLoading) return const LoadingScreen();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        leading: Builder(
            builder: (context) => IconButton(
                  icon: const Icon(Icons.settings),
                  onPressed: () => Scaffold.of(context).openDrawer(),
                )),
        actions: [
          Builder(
            builder: (context) => IconButton(
              icon: const Icon(Icons.search),
              onPressed: () => Navigator.of(context).push(PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) =>
                      Scaffold(
                          appBar: AppBar(
                            title: const Text('Search'),
                          ),
                          body: const Center(
                            child: Text('Search'),
                          )),
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                    const begin = Offset(0.0, 1.0);
                    const end = Offset.zero;
                    const curve = Curves.ease;
                    final tween = Tween(begin: begin, end: end)
                        .chain(CurveTween(curve: curve));
                    return SlideTransition(
                      position: animation.drive(tween),
                      child: child,
                    );
                  })),
            ),
          ),
          Builder(
            builder: (context) => IconButton(
              icon: const Icon(Icons.people),
              onPressed: () => Scaffold.of(context).openEndDrawer(),
            ),
          ),
        ],
      ),
      drawer: const Drawer(
          child: Center(
        child: Text('Guilds'),
      )),
      endDrawer: const Drawer(
          child: Center(
        child: Text('Members'),
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
          Container(
            margin: const EdgeInsets.only(top: 50),
            child: ElevatedButton(
                onPressed: () {
                  Token.removeToken();
                  Navigator.of(context).pushNamed(AuthScreen.route);
                },
                child: const Text('Logout')),
          )
        ],
      ),
    );
  }
}
