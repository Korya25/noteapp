import 'package:flutter/material.dart';
import 'package:notesapp/constants/color.dart';
import 'package:notesapp/constants/text_style.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.onChanged,
    required this.labelText,
    this.maxLines = 1,
    this.validator, // Default to single-line text field
  });

  final ValueChanged<String> onChanged;
  final String labelText;
  final int maxLines;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: kPrimariyColor,
      validator: validator,
      onChanged: onChanged,
      maxLines: maxLines, // Allow multiple lines
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: AppTextStyles.CustomTextFieldBottonShate,
        border: buildboreder(),
        enabledBorder: buildboreder(),
        focusedBorder: buildboreder(kPrimariyColor),
      ),
    );
  }

  OutlineInputBorder buildboreder([color]) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(
        color: color ?? Colors.white,
      ),
    );
  }
}
