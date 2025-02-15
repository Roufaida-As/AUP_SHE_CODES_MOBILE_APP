import 'package:flutter/material.dart';
import 'package:shecodes/signup.dart';
import 'package:shecodes/theme/colors.dart';
import "package:get/get.dart";

// ignore: camel_case_types
class splashScreen extends StatefulWidget {
  const splashScreen({super.key});

  @override
  State<splashScreen> createState() => _splashScreenState();
}

// ignore: camel_case_types
class _splashScreenState extends State<splashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      initialScreen();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/Ramy-Logo.png",
                width: 130, height: 102.78),
            const SizedBox(height: 20),
            const Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Row(
                        children: [
                          Text("AI-Powered",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: AppColors.text,
                                  fontWeight: FontWeight.bold)),
                          SizedBox(width: 5),
                          Text("Merchandising,",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: AppColors.red,
                                  fontWeight: FontWeight.bold)),
                          SizedBox(width: 5),
                        ],
                      ),
                      Row(
                        children: [
                          Text("Driven by",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: AppColors.text,
                                  fontWeight: FontWeight.bold)),
                          SizedBox(width: 5),
                          Text("you.",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: AppColors.red,
                                  fontWeight: FontWeight.bold)),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

//A CORRIGER !!
void initialScreen() {
  Get.to(() => signUp(),
      transition: Transition.fadeIn,
      duration: const Duration(milliseconds: 500));
}
