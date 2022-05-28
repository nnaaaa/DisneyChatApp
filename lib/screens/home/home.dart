import 'package:disneymobile/APIs/auth.dart';
import 'package:disneymobile/models/user.dart';
import 'package:disneymobile/screens/authenticate/authenticate.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  User? user;
  HomeScreen({Key? key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Home')),
      body: Column(
        children: [
          user != null
              ? Center(
                child: Column(children: [
                    user?.avatar != null
                        ? Image.network(user!.avatar!)
                        : const Center(),
                    Text(user!.account)
                  ]),
              )
              : const Text('Null user'),
          Container(
            margin: const EdgeInsets.only(top:50),
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
    );
  }
}
