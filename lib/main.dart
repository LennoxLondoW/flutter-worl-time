import 'package:app/pages/choose_location.dart';
import 'package:app/pages/loading.dart';
import 'package:flutter/material.dart';
import 'package:app/pages/home.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const Loading(),
        '/home': (context) => const Home(),
        '/location': (context) => const ChoseLocation()
      },
    ),
  );
}
