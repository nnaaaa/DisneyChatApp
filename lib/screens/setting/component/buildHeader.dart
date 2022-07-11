import 'package:dio/dio.dart';
import 'package:disneymobile/screens/setting/component/myAccount.dart';
import 'package:disneymobile/screens/setting/component/setStatus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class buildHeader extends StatelessWidget {
  const buildHeader(
      {Key? key,
      required this.urlImage,
      required this.name,
      required this.email,
      required this.onClicked})
      : super(key: key);
  final String urlImage;
  final String name;
  final String email;
  final VoidCallback onClicked;
  static const padding = EdgeInsets.symmetric(horizontal: 0);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClicked,
      child: Container(
        padding: padding.add(EdgeInsets.symmetric(vertical: 40)),
        child: Row(
          children: [
            CircleAvatar(radius: 30, backgroundImage: NetworkImage(urlImage)),
            const SizedBox(width: 20),
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
                  style: const TextStyle(fontSize: 14, color: Colors.white),
                ),
              ],
            ),
            const Spacer(),
            const CircleAvatar(
              radius: 24,
              backgroundColor: Color.fromRGBO(30, 60, 168, 1),
              child: Icon(Icons.add_comment_outlined, color: Colors.white),
            )
          ],
        ),
      ),
    );
  }

}
