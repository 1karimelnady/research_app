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
  // String selectedAnswer = 'left';
  // List<String> selectedAnswersList = [];
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
                                vertical: -4,
                                horizontal:
                                    -3), // Adjust the size of the radio button
                            value: widget.answers[index],
                            groupValue: selectedAnswer,
                            controlAffinity: ListTileControlAffinity.leading,
                            onChanged: (value) {
                              setState(() {
                                selectedAnswer = value!;
                                selectedAnswersList.add(selectedAnswer);
                              });

                              print("Question answer : ${selectedAnswer}");
                              widget.onAnswerSelected(
                                  selectedAnswer, selectedAnswersList);
                            },
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedAnswer = widget.answers[index];
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
}

//return SingleChildScrollView(
// child: ListView(
// physics: NeverScrollableScrollPhysics(),
// shrinkWrap: true,
// children: [
// Padding(
// padding: const EdgeInsets.symmetric(vertical: 8.0),
// child: Text(
// widget.question,
// textAlign: TextAlign.center,
// style: BlackTitle.display5(context).copyWith(
// fontSize: 20,
// ),
// ),
// ),
// Container(
// child: ListView.builder(
// itemCount: widget.answers.length,
// physics: NeverScrollableScrollPhysics(),
// shrinkWrap: true,
// itemBuilder: (context, answerIndex) {
// return Padding(
// padding: const EdgeInsets.symmetric(horizontal: 16.0),
// child: Row(
// mainAxisAlignment: MainAxisAlignment.start,
// children: [
// Container(
// width: 50,
// child: RadioListTile(
// contentPadding: EdgeInsets.zero,
// activeColor: mainColor,
// visualDensity: const VisualDensity(
// vertical: -4,
// horizontal: -3,
// ),
// value: widget.answers[answerIndex],
// groupValue: widget.selectedAnswer,
// controlAffinity: ListTileControlAffinity.leading,
// onChanged: (value) {
// setState(() {
// selectedAnswer = value!;
// selectedAnswersList.add(selectedAnswer);
// });
//
// print("Question answer : ${widget.selectedAnswer}");
// widget.onAnswerSelected(
// widget.selectedAnswer!,
// selectedAnswersList,
// );
// },
// ),
// ),
// GestureDetector(
// onTap: () {
// setState(() {
// widget.selectedAnswer = widget.answers[answerIndex];
// });
// print(
// "selected Answer sssssssssssss: ${widget.selectedAnswer}");
// },
// child: Text(
// "${widget.answers[answerIndex]}",
// style: BlackTitle.display5(context).copyWith(
// color: const Color(0xff666666),
// ),
// ),
// ),
// ],
// ),
// );
// },
// ),
// ),
// SizedBox(
// width: 20,
// ),
// Column(mainAxisAlignment: MainAxisAlignment.start, children: [
// // for (String answer in widget.answers)
// Padding(
// padding: const EdgeInsets.symmetric(horizontal: 16.0),
// child: Row(
// mainAxisAlignment: MainAxisAlignment.start,
// children: [
// Container(
// width: 50,
// child: RadioListTile(
// contentPadding: EdgeInsets.zero,
// activeColor: mainColor,
// visualDensity: const VisualDensity(
// vertical: -4,
// horizontal: -3), // Adjust the size of the radio button
// value: widget.answers[0],
// groupValue: selectedAnswer,
// controlAffinity: ListTileControlAffinity.leading,
// onChanged: (value) {
// setState(() {
// selectedAnswer = value!;
// selectedAnswersList.add(selectedAnswer);
// });
//
// print("Question answer : ${selectedAnswer}");
// widget.onAnswerSelected(
// selectedAnswer, selectedAnswersList);
// },
// ),
// ),
// GestureDetector(
// onTap: () {
// setState(() {
// selectedAnswer = widget.answers[0];
// });
// print("selected answer : $selectedAnswer");
// },
// child: Text(
// "${widget.answers[0]}",
// style: BlackTitle.display5(context)
// .copyWith(color: const Color(0xff666666)),
// ),
// ),
// ],
// ),
// ),
// Padding(
// padding: const EdgeInsets.symmetric(horizontal: 16.0),
// child: Row(
// mainAxisAlignment: MainAxisAlignment.start,
// children: [
// Container(
// width: 50,
// child: RadioListTile(
// contentPadding: EdgeInsets.zero,
// activeColor: mainColor,
// visualDensity: const VisualDensity(
// vertical: -4,
// horizontal: -3), // Adjust the size of the radio button
// value: widget.answers[1],
// groupValue: selectedAnswer,
// controlAffinity: ListTileControlAffinity.leading,
// onChanged: (value) {
// setState(() {
// selectedAnswer = value!;
// selectedAnswersList.add(selectedAnswer);
// });
//
// print("Question answer : ${selectedAnswer}");
// widget.onAnswerSelected(
// selectedAnswer, selectedAnswersList);
// },
// ),
// ),
// GestureDetector(
// onTap: () {
// setState(() {
// selectedAnswer = widget.answers[1];
// });
// print("selected Answer : $selectedAnswer");
// },
// child: Text(
// "${widget.answers[1]}",
// style: BlackTitle.display5(context)
// .copyWith(color: const Color(0xff666666)),
// ),
// ),
// ],
// ),
// ),
// ])
