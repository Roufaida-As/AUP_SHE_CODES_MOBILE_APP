
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;
import 'package:shecodes/activity-page-cons.dart';
import 'package:shecodes/settings.dart';
import 'package:shecodes/storeDetailsMerch.dart';

import 'package:shecodes/theme/colors.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: MissionsScreenCons(),
    );
  }
}

class MissionsScreenCons extends StatefulWidget {
  @override
  _MissionsScreenConsState createState() => _MissionsScreenConsState();
}

class _MissionsScreenConsState extends State<MissionsScreenCons> {
  //Future<List<Mission>> fetchMissions() async {
  //   final response = await http.get(Uri.parse("https://your-api.com/missions"));

  //   if (response.statusCode == 200) {
  //     List<dynamic> data = json.decode(response.body);
  //     return data.map((json) => Mission.fromJson(json)).toList();
  //   } else {
  //     throw Exception("Failed to load missions");
  //   }
  //}

  //JUST FOR TESTING BEACAUSE IDON'T HAVE API YET
  Future<List<Mission>> fetchMissions() async {
    await Future.delayed(const Duration(seconds: 2)); // Simulate network delay
    return [
      Mission(
          shopName: "Supermarket A",
          location: "Downtown",
          time: "09:00 - 18:30"),
      Mission(
          shopName: "Grocery B", location: "West Side", time: "09:00 - 18:30"),
      Mission(shopName: "Mall C", location: "Uptown", time: "09:00 - 18:30"),
      Mission(
          shopName: "Grocery B", location: "West Side", time: "09:00 - 18:30"),
      Mission(shopName: "Mall C", location: "Uptown", time: "09:00 - 18:30"),
    ];
  }

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
        actions: [
          IconButton(
            icon: const Icon(Icons.settings, color: Colors.black),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => SettingsPage()));
            },
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [
              const Center(
                child: Text("Visit shops based on your location",
                    style: TextStyle(
                        fontSize: 18,
                        color: AppColors.text,
                        fontWeight: FontWeight.bold)),
              ),
              const SizedBox(height: 20),

              //THE PARAMETERS WILL BE CORRECTED AFTER INTEGRATING WITH THE BACKEND
              buildPointsCard(context, 1, "20"),

              const SizedBox(height: 20),

              Expanded(
                child: FutureBuilder<List<Mission>>(
                  future: fetchMissions(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return const Center(
                          child: Text("Error loading missions"));
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return const Center(child: Text("No missions available"));
                    } else {
                      return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => StoreDetailsPage(
                                      storeName: snapshot.data![index].shopName,
                                      location: snapshot.data![index].location,
                                      phoneNumber:
                                          "N/A", // Assuming phoneNumber is not available in Mission
                                    ),
                                  ),
                                );
                              },
                              child:
                                  MissionCard(mission: snapshot.data![index]));
                        },
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Mission {
  final String shopName;
  final String location;
  final String time;

  Mission({required this.shopName, required this.location, required this.time});

  factory Mission.fromJson(Map<String, dynamic> json) {
    return Mission(
      shopName: json["shop"] ?? "Unknown Shop",
      location: json["location"] ?? "Unknown Location",
      time: json["time"] ?? "00:00 - 00:00",
    );
  }
}

class MissionCard extends StatelessWidget {
  final Mission mission;

  const MissionCard({required this.mission});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 5,
            height: 60,
            decoration: const BoxDecoration(
              color: AppColors.red,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                bottomLeft: Radius.circular(12),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    mission.shopName,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    mission.location,
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Text(
              mission.time,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget buildPointsCard(
    BuildContext context, int todayPoints, String totalPoints) {
  return Container(
    padding: const EdgeInsets.all(12),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.05),
          blurRadius: 5,
          offset: const Offset(0, 2),
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Points",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            InkWell(
              onTap: () {
                // Navigate to the new "My Activity" page and pass total points
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        MyActivityPage(totalPoints: totalPoints),
                  ),
                );
              },
              child: const Padding(
                padding: EdgeInsets.all(8.0), // Add padding for better tap area
                child: Text(
                  " use points",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            pointsColumn("Today's Points", todayPoints.toString()),
            pointsColumn("Total Points", totalPoints.toString()),
          ],
        ),
      ],
    ),
  );
}

Widget pointsColumn(String title, String value) {
  return Column(
    children: [
      Text(
        value,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      Text(
        title,
        style: const TextStyle(fontSize: 14, color: Colors.grey),
      ),
    ],
  );
}
