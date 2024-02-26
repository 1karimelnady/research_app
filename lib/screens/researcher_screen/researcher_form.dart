// import 'dart:typed_data';
//
// import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:research_app/app_manager/routes_manager.dart';
// import 'package:research_app/common_widget/create_button.dart';
// import 'package:research_app/common_widget/create_toast.dart';
// import 'package:research_app/cubit/application_states/main_states.dart';
// import 'package:research_app/cubit/main_cubit.dart';
// import 'package:research_app/screens/researcher_screen/researcher_home_screen.dart';
// import 'package:research_app/utilities/text_style.dart';
// import 'package:signature/signature.dart';
//
// import '../../app_manager/local_data.dart';
// import '../../common_widget/create_check_box.dart';
// import '../../common_widget/create_loading.dart';
//
// class ResearcherFormScreen extends StatefulWidget {
//   ResearcherFormScreen({Key? key}) : super(key: key);
//
//   @override
//   State<ResearcherFormScreen> createState() => _ResearcherFormScreenState();
// }
//
// class _ResearcherFormScreenState extends State<ResearcherFormScreen> {
//   TextEditingController researchController = TextEditingController();
//   TextEditingController descriptionController = TextEditingController();
//   TextEditingController creditController = TextEditingController();
//   SignatureController signatureController = SignatureController(
//       penStrokeWidth: 3, penColor: mainColor, exportBackgroundColor: greyColor);
//   Uint8List? exportedImage;
//   var formKey = GlobalKey<FormState>();
//   List<Map<String, String?>> selectedAnswers = [];
//   List<bool> isAnswerSelected = List.generate(7, (index) => false);
//   List<Question> questions = [
//     Question('Students dominant hand?', ['Left', 'Right']),
//     Question('Students native languages?', ['hebrew', 'english', 'arabic']),
//     Question('Students visions', ['normal', 'not normal']),
//     Question('Students hearing normal?', ['yes', 'no']),
//     Question('Origins', ['israel', 'usa']),
//     Question('Students ADHD', ['yes', 'no']),
//     Question('Students musical background', ['yes', 'no']),
//   ];
//   late List<List<bool?>> checkboxValues;
//
//   @override
//   void initState() {
//     super.initState();
//     selectedAnswers = List.generate(
//       questions.length,
//       (index) => List.filled(questions[index].options.length, null),
//     );
//
//     checkboxValues = List.generate(
//       questions.length,
//       (index) => List.filled(questions[index].options.length, false),
//     );
//   }
//
//   bool isSigning = false;
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => MainCubit(),
//       child: BlocConsumer<MainCubit, MainStates>(
//         listener: (context, state) {
//           if (state is CreateResearchSuccessState) {
//             CreatToast().showToast(
//               errorMessage: "Created research Successfully",
//               context: context,
//             );
//             RoutesManager.navigatorAndRemove(context, ResearcherHomeScreen());
//           } else if (state is CreateResearchErrorState) {
//             CreatToast().showToast(
//               errorMessage: state.errormessage,
//               context: context,
//             );
//           }
//         },
//         builder: (context, state) {
//           MainCubit cubit = MainCubit.get(context);
//
//           return Scaffold(
//             body: SafeArea(
//               child: SingleChildScrollView(
//                 child: Form(
//                   key: formKey,
//                   autovalidateMode: AutovalidateMode.disabled,
//                   child: Padding(
//                     padding: const EdgeInsets.all(16.0),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.only(bottom: 8.0),
//                           child: Text('1. Enter the the research question',
//                               style: BlackTitle.display5(context)),
//                         ),
//                         SingleChildScrollView(
//                           child: ListView.builder(
//                             itemCount: 1,
//                             shrinkWrap: true,
//                             itemBuilder: (context, index) => TextFormField(
//                               controller: researchController,
//                               maxLines: null,
//                               validator: (value) {
//                                 if (value!.isEmpty) {
//                                   return "Question research is required";
//                                 }
//                                 return null;
//                               },
//                               decoration: InputDecoration(
//                                 enabledBorder: OutlineInputBorder(
//                                     borderSide: BorderSide(
//                                         color: greyColor, width: 0.6),
//                                     borderRadius:
//                                         BorderRadius.all(Radius.circular(8))),
//                                 focusedBorder: OutlineInputBorder(
//                                     borderSide: BorderSide(
//                                         color: greyColor, width: 1.0),
//                                     borderRadius:
//                                         BorderRadius.all(Radius.circular(8.0))),
//                                 errorBorder: OutlineInputBorder(
//                                   borderSide: BorderSide(color: Colors.red),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                         ListView.builder(
//                           // padding: EdgeInsets.symmetric(horizontal: 10),
//                           itemCount: questions.length,
//                           shrinkWrap: true,
//                           physics: NeverScrollableScrollPhysics(),
//                           itemBuilder: (context, index) {
//                             return buildQuestionCard(questions[index], index);
//                           },
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.only(bottom: 8.0),
//                           child: Text('9.Credits',
//                               style: BlackTitle.display5(context)),
//                         ),
//                         Container(
//                           margin: EdgeInsets.only(top: 0.0),
//                           height: getSize(context: context).height * 0.06,
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(8),
//                           ),
//                           child: TextFormField(
//                             controller: creditController,
//                             maxLines: 1,
//                             inputFormatters: <TextInputFormatter>[
//                               FilteringTextInputFormatter.digitsOnly,
//                             ],
//                             keyboardType: TextInputType.number,
//                             validator: (value) {
//                               if (value!.isEmpty) {
//                                 return "credit  is required";
//                               }
//                               return null;
//                             },
//                             decoration: InputDecoration(
//                               enabledBorder: OutlineInputBorder(
//                                   borderSide:
//                                       BorderSide(color: greyColor, width: 0.6),
//                                   borderRadius:
//                                       BorderRadius.all(Radius.circular(8))),
//                               focusedBorder: OutlineInputBorder(
//                                   borderSide:
//                                       BorderSide(color: greyColor, width: 1.0),
//                                   borderRadius:
//                                       BorderRadius.all(Radius.circular(8.0))),
//                               errorBorder: OutlineInputBorder(
//                                 borderSide: BorderSide(color: Colors.red),
//                               ),
//                             ),
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.symmetric(vertical: 5.0),
//                           child: Text('10.Etics approvment',
//                               style: BlackTitle.display5(context)),
//                         ),
//                         Stack(
//                           alignment: Alignment.center,
//                           children: [
//                             Padding(
//                               padding:
//                                   const EdgeInsets.symmetric(vertical: 5.0),
//                               child: GestureDetector(
//                                 onTap: () {
//                                   setState(() {
//                                     isSigning =
//                                         true; // Set the signing state to true when signing starts
//                                   });
//                                 },
//                                 child: Signature(
//                                   controller: signatureController,
//                                   width: getSize(context: context).width * 0.9,
//                                   height:
//                                       getSize(context: context).height * 0.18,
//                                   backgroundColor: greyColor.withOpacity(0.5),
//                                 ),
//                               ),
//                             ),
//                             if (!signatureController.isNotEmpty)
//                               Image(
//                                 width: 50,
//                                 height: 50,
//                                 image: AssetImage(
//                                   "images/signature.png",
//                                 ),
//                               ),
//                           ],
//                         ),
//                         Row(
//                           children: [
//                             CreateButton(
//                               title: 'save',
//                               width: 50,
//                               topMargin: 5,
//                               bottomMargin: 0,
//                               onTap: () async {
//                                 exportedImage =
//                                     await signatureController.toPngBytes();
//                                 setState(() {});
//                               },
//                             ),
//                             SizedBox(
//                               width: 10,
//                             ),
//                             CreateButton(
//                               width: 50,
//                               title: 'clear',
//                               topMargin: 5,
//                               bottomMargin: 0,
//                               onTap: () async {
//                                 signatureController.clear();
//                                 setState(() {});
//                               },
//                             ),
//                           ],
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.only(bottom: 5.0, top: 5.0),
//                           child: Text('11.Research description',
//                               style: BlackTitle.display5(context)),
//                         ),
//                         SingleChildScrollView(
//                           child: ListView.builder(
//                             itemCount: 1,
//                             shrinkWrap: true,
//                             itemBuilder: (context, index) => TextFormField(
//                               controller: descriptionController,
//                               maxLines: null,
//                               validator: (value) {
//                                 if (value!.isEmpty) {
//                                   return "Research discription is required";
//                                 }
//                                 return null;
//                               },
//                               decoration: InputDecoration(
//                                 enabledBorder: OutlineInputBorder(
//                                     borderSide: BorderSide(
//                                         color: greyColor, width: 0.6),
//                                     borderRadius:
//                                         BorderRadius.all(Radius.circular(8))),
//                                 focusedBorder: OutlineInputBorder(
//                                     borderSide: BorderSide(
//                                         color: greyColor, width: 1.0),
//                                     borderRadius:
//                                         BorderRadius.all(Radius.circular(8.0))),
//                                 errorBorder: OutlineInputBorder(
//                                   borderSide: BorderSide(color: Colors.red),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                         ConditionalBuilder(
//                           condition: state
//                               is! CreateResearchLoadingState, //state is! RegisterLoading,
//                           builder: (context) => Center(
//                             child: CreateButton(
//                                 onTap: () {
//                                   if (formKey.currentState!.validate()) {
//                                     if (!isAnsweredAllQuestions()) {
//                                       CreatToast().showToast(
//                                         errorMessage:
//                                             "You must answer all questions",
//                                         context: context,
//                                         backgroundColor: Colors.red,
//                                       );
//                                     } else if (exportedImage == null) {
//                                       CreatToast().showToast(
//                                         errorMessage:
//                                             "You must signature the research",
//                                         context: context,
//                                         backgroundColor: Colors.red,
//                                       );
//                                     } else {
//                                       cubit.createResearch(
//                                         answers: selectedAnswers,
//                                         credits: creditController.text,
//                                         approvment: exportedImage,
//                                         researchQuestion:
//                                             researchController.text,
//                                       );
//                                       print('kkkk');
//                                     }
//                                   }
//                                 },
//                                 title: "Submit"),
//                           ),
//                           fallback: (BuildContext context) =>
//                               const CreatLoading(),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
//
//   bool isAnsweredAllQuestions() {
//     for (var answerMap in selectedAnswers) {
//       if (answerMap.isEmpty) {
//         return false;
//       }
//     }
//     return true;
//   }
//
//   Widget buildQuestionCard(Question question, int index) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Padding(
//           padding: const EdgeInsets.symmetric(vertical: 5.0),
//           child: Text(
//             '${index + 2}. ${question.text}',
//             style: TextStyle(
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ),
//         Card(
//           margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
//           elevation: 1,
//           child: CreateCheckBox(
//             options: question.getOptions(), // Use getOptions method here
//             onChanged: (selectedOptions) {
//               setState(() {
//                 Map<String, String?> answersMap = {};
//                 for (int i = 0; i < selectedOptions.length; i++) {
//                   answersMap['${question.key}[$i]'] =
//                       selectedOptions[i].toString();
//                 }
//                 selectedAnswers[index] = answersMap;
//                 isAnswerSelected[index] = selectedOptions.isNotEmpty;
//               });
//               print(selectedAnswers[index]);
//             },
//           ),
//         ),
//       ],
//     );
//   }
// }
//
// class Question {
//   final String text;
//   final List<String> options;
//
//   Question(this.text, this.options);
//
//   List<String> getOptions() {
//     return options;
//   }
// }

