import 'package:flutter/material.dart';

class AppImages {
  static Color getColor(BuildContext context, Color? color) {
    return color ?? Theme.of(context).primaryColor;
  }

  static AssetImage splashCover() {
    return const AssetImage('assets/images/splash.gif');
  }
}
