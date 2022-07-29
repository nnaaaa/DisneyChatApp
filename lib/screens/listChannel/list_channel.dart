import 'package:flutter/material.dart';
import 'package:disneymobile/styles/responsive.dart' show ResponsiveUtil;
import 'package:disneymobile/widgets/button.dart' show CustomButton;
import 'package:disneymobile/screens/listChannel/components/category.dart';

class ListChannel extends StatelessWidget {
  static const route = '/listChannel';
  const ListChannel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text('Guild name'),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.more_vert),
              padding: EdgeInsets.only(right: ResponsiveUtil.width(15)),
              onPressed: () {
                Navigator.of(context).pushReplacementNamed('/');
              },
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              //invite member
              Container(
                margin: EdgeInsets.only(
                    top: ResponsiveUtil.height(20),
                    bottom: ResponsiveUtil.height(30)),
                alignment: Alignment.center,
                child: CustomButton(
                  width: ResponsiveUtil.width(200),
                  backgroundColor: Theme.of(context).accentColor,
                  text: 'Invite Members',
                  onPress: () {},
                ),
              ),
              //category and channel
              Container(
                margin: EdgeInsets.only(bottom: ResponsiveUtil.height(20)),
                child: Column(
                  children: const <Widget>[
                    Category(nameCategory: 'Categories1'),
                    Category(nameCategory: 'Categories2'),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
