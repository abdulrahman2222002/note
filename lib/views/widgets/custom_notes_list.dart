import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../cubits/notes_cubit/notes_cubit.dart';
import '../../cubits/notes_cubit/notes_state.dart';
import '../../models/note_model.dart';
import 'custom_notes_item.dart';
import 'no_notes_message.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesState>(
      builder: (context, state) {
        List<NoteModel> notes = BlocProvider.of<NotesCubit>(context).notes!;
        int notesLength = notes.length;
        return Padding(
          padding:
              const EdgeInsets.only(top: 10, right: 24, left: 24, bottom: 8),
          child: notesLength == 0
              ? const NoNotesMessage()
              : ListView.builder(
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: CustomNotesItem(
                        note: notes[index],
                      ),
                    );
                  },
                  itemCount: notes.length,
                ),
        );
      },
    );
  }
}


