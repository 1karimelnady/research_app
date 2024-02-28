import 'package:flutter/material.dart';
import 'package:research_app/app_manager/local_data.dart';
import 'package:research_app/utilities/text_style.dart';

class PageScreen extends StatefulWidget {
  final String question;
  List<String> answers = [];
  late String? selectedAnswer;
  final Function(String, List<String> answers) onAnswerSelected;
  PageScreen(
      {Key? key,
      required this.question,
      required this.answers,
      this.selectedAnswer,
      required this.onAnswerSelected})
      : super(key: key);

  @override
  State<PageScreen> createState() => _PageScreenState();
}

class _PageScreenState extends State<PageScreen> {
  late String selectedAnswer;
  List<String> selectedAnswersList = [];

  @override
  void initState() {
    selectedAnswer = widget.selectedAnswer ?? '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ListView(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                widget.question,
                textAlign: TextAlign.center,
                style: BlackTitle.display5(context).copyWith(
                  fontSize: 20,
                ),
              ),
            ),
            ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: widget.answers.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: 50,
                          child: RadioListTile(
                            contentPadding: EdgeInsets.zero,
                            activeColor: mainColor,
                            visualDensity: const VisualDensity(
                                vertical: -4, horizontal: -3),
                            value: widget.answers[index],
                            groupValue: selectedAnswer,
                            controlAffinity: ListTileControlAffinity.leading,
                            onChanged: (value) {
                              setState(() {
                                selectedAnswer = value!;
                                selectedAnswersList.add(selectedAnswer);
                              });

                              print("Question answer : ${selectedAnswer}");
                              if (widget.question == 'dominant hand ?' ||
                                  widget.question == 'Native Language ?') {
                                selectedAnswer = selectedAnswer.toLowerCase();
                              }
                              widget.onAnswerSelected(
                                  selectedAnswer, selectedAnswersList);
                            },
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedAnswer = widget.answers[index];
                              if (widget.question == 'dominant hand ?' ||
                                  widget.question == 'Native Language ?') {
                                selectedAnswer = selectedAnswer.toLowerCase();
                                selectedAnswersList.add(selectedAnswer);
                              }
                              widget.onAnswerSelected(
                                  selectedAnswer, selectedAnswersList);
                            });
                            print("selected answer : $selectedAnswer");
                          },
                          child: Text(
                            "${widget.answers[index]}",
                            style: BlackTitle.display5(context)
                                .copyWith(color: const Color(0xff666666)),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
          ]),
    );
  }

  String formatAnswer(String userType, String question, String? answer) {
    switch (question) {
      case 'dominant hand ?':
      case 'Native Language ?':
        return answer?.toLowerCase() ?? '';
      case 'Is the vision  normal?':
      case 'Is your hearing normal ?':
      case 'What is your origin':
        return answer?.toLowerCase() ?? '';
      case 'Do you suffer from ADHD?':
      case 'Do you have a musical background?':
        return answer == 'Yes' ? 'yes' : 'no';
      default:
        return answer ?? '';
    }
  }
}
