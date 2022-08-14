import 'package:flutter/material.dart';
import 'package:disneymobile/styles/responsive.dart';
import 'package:disneymobile/styles/color.dart';
import './components/user_preference.dart';

class EditProfile extends StatefulWidget {
  static const route = "/editProfile";
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    final user = UserPreferences.myUser;

    return Scaffold(

    );
  }

}