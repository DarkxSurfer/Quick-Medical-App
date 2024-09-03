import 'package:flutter/material.dart';
import 'package:medicalstoreapp/src/common_widgets/custom_bottom.dart';
import 'package:medicalstoreapp/src/common_widgets/custom_cart_item.dart';
import 'package:medicalstoreapp/src/constants/image_strings.dart';
import 'package:medicalstoreapp/src/provider/cart_provider.dart';
import 'package:medicalstoreapp/src/screens/navigation_bar.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Your Cart'),
        ),
        body: cart.items.isEmpty
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(cartImage),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Your Cart is Empty',
                      style: TextStyle(
                        color: Color(0xff0F2F44),
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              )
            : Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('${cart.items.length} Items in your cart'),
                        Row(
                          children: [
                            TextButton.icon(
                                icon: const Icon(
                                  Icons.add_box_outlined,
                                  color: Colors.blue,
                                ),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const NavigationToggle()));
                                },
                                label: const Text(
                                  "Add More",
                                  style: TextStyle(color: Colors.blue),
                                )),
                            TextButton.icon(
                                icon: const Icon(
                                  Icons.cancel_outlined,
                                  color: Colors.red,
                                ),
                                onPressed: () {
                                  cart.clearCart();
                                },
                                label: const Text(
                                  "Clear All",
                                  style: TextStyle(color: Colors.red),
                                ))
                          ],
                        )
                      ],
                    ),
                    const SizedBox(height: 10),
                    Expanded(
                      child: ListView.builder(
                        itemCount: cart.itemCount,
                        itemBuilder: (ctx, i) => CustomCartItemWidget(
                          id: cart.items.values.toList()[i].id,
                          productId: cart.items.keys.toList()[i],
                          title: cart.items.values.toList()[i].title,
                          quantity: cart.items.values.toList()[i].quantity,
                          price: cart.items.values.toList()[i].price,
                          imageUrl: cart.items.values.toList()[i].imageUrl,
                        ),
                      ),
                    ),
                    const CustomBottomSheet()
                  ],
                ),
              ));
  }
}
