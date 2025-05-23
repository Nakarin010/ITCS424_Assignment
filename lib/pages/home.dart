/* 
Nakarin Phoorahong
6588070
*/

import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Center
    (
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [        
        Image.asset("assets/pics/logo.png"),
        Text("Welcome", style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold, fontFamily: "Playfair"))
        ],
      ),
    );
  }
}