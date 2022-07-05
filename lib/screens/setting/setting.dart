import 'dart:ui';
import 'package:disneymobile/APIs/auth.dart';
import 'package:disneymobile/APIs/user.dart';
import 'package:disneymobile/models/User.dart';
import 'package:disneymobile/screens/authenticate/authenticate.dart';
import 'package:disneymobile/screens/loading/loading.dart';
import 'package:disneymobile/screens/setting/component/buildMenuItem.dart';
import 'package:disneymobile/screens/setting/component/myaccount.dart';
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

  void selectedItem(BuildContext context, int index){}
  
  final name = 'phatpham';
  final email = 'phatpham0406@gmail.com';
  final urlImagee =
      'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80';
  static const padding = EdgeInsets.symmetric(horizontal: 0);
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
              padding: const EdgeInsets.fromLTRB(20, 16, 0, 0),
              height: 50,
              color: CustomColor.bluemagenta,
              child: const Text(
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
                  height: 70,
                  alignment: Alignment.bottomCenter,
                  color: CustomColor.darkblue,
                ),
                Container(
                  padding: padding
                      .add(const EdgeInsets.symmetric(vertical: 40, horizontal: 20)),
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
                        style: const TextStyle(
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
              padding:const EdgeInsets.only(left: 20),
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
}
