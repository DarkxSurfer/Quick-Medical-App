import 'package:flutter/material.dart';
import 'package:medicalstoreapp/src/screens/detail_screen.dart';

class MyProduct extends StatelessWidget {
  const MyProduct({
    super.key,
    required this.imagePath1,
    required this.price,
    required this.heading1,
    
  });

  final String imagePath1;
  final String price;
  final String heading1;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => const DetailScreen()));
        },
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                  color: Color(0xffEEEEF0),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  )),
              height: 239,
              width: 159,
              child: Column(
                children: [
                  Image.asset(imagePath1),
                  Container(
                    decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  )),
                    width: 158,
                    height: 110,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: 
                        MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            heading1,
                            style: const TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w400,
                                color: Colors.black),
                          ),
                          
                          Text(price,style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.black),),
                        ],
                      ),
                    ),
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
