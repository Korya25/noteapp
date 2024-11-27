import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:notesapp/constants/key_word.dart';
import 'package:notesapp/cubits/notes_cuibt.dart/notes_cuibt_state.dart';
import 'package:notesapp/models/note_model.dart';

class NoteCuibt extends Cubit<NoteState> {
  NoteCuibt() : super(NoteIntial());
  List<NoteModel>? notes;
  fetchAllNotes() async {
    var notesBox = Hive.box<NoteModel>(kNotesBox);
    notes = notesBox.values.toList();
  }
}
