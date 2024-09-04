import 'package:flutter/material.dart';
import '../models/notification_model.dart';

class NotificationService extends ChangeNotifier {
  List<NotificationItem> _notifications = [];

  List<NotificationItem> get notifications => _notifications;

  void addNotification(NotificationItem notification) {
    _notifications.add(notification);
    notifyListeners(); // Notifies any listeners (e.g., the notifications screen) that the list has changed
  }

  void clearNotifications() {
    _notifications = [];
    notifyListeners();
  }
}
