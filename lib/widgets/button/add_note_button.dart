import 'package:flutter/material.dart';
import 'package:notesapp/constants/color.dart';
import 'package:notesapp/constants/text_style.dart';

class AddNoteButton extends StatelessWidget {
  const AddNoteButton({
    super.key,
    required this.onTap,
    required this.title,
    required this.isloading,
  });

  final VoidCallback onTap;
  final String title;
  final bool isloading;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: kPrimariyColor,
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.symmetric(vertical: 12),
        alignment: Alignment.center,
        child: isloading
            ? const Center(child: CircularProgressIndicator())
            : Text(
                title,
                style: AppTextStyles.noteTitle,
              ),
      ),
    );
  }
}
