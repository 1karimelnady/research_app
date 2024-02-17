// import 'package:flutter/material.dart';
//
// import '../utilities/text_style.dart';
//
// class CreateCheckBox extends StatefulWidget {
//   final String title1;
//   final String title2;
//   final String title3;
//   final void Function(bool) onChanged;
//   final bool isShowThirdCheckbox;
//
//   const CreateCheckBox({
//     Key? key,
//     required this.title1,
//     required this.onChanged,
//     required this.title2,
//     required this.title3,
//     this.isShowThirdCheckbox = false,
//   }) : super(key: key);
//
//   @override
//   _CreateCheckBoxState createState() => _CreateCheckBoxState();
// }
//
// class _CreateCheckBoxState extends State<CreateCheckBox> {
//   bool firstValue = false;
//   bool secondValue = false;
//   bool? thirdValue;
//   void initState() {
//     super.initState();
//     // Initialize thirdValue only if the third checkbox is to be shown
//     if (widget.isShowThirdCheckbox) {
//       thirdValue = false;
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.zero,
//       child: Row(
//         children: [
//           Row(
//             children: [
//               Checkbox(
//                 value: firstValue,
//                 onChanged: (value) {
//                   setState(() {
//                     firstValue = value!;
//                     if (widget.isShowThirdCheckbox) {
//                       thirdValue = false; // Uncheck third checkbox
//                     }
//                   });
//                   widget.onChanged(value!);
//                 },
//               ),
//               Text(
//                 widget.title1,
//                 style: TextStyle(
//                   color: Color(0xff3A3C3D),
//                   fontWeight: FontWeight.w500,
//                 ),
//               ),
//             ],
//           ),
//           SizedBox(width: 8),
//           Row(
//             children: [
//               Checkbox(
//                 value: secondValue,
//                 onChanged: (value) {
//                   setState(() {
//                     secondValue = value!;
//                     if (widget.isShowThirdCheckbox) {
//                       thirdValue = false; // Uncheck third checkbox
//                     }
//                   });
//                   widget.onChanged(!value!);
//                 },
//               ),
//               Text(
//                 widget.title2,
//                 style: TextStyle(
//                   color: Color(0xff3A3C3D),
//                   fontWeight: FontWeight.w500,
//                 ),
//               ),
//             ],
//           ),
//           if (widget.isShowThirdCheckbox)
//             Row(
//               children: [
//                 Checkbox(
//                   value: thirdValue,
//                   onChanged: (value) {
//                     setState(() {
//                       thirdValue = value;
//                       firstValue = false; // Uncheck first checkbox
//                       secondValue = false; // Uncheck second checkbox
//                     });
//                     widget.onChanged(value!);
//                   },
//                 ),
//                 Text(
//                   widget.title3,
//                   style: TextStyle(
//                     color: Color(0xff3A3C3D),
//                     fontWeight: FontWeight.w500,
//                   ),
//                 ),
//               ],
//             ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class CreateCheckBox extends StatefulWidget {
  final List<String> options;
  final void Function(List<String>) onChanged;

  const CreateCheckBox({
    Key? key,
    required this.options,
    required this.onChanged,
  }) : super(key: key);

  @override
  _CreateCheckBoxState createState() => _CreateCheckBoxState();
}

class _CreateCheckBoxState extends State<CreateCheckBox> {
  List<bool> isCheckedList = [];

  @override
  void initState() {
    super.initState();
    isCheckedList = List.generate(widget.options.length, (index) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        widget.options.length,
        (index) => Row(
          children: [
            Checkbox(
              value: isCheckedList[index],
              onChanged: (isChecked) {
                setState(() {
                  isCheckedList[index] = isChecked!;
                  updateSelectedOptions();
                });
              },
            ),
            Text(
              widget.options[index],
              style: TextStyle(
                color: Color(0xff3A3C3D),
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void updateSelectedOptions() {
    List<String> selectedOptions = [];
    for (int i = 0; i < isCheckedList.length; i++) {
      if (isCheckedList[i]) {
        selectedOptions.add(widget.options[i]);
      }
    }
    widget.onChanged(selectedOptions);
  }
}
