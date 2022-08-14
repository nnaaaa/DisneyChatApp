import 'package:disneymobile/models/User.dart' show User;
import 'package:disneymobile/screens/authenticate/authenticate.dart';
import 'package:disneymobile/screens/loading/loading.dart';
import 'package:disneymobile/screens/setting/components/myAccount.dart';
import 'package:disneymobile/screens/setting/components/menuStatus.dart';
import 'package:disneymobile/screens/theme/theme_screen.dart';
import 'package:disneymobile/states/rootState.dart';
import 'package:disneymobile/styles/color.dart';
import 'package:disneymobile/styles/responsive.dart';
import 'package:disneymobile/widgets/avatarStatus.dart';

import 'package:disneymobile/styles/responsive.dart' show ResponsiveUtil;
import 'package:disneymobile/widgets/buildMenuItem.dart';
import 'package:flutter_redux_hooks/flutter_redux_hooks.dart';
import 'package:flutter_hooks/flutter_hooks.dart'
    show useEffect, StatefulHookWidget;
import 'package:flutter/material.dart';
import 'package:disneymobile/APIs/dio.dart' show Token;

// temp---------------------------
import 'package:disneymobile/styles/color.dart';

class SettingScreen extends StatefulHookWidget {
  static const route = '/setting';
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

  IconData icon = Icons.circle;
  Color color = Colors.green;

  callback(nIcon, nColor) {
    setState(() {
      icon = nIcon;
      color = nColor;
    });
  }

  static const padding = EdgeInsets.symmetric(horizontal: 0);
  @override
  Widget build(BuildContext context) {
    final user = useSelector<RootState, User?>((state) => state.user);
    final dispatch = useDispatch<RootState>();

    if (user == null) return const LoadingScreen();

    Color colorIcon = Colors.black;
    return Drawer(
      backgroundColor: CustomColor.gray,
      child: Scaffold(
        appBar: AppBar(
            title: Row(children: const [
          Text('User Setting'),
        ])),
        body: ListView(
          children: <Widget>[
            // Container(
            //   padding: const EdgeInsets.fromLTRB(20, 16, 0, 0),
            //   height: ResponsiveUtil.height(50),
            //   color: CustomColor.bluemagenta,
            //   child: Text(
            //     'USER SETTINGS',
            //     style: TextStyle(
            //       fontSize: ResponsiveUtil.getResponsiveFontSize(15),
            //       fontWeight: FontWeight.w600,
            //       color: Colors.white,
            //     ),
            //   ),
            // ),
            Stack(
              children: <Widget>[
                Container(
                  height: ResponsiveUtil.height(70),
                  alignment: Alignment.bottomCenter,
                  color: CustomColor.brown,
                ),
                Container(
                  padding: padding.add(EdgeInsets.symmetric(
                      vertical: ResponsiveUtil.height(40),
                      horizontal: ResponsiveUtil.width(20))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      AvatarStatus(
                        profile: user.avatarUrl,
                        iconStatus: icon,
                        colorStatus: color,
                      ),
                      SizedBox(height: ResponsiveUtil.height(4)),
                      Text(
                        textAlign: TextAlign.justify,
                        user.name,
                        style: TextStyle(
                            fontSize: ResponsiveUtil.getResponsiveFontSize(17),
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Poppins'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.only(left: ResponsiveUtil.width(20)),
              child: Text(
                'USER SETTINGS',
                style: TextStyle(
                  fontSize: ResponsiveUtil.getResponsiveFontSize(15),
                  fontWeight: FontWeight.w900,
                  color: CustomColor.bluemagenta,
                ),
              ),
            ),
            Column(
              children: [
                SizedBox(height: ResponsiveUtil.height(12)),
                buildMenuItem(
                  text: 'Custom Themes',
                  icon: Icons.dark_mode,
                  onClicked: () =>
                      Navigator.of(context).pushNamed(ThemeScreen.route),
                ),
                Divider(
                    indent: 7,
                    thickness: 2,
                    color: CustomColor.divider,
                    endIndent: 7),
                MenuStatus(icon, color, callback),
                Divider(
                    indent: 7,
                    thickness: 2,
                    color: CustomColor.divider,
                    endIndent: 7),
                buildMenuItem(
                  text: 'My account',
                  icon: Icons.account_circle,
                  onClicked: () => selectedItem(context, 2),
                ),
                Divider(
                    indent: 7,
                    thickness: 2,
                    color: CustomColor.divider,
                    endIndent: 7),
                buildMenuItem(
                  text: 'Edit profile',
                  icon: Icons.edit_rounded,
                  onClicked: () => selectedItem(context, 3),
                ),
                Divider(
                    indent: 7,
                    thickness: 2,
                    color: CustomColor.divider,
                    endIndent: 7),
                buildMenuItem(
                  text: 'Log out',
                  icon: Icons.logout,
                  onClicked: () async {
                    final ConfirmAction? action =
                        await _asyncConfirmDialog(context);
                    if (action == ConfirmAction.logout) {
                      Token.removeToken();
                      if (!mounted) return;
                      Navigator.of(context).pushNamed(AuthScreen.route);
                    }
                  },
                ),
                Divider(
                    indent: 7,
                    thickness: 2,
                    color: CustomColor.divider,
                    endIndent: 7),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void selectedItem(BuildContext context, int index) {
    Navigator.of(context).pop();
    switch (index) {
      case 0: // Dark mode

        break;
      case 1: // Set status(online, idle, do not disturb,..)

        break;
      case 2: // My account

        break;
      case 3: // User profile

        break;
      case 4: // log out

        break;
    }
  }
}

enum ConfirmAction { cancel, logout }

Future<ConfirmAction?> _asyncConfirmDialog(BuildContext context) async {
  return showDialog<ConfirmAction>(
    context: context,
    barrierDismissible: false, // user must tap button for close dialog!
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Log Out'),
        content: const Text('Are you sure want to log out?'),
        actions: <Widget>[
          TextButton(
            child: const Text('Cancel'),
            onPressed: () {
              Navigator.of(context).pop(ConfirmAction.cancel);
            },
          ),
          TextButton(
            child: Text(
              'Log out',
              style: TextStyle(color: CustomColor.red),
            ),
            onPressed: () {
              Navigator.of(context).pop(ConfirmAction.logout);
            },
          )
        ],
      );
    },
  );
}
