import 'package:flutter/cupertino.dart';

class SizeConfig {
  static double? screenWidth;
  static double? screenHeight;
  static Orientation? orientation;
  static double? defaultSize;

  void init(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    orientation = MediaQuery.of(context).orientation;
    defaultSize = orientation == Orientation.landscape
        ? screenHeight! * .024
        : screenWidth! * .024;
  }
}
