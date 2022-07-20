import 'package:disneymobile/models/User.dart';
import 'package:disneymobile/screens/setting/component/buildMenuItem.dart';
import 'package:disneymobile/screens/setting/component/myAccount.dart';
import 'package:disneymobile/screens/setting/component/setStatus.dart';
import 'package:disneymobile/states/rootState.dart';
import 'package:disneymobile/styles/color.dart';
import 'package:disneymobile/styles/responsive.dart';
import 'package:disneymobile/widgets/avatar.dart';

import 'package:disneymobile/styles/responsive.dart' show ResponsiveUtil;
import 'package:flutter_redux_hooks/flutter_redux_hooks.dart';
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

  final name = 'phatphammm';
  final email = 'phatpham0406@gmail.com';
  final urlImage =
      'https://static.chotot.com/storage/chotot-kinhnghiem/c2c/2021/03/d2ea8e0b-cho-husky-sibir.jpg';
  static const padding = EdgeInsets.symmetric(horizontal: 0);
  @override
  Widget build(BuildContext context) {
    final user = useSelector<RootState, User?>((state) => state.user);
    final dispatch = useDispatch<RootState>();

    Color colorIcon = Colors.white;
    return Drawer(
      child: Material(
        color: CustomColor.mainPrimary,
        child: ListView(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.fromLTRB(20, 16, 0, 0),
              height: ResponsiveUtil.height(50),
              color: CustomColor.bluemagenta,
              child:  Text(
                'USER SETTINGS',
                style: TextStyle(
                  fontSize: ResponsiveUtil.getResponsiveFontSize(15),
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
            Stack(
              children: <Widget>[
                Container(
                  height: ResponsiveUtil.height(150),
                  color: Colors.black12,
                ),
                Container(
                  height: ResponsiveUtil.height(70),
                  alignment: Alignment.bottomCenter,
                  color: CustomColor.darkblue,
                ),
                Container(
                  padding: padding.add(
                      EdgeInsets.symmetric(vertical:  ResponsiveUtil.height(40), horizontal:  ResponsiveUtil.width(20))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 39,
                        backgroundColor: CustomColor.bluemagenta,
                        child: Avatar(profile: urlImage),
                      ),
                      SizedBox(height: ResponsiveUtil.height(4)),
                      Text(
                        textAlign: TextAlign.justify,
                        name,
                        style: TextStyle(
                            fontSize:  ResponsiveUtil.getResponsiveFontSize(17),
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
              padding: EdgeInsets.only(left: ResponsiveUtil.width(20)),
              child: Text(
                'USER SETTINGS',
                style: TextStyle(
                  fontSize: ResponsiveUtil.getResponsiveFontSize(13),
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
            ),
            Column(
              children: [
                SizedBox(height: ResponsiveUtil.height(12)),
                buildMenuItem(
                  text: 'Dark mode',
                  color: colorIcon,
                  icon: Icons.dark_mode,
                  onClicked: () => selectedItem(context, 0),
                ),
                SizedBox(height: ResponsiveUtil.height(12)),
                const SetStatus(),
                SizedBox(height: ResponsiveUtil.height(12)),
                buildMenuItem(
                  text: 'My account',
                  color: colorIcon,
                  icon: Icons.account_circle,
                  onClicked: () => selectedItem(context, 2),
                ),
                SizedBox(height: ResponsiveUtil.height(12)),
                buildMenuItem(
                  text: 'User profile',
                  color: colorIcon,
                  icon: Icons.edit_rounded,
                  onClicked: () => selectedItem(context, 3),
                ),
                SizedBox(height: ResponsiveUtil.height(12)),
                buildMenuItem(
                  text: 'Log out',
                  color: colorIcon,
                  icon: Icons.logout,
                  onClicked: () => selectedItem(context, 4),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void selectedItem(BuildContext context, int index) {
    // Navigator.of(context).pop();
    switch (index) {
      case 0: // Dark mode
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => MyAccount(
            name: name,
            urlImage: urlImage,
          ),
        ));
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
