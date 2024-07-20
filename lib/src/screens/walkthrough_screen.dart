import 'package:flutter/material.dart';
import 'package:medicalstoreapp/src/screens/login_screen.dart';

class WalkthroughScreen extends StatelessWidget {
  const WalkthroughScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: 
        SingleChildScrollView(
          child: 
          Padding(
            padding: const EdgeInsets.all(8.0
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Image.asset("assets/images/splash_image_1.png"),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "View and buy \nMedicine online",
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: Color(0xff090F47)),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "     Etiam mollis metus non purus \nfaucibus sollicitudin. Pellentesque \n            sagittis mi. Integer.",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                      color: const Color(0xff090F47).withOpacity(0.5)),
                ),
                SizedBox(
                  height: 180,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                        onPressed: () {},
                        child: Text("Skip",
                            style: TextStyle(color: Colors.grey.withOpacity(0.5)))),
                            TextButton(
                        onPressed: () {Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => LoginScreen()));},
                        child: Text("Next",
                            style: TextStyle(color: Colors.lightBlue))),
                  ],
                )
              ],
            ),
          ),
        )
        ,);
  }
}