import 'dart:io';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:research_app/app_manager/routes_manager.dart';
import 'package:research_app/common_widget/create_button.dart';
import 'package:research_app/common_widget/create_toast.dart';
import 'package:research_app/cubit/application_states/main_states.dart';
import 'package:research_app/cubit/main_cubit.dart';
import 'package:research_app/screens/researcher_screen/researcher_home_screen.dart';
import 'package:research_app/utilities/text_style.dart';
import 'package:signature/signature.dart';

import '../../app_manager/local_data.dart';
import '../../common_widget/create_loading.dart';

class ResearcherFormScreen extends StatefulWidget {
  ResearcherFormScreen({Key? key}) : super(key: key);

  @override
  State<ResearcherFormScreen> createState() => _ResearcherFormScreenState();
}

class _ResearcherFormScreenState extends State<ResearcherFormScreen> {
  TextEditingController researchController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController creditController = TextEditingController();
  SignatureController signatureController = SignatureController(
      penStrokeWidth: 3, penColor: mainColor, exportBackgroundColor: greyColor);
  Uint8List? exportedImage;
  var formKey = GlobalKey<FormState>();

  bool isSigning = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MainCubit(),
      child: BlocConsumer<MainCubit, MainStates>(
        listener: (context, state) {
          if (state is CreateResearchSuccessState) {
            CreatToast().showToast(
                errorMessage: "Research Created Successfully",
                context: context,
                backgroundColor: mainColor);
            RoutesManager.navigatorAndRemove(context, ResearcherHomeScreen());
          } else if (state is CreateResearchErrorState) {
            CreatToast().showToast(
              errorMessage: state.errormessage,
              context: context,
            );
          }
        },
        builder: (context, state) {
          MainCubit cubit = MainCubit.get(context);

          return Scaffold(
            body: SafeArea(
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  autovalidateMode: AutovalidateMode.disabled,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Text('1. Enter the the research question',
                              style: BlackTitle.display5(context)),
                        ),
                        SingleChildScrollView(
                          child: ListView.builder(
                            itemCount: 1,
                            shrinkWrap: true,
                            itemBuilder: (context, index) => TextFormField(
                              controller: researchController,
                              maxLines: null,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Question research is required";
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: greyColor, width: 0.6),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8))),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: greyColor, width: 1.0),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8.0))),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.red),
                                ),
                              ),
                            ),
                          ),
                        ),

