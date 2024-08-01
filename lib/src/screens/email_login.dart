import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:medicalstoreapp/src/common_widgets/logo.dart';
import 'package:medicalstoreapp/src/common_widgets/signup_func.dart';
import 'package:medicalstoreapp/src/screens/email_signup.dart';

class EmailLogin extends StatefulWidget {
  EmailLogin({super.key});

  @override
  State<EmailLogin> createState() => _EmailLoginState();
}

class _EmailLoginState extends State<EmailLogin> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passController = TextEditingController();

  bool passToggle = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Email Login"),
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
              child: Column(
            children: [
              const CustomLogo(color: Colors.black),
              const SizedBox(height: 20),
              const Text("Enter Email And Password To Login"),
              
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(6.0),
                child: 
                Form(
                  child: TextFormField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.only(
                          right: 10, left: 10, top: 10, bottom: 10),
                      hintText: 'Email',
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      prefixIcon: Icon(Icons.email_outlined),
                    ),
                    validator: (value) {
                      bool emailValid = RegExp(
                              r"^[a-zA-Z0-9.a-zA-z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(value!);
                      if (value.isEmpty) {
                        return "Enter valid Email";
                      } else if (!emailValid) {
                        return "Enter valid Email";
                      }
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(6.0),
                child: 
                Form(
                  child: TextFormField(
                    controller: passController,
                    obscureText: passToggle,
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.only(
                            right: 10, left: 10, top: 10, bottom: 10),
                        hintText: 'Password',
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        prefixIcon: const Icon(Icons.lock_outline),
                        suffix: InkWell(
                          onTap: () {
                            setState(() {
                              passToggle = !passToggle;
                            });
                          },
                          child: Icon(passToggle
                              ? Icons.visibility
                              : Icons.visibility_off),
                        )),
                    validator: (value) {
                      setState(() {});
                      if (value!.isEmpty) {
                        return "Enter Password";
                      } else if (passController.text.length < 6) {
                        return "Password length should be more than 6";
                      }
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(6.0),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      signIn(
                          context, emailController.text, passController.text);

                      emailController.clear();
                      passController.clear();
                    });
                  },
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        borderRadius: BorderRadius.circular(20)),
                    child: const Center(
                      child: Text("Login",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Dont have an Account? "),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EmailSignup()));
                    },
                    child: const Text(
                      "SignUp",
                      style: TextStyle(color: Colors.blue),
                    ),
                  )
                ],
              )
            ],
          )),
        ),
      ),
    );
  }
}
