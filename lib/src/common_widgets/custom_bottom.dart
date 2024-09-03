import 'package:flutter/material.dart';
import 'package:medicalstoreapp/src/provider/cart_provider.dart';
import 'package:medicalstoreapp/src/screens/success_screen.dart';
import 'package:provider/provider.dart';

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<CartProvider>(context);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Container(
      height: height * 0.5,
      padding: EdgeInsets.only(
          top: height * 0.02, left: width * 0.04, right: width * 0.04),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Payment Summary',
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: height * 0.03),
              ),
            ],
          ),
          SizedBox(height: height * 0.03),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Order Total',
                      style: TextStyle(
                          color: Colors.grey, fontSize: height * 0.025),
                    ),
                    Text(
                      'Rs.${provider.totalAmount.toString()}',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: height * 0.02),
                    )
                  ],
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Items Discount',
                      style: TextStyle(
                          color: Colors.grey, fontSize: height * 0.025),
                    ),
                    Text(
                      '- 0.0',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: height * 0.02),
                    )
                  ],
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Coupon Discount',
                      style: TextStyle(
                          color: Colors.grey, fontSize: height * 0.025),
                    ),
                    Text(
                      '- 0.0',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: height * 0.02),
                    )
                  ],
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Shipping',
                      style: TextStyle(
                          color: Colors.grey, fontSize: height * 0.025),
                    ),
                    Text(
                      'Free',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: height * 0.02),
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                const Divider(),
                SizedBox(
                  height: height * 0.01,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total',
                      style: TextStyle(
                          color: Colors.grey, fontSize: height * 0.025),
                    ),
                    Text(
                      'Rs.${provider.totalAmount.toString()}',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: height * 0.02),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: height * 0.02),
          GestureDetector(
            onTap: () {
              provider.items.isNotEmpty
                  ? Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SuccessScreen()))
                  : ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('No Items in the Cart.')));
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
          )
        ],
      ),
    );
  }
}
