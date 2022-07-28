import 'package:bottom_drawer/bottom_drawer.dart';
import 'package:disneymobile/APIs/auth.dart';
import 'package:disneymobile/APIs/user.dart';
import 'package:disneymobile/models/User.dart';
import 'package:disneymobile/screens/setting/components/buildMenuItem.dart';
import 'package:disneymobile/screens/setting/components/myAccount.dart';
import 'package:disneymobile/screens/setting/components/menuStatus.dart';
import 'package:disneymobile/states/rootState.dart';
import 'package:disneymobile/styles/color.dart';
import 'package:disneymobile/styles/responsive.dart';
import 'package:disneymobile/widgets/ava2.dart';

import 'package:disneymobile/styles/responsive.dart' show ResponsiveUtil;
import 'package:disneymobile/widgets/avatar.dart';
import 'package:disneymobile/widgets/button.dart' show CustomButton;
import 'package:flutter_redux_hooks/flutter_redux_hooks.dart';
import 'package:flutter_hooks/flutter_hooks.dart'
    show useEffect, StatefulHookWidget;
import 'package:disneymobile/styles/responsive.dart' show ResponsiveUtil;
import 'package:disneymobile/APIs/dio.dart' show Token;
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
    isLoading = true;
    super.initState();
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

    String name = 'phatpham';
    String urlImage = 
        'https://static.chotot.com/storage/chotot-kinhnghiem/c2c/2021/03/d2ea8e0b-cho-husky-sibir.jpg';
    if (user != null) {
      name = user.name;
      user.avatarUrl != null ? urlImage = user.avatarUrl! : urlImage = urlImage;
    }

    Color colorIcon = Colors.white;
    return Drawer(
      child: Material(
        color: CustomColor.mainPrimary,
        child: ListView(
          children: <Widget>[
            Container(
              padding: EdgeInsets.fromLTRB(ResponsiveUtil.width(20), ResponsiveUtil.height(16), 0, 0),
              height: ResponsiveUtil.height(60),
              color: CustomColor.bluemagenta,
              child: Text(
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
<<<<<<< HEAD
                  height: ResponsiveUtil.height(150),
                  color: Colors.black12,
                ),
                Container(
                  height: ResponsiveUtil.height(70),
=======
                  height: ResponsiveUtil.height(185),
                  color: Colors.black12,
                ),
                Container(
                  height: ResponsiveUtil.height(90),
>>>>>>> d991440bbbf96dd28d73ce95788e1a942e35447a
                  alignment: Alignment.bottomCenter,
                  color: CustomColor.darkblue,
                ),
                Container(
                  padding: padding.add(EdgeInsets.symmetric(
                      vertical: ResponsiveUtil.height(40),
                      horizontal: ResponsiveUtil.width(20))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Ava2(
                        profile: urlImage,
                        iconStatus: icon,
                        colorStatus: color,
                      ),
<<<<<<< HEAD
                      SizedBox(height: ResponsiveUtil.height(4)),
=======
                      SizedBox(height: ResponsiveUtil.height(5)),
>>>>>>> d991440bbbf96dd28d73ce95788e1a942e35447a
                      Text(
                        textAlign: TextAlign.justify,
                        name,
                        style: TextStyle(
<<<<<<< HEAD
                            fontSize: ResponsiveUtil.getResponsiveFontSize(17),
=======
                            fontSize: ResponsiveUtil.getResponsiveFontSize(15),
>>>>>>> d991440bbbf96dd28d73ce95788e1a942e35447a
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
<<<<<<< HEAD
                  fontSize: ResponsiveUtil.getResponsiveFontSize(13),
=======
                  fontSize: ResponsiveUtil.getResponsiveFontSize(15),
>>>>>>> d991440bbbf96dd28d73ce95788e1a942e35447a
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
            ),
            Column(
              children: [
<<<<<<< HEAD
                SizedBox(height: ResponsiveUtil.height(12)),
=======
                SizedBox(height: ResponsiveUtil.height(13)),
>>>>>>> d991440bbbf96dd28d73ce95788e1a942e35447a
                buildMenuItem(
                  text: 'Dark mode',
                  color: colorIcon,
                  icon: Icons.dark_mode,
                  onClicked: () => selectedItem(context, 0),
                ),
<<<<<<< HEAD
                SizedBox(height: ResponsiveUtil.height(12)),
                MenuStatus(icon, color, callback),
                SizedBox(height: ResponsiveUtil.height(12)),
=======
                SizedBox(height: ResponsiveUtil.height(13)),
                const SetStatus(),
                SizedBox(height: ResponsiveUtil.height(13)),
>>>>>>> d991440bbbf96dd28d73ce95788e1a942e35447a
                buildMenuItem(
                  text: 'My account',
                  color: colorIcon,
                  icon: Icons.account_circle,
                  onClicked: () => selectedItem(context, 2),
                ),
<<<<<<< HEAD
                SizedBox(height: ResponsiveUtil.height(12)),
=======
                SizedBox(height: ResponsiveUtil.height(13)),
>>>>>>> d991440bbbf96dd28d73ce95788e1a942e35447a
                buildMenuItem(
                  text: 'User profile',
                  color: colorIcon,
                  icon: Icons.edit_rounded,
                  onClicked: () => selectedItem(context, 3),
                ),
<<<<<<< HEAD
                SizedBox(height: ResponsiveUtil.height(12)),
=======
                SizedBox(height: ResponsiveUtil.height(13)),
>>>>>>> d991440bbbf96dd28d73ce95788e1a942e35447a
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
    Navigator.of(context).pop();
    switch (index) {
      case 0: // Dark mode
        /* Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => MyAccount(
            name: name,
            urlImage: urlImage,
          ),
        )); */
        break;
      case 2: // My account

        break;
      case 3: // User profile

        break;
      case 4: // log out
        Token.removeToken();
        Navigator.of(context).pushNamed(AuthScreen.route);
        break;
    }
  }
}
