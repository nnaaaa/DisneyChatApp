import 'dart:ui';
import 'package:disneymobile/APIs/auth.dart';
import 'package:disneymobile/APIs/user.dart';
import 'package:disneymobile/models/User.dart';
import 'package:disneymobile/screens/authenticate/authenticate.dart';
import 'package:disneymobile/screens/loading/loading.dart';
import 'package:disneymobile/screens/setting/myaccount.dart';
import 'package:disneymobile/states/rootState.dart';
import 'package:disneymobile/states/slices/user.dart';
import 'package:disneymobile/styles/color.dart';
import 'package:disneymobile/widgets/avatar.dart';
import 'package:disneymobile/widgets/button.dart' show CustomButton;
import 'package:flutter_redux_hooks/flutter_redux_hooks.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:flutter_hooks/flutter_hooks.dart'
    show useEffect, StatefulHookWidget;
import 'package:flutter/material.dart';

class SettingScreen extends StatefulHookWidget {
  static const route = '/';
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  late bool isLoading;
  @override
  void initState() {
    super.initState();
    isLoading = true;
  }

  final name = 'phatpham';
  final email = 'phatpham0406@gmail.com';
  final urlImagee =
      'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80';
  final padding = EdgeInsets.symmetric(horizontal: 0);
  //final padding = const EdgeInsets.all(20);
  @override
  Widget build(BuildContext context) {
    final user = useSelector<RootState, User?>((state) => state.user);
    final dispatch = useDispatch<RootState>();

    return Drawer(
      child: Material(
        color: CustomColor.mainPrimary,
        child: ListView(
          children: <Widget>[
            Container(
              padding: EdgeInsets.fromLTRB(20, 16, 0, 0),
              height: 50,
              color: CustomColor.bluemagenta,
              child: Text(
                'USER SETTINGS',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
            Stack(
              children: <Widget>[
                Container(
                  height: 150,
                  color: Colors.black12,
                ),
                Container(
                  // profile color
                  height: 70,
                  alignment: Alignment.bottomCenter,
                  color: CustomColor.darkblue,
                ),
                Container(
                  padding: padding
                      .add(EdgeInsets.symmetric(vertical: 40, horizontal: 20)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 39,
                        backgroundColor: CustomColor.bluemagenta,
                        child: Avatar(profile: urlImagee),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        textAlign: TextAlign.justify,
                        name,
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontFamily: 'Poppins'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.only(left: 20),
              child: const Text(
                'USER SETTINGS',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
            ),
            Container(
              child: Column(
                children: [
                  const SizedBox(height: 12),
                  buildMenuItem(
                    text: 'Dark mode',
                    icon: Icons.dark_mode,
                    onClicked: () => selectedItem(context, 0),
                  ),
                  const SizedBox(height: 12),
                  buildMenuItem(
                    text: 'Set status',
                    icon: Icons.nights_stay_sharp,
                    onClicked: () => selectedItem(context, 1),
                  ),
                  const SizedBox(height: 12),
                  buildMenuItem(
                    text: 'My account',
                    icon: Icons.account_circle,
                    onClicked: () => selectedItem(context, 2),
                  ),
                  const SizedBox(height: 12),
                  buildMenuItem(
                    text: 'User profile',
                    icon: Icons.edit_rounded,
                    onClicked: () => selectedItem(context, 3),
                  ),
                  const SizedBox(height: 12),
                  buildMenuItem(
                    text: 'Log out',
                    icon: Icons.logout,
                    onClicked: () => selectedItem(context, 4),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildHeader({
    required String urlImage,
    required String name,
    required String email,
    required VoidCallback onClicked,
  }) =>
      InkWell(
        onTap: onClicked,
        child: Container(
          padding: padding.add(EdgeInsets.symmetric(vertical: 40)),
          child: Row(
            children: [
              CircleAvatar(radius: 30, backgroundImage: NetworkImage(urlImage)),
              SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    email,
                    style: TextStyle(fontSize: 14, color: Colors.white),
                  ),
                ],
              ),
              Spacer(),
              CircleAvatar(
                radius: 24,
                backgroundColor: Color.fromRGBO(30, 60, 168, 1),
                child: Icon(Icons.add_comment_outlined, color: Colors.white),
              )
            ],
          ),
        ),
      );

  Widget buildMenuItem({
    required String text,
    required IconData icon,
    VoidCallback? onClicked,
  }) {
    final color = Colors.white;
    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(text, style: TextStyle(fontSize: 20, color: color)),
      onTap: onClicked,
    );
  }

  void selectedItem(BuildContext context, int index) {
    Navigator.of(context).pop();
    switch (index) {
      case 0: // Dark mode
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => MyAccount(
            name: name,
            urlImage: urlImagee,
          ),
        ));
        break;
      case 1: // Set status(online, idle, do not disturb,..)
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => MyAccount(
            name: name,
            urlImage: urlImagee,
          ),
        ));
        break;
      case 2: // my account
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => MyAccount(
            name: name,
            urlImage: urlImagee,
          ),
        ));
        break;
      case 3: // user profile
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => MyAccount(
            name: name,
            urlImage: urlImagee,
          ),
        ));
        break;
      case 4: // log out
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => MyAccount(
            name: name,
            urlImage: urlImagee,
          ),
        ));
        break;
    }
  }
}
