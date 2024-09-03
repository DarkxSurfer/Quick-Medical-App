import 'package:flutter/material.dart';
import 'package:medicalstoreapp/src/constants/image_strings.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              notificationImage,
              width: 180,
              height: 180,
            ),
            const SizedBox(
              height: 20,
            ),
            const Text('Notifications Are Empty !!'),
          ],
        ),
      ),
    );
  }
}
