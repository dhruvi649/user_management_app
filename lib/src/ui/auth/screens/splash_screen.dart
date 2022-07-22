import 'dart:async';
import 'package:flutter/material.dart';
import '../../../base/utils/constants/color_constants.dart';
import '../../../base/utils/constants/asset_constants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 3),
          () => Navigator.of(context).pushReplacementNamed('routeSignIn'),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundeColor,
      body: Center(
        child: Image.asset(
          appLogo,
        ),
      ),
    );
  }
}