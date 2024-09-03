import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:medicalstoreapp/src/common_widgets/signup_func.dart';
import 'package:medicalstoreapp/src/screens/navigation_bar.dart';
import 'package:medicalstoreapp/src/services/auth/login_or_register.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const NavigationToggle();
          } else if (login == true) {
            return const NavigationToggle();
          } else {
            return const LoginOrRegister();
          }
        },
      ),
    );
  }
}
