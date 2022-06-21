import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';

class ResponsiveUtil {
  static late MediaQueryData _mediaQueryData;
  static late double screenWidth;
  static late double screenHeight;

  static const double designViewPortWidth = 375;
  static const double designViewPortHeight = 768;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
  }

  static double width(double w) {
    return (w / designViewPortWidth * 100).w;
  }

  static double height(double h) {
    return (h / designViewPortHeight * 100).h;
  }

  static double getResponsiveWidth(double w) {
    return (100.w * w);
  }

  static double responsiveHeight(double h) {
    return h * 100.h;
  }

  static double getResponsiveFontSize(int n) {
    return n.sp;
  }
}
