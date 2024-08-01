import 'package:flutter/material.dart';
import 'package:medicalstoreapp/src/common_widgets/logo.dart';
import 'package:medicalstoreapp/src/screens/email_login.dart';
import 'package:medicalstoreapp/src/screens/home_screen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  TextEditingController numController = TextEditingController();
  final _formfield = GlobalKey<FormState>();

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
            TextFormField(
              decoration: InputDecoration(
                hintText: '+92 312 3456789',
                hintStyle: const TextStyle(
                    fontSize: 15.0,
                    color: Color(0xffA9A9A9),
                    fontWeight: FontWeight.w500),
                contentPadding: const EdgeInsets.all(15),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
                padding: const EdgeInsets.all(6.0),
                child: InkWell(
                  onTap: () {
                    // if (_formfield.currentState!.validate()) {
                    //   print("Success");
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => HomeScreen()));
                    numController.clear();
                  }
                  // },
                  ,
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
                const Text("Login with Email Instead?"),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => EmailLogin()));
                  },
                  child: const Text(
                    "Click Here",
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
