import 'dart:math';

import 'package:flutter/material.dart';
import 'package:notesapp/widgets/main/NoteCardWidget.dart';

class NotesViewBody extends StatelessWidget {
  const NotesViewBody({super.key});
// Generate a random color
  Color _generateRandomColor() {
    final Random random = Random();
    return Color.fromARGB(
      255,
      random.nextInt(256), // Red value
      random.nextInt(256), // Green value
      random.nextInt(256), // Blue value
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 50,
      itemBuilder: (BuildContext context, int index) {
        return NoteCard(
          title: 'Flutter tips',
          description: "Learn the best practices in Dart programming.",
          date: 'June 12, 2023',
          noteCardColor: _generateRandomColor(),
        );
      },
    );
  }
}
