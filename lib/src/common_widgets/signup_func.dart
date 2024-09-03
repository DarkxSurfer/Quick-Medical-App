// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:medicalstoreapp/src/screens/navigation_bar.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

bool login = false;

Future<void> signUp(BuildContext context, String email, String password) async {
  try {
    await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const NavigationToggle()),
    );
    login = true;
    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('User registered successfully.')));
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('The password provided is too weak.')));
    } else if (e.code == 'email-already-in-use') {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('The account already exists for that email.')));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Registration failed with error code: ${e.code}')));
    }
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Registration failed with error: $e')));
  }
}

Future<void> signIn(BuildContext context, String email, String password) async {
  try {
    // ignore: unused_local_variable
    final UserCredential credential = await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Logged in successfully!')),
    );

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const NavigationToggle()),
    );
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('This User does not exist.')),
      );
    } else if (e.code == 'wrong-password') {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Password incorrect.')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Sign-in failed with error code: ${e.code}')),
      );
    }
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Sign-in failed with error: $e')),
    );
  }
}

void signOut(BuildContext context) async {
  try {
    await _auth.signOut();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Signed out successfully!')),
    );
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Sign out failed: ${e.toString()}')),
    );
  }
}

String? _verificationId;

Future<void> verifyPhoneNumber(context, phoneController) async {
  try {
    await _auth.verifyPhoneNumber(
      phoneNumber: phoneController,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await _auth.signInWithCredential(credential);
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text(("Logged in successfully!"))));
      },
      verificationFailed: (FirebaseAuthException e) {
        print('Verification failed: ${e.message}');
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Verification failed. Please try again.'),
        ));
      },
      codeSent: (String verificationId, int? resendToken) {
        _verificationId = verificationId;

        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Verification code sent to your phone.'),
        ));
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        _verificationId = verificationId;
      },
    );
  } catch (e) {
    print('Error: $e');
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('Error occurred. Please try again.'),
    ));
  }
}

Future<void> signInWithPhoneNumber(context, String smsCode) async {
  if (_verificationId != null) {
    try {
      final AuthCredential credential = PhoneAuthProvider.credential(
        verificationId: _verificationId!,
        smsCode: smsCode,
      );
      await _auth.signInWithCredential(credential);
      print("Logged in successfully!");
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Logged in successfully!'),
      ));
    } catch (e) {
      print('Sign in failed: $e');
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Sign in failed. Please try again.'),
      ));
    }
  } else {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('Verification ID is null. Please try again.'),
    ));
  }
}
