import 'package:flutter/material.dart';
import 'package:notesapp/constants/color.dart';
import 'package:notesapp/constants/text_style.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.labelText,
    this.onSaved,
    this.maxLines = 1,
  });

  final void Function(String?)? onSaved;
  final String labelText;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: kPrimariyColor,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return "Field cannot be empty";
        }
        return null;
      },
      onSaved: onSaved,
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
