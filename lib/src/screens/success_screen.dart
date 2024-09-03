import 'package:flutter/material.dart';
import 'package:medicalstoreapp/src/constants/image_strings.dart';
import 'package:medicalstoreapp/src/screens/navigation_bar.dart';
import 'package:provider/provider.dart';

import '../provider/cart_provider.dart';

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
            const Text(
              'Thank you for your order',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            const Text(
                "Your Order will be delivered with invoice \n#9ds69hs. You can track the delivery in the \norder section.")
          ],
        ),
      ),
      bottomNavigationBar: SizedBox(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const NavigationToggle()));
              cart.clearCart();
            },
            child: Container(
                height: 50,
                decoration: BoxDecoration(
                    color: const Color(0xff4157FF),
                    borderRadius: BorderRadius.circular(40)),
                child: const Center(
                  child: Text("Check Out",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                )),
          ),
        ),
      ),
    );
  }
}
