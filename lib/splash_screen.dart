import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kalkulator_kredit/screens/main_menu/calculator_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startSplashScreen();
  }

  startSplashScreen() async {
    var duration = const Duration(seconds: 3);
    return Timer(duration, () {
      Get.offAll(const CalculatorScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFBF9FA),
        body: Center(
      child: Image.asset(
        "assets/image/app_logo.png",
        width: 200.0,
        height: 100.0,
        fit: BoxFit.contain,
      ),
    ));
  }
}
