import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notesapp/cubits/add_note/add_note_state.dart';

class AddNoteCuibt extends Cubit<AddNoteState> {
  AddNoteCuibt() : super(AddNoteIntial());

  addNote() {}
}
