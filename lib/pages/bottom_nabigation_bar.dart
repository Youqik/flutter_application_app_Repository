// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:flutter_application_app/pages/potted_state_page_dynamic.dart';
import 'package:flutter_application_app/pages/planting_advice_page.dart';
import 'package:flutter_application_app/pages/plant_log_page.dart';
import 'package:flutter_application_app/pages/settings_page.dart';

class BottomNavigationBarPage extends StatefulWidget {
  BottomNavigationBarPage({super.key});

  @override
  State<BottomNavigationBarPage> createState() =>
      _BottomNavigationBarPageState();
}

class _BottomNavigationBarPageState extends State<BottomNavigationBarPage> {
  //this keeps track of the current page to display
  int _selectedIndex = 0;

  //this method updates the new selected index
  void _navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List _pages = [
    //State
    PottedStatePage(),
    //Log
    PlantLogPage(),
    //Advice
    PlantingAdvicePage(),
    //SettingsPage
    SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("home page"),
      //   backgroundColor: Color.fromRGBO(255, 217, 128, 1),
      // ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        // backgroundColor: Color.fromRGBO(220, 177, 78, 1),
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.black,
        showUnselectedLabels: true,
        currentIndex: _selectedIndex,
        onTap: _navigateBottomBar,

        items: [
          //profile
          BottomNavigationBarItem(
            icon: Icon(Icons.local_florist),
            label: "State",
            backgroundColor: Colors.white,
          ),

          //Log
          BottomNavigationBarItem(
            icon: Icon(Icons.today),
            label: "Log",
            backgroundColor: Colors.white,
          ),

          //Advice
          BottomNavigationBarItem(
            icon: Icon(Icons.lightbulb),
            label: "Advice",
            backgroundColor: Colors.white,
          ),

          //settings
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Settings",
            backgroundColor: Colors.white,
          ),
        ],
      ),
    );
  }
}
