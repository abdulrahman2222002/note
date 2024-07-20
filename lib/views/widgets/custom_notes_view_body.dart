import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../cubits/notes_cubit/notes_cubit.dart';
import 'custom_app_bar.dart';
import 'custom_notes_list.dart';

class CustomNotesViewBody extends StatefulWidget {
  const CustomNotesViewBody({Key? key}) : super(key: key);

  @override
  State<CustomNotesViewBody> createState() => _CustomNotesViewBodyState();
}

class _CustomNotesViewBodyState extends State<CustomNotesViewBody> {

@override
  void initState() {

  BlocProvider.of<NotesCubit>(context).fetchAllNotes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  const Column(
      children: [
        CustomNotesViewAppBar(
          appBarTitle: "Notes",
          appBarIcon: Icons.search,
        ),
        Expanded(child: NotesListView()),
      ],
    );
  }
}



