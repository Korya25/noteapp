class AddNoteState {}

class AddNoteIntial extends AddNoteState {}

class AddNoteLoading extends AddNoteState {}

class AddNoteSuccess extends AddNoteState {}

class AddNotefailure extends AddNoteState {
  final String errMessage;

  AddNotefailure(this.errMessage);
}
