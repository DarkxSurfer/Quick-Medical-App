import 'package:flutter/material.dart';
import 'package:medicalstoreapp/src/constants/image_strings.dart';
import 'package:medicalstoreapp/src/screens/navigation_bar.dart';
import 'package:provider/provider.dart';

import '../models/notification_model.dart';
import '../provider/cart_provider.dart';
import '../provider/notification_provider.dart';

void checkoutItem(BuildContext context, List<CartItem> cartItems) {
  // After successful checkout, add a notification for each item
  for (var item in cartItems) {
    Provider.of<NotificationService>(context, listen: false).addNotification(
      NotificationItem(
        title: 'Checkout Successful',
        message: 'You have successfully checked out ${item.title}.',
        timestamp: DateTime.now(),
      ),
    );
  }
}

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context, listen: false);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(thankyouImage),
            const SizedBox(height: 20),
            const Text(
              'Thank you for your order',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "Your order will be delivered with invoice \n#9ds69hs. You can track the delivery in the \norder section.",
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
      bottomNavigationBar: SizedBox(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () {
              // Checkout the items and add to notifications
              checkoutItem(context, cart.items.values.toList());

              // Navigate to the next screen
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => const NavigationToggle(),
                ),
                (route) => false, // Removes all previous routes
              );

              // Clear the cart
              cart.clearCart();
            },
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                color: const Color(0xff4157FF),
                borderRadius: BorderRadius.circular(40),
              ),
              child: const Center(
                child: Text(
                  "Continue",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
