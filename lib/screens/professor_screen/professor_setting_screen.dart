import 'package:flutter/material.dart';
import 'package:research_app/app_manager/routes_manager.dart';
import 'package:research_app/screens/AuthScreen/login_screen.dart';
import 'package:research_app/utilities/cache_helper.dart';

class ProfessorSettingsScreen extends StatefulWidget {
  const ProfessorSettingsScreen({Key? key}) : super(key: key);

  @override
  State<ProfessorSettingsScreen> createState() =>
      _ResearcherSettingsScreenState();
}

class _ResearcherSettingsScreenState extends State<ProfessorSettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
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
        ],
      ),
    );
  }
}
