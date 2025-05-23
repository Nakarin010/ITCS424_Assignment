/* 
Nakarin Phoorahong
6588070
*/

import 'package:flutter/material.dart';
import 'package:itcs424_assignment_6588070/pages/appointment.dart';
import 'package:itcs424_assignment_6588070/pages/home.dart';
import 'package:itcs424_assignment_6588070/pages/patientProfile.dart';
class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() =>  _BottomNavState();
}

class  _BottomNavState extends State<BottomNav> {

  int _selectedIndex = 0;
  final List<Widget> _pages = [
    Home(),
    AppointmentP(), 
    Patientprofile(), 

  ];
  @override
  void _onItemTapped(int index) {
    // Handle item tap
    setState(() {
      _selectedIndex = index;
    });
  }
  Widget build(BuildContext context) {
    return 
    Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(

        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',

          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Appointments',

          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Contact',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}