import 'package:disneymobile/APIs/auth.dart';
import 'package:disneymobile/models/user.dart';
import 'package:disneymobile/screens/authenticate/authenticate.dart';
import 'package:disneymobile/states/rootState.dart';

import 'package:flutter_redux_hooks/flutter_redux_hooks.dart' show useSelector;
import 'package:flutter_hooks/flutter_hooks.dart' show HookWidget;
import 'package:flutter/material.dart';

class HomeScreen extends HookWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = useSelector<RootState, User?>((state) => state.user);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () => Scaffold.of(context).openDrawer(),
            );
          }
        ),
        actions: [
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
                    user.avatar != null
                        ? Image.network(user.avatar!)
                        : const Center(),
                    Text(user.account)
                  ]),
                )
              : const Text('Null user'),
          Container(
            margin: const EdgeInsets.only(top: 50),
            child: ElevatedButton(
                onPressed: () {
                  Token.removeToken();
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (ctx) => const AuthScreen()));
                },
                child: const Text('Logout')),
          )
        ],
      ),
      // endDrawer: ,
    );
  }
}
