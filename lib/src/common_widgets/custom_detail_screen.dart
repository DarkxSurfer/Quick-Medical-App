import 'package:flutter/material.dart';
import 'package:medicalstoreapp/src/common_widgets/pakage_size.dart';
import 'package:medicalstoreapp/src/constants/image_strings.dart';
import 'package:medicalstoreapp/src/provider/cart_provider.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class CustomDetailScreen extends StatelessWidget {
  CustomDetailScreen({
    super.key,
    required this.productName,
    required this.productSubtitle,
    required this.productPrice,
    required this.productImage,
    required this.productId,
  });

  String productName;
  String productSubtitle;
  double productPrice;
  String productImage;
  String productId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                productName,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                ),
              ),
              // SizedBox(height: 10,),
              Text(
                productSubtitle,
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey.withOpacity(0.6)),
              ),
              Container(
                  color: const Color(0xffF8F8F8),
                  height: 178,
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset(productImage)),
              const SizedBox(
                height: 10,
              ),
              ListTile(
                title: Row(
                  children: [
                    Text(
                      "Rs.$productPrice",
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
                subtitle: const Text("Etiam mollis "),
                trailing: TextButton(
                  onPressed: () {
                    Provider.of<CartProvider>(context, listen: false).addItem(
                        productId, productPrice, productName, productImage);
                  },
                  child: const Text(
                    "Add to cart",
                    style: TextStyle(
                        color: Color(
                      0xff006AFF,
                    )),
                  ),
                ),
              ),
              const Divider(),

              const SizedBox(
                height: 10,
              ),
              const Text(
                "Package Size",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),

              const SizedBox(
                height: 20,
              ),
              const Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomPkgSize(heading: "Rs.106", subHeading: "110 pellets"),
                  CustomPkgSize(heading: "Rs.166", subHeading: "300 pellets"),
                  CustomPkgSize(heading: "Rs.252", subHeading: "500 pellets"),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Product Details",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Interdum et malesuada fames ac ante ipsum primis in faucibus. Morbi ut nisi odio. Nulla facilisi. \nNunc risus massa, gravida id egestas a, pretium vel tellus. Praesent feugiat diam sit amet pulvinar finibus. Etiam et nisi aliquet, accumsan nisi sit.",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w200,
                    color: Colors.grey.withOpacity(0.5)),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Ingredients",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Interdum et malesuada fames ac ante ipsum primis in faucibus. Morbi ut nisi odio. Nulla facilisi. \nNunc risus massa, gravida id egestas a, pretium vel tellus. Praesent feugiat diam sit amet pulvinar finibus. Etiam et nisi aliquet, accumsan nisi sit.",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w200,
                    color: Colors.grey.withOpacity(0.5)),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Expiry Date",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Text(
                      "10/10/2025",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w200,
                          color: Colors.grey.withOpacity(0.5)),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  const Text("Brand Name",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Text(
                      "Something",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w200,
                          color: Colors.grey.withOpacity(0.5)),
                    ),
                  ),
                ],
              ),

              SizedBox(
                  width: 332,
                  child: Image.asset(
                    ratingImage,
                    fit: BoxFit.fitWidth,
                  )),
              const SizedBox(
                height: 20,
              ),
              Column(
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Erric Hoffman",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w600)),
                        Text("05- oct 2020",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w200,
                                color: Colors.grey.withOpacity(0.5))),
                      ]),
                  Text(
                      "Interdum et malesuada fames ac ante ipsum primis in faucibus. Morbi ut nisi odio. Nulla facilisi.\nNunc risus massa, gravida id egestas ",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w200,
                          color: Colors.grey.withOpacity(0.5))),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
