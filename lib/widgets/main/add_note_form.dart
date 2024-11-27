import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notesapp/cubits/add_note/add_note_cuibt.dart';
import 'package:notesapp/cubits/add_note/add_note_state.dart';
import 'package:notesapp/models/note_model.dart';
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
  bool isloading = false;
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
            BlocBuilder<AddNoteCuibt, AddNoteState>(
              builder: (context, state) {
                return AddNoteButton(
                  isloading: state is AddNoteLoading ? true : false,
                  onTap: () {
                    // Handle add note action
                    if (formkey.currentState!.validate()) {
                      formkey.currentState!.save();

                      var notemodel = NoteModel(
                        title: title!,
                        subtitle: subtitle!,
                        date: DateTime.now().toString(),
                      );
                      BlocProvider.of<AddNoteCuibt>(context).addNote(notemodel);
                    } else {
                      setState(() {
                        autovalidateMode = AutovalidateMode.always;
                      });
                    }
                  },
                  title: 'Add Note',
                );
              },
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
