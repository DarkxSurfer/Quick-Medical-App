import 'package:flutter/material.dart';
import 'package:medicalstoreapp/src/common_widgets/category.dart';
import 'package:medicalstoreapp/src/common_widgets/product.dart';
import 'package:medicalstoreapp/src/constants/image_strings.dart';
import 'package:medicalstoreapp/src/screens/cart_screen.dart';
import 'package:medicalstoreapp/src/screens/notifications.dart';
import 'package:medicalstoreapp/src/provider/cart_provider.dart';
import 'package:medicalstoreapp/src/screens/products/active_test_strip.dart';
import 'package:medicalstoreapp/src/screens/products/juices.dart';
import 'package:medicalstoreapp/src/screens/products/sugar.dart';
import 'package:medicalstoreapp/src/screens/products/sugarfree_gold.dart';
import 'package:medicalstoreapp/src/screens/products/vitamins.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List _pages;
  int selectedIndex = 2;

  // ignore: unused_field
  final PageController _pageController = PageController();

  final List<MyProduct> imagePaths = [
    MyProduct(
      imagePath1: productImage1,
      price: "Rs150",
      heading1: 'Accu-check Active \nTest Strip',
      goTo: const ActiveTestStrip(),
    ),
    MyProduct(
        imagePath1: productImage2,
        price: "Rs.56",
        goTo: const SugarfreeGold(),
        heading1: 'Sugar Free Gold Low Calories'),
    MyProduct(
        imagePath1: productImage3,
        price: "Rs.25",
        goTo: const SugarSubstitutes(),
        heading1: 'Sugar Substitute'),
    MyProduct(
      imagePath1: productImage4,
      price: "Rs18",
      heading1: 'Juices & Vinegars',
      goTo: const Juices(),
    ),
    MyProduct(
        imagePath1: productImage5,
        price: "Rs.92",
        goTo: const Vitamins(),
        heading1: 'Vitamins Medicines'),
    MyProduct(
        goTo: const ActiveTestStrip(),
        imagePath1: productImage1,
        price: "Rs150",
        heading1: 'Accu-check Active \nTest Strip'),
  ];

  @override
  void initState() {
    super.initState();
    _pages = List.generate(
      imagePaths.length,
      (index) => imagePaths[index],
    );
  }

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: 213,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    color: Color(0xff4157FF),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(13.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListTile(
                          leading: const CircleAvatar(
                            backgroundImage: AssetImage(profileImage),
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              GestureDetector(
                                  onTap: () {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                      builder: (context) =>
                                          const NotificationScreen(),
                                    ));
                                  },
                                  child: const Icon(
                                    Icons.notifications_none_rounded,
                                    color: Colors.white,
                                  )),
                              const SizedBox(
                                width: 10,
                              ),
                              Stack(
                                clipBehavior: Clip.none,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const CartScreen()));
                                    },
                                    child: const Icon(
                                      Icons.shopping_bag_outlined,
                                      color: Colors.white,
                                    ),
                                  ),
                                  cart.items.isNotEmpty
                                      ? Positioned(
                                          right: -2,
                                          top: -5,
                                          child: Container(
                                            height: 15,
                                            width: 15,
                                            decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Colors.red),
                                            child: Center(
                                              child: Text(
                                                cart.items.length.toString(),
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 10),
                                              ),
                                            ),
                                          ),
                                        )
                                      : const SizedBox(),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const Text(
                          "Hi, Meezaab",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const Text(
                          "Welcome to Quick Medical Store",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: -25,
                  left: 20,
                  right: 20,
                  child: TextFormField(
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      hintText: 'Search Medicine & Healthcare products',
                      hintStyle: const TextStyle(
                        fontSize: 15.0,
                        color: Color(0xffA9A9A9),
                        fontWeight: FontWeight.w500,
                      ),
                      contentPadding: const EdgeInsets.all(15),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      prefixIcon: const Icon(Icons.search),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  const Text(
                    "Top Categories",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomCategory(
                            text: "Dental", color: Color(0xffFF9598)),
                        CustomCategory(
                            text: "Wellness", color: Color(0xff19E5A5)),
                        CustomCategory(text: "Homeo", color: Color(0xffFFC06F)),
                        CustomCategory(
                            text: "Eye Care", color: Color(0xff4DB7FF)),
                      ],
                    ),
                  ),
                  Stack(children: [
                    SizedBox(
                      height: 146,
                      width: MediaQuery.of(context).size.width,
                      child: Image.asset(
                        frameImage1,
                        fit: BoxFit.fill,
                      ),
                    ),
                    const Positioned(
                      top: 20,
                      left: 20,
                      child: Text(
                        "Save Extra on \nEvery Order",
                        style: TextStyle(
                            color: Color(0xff1987FB),
                            fontSize: 20,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                    const Positioned(
                      bottom: 20,
                      left: 20,
                      child: Text(
                        "SEtiam mollis metus \nnon faucibus.",
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                            fontWeight: FontWeight.w300),
                      ),
                    )
                  ]),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Deals of the day"),
                      TextButton(onPressed: () {}, child: const Text("More"))
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.75,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemCount: _pages.length,
                    itemBuilder: (context, index) {
                      return _pages[index];
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
