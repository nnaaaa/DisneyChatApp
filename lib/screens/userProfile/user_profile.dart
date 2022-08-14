import 'package:flutter/material.dart';
import './components/user.dart';
import './components/user_preference.dart';
import './components/appbar.dart';
import './components/button.dart';
import './components/profile_widget.dart';
import 'package:disneymobile/styles/responsive.dart';
import 'package:disneymobile/styles/color.dart';

class UserProfile extends StatefulWidget {
  static const route = "/profile";
  const UserProfile({Key? key}) : super(key: key);

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    final user = UserPreferences.myUser;

    return Scaffold(
      appBar: buildAppBar(context),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          // Padding(padding: const EdgeInsets.only(top:60),
          //     child: ProfileWidget(
          //       imagePath: user.imagePath,
          //       onClicked: () async {},
          //     ),
          // ),
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
                    Padding(padding: const EdgeInsets.only(top: 40),
                      child: ProfileWidget(
                        imagePath: user.imagePath,
                        onClicked: () async {},
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          // const SizedBox(height: 4),
          buildName(user),
          const SizedBox(height: 12),
          Center(child: buildEditProfileButton()),
          const SizedBox(height: 36),
          buildAbout(user),
          const SizedBox(height:12),
          buildBio(user),
          const SizedBox(height:12),
          buildStatus(user),
        ],
      ),
    );
  }

  Widget buildName(User user) => Column(
    children: [
      Text(
        user.name,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
      ),
      const SizedBox(height: 4),
    ],
  );

  Widget buildEditProfileButton() => ButtonWidget(
    text: 'Edit User Profile',
    onClicked: () {print("edit profile");},
  );

  Widget buildAbout(User user) => Container(
    padding: EdgeInsets.symmetric(horizontal: 16),
    margin: EdgeInsets.symmetric(horizontal: 20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'ABOUT ME',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
        ),
      ],
    ),
  );

  Widget buildBio(User user) => Container(
    width: ResponsiveUtil.width(80),
    height: ResponsiveUtil.height(160),
    padding: EdgeInsets.symmetric(
        horizontal: ResponsiveUtil.width(16),
        vertical:ResponsiveUtil.height(16)
    ),
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
          offset: Offset(0, 3), // changes position of shadow
        ),
      ]
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          user.about,
          style: TextStyle(fontSize: 16, height: 1.4),
        ),
      ],
  )
  );

  Widget buildStatus(User user) => Container(
    margin: EdgeInsets.symmetric(horizontal: 20),
    child:
      Text(
        "8m ago",
        style: TextStyle(fontSize: 14, height: 1.4, color: Colors.grey),
      ),
    );
}
