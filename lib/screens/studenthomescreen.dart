import 'package:flutter/material.dart';

class StudentHomeScreen extends StatelessWidget {
  final String name;
  StudentHomeScreen({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text('$name'),
      ),
    );
  }
}
