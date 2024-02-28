import 'package:flutter/material.dart';

import '../app_manager/local_data.dart';

class CreatLoading extends StatelessWidget {
  final double? height;

  const CreatLoading({super.key, this.height});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
            height: height ?? 120,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircularProgressIndicator(
                  color: mainColor,
                ),
              ],
            )));
  }
}
