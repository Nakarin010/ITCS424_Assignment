/* 
Nakarin Phoorahong
6588070
*/
import 'package:flutter/material.dart';
import 'package:itcs424_assignment_6588070/pages/BottomNAV.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const BottomNav(),
      debugShowCheckedModeBanner: false,

    );
  }
}

