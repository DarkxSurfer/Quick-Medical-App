import 'package:flutter/material.dart';

class CustomPkgSize extends StatelessWidget {
  const CustomPkgSize({super.key, required this.heading,required this.subHeading});

  final String heading;
  final String subHeading;

  @override
  Widget build(BuildContext context) {
    return 
    Padding(
      padding: const EdgeInsets.all(10.0),
      child: InkWell(onTap: () {
        
      },
        child: 
        Container(
          height: 68,
          width: 79,
          decoration: BoxDecoration(
              color: Color(0xffF5F5F5),
              borderRadius: BorderRadius.circular(10)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(heading,
                  style: TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w600)),
              Text(subHeading,
                  style: TextStyle(
                      fontSize: 12, fontWeight: FontWeight.w300)),
            ],
          ),
        ),
      ),
    );
  }
}