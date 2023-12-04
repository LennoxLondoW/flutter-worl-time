import 'package:flutter/material.dart';
import 'package:app/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void setUpWorldTime(Map<dynamic, dynamic> data) async {
    WorldTime worldTime =
        WorldTime(data['location'], data['flag'], data['url']);
    await worldTime.getTime();
    // ignore: use_build_context_synchronously
    Navigator.pushReplacementNamed(
      context,
      '/home',
      arguments: {
        "time": worldTime.time,
        "location": worldTime.location,
        "flag": worldTime.flag,
        "isDaytime": worldTime.isDaytime
      },
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Map<dynamic, dynamic>? data =
        ModalRoute.of(context)?.settings.arguments as Map<dynamic, dynamic>?;

    // Default data if arguments are not set
    data ??= {
      "location": "Kenya",
      "url": "Africa/Nairobi",
      "flag": "kenya.png",
    };

    setUpWorldTime(data);
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color.fromARGB(255, 11, 85, 145),
      body: Center(
        child: SpinKitFadingCube(
          color: Colors.white,
          size: 50,
        ),
      ),
    );
  }
}
