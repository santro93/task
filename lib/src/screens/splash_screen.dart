import 'package:flutter/material.dart';
import 'package:task/src/utils/common_widgets/splash_animation_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isSplashAnimationCompleted = true;

  void splashCallback() {
    isSplashAnimationCompleted = true;
  }

  @override
  Widget build(BuildContext context) {
    return SplashAnimationWidget(splashCallback);
  }
}
