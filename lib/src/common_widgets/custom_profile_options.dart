import 'package:flutter/material.dart';

class CustomProfileOptions extends StatelessWidget {
  const CustomProfileOptions(
      {super.key, required this.text1, required this.icon1});

  final String text1;
  final icon1;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: ListTile(
        leading: icon1,
        title: Text(
          text1,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
        ),
        trailing: const Icon(Icons.arrow_forward_ios_rounded),
      ),
    );
  }
}
