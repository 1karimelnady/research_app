import 'package:flutter/material.dart';
import 'package:research_app/screens/researcher_screen/researcher_form.dart';

import '../../app_manager/routes_manager.dart';
import '../../common_widget/create_button.dart';

class ResearcherMainScreen extends StatelessWidget {
  const ResearcherMainScreen({Key? key}) : super(key: key);

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
                  RoutesManager.navigatorPush(context, ResearcherFormScreen());
                },
              ),
            ),
            // BottomNavigationBar(),
          ],
        ));
  }
}
