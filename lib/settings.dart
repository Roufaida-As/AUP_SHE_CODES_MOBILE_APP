import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shecodes/changePassword.dart';
import 'package:shecodes/changePhoneNumber.dart';
import 'dart:convert';

import 'package:shecodes/theme/colors.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  Map<String, dynamic>? userData;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchUserData();
  }

//I WILL USE THIS WHEN THE API IS READY

  // Future<void> fetchUserData() async {
  //   final response = await http.get(Uri.parse("https://your-backend.com/api/user"));

  //   if (response.statusCode == 200) {
  //     setState(() {
  //       userData = json.decode(response.body);
  //       isLoading = false;
  //     });
  //   } else {
  //     print("Error fetching data");
  //   }
  // }

//JUST FOR TESTING BEACAUSE IDON'T HAVE API YET

  Future<void> fetchUserData() async {
    // Simulating a backend response delay (2 seconds)
    await Future.delayed(const Duration(seconds: 2));

    // Fake user data
    setState(() {
      userData = {
        "name": "John Doe",
        "email": "john.doe@example.com",
        "phone": "+123456789"
      };
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text("Settings",
            style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    userData!["name"],
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(userData!["email"],
                      style: const TextStyle(color: AppColors.placeholder)),
                  Text(userData!["phone"],
                      style: const TextStyle(color: AppColors.placeholder)),
                  const SizedBox(height: 20),

                  // Settings Options
                  buildSettingsOption("Change Password", Icons.lock, () {
                    // Navigate to change password screen
                    showChangePasswordDialog(context);
                  }),
                  buildSettingsOption("Change Phone Number", Icons.phone, () {
                    showChangePhoneNumberDialog(context);
                  }),

                  const SizedBox(height: 10),
                  GestureDetector(
                    onTap: () {
                      print("User logged out");
                    },
                    child: Container(
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.red),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.logout, color: Colors.red),
                          SizedBox(width: 10),
                          Text("Log Out",
                              style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  Widget buildSettingsOption(String title, IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                blurRadius: 5,
                spreadRadius: 2)
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: const TextStyle(fontSize: 16)),
            const Icon(Icons.arrow_forward_ios, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}
