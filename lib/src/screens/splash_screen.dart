import 'dart:async';

import 'package:flutter/material.dart';
import 'package:medicalstoreapp/src/common_widgets/logo.dart';
import 'package:medicalstoreapp/src/screens/walkthrough_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
        () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => WalkthroughScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff4157FF),
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Image.asset(
              "assets/images/splash_background.png",
              fit: BoxFit.fill,
            ),
          ),
          Positioned(
              left: 50,
              right: 50,
              top: 300,
              child: CustomLogo(color: Colors.white))
        ],
      ),
    );
  }
}
