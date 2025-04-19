import 'package:flutter/material.dart';
import 'package:flutter_application_3/Profile.dart';
import 'package:flutter_application_3/ProfileListScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Profile Cards',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ProfileListScreen(),
    );
  }
}

