import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notesapp/constants/text_style.dart';
import 'package:notesapp/cubits/notes_cuibt.dart/notes_cuibt.dart';
import 'package:notesapp/models/note_model.dart';
import 'package:notesapp/widgets/other/CustomTextFormField.dart';
import 'package:notesapp/widgets/icon/SubmitedEdiNoteIcon.dart';
import 'package:notesapp/widgets/main/notes_app_bar_title.dart';

class EdiNoteViewBody extends StatefulWidget {
  const EdiNoteViewBody({super.key, required this.note});
  final NoteModel note;

  @override
  State<EdiNoteViewBody> createState() => _EdiNoteViewBodyState();
}

class _EdiNoteViewBodyState extends State<EdiNoteViewBody> {
  String? title, subtitle;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            NotesAppBarTitle(
              textTitle: "Edit Note",
              textTitleStyle: AppTextStyles.heading,
              icon: SubmitedEdiNoteIcon(
                onpressed: () {
                  widget.note.title = title ?? widget.note.title;
                  widget.note.subtitle = subtitle ?? widget.note.subtitle;
                  widget.note.save();
                  BlocProvider.of<NoteCuibt>(context).fetchAllNotes();
                  Navigator.pop(context);
                },
              ),
            ),
            CustomTextFormField(
              labelText: widget.note.title,
              onChanged: (value) {
                title = value;
              },
            ),
            const SizedBox(height: 12),
            CustomTextFormField(
              labelText: widget.note.subtitle,

              maxLines: 6, // Increase the height by allowing multiple lines

              onChanged: (value) {
                subtitle = value;
              },
            ),
          ],
        ),
      ),
    );
  }
}
