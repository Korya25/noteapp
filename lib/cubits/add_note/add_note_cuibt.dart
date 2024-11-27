import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:notesapp/constants/key_word.dart';
import 'package:notesapp/cubits/add_note/add_note_state.dart';
import 'package:notesapp/models/note_model.dart';

class AddNoteCuibt extends Cubit<AddNoteState> {
  AddNoteCuibt() : super(AddNoteIntial());
  addNote(NoteModel note) async {
    emit(AddNoteLoading());
    try {
      var notesBox = Hive.box<NoteModel>(kNotesBox);
      await notesBox.add(note);
      emit(AddNoteSuccess());
    } catch (e) {
      emit(AddNotefailure(e.toString()));
    }
  }
}
