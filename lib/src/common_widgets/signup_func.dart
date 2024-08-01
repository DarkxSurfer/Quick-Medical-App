import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:medicalstoreapp/src/screens/email_login.dart';
import 'package:medicalstoreapp/src/screens/home_screen.dart';

bool login = false;

Future<void> signUp(BuildContext context, String email, String password) async {
  try {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
          builder: (context) =>
              EmailLogin()), 
    );
    print('User registered successfully.');
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      print('The password provided is too weak.');
    } else if (e.code == 'email-already-in-use') {
      print('The account already exists for that email.');
    } else {
      print('Registration failed with error code: ${e.code}');
    }
  } catch (e) {
    print('Registration failed with error: $e');
  }
}

Future<void> signIn(BuildContext context, String email, String password) async {
  try {
    final UserCredential credential =
        await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    login = true;
    print('User signed in successfully: ${credential.user?.email}');
    print('Login status: $login');

  
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
          builder: (context) =>
              HomeScreen()),
    );
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      print('No user found for that email.');
    } else if (e.code == 'wrong-password') {
      print('Wrong password provided for that user.');
    } else {
      print('Sign-in failed with error code: ${e.code}');
    }
  } catch (e) {
    print('Sign-in failed with error: $e');
  }
}
