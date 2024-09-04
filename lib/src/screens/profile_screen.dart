import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medicalstoreapp/src/common_widgets/custom_profile_options.dart';
import 'package:medicalstoreapp/src/constants/image_strings.dart';
import 'package:medicalstoreapp/src/services/auth/auth_gate.dart';

import '../common_widgets/signup_func.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Profile',
        ),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const ListTile(
            leading: CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage(profileImage),
            ),
            title: Text(
              "Hi, Meezaab ",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
            ),
            subtitle: Text(
              "Welcome to  Quick Medical Store",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          CustomProfileOptions(
              text1: "Edit Profile",
              icon1: const Icon(Icons.contact_page_outlined)),
          const Divider(),
          CustomProfileOptions(
            text1: "My Orders",
            icon1: const Icon(Icons.insert_page_break_outlined),
          ),
          const Divider(),
          CustomProfileOptions(
              text1: "Billing", icon1: const Icon(Icons.access_time_rounded)),
          const Divider(),
          CustomProfileOptions(
              text1: "FAQ", icon1: const Icon(Icons.question_mark)),
          const Divider(),
          Center(
            child: SizedBox(
                width: 200,
                height: 50,
                child: ElevatedButton(
                    onPressed: () {
                      signOut(context);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const AuthGate()));
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff4157FF)),
                    child: const Text(
                      "Sign Out",
                      style: TextStyle(color: Colors.white),
                    ))),
          )
        ]),
      ),
    );
  }
}
