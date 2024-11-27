import 'package:flutter/material.dart';
import 'package:notesapp/constants/text_style.dart';
import 'package:notesapp/widgets/other/CustomTextFormField.dart';
import 'package:notesapp/widgets/icon/SubmitedEdiNoteIcon.dart';
import 'package:notesapp/widgets/main/notes_app_bar_title.dart';

class EdiNoteViewBody extends StatelessWidget {
  const EdiNoteViewBody({super.key});
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
                  Navigator.pop(context);
                },
              ),
            ),
            CustomTextFormField(
              labelText: 'Title',
              onSaved: (value) {},
            ),
            const SizedBox(height: 12),
            CustomTextFormField(
              labelText: 'Content',
              maxLines: 6, // Increase the height by allowing multiple lines

              onSaved: (value) {},
            ),
          ],
        ),
      ),
    );
  }
}
