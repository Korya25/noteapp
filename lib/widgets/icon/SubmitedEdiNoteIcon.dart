import 'package:flutter/material.dart';

class SubmitedEdiNoteIcon extends StatelessWidget {
  const SubmitedEdiNoteIcon({super.key, required this.onpressed});
  final Function() onpressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onpressed,
      icon: const Icon(
        Icons.done,
        size: 30,
      ),
    );
  }
}
