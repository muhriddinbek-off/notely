import 'package:flutter/material.dart';
import '../resources/app_styles.dart';

// ignore: must_be_immutable
class AddNoteInput extends StatelessWidget {
  int maxlenth;
  String title;
  String hint;
  TextEditingController textEditingController;
  AddNoteInput({
    super.key,
    required this.hint,
    required this.title,
    required this.textEditingController,
    required this.maxlenth,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: AppStyle.getAddTitle()),
        const SizedBox(height: 10),
        TextField(
          controller: textEditingController,
          maxLines: maxlenth,
          decoration: InputDecoration(
            hintText: hint,
            fillColor: Colors.blue.shade50,
            filled: true,
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ],
    );
  }
}
