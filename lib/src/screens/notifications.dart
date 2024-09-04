import 'package:flutter/material.dart';
import 'package:medicalstoreapp/src/constants/image_strings.dart';
import 'package:provider/provider.dart';

import '../provider/notification_provider.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final notifications =
        Provider.of<NotificationService>(context).notifications;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
        automaticallyImplyLeading: false,
        actions: [
          notifications.isNotEmpty
              ? TextButton(
                  onPressed: () {
                    Provider.of<NotificationService>(context, listen: false)
                        .clearNotifications();
                  },
                  child: const Text(
                    "Clear all",
                    style: TextStyle(color: Colors.blue),
                  ),
                )
              : const SizedBox(),
        ],
      ),
      body: notifications.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    notificationImage,
                    width: 180,
                    height: 180,
                  ),
                  const SizedBox(height: 20),
                  const Text('Notifications Are Empty !!'),
                ],
              ),
            )
          : ListView.builder(
              itemCount: notifications.length,
              itemBuilder: (context, index) {
                final notification = notifications[index];
                return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          margin: const EdgeInsets.all(10),
                          child: Row(
                            children: [
                              const Icon(Icons.notifications_active_outlined),
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(notification.title),
                                  Text(
                                    '${notification.message}\n${notification.timestamp}',
                                  ),
                                ],
                              )
                            ],
                          )),
                      const Divider()
                    ]);
              },
            ),
    );
  }
}
