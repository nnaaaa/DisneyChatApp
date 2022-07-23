import 'package:disneymobile/screens/setting/setting.dart';
import 'package:disneymobile/styles/responsive.dart';
import 'package:flutter/material.dart';
import 'buildMenuItem.dart';

class MenuStatus extends StatefulWidget {
  IconData icon;
  Color color;
  Function(IconData, Color) callback;

  MenuStatus(this.icon, this.color, this.callback, {Key? key})
      : super(key: key);
  @override
  State<MenuStatus> createState() => _MenuStatusState();
}

class _MenuStatusState extends State<MenuStatus> {
  @override
  Widget build(BuildContext context) {
    Future<void> showmenu() async {
      showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            decoration: const BoxDecoration(
              color: Color(0xff232f34),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: ResponsiveUtil.height(12)),
                Container(
                  padding: EdgeInsets.only(left: ResponsiveUtil.width(20)),
                  child: Text(
                    'Set Status',
                    style: TextStyle(
                      fontSize: ResponsiveUtil.getResponsiveFontSize(17),
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: ResponsiveUtil.height(12)),
                SizedBox(
                    height: ResponsiveUtil.height((56 * 6).toDouble()),
                    child: Stack(
                      alignment: const Alignment(0, 0),
                      children: <Widget>[
                        Positioned(
                          top: ResponsiveUtil.height(-36),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(50)),
                                border: Border.all(
                                    color: const Color(0xff232f34),
                                    width: ResponsiveUtil.width(10))),
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
                                  onClicked: () {
                                    Navigator.pop(context);
                                    widget.callback(Icons.circle, Colors.green);
                                  }),
                              SizedBox(height: ResponsiveUtil.height(12)),
                              buildMenuItem(
                                text: 'Idle',
                                icon: Icons.nightlight,
                                color: const Color.fromARGB(255, 229, 210, 33),
                                onClicked: () {
                                  Navigator.pop(context);
                                  widget.callback(Icons.nightlight,
                                      const Color.fromARGB(255, 229, 210, 33));
                                },
                              ),
                              SizedBox(height: ResponsiveUtil.height(12)),
                              buildMenuItem(
                                text: 'Do Not Disturb',
                                icon: Icons.do_disturb_alt_sharp,
                                color: Colors.red,
                                onClicked: () {
                                  Navigator.pop(context);
                                  widget.callback(
                                      Icons.do_disturb_alt_sharp, Colors.red);
                                },
                              ),
                              SizedBox(height: ResponsiveUtil.height(12)),
                              buildMenuItem(
                                text: 'Invisible',
                                icon: Icons.hide_source_sharp,
                                color: Colors.grey,
                                onClicked: () {
                                  Navigator.pop(context);
                                  widget.callback(
                                      Icons.hide_source_sharp, Colors.grey);
                                },
                              ),
                              SizedBox(height: ResponsiveUtil.height(12)),
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
        color: Colors.white,
        icon: Icons.nights_stay_sharp,
        onClicked: () {
          showmenu();
        });
  }
}
