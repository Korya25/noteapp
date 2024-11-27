import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notesapp/cubits/notes_cuibt.dart/notes_cuibt.dart';
import 'package:notesapp/cubits/notes_cuibt.dart/notes_cuibt_state.dart';
import 'package:notesapp/models/note_model.dart';
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
    return BlocBuilder<NoteCuibt, NoteState>(
      builder: (context, state) {
        List<NoteModel> notes = BlocProvider.of<NoteCuibt>(context).notes ?? [];

        return ListView.builder(
          itemCount: notes.length,
          itemBuilder: (BuildContext context, int index) {
            return NoteCard(
              noteCardColor: _generateRandomColor(),
              note: notes[index], // استخدام العنصر المناسب
            );
          },
        );
      },
    );
  }
}
