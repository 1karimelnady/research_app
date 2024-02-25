import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:research_app/app_manager/local_data.dart';
import 'package:research_app/app_manager/routes_manager.dart';
import 'package:research_app/common_widget/create_button.dart';
import 'package:research_app/screens/researcher_screen/researcher_form.dart';
import 'package:research_app/screens/researcher_screen/researcher_main_screen.dart';
import 'package:research_app/screens/researcher_screen/researcher_settings_screen.dart';
import 'package:research_app/screens/researcher_screen/researches_screen.dart';
import 'package:research_app/utilities/text_style.dart';

import 'ResarcherNotficationScreen.dart';

class ResearcherHomeScreen extends StatefulWidget {
  ResearcherHomeScreen({super.key});

  @override
  State<ResearcherHomeScreen> createState() => _ResearcherHomeScreenState();
}

class _ResearcherHomeScreenState extends State<ResearcherHomeScreen> {
  int selectedIndex = 0;

  List screens = [
    ResearcherMainScreen(),
    ResearchesScreen(),
    ResearcherSettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        height: 80,
        elevation: 0,
        onDestinationSelected: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        selectedIndex: selectedIndex,
        destinations: [
          NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(
              icon: Icon(Icons.manage_search_rounded), label: 'Researches'),
          NavigationDestination(icon: Icon(Icons.settings), label: 'Settings'),
        ],
      ),
      body: screens[selectedIndex],
    );
  }
}
