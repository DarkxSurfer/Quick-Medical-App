import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:medicalstoreapp/src/provider/cart_provider.dart';

class CustomCartItemWidget extends StatelessWidget {
  final String id;
  final String productId;
  final String title;
  final int quantity;
  final double price;
  final String imageUrl;

  const CustomCartItemWidget({
    super.key,
    required this.id,
    required this.productId,
    required this.title,
    required this.quantity,
    required this.price,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context, listen: false);

    return Card(
      margin: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 4,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            Image.network(
              imageUrl,
              height: 50,
              width: 50,
              fit: BoxFit.cover,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    'bottle of 500 pellets',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'Rs.$price',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.remove, color: Colors.blue),
                  onPressed: () {
                    if (quantity > 1) {
                      cart.updateItemQuantity(productId, quantity - 1);
                    } else {
                      cart.removeItem(productId);
                    }
                  },
                ),
                Text(
                  '$quantity',
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.add, color: Colors.blue),
                  onPressed: () {
                    cart.updateItemQuantity(productId, quantity + 1);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
