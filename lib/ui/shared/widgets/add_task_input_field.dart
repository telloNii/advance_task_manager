import 'package:advance_task_manager/ui/shared/test_styles.dart';
import 'package:flutter/material.dart';

class AddTaskInputField extends StatelessWidget {
  const AddTaskInputField({
    Key? key,
    required this.label,
    required this.hintText,
    this.controller,
    this.widget,
    this.width,
  }) : super(key: key);
  final String label;
  final String hintText;
  final TextEditingController? controller;
  final Widget? widget;
  final double? width;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: textFieldHeaderStyle,
        ),
        Container(
          height: 50, margin: const EdgeInsets.symmetric(vertical: 10),
          // width: 300,
          child: TextField(
            readOnly: widget == null ? false : true,
            style: const TextStyle(color: Colors.black),
            controller: controller,
            autocorrect: false,
            keyboardType: TextInputType.url,
            decoration: InputDecoration(
              hintStyle: inputTextStyle,
              hintText: hintText, suffixIcon: widget,
              // fillColor: Colors.grey.withOpacity(0.4),
              // filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Colors.black),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
