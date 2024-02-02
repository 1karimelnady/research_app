import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:research_app/common_widget/step_progress.dart';
import 'package:research_app/cubit/Auth_cubit/auth_cubit.dart';
import 'package:research_app/cubit/application_states/auth_states.dart';
import 'package:research_app/screens/home_screen.dart';
import 'package:toast/toast.dart';

import '../app_manager/local_data.dart';
import '../app_manager/routes_manager.dart';
import '../common_widget/bottom_button.dart';
import '../common_widget/create_button.dart';
import '../common_widget/create_toast.dart';
import '../common_widget/page_screen.dart';

class QuestionScreen extends StatefulWidget {
  final String userType;
  final String userName;
  final String email;
  final String password;
  final String mobile;
  final String userGender;
  final String date;
  QuestionScreen(
      {Key? key,
      required this.userType,
      required this.userName,
      required this.email,
      required this.password,
      required this.mobile,
      required this.userGender,
      required this.date})
      : super(key: key);

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  PageController pageController = PageController(initialPage: 0);
  double currentPage = 0;
  double currentStep = 0;
  List<String?> selectedAnswers = List.filled(7, null);

  @override
  void initState() {
    pageController.addListener(() {
      setState(() {
        currentPage = pageController.page!;
      });
    });

    super.initState();
  }

  List<String> questions = [
    'dominant hand ?',
    'Native Language ?',
    'Is the vision  normal?',
    'Is your hearing normal ?',
    'What is your origin',
    'Do you suffer from ADHD?',
    'Do you have a musical background?'
  ];
  List<List<String>> answers = [
    ['left', 'right'],
    ['Hebrew', 'English', 'Arabic'],
    ['Yes', 'No'],
    ['Noraml/corrected', 'Not normal'],
    ['Israeld', 'Usa'],
    ['Yes', 'No'],
    ['Yes', 'No']
  ];
  List<bool> isAnswerSelected = List.generate(7, (index) => false);

  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: BlocConsumer<AuthCubit, AuthStates>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          AuthCubit registerCubit = AuthCubit.get(context);
          return Scaffold(
              body: SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 32.0, vertical: 10),
                  child: StepProgress(currentStep: currentPage, steps: 7),
                ),
                Expanded(
                  child: PageView.builder(
                    onPageChanged: (index) {
                      setState(() {
                        currentPage = index.toDouble();
                      });
                    },
                    controller: pageController,
                    itemCount: 7,
                    itemBuilder: (context, index) {
                      return PageScreen(
                        key: PageStorageKey<String>('page_$index'),
                        question: '${questions[index]}',
                        answers: answers[index],
                        selectedAnswer: selectedAnswers[index] ?? '',
                        onAnswerSelected: (answer, answers) {
                          setState(() {
                            selectedAnswers[index] = answer;
                            isAnswerSelected[index] = true;
                          });
                          print("Question $index answer : $answer");
                          print('Selected Answers: $selectedAnswers');
                        },
                      );

                      //   PageScreen(
                      //   key: PageStorageKey<String>('page_$index'),
                      //   question: '${questions[index]}',
                      //   answers: answers[index],
                      //   selectedAnswer: selectedAnswers[index] ?? '',
                      //   onAnswerSelected: (answer, answers) {
                      //     setState(() {
                      //       selectedAnswers[index] = answer;
                      //       isAnswerSelected[index] = true;
                      //     });
                      //     print("Question $index answer : $answer");
                      //     print('Selected Answers: $selectedAnswers');
                      //   },
                      // );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: BottomButton(
                    pageController: pageController,
                  ),
                ),
                CreateButton(
                  onTap: () {
                    if (isAnswerSelected.every((selected) => selected)) {
                      print('llllll');
                      registerCubit
                          .register(
                              name: widget.userName,
                              email: widget.email,
                              mobile: widget.mobile,
                              password: widget.password,
                              userGender: widget.userGender,
                              birthDate: widget.date,
                              userType: widget.userType,
                              answers: selectedAnswers)
                          .then((value) {
                        RoutesManager.navigatorAndRemove(context, HomeScreen());
                      });
                    } else {
                      CreatToast().showToast(
                        errorMessage: "you must  answer all questions",
                        context: context,
                      );
                    }
                  },
                  elevation: 0,
                  radius: 40,
                  bottomMargin: 0,
                  height: getSize(context: context).height * 0.05,
                  width: getSize(context: context).width * 0.9,
                  title: 'Register',
                ),
                Spacer(
                  flex: 1,
                )
              ],
            ),
          ));
        },
      ),
    );
  }
}
