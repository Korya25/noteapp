import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:notesapp/constants/text_style.dart';
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
            return const EditNoteView();
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
                onPressed: () {},
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

/*
import 'package:flutter/material.dart';
import 'package:notesapp/constants/text_style.dart';

class NoteCard extends StatelessWidget {
  const NoteCard({
    super.key,
    required this.title,
    required this.description,
    required this.date,
    required this.noteCardColor,
  });

  final String title;
  final String description;
  final String date;
  final Color noteCardColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: noteCardColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          // Title Row with Delete Icon
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: AppTextStyles.noteTitle),
              IconButton(
                icon: const Icon(
                  Icons.delete,
                  size: 25,
                ),
                onPressed: () {},
              ),
            ],
          ),

          // Description Text
          Text(description,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: AppTextStyles.noteDescription),

          // Date Text
          Text(date, style: AppTextStyles.noteDate),
        ],
      ),
    );
  }
}

*/