import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pinme/onboarding/onboarding_screen.dart';
import 'package:pinme/utils/color_utils.dart';
import 'package:pinme/utils/image_utils.dart';
import 'package:pinme/views/authentication/login/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3),
          ()=>
          Navigator.pushReplacement(context, PageTransition(type: PageTransitionType.fade, child: const OnboardingScreen())),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Container(
            width: double.infinity,
            color: ColorUtils.whiteColor,
            child: Image.asset(ImageUtils.splashLogo),
          ),
        ),
      ),
    );
  }
}
