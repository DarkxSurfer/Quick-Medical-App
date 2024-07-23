import 'package:flutter/material.dart';
import 'package:medicalstoreapp/src/common_widgets/custom_profile_options.dart';
import 'package:medicalstoreapp/src/constants/image_strings.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Profile',
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: Color(0xff090F47)),
        ),
      ),
      body: 
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
              text1: "Edit Profile", icon1: Icon(Icons.contact_page_outlined)),
          Divider(),
          CustomProfileOptions(
              text1: "My Orders", icon1: Icon(Icons.insert_page_break_outlined)),
          Divider(),
          CustomProfileOptions(
              text1: "Billing", icon1: Icon(Icons.access_time_rounded)),
          Divider(),
          CustomProfileOptions(text1: "FAQ", icon1: Icon(Icons.question_mark)),
          Divider(),
        ]),
      ),
    );
  }
}
