import 'package:flutter/material.dart';
import 'package:medicalstoreapp/src/constants/image_strings.dart';
import 'package:medicalstoreapp/src/screens/login_screen.dart';

class WalkthroughScreen extends StatefulWidget {
  const WalkthroughScreen({super.key});

  @override
  State<WalkthroughScreen> createState() => _WalkthroughScreenState();
}

class _WalkthroughScreenState extends State<WalkthroughScreen> {
  final PageController _pageController = PageController();
  // ignore: unused_field
  int _currentPage = 0;

  final List<Map<String, String>> walkthroughData = const [
    {
      'image': onBoardingImage1,
      'title': "View and buy \nMedicine online",
      'description':
          "Etiam mollis metus non purus \nfaucibus sollicitudin. Pellentesque \n            sagittis mi. Integer."
    },
    {
      'image': onBoardingImage2,
      'title': "View and buy \nMedicine online",
      'description':
          "Etiam mollis metus non purus \nfaucibus sollicitudin. Pellentesque \n            sagittis mi. Integer."
    },
    {
      'image': onBoardingImage3,
      'title': "View and buy \nMedicine online",
      'description':
          "Etiam mollis metus non purus \nfaucibus sollicitudin. Pellentesque \n            sagittis mi. Integer."
    },
    // Add more walkthrough data as needed
  ];

  void _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: PageView.builder(
        controller: _pageController,
        onPageChanged: _onPageChanged,
        itemCount: walkthroughData.length,
        itemBuilder: (context, index) {
          final item = walkthroughData[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Image.asset(item['image']!),
                ),
                const SizedBox(height: 20),
                Text(
                  item['title']!,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: Color(0xff090F47),
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                Text(
                  item['description']!,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                    color: const Color(0xff090F47).withOpacity(0.5),
                  ),
                  textAlign: TextAlign.center,
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        if (index != walkthroughData.length - 1)
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      LoginScreen(),
                                ),
                              );
                            },
                            child: Text(
                              "Skip",
                              style: TextStyle(
                                  color: Colors.grey.withOpacity(0.5)),
                            ),
                          ),
                        if (index == walkthroughData.length - 1)
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      LoginScreen(),
                                ),
                              );
                            },
                            child: const Text(
                              "Continue",
                              style: TextStyle(color: Colors.lightBlue),
                            ),
                          ),
                        if (index != walkthroughData.length - 1)
                          TextButton(
                            onPressed: () {
                              _pageController.nextPage(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.ease,
                              );
                            },
                            child: const Text(
                              "Next",
                              style: TextStyle(color: Colors.lightBlue),
                            ),
                          ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
