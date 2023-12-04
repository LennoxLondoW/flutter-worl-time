// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';

class ChoseLocation extends StatefulWidget {
  const ChoseLocation({super.key});

  @override
  State<ChoseLocation> createState() => _ChoseLocationState();
}

class _ChoseLocationState extends State<ChoseLocation> {
  List<Map> locations = [
    {
      "location": "Kenya",
      "url": "Africa/Nairobi",
      "flag": "assets/images/flags/kenya.png",
    },
    {
      "location": "United States",
      "url": "America/New_York",
      "flag": "assets/images/flags/usa.png",
    },
    {
      "location": "Japan",
      "url": "Asia/Tokyo",
      "flag": "assets/images/flags/japan.png",
    },
    {
      "location": "Australia",
      "url": "Australia/Sydney",
      "flag": "assets/images/flags/australia.png"
    },
    {
      "location": "Brazil",
      "url": "America/Sao_Paulo",
      "flag": "assets/images/flags/brazil.png",
    },
    {
      "location": "Germany",
      "url": "Europe/Berlin",
      "flag": "assets/images/flags/germany.png",
    },
    {
      "location": "India",
      "url": "Asia/Kolkata",
      "flag": "assets/images/flags/india.png",
    },
    {
      "location": "South Africa",
      "url": "Africa/Johannesburg",
      "flag": "assets/images/flags/south_africa.png"
    },
    {
      "location": "Canada",
      "url": "America/Toronto",
      "flag": "assets/images/flags/canada.png",
    },
    {
      "location": "China",
      "url": "Asia/Shanghai",
      "flag": "assets/images/flags/china.png"
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          'Choose a location',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              onTap: () {
                Navigator.pop(context);
                Navigator.pushReplacementNamed(
                  context,
                  '/',
                  arguments: {
                    "url": locations[index]["url"],
                    "location": locations[index]["location"],
                    "flag": locations[index]["flag"],
                  },
                );
              },
              leading: CircleAvatar(
                backgroundImage: AssetImage(locations[index]["flag"]),
              ),
              title: Text(locations[index]['location']),
            ),
          );
        },
      ),
    );
  }
}
