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

// class CreateCheckBox extends StatefulWidget {
//   final List<String> options;
//   final void Function(List<Map<String, String>>)
//       onChanged; // Update the parameter type
//
//   const CreateCheckBox({
//     Key? key,
//     required this.options,
//     required this.onChanged,
//   }) : super(key: key);
//
//   @override
//   _CreateCheckBoxState createState() => _CreateCheckBoxState();
// }
//
// class _CreateCheckBoxState extends State<CreateCheckBox> {
//   List<bool> isCheckedList = [];
//
//   @override
//   void initState() {
//     super.initState();
//     isCheckedList = List.generate(widget.options.length, (index) => false);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: List.generate(
//         widget.options.length,
//         (index) => Row(
//           children: [
//             Checkbox(
//               value: isCheckedList[index],
//               onChanged: (isChecked) {
//                 setState(() {
//                   isCheckedList[index] = isChecked!;
//                   updateSelectedOptions();
//                 });
//               },
//             ),
//             Text(
//               widget.options[index],
//               style: TextStyle(
//                 color: Color(0xff3A3C3D),
//                 fontWeight: FontWeight.w500,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   void updateSelectedOptions() {
//     List<Map<String, String>> selectedOptions = [];
//     for (int i = 0; i < isCheckedList.length; i++) {
//       if (isCheckedList[i]) {
//         // Construct the key-value pair in the desired format
//         String key = "${widget.options[i]}[$i]";
//         String value = widget.options[i];
//         selectedOptions.add({key: value});
//       }
//     }
//     widget.onChanged(selectedOptions);
//   }
//
//   // void updateSelectedOptions() {
//   //   List<String> selectedOptions = [];
//   //   for (int i = 0; i < isCheckedList.length; i++) {
//   //     if (isCheckedList[i]) {
//   //       selectedOptions.add(widget.options[i]);
//   //     }
//   //   }
//   //   widget.onChanged(selectedOptions);
//   // }
// }
import 'package:flutter/material.dart';

class CreateCheckBox extends StatefulWidget {
  final List<String> options;
  final List<String> keys;
  final void Function(List<Map<String, String>>) onChanged;

