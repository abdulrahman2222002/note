import 'package:flutter/material.dart';
import 'package:note/views/widgets/custom_edit_note_view_body.dart';


import '../models/note_model.dart';
import 'constants/constants.dart';

class EditNoteView extends StatefulWidget {
  const EditNoteView({super.key, required this.note});
  final NoteModel note;

  @override
  State<EditNoteView> createState() => _EditNoteViewState();
}

class _EditNoteViewState extends State<EditNoteView> {
  String? title,content;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: deepGrayColor,
      body: Column(
        children: [
           EditNoteViewBody(
            note: widget.note,
             title: title,
             content: content,
          )
        ],
      ),
    );
  }
}



