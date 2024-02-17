import 'dart:typed_data';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:research_app/common_widget/create_button.dart';
import 'package:research_app/common_widget/create_toast.dart';
import 'package:research_app/utilities/text_style.dart';
import 'package:signature/signature.dart';

import '../../app_manager/local_data.dart';
import '../../common_widget/create_check_box.dart';
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
  late List<List<String?>> selectedAnswers;
  List<bool> isAnswerSelected = List.generate(7, (index) => false);
  List<Question> questions = [
    Question('Students dominant hand?', ['Left', 'Right']),
    Question('Students native languages?', ['hebrew', 'english', 'arabic']),
    Question('Students visions', ['normal', 'not normal']),
    Question('Students hearing normal?', ['yes', 'no']),
    Question('Origins', ['israel', 'usa']),
    Question('Students ADHD', ['yes', 'no']),
    Question('Students musical background', ['yes', 'no']),
  ];
  late List<List<bool?>> checkboxValues;

  @override
  void initState() {
    super.initState();
    selectedAnswers = List.generate(
      questions.length,
      (index) => List.filled(questions[index].options.length, null),
    );

    checkboxValues = List.generate(
      questions.length,
      (index) => List.filled(questions[index].options.length, false),
    );
  }

  bool isSigning = false;
  @override
  Widget build(BuildContext context) {
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
                        maxLines: null,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Question research is required";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
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
                  ),
                  ListView.builder(
                    // padding: EdgeInsets.symmetric(horizontal: 10),
                    itemCount: questions.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return buildQuestionCard(questions[index], index);
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child:
                        Text('9.Credits', style: BlackTitle.display5(context)),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 0.0),
                    height: getSize(context: context).height * 0.06,
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
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: greyColor, width: 0.6),
                            borderRadius: BorderRadius.all(Radius.circular(8))),
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
                        padding: const EdgeInsets.symmetric(vertical: 5.0),
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
                            height: getSize(context: context).height * 0.18,
                            backgroundColor: greyColor.withOpacity(0.5),
                          ),
                        ),
                      ),
                      if (!signatureController.isNotEmpty)
                        Image(
                          width: 50,
                          height: 50,
                          image: AssetImage(
                            "images/signature.png",
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
                          setState(() {});
                        },
                      ),
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
                  ),
                  ConditionalBuilder(
                    condition: true, //state is! RegisterLoading,
                    builder: (context) => Center(
                      child: CreateButton(
                          onTap: () {
                            if (formKey.currentState!.validate()) {
                              if (!isAnsweredAllQuestions()) {
                                CreatToast().showToast(
                                  errorMessage: "You must answer all questions",
                                  context: context,
                                  backgroundColor: Colors.red,
                                );
                              } else if (exportedImage == null) {
                                CreatToast().showToast(
                                  errorMessage:
                                      "You must signature the research",
                                  context: context,
                                  backgroundColor: Colors.red,
                                );
                              } else {
                                // Proceed with form submission
                                print('kkkk');
                              }
                            }
                          },
                          title: "Submit"),
                    ),
                    fallback: (BuildContext context) => const CreatLoading(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  bool isAnsweredAllQuestions() {
    for (var answerList in selectedAnswers) {
      if (answerList.any((answer) => answer != null)) {
        // At least one answer is not null, meaning the question has been answered
        continue;
      } else {
        // Found a question that has not been answered
        return false;
      }
    }
    return true; // All questions have been answered
  }

  Widget buildQuestionCard(Question question, int index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0),
          child: Text(
            '${index + 2}. ${question.text}',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Card(
          margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          elevation: 1,
          child: CreateCheckBox(
            options: question.getOptions(), // Use getOptions method here
            onChanged: (selectedOptions) {
              setState(() {
                selectedAnswers[index] = selectedOptions;
                isAnswerSelected[index] = selectedOptions.isNotEmpty;
              });
              print(selectedAnswers[index]);
            },
          ),
        ),
      ],
    );
  }
}

class Question {
  final String text;
  final List<String> options;

  Question(this.text, this.options);

  List<String> getOptions() {
    return options;
  }
}