  const CreateCheckBox({
    Key? key,
    required this.options,
    required this.onChanged,
    required this.keys,
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
        (index) => CheckboxListTile(
          value: isCheckedList[index],
          onChanged: (isChecked) {
            setState(() {
              isCheckedList[index] = isChecked!;
              widget.onChanged(getSelectedOptions());
            });
          },
          title: Text(
            widget.options[index],
            style: TextStyle(
              color: Color(0xff3A3C3D),
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }

  List<Map<String, String>> getSelectedOptions() {
    List<Map<String, String>> selectedOptions = [];
    for (int i = 0; i < isCheckedList.length; i++) {
      if (isCheckedList[i]) {
        String key = widget.keys[i];
        String value = widget.options[i];
        selectedOptions.add({key: value});
      }
    }
    return selectedOptions;
  }
}

// class CreateCheckBox extends StatefulWidget {
//   final List<String> options;
//   final void Function(List<Map<String, String>>) onChanged;
//
//   const CreateCheckBox({
//     Key? key,
//     required this.options,
//     required this.onChanged,
//   }) : super(key: key);
//
//   @override
//   _CreateCheckBoxState createState() => _CreateCheckBoxState();
// }
//
// class _CreateCheckBoxState extends State<CreateCheckBox> {
//   List<bool> isCheckedList = [];
//
//   @override
//   void initState() {
//     super.initState();
//     isCheckedList = List.generate(widget.options.length, (index) => false);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: List.generate(
//         widget.options.length,
//         (index) => CheckboxListTile(
//           value: isCheckedList[index],
//           onChanged: (isChecked) {
//             setState(() {
//               isCheckedList[index] = isChecked!;
//             });
//             widget.onChanged(getSelectedOptions());
//           },
//           title: Text(
//             widget.options[index],
//             style: TextStyle(
//               color: Color(0xff3A3C3D),
//               fontWeight: FontWeight.w500,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   List<String> keys = [
//     'hand',
//     'language',
//     'vision',
//     'hearingNormal',
//     'origin',
//     'ADHD',
//     'musicalBackground'
//   ];
//
//   List<Map<String, String>> getSelectedOptions() {
//     List<Map<String, String>> selectedOptions = [];
//     for (int i = 0; i < isCheckedList.length; i++) {
//       if (isCheckedList[i]) {
//         // Create a map with the correct format for each answer type
//         Map<String, String> optionMap = {};
//         if (keys[i] == 'hand' ||
//             keys[i] == 'language' ||
//             keys[i] == 'vision' ||
//             keys[i] == 'hearingNormal' ||
//             keys[i] == 'origin' ||
//             keys[i] == 'ADHD' ||
//             keys[i] == 'musicalBackground') {
//           optionMap[keys[i]] = widget.options[i];
//         }
//         selectedOptions.add(optionMap);
//       }
//     }
//     return selectedOptions;
//   }
// }

// class _CreateCheckBoxState extends State<CreateCheckBox> {
//   List<bool> isCheckedList = [];
//
//   @override
//   void initState() {
//     super.initState();
//     isCheckedList = List.generate(widget.options.length, (index) => false);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: List.generate(
//         widget.options.length,
//         (index) => CheckboxListTile(
//           value: isCheckedList[index],
//           onChanged: (isChecked) {
//             setState(() {
//               isCheckedList[index] = isChecked!;
//               updateSelectedOptions(); // Pass the index of the current question
//             });
//           },
//           title: Text(
//             widget.options[index],
//             style: TextStyle(
//               color: Color(0xff3A3C3D),
//               fontWeight: FontWeight.w500,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   List<String> keys = [
//     'hand',
//     'language',
//     'vision',
//     'hearingNormal',
//     'origin',
//     'ADHD',
//     'musicalBackground'
//   ];
//   void updateSelectedOptions() {
//     List<Map<String, String>> selectedOptions = [];
//     for (int i = 0; i < isCheckedList.length; i++) {
//       String key = keys[i];
//       String value = widget.options[i];
//       if (isCheckedList[i]) {
//         selectedOptions.add(
//             {key: value}); // Modify here to add the key-value pair directly
//       }
//     }
//
//     print('Selected options: $selectedOptions'); // Debugging print statement
//     widget.onChanged(selectedOptions);
//   }

// void updateSelectedOptions() {
//   List<Map<String, String>> selectedOptions = [];
//   for (int i = 0; i < isCheckedList.length; i++) {
//     String key = keys[i];
//     String value = widget.options[i];
//     if (isCheckedList[i]) {
//       selectedOptions.add({'key': key, 'value': value});
//     } else {
//       selectedOptions.remove({'key': key, 'value': value});
//     }
//   }
//
//   print(
//       'sssssssssssss${selectedOptions}ssssssss'); // Debugging print statement
//   widget.onChanged(selectedOptions);
// }

// class CreateCheckBox extends StatefulWidget {
//   final List<String> options;
//   final void Function(List<Map<String, String>>) onChanged;
//
//   const CreateCheckBox({
//     Key? key,
//     required this.options,
//     required this.onChanged,
//   }) : super(key: key);
//
//   @override
//   _CreateCheckBoxState createState() => _CreateCheckBoxState();
// }
//
// class _CreateCheckBoxState extends State<CreateCheckBox> {
//   List<bool> isCheckedList = [];
//
//   @override
//   void initState() {
//     super.initState();
//     isCheckedList = List.generate(widget.options.length, (index) => false);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: List.generate(
//         widget.options.length,
//         (index) => CheckboxListTile(
//           value: isCheckedList[index],
//           onChanged: (isChecked) {
//             setState(() {
//               isCheckedList[index] = isChecked!;
//               updateSelectedOptions(); // Pass the index of the current question
//             });
//           },
//           title: Text(
//             widget.options[index],
//             style: TextStyle(
//               color: Color(0xff3A3C3D),
//               fontWeight: FontWeight.w500,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   List<String> keys = [
//     'hand',
//     'language',
//     'vision',
//     'hearingNormal',
//     'origin',
//     'ADHD',
//     'musicalBackground'
//   ];
//
//   void updateSelectedOptions() {
//     List<Map<String, String>> selectedOptions = [];
//
//     for (int i = 0; i < isCheckedList.length; i++) {
//       String key = keys[i];
//       String value = widget.options[i];
//       if (isCheckedList[i]) {
//         selectedOptions.add({'key': key, 'value': value});
//       } else {
//         selectedOptions
//             .removeWhere((element) => element.containsValue(widget.options[i]));
//       }
//     }
//
//     print(
//         'sssssssssssss${selectedOptions}ssssssss'); // Debugging print statement
//     widget.onChanged(selectedOptions);
//   }
//
// // void updateSelectedOptions() {
//   //   List<Map<String, String>> selectedOptions = [];
//   //   for (int i = 0; i < isCheckedList.length; i++) {
//   //     if (isCheckedList[i]) {
//   //       String key = keys[i];
//   //       String value = widget.options[i];
//   //       selectedOptions.add({'key': key, 'value': value});
//   //     }
//   //   }
//   //
//   //   print(
//   //       'Selected options vvvvvvvvvvvvvvvvvvvvvvvv: $selectedOptions'); // Debugging print statement
//   //   widget.onChanged(selectedOptions);
//   // }
//
// // void updateSelectedOptions() {
//   //   List<Map<String, String>> selectedOptions = [];
//   //   for (int i = 0; i < isCheckedList.length; i++) {
//   //     if (isCheckedList[i]) {
//   //       String key = keys[i]; // No need for index in the key
//   //       String value = widget.options[i];
//   //       selectedOptions.add({'key': key, 'value': value});
//   //     }
//   //   }
//   //
//   //   // Debugging print statement
//   //   print('Selected options: $selectedOptions');
//   //   widget.onChanged(selectedOptions);
//   // }
//
// // void updateSelectedOptions() {
//   //   List<Map<String, String>> selectedOptions = [];
//   //   for (int i = 0; i < isCheckedList.length; i++) {
//   //     if (isCheckedList[i]) {
//   //       String key = "${keys[i]}[$i]"; // Include index in the key
//   //       String value = widget.options[i];
//   //       selectedOptions.add({'key': key, 'value': value});
//   //     }
//   //   }
//   //
//   //   print(
//   //       'Selected optionssssssssss: $selectedOptions'); // Debugging print statement
//   //   widget.onChanged(selectedOptions);
//   // }
//
// // void updateSelectedOptions() {
//   //   List<Map<String, String>> selectedOptions = [];
//   //   for (int i = 0; i < isCheckedList.length; i++) {
//   //     if (isCheckedList[i]) {
//   //       String key = "${widget.options[i]}[$i]"; // Include key as an array
//   //       String value = widget.options[i];
//   //       selectedOptions.add({key: value});
//   //     }
//   //   }
//   //   widget.onChanged(selectedOptions);
//   // }
// }
