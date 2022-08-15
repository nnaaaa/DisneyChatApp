import 'package:disneymobile/models/User.dart';
import 'package:disneymobile/screens/loading/loading.dart';
import 'package:disneymobile/states/rootState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux_hooks/flutter_redux_hooks.dart';
import './components/appbar.dart';
import './components/button.dart';
import './components/profile_widget.dart';
import 'package:disneymobile/styles/responsive.dart';
import 'package:disneymobile/styles/color.dart';
import 'package:flutter_hooks/flutter_hooks.dart'
    show useEffect, StatefulHookWidget;

class UserProfile extends StatefulHookWidget {
  static const route = "/profile";
  const UserProfile({Key? key}) : super(key: key);

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    // Take user data from server
    final user = useSelector<RootState, User?>((state) => state.user);

    if (user == null) return const LoadingScreen();

    return Scaffold(
      appBar: buildAppBar(context),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          Stack(
            children: <Widget>[
              Container(
                height: ResponsiveUtil.height(140),
                alignment: Alignment.bottomCenter,
                color: CustomColor.brown,
              ),
              Container(
                padding: EdgeInsets.symmetric(
                    vertical: ResponsiveUtil.height(30),
                    horizontal: ResponsiveUtil.width(20)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: ResponsiveUtil.height(40)),
                      child: ProfileWidget(
                        imagePath: user.avatarUrl,
                        onClicked: () async {},
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          buildName(user),
          SizedBox(height: ResponsiveUtil.height(12)),
          Center(child: buildEditProfileButton()),
          SizedBox(height: ResponsiveUtil.height(20)),
          buildAbout(user),
          SizedBox(height: ResponsiveUtil.height(12)),
          buildBio(user),
          SizedBox(height: ResponsiveUtil.height(12)),
          buildStatus(user),
        ],
      ),
    );
  }

  Widget buildName(User user) => Column(
        children: [
          Text(
            user.name,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: ResponsiveUtil.getResponsiveFontSize(20)
            ),
          ),
          SizedBox(height: ResponsiveUtil.height(4)),
        ],
      );

  Widget buildEditProfileButton() => ButtonWidget(
        text: 'Edit User Profile',
        onClicked: () {
          print("edit profile");
        },
      );

  Widget buildAbout(User user) => Container(
        padding: EdgeInsets.symmetric(horizontal: ResponsiveUtil.width(16)),
        margin: EdgeInsets.symmetric(horizontal: ResponsiveUtil.width(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:  [
            Text(
              'ABOUT ME',
              style: TextStyle(
                  fontSize: ResponsiveUtil.getResponsiveFontSize(14),
                  fontWeight: FontWeight.w900),
            ),
          ],
        ),
      );

  Widget buildBio(User user) => Container(
      width: ResponsiveUtil.width(80),
      height: ResponsiveUtil.height(160),
      padding: EdgeInsets.symmetric(
          horizontal: ResponsiveUtil.width(16),
          vertical: ResponsiveUtil.height(16)),
      margin: EdgeInsets.symmetric(horizontal: ResponsiveUtil.width(20)),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black54),
          borderRadius: BorderRadius.all(Radius.circular(24)),
          color: Theme.of(context).colorScheme.primary,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 10,
              offset: Offset(0,3),// changes position of shadow
            ),
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            user.account,
            style: TextStyle(
                fontSize: ResponsiveUtil.getResponsiveFontSize(13),
                height: ResponsiveUtil.height(1.4)
            ),
          ),
        ],
      ));

  Widget buildStatus(User user) => Container(
        margin: EdgeInsets.symmetric(horizontal: ResponsiveUtil.width(20)),
        child: Text(
          "Last seen " + user.lastLogin.substring(0,10),
          style: TextStyle(
              fontSize: ResponsiveUtil.getResponsiveFontSize(12),
              height: ResponsiveUtil.height(1.4),
              color: Colors.grey),
        ),
      );
}
