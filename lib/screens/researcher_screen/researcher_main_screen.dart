import 'package:flutter/material.dart';
import 'package:research_app/screens/notfications/notfications_services.dart';
import 'package:research_app/screens/researcher_screen/researcher_form.dart';

import '../../app_manager/routes_manager.dart';
import '../../common_widget/create_button.dart';

class ResearcherMainScreen extends StatefulWidget {
  const ResearcherMainScreen({Key? key}) : super(key: key);

  @override
  State<ResearcherMainScreen> createState() => _ResearcherMainScreenState();
}

class _ResearcherMainScreenState extends State<ResearcherMainScreen> {
  @override
  void initState() {
    NotificationsServices().firebaseInit(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