/////////////////////////////////////////////////////// first question ///////////////////////////////////////////////
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Text(
                                'Students dominant hand?',
                                style: BlackTitle.display5(context),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                cubit.onFirstChanged(0, 'left');
                              },
                              child: Card(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 5),
                                      child: Text(
                                        'left',
                                        style: TextStyle(
                                          color: Color(0xff3A3C3D),
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    Checkbox(
                                        value: cubit.isFirstQuestionChecked,
                                        onChanged: (x) =>
                                            cubit.onFirstChanged(0, 'left')),
                                  ],
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                cubit.onFirstChanged(1, 'right');
                              },
                              child: Card(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 5.0),
                                      child: Text(
                                        'right',
                                        style: TextStyle(
                                          color: Color(0xff3A3C3D),
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    Checkbox(
                                        value: cubit.isSecondQuestionChecked,
                                        onChanged: (v) =>
                                            cubit.onFirstChanged(1, 'right')),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),

/////////////////////////////////////////////////////// second question //////////////////////////////////////////////////
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Text(
                                'Students native languages?',
                                style: BlackTitle.display5(context),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                cubit.onSecondChanged(0, 'english');
                              },
                              child: Card(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Text(
                                        'english',
                                        style: TextStyle(
                                          color: Color(0xff3A3C3D),
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    Checkbox(
                                        value:
                                            cubit.isFirstSecondQuestionChecked,
                                        onChanged: (x) => cubit.onSecondChanged(
                                            0, 'english')),
                                  ],
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                cubit.onSecondChanged(1, 'hebrew');
                              },
                              child: Card(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Text('hebrew',
                                          style: TextStyle(
                                            color: Color(0xff3A3C3D),
                                            fontWeight: FontWeight.w500,
                                          )),
                                    ),
                                    Checkbox(
                                        value:
                                            cubit.isSecondSecondQuestionChecked,
                                        onChanged: (v) =>
                                            cubit.onSecondChanged(1, 'hebrew')),
                                  ],
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                cubit.onSecondChanged(2, 'arabic');
                              },
                              child: Card(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Text('arabic',
                                          style: TextStyle(
                                            color: Color(0xff3A3C3D),
                                            fontWeight: FontWeight.w500,
                                          )),
                                    ),
                                    Checkbox(
                                        value:
                                            cubit.isThirdSecondQuestionChecked,
                                        onChanged: (v) =>
                                            cubit.onSecondChanged(2, 'arabic')),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),

