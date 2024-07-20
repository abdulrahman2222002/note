

abstract class AddNoteState{}
class AddNoteInitState extends AddNoteState{}
class AddNoteLoading extends AddNoteState{}
class AddNoteSuccess extends AddNoteState{}
class AddNoteFailure extends AddNoteState{
  final String? errorMessage;
  AddNoteFailure( this.errorMessage);
}
