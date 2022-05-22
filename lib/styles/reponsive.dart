import 'package:flutter/material.dart';

class Responsibility {
  static setWidth(BuildContext context, double widthDesign) {
    final double resizeScreensWidth =
        widthDesign * MediaQuery.of(context).size.width / 375;
    return resizeScreensWidth;
  }

  static setHeight(BuildContext context, double heightDesign) {
    final double resizeScreensHeight =
        heightDesign * MediaQuery.of(context).size.height / 768;
    return resizeScreensHeight;
  }
}
