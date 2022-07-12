
import 'package:flutter/material.dart';
import 'buildMenuItem.dart';

class SetStatus extends StatelessWidget {
  const SetStatus({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Future<void> showmenu() async {
      final navigator = Navigator.of(context);
      showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            decoration: const BoxDecoration(
              /* borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0),
              ), */
              color: Color(0xff232f34),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(height: 12),
                Container(
                  padding: const EdgeInsets.only(left: 20),
                  child: const Text(
                    'Set Status',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                SizedBox(
                    height: (56 * 6).toDouble(),
                    child: Stack(
                      alignment: const Alignment(0, 0),
                      children: <Widget>[
                        Positioned(
                          top: -36,
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(50)),
                                border: Border.all(
                                    color: const Color(0xff232f34), width: 10)),
                          ),
                        ),
                        Positioned(
                          child: ListView(
                            physics: const NeverScrollableScrollPhysics(),
                            children: <Widget>[
                              buildMenuItem(
                                text: 'Online',
                                icon: Icons.circle,
                                color: Colors.green,
                                onClicked: () {},
                              ),
                              const SizedBox(height: 12),
                              buildMenuItem(
                                text: 'Idle',
                                icon: Icons.nightlight,
                                color: const Color.fromARGB(255, 229, 210, 33),
                                onClicked: () {},
                              ),
                              const SizedBox(height: 12),
                              buildMenuItem(
                                text: 'Do Not Disturb',
                                icon: Icons.do_disturb_alt_sharp,
                                color: Colors.red,
                                onClicked: () {},
                              ),
                              const SizedBox(height: 12),
                              buildMenuItem(
                                text: 'Invisible',
                                icon: Icons.hide_source_sharp,
                                color: Colors.grey,
                                onClicked: () {},
                              ),
                              const SizedBox(height: 12),
                              buildMenuItem(
                                text: 'Set a custom status',
                                icon: Icons.add_sharp,
                                onClicked: () {},
                              ),
                            ],
                          ),
                        )
                      ],
                    )),
              ],
            ),
          );
        },
      );
    }

    return buildMenuItem(
      text: 'Set status',
      fontSize: 20,
      color: Colors.white,
      icon: Icons.nights_stay_sharp,
      onClicked: () => showmenu(),
    );
  }
}
