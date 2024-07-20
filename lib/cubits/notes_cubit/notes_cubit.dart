import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';

import '../../models/note_model.dart';
import '../../views/constants/constants.dart';
import 'notes_state.dart';


class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitState());

  List<NoteModel>? notes ;
  fetchAllNotes() async {
    var notesBox = Hive.box<NoteModel>(kNoteBox);

    notes = notesBox.values.toList();
    emit(NotesSuccessState());
  }
}
