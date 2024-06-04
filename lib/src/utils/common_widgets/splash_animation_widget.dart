import 'dart:async';
import 'package:flutter/material.dart';
import 'package:task/src/screens/get_all_details_screen.dart';
import 'package:task/src/utils/constants/constants.dart';
import 'package:task/src/utils/style/app_image.dart';

class SplashAnimationWidget extends StatefulWidget {
  final Function callBack;

  SplashAnimationWidget(this.callBack, {Key? key}) : super(key: key);

  @override
  _SplashAnimationWidgetState createState() => _SplashAnimationWidgetState();
}

class _SplashAnimationWidgetState extends State<SplashAnimationWidget>
    with TickerProviderStateMixin {
  Timer? _animationTimer;

  @override
  void initState() {
    super.initState();
    _startAnimation();
  }

  void _startAnimation() {
    _animationTimer = Timer(const Duration(milliseconds: 4400), () {
      widget.callBack();
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => GetAllDetailsScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      key: const Key(SPLASH_IMAGE),
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AppImages.splashCover(),
          fit: BoxFit.contain,
        ),
        color: Colors.transparent,
      ),
    );
  }

  @override
  void dispose() {
    _animationTimer?.cancel();
    super.dispose();
  }
}