/////////////////////////////////// third question /////////////////////////////////////////////////////////////////////

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Text(
                                'Students visions?',
                                style: BlackTitle.display5(context),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                cubit.onThirdChanged(0, 'normal');
                              },
                              child: Card(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Text('normal',
                                          style: TextStyle(
                                            color: Color(0xff3A3C3D),
                                            fontWeight: FontWeight.w500,
                                          )),
                                    ),
                                    Checkbox(
                                        value:
                                            cubit.isFirstThirdQuestionChecked,
                                        onChanged: (x) =>
                                            cubit.onThirdChanged(0, 'normal')),
                                  ],
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                cubit.onThirdChanged(1, 'not normal');
                              },
                              child: Card(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Text('not normal',
                                          style: TextStyle(
                                            color: Color(0xff3A3C3D),
                                            fontWeight: FontWeight.w500,
                                          )),
                                    ),
                                    Checkbox(
                                        value:
                                            cubit.isSecondThirdQuestionChecked,
                                        onChanged: (v) => cubit.onThirdChanged(
                                            1, 'notNormal')),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),

////////////////////////////////////////// fourth question /////////////////////////////////////////////////////////////////////////////

                        Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Text(
                                'Students hearing normal?',
                                style: BlackTitle.display5(context),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                cubit.onFourthChanged(0, 'yes');
                              },
                              child: Card(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Text(
                                        'yes',
                                        style: TextStyle(
                                          color: Color(0xff3A3C3D),
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    Checkbox(
                                        value:
                                            cubit.isFirstFourthQuestionChecked,
                                        onChanged: (x) =>
                                            cubit.onFourthChanged(0, 'yes')),
                                  ],
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                cubit.onFourthChanged(1, 'no');
                              },
                              child: Card(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Text(
                                        'no',
                                        style: TextStyle(
                                          color: Color(0xff3A3C3D),
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    Checkbox(
                                        value:
                                            cubit.isSecondFourthQuestionChecked,
                                        onChanged: (v) =>
                                            cubit.onFourthChanged(1, 'no')),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),

////////////////////////////////////////   question 5 ////////////////////////////////////////////////////////////////////

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Text(
                                  'Origins?',
                                  style: BlackTitle.display5(context),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                cubit.onFifthChanged(0, 'usa');
                              },
                              child: Card(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Text(
                                        'usa',
                                        style: TextStyle(
                                          color: Color(0xff3A3C3D),
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    Checkbox(
                                        value:
                                            cubit.isFirstFifthQuestionChecked,
                                        onChanged: (x) =>
                                            cubit.onFifthChanged(0, 'usa')),
                                  ],
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                cubit.onFifthChanged(1, 'israel');
                              },
                              child: Card(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Text(
                                        'israel',
                                        style: TextStyle(
                                          color: Color(0xff3A3C3D),
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    Checkbox(
                                        value:
                                            cubit.isSecondFifthQuestionChecked,
                                        onChanged: (v) =>
                                            cubit.onFifthChanged(1, 'israel')),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
///////////////////////////////////////// question 6 /////////////////////////////////////////////////////////////////////

                        Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Text(
                                'Students ADHD?',
                                style: BlackTitle.display5(context),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                cubit.onSixthChanged(0, 'yes');
                              },
                              child: Card(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Text(
                                        'yes',
                                        style: TextStyle(
                                          color: Color(0xff3A3C3D),
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    Checkbox(
                                        value:
                                            cubit.isFirstSixthQuestionChecked,
                                        onChanged: (x) =>
                                            cubit.onSixthChanged(0, 'yes')),
                                  ],
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                cubit.onSixthChanged(1, 'no');
                              },
                              child: Card(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Text(
                                        'no',
                                        style: TextStyle(
                                          color: Color(0xff3A3C3D),
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    Checkbox(
                                        value:
                                            cubit.isSecondSixthQuestionChecked,
                                        onChanged: (v) =>
                                            cubit.onSixthChanged(1, 'no')),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
//////////////////////////////////////////////   question seven //////////////////////////////////////////////////////////

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Text(
                                'Students musical background?',
                                style: BlackTitle.display5(context),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                cubit.onSeventhChanged(0, 'yes');
                              },
                              child: Card(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Text(
                                        'yes',
                                        style: TextStyle(
                                          color: Color(0xff3A3C3D),
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    Checkbox(
                                        value:
                                            cubit.isFirstSeventhQuestionChecked,
                                        onChanged: (x) =>
                                            cubit.onSeventhChanged(0, 'yes')),
                                  ],
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                cubit.onSeventhChanged(1, 'no');
                              },
                              child: Card(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Text(
                                        'no',
                                        style: TextStyle(
                                          color: Color(0xff3A3C3D),
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    Checkbox(
                                        value: cubit
                                            .isSecondSeventhQuestionChecked,
                                        onChanged: (v) =>
                                            cubit.onSeventhChanged(1, 'no')),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Text('9.Credits',
                              style: BlackTitle.display5(context)),
                        ),
                        Container(
                          margin: EdgeInsets.all(0.0),
                          height: getSize(context: context).height * 0.08,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: TextFormField(
                            controller: creditController,
                            maxLines: 1,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            keyboardType: TextInputType.number,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "credit  is required";
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: greyColor, width: 0.6),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8))),
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: greyColor, width: 1.0),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8.0))),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.red),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5.0),
                          child: Text('10.Etics approvment',
                              style: BlackTitle.display5(context)),
                        ),

                        Stack(
                          alignment: Alignment.center,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 5.0),
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isSigning =
                                        true; // Set the signing state to true when signing starts
                                  });
                                },
                                child: Signature(
                                  controller: signatureController,
                                  width: getSize(context: context).width * 0.9,
                                  height:
                                      getSize(context: context).height * 0.18,
                                  backgroundColor: greyColor.withOpacity(0.5),
                                ),
                              ),
                            ),
                            if (!signatureController.isNotEmpty)
                              Image(
                                width: 50,
                                height: 50,
                                image: AssetImage(
                                  "assets/images/signature.png",
                                ),
                              ),
                          ],
                        ),
                        Row(
                          children: [
                            CreateButton(
                              title: 'save',
                              width: 50,
                              topMargin: 5,
                              bottomMargin: 0,
                              onTap: () async {
                                exportedImage =
                                    await signatureController.toPngBytes();
                                // final String timestamp = DateTime.now()
                                //     .millisecondsSinceEpoch
                                //     .toString();
                                // final String filename =
                                //     'signature_$timestamp'; // Generate filename
                                // final File imageFile =
                                //     await saveImage(exportedImage!, filename);
                                setState(() {});
                              },
                            ),
                            // exportedImage != null
                            //     ? Container(
                            //         width: 400,
                            //         height: 400,
                            //         decoration: BoxDecoration(
                            //           color: Colors.red,
                            //         ),
                            //         child: Image.memory(exportedImage!),
                            //       )
                            //     : SizedBox(),
                            SizedBox(
                              width: 10,
                            ),
                            CreateButton(
                              width: 50,
                              title: 'clear',
                              topMargin: 5,
                              bottomMargin: 0,
                              onTap: () async {
                                signatureController.clear();
                                setState(() {});
                              },
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 5.0, top: 5.0),
                          child: Text('11.Research description',
                              style: BlackTitle.display5(context)),
                        ),
                        SingleChildScrollView(
                          child: ListView.builder(
                            itemCount: 1,
                            shrinkWrap: true,
                            itemBuilder: (context, index) => TextFormField(
                              controller: descriptionController,
                              maxLines: null,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Research discription is required";
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: greyColor, width: 0.6),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8))),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: greyColor, width: 1.0),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8.0))),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.red),
                                ),
                              ),
                            ),
                          ),
                        ),
                        ConditionalBuilder(
                          condition: state
                              is! CreateResearchLoadingState, //state is! RegisterLoading,
                          builder: (context) => Center(
                            child: CreateButton(
                                onTap: () async {
                                  if (formKey.currentState!.validate()) {
                                    if (exportedImage == null) {
                                      CreatToast().showToast(
                                        errorMessage:
                                            "You must signature the research",
                                        context: context,
                                        backgroundColor: Colors.red,
                                      );
                                    } else {
                                      // final String timestamp = DateTime.now()
                                      //     .millisecondsSinceEpoch
                                      //     .toString();
                                      // final String filename =
                                      //     'signature_$timestamp'; // Generate filename
                                      // final File imageFile = await saveImage(
                                      //     exportedImage!, filename);
                                      cubit.createResearch(
                                        credits: creditController.text,
                                        approvment: exportedImage!,
                                        researchQuestion:
                                            researchController.text,
                                      );
                                    }
                                  }
                                },
                                title: "Submit"),
                          ),
                          fallback: (BuildContext context) =>
                              const CreatLoading(),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Future<File> saveImage(Uint8List imageData, String filename) async {
    final Directory appDirectory = await getApplicationDocumentsDirectory();
    final String imagePath =
        '${appDirectory.path}/$filename.png'; // Adjust extension as per your requirement

    final File imageFile = File(imagePath);
    await imageFile.writeAsBytes(imageData);

    return imageFile;
  }

  // bool isAnsweredAllQuestions() {
  //   for (var answerMap in selectedAnswers) {
  //     if (answerMap.isEmpty) {
  //       return false;
  //     }
  //   }
  //   return true;
  // }

  // Widget buildQuestionCard(Question question, int index) {
  //   return Column(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //       Padding(
  //         padding: const EdgeInsets.symmetric(vertical: 5.0),
  //         child: Text(
  //           '${index + 1}. ${question.text}', // Adjusted index
  //           style: TextStyle(
  //             fontWeight: FontWeight.bold,
  //           ),
  //         ),
  //       ),
  //       Card(
  //         margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
  //         elevation: 1,
  //         child: CreateCheckBox(
  //           options: question.options,
  //           onChanged: (List<Map<String, String>> selectedOptions) {
  //             setState(() {
  //               selectedAnswers[index] = {
  //                 for (var option in selectedOptions)
  //                   for (var entry in option.entries)
  //                     entry.key: [entry.value] // Wrap the value in a list
  //               };
  //               print(selectedAnswers);
  //             });
  //           },
  //           keys: keys,
  //         ),
  //       ),
  //     ],
  //   );
  // }
}
