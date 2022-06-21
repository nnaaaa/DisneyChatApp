import 'package:disneymobile/styles/color.dart';
import 'package:flutter/material.dart';
import 'package:disneymobile/styles/responsive.dart';

class IconWidget extends StatelessWidget {
  const IconWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Image.asset('assets/images/icon.png',
          color: Theme.of(context).colorScheme.secondary, width: ResponsiveUtil.width(100), height: ResponsiveUtil.height(100)),
      const Text('Disney',
          style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold))
    ]);
  }
}
