import 'package:notesapp/models/note_model.dart';

class NoteState {}

class NoteIntial extends NoteState {}

class NoteLoading extends NoteState {}

class NoteSuccess extends NoteState {
  final List<NoteModel> notes;

  NoteSuccess(this.notes);
}

class Notefailure extends NoteState {
  final String errMessage;

  Notefailure(this.errMessage);
}
