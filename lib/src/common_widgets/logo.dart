import 'package:flutter/material.dart';

class CustomLogo extends StatelessWidget {
  const CustomLogo({super.key, required this.color});
  final color;
 
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundColor: Colors.white,
          child: Image.asset("assets/images/Vector.png"),
        ),
    const SizedBox(height: 20,),
    Text("Quick Medical", style: TextStyle(fontSize: 28, fontWeight: FontWeight.w100, color: color),),
      ],
    );
  }
}