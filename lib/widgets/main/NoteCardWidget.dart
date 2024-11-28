import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:notesapp/constants/text_style.dart';
import 'package:notesapp/cubits/notes_cuibt.dart/notes_cuibt.dart';
import 'package:notesapp/models/note_model.dart';
import 'package:notesapp/screens/edit_view.dart';

class NoteCard extends StatelessWidget {
  const NoteCard({
    super.key,
    required this.noteCardColor,
    required this.note,
  });
  final NoteModel note;
  final Color noteCardColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return EditNoteView(
              note: note,
            );
          },
        ));
      },
      child: Container(
        padding: const EdgeInsets.only(
          top: 20,
          bottom: 20,
          left: 13,
        ),
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 7),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: noteCardColor,
        ),
        child: Column(
          children: [
            ListTile(
              title: Text(note.title, style: AppTextStyles.noteTitle),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 7),
                child: Text(note.subtitle,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: AppTextStyles.noteDescription),
              ),
              trailing: IconButton(
                icon: const Icon(
                  FontAwesomeIcons.trash,
                  color: Colors.black,
                  size: 24,
                ),
                onPressed: () {
                  if (note.isInBox) {
                    note.delete();
                    BlocProvider.of<NoteCuibt>(context).fetchAllNotes();
                  } else {
                    print('The note is not in a box!');
                  }
                },
                /*onPressed: () {
                  note.delete();
                  BlocProvider.of<NoteCuibt>(context).fetchAllNotes();
                },*/
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    note.date,
                    style: AppTextStyles.noteDate,
                    textAlign: TextAlign.end,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
