import 'package:flutter/material.dart';
import 'package:medicalstoreapp/src/common_widgets/custom_detail_screen.dart';
import 'package:medicalstoreapp/src/constants/image_strings.dart';

class ActiveTestStrip extends StatelessWidget {
  const ActiveTestStrip({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomDetailScreen(
          productId: "2",
          productName: "Accu-check Active Test Strip",
          productSubtitle: "Etiam mollis metus non purus ",
          productPrice: 150,
          productImage: productImage1),
    );
  }
}

class Juices extends StatelessWidget {
  const Juices({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomDetailScreen(
          productId: "4",
          productName: "Juices & Vinegars",
          productSubtitle: "Etiam mollis metus non purus ",
          productPrice: 18,
          productImage: productImage4),
    );
  }
}

class SugarSubstitutes extends StatelessWidget {
  const SugarSubstitutes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomDetailScreen(
          productId: "3",
          productName: "Sugar Substitues",
          productSubtitle: "Etiam mollis metus non purus ",
          productPrice: 25,
          productImage: productImage3),
    );
  }
}

class SugarfreeGold extends StatelessWidget {
  const SugarfreeGold({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomDetailScreen(
          productId: "1",
          productName: "Sugar Free Gold Low Calories",
          productSubtitle: "Etiam mollis metus non purus ",
          productPrice: 56,
          productImage: productImage2),
    );
  }
}

class Vitamins extends StatelessWidget {
  const Vitamins({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomDetailScreen(
          productId: "5",
          productName: "Vitamins Medicines",
          productSubtitle: "Etiam mollis metus non purus ",
          productPrice: 92,
          productImage: productImage5),
    );
  }
}
