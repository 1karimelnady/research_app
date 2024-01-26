import 'package:flutter/material.dart';
import 'package:research_app/utilities/text_style.dart';

class PageScreen extends StatefulWidget {
  final String question;
  PageScreen({
    Key? key,
    required this.question,
  }) : super(key: key);

  @override
  State<PageScreen> createState() => _PageScreenState();
}

class _PageScreenState extends State<PageScreen> {
  List<String> answers = ['yes', 'No'];
  String answer = 'yes';
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          widget.question,
          style: BlackTitle.display5(context).copyWith(
            fontSize: 20,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 35,
                  child: RadioListTile(
                    contentPadding: EdgeInsets.zero,
                    visualDensity: const VisualDensity(
                        vertical: -4,
                        horizontal: -3), // Adjust the size of the radio button
                    value: answers[0],
                    groupValue: answer,
                    controlAffinity: ListTileControlAffinity.leading,
                    onChanged: (value) {
                      setState(() {
                        answer = value!;
                      });
                      print("Question answer : ${answer}");
                    },
                  ),
                ),
                Text(
                  "yes",
                  style: BlackTitle.display5(context)
                      .copyWith(color: const Color(0xff666666)),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 35,
                  child: RadioListTile(
                    contentPadding: EdgeInsets.zero,
                    visualDensity: VisualDensity(
                      vertical: -4,
                      horizontal: -3,
                    ),
                    value: answers[1],
                    groupValue: answer,
                    onChanged: (value) {
                      setState(() {
                        answer = value!;
                      });
                      print("Question answer : ${answer}");
                    },
                  ),
                ),
                Text(
                  "no",
                  style: BlackTitle.display5(context).copyWith(
                    color: const Color(0xff666666),
                  ),
                ),
              ],
            ),
          ],
        ),
        SizedBox(
          width: 20,
        ),
      ],
    );
  }
}
