// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../cubits/notes_cubit/notes_cubit.dart';
import '../../models/note_model.dart';
import '../constants/constants.dart';
import 'color_list.dart';
import 'custom_app_bar.dart';
import 'custom_text_form_field.dart';

class EditNoteViewBody extends StatelessWidget {
   EditNoteViewBody({super.key, required this.note,this.content,this.title});
  final NoteModel note;
  String? title,content;
  final formatedDate= DateFormat('dd-MM-yyyy ').add_jm().format(DateTime.now());
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomNotesViewAppBar(
          appBarTitle: 'Edit Notes',
          appBarIcon: Icons.check,
          onTap:(){
            note.title= title?? note.title;
            note.subTitle= content?? note.subTitle;
            note.date= formatedDate;
            note.save();
            Navigator.pop(context);
            BlocProvider.of<NotesCubit>(context).fetchAllNotes();
          },
        ),
        Padding(
          padding: const EdgeInsets.only(top: 40,right: 24,left: 24),
          child: SingleChildScrollView(
            child: Column(
              children: [
                BuildTextFeild(
                  onChanged: (value){
                    title=value;
                  },
                  hintText: note.title,
                ),
                const SizedBox(height: 15,),
                BuildTextFeild(
                  onChanged: (value){
                    content=value;
                  },
                  hintText:note.subTitle,
                  maxLines: 5,
                ),
                const SizedBox(height: 15,),
                 EditNoteColorsList(
                  note: note,
                ),
                const SizedBox(height: 80,),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class EditNoteColorsList extends StatefulWidget {
  const EditNoteColorsList({super.key, required this.note});

  final NoteModel note;

  @override
  State<EditNoteColorsList> createState() => _EditNoteColorsListState();
}

class _EditNoteColorsListState extends State<EditNoteColorsList> {
  int currentIndex=0;

  @override
  void initState() {
    currentIndex =kColors.indexOf(Color(widget.note.color));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 26 * 2,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: GestureDetector(
              onTap: () {
                widget.note.color=kColors[index].value;
                currentIndex = index;
                setState(() {});
              },
              child: ColorItem(
                color: kColors[index],
                selected: currentIndex == index,
              ),
            ),
          );
        },
        itemCount: kColors.length,
      ),
    );
  }
}

// padding: const EdgeInsets.only(top: 40,right: 24,left: 24),