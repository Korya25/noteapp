import 'package:flutter/material.dart';
import 'package:notesapp/constants/color.dart';
import 'package:notesapp/widgets/AddNoteBottomSheet.dart';

class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showModalBottomSheet(
          context: context,
          builder: (context) => const AddNoteBottomSheet(),
        );
      },
      child: const Icon(
        Icons.add,
        color: kPrimariyColor,
        size: 30,
      ),
    );
  }
}
