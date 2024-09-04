import 'dart:async';

import 'package:flutter/material.dart';
import 'package:medicalstoreapp/src/common_widgets/logo.dart';
import 'package:medicalstoreapp/src/common_widgets/signup_func.dart';
import 'package:medicalstoreapp/src/screens/email_login.dart';
import 'package:medicalstoreapp/src/screens/home_screen.dart';
import 'package:medicalstoreapp/src/screens/navigation_bar.dart';
import 'package:medicalstoreapp/src/screens/splash_screen.dart';

// ignore: must_be_immutable
class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _phoneFormKey = GlobalKey<FormState>();

  final _otpFormKey = GlobalKey<FormState>();

  final TextEditingController _phoneNumberController = TextEditingController();

  final TextEditingController _otpController = TextEditingController();

  bool login = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
          top: 20,
          bottom: 20,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(child: CustomLogo(color: Colors.black)),
            const SizedBox(height: 20.0),
            Text(
              "Please Enter your Mobile Number \nto Login/Sign Up",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                  color: Colors.grey.withOpacity(0.6)),
            ),
            const SizedBox(
              height: 20,
            ),
            Form(
              key: _phoneFormKey,
              child: TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your phone number.';
                  } else if (value.length != 13) {
                    return 'Invalid Phone Number';
                  }
                  return null;
                },
                controller: _phoneNumberController,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  hintText: '+923123456789',
                  // prefixIcon: CountryCodePicker(
                  //   onChanged: (value) {},
                  //   initialSelection: 'PK',
                  // ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
                padding: const EdgeInsets.all(6.0),
                child: GestureDetector(
                  onTap: () {
                    if (_phoneFormKey.currentState!.validate()) {
                      verifyPhoneNumber(
                          context, _phoneNumberController.text.trim());
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text('OTP Verification'),
                          content: Form(
                            key: _otpFormKey,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('Enter the 6 Digit OTP'),
                                const SizedBox(height: 20),
                                TextFormField(
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter the OTP received.';
                                    } else if (value.length != 6) {
                                      return 'Invalid OTP';
                                    }
                                    return null;
                                  },
                                  controller: _otpController,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    labelText: "Enter OTP",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () async {
                                if (_otpFormKey.currentState!.validate()) {
                                  signInWithPhoneNumber(
                                      context, _otpController.text);
                                  login = true;
                                }
                              },
                              child: const Text("Submit"),
                            ),
                          ],
                        ),
                      );
                    }
                  },
                  child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                          color: const Color(0xff4157FF),
                          borderRadius: BorderRadius.circular(40)),
                      child: const Center(
                        child: Text("Continue",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold)),
                      )),
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Login with Email Instead? "),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const EmailLogin()));
                  },
                  child: const Text(
                    " Click Here",
                    style: TextStyle(
                      color: Colors.blue,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
