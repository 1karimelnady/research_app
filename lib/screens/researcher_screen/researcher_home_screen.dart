import 'package:flutter/material.dart';
import 'package:research_app/app_manager/routes_manager.dart';
import 'package:research_app/common_widget/create_button.dart';
import 'package:research_app/screens/researcher_screen/researcher_form.dart';
import 'package:research_app/utilities/text_style.dart';

class ResearcherHomeScreen extends StatelessWidget {
  final String name;
  const ResearcherHomeScreen({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: CreateButton(
              title: 'Create Research',
              onTap: () {
                RoutesManager.navigatorAndRemove(
                    context, ResearcherFormScreen());
              },
            ),
          ),
        ],
      ),
    );
  }
}
