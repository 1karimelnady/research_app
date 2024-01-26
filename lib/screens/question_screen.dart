import 'package:flutter/material.dart';
import 'package:research_app/common_widget/step_progress.dart';

import '../common_widget/bottom_button.dart';
import '../common_widget/page_screen.dart';
import '../utilities/text_style.dart';

class QuestionScreen extends StatefulWidget {
  QuestionScreen({Key? key}) : super(key: key);
  List<String> questionType = ["yes", "no"];
  String questionAnswer = "yes";

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  // List<Step> stepList() => [
  //       Step(
  //         isActive: currentStep >= 0,
  //         state: currentStep <= 0 ? StepState.editing : StepState.complete,
  //         title: Text("youssef"),
  //         content: Column(
  //           children: [
  //             Text('Are you have two arms'),
  //             RadioListTile(
  //               contentPadding: EdgeInsets.zero,
  //               visualDensity: const VisualDensity(
  //                   vertical: -4,
  //                   horizontal: -3), // Adjust the size of the radio button
  //
  //               title: Text(
  //                 "yes",
  //                 style: BlackTitle.display5(context)
  //                     .copyWith(color: const Color(0xff666666)),
  //               ),
  //               value: widget.questionType[0],
  //               groupValue: widget.questionAnswer,
  //               onChanged: (value) {
  //                 setState(() {
  //                   widget.questionAnswer = value!;
  //                 });
  //                 print("userType : ${widget.questionAnswer}");
  //               },
  //             ),
  //             RadioListTile(
  //               contentPadding: EdgeInsets.zero,
  //               visualDensity: const VisualDensity(
  //                   vertical: -4,
  //                   horizontal: -3), // Adjust the size of the radio button
  //
  //               title: Text(
  //                 "no",
  //                 style: BlackTitle.display5(context)
  //                     .copyWith(color: const Color(0xff666666)),
  //               ),
  //               value: widget.questionType[1],
  //               groupValue: widget.questionAnswer,
  //               onChanged: (value) {
  //                 setState(() {
  //                   widget.questionAnswer = value!;
  //                 });
  //                 print("userType : ${widget.questionAnswer}");
  //               },
  //             ),
  //           ],
  //         ),
  //       ),
  //       Step(
  //         isActive: currentStep >= 1,
  //         state: currentStep <= 1 ? StepState.editing : StepState.complete,
  //         title: Text("mostafa"),
  //         content: Text("Mostafa Elnady"),
  //       ),
  //       Step(
  //           isActive: currentStep >= 2,
  //           state: currentStep <= 2 ? StepState.editing : StepState.complete,
  //           title: Text("karim"),
  //           content: Text("Karim Elnady")),
  //       Step(
  //           isActive: currentStep >= 3,
  //           state: currentStep <= 3 ? StepState.editing : StepState.complete,
  //           title: Text("youssef"),
  //           content: Text("Youssef Elnady")),
  //       Step(
  //           isActive: currentStep >= 4,
  //           state: currentStep <= 4 ? StepState.editing : StepState.complete,
  //           title: Text("mostafa"),
  //           content: Text("Mostafa Elnady")),
  //       Step(
  //           isActive: currentStep >= 5,
  //           state: currentStep <= 5 ? StepState.editing : StepState.complete,
  //           title: Text("karim"),
  //           content: Text("Karim Elnady")),
  //     ];
  PageController pageController = PageController(initialPage: 0);
  double currentPage = 0;
  double currentStep = 0;
  @override
  void initState() {
    pageController.addListener(() {
      setState(() {
        currentPage = pageController.page!;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: StepProgress(currentStep: currentPage, steps: 3),
        ),
        Expanded(
          child: PageView(
            controller: pageController,
            children: [
              PageScreen(
                question: 'Are you have an arms',
              ),
              PageScreen(
                question: 'Are you married',
              ),
              PageScreen(
                question: 'Are you have children',
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: BottomButton(
            pageController: pageController,
          ),
        ),
        Spacer()
      ],
    )

        // Stepper(
        //   steps: stepList(),
        //   currentStep: currentStep,
        //   onStepContinue: () {
        //     if (currentStep < (stepList().length - 1)) {
        //       setState(() {
        //         currentStep += 1;
        //       });
        //     }
        //   },
        //   onStepCancel: () {
        //     if (currentStep > 0) {
        //       setState(() {
        //         currentStep -= 1;
        //       });
        //     }
        //   },
        // ),
        );
  }
}
