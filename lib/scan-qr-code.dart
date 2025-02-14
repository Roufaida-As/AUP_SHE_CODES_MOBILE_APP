import 'package:flutter/material.dart';
import 'package:shecodes/theme/colors.dart';

class scanQrCode extends StatefulWidget {
  const scanQrCode({super.key});

  @override
  State<scanQrCode> createState() => _scanQrCodeState();
}

class _scanQrCodeState extends State<scanQrCode> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "My Activity",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            const Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(" Scan the QR Code and ",
                        style: TextStyle(
                            fontSize: 22,
                            color: AppColors.text,
                            fontWeight: FontWeight.bold)),
                    SizedBox(width: 5),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Enjoy",
                        style: TextStyle(
                            fontSize: 22,
                            color: AppColors.text,
                            fontWeight: FontWeight.bold)),
                    const SizedBox(
                      width: 3,
                    ),
                    Text("our offers!",
                        style: TextStyle(
                            fontSize: 22,
                            color: AppColors.red,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            Image.asset("assets/images/Group 4.png",
                width: 300, height: 300.78),
            const SizedBox(height: 20),
            Text("Enoy your Gift !",
                style: TextStyle(
                    fontSize: 30,
                    color: AppColors.red,
                    fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
