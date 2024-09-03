import 'package:flutter/material.dart';
import 'package:medicalstoreapp/src/common_widgets/custom_detail_screen.dart';
import 'package:medicalstoreapp/src/constants/image_strings.dart';
import 'package:medicalstoreapp/src/screens/cart_screen.dart';
import 'package:provider/provider.dart';
import '../../provider/cart_provider.dart';

class SugarfreeGold extends StatelessWidget {
  const SugarfreeGold({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
        centerTitle: true,
        actions: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CartScreen()));
                },
                icon: const Icon(
                  Icons.shopping_bag_outlined,
                  color: Colors.black,
                ),
              ),
              cart.items.isNotEmpty
                  ? Positioned(
                      right: 0,
                      top: 0,
                      child: Container(
                        height: 15,
                        width: 15,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: Colors.red),
                        child: Center(
                          child: Text(
                            cart.items.length.toString(),
                            style: const TextStyle(
                                color: Colors.white, fontSize: 10),
                          ),
                        ),
                      ),
                    )
                  : const SizedBox(),
            ],
          ),
        ],
      ),
      body: CustomDetailScreen(
          productId: "1",
          productName: "Sugar Free Gold Low Calories",
          productSubtitle: "Etiam mollis metus non purus ",
          productPrice: 56,
          productImage: productImage2),
    );
  }
}
