import 'package:flutter/material.dart';
import 'package:note/views/widgets/custom__add_notes_bottom_sheet.dart';
import 'package:note/views/widgets/custom_notes_view_body.dart';

import 'constants/constants.dart';


class NotesView extends StatefulWidget {
  const NotesView({Key? key}) : super(key: key);

  @override
  State<NotesView> createState() => _NotesViewState();
}

class _NotesViewState extends State<NotesView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 20),
        child: Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: kPrimaryColor.withOpacity(0.2), // Adjust the opacity as needed
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 2), // Change position of the shadow
              ),
            ],
          ),
          child: ClipOval(
            child: FloatingActionButton(
              backgroundColor: kPrimaryColor,
              onPressed: () {
                showModalBottomSheet(
                  isScrollControlled: true,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  context: context,
                  builder: (BuildContext context) {
                    return const AddNotesBottomSheet();
                  },
                );
              },
              child: const Icon(
                Icons.add,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),


      body: const CustomNotesViewBody(),
    );
  }
}
