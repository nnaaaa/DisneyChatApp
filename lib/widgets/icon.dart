import 'package:flutter/material.dart';

class IconWidget extends StatelessWidget {
  const IconWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Image.asset('assets/icon.png',
          color: Theme.of(context).colorScheme.secondary, width: 60, height: 60),
      const Text('Disney',
          style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold))
    ]);
  }
}
