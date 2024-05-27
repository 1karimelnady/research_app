import 'package:flutter/material.dart';
import 'package:research_app/app_manager/local_data.dart';
import 'package:research_app/screens/researcher_screen/researcher_main_screen.dart';
import 'package:research_app/screens/researcher_screen/researcher_notfication_screen.dart';
import 'package:research_app/screens/researcher_screen/researcher_settings_screen.dart';
import 'package:research_app/screens/researcher_screen/researches_screen.dart';

import '../notfications/notfications_services.dart';
import 'active_student_screen.dart';

class ResearcherHomeScreen extends StatefulWidget {
  ResearcherHomeScreen({super.key});

  @override
  State<ResearcherHomeScreen> createState() => _ResearcherHomeScreenState();
}

class _ResearcherHomeScreenState extends State<ResearcherHomeScreen> {
  @override
  void initState() {
    NotificationsServices().firebaseInit(context);
    NotificationsServices.foregroundMessage();
    super.initState();
  }

  int selectedIndex = 0;

  List screens = [
    ResearcherMainScreen(),
    ResearchesScreen(),
    ResearcherNotificationScreen(),
    ActiveStudentScreen(),
    ResearcherSettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: mainColor,
        currentIndex: selectedIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.manage_search_rounded), label: 'Researches'),
          BottomNavigationBarItem(
              icon: Icon(Icons.notification_add), label: 'Notification'),
          BottomNavigationBarItem(
              icon: Icon(Icons.check_circle_outline), label: 'Active '),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: 'Settings'),
        ],
      ),
      body: screens[selectedIndex],
    );
  }
}
