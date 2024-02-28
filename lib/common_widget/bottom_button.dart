import 'package:flutter/material.dart';
import 'package:research_app/app_manager/local_data.dart';

class BottomButton extends StatelessWidget {
  final PageController pageController;

  BottomButton({Key? key, required this.pageController}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ElevatedButton(
            onPressed: () {
              pageController.previousPage(
                  duration: Duration(microseconds: 300), curve: Curves.ease);
            },
            child: Container(
              width: 50,
              height: 50,
              color: Colors.white,
              child: Icon(
                Icons.arrow_back,
                color: mainColor,
              ),
            ),
            style: ElevatedButton.styleFrom(
              elevation: 0,
              shadowColor: Colors.transparent,
              shape: CircleBorder(side: BorderSide(color: mainColor)),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              pageController.nextPage(
                  duration: Duration(microseconds: 300), curve: Curves.ease);
            },
            child: Container(
              height: 50,
              width: 50,
              color: Colors.white,
              child: Icon(
                Icons.arrow_forward,
                color: mainColor,
              ),
            ),
            style: ElevatedButton.styleFrom(
              elevation: 0,
              shadowColor: Colors.transparent,
              shape: CircleBorder(side: BorderSide(color: mainColor)),
            ),
          ),
        ],
      ),
    );
  }
}
