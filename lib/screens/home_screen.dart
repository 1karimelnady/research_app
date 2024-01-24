import 'package:flutter/material.dart';
import 'package:research_app/utilities/text_style.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: Text(
            "welcome user",
            style: BlackTitle.display5(context),
          )),
        ],
      ),
    );
  }
}
