import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notesapp/cubits/add_note/add_note_cuibt.dart';
import 'package:notesapp/cubits/add_note/add_note_state.dart';
import 'package:notesapp/cubits/notes_cuibt.dart/notes_cuibt.dart';
import 'package:notesapp/widgets/main/add_note_form.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNoteCuibt(),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocConsumer<AddNoteCuibt, AddNoteState>(
          builder: (context, state) {
            return AbsorbPointer(
              absorbing: state is AddNoteLoading ? true : false,
              child: const AddNoteForm(),
            );
          },
          listener: (context, state) {
            if (state is AddNotefailure) {
              print("Failid ${state.errMessage}");
            }
            if (state is AddNoteSuccess) {
              BlocProvider.of<NoteCuibt>(context).fetchAllNotes();
              Navigator.pop(context);
            }
          },
        ),
      ),
    );
  }
}
