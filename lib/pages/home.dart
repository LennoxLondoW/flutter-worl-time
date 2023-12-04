import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};
  @override
  Widget build(BuildContext context) {
    Map<dynamic, dynamic>? data =
        ModalRoute.of(context)?.settings.arguments as Map<dynamic, dynamic>?;
    data ??= {
      "time": "00 : 00",
      "location": "---",
      "flag": "images/flags/globe.png",
      "isDaytime": true
    };

    String bgImage = data["isDaytime"]
        ? "assets/images/background/day.jpg"
        : "assets/images/background/night.jpg";
    Color bgColor =
        data["isDaytime"] ? Colors.blue : const Color.fromARGB(255, 4, 34, 58);

    Color textColor = data["isDaytime"]
        ? const Color.fromARGB(255, 243, 145, 33)
        : Colors.white;

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image:
                DecorationImage(image: AssetImage(bgImage), fit: BoxFit.cover),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pushNamed(context, '/location');
                  },
                  icon: const Icon(Icons.add_location),
                  label: const Text('Edit location'),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      data['location'],
                      style: TextStyle(
                          fontSize: 28, letterSpacing: 2, color: textColor),
                    ),
                  ],
                ),
                const SizedBox(width: 20),
                Text(
                  data['time'],
                  style: TextStyle(
                    fontSize: 66,
                    color: textColor,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
