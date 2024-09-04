import 'package:flutter/material.dart';
import 'package:medicalstoreapp/src/screens/walkthrough_screen.dart';

import '../../screens/email_signup.dart';
import '../../screens/login_screen.dart';

class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({super.key});

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {
  bool showLoginPage = true;

  void togglePages() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return const WalkthroughScreen();
    } else {
      return const EmailSignup();
    }
  }
}
