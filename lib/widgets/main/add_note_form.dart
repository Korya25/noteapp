import 'package:flutter/material.dart';
import 'package:notesapp/widgets/button/add_note_button.dart';
import 'package:notesapp/widgets/other/CustomTextFormField.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({
    super.key,
  });

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  GlobalKey<FormState> formkey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  String? title, subtitle;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formkey,
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustomTextFormField(
              labelText: 'Title',
              onSaved: (value) {
                title = value;
              },
            ),
            const SizedBox(height: 12),
            CustomTextFormField(
              labelText: 'Content',
              maxLines: 6, // Increase the height by allowing multiple lines

              onSaved: (value) {
                subtitle = value;
              },
            ),
            const SizedBox(
              height: 30,
            ),
            AddNoteButton(
              onTap: () {
                // Handle add note action
                if (formkey.currentState!.validate()) {
                  formkey.currentState!.save();
                } else {
                  setState(() {
                    autovalidateMode = AutovalidateMode.always;
                  });
                }
              },
              title: 'Add Note',
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
