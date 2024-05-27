import 'package:flutter/material.dart';
import 'package:research_app/app_manager/routes_manager.dart';
import 'package:research_app/screens/AuthScreen/login_screen.dart';
import 'package:research_app/utilities/cache_helper.dart';

import 'edit_student_profile.dart';

class StudentSettingsScreen extends StatefulWidget {
  const StudentSettingsScreen({Key? key}) : super(key: key);

  @override
  State<StudentSettingsScreen> createState() => _StudentSettingsScreenState();
}

class _StudentSettingsScreenState extends State<StudentSettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: TextButton(
              onPressed: () {
                CacheHelper.clear();
                RoutesManager.navigatorAndRemove(context, LoginScreen());
              },
              child: Text('Log out'),
            ),
          ),
          Center(
            child: TextButton(
              onPressed: () {
                RoutesManager.navigatorPush(context, EditProfile());
              },
              child: Text('Edit profile'),
            ),
          ),
        ],
      ),
    );
  }
}
