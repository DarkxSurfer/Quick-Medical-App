import 'package:flutter/material.dart';
import 'package:medicalstoreapp/src/common_widgets/custom_bottom.dart';
import 'package:medicalstoreapp/src/common_widgets/custom_cart_item.dart';
import 'package:medicalstoreapp/src/common_widgets/product.dart';
import 'package:medicalstoreapp/src/provider/cart_provider.dart';
import 'package:provider/provider.dart';
import 'package:medicalstoreapp/src/screens/home_screen.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text('Your Cart'),
        ),
        body: cart.items.isEmpty
            ? const Center(
                child: Text(
                  'Your Cart is Empty',
                  style: TextStyle(
                    color: Color(0xff0F2F44),
                    fontSize: 18,
                  ),
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
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomeScreen()));
                            },
                            child: const Text(
                              "Add More",
                              style: TextStyle(color: Colors.blue),
                            ))
                      ],
                    ),
                    SizedBox(height: 10),
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
                    )
                  ],
                ),
              ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return CustomBottomSheet();
                });
          },
          child: Icon(Icons.monetization_on_outlined),
        ));
  }
}
