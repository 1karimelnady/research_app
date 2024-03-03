import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:research_app/screens/AuthScreen/login_screen.dart';
import 'package:research_app/screens/professor_screen/professor_home_screen.dart';
import 'package:research_app/screens/researcher_screen/researcher_home_screen.dart';
import 'package:research_app/screens/student_screen/studenthomescreen.dart';
import 'package:research_app/utilities/cache_helper.dart';

import '../app_manager/routes_manager.dart';

class SplashScreen extends StatefulWidget {
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String? token;
  String? type;
  String? name;
  void initState() {
    token = CacheHelper.getData(key: "token");
    type = CacheHelper.getData(key: "type");
    name = CacheHelper.getData(key: "name");

    print("token : ${token}  type : ${type} ");
    Future.delayed(Duration(seconds: 2), () {
      if (token != null && type == "researcher") {
        RoutesManager.navigatorAndRemove(context, ResearcherHomeScreen());
      } else if (token != null && type == "student") {
        RoutesManager.navigatorAndRemove(context, StudentHomeScreen());
      } else if (token != null && type == "professor") {
        RoutesManager.navigatorAndRemove(context, ProfessorHomeSCreen());
      } else {
        RoutesManager.navigatorAndRemove(context, LoginScreen());
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FadeInDown(
        duration: Duration(seconds: 1),
        animate: true,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 50),
          height: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/logo.jpeg"),
                  fit: BoxFit.contain)),
        ),
      ),
    );
  }
}
