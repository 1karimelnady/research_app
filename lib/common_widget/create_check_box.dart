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
