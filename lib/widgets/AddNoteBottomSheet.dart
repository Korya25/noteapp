import 'package:flutter/material.dart';
import 'package:notesapp/widgets/CustomTextFormField.dart';
import 'package:notesapp/widgets/add_note_button.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({super.key});
  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formkey = GlobalKey();
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: formkey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CustomTextFormField(
                onChanged: (value) {
                  // Handle title input
                },
                labelText: 'Title',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Title cannot be empty";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12),
              CustomTextFormField(
                onChanged: (value) {
                  // Handle content input
                },
                labelText: 'Content',
                maxLines: 6, // Increase the height by allowing multiple lines
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Content cannot be empty";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 30,
              ),
              AddNoteButton(
                onTap: () {
                  // Handle add note action
                  if (formkey.currentState!.validate()) {
                    print('gooooooooooooooood');
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
      ),
    );
  }
}
