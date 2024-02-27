import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:research_app/cubit/application_states/main_states.dart';
import 'package:research_app/cubit/main_cubit.dart';
import 'package:research_app/screens/student_screen/student_main_screen.dart';
import 'package:research_app/screens/student_screen/student_researches_screen.dart';
import 'package:research_app/screens/student_screen/student_settings_screen.dart';

import '../../common_widget/create_toast.dart';
import '../notfications/notfications_services.dart';

class StudentHomeScreen extends StatefulWidget {
  @override
  State<StudentHomeScreen> createState() => _StudentHomeScreenState();
}

class _StudentHomeScreenState extends State<StudentHomeScreen> {
  @override
  void initState() {
    MainCubit.get(context).getStudentResearches();
    NotificationsServices().firebaseInit(context);
    NotificationsServices.foregroundMessage();
    super.initState();
  }

  List screens = [
    StudentMainScreen(),
    StudentResearchesScreen(),
    StudentSettingsScreen(),
  ];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainCubit, MainStates>(
      listener: (context, state) {
        if (state is GetResearchesErrorState) {
          CreatToast()
              .showToast(errorMessage: state.errorMessage, context: context);
        }
      },
      builder: (context, state) {
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
              NavigationDestination(
                  icon: Icon(Icons.settings), label: 'Settings'),
            ],
          ),
          body: screens[selectedIndex],
        );
      },
    );
  }
}
